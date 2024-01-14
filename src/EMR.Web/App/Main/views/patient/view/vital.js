(function () {
    angular.module('app').controller('app.views.patientVital.vital', [
        '$scope', '$uibModal', 'VitalTrendService', 'PatientDataService', '$stateParams',
    function ($scope, $uibModal, vitalTrendService, patientdataService, $stateParams) {
        var vm = this;
        vitalTrendService.getVitalsTrend();
        patientdataService.getPatientData($stateParams.id)
        vm.vital = vitalTrendService.getCurrentData();

    }
    ]);
    angular.module('app').factory('VitalToolTipService', function () {
        return {
            vital: {
                pulse: 0,
                pulseChange: 0,
                weight: 0,
                weightChange: 0,
                bps: 0,
                bpsChange: 0,
                bpd: 0,
                bpdChange: 0,
                dateofservice: 0,
                displayAge: true,

            }
        };
    });
    angular.module('app').factory('VitalTrendService', ['abp.services.app.patientVital', function (patientVitalService) {
        var vitalTrends = [{}];
        var vitalBPDTrends = [{}];
        var vitalBPSTrends = [{}];
        var vitalPulseTrends = [{}];
        var vitalWeightTrends = [{}];
        var currentVitals = {
            bps: 0,
            bpd: 0,
            weight: 0,
            pulse: 0,
            height: 0,
            bmi: 0,
            oxygenSaturation: 0
        };
        var factory = {
            getVitalsTrend: function () {
                patientVitalService.getVitalTrend({
                    patientId: 1
                }).success(function (result) {
                    vitalTrends.length = 0;
                    vitalBPDTrends.length = 0;
                    vitalBPSTrends.length = 0;
                    vitalPulseTrends.length = 0;
                    vitalWeightTrends.length = 0;
                    if (result.length == 0) return;
                    for (var i = 0; i < result.length; i++) {
                        vitalTrends.push(result[i]);
                        var dateCreated = moment.utc(result[i].dateCreated).local().valueOf();
                        vitalBPDTrends.push([dateCreated, result[i].bpd]);
                        vitalBPSTrends.push([dateCreated, result[i].bps]);
                        vitalPulseTrends.push([dateCreated, result[i].pulse]);
                    }
                    currentVitals.bps = result[result.length - 1].bps;
                    currentVitals.bpd = result[result.length - 1].bpd;
                    currentVitals.weight = result[result.length - 1].weight;
                    currentVitals.pulse = result[result.length - 1].pulse
                    currentVitals.height = result[result.length - 1].height;
                    currentVitals.bmi = result[result.length - 1].bmi;
                    currentVitals.oxygenSaturation = result[result.length - 1].oxygenSaturation;
                });
            },
            getData: function () {
                return vitalTrends;
            },
            getPulseData: function () {
                return vitalPulseTrends;
            },
            getBPDData: function () {
                return vitalBPDTrends;
            },
            getBPSData: function () {
                return vitalBPSTrends;
            },
            getCurrentData: function () {
                return currentVitals;
            }
        }
        return factory;
    }]);
    angular.module('app').factory('VitalPlotService', ['VitalToolTipService', '$filter', 'VitalTrendService','FlotService',
        function (vitalToolTipService, $filter, vitalTrendService, flotService) {
            return {
                setCrossOver: function (flotItem, $tooltipEl) {
                    var pulseplot = $('#pulsetrend > div').data("plot");
                    pulseplot.setCrosshair({ x: flotItem.datapoint[0] });
                    var weightplot = $('#weighttrend > div').data("plot");
                    weightplot.setCrosshair({ x: flotItem.datapoint[0] });
                    var bpplot = $('#bptrend > div').data("plot");
                    bpplot.setCrosshair({ x: flotItem.datapoint[0] });

                    vitalToolTipService.vital.pulse = flotService.getYvalueFromX(flotItem.datapoint[0], pulseplot.getData()[0]);
                    vitalToolTipService.vital.bps = flotService.getYvalueFromX(flotItem.datapoint[0], bpplot.getData()[0]);
                    vitalToolTipService.vital.bpd = flotService.getYvalueFromX(flotItem.datapoint[0], bpplot.getData()[1]);
                    vitalToolTipService.vital.weight = flotService.getYvalueFromX(flotItem.datapoint[0], weightplot.getData()[0]);
                    vitalToolTipService.vital.dateofservice = flotItem.datapoint[0];
                    vitalToolTipService.vital.displayAge = $filter('pastdate')(vitalToolTipService.vital.dateofservice);

                    vitalToolTipService.vital.pulseChange = ((vitalToolTipService.vital.pulse - vitalTrendService.getCurrentData().pulse) * 100 / vitalTrendService.getCurrentData().pulse).toFixed(2) / 1;
                    vitalToolTipService.vital.weightChange = ((vitalToolTipService.vital.weight - vitalTrendService.getCurrentData().weight) * 100 / vitalTrendService.getCurrentData().weight).toFixed(2) / 1;
                    vitalToolTipService.vital.bpsChange = ((vitalToolTipService.vital.bps - vitalTrendService.getCurrentData().bps) * 100 / vitalTrendService.getCurrentData().bps).toFixed(2) / 1;
                    vitalToolTipService.vital.bpdChange = ((vitalToolTipService.vital.bpd - vitalTrendService.getCurrentData().bpd) * 100 / vitalTrendService.getCurrentData().bpd).toFixed(2) / 1;
                }
            };

        }]);

})();


