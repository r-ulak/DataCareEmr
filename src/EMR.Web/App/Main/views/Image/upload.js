angular.module("app")
.directive("fileread", [function () {
    return {
        scope: {
            fileread: "="
        },
        link: function (scope, element, attributes) {
            element.bind("change", function (changeEvent) {
                scope.$apply(function () {
                    scope.fileread = changeEvent.target.files[0];
                    if (scope.fileread.size > 5242880) {
                        alert("file size must be below 5MB");
                    }
                    if (!(/\.(jpg|jpeg|png|gif|bmp|pdf|dcm|dcm30)$/i).test(scope.fileread.name)) {
                        alert("File type not supported");
                    }
                });
            });
        }
    }
}]);
