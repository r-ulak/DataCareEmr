using System.Web.Optimization;

namespace EMR.Web
{
    public static class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.IgnoreList.Clear();

            //VENDOR RESOURCES

            //~/Bundles/App/vendor/css
            bundles.Add(
                new StyleBundle("~/Bundles/App/vendor/css")
                    .Include("~/Content/bootstrap.min.css", new CssRewriteUrlTransform())
                    .Include("~/Content/toastr.min.css", new CssRewriteUrlTransform())
                    .Include("~/Scripts/sweetalert/sweet-alert.css", new CssRewriteUrlTransform())
                    .Include("~/Content/daterangepicker.min.css", new CssRewriteUrlTransform())
                    .Include("~/Content/font-awesome.min.css", new CssRewriteUrlTransform())
                    .Include("~/Content/font-awesome.min.css", new CssRewriteUrlTransform())
                    .Include("~/Content/themes/jstree/default/style.min.css", new CssRewriteUrlTransform())
                    .Include("~/Content/loading-bar.min.css", new CssRewriteUrlTransform())
                    .Include("~/Content/ng-tags-input.min.css", new CssRewriteUrlTransform())
                    .Include("~/Content/ng-tags-input.bootstrap.min.css", new CssRewriteUrlTransform())
                );

            //~/Bundles/App/vendor/js
            bundles.Add(
                new ScriptBundle("~/Bundles/App/vendor/js")
                    .Include(
                        "~/Abp/Framework/scripts/utils/ie10fix.js",
                        "~/Scripts/json2.min.js",

                        "~/Scripts/modernizr-2.8.3.js",
                        
                        "~/Scripts/jquery-2.2.0.min.js",

                        "~/Scripts/bootstrap.min.js",
                        "~/Scripts/jquery.smartWizard.js",
                        "~/Scripts/jquery.inputmask.bundle.min.js",

                        "~/Scripts/moment-with-locales.min.js",
                        "~/Scripts/jquery.validate.min.js",
                        "~/Scripts/jquery.blockUI.js",
                        "~/Scripts/toastr.min.js",
                        "~/Scripts/sweetalert/sweet-alert.min.js",
                        "~/Scripts/others/spinjs/spin.js",
                        "~/Scripts/others/spinjs/jquery.spin.js",
                        "~/Scripts/daterangepicker.js",

                        "~/Scripts/angular.min.js",
                        "~/Scripts/angular-animate.min.js",
                        "~/Scripts/angular-sanitize.min.js",
                        "~/Scripts/angular-ui-router.min.js",
                        "~/Scripts/angular-ui/ui-bootstrap-tpls.min.js",
                        "~/Scripts/angular-ui/ui-utils.min.js",

                        "~/Abp/Framework/scripts/abp.js",
                        "~/Abp/Framework/scripts/libs/abp.jquery.js",
                        "~/Abp/Framework/scripts/libs/abp.toastr.js",
                        "~/Abp/Framework/scripts/libs/abp.blockUI.js",
                        "~/Abp/Framework/scripts/libs/abp.spin.js",
                        "~/Abp/Framework/scripts/libs/abp.sweet-alert.js",
                        "~/Abp/Framework/scripts/libs/angularjs/abp.ng.js",

                        "~/Scripts/validator.js",
                        //"~/Scripts/jquery.signalR-2.2.0.min.js",
                        
                        "~/Scripts/flot/jquery.flot.min.js",
                        "~/Scripts/flot/angular-flot.js",
                        "~/Scripts/flot/jquery.flot.resize.min.js",
                        "~/Scripts/flot/curvedLines.js",
                        "~/Scripts/flot/jquery.flot.time.js",
                        "~/Scripts/flot/jquery.flot.tooltip.min.js",
                        "~/Scripts/flot/jquery.flot.crosshair.min.js",

                        "~/Scripts/d3.v3.min.js",
                        "~/Scripts/angular-daterangepicker.min.js",
                        "~/Scripts/angulartics.min.js",
                        "~/Scripts/angulartics-appinsights.min.js",

                        "~/Scripts/jstree.min.js",
                        "~/Scripts/ngJsTree.min.js",
                        "~/Scripts/underscore-min.js",
                        "~/Scripts/loading-bar.min.js",
                        "~/Scripts/ng-tags-input.min.js",

                        "~/Scripts/azure-blob-upload.js",
                        "~/Scripts/ng-dicom/openjpeg.js",
                        "~/Scripts/ng-dicom/NgDicomViewer-mini.js",
                        "~/Scripts/smart-table.min.js",
                        "~/Scripts/oclazyload/ocLazyLoad.min.js"

                    )
                );

            //APPLICATION RESOURCES

            //~/Bundles/App/Main/css
            bundles.Add(
                new StyleBundle("~/Bundles/App/Main/css")
                    .IncludeDirectory("~/App/Main", "*.css", true)
                );
            //~/Bundles/App/Main/js
            bundles.Add(
                new ScriptBundle("~/Bundles/App/Main/js")
                    .IncludeDirectory("~/Common/Scripts", "*.js", true)
                    .IncludeDirectory("~/App/Main", "*.js", true)
                );

            //~/Bundles/App/Global/js
            bundles.Add(
                new ScriptBundle("~/Bundles/App/Global/js")
                    .IncludeDirectory("~/App/Global/Script", "*.js", true)
                );


        }
    }
}