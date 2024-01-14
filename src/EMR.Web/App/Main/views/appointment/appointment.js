(function () {
    angular.module("app")
        .factory("AppointmentService",
        ["abp.services.app.appointment", "StaticProperty",
            function (appointmentService, staticProperty) {
                var appointmentList = [];
                var todaysAppontmentList = [];
                var appointmentCodeList = [];
                var appointmentStatusCodeList = [];
                var eventList = [];
                var factory = {
                    getAppointment: function (providerIds, administrationSiteId, appointmentCodeId, viewDate) {
                        appointmentService.getAppointmentByMonth({
                            viewDate: viewDate
                        })
                            .success(function (result) {
                                for (var i = 0; i < result.length; i++) {
                                    appointmentList.push(result[i]);
                                }
                                factory.getAppointmentDataFiltered(providerIds, administrationSiteId, appointmentCodeId);
                            });
                    },
                    getAppointmentCode: function () {
                        appointmentService.getAppointmentCode()
                            .success(function (result) {
                                for (var i = 0; i < result.length; i++) {
                                    appointmentCodeList.push(result[i]);
                                }
                            });
                    }, getAppointmentStatusCode: function () {
                        appointmentService.getAppointmentStatusCode()
                            .success(function (result) {
                                for (var i = 0; i < result.length; i++) {
                                    appointmentStatusCodeList.push(result[i]);
                                }
                            });
                    },
                    createAppointment: function (appointment) {
                        return appointmentService.createAppointment(appointment);
                    },
                    updateAppointment: function (appointment) {
                        return appointmentService.updateAppointment(appointment);
                    },
                    getAppointmentByDate: function (input) {
                        appointmentService.getAppointmentByDate(input)
                            .success(function (result) {
                                for (var i = 0; i < result.length; i++) {
                                    todaysAppontmentList.push(result[i]);
                                }
                            });
                    },
                    getAppointmentByDateData: function (input) {
                        angular.copy([], todaysAppontmentList);
                        factory.getAppointmentByDate(input);
                        return todaysAppontmentList;
                    },
                    getAppointmentCodeData: function () {
                        if (appointmentCodeList.length === 0)
                            factory.getAppointmentCode();
                        return appointmentCodeList;
                    },
                    getAppointmentStatusCodeData: function () {
                        if (appointmentStatusCodeList.length === 0)
                            factory.getAppointmentStatusCode();
                        return appointmentStatusCodeList;
                    },
                    getEventData: function (providerIds, administrationSiteId, appointmentCodeId, viewDate) {
                        if (eventList.length === 0)
                            factory.getAppointment(providerIds, administrationSiteId, appointmentCodeId, viewDate);
                        return eventList;
                    },
                    getAppointmentDataFiltered: function (selectedProviderId, administrationSiteId, appointmentCodeId) {
                        var doctors = _.where(selectedProviderId, { roleName: 'Doctor' });
                        var filterdBySelectedProvider = _.filter(appointmentList,
                            function (event) {
                                var providerFilter = doctors.length === 0
                                    ? true
                                    : _.some(doctors,
                                        function (provider) {
                                            return event.providerId === provider.id && provider.calendarChecked === true;
                                        });
                                return (providerFilter &&
                                    (event.administrationSiteId === administrationSiteId ||
                                        administrationSiteId === 0) &&
                                    (event.appointmentCodeId === appointmentCodeId || appointmentCodeId === 0));
                            });

                        var list = _.map(filterdBySelectedProvider,
                            function (item) {
                                return {
                                    title: item.title + " ==> " + item.fullName,
                                    color: {
                                        primary: item.calendarColor,
                                        secondary: staticProperty.lightenColor(item.calendarColor, 40)
                                    },
                                    startsAt: moment.utc(item.startDate).local().toDate(),
                                    endsAt: moment.utc(item.endDate).local().toDate(),
                                    item: item
                                };
                            }
                        );
                        angular.copy([], eventList);
                        _.each(list,
                            function (item) {
                                eventList.push(item);
                            });
                    },
                    clearAppointmentData: function () {
                        angular.copy([], appointmentList);
                        angular.copy([], eventList);
                    },
                    clearAppointmentByDateData: function () {
                        angular.copy([], todaysAppontmentList);
                    }
                }
                return factory;
            }
        ]);

    angular.module('app').controller('app.views.appointment',
        ['$scope', "AppointmentService", "UserService", "TenantService", "$uibModal",
            function ($scope, appointmentService, userService, tenantService, $uibModal) {
                var vm = this;
                vm.administrationSiteIdFilter = 0;
                vm.appointmentCodeIdFilter = 0;

                vm.appointmentCodeData = appointmentService.getAppointmentCodeData();
                vm.administrationSiteData = tenantService.getAdministrationSiteData();
                vm.providerCodeData = userService.getAllUsersWithRoleData();
                vm.viewDate = moment();
                vm.events = appointmentService.getEventData(vm.providerCodeData,
                    vm.appointmentCodeIdFilter,
                    vm.appointmentCodeIdFilter,
                    vm.viewDate);
                vm.calendarView = "day";
                vm.cellIsOpen = true;
                vm.rangeSelected = function (startDate, endDate) {
                    vm.openAddAppointmentModal(startDate, endDate);
                };
                vm.providerFilterChanged = function () {
                    appointmentService.getAppointmentDataFiltered(vm.providerCodeData,
                          vm.administrationSiteIdFilter,
                          vm.appointmentCodeIdFilter);


                }
                vm.administrationSiteFilterChanged = function () {
                    appointmentService.getAppointmentDataFiltered(vm.providerCodeData,
                        vm.administrationSiteIdFilter,
                        vm.appointmentCodeIdFilter);
                }

                vm.appointmentCodeFilterChanged = function () {
                    appointmentService.getAppointmentDataFiltered(vm.providerCodeData,
                         vm.administrationSiteIdFilter,
                         vm.appointmentCodeIdFilter);
                }
                vm.timespanClicked = function (date, cell) {
                    if (vm.calendarView === 'month') {
                        if ((vm.cellIsOpen && moment(date).startOf('day').isSame(moment(vm.viewDate).startOf('day'))) ||
                            cell.events.length === 0 ||
                            !cell.inMonth) {
                            vm.cellIsOpen = false;
                        } else {
                            vm.cellIsOpen = true;
                            vm.viewDate = date;
                        }
                    } else if (vm.calendarView === 'year') {
                        if ((vm
                                .cellIsOpen &&
                                moment(date).startOf('month').isSame(moment(vm.viewDate).startOf('month'))) ||
                            cell.events.length === 0) {
                            vm.cellIsOpen = false;
                        } else {
                            vm.cellIsOpen = true;
                            vm.viewDate = date;
                            vm.openAddAppointmentModal(date);
                        }

                    }

                };

                vm.checkAll = function (checked) {
                    _.each(vm.providerCodeData,
                        function (provider) {
                            provider.calendarChecked = checked;
                        });
                }

                vm.resetFilter = function () {
                    vm.administrationSiteIdFilter = 0;
                    vm.appointmentCodeIdFilter = 0;
                    vm.administrationSiteFilterChanged();
                    vm.appointmentCodeFilterChanged();
                    vm.checkAll(true);
                }
                vm.resetFilter();
                vm.addModalOpen = false;
                vm.openAddAppointmentModal = function (startDate, endDate) {
                    vm.openModalAddTestResult(startDate, endDate, null, true);
                };
                vm.eventClicked = function (event) {
                    vm.openModalAddTestResult(event.startsAt, event.endsAt, event.item, false);
                };
                vm.openModalAddTestResult = function (startDate, endDate, item, isNew) {
                    if (vm.addModalOpen === true) return;
                    var modalInstance = $uibModal.open({
                        templateUrl: "/App/Main/views/appointment/addeditappointment.cshtml",
                        controller: "app.views.patient.addeditappointment as vm",
                        size: "md",
                        resolve: {
                            param: function () {
                                return {
                                    'providerCodeData': vm.providerCodeData,
                                    'administrationSiteIdFilter': vm.administrationSiteIdFilter,
                                    'appointmentCodeIdFilter': vm.appointmentCodeIdFilter,
                                    'startDate': moment(startDate, "ddd MMM DD YYYY HH:mm:ss"),
                                    'endDate': moment(endDate, "ddd MMM DD YYYY HH:mm:ss"),
                                    'item': item,
                                    'isNew': isNew
                                };
                            }
                        }
                    });
                    vm.addModalOpen = true;
                    modalInstance.result.then(function () {
                        vm.addModalOpen = false;
                    }, function () {
                        vm.addModalOpen = false;
                    });
                }
                vm.calendarMonthChanged = function () {
                    appointmentService.clearAppointmentData();
                    appointmentService.getEventData(vm.providerCodeData,
                        vm.appointmentCodeIdFilter,
                        vm.appointmentCodeIdFilter,
                        vm.viewDate);
                }
            }
        ]);

    angular.module("app").controller("app.views.patient.addeditappointment", [
       "$scope", "StaticProperty", "AppointmentService", "$stateParams",
       "$uibModalInstance", "UserService", "TenantService", "$uibModal",
       "uibButtonConfig", "param",
   function ($scope, staticProperty, appointmentService, $stateParams,
       $uibModalInstance, userService, tenantService, $uibModal,
        buttonConfig, param) {
       var vm = this;
       var locael = {
           format: 'YYYY-MM-DD hh:mm A'
       };
       buttonConfig.activeClass = "greybg";
       vm.startDateRangeOption = staticProperty.getDateRangeOption('', moment());
       vm.startDateRangeOption.startDate = param.startDate;
       vm.startDateRangeOption.locale = locael;
       vm.endDateRangeOption = staticProperty.getDateRangeOption('', moment());
       vm.endDateRangeOption.startDate = param.endDate;
       vm.endDateRangeOption.locale = locael;

       vm.validationError = [];
       function validateForm() {
           vm.validationError = [];
           if (vm.validationError.length > 0) return false;
           return true;
       }
       vm.appointmentCodeData = appointmentService.getAppointmentCodeData();
       vm.appointmentStatusCodeData = appointmentService.getAppointmentStatusCodeData();
       vm.administrationSiteData = tenantService.getAdministrationSiteData();
       vm.providerCodeData = userService.getAllUsersWithRoleData();
       vm.isNew = param.isNew;


       function initialize() {
           return {
               pid: "",
               providerId: "",
               appointmentCodeId: 1,
               appointmentStatusCodeId: 1,
               allDayEvent: "",
               startDate: param.startDate,
               endDate: param.endDate,
               title: "",
               administrationSiteId: "",
               fname: "",
               lname: "",
               mname: "",
               dOB: "",
               phoneCell: "",
               phoneHome: "",
               note: "",
               allowOverlap: false
           };
       }

       if (param.isNew) {
           vm.appointment = initialize();
       } else {
           vm.appointment = param.item;
       }
       vm.saveAppointment = function (option) {
           if (!validateForm()) return;
           abp.ui.setBusy();
           vm.appointment.startDate = moment(vm.appointment.startDate).utc();
           vm.appointment.endDate = moment(vm.appointment.endDate).utc();
           appointmentService.createAppointment(vm.appointment)
               .success(function () {
                   abp.notify.info(App.localize("SavedSuccessfully"));
                   if (option === "addmore") {
                       vm.appointment = initialize();
                   }
                   else {
                       $uibModalInstance.close();
                       appointmentService.clearAppointmentData();
                       appointmentService.getEventData(param.providerCodeData,
              param.administrationSiteIdFilter,
              param.appointmentCodeIdFilter, vm.appointment.startDate);
                   }
               }).finally(function () {
                   abp.ui.clearBusy();
               });
       }
       vm.updateAppointment = function () {
           if (!validateForm()) return;
           abp.ui.setBusy();
           vm.appointment.startDate = moment(vm.appointment.startDate).utc();
           vm.appointment.endDate = moment(vm.appointment.endDate).utc();
           appointmentService.updateAppointment(vm.appointment)
               .success(function () {
                   abp.notify.info(App.localize("SavedSuccessfully"));

                   $uibModalInstance.close();
                   appointmentService.clearAppointmentData();
                   appointmentService.getEventData(param.providerCodeData,
          param.administrationSiteIdFilter,
          param.appointmentCodeIdFilter, vm.appointment.startDate);
               }).finally(function () {
                   abp.ui.clearBusy();
               });
       }
       vm.close = function () {
           $uibModalInstance.dismiss();
       };
       vm.search = function () {
           var modalInstance = $uibModal.open({
               controller: "app.views.patientdata.selectSearch as vm",
               templateUrl: "/App/Main/views/appointment/search.cshtml",
               size: "md"
           }).result.then(function (result) {
               vm.appointment.pid = result.pid;
               vm.appointment.fname = result.fname;
               vm.appointment.lname = result.lname;
               vm.appointment.mname = result.mname;
           });
       }
   }
    ]);


})();
