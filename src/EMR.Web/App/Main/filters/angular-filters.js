(function () {

    angular.module("app")
    .filter("momentFormat", function () {
        return function (date, formatStr) {
            if (!date) {
                return "-";
            }
            return moment(date).format(formatStr);
        };
    })
    .filter("yesNo", function () {
        return function (input) {
            return input ? "yes" : "no";
        };
        })
    .filter("gender", function () {
        return function (input) {
            if (input === "F") {
                return "Female";
            } else if (input === "M") {
                return "Male";
            }
            else {
                return "Unknown";
            }
        };
        })
    .filter("fromNow", function () {
        return function (date) {
            return moment(date).fromNow();
        };
    })
    .filter("age", function () {
        return function (date) {
            var age = moment().diff(moment(date), "years") + " yr";
            if (age == 0) {
                age = moment().diff(moment(date), "months") + " Mo";
            }
            return age;
        };
    })
    .filter("utctolocal", function () {
        return function (date, formatStr) {
            return moment(date).isValid() ?
               moment.utc(date).local().format(formatStr) : "-";
        };
    })
    .filter("pastdate", function () {
        return function (date) {
            if (!moment(date).isValid()) return false;
            return moment().diff(moment(date)) > 0;

        };

    });
})();