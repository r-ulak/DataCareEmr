(function () {
    angular.module('app').controller('app.views.patientVital.bp', [
        '$scope', '$uibModal', 'VitalTrendService', 'FlotService', 'VitalPlotService',
    function ($scope, $uibModal, vitalTrendService, flotService, plotService) {
        var vm = this;
        vm.bp = [{
            data: vitalTrendService.getBPSData(),
            label: 'BPS',
            lines: { fillColor: "rgba(150, 202, 89, 0.12)" },
            points: { fillColor: "#fff" }
        },
        {
            data: vitalTrendService.getBPDData(),
            label: 'BPD',
            lines: { fillColor: "rgba(150, 202, 89, 0.12)" },
            points: { fillColor: "#fff" }
        },
        ];

        vm.bpoptions = {
            grid: flotService.globalOptions.grid,
            series: flotService.globalOptions.series,
            legend: flotService.globalOptions.legend,
            points: flotService.globalOptions.points,
            crosshair: flotService.globalOptions.crosshair,
            colors: flotService.globalOptions.colors,
            shadowSize: flotService.globalOptions.shadowSize,
            tooltip: flotService.globalOptions.tooltip, //activate tooltip
            tooltipOpts: {
                content: flotService.globalOptions.tooltipOpts.content,
                xDateFormat: flotService.globalOptions.tooltipOpts.xDateFormat,
                shifts: flotService.globalOptions.tooltipOpts.shifts,
                defaultTheme: flotService.globalOptions.tooltipOpts.defaultTheme,
                onHover: function (flotItem, $tooltipEl) {
                    plotService.setCrossOver(flotItem, $tooltipEl);
                }
            },
            yaxis: flotService.globalOptions.yaxis,
            xaxis: {
                mode: "time",
                minTickSize: flotService.globalOptions.tickSize,
                timeformat: flotService.globalOptions.tformat
            }
        };


    }
    ]);
})();


