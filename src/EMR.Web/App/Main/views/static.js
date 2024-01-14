(function () {
    angular.module("app").factory("StaticProperty",
        [function () {
            var factory = {
                getDateRangeOption: function (maxDate, minDate) {
                    return {
                        "showDropdowns": true,
                        calender_style: "picker_3",
                        "maxDate": maxDate,
                        "minDate": minDate,
                        "singleDatePicker": true, "timePicker": true
                    };
                },
                lightenColor: function (col, amt) {
                    if (_.isNull(col)) return;
                    var usePound = true;
                    if (col[0] == "#") {
                        col = col.slice(1);
                        usePound = true;
                    }
                    var num = parseInt(col, 16);
                    var r = (num >> 16) + amt;
                    if (r > 255) {
                        r = 255;
                    } else if (r < 0) {
                        r = 0;
                    }
                    var b = ((num >> 8) & 0x00FF) + amt;
                    if (b > 255) {
                        b = 255;
                    } else if (b < 0) {
                        b = 0;
                    }
                    var g = (num & 0x0000FF) + amt;
                    if (g > 255) {
                        g = 255;
                    } else if (g < 0) {
                        g = 0;
                    }
                    var result = (usePound ? "#" : "") + (g | (b << 8) | (r << 16)).toString(16);
                    return result;
                }
            }
            return factory;
        }]);
})();
