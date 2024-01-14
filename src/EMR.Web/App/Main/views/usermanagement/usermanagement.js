(function () {
    angular.module('app').factory('UserService',
        ['abp.services.app.userAccount', function (userService) {
            var userList = [];
            var userByRoleList = [];
            var userWithRoleList = [];
            var rolesByUserList = [];
            var factory = {
                getUserById: function (id) {
                    abp.ui.setBusy();
                    userService.getUserById(id).success(function (result) {
                        user.name = result.name;
                        user.surname = result.surname;
                        user.userName = result.userName;
                        user.emailAddress = result.emailAddress;
                        user.isEmailConfirmed = result.isEmailConfirmed;
                        user.isActive = result.isActive;
                        user.isDeleted = result.isDeleted;
                        user.creationTime = result.creationTime;
                    }).finally(function () {
                        abp.ui.clearBusy();
                    });
                },
                getUserByIdData: function (id) {
                    user = factory.clearUserByIdData();
                    factory.getUserById(id);
                    return user;
                },
                clearUserByIdData: function () {
                    return {
                        name: '',
                        surname: '',
                        userName: '',
                        emailAddress: '',
                        isEmailConfirmed: '',
                        isActive: '',
                        isDeleted: '',
                        creationTime: '',
                    };
                },
                getAllUsers: function () {
                    abp.ui.setBusy();
                    userService.getAllUsers({
                    }).success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            userList.push(result[i]);
                        }
                    }).finally(function () {
                        abp.ui.clearBusy();
                    });
                },
                getAllUsersData: function () {
                    if (userList.length == 0) {
                        factory.getAllUsers();
                    }
                    return userList;
                },
                createNewUser: function (data) {
                    abp.ui.setBusy();
                    userService.createUser(data).success(function (result) {
                        abp.notify.info(App.localize('SavedSuccessfully'));
                        factory.clearAllUsersData();
                        factory.getAllUsers();
                    }).finally(function () {
                        abp.ui.clearBusy();
                    });
                },
                clearAllUsersData: function () {
                    angular.copy([], userList);
                },
                getUsersByRoleId: function (roleId) {
                    abp.ui.setBusy();
                    userService.getUsersByRoleId({
                        FilteredRoleId: roleId
                    }).success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            userList.push(result[i]);
                        }
                    }).finally(function () {
                        abp.ui.clearBusy();
                    });
                },
                getUsersByRoleIdData: function (roleId) {
                    if (userList.length == 0) {
                        factory.getUsersByRoleId(roleId);
                    }
                    return userByRoleList;
                },
                getRoleByUserId: function (userId) {
                    userService.getRoleByUserId({
                        UserId: userId
                    }).success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            rolesByUserList.push(result[i]);
                        }
                    });
                },
                getRoleByUserIdData: function (userId) {
                    factory.clearRoleByUserIdData();
                    factory.getRoleByUserId(userId);
                    return rolesByUserList;
                },
                clearRoleByUserIdData: function () {
                    angular.copy([], rolesByUserList);
                },
                updateUser: function (data) {
                    abp.ui.setBusy();
                    userService.updateUser(data).success(function (result) {
                        abp.notify.info(App.localize('SavedSuccessfully'));
                        //TODO: just need to update the row that changed instead of getall
                        factory.clearAllUsersData();
                        factory.getAllUsers();
                    }).finally(function () {
                        abp.ui.clearBusy();
                    });
                },
                getAllUsersWithRole: function () {
                    userService.getAllUsersWithRole().success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            userWithRoleList.push(result[i]);
                        }
                    });
                },
                getAllUsersWithRoleData: function () {
                    if (userWithRoleList.length == 0) {
                        factory.getAllUsersWithRole();
                    }
                    return userWithRoleList;
                },
                clearAllUserWithRoleData: function () {
                    angular.copy([], userWithRoleList);
                },

            }
            var user = factory.clearUserByIdData();

            return factory;
        }]);

    angular.module('app').controller('app.views.usermanagement.users', [
        '$scope', 'UserService', '$uibModal', 'RoleService',
        function ($scope, userService, $uibModal, roleService) {
            var vm = this;
            vm.itemsByPage = 20;
            vm.searchQuery = '';
            vm.selectedRole = '';
            vm.usersData = userService.getAllUsersData();
            vm.allRoles = roleService.getAllRolesData();
            vm.rolesSelect = function () {
                userService.clearAllUsersData();
                if (vm.selectedRole) {
                    userService.getUsersByRoleIdData(vm.selectedRole.id);
                }
                else {
                    userService.getAllUsersData();
                }
            }
            vm.clearFilterRole = function () {
                vm.selectedRole = '';
                userService.clearAllUsersData();
                userService.getAllUsersData();
            }
            vm.openCreateUserModal = function () {
                var modalInstance = $uibModal.open({
                    templateUrl: '/App/Main/views/usermanagement/addedit/adduser.cshtml',
                    controller: 'app.views.usermanagement.adduser as vm',
                    size: 'xmd',
                    backdrop: 'static'
                });
            };
            vm.openEditUserModal = function (item) {
                var modalInstance = $uibModal.open({
                    templateUrl: '/App/Main/views/usermanagement/addedit/edituser.cshtml',
                    controller: 'app.views.usermanagement.updateuser as vm',
                    size: 'xmd',
                    backdrop: 'static',
                    resolve: {
                        param: function () {
                            return {
                                'id': item.id
                            };
                        }
                    }
                });
            };
            vm.unlock = function (user) {

            }
            vm.delete = function (user) {

            }
            vm.sendActivationEmail = function (user) {

            }
        }
    ]);
    angular.module('app').controller('app.views.usermanagement.adduser', [
           '$scope', 'UserService', '$uibModalInstance', 'RoleService',
       function ($scope, userService, $uibModalInstance, roleService) {
           var vm = this;
           function initialize() {
               return {
                   isActive: true
               };
           }

           vm.user = initialize();
           vm.roleselection = [];
           vm.roleData = roleService.getAllRolesData();
           $scope.$watch('vm.roleData', function (newValue, oldValue) {
               for (var i = 0; i < vm.roleData.length; i++) {
                   if (vm.roleData[i].isDefault == true) {
                       vm.roleselection.push(vm.roleData[i].id);
                   }
               }
           }, true);
           vm.toggleRoleSelection = function toggleSelection(roleId) {
               var idx = vm.roleselection.indexOf(roleId);
               // is currently selected
               if (idx > -1) {
                   vm.roleselection.splice(idx, 1);
               }
                   // is newly selected
               else {
                   vm.roleselection.push(roleId);
               }
           };
           vm.close = function () {
               $uibModalInstance.dismiss();
           };
           vm.save = function () {
               vm.user.roles = vm.roleselection;
               userService.createNewUser(vm.user);
               $uibModalInstance.dismiss();
           };
       }
    ]);
    angular.module('app').controller('app.views.usermanagement.updateuser', [
           '$scope', 'UserService', '$uibModalInstance', 'RoleService', 'param',
       function ($scope, userService, $uibModalInstance, roleService, param) {
           var vm = this;
           vm.user = userService.getUserByIdData(param.id);
           vm.roleselection = [];
           vm.roleUserData = userService.getRoleByUserIdData(param.id);
           vm.roleData = roleService.getAllRolesData();
           $scope.$watch('vm.roleUserData', function (newValue, oldValue) {
               for (var i = 0; i < vm.roleUserData.length; i++) {
                   vm.roleselection.push(vm.roleUserData[i].id);
               }
           }, true);
           vm.toggleRoleSelection = function toggleSelection(roleId) {
               var idx = vm.roleselection.indexOf(roleId);
               // is currently selected
               if (idx > -1) {
                   vm.roleselection.splice(idx, 1);
               }
                   // is newly selected
               else {
                   vm.roleselection.push(roleId);
               }
           };
           vm.close = function () {
               $uibModalInstance.dismiss();
           };
           vm.update = function () {
               userService.updateUser({
                   UserId: param.id,
                   Name: vm.user.name,
                   Surname: vm.user.surname,
                   Password: vm.user.password,
                   IsActive: vm.user.isActive,
                   Roles: vm.roleselection
               });
               $uibModalInstance.dismiss();
           };
       }
    ]);

})();
