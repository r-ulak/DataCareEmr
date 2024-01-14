using System.Collections.Generic;
using static EMR.Authorization.Roles.StaticRoleNames;

namespace EMR.Authorization
{


    public static class PermissionNames
    {
        public const string Pages = "Pages";
        public static DefaultRolePermissions PagesRoles = new DefaultRolePermissions(Pages, true, true, true, true, true, true);

        public const string PagesTenants = "Pages.Tenants";
        public static DefaultRolePermissions PagesTenantsRoles = new DefaultRolePermissions(PagesTenants, true, true, true, true, true, true);

        public const string PagesUsers = "Pages.Users";
        public static DefaultRolePermissions PagesUsersRoles = new DefaultRolePermissions(PagesUsers, true, true, true, true, true, true);

        public const string PagesHostOnly = "Pages.HostOnly";
        public static DefaultRolePermissions PagesHostOnlyRoles = new DefaultRolePermissions(PagesHostOnly);

        public const string PagesHostOnlyJobs = "Pages.HostOnly.Jobs";
        public static DefaultRolePermissions PagesHostOnlyJobsRoles = new DefaultRolePermissions(PagesHostOnlyJobs);

        public const string PagesHostOnlyJobsICD10PCSIndex = "Pages.HostOnly.Jobs.ICD10PCSIndex";
        public static DefaultRolePermissions PagesHostOnlyJobsICD10PCSIndexRoles = new DefaultRolePermissions(PagesHostOnlyJobsICD10PCSIndex);

        public const string PagesHostOnlyJobsICD10CNIndex = "Pages.HostOnly.Jobs.ICD10CNIndex";
        public static DefaultRolePermissions PagesHostOnlyJobsICD10CNIndexRoles = new DefaultRolePermissions(PagesHostOnlyJobsICD10CNIndex);

        public const string PagesHostOnlyJobsLoincIndex = "Pages.HostOnly.Jobs.LoincIndex";
        public static DefaultRolePermissions PagesHostOnlyJobsLoincIndexRoles = new DefaultRolePermissions(PagesHostOnlyJobsLoincIndex);

        public const string PagesPatientView = "Pages.PatientView";
        public static DefaultRolePermissions PagesPatientViewRoles = new DefaultRolePermissions(PagesPatientView, true, true, true, true, true, true);

        public const string PagesVisitWorkFlow = "Pages.VisitWorkFlow";
        public static DefaultRolePermissions PagesVisitWorkFlowRoles = new DefaultRolePermissions(PagesVisitWorkFlow, true, true, true, true, true, true);

        public const string PagesPatientViewDiagnosis = "Pages.PatientView.Diagnosis";
        public static DefaultRolePermissions PagesPatientViewDiagnosisRoles = new DefaultRolePermissions(PagesPatientViewDiagnosis, true, true, true);

        public const string PagesPatientViewDiagnosisRead = "Pages.PatientView.Diagnosis.Read";
        public static DefaultRolePermissions PagesPatientViewDiagnosisReadRoles = new DefaultRolePermissions(PagesPatientViewDiagnosisRead, true, true, true);

        public const string PagesPatientViewDiagnosisWrite = "Pages.PatientView.Diagnosis.Write";
        public static DefaultRolePermissions PagesPatientViewDiagnosisWriteRoles = new DefaultRolePermissions(PagesPatientViewDiagnosisWrite, true, true);

        public const string PagesPatientViewVital = "Pages.PatientView.Vital";
        public static DefaultRolePermissions PagesPatientViewVitalRoles = new DefaultRolePermissions(PagesPatientViewVital, true, true, true);

        public const string PagesPatientViewVitalRead = "Pages.PatientView.Vital.Read";
        public static DefaultRolePermissions PagesPatientViewVitalReadRoles = new DefaultRolePermissions(PagesPatientViewVitalRead, true, true, true);

        public const string PagesPatientViewVitalWrite = "Pages.PatientView.Vital.Write";
        public static DefaultRolePermissions PagesPatientViewVitalWriteRoles = new DefaultRolePermissions(PagesPatientViewVitalWrite, true, true, true);


        public const string PagesPatientViewVisit = "Pages.PatientView.Visit";
        public static DefaultRolePermissions PagesPatientViewVisitRoles = new DefaultRolePermissions(PagesPatientViewVisit, true, true, true);


        public const string PagesPatientViewVisitWrite = "Pages.PatientView.Visit.Write";
        public static DefaultRolePermissions PagesPatientViewVisitWriteRoles = new DefaultRolePermissions(PagesPatientViewVisitWrite, true, true, true);

        public const string PagesPatientViewVisitRead = "Pages.PatientView.Visit.Read";
        public static DefaultRolePermissions PagesPatientViewVisitReadRoles = new DefaultRolePermissions(PagesPatientViewVisitRead, true, true, true);


        public const string PagesPatientViewActiveVisit = "Pages.PatientView.ActiveVisit";
        public static DefaultRolePermissions PagesPatientViewActiveVisitRoles = new DefaultRolePermissions(PagesPatientViewActiveVisit, true, true, true);


        public const string PagesPatientViewActiveVisitRead = "Pages.PatientView.ActiveVisit.Read";
        public static DefaultRolePermissions PagesPatientViewActiveVisitReadRoles = new DefaultRolePermissions(PagesPatientViewActiveVisitRead, true, true, true);

        public const string PagesPatientViewActiveVisitWrite = "Pages.PatientView.ActiveVisit.Write";
        public static DefaultRolePermissions PagesPatientViewActiveVisitWriteRoles = new DefaultRolePermissions(PagesPatientViewActiveVisitWrite, true, true, true);

        public const string PagesAdministration = "Pages.Administration";
        public static DefaultRolePermissions PagesAdministrationRoles = new DefaultRolePermissions(PagesAdministration);

        public const string PagesAdministrationRead = "Pages.Administration.Read";
        public static DefaultRolePermissions PagesAdministrationReadRoles = new DefaultRolePermissions(PagesAdministrationRead);

        public const string PagesAdministrationWrite = "Pages.Administration.Write";
        public static DefaultRolePermissions PagesAdministrationWriteRoles = new DefaultRolePermissions(PagesAdministrationWrite);



        public const string PagesPatientViewProcedureOrder = "Pages.PatientView.ProcedureOrder";
        public static DefaultRolePermissions PagesPatientViewProcedureOrderRoles = new DefaultRolePermissions(PagesPatientViewProcedureOrder, true, true, true);

        public const string PagesPatientViewProcedureOrderRead = "Pages.PatientView.ProcedureOrder.Read";
        public static DefaultRolePermissions PagesPatientViewProcedureOrderReadRoles = new DefaultRolePermissions(PagesPatientViewProcedureOrderRead, true, true, true);

        public const string PagesPatientViewProcedureOrderWrite = "Pages.PatientView.ProcedureOrder.Write";
        public static DefaultRolePermissions PagesPatientViewProcedureOrderWriteRoles = new DefaultRolePermissions(PagesPatientViewProcedureOrderWrite, true, true);

        public const string PagesPatientViewLabOrderResult = "Pages.PatientView.LabOrderResult";
        public static DefaultRolePermissions PagesPatientViewLabOrderResultRoles = new DefaultRolePermissions(PagesPatientViewLabOrderResult, true, true, true, labTechnician: true);

        public const string PagesPatientViewLabOrderResultRead = "Pages.PatientView.LabOrderResult.Read";
        public static DefaultRolePermissions PagesPatientViewLabOrderResultReadRoles = new DefaultRolePermissions(PagesPatientViewLabOrderResultRead, true, true, true, labTechnician: true);

        public const string PagesPatientViewLabOrderResultWrite = "Pages.PatientView.LabOrderResult.Write";
        public static DefaultRolePermissions PagesPatientViewLabOrderResultWriteRoles = new DefaultRolePermissions(PagesPatientViewLabOrderResultWrite, true, labTechnician: true);

        public const string PagesPatientViewLabOrderResultSignOff = "Pages.PatientView.LabOrderResult.SignOff";
        public static DefaultRolePermissions PagesPatientViewLabOrderResultSignOffRoles = new DefaultRolePermissions(PagesPatientViewLabOrderResultSignOff, true, labTechnician: true);



        public const string PagesPatientViewRadOrderResult = "Pages.PatientView.RadOrderResult";
        public static DefaultRolePermissions PagesPatientViewRadOrderResultRoles = new DefaultRolePermissions(PagesPatientViewRadOrderResult, true, true, true, radiologist: true);

        public const string PagesPatientViewRadOrderResultRead = "Pages.PatientView.RadOrderResult.Read";
        public static DefaultRolePermissions PagesPatientViewRadOrderResultReadRoles = new DefaultRolePermissions(PagesPatientViewRadOrderResultRead, true, true, true, radiologist: true);

        public const string PagesPatientViewRadOrderResultWrite = "Pages.PatientView.RadOrderResult.Write";
        public static DefaultRolePermissions PagesPatientViewRadOrderResultWriteRoles = new DefaultRolePermissions(PagesPatientViewRadOrderResultWrite, true, radiologist: true);

        public const string PagesPatientViewRadOrderResultSignOff = "Pages.PatientView.RadOrderResult.SignOff";
        public static DefaultRolePermissions PagesPatientViewRadOrderResultSignOffRoles = new DefaultRolePermissions(PagesPatientViewRadOrderResultSignOff, true, radiologist: true);

        public const string PagesVisitWorkFlowReviewOfSystemCode = "Pages.VisitWorkFlow.ReviewOfSystemCode";
        public static DefaultRolePermissions PagesVisitWorkFlowReviewOfSystemCodeRoles = new DefaultRolePermissions(PagesVisitWorkFlowReviewOfSystemCode, true, true, true);

        public const string PagesVisitWorkFlowReviewOfSystemCodeRead = "Pages.VisitWorkFlow.ReviewOfSystemCode.Read";
        public static DefaultRolePermissions PagesVisitWorkFlowReviewOfSystemCodeReadRoles = new DefaultRolePermissions(PagesVisitWorkFlowReviewOfSystemCodeRead, true, true, true);

        public const string PagesVisitWorkFlowReviewOfSystemCodeWrite = "Pages.VisitWorkFlow.ReviewOfSystemCode.Write";
        public static DefaultRolePermissions PagesVisitWorkFlowReviewOfSystemCodeWriteRoles = new DefaultRolePermissions(PagesVisitWorkFlowReviewOfSystemCodeWrite, true, true);

        public const string PagesAppointment = "Pages.Appointment";
        public static DefaultRolePermissions PagesAppointmentRoles = new DefaultRolePermissions(PagesAppointment, true, true, true, true, true, true);


        public const string PagesAppointmentRead = "Pages.Appointment.Read";
        public static DefaultRolePermissions PagesAppointmentReadRoles = new DefaultRolePermissions(PagesAppointmentRead, true, true, true, true);

        public const string PagesAppointmentWrite = "Pages.Appointment.Write";
        public static DefaultRolePermissions PagesAppointmentWriteRoles = new DefaultRolePermissions(PagesAppointmentWrite, true, reception: true);

        public static List<DefaultRolePermissions> DefaultRolePermissionList = new List<DefaultRolePermissions>()
        {
            PagesRoles,
            PagesTenantsRoles,
            PagesUsersRoles,
            PagesHostOnlyRoles,
            PagesHostOnlyJobsRoles,
            PagesHostOnlyJobsICD10PCSIndexRoles,
            PagesHostOnlyJobsICD10CNIndexRoles,
            PagesHostOnlyJobsLoincIndexRoles,
            PagesPatientViewRoles,
            PagesPatientViewDiagnosisRoles,
            PagesPatientViewDiagnosisReadRoles,
            PagesPatientViewDiagnosisWriteRoles,
            PagesPatientViewVitalRoles,
            PagesPatientViewVitalReadRoles,
            PagesPatientViewVitalWriteRoles,
            PagesAdministrationRoles,
            PagesAdministrationReadRoles,
            PagesAdministrationWriteRoles,
            PagesPatientViewProcedureOrderRoles,
            PagesPatientViewProcedureOrderReadRoles,
            PagesPatientViewProcedureOrderWriteRoles,
            PagesPatientViewLabOrderResultRoles,
            PagesPatientViewLabOrderResultReadRoles,
            PagesPatientViewLabOrderResultWriteRoles,
            PagesPatientViewLabOrderResultSignOffRoles,
            PagesPatientViewRadOrderResultWriteRoles,
            PagesPatientViewRadOrderResultReadRoles,
            PagesPatientViewRadOrderResultRoles,
            PagesPatientViewRadOrderResultSignOffRoles,
            PagesPatientViewVisitRoles,
            PagesPatientViewVisitWriteRoles,
            PagesPatientViewActiveVisitRoles,
            PagesPatientViewActiveVisitReadRoles,
            PagesPatientViewActiveVisitWriteRoles,
            PagesPatientViewVisitReadRoles,
            PagesVisitWorkFlowRoles,
            PagesVisitWorkFlowReviewOfSystemCodeRoles,
            PagesVisitWorkFlowReviewOfSystemCodeReadRoles,
            PagesVisitWorkFlowReviewOfSystemCodeWriteRoles,
            PagesAppointmentRoles,
            PagesAppointmentReadRoles,
            PagesAppointmentWriteRoles
        };
    }
}