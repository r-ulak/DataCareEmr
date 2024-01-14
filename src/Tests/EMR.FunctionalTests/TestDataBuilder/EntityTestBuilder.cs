using System;
using EMR.Entities;
using TestStack.Dossier;
using TestStack.Dossier.Factories;

namespace EMR.FunctionalTests.TestDataBuilder
{

    public class DocumentCategoryCodeBuilder : TestDataBuilder<Entities.DocumentCategoryCode, DocumentCategoryCodeBuilder>
    {

        public DocumentCategoryCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual DocumentCategoryCodeBuilder WithDocumentCategoryCodeId(Int32 documentCategoryCodeId)
        {
            return Set(x => x.DocumentCategoryCodeId, documentCategoryCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DocumentCategoryCodeBuilder WithDocumentCategoryCodeName(String documentCategoryCodeName)
        {
            return Set(x => x.DocumentCategoryCodeName, documentCategoryCodeName);
        }


        protected override Entities.DocumentCategoryCode BuildObject()
        {
            return Entities.DocumentCategoryCode.Create(

      Get(x => x.DocumentCategoryCodeName));
        }

    }

    public class DocumentOrderResultBuilder : TestDataBuilder<Entities.DocumentOrderResult, DocumentOrderResultBuilder>
    {

        public DocumentOrderResultBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual DocumentOrderResultBuilder WithDocumentId(Int64 documentId)
        {
            return Set(x => x.DocumentId, documentId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DocumentOrderResultBuilder WithOrderResultId(Int64 orderResultId)
        {
            return Set(x => x.OrderResultId, orderResultId);
        }


        protected override Entities.DocumentOrderResult BuildObject()
        {
            return Entities.DocumentOrderResult.Create(

      Get(x => x.OrderResultId));
        }

    }

    public class VisitBuilder : TestDataBuilder<Entities.Visit, VisitBuilder>
    {

        public VisitBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual VisitBuilder WithId(Int64 id)
        {
            return Set(x => x.Id, id);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual VisitBuilder WithPid(Int64 pid)
        {
            return Set(x => x.Pid, pid);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual VisitBuilder WithTenantId(Int32 tenantId)
        {
            return Set(x => x.TenantId, tenantId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual VisitBuilder WithVisitStatusCodeId(Int32 visitStatusCodeId)
        {
            return Set(x => x.VisitStatusCodeId, visitStatusCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual VisitBuilder WithVisitCodeId(Int32 visitCodeId)
        {
            return Set(x => x.VisitCodeId, visitCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual VisitBuilder WithAdministrationSiteId(Int32? administrationSiteId)
        {
            return Set(x => x.AdministrationSiteId, administrationSiteId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual VisitBuilder WithDoctorId(Int64 doctorId)
        {
            return Set(x => x.DoctorId, doctorId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual VisitBuilder WithNurseId(Int64 nurseId)
        {
            return Set(x => x.NurseId, nurseId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual VisitBuilder WithReason(String reason)
        {
            return Set(x => x.Reason, reason);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual VisitBuilder WithCreateDate(DateTime createDate)
        {
            return Set(x => x.CreateDate, createDate);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual VisitBuilder WithUpdateDate(DateTime updateDate)
        {
            return Set(x => x.UpdateDate, updateDate);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual VisitBuilder WithCreatedBy(Int64 createdBy)
        {
            return Set(x => x.CreatedBy, createdBy);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual VisitBuilder WithUpdatedBy(Int64 updatedBy)
        {
            return Set(x => x.UpdatedBy, updatedBy);
        }


        protected override Entities.Visit BuildObject()
        {
            return Entities.Visit.Create(

      Get(x => x.Pid),
      Get(x => x.TenantId),
      Get(x => x.VisitStatusCodeId),
      Get(x => x.VisitCodeId),
      Get(x => x.DoctorId),
      Get(x => x.NurseId),
      Get(x => x.CreateDate),
      Get(x => x.UpdateDate),
      Get(x => x.CreatedBy),
      Get(x => x.UpdatedBy),
      Get(x => x.AdministrationSiteId),
      Get(x => x.Reason));
        }

    }

    public class DocumentTypeCodeBuilder : TestDataBuilder<Entities.DocumentTypeCode, DocumentTypeCodeBuilder>
    {

        public DocumentTypeCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual DocumentTypeCodeBuilder WithDocumentTypeCodeId(Int32 documentTypeCodeId)
        {
            return Set(x => x.DocumentTypeCodeId, documentTypeCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DocumentTypeCodeBuilder WithDocumentTypeCodeName(String documentTypeCodeName)
        {
            return Set(x => x.DocumentTypeCodeName, documentTypeCodeName);
        }


        protected override Entities.DocumentTypeCode BuildObject()
        {
            return Entities.DocumentTypeCode.Create(

      Get(x => x.DocumentTypeCodeName));
        }

    }

    public class VisitCodeBuilder : TestDataBuilder<Entities.VisitCode, VisitCodeBuilder>
    {

        public VisitCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual VisitCodeBuilder WithVisitCodeId(Int32 visitCodeId)
        {
            return Set(x => x.VisitCodeId, visitCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual VisitCodeBuilder WithVisitCodeName(String visitCodeName)
        {
            return Set(x => x.VisitCodeName, visitCodeName);
        }


        protected override Entities.VisitCode BuildObject()
        {
            return Entities.VisitCode.Create(

      Get(x => x.VisitCodeName));
        }

    }

    public class PatientVitalBuilder : TestDataBuilder<Entities.PatientVital, PatientVitalBuilder>
    {

        public PatientVitalBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PatientVitalBuilder WithVitalId(Int64 vitalId)
        {
            return Set(x => x.VitalId, vitalId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientVitalBuilder WithVisitId(Int64 visitId)
        {
            return Set(x => x.VisitId, visitId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientVitalBuilder WithTenantId(Int32 tenantId)
        {
            return Set(x => x.TenantId, tenantId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientVitalBuilder WithCreateDate(DateTime createDate)
        {
            return Set(x => x.CreateDate, createDate);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientVitalBuilder WithCreatedBy(Int64 createdBy)
        {
            return Set(x => x.CreatedBy, createdBy);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientVitalBuilder WithPid(Int64 pid)
        {
            return Set(x => x.Pid, pid);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientVitalBuilder WithBps(Decimal? bps)
        {
            return Set(x => x.Bps, bps);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PatientVitalBuilder WithBpd(Decimal? bpd)
        {
            return Set(x => x.Bpd, bpd);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PatientVitalBuilder WithWeight(Decimal? weight)
        {
            return Set(x => x.Weight, weight);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PatientVitalBuilder WithHeight(Decimal? height)
        {
            return Set(x => x.Height, height);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PatientVitalBuilder WithTemperature(Decimal? temperature)
        {
            return Set(x => x.Temperature, temperature);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PatientVitalBuilder WithTempMethod(String tempMethod)
        {
            return Set(x => x.TempMethod, tempMethod);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientVitalBuilder WithPulse(Decimal? pulse)
        {
            return Set(x => x.Pulse, pulse);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PatientVitalBuilder WithRespiration(Decimal? respiration)
        {
            return Set(x => x.Respiration, respiration);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PatientVitalBuilder WithBMI(Decimal? bMI)
        {
            return Set(x => x.BMI, bMI);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PatientVitalBuilder WithBMIStatus(String bMIStatus)
        {
            return Set(x => x.BMIStatus, bMIStatus);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientVitalBuilder WithWaistCirc(Decimal? waistCirc)
        {
            return Set(x => x.WaistCirc, waistCirc);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PatientVitalBuilder WithHeadCirc(Decimal? headCirc)
        {
            return Set(x => x.HeadCirc, headCirc);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PatientVitalBuilder WithOxygenSaturation(Decimal? oxygenSaturation)
        {
            return Set(x => x.OxygenSaturation, oxygenSaturation);
        }



        protected override Entities.PatientVital BuildObject()
        {
            return Entities.PatientVital.Create(

      Get(x => x.VisitId),
      Get(x => x.TenantId),
      Get(x => x.CreateDate),
      Get(x => x.CreatedBy),
      Get(x => x.Pid),
      Get(x => x.Bps),
      Get(x => x.Bpd),
      Get(x => x.Weight),
      Get(x => x.Height),
      Get(x => x.Temperature),
      Get(x => x.TempMethod),
      Get(x => x.Pulse),
      Get(x => x.Respiration),
      Get(x => x.BMI),
      Get(x => x.BMIStatus),
      Get(x => x.WaistCirc),
      Get(x => x.HeadCirc),
      Get(x => x.OxygenSaturation));
        }

    }

    public class DoseUnitCodeBuilder : TestDataBuilder<Entities.DoseUnitCode, DoseUnitCodeBuilder>
    {

        public DoseUnitCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual DoseUnitCodeBuilder WithDoseUnitCodeId(Int32 doseUnitCodeId)
        {
            return Set(x => x.DoseUnitCodeId, doseUnitCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DoseUnitCodeBuilder WithDoseUnitCodeName(String doseUnitCodeName)
        {
            return Set(x => x.DoseUnitCodeName, doseUnitCodeName);
        }


        protected override Entities.DoseUnitCode BuildObject()
        {
            return Entities.DoseUnitCode.Create(

      Get(x => x.DoseUnitCodeName));
        }

    }

    public class VisitNoteBuilder : TestDataBuilder<Entities.VisitNote, VisitNoteBuilder>
    {

        public VisitNoteBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual VisitNoteBuilder WithId(Int64 id)
        {
            return Set(x => x.Id, id);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual VisitNoteBuilder WithPid(Int64 pid)
        {
            return Set(x => x.Pid, pid);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual VisitNoteBuilder WithTenantId(Int32 tenantId)
        {
            return Set(x => x.TenantId, tenantId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual VisitNoteBuilder WithVisitId(Int64 visitId)
        {
            return Set(x => x.VisitId, visitId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual VisitNoteBuilder WithNote(String note)
        {
            return Set(x => x.Note, note);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual VisitNoteBuilder WithCreateDate(DateTime createDate)
        {
            return Set(x => x.CreateDate, createDate);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual VisitNoteBuilder WithUpdateDate(DateTime updateDate)
        {
            return Set(x => x.UpdateDate, updateDate);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual VisitNoteBuilder WithCreatedBy(Int64 createdBy)
        {
            return Set(x => x.CreatedBy, createdBy);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual VisitNoteBuilder WithUpdatedBy(Int64 updatedBy)
        {
            return Set(x => x.UpdatedBy, updatedBy);
        }


        protected override Entities.VisitNote BuildObject()
        {
            return Entities.VisitNote.Create(

      Get(x => x.Pid),
      Get(x => x.TenantId),
      Get(x => x.VisitId),
      Get(x => x.CreateDate),
      Get(x => x.UpdateDate),
      Get(x => x.CreatedBy),
      Get(x => x.UpdatedBy),
      Get(x => x.Note));
        }

    }

    public class DrugCodeBuilder : TestDataBuilder<Entities.DrugCode, DrugCodeBuilder>
    {

        public DrugCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual DrugCodeBuilder WithId(Int32 id)
        {
            return Set(x => x.Id, id);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DrugCodeBuilder WithName(String name)
        {
            return Set(x => x.Name, name);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DrugCodeBuilder WithSideEffect(String sideEffect)
        {
            return Set(x => x.SideEffect, sideEffect);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DrugCodeBuilder WithDoseUnit(String doseUnit)
        {
            return Set(x => x.DoseUnit, doseUnit);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DrugCodeBuilder WithMinDoseSize(Single minDoseSize)
        {
            return Set(x => x.MinDoseSize, minDoseSize);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DrugCodeBuilder WithMaxDoseSize(Single maxDoseSize)
        {
            return Set(x => x.MaxDoseSize, maxDoseSize);
        }


        protected override Entities.DrugCode BuildObject()
        {
            return Entities.DrugCode.Create(

      Get(x => x.Id),
      Get(x => x.Name),
      Get(x => x.SideEffect),
      Get(x => x.DoseUnit),
      Get(x => x.MinDoseSize),
      Get(x => x.MaxDoseSize));
        }

    }

    public class VisitStatusCodeBuilder : TestDataBuilder<Entities.VisitStatusCode, VisitStatusCodeBuilder>
    {

        public VisitStatusCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual VisitStatusCodeBuilder WithVisitStatusCodeId(Int32 visitStatusCodeId)
        {
            return Set(x => x.VisitStatusCodeId, visitStatusCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual VisitStatusCodeBuilder WithVisitStatusCodeName(String visitStatusCodeName)
        {
            return Set(x => x.VisitStatusCodeName, visitStatusCodeName);
        }


        protected override Entities.VisitStatusCode BuildObject()
        {
            return Entities.VisitStatusCode.Create(

      Get(x => x.VisitStatusCodeName));
        }

    }

    public class DrugFormCodeBuilder : TestDataBuilder<Entities.DrugFormCode, DrugFormCodeBuilder>
    {

        public DrugFormCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual DrugFormCodeBuilder WithDrugFormCodeId(Int32 drugFormCodeId)
        {
            return Set(x => x.DrugFormCodeId, drugFormCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DrugFormCodeBuilder WithDrugFormCodeName(String drugFormCodeName)
        {
            return Set(x => x.DrugFormCodeName, drugFormCodeName);
        }


        protected override Entities.DrugFormCode BuildObject()
        {
            return Entities.DrugFormCode.Create(

      Get(x => x.DrugFormCodeName));
        }

    }

    public class WebJobBuilder : TestDataBuilder<Entities.WebJob, WebJobBuilder>
    {

        public WebJobBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual WebJobBuilder WithJobId(Int16 jobId)
        {
            return Set(x => x.JobId, jobId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual WebJobBuilder WithJobName(String jobName)
        {
            return Set(x => x.JobName, jobName);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual WebJobBuilder WithPermissions(String permissions)
        {
            return Set(x => x.Permissions, permissions);
        }


        protected override Entities.WebJob BuildObject()
        {
            return Entities.WebJob.Create(

      Get(x => x.JobId),
      Get(x => x.JobName),
      Get(x => x.Permissions));
        }

    }

    public class DrugRouteCodeBuilder : TestDataBuilder<Entities.DrugRouteCode, DrugRouteCodeBuilder>
    {

        public DrugRouteCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual DrugRouteCodeBuilder WithDrugRouteCodeId(Int32 drugRouteCodeId)
        {
            return Set(x => x.DrugRouteCodeId, drugRouteCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DrugRouteCodeBuilder WithDrugRouteCodeName(String drugRouteCodeName)
        {
            return Set(x => x.DrugRouteCodeName, drugRouteCodeName);
        }


        protected override Entities.DrugRouteCode BuildObject()
        {
            return Entities.DrugRouteCode.Create(

      Get(x => x.DrugRouteCodeId),
      Get(x => x.DrugRouteCodeName));
        }

    }

    public class WebJobHistoryBuilder : TestDataBuilder<Entities.WebJobHistory, WebJobHistoryBuilder>
    {

        public WebJobHistoryBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual WebJobHistoryBuilder WithJobId(Int16 jobId)
        {
            return Set(x => x.JobId, jobId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual WebJobHistoryBuilder WithRunId(Int32 runId)
        {
            return Set(x => x.RunId, runId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual WebJobHistoryBuilder WithCreationTime(DateTime creationTime)
        {
            return Set(x => x.CreationTime, creationTime);
        }


        protected override Entities.WebJobHistory BuildObject()
        {
            return Entities.WebJobHistory.Create(

      Get(x => x.JobId),
      Get(x => x.CreationTime));
        }

    }

    public class FamilyHistoryBuilder : TestDataBuilder<Entities.FamilyHistory, FamilyHistoryBuilder>
    {

        public FamilyHistoryBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual FamilyHistoryBuilder WithId(Int64 id)
        {
            return Set(x => x.Id, id);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual FamilyHistoryBuilder WithPid(Int64 pid)
        {
            return Set(x => x.Pid, pid);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual FamilyHistoryBuilder WithVisitId(Int64 visitId)
        {
            return Set(x => x.VisitId, visitId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual FamilyHistoryBuilder WithArchived(Boolean archived)
        {
            return Set(x => x.Archived, archived);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual FamilyHistoryBuilder WithParentId(Int64? parentId)
        {
            return Set(x => x.ParentId, parentId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual FamilyHistoryBuilder WithTenantId(Int32 tenantId)
        {
            return Set(x => x.TenantId, tenantId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual FamilyHistoryBuilder WithRelationshipCodeId(Int32 relationshipCodeId)
        {
            return Set(x => x.RelationshipCodeId, relationshipCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual FamilyHistoryBuilder WithICDCodeCNId(String iCDCodeCNId)
        {
            return Set(x => x.ICDCodeCNId, iCDCodeCNId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual FamilyHistoryBuilder WithNote(String note)
        {
            return Set(x => x.Note, note);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual FamilyHistoryBuilder WithStatusCodeId(Int32? statusCodeId)
        {
            return Set(x => x.StatusCodeId, statusCodeId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual FamilyHistoryBuilder WithCreateDate(DateTime? createDate)
        {
            return Set(x => x.CreateDate, createDate);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual FamilyHistoryBuilder WithUpdateDate(DateTime? updateDate)
        {
            return Set(x => x.UpdateDate, updateDate);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual FamilyHistoryBuilder WithCreatedBy(Int64 createdBy)
        {
            return Set(x => x.CreatedBy, createdBy);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual FamilyHistoryBuilder WithUpdatedBy(Int64? updatedBy)
        {
            return Set(x => x.UpdatedBy, updatedBy);
        }



        protected override Entities.FamilyHistory BuildObject()
        {
            return Entities.FamilyHistory.Create(

      Get(x => x.Pid),
      Get(x => x.VisitId),
      Get(x => x.Archived),
      Get(x => x.TenantId),
      Get(x => x.RelationshipCodeId),
      Get(x => x.ICDCodeCNId),
      Get(x => x.CreatedBy),
      Get(x => x.ParentId),
      Get(x => x.Note),
      Get(x => x.StatusCodeId),
      Get(x => x.CreateDate),
      Get(x => x.UpdateDate),
      Get(x => x.UpdatedBy));
        }

    }

    public class FrequencyCodeBuilder : TestDataBuilder<Entities.FrequencyCode, FrequencyCodeBuilder>
    {

        public FrequencyCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual FrequencyCodeBuilder WithFrequencyCodeId(Int32 frequencyCodeId)
        {
            return Set(x => x.FrequencyCodeId, frequencyCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual FrequencyCodeBuilder WithFrequencyCodeName(String frequencyCodeName)
        {
            return Set(x => x.FrequencyCodeName, frequencyCodeName);
        }


        protected override Entities.FrequencyCode BuildObject()
        {
            return Entities.FrequencyCode.Create(

      Get(x => x.FrequencyCodeName));
        }

    }

    public class ICDCodeCNBuilder : TestDataBuilder<Entities.ICDCodeCN, ICDCodeCNBuilder>
    {

        public ICDCodeCNBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual ICDCodeCNBuilder WithICDCodeCNId(String iCDCodeCNId)
        {
            return Set(x => x.ICDCodeCNId, iCDCodeCNId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ICDCodeCNBuilder WithICDCodeCNShortName(String iCDCodeCNShortName)
        {
            return Set(x => x.ICDCodeCNShortName, iCDCodeCNShortName);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ICDCodeCNBuilder WithICDCodeCNName(String iCDCodeCNName)
        {
            return Set(x => x.ICDCodeCNName, iCDCodeCNName);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ICDCodeCNBuilder WithTenantId(Int32? tenantId)
        {
            return Set(x => x.TenantId, tenantId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual ICDCodeCNBuilder WithCreateDate(DateTime? createDate)
        {
            return Set(x => x.CreateDate, createDate);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual ICDCodeCNBuilder WithUpdateDate(DateTime? updateDate)
        {
            return Set(x => x.UpdateDate, updateDate);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual ICDCodeCNBuilder WithCreatedBy(Int64? createdBy)
        {
            return Set(x => x.CreatedBy, createdBy);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual ICDCodeCNBuilder WithUpdatedBy(Int64? updatedBy)
        {
            return Set(x => x.UpdatedBy, updatedBy);
        }



        protected override Entities.ICDCodeCN BuildObject()
        {
            return Entities.ICDCodeCN.Create(

      Get(x => x.ICDCodeCNId),
      Get(x => x.ICDCodeCNShortName),
      Get(x => x.ICDCodeCNName),
      Get(x => x.TenantId),
      Get(x => x.CreateDate),
      Get(x => x.UpdateDate),
      Get(x => x.CreatedBy),
      Get(x => x.UpdatedBy));
        }

    }

    public class ICDCodePCSBuilder : TestDataBuilder<Entities.ICDCodePCS, ICDCodePCSBuilder>
    {

        public ICDCodePCSBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual ICDCodePCSBuilder WithICDCodePCSId(String iCDCodePCSId)
        {
            return Set(x => x.ICDCodePCSId, iCDCodePCSId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ICDCodePCSBuilder WithICDCodePCSShortName(String iCDCodePCSShortName)
        {
            return Set(x => x.ICDCodePCSShortName, iCDCodePCSShortName);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ICDCodePCSBuilder WithICDCodePCSName(String iCDCodePCSName)
        {
            return Set(x => x.ICDCodePCSName, iCDCodePCSName);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ICDCodePCSBuilder WithTenantId(Int32? tenantId)
        {
            return Set(x => x.TenantId, tenantId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual ICDCodePCSBuilder WithCreateDate(DateTime? createDate)
        {
            return Set(x => x.CreateDate, createDate);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual ICDCodePCSBuilder WithUpdateDate(DateTime? updateDate)
        {
            return Set(x => x.UpdateDate, updateDate);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual ICDCodePCSBuilder WithCreatedBy(Int64? createdBy)
        {
            return Set(x => x.CreatedBy, createdBy);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual ICDCodePCSBuilder WithUpdatedBy(Int64? updatedBy)
        {
            return Set(x => x.UpdatedBy, updatedBy);
        }



        protected override Entities.ICDCodePCS BuildObject()
        {
            return Entities.ICDCodePCS.Create(

      Get(x => x.ICDCodePCSId),
      Get(x => x.ICDCodePCSShortName),
      Get(x => x.ICDCodePCSName),
      Get(x => x.TenantId),
      Get(x => x.CreateDate),
      Get(x => x.UpdateDate),
      Get(x => x.CreatedBy),
      Get(x => x.UpdatedBy));
        }

    }

    public class ImmunizationCodeBuilder : TestDataBuilder<Entities.ImmunizationCode, ImmunizationCodeBuilder>
    {

        public ImmunizationCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual ImmunizationCodeBuilder WithImmunizationCodeId(Int32 immunizationCodeId)
        {
            return Set(x => x.ImmunizationCodeId, immunizationCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ImmunizationCodeBuilder WithImmunizationName(String immunizationName)
        {
            return Set(x => x.ImmunizationName, immunizationName);
        }


        protected override Entities.ImmunizationCode BuildObject()
        {
            return Entities.ImmunizationCode.Create(

      Get(x => x.ImmunizationName));
        }

    }

    public class ImmunizationsBuilder : TestDataBuilder<Entities.Immunizations, ImmunizationsBuilder>
    {

        public ImmunizationsBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual ImmunizationsBuilder WithId(Int64 id)
        {
            return Set(x => x.Id, id);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ImmunizationsBuilder WithPid(Int64? pid)
        {
            return Set(x => x.Pid, pid);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual ImmunizationsBuilder WithVisitId(Int64 visitId)
        {
            return Set(x => x.VisitId, visitId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ImmunizationsBuilder WithArchived(Boolean archived)
        {
            return Set(x => x.Archived, archived);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ImmunizationsBuilder WithParentId(Int64? parentId)
        {
            return Set(x => x.ParentId, parentId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual ImmunizationsBuilder WithTenantId(Int32? tenantId)
        {
            return Set(x => x.TenantId, tenantId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual ImmunizationsBuilder WithImmunizationCodeId(Int32? immunizationCodeId)
        {
            return Set(x => x.ImmunizationCodeId, immunizationCodeId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual ImmunizationsBuilder WithAdministeredDate(DateTime? administeredDate)
        {
            return Set(x => x.AdministeredDate, administeredDate);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual ImmunizationsBuilder WithAdministeredById(Int64? administeredById)
        {
            return Set(x => x.AdministeredById, administeredById);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual ImmunizationsBuilder WithNote(String note)
        {
            return Set(x => x.Note, note);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ImmunizationsBuilder WithExpirationDate(DateTime? expirationDate)
        {
            return Set(x => x.ExpirationDate, expirationDate);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual ImmunizationsBuilder WithCompletionStatusCodeId(Int32? completionStatusCodeId)
        {
            return Set(x => x.CompletionStatusCodeId, completionStatusCodeId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual ImmunizationsBuilder WithStatus(String status)
        {
            return Set(x => x.Status, status);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ImmunizationsBuilder WithInformationSource(String informationSource)
        {
            return Set(x => x.InformationSource, informationSource);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ImmunizationsBuilder WithAdministrationSiteId(Int32 administrationSiteId)
        {
            return Set(x => x.AdministrationSiteId, administrationSiteId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ImmunizationsBuilder WithCreateDate(DateTime? createDate)
        {
            return Set(x => x.CreateDate, createDate);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual ImmunizationsBuilder WithUpdateDate(DateTime? updateDate)
        {
            return Set(x => x.UpdateDate, updateDate);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual ImmunizationsBuilder WithCreatedBy(Int64 createdBy)
        {
            return Set(x => x.CreatedBy, createdBy);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ImmunizationsBuilder WithUpdatedBy(Int64? updatedBy)
        {
            return Set(x => x.UpdatedBy, updatedBy);
        }



        protected override Entities.Immunizations BuildObject()
        {
            return Entities.Immunizations.Create(

      Get(x => x.VisitId),
      Get(x => x.Archived),
      Get(x => x.AdministrationSiteId),
      Get(x => x.CreatedBy),
      Get(x => x.Pid),
      Get(x => x.ParentId),
      Get(x => x.TenantId),
      Get(x => x.ImmunizationCodeId),
      Get(x => x.AdministeredDate),
      Get(x => x.AdministeredById),
      Get(x => x.Note),
      Get(x => x.ExpirationDate),
      Get(x => x.CompletionStatusCodeId),
      Get(x => x.Status),
      Get(x => x.InformationSource),
      Get(x => x.CreateDate),
      Get(x => x.UpdateDate),
      Get(x => x.UpdatedBy));
        }

    }

    public class InformationSourceBuilder : TestDataBuilder<Entities.InformationSource, InformationSourceBuilder>
    {

        public InformationSourceBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual InformationSourceBuilder WithInformationSourceId(Int32 informationSourceId)
        {
            return Set(x => x.InformationSourceId, informationSourceId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual InformationSourceBuilder WithInformationSourceName(String informationSourceName)
        {
            return Set(x => x.InformationSourceName, informationSourceName);
        }


        protected override Entities.InformationSource BuildObject()
        {
            return Entities.InformationSource.Create(

      Get(x => x.InformationSourceName));
        }

    }

    public class LifeStyleBuilder : TestDataBuilder<Entities.LifeStyle, LifeStyleBuilder>
    {

        public LifeStyleBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual LifeStyleBuilder WithId(Int64 id)
        {
            return Set(x => x.Id, id);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LifeStyleBuilder WithPid(Int64 pid)
        {
            return Set(x => x.Pid, pid);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LifeStyleBuilder WithVisitId(Int64 visitId)
        {
            return Set(x => x.VisitId, visitId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LifeStyleBuilder WithArchived(Boolean archived)
        {
            return Set(x => x.Archived, archived);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LifeStyleBuilder WithParentId(Int64? parentId)
        {
            return Set(x => x.ParentId, parentId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual LifeStyleBuilder WithTenantId(Int32 tenantId)
        {
            return Set(x => x.TenantId, tenantId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LifeStyleBuilder WithLifeStyleTypeId(Int32 lifeStyleTypeId)
        {
            return Set(x => x.LifeStyleTypeId, lifeStyleTypeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LifeStyleBuilder WithQuitDate(DateTime? quitDate)
        {
            return Set(x => x.QuitDate, quitDate);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual LifeStyleBuilder WithCurrentlyActive(Boolean currentlyActive)
        {
            return Set(x => x.CurrentlyActive, currentlyActive);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LifeStyleBuilder WithNote(String note)
        {
            return Set(x => x.Note, note);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LifeStyleBuilder WithCreateDate(DateTime createDate)
        {
            return Set(x => x.CreateDate, createDate);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LifeStyleBuilder WithUpdateDate(DateTime updateDate)
        {
            return Set(x => x.UpdateDate, updateDate);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LifeStyleBuilder WithCreatedBy(Int64 createdBy)
        {
            return Set(x => x.CreatedBy, createdBy);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LifeStyleBuilder WithUpdatedBy(Int64 updatedBy)
        {
            return Set(x => x.UpdatedBy, updatedBy);
        }


        protected override Entities.LifeStyle BuildObject()
        {
            return Entities.LifeStyle.Create(

      Get(x => x.Pid),
      Get(x => x.VisitId),
      Get(x => x.Archived),
      Get(x => x.TenantId),
      Get(x => x.LifeStyleTypeId),
      Get(x => x.CurrentlyActive),
      Get(x => x.CreateDate),
      Get(x => x.UpdateDate),
      Get(x => x.CreatedBy),
      Get(x => x.UpdatedBy),
      Get(x => x.ParentId),
      Get(x => x.QuitDate),
      Get(x => x.Note));
        }

    }

    public class LifeStyleTypeBuilder : TestDataBuilder<Entities.LifeStyleType, LifeStyleTypeBuilder>
    {

        public LifeStyleTypeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual LifeStyleTypeBuilder WithLifeStyleTypeId(Int32 lifeStyleTypeId)
        {
            return Set(x => x.LifeStyleTypeId, lifeStyleTypeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LifeStyleTypeBuilder WithLifeStyleTypeName(String lifeStyleTypeName)
        {
            return Set(x => x.LifeStyleTypeName, lifeStyleTypeName);
        }


        protected override Entities.LifeStyleType BuildObject()
        {
            return Entities.LifeStyleType.Create(

      Get(x => x.LifeStyleTypeName));
        }

    }

    public class LoincCodeBuilder : TestDataBuilder<Entities.LoincCode, LoincCodeBuilder>
    {

        public LoincCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual LoincCodeBuilder WithLoincCodeId(String loincCodeId)
        {
            return Set(x => x.LoincCodeId, loincCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LoincCodeBuilder WithComponent(String component)
        {
            return Set(x => x.Component, component);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LoincCodeBuilder WithProperty(String property)
        {
            return Set(x => x.Property, property);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LoincCodeBuilder WithTimeAspct(String timeAspct)
        {
            return Set(x => x.TimeAspct, timeAspct);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LoincCodeBuilder WithSystemCode(String systemCode)
        {
            return Set(x => x.SystemCode, systemCode);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LoincCodeBuilder WithScaleType(String scaleType)
        {
            return Set(x => x.ScaleType, scaleType);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LoincCodeBuilder WithMethodType(String methodType)
        {
            return Set(x => x.MethodType, methodType);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LoincCodeBuilder WithClassName(String className)
        {
            return Set(x => x.ClassName, className);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LoincCodeBuilder WithFormula(String formula)
        {
            return Set(x => x.Formula, formula);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LoincCodeBuilder WithUnitsRequired(String unitsRequired)
        {
            return Set(x => x.UnitsRequired, unitsRequired);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LoincCodeBuilder WithSubmittedUnits(String submittedUnits)
        {
            return Set(x => x.SubmittedUnits, submittedUnits);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LoincCodeBuilder WithRelatedNames(String relatedNames)
        {
            return Set(x => x.RelatedNames, relatedNames);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LoincCodeBuilder WithShortName(String shortName)
        {
            return Set(x => x.ShortName, shortName);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LoincCodeBuilder WithExampleUnits(String exampleUnits)
        {
            return Set(x => x.ExampleUnits, exampleUnits);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LoincCodeBuilder WithLongCommonName(String longCommonName)
        {
            return Set(x => x.LongCommonName, longCommonName);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LoincCodeBuilder WithUnitsAndRange(String unitsAndRange)
        {
            return Set(x => x.UnitsAndRange, unitsAndRange);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LoincCodeBuilder WithExampleUcumUnits(String exampleUcumUnits)
        {
            return Set(x => x.ExampleUcumUnits, exampleUcumUnits);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LoincCodeBuilder WithTenantId(Int32? tenantId)
        {
            return Set(x => x.TenantId, tenantId);
        }



        protected override Entities.LoincCode BuildObject()
        {
            return Entities.LoincCode.Create(

      Get(x => x.LoincCodeId),
      Get(x => x.Component),
      Get(x => x.Property),
      Get(x => x.TimeAspct),
      Get(x => x.SystemCode),
      Get(x => x.ScaleType),
      Get(x => x.MethodType),
      Get(x => x.ClassName),
      Get(x => x.Formula),
      Get(x => x.UnitsRequired),
      Get(x => x.SubmittedUnits),
      Get(x => x.RelatedNames),
      Get(x => x.ShortName),
      Get(x => x.ExampleUnits),
      Get(x => x.LongCommonName),
      Get(x => x.UnitsAndRange),
      Get(x => x.ExampleUcumUnits),
      Get(x => x.TenantId));
        }

    }

    public class LoincPanelCodeBuilder : TestDataBuilder<Entities.LoincPanelCode, LoincPanelCodeBuilder>
    {

        public LoincPanelCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual LoincPanelCodeBuilder WithParentId(Int32 parentId)
        {
            return Set(x => x.ParentId, parentId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LoincPanelCodeBuilder WithParentLoincCodeId(String parentLoincCodeId)
        {
            return Set(x => x.ParentLoincCodeId, parentLoincCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LoincPanelCodeBuilder WithParentName(String parentName)
        {
            return Set(x => x.ParentName, parentName);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LoincPanelCodeBuilder WithId(Int32 id)
        {
            return Set(x => x.Id, id);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LoincPanelCodeBuilder WithSequence(Int32 sequence)
        {
            return Set(x => x.Sequence, sequence);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LoincPanelCodeBuilder WithLoincCodeId(String loincCodeId)
        {
            return Set(x => x.LoincCodeId, loincCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LoincPanelCodeBuilder WithName(String name)
        {
            return Set(x => x.Name, name);
        }


        protected override Entities.LoincPanelCode BuildObject()
        {
            return Entities.LoincPanelCode.Create(

      Get(x => x.ParentId),
      Get(x => x.ParentLoincCodeId),
      Get(x => x.Id),
      Get(x => x.Sequence),
      Get(x => x.LoincCodeId),
      Get(x => x.ParentName),
      Get(x => x.Name));
        }

    }

    public class LoincRangeCodeBuilder : TestDataBuilder<Entities.LoincRangeCode, LoincRangeCodeBuilder>
    {

        public LoincRangeCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual LoincRangeCodeBuilder WithLoincCodeId(String loincCodeId)
        {
            return Set(x => x.LoincCodeId, loincCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LoincRangeCodeBuilder WithLoincRangeCodeName(String loincRangeCodeName)
        {
            return Set(x => x.LoincRangeCodeName, loincRangeCodeName);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LoincRangeCodeBuilder WithTenantId(Int32 tenantId)
        {
            return Set(x => x.TenantId, tenantId);
        }


        protected override Entities.LoincRangeCode BuildObject()
        {
            return Entities.LoincRangeCode.Create(

      Get(x => x.LoincCodeId),
      Get(x => x.LoincRangeCodeName),
      Get(x => x.TenantId));
        }

    }

    public class LoincUnitCodeBuilder : TestDataBuilder<Entities.LoincUnitCode, LoincUnitCodeBuilder>
    {

        public LoincUnitCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual LoincUnitCodeBuilder WithLoincCodeId(String loincCodeId)
        {
            return Set(x => x.LoincCodeId, loincCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LoincUnitCodeBuilder WithLoincUnitCodeName(String loincUnitCodeName)
        {
            return Set(x => x.LoincUnitCodeName, loincUnitCodeName);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual LoincUnitCodeBuilder WithTenantId(Int32 tenantId)
        {
            return Set(x => x.TenantId, tenantId);
        }


        protected override Entities.LoincUnitCode BuildObject()
        {
            return Entities.LoincUnitCode.Create(

      Get(x => x.LoincCodeId),
      Get(x => x.LoincUnitCodeName),
      Get(x => x.TenantId));
        }

    }

    public class OrderConditionBuilder : TestDataBuilder<Entities.OrderCondition, OrderConditionBuilder>
    {

        public OrderConditionBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual OrderConditionBuilder WithOrderId(Int64 orderId)
        {
            return Set(x => x.OrderId, orderId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderConditionBuilder WithICDCodeCNId(String iCDCodeCNId)
        {
            return Set(x => x.ICDCodeCNId, iCDCodeCNId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderConditionBuilder WithPrimaryCondition(Boolean primaryCondition)
        {
            return Set(x => x.PrimaryCondition, primaryCondition);
        }


        protected override Entities.OrderCondition BuildObject()
        {
            return Entities.OrderCondition.Create(

      Get(x => x.OrderId),
      Get(x => x.ICDCodeCNId),
      Get(x => x.PrimaryCondition));
        }

    }

    public class UserPreferenceBuilder : TestDataBuilder<Entities.UserPreference, UserPreferenceBuilder>
    {

        public UserPreferenceBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual UserPreferenceBuilder WithId(Int64 id)
        {
            return Set(x => x.Id, id);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual UserPreferenceBuilder WithTenantId(Int32 tenantId)
        {
            return Set(x => x.TenantId, tenantId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual UserPreferenceBuilder WithAdministrationSiteId(Int32? administrationSiteId)
        {
            return Set(x => x.AdministrationSiteId, administrationSiteId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual UserPreferenceBuilder WithCalendarColor(String calendarColor)
        {
            return Set(x => x.CalendarColor, calendarColor);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual UserPreferenceBuilder WithCreateDate(DateTime createDate)
        {
            return Set(x => x.CreateDate, createDate);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual UserPreferenceBuilder WithUpdateDate(DateTime updateDate)
        {
            return Set(x => x.UpdateDate, updateDate);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual UserPreferenceBuilder WithCreatedBy(Int64 createdBy)
        {
            return Set(x => x.CreatedBy, createdBy);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual UserPreferenceBuilder WithUpdatedBy(Int64 updatedBy)
        {
            return Set(x => x.UpdatedBy, updatedBy);
        }


        protected override Entities.UserPreference BuildObject()
        {
            return Entities.UserPreference.Create(

      Get(x => x.Id),
      Get(x => x.TenantId),
      Get(x => x.CreateDate),
      Get(x => x.UpdateDate),
      Get(x => x.CreatedBy),
      Get(x => x.UpdatedBy),
      Get(x => x.AdministrationSiteId),
      Get(x => x.CalendarColor));
        }

    }

    public class OrderResultBuilder : TestDataBuilder<Entities.OrderResult, OrderResultBuilder>
    {

        public OrderResultBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual OrderResultBuilder WithId(Int64 id)
        {
            return Set(x => x.Id, id);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderResultBuilder WithOrderId(Int64 orderId)
        {
            return Set(x => x.OrderId, orderId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderResultBuilder WithPid(Int64 pid)
        {
            return Set(x => x.Pid, pid);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderResultBuilder WithTenantId(Int32 tenantId)
        {
            return Set(x => x.TenantId, tenantId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderResultBuilder WithResultDate(DateTime resultDate)
        {
            return Set(x => x.ResultDate, resultDate);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderResultBuilder WithArchived(Boolean archived)
        {
            return Set(x => x.Archived, archived);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderResultBuilder WithParentId(Int64? parentId)
        {
            return Set(x => x.ParentId, parentId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual OrderResultBuilder WithResultById(Int64 resultById)
        {
            return Set(x => x.ResultById, resultById);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderResultBuilder WithParentLoincCodeId(String parentLoincCodeId)
        {
            return Set(x => x.ParentLoincCodeId, parentLoincCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderResultBuilder WithLoincCodeId(String loincCodeId)
        {
            return Set(x => x.LoincCodeId, loincCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderResultBuilder WithResultDataCodeId(Int32 resultDataCodeId)
        {
            return Set(x => x.ResultDataCodeId, resultDataCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderResultBuilder WithResultData(String resultData)
        {
            return Set(x => x.ResultData, resultData);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderResultBuilder WithAdministrationSiteId(Int32? administrationSiteId)
        {
            return Set(x => x.AdministrationSiteId, administrationSiteId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual OrderResultBuilder WithUnit(String unit)
        {
            return Set(x => x.Unit, unit);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderResultBuilder WithRangeValue(String rangeValue)
        {
            return Set(x => x.RangeValue, rangeValue);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderResultBuilder WithAbnormalCodeId(Int32 abnormalCodeId)
        {
            return Set(x => x.AbnormalCodeId, abnormalCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderResultBuilder WithNote(String note)
        {
            return Set(x => x.Note, note);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderResultBuilder WithResultStatusCodeId(Int32? resultStatusCodeId)
        {
            return Set(x => x.ResultStatusCodeId, resultStatusCodeId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual OrderResultBuilder WithCreateDate(DateTime createDate)
        {
            return Set(x => x.CreateDate, createDate);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderResultBuilder WithUpdateDate(DateTime updateDate)
        {
            return Set(x => x.UpdateDate, updateDate);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderResultBuilder WithCreatedBy(Int64 createdBy)
        {
            return Set(x => x.CreatedBy, createdBy);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderResultBuilder WithUpdatedBy(Int64 updatedBy)
        {
            return Set(x => x.UpdatedBy, updatedBy);
        }


        protected override Entities.OrderResult BuildObject()
        {
            return Entities.OrderResult.Create(

      Get(x => x.OrderId),
      Get(x => x.Pid),
      Get(x => x.TenantId),
      Get(x => x.ResultDate),
      Get(x => x.Archived),
      Get(x => x.ResultById),
      Get(x => x.LoincCodeId),
      Get(x => x.ResultDataCodeId),
      Get(x => x.ResultData),
      Get(x => x.AbnormalCodeId),
      Get(x => x.CreateDate),
      Get(x => x.UpdateDate),
      Get(x => x.CreatedBy),
      Get(x => x.UpdatedBy),
      Get(x => x.ParentId),
      Get(x => x.ParentLoincCodeId),
      Get(x => x.AdministrationSiteId),
      Get(x => x.Unit),
      Get(x => x.RangeValue),
      Get(x => x.Note),
      Get(x => x.ResultStatusCodeId));
        }

    }

    public class AppointmentBuilder : TestDataBuilder<Entities.Appointment, AppointmentBuilder>
    {

        public AppointmentBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AppointmentBuilder WithId(Int64 id)
        {
            return Set(x => x.Id, id);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AppointmentBuilder WithPid(Int32? pid)
        {
            return Set(x => x.Pid, pid);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AppointmentBuilder WithTenantId(Int32 tenantId)
        {
            return Set(x => x.TenantId, tenantId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AppointmentBuilder WithProviderId(Int32 providerId)
        {
            return Set(x => x.ProviderId, providerId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AppointmentBuilder WithAppointmentCodeId(Int32 appointmentCodeId)
        {
            return Set(x => x.AppointmentCodeId, appointmentCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AppointmentBuilder WithAppointmentStatusCodeId(Int32 appointmentStatusCodeId)
        {
            return Set(x => x.AppointmentStatusCodeId, appointmentStatusCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AppointmentBuilder WithAllDayEvent(Boolean allDayEvent)
        {
            return Set(x => x.AllDayEvent, allDayEvent);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AppointmentBuilder WithStartDate(DateTime startDate)
        {
            return Set(x => x.StartDate, startDate);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AppointmentBuilder WithEndDate(DateTime endDate)
        {
            return Set(x => x.EndDate, endDate);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AppointmentBuilder WithTitle(String title)
        {
            return Set(x => x.Title, title);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AppointmentBuilder WithAdministrationSiteId(Int32? administrationSiteId)
        {
            return Set(x => x.AdministrationSiteId, administrationSiteId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AppointmentBuilder WithFname(String fname)
        {
            return Set(x => x.Fname, fname);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AppointmentBuilder WithLname(String lname)
        {
            return Set(x => x.Lname, lname);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AppointmentBuilder WithMname(String mname)
        {
            return Set(x => x.Mname, mname);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AppointmentBuilder WithDOB(DateTime? dOB)
        {
            return Set(x => x.DOB, dOB);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AppointmentBuilder WithPhoneCell(String phoneCell)
        {
            return Set(x => x.PhoneCell, phoneCell);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AppointmentBuilder WithPhoneHome(String phoneHome)
        {
            return Set(x => x.PhoneHome, phoneHome);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AppointmentBuilder WithNote(String note)
        {
            return Set(x => x.Note, note);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AppointmentBuilder WithCreateDate(DateTime createDate)
        {
            return Set(x => x.CreateDate, createDate);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AppointmentBuilder WithUpdateDate(DateTime updateDate)
        {
            return Set(x => x.UpdateDate, updateDate);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AppointmentBuilder WithCreatedBy(Int64 createdBy)
        {
            return Set(x => x.CreatedBy, createdBy);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AppointmentBuilder WithUpdatedBy(Int64 updatedBy)
        {
            return Set(x => x.UpdatedBy, updatedBy);
        }


        protected override Entities.Appointment BuildObject()
        {
            return Entities.Appointment.Create(

      Get(x => x.TenantId),
      Get(x => x.ProviderId),
      Get(x => x.AppointmentCodeId),
      Get(x => x.AppointmentStatusCodeId),
      Get(x => x.AllDayEvent),
      Get(x => x.StartDate),
      Get(x => x.EndDate),
      Get(x => x.Title),
      Get(x => x.CreateDate),
      Get(x => x.UpdateDate),
      Get(x => x.CreatedBy),
      Get(x => x.UpdatedBy),
      Get(x => x.Pid),
      Get(x => x.AdministrationSiteId),
      Get(x => x.Fname),
      Get(x => x.Lname),
      Get(x => x.Mname),
      Get(x => x.DOB),
      Get(x => x.PhoneCell),
      Get(x => x.PhoneHome),
      Get(x => x.Note));
        }

    }

    public class AppointmentCodeBuilder : TestDataBuilder<Entities.AppointmentCode, AppointmentCodeBuilder>
    {

        public AppointmentCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AppointmentCodeBuilder WithAppointmentCodeId(Int32 appointmentCodeId)
        {
            return Set(x => x.AppointmentCodeId, appointmentCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AppointmentCodeBuilder WithAppointmentCodeName(String appointmentCodeName)
        {
            return Set(x => x.AppointmentCodeName, appointmentCodeName);
        }


        protected override Entities.AppointmentCode BuildObject()
        {
            return Entities.AppointmentCode.Create(

      Get(x => x.AppointmentCodeId),
      Get(x => x.AppointmentCodeName));
        }

    }

    public class AppointmentStatusCodeBuilder : TestDataBuilder<Entities.AppointmentStatusCode, AppointmentStatusCodeBuilder>
    {

        public AppointmentStatusCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AppointmentStatusCodeBuilder WithAppointmentStatusCodeId(Int32 appointmentStatusCodeId)
        {
            return Set(x => x.AppointmentStatusCodeId, appointmentStatusCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AppointmentStatusCodeBuilder WithAppointmentStatusCodeName(String appointmentStatusCodeName)
        {
            return Set(x => x.AppointmentStatusCodeName, appointmentStatusCodeName);
        }


        protected override Entities.AppointmentStatusCode BuildObject()
        {
            return Entities.AppointmentStatusCode.Create(

      Get(x => x.AppointmentStatusCodeId),
      Get(x => x.AppointmentStatusCodeName));
        }

    }

    public class OrderSpecimenBuilder : TestDataBuilder<Entities.OrderSpecimen, OrderSpecimenBuilder>
    {

        public OrderSpecimenBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual OrderSpecimenBuilder WithId(Int64 id)
        {
            return Set(x => x.Id, id);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderSpecimenBuilder WithOrderId(Int64 orderId)
        {
            return Set(x => x.OrderId, orderId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderSpecimenBuilder WithPid(Int64 pid)
        {
            return Set(x => x.Pid, pid);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderSpecimenBuilder WithTenantId(Int32 tenantId)
        {
            return Set(x => x.TenantId, tenantId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderSpecimenBuilder WithArchived(Boolean archived)
        {
            return Set(x => x.Archived, archived);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderSpecimenBuilder WithParentId(Int64? parentId)
        {
            return Set(x => x.ParentId, parentId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual OrderSpecimenBuilder WithCollectedDate(DateTime collectedDate)
        {
            return Set(x => x.CollectedDate, collectedDate);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderSpecimenBuilder WithCollectedById(Int64 collectedById)
        {
            return Set(x => x.CollectedById, collectedById);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderSpecimenBuilder WithNote(String note)
        {
            return Set(x => x.Note, note);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderSpecimenBuilder WithStatusCodeId(Int32 statusCodeId)
        {
            return Set(x => x.StatusCodeId, statusCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderSpecimenBuilder WithAdministrationSiteId(Int32? administrationSiteId)
        {
            return Set(x => x.AdministrationSiteId, administrationSiteId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual OrderSpecimenBuilder WithSpecimenNumber(String specimenNumber)
        {
            return Set(x => x.SpecimenNumber, specimenNumber);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderSpecimenBuilder WithSpecimenCodeId(Int32 specimenCodeId)
        {
            return Set(x => x.SpecimenCodeId, specimenCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderSpecimenBuilder WithCreateDate(DateTime createDate)
        {
            return Set(x => x.CreateDate, createDate);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderSpecimenBuilder WithUpdateDate(DateTime updateDate)
        {
            return Set(x => x.UpdateDate, updateDate);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderSpecimenBuilder WithCreatedBy(Int64 createdBy)
        {
            return Set(x => x.CreatedBy, createdBy);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OrderSpecimenBuilder WithUpdatedBy(Int64 updatedBy)
        {
            return Set(x => x.UpdatedBy, updatedBy);
        }


        protected override Entities.OrderSpecimen BuildObject()
        {
            return Entities.OrderSpecimen.Create(

      Get(x => x.OrderId),
      Get(x => x.Pid),
      Get(x => x.TenantId),
      Get(x => x.Archived),
      Get(x => x.CollectedDate),
      Get(x => x.CollectedById),
      Get(x => x.StatusCodeId),
      Get(x => x.SpecimenCodeId),
      Get(x => x.CreateDate),
      Get(x => x.UpdateDate),
      Get(x => x.CreatedBy),
      Get(x => x.UpdatedBy),
      Get(x => x.ParentId),
      Get(x => x.Note),
      Get(x => x.AdministrationSiteId),
      Get(x => x.SpecimenNumber));
        }

    }

    public class OutcomeCodeBuilder : TestDataBuilder<Entities.OutcomeCode, OutcomeCodeBuilder>
    {

        public OutcomeCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual OutcomeCodeBuilder WithOutcomeCodeId(Int32 outcomeCodeId)
        {
            return Set(x => x.OutcomeCodeId, outcomeCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual OutcomeCodeBuilder WithOutcomeCodeName(String outcomeCodeName)
        {
            return Set(x => x.OutcomeCodeName, outcomeCodeName);
        }


        protected override Entities.OutcomeCode BuildObject()
        {
            return Entities.OutcomeCode.Create(

      Get(x => x.OutcomeCodeName));
        }

    }

    public class PatientAllergyBuilder : TestDataBuilder<Entities.PatientAllergy, PatientAllergyBuilder>
    {

        public PatientAllergyBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PatientAllergyBuilder WithPatientAllergyId(Int64 patientAllergyId)
        {
            return Set(x => x.PatientAllergyId, patientAllergyId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientAllergyBuilder WithPid(Int64 pid)
        {
            return Set(x => x.Pid, pid);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientAllergyBuilder WithVisitId(Int64 visitId)
        {
            return Set(x => x.VisitId, visitId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientAllergyBuilder WithArchived(Boolean archived)
        {
            return Set(x => x.Archived, archived);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientAllergyBuilder WithParentId(Int64? parentId)
        {
            return Set(x => x.ParentId, parentId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PatientAllergyBuilder WithTenantId(Int32 tenantId)
        {
            return Set(x => x.TenantId, tenantId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientAllergyBuilder WithAllergyName(String allergyName)
        {
            return Set(x => x.AllergyName, allergyName);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientAllergyBuilder WithAllergyTypeId(Int32 allergyTypeId)
        {
            return Set(x => x.AllergyTypeId, allergyTypeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientAllergyBuilder WithReactionName(String reactionName)
        {
            return Set(x => x.ReactionName, reactionName);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientAllergyBuilder WithSeverityId(Int32 severityId)
        {
            return Set(x => x.SeverityId, severityId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientAllergyBuilder WithAllergyCategoryCodeId(Int32 allergyCategoryCodeId)
        {
            return Set(x => x.AllergyCategoryCodeId, allergyCategoryCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientAllergyBuilder WithStartDate(DateTime? startDate)
        {
            return Set(x => x.StartDate, startDate);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PatientAllergyBuilder WithEndDate(DateTime? endDate)
        {
            return Set(x => x.EndDate, endDate);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PatientAllergyBuilder WithNote(String note)
        {
            return Set(x => x.Note, note);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientAllergyBuilder WithStatus(String status)
        {
            return Set(x => x.Status, status);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientAllergyBuilder WithProvider(Int64 provider)
        {
            return Set(x => x.Provider, provider);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientAllergyBuilder WithCreateDate(DateTime? createDate)
        {
            return Set(x => x.CreateDate, createDate);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PatientAllergyBuilder WithUpdateDate(DateTime? updateDate)
        {
            return Set(x => x.UpdateDate, updateDate);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PatientAllergyBuilder WithCreatedBy(Int64 createdBy)
        {
            return Set(x => x.CreatedBy, createdBy);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientAllergyBuilder WithUpdatedBy(Int64? updatedBy)
        {
            return Set(x => x.UpdatedBy, updatedBy);
        }



        protected override Entities.PatientAllergy BuildObject()
        {
            return Entities.PatientAllergy.Create(

      Get(x => x.Pid),
      Get(x => x.VisitId),
      Get(x => x.Archived),
      Get(x => x.TenantId),
      Get(x => x.AllergyName),
      Get(x => x.AllergyTypeId),
      Get(x => x.ReactionName),
      Get(x => x.SeverityId),
      Get(x => x.AllergyCategoryCodeId),
      Get(x => x.Provider),
      Get(x => x.CreatedBy),
      Get(x => x.ParentId),
      Get(x => x.StartDate),
      Get(x => x.EndDate),
      Get(x => x.Note),
      Get(x => x.Status),
      Get(x => x.CreateDate),
      Get(x => x.UpdateDate),
      Get(x => x.UpdatedBy));
        }

    }

    public class PatientDataBuilder : TestDataBuilder<Entities.PatientData, PatientDataBuilder>
    {

        public PatientDataBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithPid(Int64 pid)
        {
            return Set(x => x.Pid, pid);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithTenantId(Int32 tenantId)
        {
            return Set(x => x.TenantId, tenantId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithFname(String fname)
        {
            return Set(x => x.Fname, fname);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithLname(String lname)
        {
            return Set(x => x.Lname, lname);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithMname(String mname)
        {
            return Set(x => x.Mname, mname);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithDOB(DateTime? dOB)
        {
            return Set(x => x.DOB, dOB);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithStreet(String street)
        {
            return Set(x => x.Street, street);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithPostalCode(String postalCode)
        {
            return Set(x => x.PostalCode, postalCode);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithCity(String city)
        {
            return Set(x => x.City, city);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithState(String state)
        {
            return Set(x => x.State, state);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithCounty(String county)
        {
            return Set(x => x.County, county);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithCountryCode(String countryCode)
        {
            return Set(x => x.CountryCode, countryCode);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithDriversLicense(String driversLicense)
        {
            return Set(x => x.DriversLicense, driversLicense);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithIdentificationNumber(String identificationNumber)
        {
            return Set(x => x.IdentificationNumber, identificationNumber);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithPhoneHome(String phoneHome)
        {
            return Set(x => x.PhoneHome, phoneHome);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithEmergencyContactPhone(String emergencyContactPhone)
        {
            return Set(x => x.EmergencyContactPhone, emergencyContactPhone);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithEmergencyContactName(String emergencyContactName)
        {
            return Set(x => x.EmergencyContactName, emergencyContactName);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithContactRelationship(String contactRelationship)
        {
            return Set(x => x.ContactRelationship, contactRelationship);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithPhoneCell(String phoneCell)
        {
            return Set(x => x.PhoneCell, phoneCell);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithGender(String gender)
        {
            return Set(x => x.Gender, gender);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithEmail(String email)
        {
            return Set(x => x.Email, email);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithRace(String race)
        {
            return Set(x => x.Race, race);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithEthnicity(String ethnicity)
        {
            return Set(x => x.Ethnicity, ethnicity);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithBillingNote(String billingNote)
        {
            return Set(x => x.BillingNote, billingNote);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithDeceasedDate(DateTime? deceasedDate)
        {
            return Set(x => x.DeceasedDate, deceasedDate);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithDeceasedReason(String deceasedReason)
        {
            return Set(x => x.DeceasedReason, deceasedReason);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithCurrentlyInVisit(Boolean currentlyInVisit)
        {
            return Set(x => x.CurrentlyInVisit, currentlyInVisit);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithCreateDate(DateTime? createDate)
        {
            return Set(x => x.CreateDate, createDate);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithUpdateDate(DateTime? updateDate)
        {
            return Set(x => x.UpdateDate, updateDate);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithCreatedBy(Int64 createdBy)
        {
            return Set(x => x.CreatedBy, createdBy);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientDataBuilder WithUpdatedBy(Int64? updatedBy)
        {
            return Set(x => x.UpdatedBy, updatedBy);
        }



        protected override Entities.PatientData BuildObject()
        {
            return Entities.PatientData.Create(

      Get(x => x.TenantId),
      Get(x => x.Fname),
      Get(x => x.Lname),
      Get(x => x.Mname),
      Get(x => x.Street),
      Get(x => x.PostalCode),
      Get(x => x.City),
      Get(x => x.State),
      Get(x => x.County),
      Get(x => x.CountryCode),
      Get(x => x.DriversLicense),
      Get(x => x.IdentificationNumber),
      Get(x => x.PhoneHome),
      Get(x => x.EmergencyContactPhone),
      Get(x => x.EmergencyContactName),
      Get(x => x.ContactRelationship),
      Get(x => x.PhoneCell),
      Get(x => x.Gender),
      Get(x => x.Email),
      Get(x => x.Race),
      Get(x => x.Ethnicity),
      Get(x => x.DeceasedReason),
      Get(x => x.CurrentlyInVisit),
      Get(x => x.CreatedBy),
      Get(x => x.DOB),
      Get(x => x.BillingNote),
      Get(x => x.DeceasedDate),
      Get(x => x.CreateDate),
      Get(x => x.UpdateDate),
      Get(x => x.UpdatedBy));
        }

    }

    public class AbpAuditLogsBuilder : TestDataBuilder<Entities.AbpAuditLogs, AbpAuditLogsBuilder>
    {

        public AbpAuditLogsBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpAuditLogsBuilder WithId(Int64 id)
        {
            return Set(x => x.Id, id);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpAuditLogsBuilder WithTenantId(Int32? tenantId)
        {
            return Set(x => x.TenantId, tenantId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpAuditLogsBuilder WithUserId(Int64? userId)
        {
            return Set(x => x.UserId, userId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpAuditLogsBuilder WithServiceName(String serviceName)
        {
            return Set(x => x.ServiceName, serviceName);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpAuditLogsBuilder WithMethodName(String methodName)
        {
            return Set(x => x.MethodName, methodName);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpAuditLogsBuilder WithParameters(String parameters)
        {
            return Set(x => x.Parameters, parameters);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpAuditLogsBuilder WithExecutionTime(DateTime executionTime)
        {
            return Set(x => x.ExecutionTime, executionTime);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpAuditLogsBuilder WithExecutionDuration(Int32 executionDuration)
        {
            return Set(x => x.ExecutionDuration, executionDuration);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpAuditLogsBuilder WithClientIpAddress(String clientIpAddress)
        {
            return Set(x => x.ClientIpAddress, clientIpAddress);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpAuditLogsBuilder WithClientName(String clientName)
        {
            return Set(x => x.ClientName, clientName);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpAuditLogsBuilder WithBrowserInfo(String browserInfo)
        {
            return Set(x => x.BrowserInfo, browserInfo);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpAuditLogsBuilder WithException(String exception)
        {
            return Set(x => x.Exception, exception);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpAuditLogsBuilder WithImpersonatorUserId(Int64? impersonatorUserId)
        {
            return Set(x => x.ImpersonatorUserId, impersonatorUserId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpAuditLogsBuilder WithImpersonatorTenantId(Int32? impersonatorTenantId)
        {
            return Set(x => x.ImpersonatorTenantId, impersonatorTenantId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpAuditLogsBuilder WithCustomData(String customData)
        {
            return Set(x => x.CustomData, customData);
        }


        protected override Entities.AbpAuditLogs BuildObject()
        {
            return Entities.AbpAuditLogs.Create(

      Get(x => x.ExecutionTime),
      Get(x => x.ExecutionDuration),
      Get(x => x.TenantId),
      Get(x => x.UserId),
      Get(x => x.ServiceName),
      Get(x => x.MethodName),
      Get(x => x.Parameters),
      Get(x => x.ClientIpAddress),
      Get(x => x.ClientName),
      Get(x => x.BrowserInfo),
      Get(x => x.Exception),
      Get(x => x.ImpersonatorUserId),
      Get(x => x.ImpersonatorTenantId),
      Get(x => x.CustomData));
        }

    }

    public class AbpPermissionsBuilder : TestDataBuilder<Entities.AbpPermissions, AbpPermissionsBuilder>
    {

        public AbpPermissionsBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpPermissionsBuilder WithId(Int64 id)
        {
            return Set(x => x.Id, id);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpPermissionsBuilder WithName(String name)
        {
            return Set(x => x.Name, name);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpPermissionsBuilder WithIsGranted(Boolean isGranted)
        {
            return Set(x => x.IsGranted, isGranted);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpPermissionsBuilder WithCreationTime(DateTime creationTime)
        {
            return Set(x => x.CreationTime, creationTime);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpPermissionsBuilder WithCreatorUserId(Int64? creatorUserId)
        {
            return Set(x => x.CreatorUserId, creatorUserId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpPermissionsBuilder WithRoleId(Int32? roleId)
        {
            return Set(x => x.RoleId, roleId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpPermissionsBuilder WithUserId(Int64? userId)
        {
            return Set(x => x.UserId, userId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpPermissionsBuilder WithDiscriminator(String discriminator)
        {
            return Set(x => x.Discriminator, discriminator);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpPermissionsBuilder WithTenantId(Int32? tenantId)
        {
            return Set(x => x.TenantId, tenantId);
        }



        protected override Entities.AbpPermissions BuildObject()
        {
            return Entities.AbpPermissions.Create(

      Get(x => x.Name),
      Get(x => x.IsGranted),
      Get(x => x.CreationTime),
      Get(x => x.Discriminator),
      Get(x => x.CreatorUserId),
      Get(x => x.RoleId),
      Get(x => x.UserId),
      Get(x => x.TenantId));
        }

    }

    public class AbpRolesBuilder : TestDataBuilder<Entities.AbpRoles, AbpRolesBuilder>
    {

        public AbpRolesBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpRolesBuilder WithId(Int32 id)
        {
            return Set(x => x.Id, id);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpRolesBuilder WithTenantId(Int32? tenantId)
        {
            return Set(x => x.TenantId, tenantId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpRolesBuilder WithName(String name)
        {
            return Set(x => x.Name, name);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpRolesBuilder WithDisplayName(String displayName)
        {
            return Set(x => x.DisplayName, displayName);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpRolesBuilder WithIsStatic(Boolean isStatic)
        {
            return Set(x => x.IsStatic, isStatic);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpRolesBuilder WithIsDefault(Boolean isDefault)
        {
            return Set(x => x.IsDefault, isDefault);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpRolesBuilder WithIsDeleted(Boolean isDeleted)
        {
            return Set(x => x.IsDeleted, isDeleted);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpRolesBuilder WithDeleterUserId(Int64? deleterUserId)
        {
            return Set(x => x.DeleterUserId, deleterUserId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpRolesBuilder WithDeletionTime(DateTime? deletionTime)
        {
            return Set(x => x.DeletionTime, deletionTime);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpRolesBuilder WithLastModificationTime(DateTime? lastModificationTime)
        {
            return Set(x => x.LastModificationTime, lastModificationTime);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpRolesBuilder WithLastModifierUserId(Int64? lastModifierUserId)
        {
            return Set(x => x.LastModifierUserId, lastModifierUserId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpRolesBuilder WithCreationTime(DateTime creationTime)
        {
            return Set(x => x.CreationTime, creationTime);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpRolesBuilder WithCreatorUserId(Int64? creatorUserId)
        {
            return Set(x => x.CreatorUserId, creatorUserId);
        }



        protected override Entities.AbpRoles BuildObject()
        {
            return Entities.AbpRoles.Create(

      Get(x => x.Name),
      Get(x => x.DisplayName),
      Get(x => x.IsStatic),
      Get(x => x.IsDefault),
      Get(x => x.IsDeleted),
      Get(x => x.CreationTime),
      Get(x => x.TenantId),
      Get(x => x.DeleterUserId),
      Get(x => x.DeletionTime),
      Get(x => x.LastModificationTime),
      Get(x => x.LastModifierUserId),
      Get(x => x.CreatorUserId));
        }

    }

    public class AbpUsersBuilder : TestDataBuilder<Entities.AbpUsers, AbpUsersBuilder>
    {

        public AbpUsersBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUsersBuilder WithId(Int64 id)
        {
            return Set(x => x.Id, id);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUsersBuilder WithTenantId(Int32? tenantId)
        {
            return Set(x => x.TenantId, tenantId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUsersBuilder WithAuthenticationSource(String authenticationSource)
        {
            return Set(x => x.AuthenticationSource, authenticationSource);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUsersBuilder WithName(String name)
        {
            return Set(x => x.Name, name);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUsersBuilder WithSurname(String surname)
        {
            return Set(x => x.Surname, surname);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUsersBuilder WithUserName(String userName)
        {
            return Set(x => x.UserName, userName);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUsersBuilder WithPassword(String password)
        {
            return Set(x => x.Password, password);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUsersBuilder WithEmailAddress(String emailAddress)
        {
            return Set(x => x.EmailAddress, emailAddress);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUsersBuilder WithIsEmailConfirmed(Boolean isEmailConfirmed)
        {
            return Set(x => x.IsEmailConfirmed, isEmailConfirmed);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUsersBuilder WithEmailConfirmationCode(String emailConfirmationCode)
        {
            return Set(x => x.EmailConfirmationCode, emailConfirmationCode);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUsersBuilder WithPasswordResetCode(String passwordResetCode)
        {
            return Set(x => x.PasswordResetCode, passwordResetCode);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUsersBuilder WithLastLoginTime(DateTime? lastLoginTime)
        {
            return Set(x => x.LastLoginTime, lastLoginTime);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUsersBuilder WithIsActive(Boolean isActive)
        {
            return Set(x => x.IsActive, isActive);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUsersBuilder WithIsDeleted(Boolean isDeleted)
        {
            return Set(x => x.IsDeleted, isDeleted);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUsersBuilder WithDeleterUserId(Int64? deleterUserId)
        {
            return Set(x => x.DeleterUserId, deleterUserId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUsersBuilder WithDeletionTime(DateTime? deletionTime)
        {
            return Set(x => x.DeletionTime, deletionTime);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUsersBuilder WithLastModificationTime(DateTime? lastModificationTime)
        {
            return Set(x => x.LastModificationTime, lastModificationTime);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUsersBuilder WithLastModifierUserId(Int64? lastModifierUserId)
        {
            return Set(x => x.LastModifierUserId, lastModifierUserId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUsersBuilder WithCreationTime(DateTime creationTime)
        {
            return Set(x => x.CreationTime, creationTime);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUsersBuilder WithCreatorUserId(Int64? creatorUserId)
        {
            return Set(x => x.CreatorUserId, creatorUserId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUsersBuilder WithLockoutEndDateUtc(DateTime? lockoutEndDateUtc)
        {
            return Set(x => x.LockoutEndDateUtc, lockoutEndDateUtc);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUsersBuilder WithAccessFailedCount(Int32 accessFailedCount)
        {
            return Set(x => x.AccessFailedCount, accessFailedCount);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUsersBuilder WithIsLockoutEnabled(Boolean isLockoutEnabled)
        {
            return Set(x => x.IsLockoutEnabled, isLockoutEnabled);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUsersBuilder WithPhoneNumber(String phoneNumber)
        {
            return Set(x => x.PhoneNumber, phoneNumber);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUsersBuilder WithIsPhoneNumberConfirmed(Boolean isPhoneNumberConfirmed)
        {
            return Set(x => x.IsPhoneNumberConfirmed, isPhoneNumberConfirmed);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUsersBuilder WithSecurityStamp(String securityStamp)
        {
            return Set(x => x.SecurityStamp, securityStamp);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUsersBuilder WithIsTwoFactorEnabled(Boolean isTwoFactorEnabled)
        {
            return Set(x => x.IsTwoFactorEnabled, isTwoFactorEnabled);
        }


        protected override Entities.AbpUsers BuildObject()
        {
            return Entities.AbpUsers.Create(

      Get(x => x.Name),
      Get(x => x.Surname),
      Get(x => x.UserName),
      Get(x => x.Password),
      Get(x => x.EmailAddress),
      Get(x => x.IsEmailConfirmed),
      Get(x => x.IsActive),
      Get(x => x.IsDeleted),
      Get(x => x.CreationTime),
      Get(x => x.AccessFailedCount),
      Get(x => x.IsLockoutEnabled),
      Get(x => x.IsPhoneNumberConfirmed),
      Get(x => x.IsTwoFactorEnabled),
      Get(x => x.TenantId),
      Get(x => x.AuthenticationSource),
      Get(x => x.EmailConfirmationCode),
      Get(x => x.PasswordResetCode),
      Get(x => x.LastLoginTime),
      Get(x => x.DeleterUserId),
      Get(x => x.DeletionTime),
      Get(x => x.LastModificationTime),
      Get(x => x.LastModifierUserId),
      Get(x => x.CreatorUserId),
      Get(x => x.LockoutEndDateUtc),
      Get(x => x.PhoneNumber),
      Get(x => x.SecurityStamp));
        }

    }

    public class AbpUserRolesBuilder : TestDataBuilder<Entities.AbpUserRoles, AbpUserRolesBuilder>
    {

        public AbpUserRolesBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUserRolesBuilder WithId(Int64 id)
        {
            return Set(x => x.Id, id);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUserRolesBuilder WithUserId(Int64 userId)
        {
            return Set(x => x.UserId, userId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUserRolesBuilder WithRoleId(Int32 roleId)
        {
            return Set(x => x.RoleId, roleId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUserRolesBuilder WithCreationTime(DateTime creationTime)
        {
            return Set(x => x.CreationTime, creationTime);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUserRolesBuilder WithCreatorUserId(Int64? creatorUserId)
        {
            return Set(x => x.CreatorUserId, creatorUserId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpUserRolesBuilder WithTenantId(Int32? tenantId)
        {
            return Set(x => x.TenantId, tenantId);
        }



        protected override Entities.AbpUserRoles BuildObject()
        {
            return Entities.AbpUserRoles.Create(

      Get(x => x.UserId),
      Get(x => x.RoleId),
      Get(x => x.CreationTime),
      Get(x => x.CreatorUserId),
      Get(x => x.TenantId));
        }

    }

    public class AbpTenantsBuilder : TestDataBuilder<Entities.AbpTenants, AbpTenantsBuilder>
    {

        public AbpTenantsBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpTenantsBuilder WithId(Int32 id)
        {
            return Set(x => x.Id, id);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpTenantsBuilder WithTenancyName(String tenancyName)
        {
            return Set(x => x.TenancyName, tenancyName);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpTenantsBuilder WithName(String name)
        {
            return Set(x => x.Name, name);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpTenantsBuilder WithIsActive(Boolean isActive)
        {
            return Set(x => x.IsActive, isActive);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpTenantsBuilder WithIsDeleted(Boolean isDeleted)
        {
            return Set(x => x.IsDeleted, isDeleted);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpTenantsBuilder WithDeleterUserId(Int64? deleterUserId)
        {
            return Set(x => x.DeleterUserId, deleterUserId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpTenantsBuilder WithDeletionTime(DateTime? deletionTime)
        {
            return Set(x => x.DeletionTime, deletionTime);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpTenantsBuilder WithLastModificationTime(DateTime? lastModificationTime)
        {
            return Set(x => x.LastModificationTime, lastModificationTime);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpTenantsBuilder WithLastModifierUserId(Int64? lastModifierUserId)
        {
            return Set(x => x.LastModifierUserId, lastModifierUserId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpTenantsBuilder WithCreationTime(DateTime creationTime)
        {
            return Set(x => x.CreationTime, creationTime);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbpTenantsBuilder WithCreatorUserId(Int64? creatorUserId)
        {
            return Set(x => x.CreatorUserId, creatorUserId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpTenantsBuilder WithEditionId(Int32? editionId)
        {
            return Set(x => x.EditionId, editionId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbpTenantsBuilder WithConnectionString(String connectionString)
        {
            return Set(x => x.ConnectionString, connectionString);
        }


        protected override Entities.AbpTenants BuildObject()
        {
            return Entities.AbpTenants.Create(

      Get(x => x.TenancyName),
      Get(x => x.Name),
      Get(x => x.IsActive),
      Get(x => x.IsDeleted),
      Get(x => x.CreationTime),
      Get(x => x.DeleterUserId),
      Get(x => x.DeletionTime),
      Get(x => x.LastModificationTime),
      Get(x => x.LastModifierUserId),
      Get(x => x.CreatorUserId),
      Get(x => x.EditionId),
      Get(x => x.ConnectionString));
        }

    }

    public class PatientReviewOfSystemBuilder : TestDataBuilder<Entities.PatientReviewOfSystem, PatientReviewOfSystemBuilder>
    {

        public PatientReviewOfSystemBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PatientReviewOfSystemBuilder WithId(Int64 id)
        {
            return Set(x => x.Id, id);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientReviewOfSystemBuilder WithPid(Int64 pid)
        {
            return Set(x => x.Pid, pid);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientReviewOfSystemBuilder WithVisitId(Int64 visitId)
        {
            return Set(x => x.VisitId, visitId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientReviewOfSystemBuilder WithTenantId(Int32 tenantId)
        {
            return Set(x => x.TenantId, tenantId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientReviewOfSystemBuilder WithReviewOfSystemCodeId(Int32 reviewOfSystemCodeId)
        {
            return Set(x => x.ReviewOfSystemCodeId, reviewOfSystemCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientReviewOfSystemBuilder WithNormalLimits(Boolean normalLimits)
        {
            return Set(x => x.NormalLimits, normalLimits);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientReviewOfSystemBuilder WithNote(String note)
        {
            return Set(x => x.Note, note);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientReviewOfSystemBuilder WithCreateDate(DateTime createDate)
        {
            return Set(x => x.CreateDate, createDate);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PatientReviewOfSystemBuilder WithCreatedBy(Int64 createdBy)
        {
            return Set(x => x.CreatedBy, createdBy);
        }


        protected override Entities.PatientReviewOfSystem BuildObject()
        {
            return Entities.PatientReviewOfSystem.Create(

      Get(x => x.Pid),
      Get(x => x.VisitId),
      Get(x => x.TenantId),
      Get(x => x.ReviewOfSystemCodeId),
      Get(x => x.NormalLimits),
      Get(x => x.CreateDate),
      Get(x => x.CreatedBy),
      Get(x => x.Note));
        }

    }

    public class PrescriptionBuilder : TestDataBuilder<Entities.Prescription, PrescriptionBuilder>
    {

        public PrescriptionBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionBuilder WithPrescriptionId(Int64 prescriptionId)
        {
            return Set(x => x.PrescriptionId, prescriptionId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionBuilder WithPid(Int64 pid)
        {
            return Set(x => x.Pid, pid);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionBuilder WithVisitId(Int64 visitId)
        {
            return Set(x => x.VisitId, visitId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionBuilder WithArchived(Boolean archived)
        {
            return Set(x => x.Archived, archived);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionBuilder WithParentId(Int64? parentId)
        {
            return Set(x => x.ParentId, parentId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionBuilder WithTenantId(Int32 tenantId)
        {
            return Set(x => x.TenantId, tenantId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionBuilder WithDrugId(Int32 drugId)
        {
            return Set(x => x.DrugId, drugId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionBuilder WithRxNormName(String rxNormName)
        {
            return Set(x => x.RxNormName, rxNormName);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionBuilder WithDoseUnitCodeId(Int32 doseUnitCodeId)
        {
            return Set(x => x.DoseUnitCodeId, doseUnitCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionBuilder WithDoseSize(Single doseSize)
        {
            return Set(x => x.DoseSize, doseSize);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionBuilder WithDosage(Int32 dosage)
        {
            return Set(x => x.Dosage, dosage);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionBuilder WithFrequencyCodeId(Int32 frequencyCodeId)
        {
            return Set(x => x.FrequencyCodeId, frequencyCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionBuilder WithDrugRouteCodeId(Int32 drugRouteCodeId)
        {
            return Set(x => x.DrugRouteCodeId, drugRouteCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionBuilder WithDrugFormCodeId(Int32 drugFormCodeId)
        {
            return Set(x => x.DrugFormCodeId, drugFormCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionBuilder WithQuantity(Int32 quantity)
        {
            return Set(x => x.Quantity, quantity);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionBuilder WithRefills(Int32? refills)
        {
            return Set(x => x.Refills, refills);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionBuilder WithProviderId(Int32 providerId)
        {
            return Set(x => x.ProviderId, providerId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionBuilder WithStartDate(DateTime startDate)
        {
            return Set(x => x.StartDate, startDate);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionBuilder WithDuration(Int32 duration)
        {
            return Set(x => x.Duration, duration);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionBuilder WithEndDate(DateTime? endDate)
        {
            return Set(x => x.EndDate, endDate);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionBuilder WithRefillDate(DateTime? refillDate)
        {
            return Set(x => x.RefillDate, refillDate);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionBuilder WithTherapyCodeId(Int32 therapyCodeId)
        {
            return Set(x => x.TherapyCodeId, therapyCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionBuilder WithSubstitutionAllowed(Boolean substitutionAllowed)
        {
            return Set(x => x.SubstitutionAllowed, substitutionAllowed);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionBuilder WithNote(String note)
        {
            return Set(x => x.Note, note);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionBuilder WithStatusCodeId(Int32? statusCodeId)
        {
            return Set(x => x.StatusCodeId, statusCodeId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionBuilder WithCreateDate(DateTime createDate)
        {
            return Set(x => x.CreateDate, createDate);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionBuilder WithUpdateDate(DateTime? updateDate)
        {
            return Set(x => x.UpdateDate, updateDate);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionBuilder WithCreatedBy(Int64 createdBy)
        {
            return Set(x => x.CreatedBy, createdBy);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionBuilder WithUpdatedBy(Int64? updatedBy)
        {
            return Set(x => x.UpdatedBy, updatedBy);
        }



        protected override Entities.Prescription BuildObject()
        {
            return Entities.Prescription.Create(

      Get(x => x.Pid),
      Get(x => x.VisitId),
      Get(x => x.Archived),
      Get(x => x.TenantId),
      Get(x => x.DrugId),
      Get(x => x.DoseUnitCodeId),
      Get(x => x.DoseSize),
      Get(x => x.Dosage),
      Get(x => x.FrequencyCodeId),
      Get(x => x.DrugRouteCodeId),
      Get(x => x.DrugFormCodeId),
      Get(x => x.Quantity),
      Get(x => x.ProviderId),
      Get(x => x.StartDate),
      Get(x => x.Duration),
      Get(x => x.TherapyCodeId),
      Get(x => x.SubstitutionAllowed),
      Get(x => x.CreateDate),
      Get(x => x.CreatedBy),
      Get(x => x.ParentId),
      Get(x => x.RxNormName),
      Get(x => x.Refills),
      Get(x => x.EndDate),
      Get(x => x.RefillDate),
      Get(x => x.Note),
      Get(x => x.StatusCodeId),
      Get(x => x.UpdateDate),
      Get(x => x.UpdatedBy));
        }

    }

    public class AbnormalCodeBuilder : TestDataBuilder<Entities.AbnormalCode, AbnormalCodeBuilder>
    {

        public AbnormalCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AbnormalCodeBuilder WithAbnormalCodeId(Int32 abnormalCodeId)
        {
            return Set(x => x.AbnormalCodeId, abnormalCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AbnormalCodeBuilder WithAbnormalCodeName(String abnormalCodeName)
        {
            return Set(x => x.AbnormalCodeName, abnormalCodeName);
        }


        protected override Entities.AbnormalCode BuildObject()
        {
            return Entities.AbnormalCode.Create(

      Get(x => x.AbnormalCodeName));
        }

    }

    public class AdministrationSiteBuilder : TestDataBuilder<Entities.AdministrationSite, AdministrationSiteBuilder>
    {

        public AdministrationSiteBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AdministrationSiteBuilder WithAdministrationSiteId(Int32 administrationSiteId)
        {
            return Set(x => x.AdministrationSiteId, administrationSiteId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AdministrationSiteBuilder WithAdministrationSiteName(String administrationSiteName)
        {
            return Set(x => x.AdministrationSiteName, administrationSiteName);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AdministrationSiteBuilder WithTenantId(Int32 tenantId)
        {
            return Set(x => x.TenantId, tenantId);
        }


        protected override Entities.AdministrationSite BuildObject()
        {
            return Entities.AdministrationSite.Create(

      Get(x => x.AdministrationSiteName),
      Get(x => x.TenantId));
        }

    }

    public class PrescriptionConditionBuilder : TestDataBuilder<Entities.PrescriptionCondition, PrescriptionConditionBuilder>
    {

        public PrescriptionConditionBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionConditionBuilder WithPrescriptionId(Int64 prescriptionId)
        {
            return Set(x => x.PrescriptionId, prescriptionId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionConditionBuilder WithICDCodeCNId(String iCDCodeCNId)
        {
            return Set(x => x.ICDCodeCNId, iCDCodeCNId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PrescriptionConditionBuilder WithPrimaryCondition(Boolean primaryCondition)
        {
            return Set(x => x.PrimaryCondition, primaryCondition);
        }


        protected override Entities.PrescriptionCondition BuildObject()
        {
            return Entities.PrescriptionCondition.Create(

      Get(x => x.PrescriptionId),
      Get(x => x.ICDCodeCNId),
      Get(x => x.PrimaryCondition));
        }

    }

    public class AllergyCategoryCodeBuilder : TestDataBuilder<Entities.AllergyCategoryCode, AllergyCategoryCodeBuilder>
    {

        public AllergyCategoryCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AllergyCategoryCodeBuilder WithAllergyCategoryCodeId(Int32 allergyCategoryCodeId)
        {
            return Set(x => x.AllergyCategoryCodeId, allergyCategoryCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AllergyCategoryCodeBuilder WithCategoryName(String categoryName)
        {
            return Set(x => x.CategoryName, categoryName);
        }


        protected override Entities.AllergyCategoryCode BuildObject()
        {
            return Entities.AllergyCategoryCode.Create(

      Get(x => x.AllergyCategoryCodeId),
      Get(x => x.CategoryName));
        }

    }

    public class PriorityCodeBuilder : TestDataBuilder<Entities.PriorityCode, PriorityCodeBuilder>
    {

        public PriorityCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual PriorityCodeBuilder WithPriorityCodeId(Int32 priorityCodeId)
        {
            return Set(x => x.PriorityCodeId, priorityCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual PriorityCodeBuilder WithPriorityCodeName(String priorityCodeName)
        {
            return Set(x => x.PriorityCodeName, priorityCodeName);
        }


        protected override Entities.PriorityCode BuildObject()
        {
            return Entities.PriorityCode.Create(

      Get(x => x.PriorityCodeName));
        }

    }

    public class AllergyCodeBuilder : TestDataBuilder<Entities.AllergyCode, AllergyCodeBuilder>
    {

        public AllergyCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AllergyCodeBuilder WithAllergyCodeId(Int32 allergyCodeId)
        {
            return Set(x => x.AllergyCodeId, allergyCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AllergyCodeBuilder WithAllergyName(String allergyName)
        {
            return Set(x => x.AllergyName, allergyName);
        }


        protected override Entities.AllergyCode BuildObject()
        {
            return Entities.AllergyCode.Create(

      Get(x => x.AllergyCodeId),
      Get(x => x.AllergyName));
        }

    }

    public class ProcedureOrderBuilder : TestDataBuilder<Entities.ProcedureOrder, ProcedureOrderBuilder>
    {

        public ProcedureOrderBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual ProcedureOrderBuilder WithId(Int64 id)
        {
            return Set(x => x.Id, id);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ProcedureOrderBuilder WithPid(Int64 pid)
        {
            return Set(x => x.Pid, pid);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ProcedureOrderBuilder WithVisitId(Int64 visitId)
        {
            return Set(x => x.VisitId, visitId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ProcedureOrderBuilder WithTenantId(Int32 tenantId)
        {
            return Set(x => x.TenantId, tenantId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ProcedureOrderBuilder WithPriorityCodeId(Int32 priorityCodeId)
        {
            return Set(x => x.PriorityCodeId, priorityCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ProcedureOrderBuilder WithOrderDate(DateTime orderDate)
        {
            return Set(x => x.OrderDate, orderDate);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ProcedureOrderBuilder WithOrderdById(Int64 orderdById)
        {
            return Set(x => x.OrderdById, orderdById);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ProcedureOrderBuilder WithLoincCodeId(String loincCodeId)
        {
            return Set(x => x.LoincCodeId, loincCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ProcedureOrderBuilder WithNote(String note)
        {
            return Set(x => x.Note, note);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ProcedureOrderBuilder WithStatusCodeId(Int32 statusCodeId)
        {
            return Set(x => x.StatusCodeId, statusCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ProcedureOrderBuilder WithCreateDate(DateTime createDate)
        {
            return Set(x => x.CreateDate, createDate);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ProcedureOrderBuilder WithUpdateDate(DateTime updateDate)
        {
            return Set(x => x.UpdateDate, updateDate);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ProcedureOrderBuilder WithCreatedBy(Int64 createdBy)
        {
            return Set(x => x.CreatedBy, createdBy);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ProcedureOrderBuilder WithUpdatedBy(Int64 updatedBy)
        {
            return Set(x => x.UpdatedBy, updatedBy);
        }


        protected override Entities.ProcedureOrder BuildObject()
        {
            return Entities.ProcedureOrder.Create(

      Get(x => x.Pid),
      Get(x => x.VisitId),
      Get(x => x.TenantId),
      Get(x => x.PriorityCodeId),
      Get(x => x.OrderDate),
      Get(x => x.OrderdById),
      Get(x => x.LoincCodeId),
      Get(x => x.StatusCodeId),
      Get(x => x.CreateDate),
      Get(x => x.UpdateDate),
      Get(x => x.CreatedBy),
      Get(x => x.UpdatedBy),
      Get(x => x.Note));
        }

    }

    public class AllergyReactionCodeBuilder : TestDataBuilder<Entities.AllergyReactionCode, AllergyReactionCodeBuilder>
    {

        public AllergyReactionCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AllergyReactionCodeBuilder WithReactionTypeId(Int32 reactionTypeId)
        {
            return Set(x => x.ReactionTypeId, reactionTypeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AllergyReactionCodeBuilder WithReactionName(String reactionName)
        {
            return Set(x => x.ReactionName, reactionName);
        }


        protected override Entities.AllergyReactionCode BuildObject()
        {
            return Entities.AllergyReactionCode.Create(

      Get(x => x.ReactionTypeId),
      Get(x => x.ReactionName));
        }

    }

    public class RelationshipCodeBuilder : TestDataBuilder<Entities.RelationshipCode, RelationshipCodeBuilder>
    {

        public RelationshipCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual RelationshipCodeBuilder WithRelationshipCodeId(Int32 relationshipCodeId)
        {
            return Set(x => x.RelationshipCodeId, relationshipCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual RelationshipCodeBuilder WithRelationshipCodeName(String relationshipCodeName)
        {
            return Set(x => x.RelationshipCodeName, relationshipCodeName);
        }


        protected override Entities.RelationshipCode BuildObject()
        {
            return Entities.RelationshipCode.Create(

      Get(x => x.RelationshipCodeName));
        }

    }

    public class AllergySeverityCodeBuilder : TestDataBuilder<Entities.AllergySeverityCode, AllergySeverityCodeBuilder>
    {

        public AllergySeverityCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AllergySeverityCodeBuilder WithAllergySeverityCodeId(Int32 allergySeverityCodeId)
        {
            return Set(x => x.AllergySeverityCodeId, allergySeverityCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AllergySeverityCodeBuilder WithAllergySeverityCodeName(String allergySeverityCodeName)
        {
            return Set(x => x.AllergySeverityCodeName, allergySeverityCodeName);
        }


        protected override Entities.AllergySeverityCode BuildObject()
        {
            return Entities.AllergySeverityCode.Create(

      Get(x => x.AllergySeverityCodeId),
      Get(x => x.AllergySeverityCodeName));
        }

    }

    public class ResultDataCodeBuilder : TestDataBuilder<Entities.ResultDataCode, ResultDataCodeBuilder>
    {

        public ResultDataCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual ResultDataCodeBuilder WithResultDataCodeId(Int32 resultDataCodeId)
        {
            return Set(x => x.ResultDataCodeId, resultDataCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ResultDataCodeBuilder WithResultDataCodeName(String resultDataCodeName)
        {
            return Set(x => x.ResultDataCodeName, resultDataCodeName);
        }


        protected override Entities.ResultDataCode BuildObject()
        {
            return Entities.ResultDataCode.Create(

      Get(x => x.ResultDataCodeName));
        }

    }

    public class AllergyTypeCodeBuilder : TestDataBuilder<Entities.AllergyTypeCode, AllergyTypeCodeBuilder>
    {

        public AllergyTypeCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual AllergyTypeCodeBuilder WithAllergyTypeId(Int32 allergyTypeId)
        {
            return Set(x => x.AllergyTypeId, allergyTypeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AllergyTypeCodeBuilder WithAllergyTypeName(String allergyTypeName)
        {
            return Set(x => x.AllergyTypeName, allergyTypeName);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual AllergyTypeCodeBuilder WithPriority(Int32 priority)
        {
            return Set(x => x.Priority, priority);
        }


        protected override Entities.AllergyTypeCode BuildObject()
        {
            return Entities.AllergyTypeCode.Create(

      Get(x => x.AllergyTypeId),
      Get(x => x.AllergyTypeName),
      Get(x => x.Priority));
        }

    }

    public class ResultStatusCodeBuilder : TestDataBuilder<Entities.ResultStatusCode, ResultStatusCodeBuilder>
    {

        public ResultStatusCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual ResultStatusCodeBuilder WithResultStatusCodeId(Int32 resultStatusCodeId)
        {
            return Set(x => x.ResultStatusCodeId, resultStatusCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ResultStatusCodeBuilder WithResultStatusCodeName(String resultStatusCodeName)
        {
            return Set(x => x.ResultStatusCodeName, resultStatusCodeName);
        }


        protected override Entities.ResultStatusCode BuildObject()
        {
            return Entities.ResultStatusCode.Create(

      Get(x => x.ResultStatusCodeName));
        }

    }

    public class ReviewOfSystemCodeBuilder : TestDataBuilder<Entities.ReviewOfSystemCode, ReviewOfSystemCodeBuilder>
    {

        public ReviewOfSystemCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual ReviewOfSystemCodeBuilder WithReviewOfSystemCodeId(Int32 reviewOfSystemCodeId)
        {
            return Set(x => x.ReviewOfSystemCodeId, reviewOfSystemCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ReviewOfSystemCodeBuilder WithReviewOfSystemGroupCodeId(Int32 reviewOfSystemGroupCodeId)
        {
            return Set(x => x.ReviewOfSystemGroupCodeId, reviewOfSystemGroupCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ReviewOfSystemCodeBuilder WithReviewOfSystemCodeName(String reviewOfSystemCodeName)
        {
            return Set(x => x.ReviewOfSystemCodeName, reviewOfSystemCodeName);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ReviewOfSystemCodeBuilder WithIsShortCode(Boolean isShortCode)
        {
            return Set(x => x.IsShortCode, isShortCode);
        }


        protected override Entities.ReviewOfSystemCode BuildObject()
        {
            return Entities.ReviewOfSystemCode.Create(

      Get(x => x.ReviewOfSystemCodeId),
      Get(x => x.ReviewOfSystemGroupCodeId),
      Get(x => x.ReviewOfSystemCodeName),
      Get(x => x.IsShortCode));
        }

    }

    public class ReviewOfSystemGroupCodeBuilder : TestDataBuilder<Entities.ReviewOfSystemGroupCode, ReviewOfSystemGroupCodeBuilder>
    {

        public ReviewOfSystemGroupCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual ReviewOfSystemGroupCodeBuilder WithReviewOfSystemGroupCodeId(Int32 reviewOfSystemGroupCodeId)
        {
            return Set(x => x.ReviewOfSystemGroupCodeId, reviewOfSystemGroupCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ReviewOfSystemGroupCodeBuilder WithReviewOfSystemGroupCodeName(String reviewOfSystemGroupCodeName)
        {
            return Set(x => x.ReviewOfSystemGroupCodeName, reviewOfSystemGroupCodeName);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual ReviewOfSystemGroupCodeBuilder WithSortOrder(Int32 sortOrder)
        {
            return Set(x => x.SortOrder, sortOrder);
        }


        protected override Entities.ReviewOfSystemGroupCode BuildObject()
        {
            return Entities.ReviewOfSystemGroupCode.Create(

      Get(x => x.ReviewOfSystemGroupCodeId),
      Get(x => x.ReviewOfSystemGroupCodeName),
      Get(x => x.SortOrder));
        }

    }

    public class SpecimenCodeBuilder : TestDataBuilder<Entities.SpecimenCode, SpecimenCodeBuilder>
    {

        public SpecimenCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual SpecimenCodeBuilder WithSpecimenCodeId(Int32 specimenCodeId)
        {
            return Set(x => x.SpecimenCodeId, specimenCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual SpecimenCodeBuilder WithSpecimenCodeName(String specimenCodeName)
        {
            return Set(x => x.SpecimenCodeName, specimenCodeName);
        }


        protected override Entities.SpecimenCode BuildObject()
        {
            return Entities.SpecimenCode.Create(

      Get(x => x.SpecimenCodeName));
        }

    }

    public class CompletionStatusCodeBuilder : TestDataBuilder<Entities.CompletionStatusCode, CompletionStatusCodeBuilder>
    {

        public CompletionStatusCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual CompletionStatusCodeBuilder WithCompletionStatusCodeId(Int32 completionStatusCodeId)
        {
            return Set(x => x.CompletionStatusCodeId, completionStatusCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual CompletionStatusCodeBuilder WithCompletionStatusName(String completionStatusName)
        {
            return Set(x => x.CompletionStatusName, completionStatusName);
        }


        protected override Entities.CompletionStatusCode BuildObject()
        {
            return Entities.CompletionStatusCode.Create(

      Get(x => x.CompletionStatusName));
        }

    }

    public class StatusCodeBuilder : TestDataBuilder<Entities.StatusCode, StatusCodeBuilder>
    {

        public StatusCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual StatusCodeBuilder WithStatusCodeId(Int32 statusCodeId)
        {
            return Set(x => x.StatusCodeId, statusCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual StatusCodeBuilder WithStatusCodeName(String statusCodeName)
        {
            return Set(x => x.StatusCodeName, statusCodeName);
        }


        protected override Entities.StatusCode BuildObject()
        {
            return Entities.StatusCode.Create(

      Get(x => x.StatusCodeName));
        }

    }

    public class DiagnosisBuilder : TestDataBuilder<Entities.Diagnosis, DiagnosisBuilder>
    {

        public DiagnosisBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual DiagnosisBuilder WithId(Int64 id)
        {
            return Set(x => x.Id, id);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DiagnosisBuilder WithPid(Int64 pid)
        {
            return Set(x => x.Pid, pid);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DiagnosisBuilder WithVisitId(Int64 visitId)
        {
            return Set(x => x.VisitId, visitId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DiagnosisBuilder WithArchived(Boolean archived)
        {
            return Set(x => x.Archived, archived);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DiagnosisBuilder WithParentId(Int64? parentId)
        {
            return Set(x => x.ParentId, parentId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual DiagnosisBuilder WithTenantId(Int32 tenantId)
        {
            return Set(x => x.TenantId, tenantId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DiagnosisBuilder WithICDCodeCNId(String iCDCodeCNId)
        {
            return Set(x => x.ICDCodeCNId, iCDCodeCNId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DiagnosisBuilder WithDiagnosisDate(DateTime? diagnosisDate)
        {
            return Set(x => x.DiagnosisDate, diagnosisDate);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual DiagnosisBuilder WithAdministeredById(Int64? administeredById)
        {
            return Set(x => x.AdministeredById, administeredById);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual DiagnosisBuilder WithAdministrationSiteId(Int32? administrationSiteId)
        {
            return Set(x => x.AdministrationSiteId, administrationSiteId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual DiagnosisBuilder WithNote(String note)
        {
            return Set(x => x.Note, note);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DiagnosisBuilder WithStatusCodeId(Int32? statusCodeId)
        {
            return Set(x => x.StatusCodeId, statusCodeId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual DiagnosisBuilder WithCreateDate(DateTime createDate)
        {
            return Set(x => x.CreateDate, createDate);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DiagnosisBuilder WithUpdateDate(DateTime? updateDate)
        {
            return Set(x => x.UpdateDate, updateDate);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual DiagnosisBuilder WithCreatedBy(Int64 createdBy)
        {
            return Set(x => x.CreatedBy, createdBy);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DiagnosisBuilder WithUpdatedBy(Int64? updatedBy)
        {
            return Set(x => x.UpdatedBy, updatedBy);
        }



        protected override Entities.Diagnosis BuildObject()
        {
            return Entities.Diagnosis.Create(

      Get(x => x.Pid),
      Get(x => x.VisitId),
      Get(x => x.Archived),
      Get(x => x.TenantId),
      Get(x => x.ICDCodeCNId),
      Get(x => x.CreateDate),
      Get(x => x.CreatedBy),
      Get(x => x.ParentId),
      Get(x => x.DiagnosisDate),
      Get(x => x.AdministeredById),
      Get(x => x.AdministrationSiteId),
      Get(x => x.Note),
      Get(x => x.StatusCodeId),
      Get(x => x.UpdateDate),
      Get(x => x.UpdatedBy));
        }

    }

    public class SurgeryBuilder : TestDataBuilder<Entities.Surgery, SurgeryBuilder>
    {

        public SurgeryBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual SurgeryBuilder WithId(Int64 id)
        {
            return Set(x => x.Id, id);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual SurgeryBuilder WithPid(Int64 pid)
        {
            return Set(x => x.Pid, pid);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual SurgeryBuilder WithVisitId(Int64 visitId)
        {
            return Set(x => x.VisitId, visitId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual SurgeryBuilder WithArchived(Boolean archived)
        {
            return Set(x => x.Archived, archived);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual SurgeryBuilder WithParentId(Int64? parentId)
        {
            return Set(x => x.ParentId, parentId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual SurgeryBuilder WithTenantId(Int32 tenantId)
        {
            return Set(x => x.TenantId, tenantId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual SurgeryBuilder WithICDCodePCSId(String iCDCodePCSId)
        {
            return Set(x => x.ICDCodePCSId, iCDCodePCSId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual SurgeryBuilder WithSurgeryDate(DateTime? surgeryDate)
        {
            return Set(x => x.SurgeryDate, surgeryDate);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual SurgeryBuilder WithAdministeredById(Int64? administeredById)
        {
            return Set(x => x.AdministeredById, administeredById);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual SurgeryBuilder WithAdministrationSiteId(Int32? administrationSiteId)
        {
            return Set(x => x.AdministrationSiteId, administrationSiteId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual SurgeryBuilder WithOutcomeCodeId(Int32 outcomeCodeId)
        {
            return Set(x => x.OutcomeCodeId, outcomeCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual SurgeryBuilder WithNote(String note)
        {
            return Set(x => x.Note, note);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual SurgeryBuilder WithStatusCodeId(Int32? statusCodeId)
        {
            return Set(x => x.StatusCodeId, statusCodeId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual SurgeryBuilder WithCreateDate(DateTime createDate)
        {
            return Set(x => x.CreateDate, createDate);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual SurgeryBuilder WithUpdateDate(DateTime? updateDate)
        {
            return Set(x => x.UpdateDate, updateDate);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual SurgeryBuilder WithCreatedBy(Int64 createdBy)
        {
            return Set(x => x.CreatedBy, createdBy);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual SurgeryBuilder WithUpdatedBy(Int64? updatedBy)
        {
            return Set(x => x.UpdatedBy, updatedBy);
        }



        protected override Entities.Surgery BuildObject()
        {
            return Entities.Surgery.Create(

      Get(x => x.Pid),
      Get(x => x.VisitId),
      Get(x => x.Archived),
      Get(x => x.TenantId),
      Get(x => x.ICDCodePCSId),
      Get(x => x.OutcomeCodeId),
      Get(x => x.CreateDate),
      Get(x => x.CreatedBy),
      Get(x => x.ParentId),
      Get(x => x.SurgeryDate),
      Get(x => x.AdministeredById),
      Get(x => x.AdministrationSiteId),
      Get(x => x.Note),
      Get(x => x.StatusCodeId),
      Get(x => x.UpdateDate),
      Get(x => x.UpdatedBy));
        }

    }

    public class DocumentBuilder : TestDataBuilder<Entities.Document, DocumentBuilder>
    {

        public DocumentBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual DocumentBuilder WithId(Int64 id)
        {
            return Set(x => x.Id, id);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DocumentBuilder WithPid(Int64 pid)
        {
            return Set(x => x.Pid, pid);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DocumentBuilder WithTenantId(Int32 tenantId)
        {
            return Set(x => x.TenantId, tenantId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DocumentBuilder WithDocumentTypeCodeId(Int32 documentTypeCodeId)
        {
            return Set(x => x.DocumentTypeCodeId, documentTypeCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DocumentBuilder WithDocumentCategoryCodeId(Int32 documentCategoryCodeId)
        {
            return Set(x => x.DocumentCategoryCodeId, documentCategoryCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DocumentBuilder WithServerFileName(String serverFileName)
        {
            return Set(x => x.ServerFileName, serverFileName);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DocumentBuilder WithDocumentDescription(String documentDescription)
        {
            return Set(x => x.DocumentDescription, documentDescription);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DocumentBuilder WithNote(String note)
        {
            return Set(x => x.Note, note);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DocumentBuilder WithStatusCodeId(Int32? statusCodeId)
        {
            return Set(x => x.StatusCodeId, statusCodeId);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual DocumentBuilder WithCreateDate(DateTime createDate)
        {
            return Set(x => x.CreateDate, createDate);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DocumentBuilder WithUpdateDate(DateTime? updateDate)
        {
            return Set(x => x.UpdateDate, updateDate);
        }


        /// <summary>
        /// 
        /// </summary>
        public virtual DocumentBuilder WithCreatedBy(Int64 createdBy)
        {
            return Set(x => x.CreatedBy, createdBy);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual DocumentBuilder WithUpdatedBy(Int64? updatedBy)
        {
            return Set(x => x.UpdatedBy, updatedBy);
        }



        protected override Entities.Document BuildObject()
        {
            return Entities.Document.Create(

      Get(x => x.Pid),
      Get(x => x.TenantId),
      Get(x => x.DocumentTypeCodeId),
      Get(x => x.DocumentCategoryCodeId),
      Get(x => x.ServerFileName),
      Get(x => x.CreateDate),
      Get(x => x.CreatedBy),
      Get(x => x.DocumentDescription),
      Get(x => x.Note),
      Get(x => x.StatusCodeId),
      Get(x => x.UpdateDate),
      Get(x => x.UpdatedBy));
        }

    }

    public class TherapyCodeBuilder : TestDataBuilder<Entities.TherapyCode, TherapyCodeBuilder>
    {

        public TherapyCodeBuilder()
        {

        }


        /// <summary>
        /// 
        /// </summary>
        public virtual TherapyCodeBuilder WithTherapyCodeId(Int32 therapyCodeId)
        {
            return Set(x => x.TherapyCodeId, therapyCodeId);
        }

        /// <summary>
        /// 
        /// </summary>
        public virtual TherapyCodeBuilder WithTherapyCodeName(String therapyCodeName)
        {
            return Set(x => x.TherapyCodeName, therapyCodeName);
        }


        protected override Entities.TherapyCode BuildObject()
        {
            return Entities.TherapyCode.Create(

      Get(x => x.TherapyCodeName));
        }

    }

}
