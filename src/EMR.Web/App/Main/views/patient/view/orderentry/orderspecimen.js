
(function () {
    angular.module("app").factory("OrderSpecimenService",
        ["abp.services.app.orderSpecimen", function (orderSpecimenService) {
            var orderSpecimenList = [];
            var factory = {
                getOrderSpecimenByOrderId: function (order) {
                    if (order.id === 0) return;
                    abp.ui.setBusy();
                    orderSpecimenService
                       .getOrderSpecimenDetailByOrderId(order)
                   .success(function (result) {
                       for (var i = 0; i < result.length; i++) {
                           orderSpecimenList.push(result[i]);
                       }
                   }).finally(function () {
                       abp.ui.clearBusy();
                   });
                },
                getOrderSpecimenDataByOrderId: function (order) {
                    if (order) {
                        if (_.where(orderSpecimenList, { orderId: order.id }).length === 0)
                            factory.getOrderSpecimenByOrderId(order);
                    }
                    return orderSpecimenList;
                },
                clearOrderSpecimenData: function () {
                    angular.copy([], orderSpecimenList);
                },
                clearOrderSpecimenDataByorderId: function (orderId) {
                    var index = 0
                    while (index > -1) {
                        index = _.findIndex(orderSpecimenList, function (order) { return order.orderId == orderId });
                        if (index > -1) {
                            orderSpecimenList.splice(index, 1);
                        }
                    }
                },
                createOrderSpecimen: function (orderSpecimen) {
                    return orderSpecimenService.createOrderSpecimen(orderSpecimen);
                },
                updateOrderSpecimen: function (orderSpecimen) {
                    return orderSpecimenService.updateOrderSpecimen(orderSpecimen);
                }
            }
            return factory;
        }]);

    angular.module("app").controller("app.views.patient.orderSpecimen", [
        "$scope", "OrderSpecimenService", "$stateParams", "$uibModal",
        function ($scope, orderSpecimenService, $stateParams, $uibModal) {
            var vm = this;
            vm.open = false;
            vm.orderSpecimenData = orderSpecimenService.getOrderSpecimenDataByOrderId();
            vm.orderResultData = [];
            vm.orderId = 0;
            vm.viewSpecimen = function (order, expanded) {
                if (!expanded) return;
                vm.orderId = order.id;
                vm.orderSpecimenData = orderSpecimenService.getOrderSpecimenDataByOrderId({
                    id: order.id,
                    patientId: $stateParams.id
                });
            };
            vm.openModalEditSpecimen = function (specimen) {
                var modalInstance = $uibModal.open({
                    templateUrl: "/App/Main/views/patient/view/orderentry/addeditorderspecimen.cshtml",
                    controller: "app.views.paitent.updateorderSpecimen as vm",
                    size: "xmd",
                    resolve: {
                        param: function () {
                            return {
                                'specimen': specimen
                            };
                        }
                    }
                });
            };

        }
    ]);
    angular.module("app").controller("app.views.paitent.updateorderSpecimen", [
          "$scope", "OrderSpecimenService", "$stateParams", "$uibModalInstance",
          "uibButtonConfig",
          "UserService", "TenantService", "ProcedureOrderCodeService", "StatusCodeService",
          "param",
      function ($scope, orderSpecimenService, $stateParams,
          $uibModalInstance,
           buttonConfig, userService, tenantService,
           procedureOrderCodeService, statusCodeService, param) {
          var vm = this;
          buttonConfig.activeClass = "greybg";
          vm.datepickerOption = {
              "showDropdowns": true,
              calender_style: "picker_3",
              "maxDate": moment(),
              "singleDatePicker": true,
              "timePicker": true,
          };
          vm.administeredByIdCodeData = userService.getAllUsersWithRoleData();
          vm.administrationSiteData = tenantService.getAdministrationSiteData();
          vm.specimenCodeIdCodeData = procedureOrderCodeService.getSpecimenCodeData();
          vm.statusCodeData = statusCodeService.getStatusCodeData();
          vm.orderSpecimen = param.specimen;
          vm.orderSpecimen.isNew = false;
          vm.orderSpecimen.pid = $stateParams.id;
          vm.saveOrderSpecimen = function () {
              abp.ui.setBusy();
              vm.orderSpecimen.collectedDate = moment(vm.orderSpecimen.collectedDate).utc();
              orderSpecimenService.updateOrderSpecimen(vm.orderSpecimen)
                  .success(function () {
                      abp.notify.info(App.localize("SavedSuccessfully"));
                      $uibModalInstance.close();
                      orderSpecimenService.clearOrderSpecimenDataByorderId(vm.orderSpecimen.orderId);
                      orderSpecimenService.getOrderSpecimenDataByOrderId({
                          id: vm.orderSpecimen.orderId,
                          patientId: $stateParams.id
                      });
                  }).finally(function () {
                      abp.ui.clearBusy();
                  });
          }

          vm.close = function () {
              $uibModalInstance.dismiss();
          };
      }
    ]);
    angular.module("app").controller("app.views.paitent.addorderSpecimen", [
          "$scope", "OrderSpecimenService", "$stateParams", "$uibModalInstance",
          "uibButtonConfig",
          "UserService", "TenantService", "ProcedureOrderCodeService", "StatusCodeService",
          "param",
      function ($scope, orderSpecimenService, $stateParams,
          $uibModalInstance,
           buttonConfig, userService, tenantService,
           procedureOrderCodeService, statusCodeService, param) {
          var vm = this;
          buttonConfig.activeClass = "greybg";
          vm.datepickerOption = {
              "showDropdowns": true,
              calender_style: "picker_3",
              "maxDate": moment(),
              "minDate": param.orderDate,
              "singleDatePicker": true,
              "timePicker": true,
          };
          vm.validationError = [];
          function validateForm() {
              vm.validationError = [];
              if (vm.validationError.length > 0) return false;
              return true;
          }
          vm.administeredByIdCodeData = userService.getAllUsersWithRoleData();
          vm.administrationSiteData = tenantService.getAdministrationSiteData();
          vm.specimenCodeIdCodeData = procedureOrderCodeService.getSpecimenCodeData();
          vm.statusCodeData = statusCodeService.getStatusCodeData();

          function initialize() {
              return {
                  isNew: true,
                  orderId: param.orderId,
                  pid: $stateParams.id,
                  collectedById: abp.session.userId,
                  collectedDate: moment(),
                  specimenCodeId: 1,
                  note: "",
                  administrationSiteId: "",
                  orderDate: param.orderDate,
                  statusCodeId: 1,
                  specimenNumber: ""
              };
          }
          vm.orderSpecimen = initialize();
          vm.saveOrderSpecimen = function (option) {
              if (!validateForm()) return;
              abp.ui.setBusy();
              vm.orderSpecimen.collectedDate = moment(vm.orderSpecimen.collectedDate).utc();
              orderSpecimenService.createOrderSpecimen(vm.orderSpecimen)
                  .success(function () {
                      abp.notify.info(App.localize("SavedSuccessfully"));
                      if (option === "addmore") {
                          vm.orderSpecimen = initialize();
                      }
                      else {
                          $uibModalInstance.close();
                          orderSpecimenService.clearOrderSpecimenDataByorderId(param.orderId);
                          orderSpecimenService.getOrderSpecimenDataByOrderId({
                              id: param.orderId,
                              patientId: $stateParams.id
                          });
                      }
                  }).finally(function () {
                      abp.ui.clearBusy();
                  });
          }
          vm.close = function () {
              $uibModalInstance.dismiss();
          };
      }
    ]);

})();
