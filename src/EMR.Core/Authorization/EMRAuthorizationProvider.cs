using Abp.Authorization;
using Abp.Localization;
using Abp.MultiTenancy;

namespace EMR.Authorization
{
    public class EMRAuthorizationProvider : AuthorizationProvider
    {
        public override void SetPermissions(IPermissionDefinitionContext context)
        {
            //Common permissions
            var pages = context.GetPermissionOrNull(PermissionNames.Pages) ??
                        context.CreatePermission(PermissionNames.Pages, L("Pages"));

            var users = pages.CreateChildPermission(PermissionNames.PagesUsers, L("Users"));
            var visitWorkFlow = pages.CreateChildPermission(PermissionNames.PagesVisitWorkFlow);
            var appointment = pages.CreateChildPermission(PermissionNames.PagesAppointment);
            var pateintview = pages.CreateChildPermission(PermissionNames.PagesPatientView);
            var diagnosis = pateintview.CreateChildPermission(PermissionNames.PagesPatientViewDiagnosis);

            diagnosis.CreateChildPermission(PermissionNames.PagesPatientViewDiagnosisRead);
            diagnosis.CreateChildPermission(PermissionNames.PagesPatientViewDiagnosisWrite);

            var administration = pateintview.CreateChildPermission(PermissionNames.PagesAdministration);

            administration.CreateChildPermission(PermissionNames.PagesAdministrationRead);
            administration.CreateChildPermission(PermissionNames.PagesAdministrationWrite);


            var vital = pateintview.CreateChildPermission(PermissionNames.PagesPatientViewVital);

            vital.CreateChildPermission(PermissionNames.PagesPatientViewVitalRead);
            vital.CreateChildPermission(PermissionNames.PagesPatientViewVitalWrite);

            var activeVisit = pateintview.CreateChildPermission(PermissionNames.PagesPatientViewActiveVisit);

            activeVisit.CreateChildPermission(PermissionNames.PagesPatientViewActiveVisitRead);
            activeVisit.CreateChildPermission(PermissionNames.PagesPatientViewActiveVisitWrite);


            var visit = pateintview.CreateChildPermission(PermissionNames.PagesPatientViewVisit);

            visit.CreateChildPermission(PermissionNames.PagesPatientViewVisitWrite);
            visit.CreateChildPermission(PermissionNames.PagesPatientViewVisitRead);


            var procedureOrder = pateintview.CreateChildPermission(PermissionNames.PagesPatientViewProcedureOrder);

            procedureOrder.CreateChildPermission(PermissionNames.PagesPatientViewProcedureOrderRead);
            procedureOrder.CreateChildPermission(PermissionNames.PagesPatientViewProcedureOrderWrite);


            var labOrderResult = pateintview.CreateChildPermission(PermissionNames.PagesPatientViewLabOrderResult);

            labOrderResult.CreateChildPermission(PermissionNames.PagesPatientViewLabOrderResultRead);
            labOrderResult.CreateChildPermission(PermissionNames.PagesPatientViewLabOrderResultWrite);
            labOrderResult.CreateChildPermission(PermissionNames.PagesPatientViewLabOrderResultSignOff);

            var radOrderResult = pateintview.CreateChildPermission(PermissionNames.PagesPatientViewRadOrderResult);

            radOrderResult.CreateChildPermission(PermissionNames.PagesPatientViewRadOrderResultRead);
            radOrderResult.CreateChildPermission(PermissionNames.PagesPatientViewRadOrderResultWrite);
            radOrderResult.CreateChildPermission(PermissionNames.PagesPatientViewRadOrderResultSignOff);

            var reviewOfSystemCode = visitWorkFlow.CreateChildPermission(PermissionNames.PagesVisitWorkFlowReviewOfSystemCode);

            reviewOfSystemCode.CreateChildPermission(PermissionNames.PagesVisitWorkFlowReviewOfSystemCodeRead);
            reviewOfSystemCode.CreateChildPermission(PermissionNames.PagesVisitWorkFlowReviewOfSystemCodeWrite);

            appointment.CreateChildPermission(PermissionNames.PagesAppointmentRead);
            appointment.CreateChildPermission(PermissionNames.PagesAppointmentWrite);
            

            //Host permissions
            var tenants = pages.CreateChildPermission(PermissionNames.PagesTenants, L("Tenants"), multiTenancySides: MultiTenancySides.Host);
            var hostonly = pages.CreateChildPermission(PermissionNames.PagesHostOnly, L("HostOnly"), multiTenancySides: MultiTenancySides.Host);
            var jobs = hostonly.CreateChildPermission(PermissionNames.PagesHostOnlyJobs, L("Jobs"), multiTenancySides: MultiTenancySides.Host);
            jobs.CreateChildPermission(PermissionNames.PagesHostOnlyJobsICD10PCSIndex, L("ICD10PCSIndex"), multiTenancySides: MultiTenancySides.Host);
            jobs.CreateChildPermission(PermissionNames.PagesHostOnlyJobsICD10CNIndex, L("ICD10CNIndex"), multiTenancySides: MultiTenancySides.Host);
            jobs.CreateChildPermission(PermissionNames.PagesHostOnlyJobsLoincIndex, L("LoincIndex"), multiTenancySides: MultiTenancySides.Host);

        }

        private static ILocalizableString L(string name)
        {
            return new LocalizableString(name, EMRConsts.LocalizationSourceName);
        }
    }
}
