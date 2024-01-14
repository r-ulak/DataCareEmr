(function () {
    "use strict";

    var app = angular.module("app",
    [
        "oc.lazyLoad",
        "ngAnimate",
        "angulartics.azure.appinsights",
        "ngSanitize",
        "angular-loading-bar",
        "ui.router",
        "ui.bootstrap",
        "ui.jq",
        "angular-flot",
        "abp",
        "daterangepicker",
        "ngJsTree",
        "smart-table",
        "ngTagsInput",
        "azureBlobUpload",
        "ngdicomviewer"
    ]);


    app.config(["$ocLazyLoadProvider", function ($ocLazyLoadProvider) {
        $ocLazyLoadProvider.config({
            modules: [{
                name: "bootstrapcalendar",
                files: ["/Scripts/angular-bootstrap-calendar/angular-bootstrap-calendar-tpls.min.js"
                    , "/Content/angular-bootstrap-calendar.min.css"
                ]
            }]
        });

    }]);

    //Configuration for Angular UI routing.
    app.config([
        "$stateProvider", "$urlRouterProvider",
        function ($stateProvider, $urlRouterProvider) {
            $urlRouterProvider.otherwise("/");
            $stateProvider
                .state("home",
                {
                    url: "/",
                    templateUrl: "/App/Main/views/home/home.cshtml",
                    menu: "Home" //Matches to name of 'Home' menu in EMRNavigationProvider
                })
                .state("role",
                {
                    url: "/admin/role",
                    templateUrl: "/App/Main/views/rolemanagement/role.cshtml",
                    menu: "Role"
                })
                .state("users",
                {
                    url: "/admin/user",
                    templateUrl: "/App/Main/views/usermanagement/users.cshtml",
                    menu: "Users"
                })
                .state("auditlogs",
                {
                    url: "/admin/auditlogs",
                    templateUrl: "/App/Main/views/auditlogs/auditlogs.cshtml",
                    menu: "AuditLogs"
                })
                .state("patientregister",
                {
                    url: "/patient/register",
                    templateUrl: "/App/Main/views/patient/register/register.cshtml",
                    menu: "RegisterPatient"
                })
                .state("patientedit",
                {
                    url: "/patient/edit/:id",
                    templateUrl: "/App/Main/views/patient/register/edit/editProfile.cshtml",
                    menu: "EditPatient"
                })
                .state("patientview",
                {
                    url: "/patient/view/visit/:visitId/patient/:id",
                    templateUrl: "/App/Main/views/patient/view/index.cshtml",
                    menu: "ViewPatient"
                })
                .state("visithistory",
                {
                    url: "/patient/visithistory/:visitId/patient/:id",
                    templateUrl: "/App/Main/views/visit/workflow/visithistory/visithistory.cshtml",
                    menu: "ViewHistory"
                })
                .state("reviewofsystemcomprehensive",
                {
                    url: "/patient/reviewofsystemcomprehensive/:visitId/patient/:id",
                    templateUrl: "/App/Main/views/visit/workflow/physicalencounter/reviewofsystemcomprehensive.cshtml",
                    menu: "ReviewofSystem"
                })
                .state("reviewofsystemshort",
                {
                    url: "/patient/reviewofsystemshort/:visitId/patient/:id",
                    templateUrl: "/App/Main/views/visit/workflow/physicalencounter/reviewofsystemshort.cshtml",
                    menu: "ReviewofSystem"
                })
                .state("patientsearch",
                {
                    url: "/patient/search",
                    templateUrl: "/App/Main/views/home/home.cshtml",
                    menu: "SearchPatient"
                })
                .state("workflow",
                {
                    url: "/visitworkflow/visit/:visitId/patient/:id",
                    templateUrl: "/App/Main/views/visit/workflow/visitWorkflow.cshtml"
                })
                .state("appointment",
                {
                    url: "/appointment",
                    templateUrl: "/App/Main/views/appointment/index.cshtml",
                    menu: "Appointment",
                    resolve: {
                        loadMyCtrl: ["$ocLazyLoad", function ($ocLazyLoad) {
                            return $ocLazyLoad.load("bootstrapcalendar");
                        }]
                    }
                });
        }
    ]);

    //global directive used to initialize plugin
    app.directive("inputMask",
            function () {
                return {
                    link: function (scope, element, attrs) {
                        element.inputmask();
                    }
                };
            })
        .directive("formValidation",
            function () {
                return {
                    link: function (scope, element, attrs) {
                        element
                            .on("blur",
                                "input[required], input.optional, select.required, textarea",
                                validator.checkField)
                            .on("change", "select.required", validator.checkField)
                            .on("keypress", "input[required][pattern]", validator.keypress)
                            .submit(function (e) {
                                e.preventDefault();
                                var submit = true;

                                // evaluate the form using generic validaing
                                if (!validator.checkAll($(this))) {
                                    submit = false;
                                }

                                if (submit)
                                    this.submit();

                                return false;
                            });
                    }
                };
            })
        .directive("multiRequired",
            function () {
                return {
                    link: function (scope, element, attrs) {
                        element
                            .on("keyup blur",
                                "input",
                                function () {
                                    validator.checkField.apply($(this).siblings().last()[0]);
                                });
                    }
                };
            })
        .directive("sttablefilter",
            function () {
                return {
                    require: "stTable",
                    scope: {
                        sttablefilter: "="
                    },
                    link: function (scope, el, att, table) {
                        scope.$watch("sttablefilter",
                            function (val) {
                                table.search(val);
                            });
                    }
                }
            })
        .directive("validNumber",
            function () {
                return {
                    require: "?ngModel",
                    link: function (scope, element, attrs, ngModelCtrl) {
                        if (!ngModelCtrl) {
                            return;
                        }

                        ngModelCtrl.$parsers.push(function (val) {
                            if (angular.isUndefined(val)) {
                                var val = "";
                            }
                            var clean = val.replace(/[^0-9\.]/g, "");
                            var decimalCheck = clean.split(".");

                            if (!angular.isUndefined(decimalCheck[1])) {
                                decimalCheck[1] = decimalCheck[1].slice(0, 2);
                                clean = decimalCheck[0] + "." + decimalCheck[1];
                            }

                            if (val !== clean) {
                                ngModelCtrl.$setViewValue(clean);
                                ngModelCtrl.$render();
                            }
                            return clean;
                        });

                        element.bind("keypress",
                            function (event) {
                                if (event.keyCode === 32) {
                                    event.preventDefault();
                                }
                            });
                    }
                };
            })
        .directive("smartwizard",
            function () {
                return {
                    link: function (scope, element, attrs) {
                        element.smartWizard({
                            transitionEffect: "slide",
                            enableAllSteps: true, // Enable/Disable all steps on first load
                            enableFinishButton: false,
                            onFinish: scope.save,
                            onLeaveStep: scope.leaveAStepCallback
                        });
                        $(".buttonNext").addClass("btn btn-success");
                        $(".buttonPrevious").addClass("btn btn-primary");
                        $(".buttonFinish").addClass("btn btn-default");
                    }
                }
            });

    app.factory("FlotService",
        function () {
            var chartColours = ["#96CA59", "#3F97EB", "#72c380", "#6f7a8a", "#f7cb38", "#5a8022", "#2c7282"];
            var tickSize = [1, "day"];
            var tformat = "%d/%m/%y";
            return {
                globalOptions: {
                    tformat: tformat,
                    tickSize: tickSize,
                    grid: {
                        show: true,
                        aboveData: true,
                        color: "#3f3f3f",
                        labelMargin: 10,
                        axisMargin: 0,
                        borderWidth: 0,
                        borderColor: null,
                        minBorderMargin: 5,
                        clickable: true,
                        hoverable: true,
                        autoHighlight: true,
                        mouseActiveRadius: 100
                    },
                    series: {
                        lines: { show: true, lineWidth: 3 },
                        curvedLines: {
                            apply: true,
                            monotonicFit: true
                        }
                    },
                    crosshair: {
                        mode: "x"
                    },
                    legend: {
                        position: "ne",
                        margin: [0, -25],
                        noColumns: 0,
                        labelBoxBorderColor: null,
                        labelFormatter: function (label, series) {
                            // just add some space to labes
                            return label + "&nbsp;&nbsp;";
                        },
                        width: 40,
                        height: 1
                    },
                    points: { show: true },
                    colors: chartColours,
                    shadowSize: 0,
                    tooltip: true, //activate tooltip
                    tooltipOpts: {
                        content: "%x | %y.0",
                        xDateFormat: "%d/%m/%y",
                        shifts: {
                            x: -30,
                            y: -50
                        },
                        defaultTheme: false
                    },
                    yaxis: {
                        min: 0
                    },
                    xaxis: {
                        mode: "time",
                        minTickSize: tickSize,
                        timeformat: tformat
                    }
                },
                getYvalueFromX: function (posX, series) {
                    for (var j = 0; j < series.data.length; ++j) {
                        if (series.data[j][0] > posX) {
                            break;
                        }
                    }
                    var y,
                        p1 = series.data[j - 1], // point before your x
                        p2 = series.data[j]; // point after your x

                    if (p1 == null) {
                        y = p2[1]; // if no point before just get y-value
                    } else if (p2 == null) {
                        y = p1[1]; // if no point after just get y-value
                    } else {
                        y = p1[1] + (p2[1] - p1[1]) * (posX - p1[0]) / (p2[0] - p1[0]);
                        // here's the algebra bit, see below    
                    }
                    return y.toFixed(2);
                }

            };
        });
    app.factory("PatternService",
        function () {
            var decimalNumberOnly = "/^[0-9]+(\.[0-9]{1,2})?$/";
            var decimalStep = "0.01";
            return {
                globalOptions: {
                    decimalNumberPattern: decimalNumberOnly,
                    decimalStep: decimalStep
                }
            };
        });

    app.config([
        "cfpLoadingBarProvider", function (cfpLoadingBarProvider) {
            cfpLoadingBarProvider.includeSpinner = false;
        }
    ]);
})();