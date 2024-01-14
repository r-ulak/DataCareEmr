(function () {
    angular.module('app').factory('RoleService',
        ['abp.services.app.roles', function (roleService) {
            var roleList = [];
            var allPermissionsList = [];
            var permissionsTreeByRole = [];
            var permissionsByRole = [];
            var permissionsList = [];
            var role = {
                id: '',
                displayName: '',
                name: '',
                isDefault: '',
                isNew: false,
            }
            var factory = {
                getAllPermissions: function () {
                    roleService.getAllPermissions({
                    }).success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            allPermissionsList.push(result[i]);
                        }
                    });
                },
                getAllRoles: function () {
                    abp.ui.setBusy();
                    roleService.getAllRoles({
                    }).success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            roleList.push(result[i]);
                        }
                    }).finally(function () {
                        abp.ui.clearBusy();
                    });
                },
                getRolesByPermission: function (permmissonName) {
                    abp.ui.setBusy();
                    roleService.getRolesByPermission({
                        FilteredPermissionName: permmissonName
                    }).success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            roleList.push(result[i]);
                        }
                    }).finally(function () {
                        abp.ui.clearBusy();
                    });
                },
                getPermissionByRole: function (roleId) {
                    roleService.getPermissionByRole({
                        FilteredRoleId: roleId
                    }).success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            permissionsByRole.push(result[i]);
                        }
                    });
                },
                getPermissionTreeByRole: function (roleId) {
                    roleService.getPermissionTreeByRole({
                        FilteredRoleId: roleId
                    }).success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            permissionsTreeByRole.push(result[i]);
                        }
                    });
                },
                getRoleById: function (roleId) {
                    roleService.getRoleById({
                        FilteredRoleId: roleId
                    }).success(function (result) {
                        role.id = result.id;
                        role.displayName = result.displayName;
                        role.name = result.name;
                        role.isDefault = result.isDefault;
                    });
                },
                createRole: function (data) {
                    abp.ui.setBusy();
                    roleService.createRole(data).success(function (result) {
                        abp.notify.info(App.localize('SavedSuccessfully'));
                        factory.clearAllRolesData();
                        factory.getAllRoles();
                    }).finally(function () {
                        abp.ui.clearBusy();
                    });
                },
                upsertPermissionForRole: function (data) {
                    abp.ui.setBusy();
                    roleService.upsertPermissionForRole(data).success(function (result) {
                        abp.notify.info(App.localize('SavedSuccessfully'));
                        factory.clearAllRolesData();
                        factory.getAllRoles();
                    }).finally(function () {
                        abp.ui.clearBusy();
                    });
                },
                getAllRolesData: function () {
                    if (roleList.length == 0) {
                        factory.getAllRoles();
                    }
                    return roleList;
                },
                getRoleByIdData: function () {
                    return role;
                },
                getPermissionTreeByRoleData: function () {
                    return permissionsTreeByRole;
                },
                getAllPermissionsData: function () {
                    if (allPermissionsList.length == 0) {
                        factory.getAllPermissions();
                    }
                    return allPermissionsList;
                },
                getPermissionByRoleData: function () {
                    return permissionsByRole;
                },
                clearAllRolesData: function () {
                    angular.copy([], roleList);
                },
                clearAllPermissionsListData: function () {
                    angular.copy([], allPermissionsList);
                },
                clearPermissionTreeByRoleDataData: function () {
                    angular.copy([], permissionsTreeByRole);
                },
                clearPermissionByRoleData: function () {
                    angular.copy([], permissionsByRole);
                }
            }
            return factory;
        }]);

    angular.module('app').controller('app.views.rolemanagement.roles', [
        '$scope', 'RoleService', '$uibModal',
        function ($scope, roleService, $uibModal) {
            var vm = this;
            vm.itemsByPage = 20;
            vm.searchQuery = '';
            vm.selectedPermission = '';
            vm.allPermissions = roleService.getAllPermissionsData();
            vm.rolesData = roleService.getAllRolesData();
            vm.permissionsSelect = function () {
                roleService.clearAllRolesData();
                if (vm.selectedPermission) {
                    roleService.getRolesByPermission(vm.selectedPermission.name);
                }
                else {
                    roleService.getAllRolesData();
                }
            }
            vm.clearFilterPermission = function () {
                vm.selectedPermission = '';
                roleService.clearAllRolesData();
                roleService.getAllRolesData();
            }
            vm.openCreateRoleModal = function () {
                var modalInstance = $uibModal.open({
                    templateUrl: '/App/Main/views/rolemanagement/addedit/addeditrole.cshtml',
                    controller: 'app.views.rolemanagement.addrole as vm',
                    size: 'xmd',
                });
                vm.selectedPermission = '';
            };
            vm.openEditRoleModal = function (item) {
                var modalInstance = $uibModal.open({
                    templateUrl: '/App/Main/views/rolemanagement/addedit/addeditrole.cshtml',
                    controller: 'app.views.rolemanagement.updaterole as vm',
                    size: 'xmd',
                    resolve: {
                        param: function () {
                            return {
                                'id': item.id
                            };
                        }
                    }
                });
                vm.selectedPermission = '';
            };
        }
    ]);
    angular.module('app').controller('app.views.rolemanagement.addrole', [
           '$scope', 'RoleService', '$uibModalInstance',
       function ($scope, roleService, $uibModalInstance) {
           var vm = this;
           function initialize() {
               return {
                   displayName: '',
                   isDefault: false,
                   isNew: true
               };
           }
           roleService.clearPermissionTreeByRoleDataData(0);
           roleService.getPermissionTreeByRole(0);

           vm.role = initialize();
           vm.treeInstance = '';
           vm.filter = '';
           vm.treeConfig = {
               core: {
                   animation: true,
                   themes: {
                       name: "default",
                   },
               },
               plugins: ["checkbox"]
           };
           vm.treeData = roleService.getPermissionTreeByRoleData();
           vm.close = function () {
               $uibModalInstance.dismiss();
           };
           vm.save = function () {
               var selectedNode = vm.treeInstance.jstree(true).get_selected(true);
               var selectedPermissions = [];
               for (var i = 0; i < selectedNode.length; i++) {
                   selectedPermissions.push(
                       {
                           Id: selectedNode[i].id,
                           Name: selectedNode[i].data,
                           IsGranted: true
                       });
               }
               roleService.createRole({
                   Name: vm.role.displayName,
                   DisplayName: vm.role.displayName,
                   isDefault: vm.role.isDefault,
                   PermissionInput: selectedPermissions
               });
               $uibModalInstance.dismiss();

           };
       }
    ]);
    angular.module('app').controller('app.views.rolemanagement.updaterole', [
           '$scope', 'RoleService', '$uibModalInstance', 'param',
       function ($scope, roleService, $uibModalInstance, param) {
           var vm = this;
           vm.role = roleService.getRoleById(param.id);
           roleService.clearPermissionTreeByRoleDataData(param.id);
           roleService.getPermissionTreeByRole(param.id);

           vm.role = roleService.getRoleByIdData();
           vm.treeInstance = '';
           vm.filter = '';
           vm.treeConfig = {
               core: {
                   animation: true,
                   themes: {
                       name: "default",
                   },
               },
               plugins: ["checkbox"]
           };
           vm.treeData = roleService.getPermissionTreeByRoleData();
           vm.close = function () {
               $uibModalInstance.dismiss();
           };

           vm.update = function () {
               var allNode = vm.treeInstance.jstree(true).get_json('#', { 'flat': true });
               var allPermissions = [];
               for (var i = 0; i < allNode.length; i++) {
                   var name = '';
                   $.each(allNode[i].data, function (key, value) {
                       name += value;
                   });
                   allPermissions.push(
                       {
                           Id: allNode[i].id,
                           IsGranted: allNode[i].state.selected,
                           Name: name
                       });
               }
               roleService.upsertPermissionForRole({
                   RoleFilterInput: {
                       FilteredRoleId: vm.role.id,
                       RoleName: vm.role.displayName,
                       IsDefault: vm.role.isDefault

                   },
                   PermissionInput: allPermissions
               });
               $uibModalInstance.dismiss();
           };

       }
    ]);

})();
