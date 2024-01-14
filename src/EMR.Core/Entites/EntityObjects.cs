using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using System.Runtime.Serialization;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;

namespace EMR.Entities
{

    [Serializable]
    [DataContract]
    [Table("DocumentCategoryCode")]
    public partial class DocumentCategoryCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected DocumentCategoryCode()
    {

    }
        public static  DocumentCategoryCode Create(
                        String documentCategoryCodeName)
    {
        var @objectToReturn = new DocumentCategoryCode
        {
          

            DocumentCategoryCodeName = documentCategoryCodeName
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DocumentCategoryCodeId")]
        [DataMember]
        [Key]
        public virtual Int32 DocumentCategoryCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DocumentCategoryCodeName")]
        [DataMember]
        [Required]
        [StringLength(100)]
        public virtual String DocumentCategoryCodeName { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("DocumentOrderResult")]
    public partial class DocumentOrderResult
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected DocumentOrderResult()
    {

    }
        public static  DocumentOrderResult Create(
                        Int64 orderResultId)
    {
        var @objectToReturn = new DocumentOrderResult
        {
          

            OrderResultId = orderResultId
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DocumentId")]
        [DataMember]
        [Key]
        public virtual Int64 DocumentId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("OrderResultId")]
        [DataMember]
        [Required]
        
        public virtual Int64 OrderResultId { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("Visit")]
    public partial class Visit
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected Visit()
    {

    }
        public static  Visit Create(
                        Int64 pid,
                        Int32 tenantId,
                        Int32 visitStatusCodeId,
                        Int32 visitCodeId,
                        Int64 doctorId,
                        Int64 nurseId,
                        DateTime createDate,
                        DateTime updateDate,
                        Int64 createdBy,
                        Int64 updatedBy,
                        Int32? administrationSiteId= null,
                        String reason= null)
    {
        var @objectToReturn = new Visit
        {
          

            Pid = pid,
            TenantId = tenantId,
            VisitStatusCodeId = visitStatusCodeId,
            VisitCodeId = visitCodeId,
            AdministrationSiteId = administrationSiteId,
            DoctorId = doctorId,
            NurseId = nurseId,
            Reason = reason,
            CreateDate = createDate,
            UpdateDate = updateDate,
            CreatedBy = createdBy,
            UpdatedBy = updatedBy
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Id")]
        [DataMember]
        [Key]
        public virtual Int64 Id { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Pid")]
        [DataMember]
        [Required]
        
        public virtual Int64 Pid { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        [Required]
        
        public virtual Int32 TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("VisitStatusCodeId")]
        [DataMember]
        [Required]
        
        public virtual Int32 VisitStatusCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("VisitCodeId")]
        [DataMember]
        [Required]
        
        public virtual Int32 VisitCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AdministrationSiteId")]
        [DataMember]
        
        public virtual Int32? AdministrationSiteId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DoctorId")]
        [DataMember]
        [Required]
        
        public virtual Int64 DoctorId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("NurseId")]
        [DataMember]
        [Required]
        
        public virtual Int64 NurseId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Reason")]
        [DataMember]
        [StringLength(1500)]
        public virtual String Reason { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreateDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime CreateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdateDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime UpdateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatedBy")]
        [DataMember]
        [Required]
        
        public virtual Int64 CreatedBy { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdatedBy")]
        [DataMember]
        [Required]
        
        public virtual Int64 UpdatedBy { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("DocumentTypeCode")]
    public partial class DocumentTypeCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected DocumentTypeCode()
    {

    }
        public static  DocumentTypeCode Create(
                        String documentTypeCodeName)
    {
        var @objectToReturn = new DocumentTypeCode
        {
          

            DocumentTypeCodeName = documentTypeCodeName
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DocumentTypeCodeId")]
        [DataMember]
        [Key]
        public virtual Int32 DocumentTypeCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DocumentTypeCodeName")]
        [DataMember]
        [Required]
        [StringLength(100)]
        public virtual String DocumentTypeCodeName { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("VisitCode")]
    public partial class VisitCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected VisitCode()
    {

    }
        public static  VisitCode Create(
                        String visitCodeName)
    {
        var @objectToReturn = new VisitCode
        {
          

            VisitCodeName = visitCodeName
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("VisitCodeId")]
        [DataMember]
        [Key]
        public virtual Int32 VisitCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("VisitCodeName")]
        [DataMember]
        [Required]
        [StringLength(100)]
        public virtual String VisitCodeName { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("DoseUnitCode")]
    public partial class DoseUnitCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected DoseUnitCode()
    {

    }
        public static  DoseUnitCode Create(
                        String doseUnitCodeName)
    {
        var @objectToReturn = new DoseUnitCode
        {
          

            DoseUnitCodeName = doseUnitCodeName
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DoseUnitCodeId")]
        [DataMember]
        [Key]
        public virtual Int32 DoseUnitCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DoseUnitCodeName")]
        [DataMember]
        [Required]
        [StringLength(100)]
        public virtual String DoseUnitCodeName { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("VisitNote")]
    public partial class VisitNote
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected VisitNote()
    {

    }
        public static  VisitNote Create(
                        Int64 pid,
                        Int32 tenantId,
                        Int64 visitId,
                        DateTime createDate,
                        DateTime updateDate,
                        Int64 createdBy,
                        Int64 updatedBy,
                        String note= null)
    {
        var @objectToReturn = new VisitNote
        {
          

            Pid = pid,
            TenantId = tenantId,
            VisitId = visitId,
            Note = note,
            CreateDate = createDate,
            UpdateDate = updateDate,
            CreatedBy = createdBy,
            UpdatedBy = updatedBy
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Id")]
        [DataMember]
        [Key]
        public virtual Int64 Id { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Pid")]
        [DataMember]
        [Required]
        
        public virtual Int64 Pid { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        [Required]
        
        public virtual Int32 TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("VisitId")]
        [DataMember]
        [Required]
        
        public virtual Int64 VisitId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Note")]
        [DataMember]
        [StringLength(2147483647)]
        public virtual String Note { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreateDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime CreateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdateDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime UpdateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatedBy")]
        [DataMember]
        [Required]
        
        public virtual Int64 CreatedBy { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdatedBy")]
        [DataMember]
        [Required]
        
        public virtual Int64 UpdatedBy { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("DrugCode")]
    public partial class DrugCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected DrugCode()
    {

    }
        public static  DrugCode Create(
                        Int32 id,
                        String name,
                        String sideEffect,
                        String doseUnit,
                        Single minDoseSize,
                        Single maxDoseSize)
    {
        var @objectToReturn = new DrugCode
        {
          
            Id = id,
            Name = name,
            SideEffect = sideEffect,
            DoseUnit = doseUnit,
            MinDoseSize = minDoseSize,
            MaxDoseSize = maxDoseSize
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Id")]
        [DataMember]
        
        [Key]
        public virtual Int32 Id { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Name")]
        [DataMember]
        [Required]
        [StringLength(1000)]
        public virtual String Name { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("SideEffect")]
        [DataMember]
        [Required]
        [StringLength(2147483647)]
        public virtual String SideEffect { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DoseUnit")]
        [DataMember]
        [Required]
        [StringLength(25)]
        public virtual String DoseUnit { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("MinDoseSize")]
        [DataMember]
        [Required]
        
        public virtual Single MinDoseSize { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("MaxDoseSize")]
        [DataMember]
        [Required]
        
        public virtual Single MaxDoseSize { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("VisitStatusCode")]
    public partial class VisitStatusCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected VisitStatusCode()
    {

    }
        public static  VisitStatusCode Create(
                        String visitStatusCodeName)
    {
        var @objectToReturn = new VisitStatusCode
        {
          

            VisitStatusCodeName = visitStatusCodeName
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("VisitStatusCodeId")]
        [DataMember]
        [Key]
        public virtual Int32 VisitStatusCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("VisitStatusCodeName")]
        [DataMember]
        [Required]
        [StringLength(100)]
        public virtual String VisitStatusCodeName { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("DrugFormCode")]
    public partial class DrugFormCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected DrugFormCode()
    {

    }
        public static  DrugFormCode Create(
                        String drugFormCodeName)
    {
        var @objectToReturn = new DrugFormCode
        {
          

            DrugFormCodeName = drugFormCodeName
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DrugFormCodeId")]
        [DataMember]
        [Key]
        public virtual Int32 DrugFormCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DrugFormCodeName")]
        [DataMember]
        [Required]
        [StringLength(100)]
        public virtual String DrugFormCodeName { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("WebJob")]
    public partial class WebJob
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected WebJob()
    {

    }
        public static  WebJob Create(
                        Int16 jobId,
                        String jobName,
                        String permissions)
    {
        var @objectToReturn = new WebJob
        {
          
            JobId = jobId,
            JobName = jobName,
            Permissions = permissions
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("JobId")]
        [DataMember]
        
        [Key]
        public virtual Int16 JobId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("JobName")]
        [DataMember]
        [Required]
        [StringLength(100)]
        public virtual String JobName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Permissions")]
        [DataMember]
        [Required]
        [StringLength(150)]
        public virtual String Permissions { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("DrugRouteCode")]
    public partial class DrugRouteCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected DrugRouteCode()
    {

    }
        public static  DrugRouteCode Create(
                        Int32 drugRouteCodeId,
                        String drugRouteCodeName)
    {
        var @objectToReturn = new DrugRouteCode
        {
          
            DrugRouteCodeId = drugRouteCodeId,
            DrugRouteCodeName = drugRouteCodeName
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DrugRouteCodeId")]
        [DataMember]
        
        [Key]
        public virtual Int32 DrugRouteCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DrugRouteCodeName")]
        [DataMember]
        [Required]
        [StringLength(1000)]
        public virtual String DrugRouteCodeName { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("WebJobHistory")]
    public partial class WebJobHistory
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected WebJobHistory()
    {

    }
        public static  WebJobHistory Create(
                        Int16 jobId,
                        DateTime creationTime)
    {
        var @objectToReturn = new WebJobHistory
        {
          
            JobId = jobId,

            CreationTime = creationTime
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("JobId")]
        [DataMember]
        [Required]
        
        public virtual Int16 JobId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("RunId")]
        [DataMember]
        [Key]
        public virtual Int32 RunId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreationTime")]
        [DataMember]
        [Required]
        
        public virtual DateTime CreationTime { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("FamilyHistory")]
    public partial class FamilyHistory
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected FamilyHistory()
    {

    }
        public static  FamilyHistory Create(
                        Int64 pid,
                        Int64 visitId,
                        Boolean archived,
                        Int32 tenantId,
                        Int32 relationshipCodeId,
                        String iCDCodeCNId,
                        Int64 createdBy,
                        Int64? parentId= null,
                        String note= null,
                        Int32? statusCodeId= null,
                        DateTime? createDate= null,
                        DateTime? updateDate= null,
                        Int64? updatedBy= null)
    {
        var @objectToReturn = new FamilyHistory
        {
          

            Pid = pid,
            VisitId = visitId,
            Archived = archived,
            ParentId = parentId,
            TenantId = tenantId,
            RelationshipCodeId = relationshipCodeId,
            ICDCodeCNId = iCDCodeCNId,
            Note = note,
            StatusCodeId = statusCodeId,
            CreateDate = createDate,
            UpdateDate = updateDate,
            CreatedBy = createdBy,
            UpdatedBy = updatedBy
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Id")]
        [DataMember]
        [Key]
        public virtual Int64 Id { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Pid")]
        [DataMember]
        [Required]
        
        public virtual Int64 Pid { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("VisitId")]
        [DataMember]
        [Required]
        
        public virtual Int64 VisitId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Archived")]
        [DataMember]
        [Required]
        
        public virtual Boolean Archived { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ParentId")]
        [DataMember]
        
        public virtual Int64? ParentId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        [Required]
        
        public virtual Int32 TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("RelationshipCodeId")]
        [DataMember]
        [Required]
        
        public virtual Int32 RelationshipCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ICDCodeCNId")]
        [DataMember]
        [Required]
        [StringLength(7)]
        public virtual String ICDCodeCNId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Note")]
        [DataMember]
        [StringLength(2147483647)]
        public virtual String Note { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("StatusCodeId")]
        [DataMember]
        
        public virtual Int32? StatusCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreateDate")]
        [DataMember]
        
        public virtual DateTime? CreateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdateDate")]
        [DataMember]
        
        public virtual DateTime? UpdateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatedBy")]
        [DataMember]
        [Required]
        
        public virtual Int64 CreatedBy { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdatedBy")]
        [DataMember]
        
        public virtual Int64? UpdatedBy { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("FrequencyCode")]
    public partial class FrequencyCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected FrequencyCode()
    {

    }
        public static  FrequencyCode Create(
                        String frequencyCodeName)
    {
        var @objectToReturn = new FrequencyCode
        {
          

            FrequencyCodeName = frequencyCodeName
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("FrequencyCodeId")]
        [DataMember]
        [Key]
        public virtual Int32 FrequencyCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("FrequencyCodeName")]
        [DataMember]
        [Required]
        [StringLength(100)]
        public virtual String FrequencyCodeName { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("ICDCodeCN")]
    public partial class ICDCodeCN
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected ICDCodeCN()
    {

    }
        public static  ICDCodeCN Create(
                        String iCDCodeCNId,
                        String iCDCodeCNShortName,
                        String iCDCodeCNName,
                        Int32? tenantId= null,
                        DateTime? createDate= null,
                        DateTime? updateDate= null,
                        Int64? createdBy= null,
                        Int64? updatedBy= null)
    {
        var @objectToReturn = new ICDCodeCN
        {
          
            ICDCodeCNId = iCDCodeCNId,
            ICDCodeCNShortName = iCDCodeCNShortName,
            ICDCodeCNName = iCDCodeCNName,
            TenantId = tenantId,
            CreateDate = createDate,
            UpdateDate = updateDate,
            CreatedBy = createdBy,
            UpdatedBy = updatedBy
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ICDCodeCNId")]
        [DataMember]
        [StringLength(7)]
        [Key]
        public virtual String ICDCodeCNId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ICDCodeCNShortName")]
        [DataMember]
        [Required]
        [StringLength(60)]
        public virtual String ICDCodeCNShortName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ICDCodeCNName")]
        [DataMember]
        [Required]
        [StringLength(2147483647)]
        public virtual String ICDCodeCNName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        
        public virtual Int32? TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreateDate")]
        [DataMember]
        
        public virtual DateTime? CreateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdateDate")]
        [DataMember]
        
        public virtual DateTime? UpdateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatedBy")]
        [DataMember]
        
        public virtual Int64? CreatedBy { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdatedBy")]
        [DataMember]
        
        public virtual Int64? UpdatedBy { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("ICDCodePCS")]
    public partial class ICDCodePCS
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected ICDCodePCS()
    {

    }
        public static  ICDCodePCS Create(
                        String iCDCodePCSId,
                        String iCDCodePCSShortName,
                        String iCDCodePCSName,
                        Int32? tenantId= null,
                        DateTime? createDate= null,
                        DateTime? updateDate= null,
                        Int64? createdBy= null,
                        Int64? updatedBy= null)
    {
        var @objectToReturn = new ICDCodePCS
        {
          
            ICDCodePCSId = iCDCodePCSId,
            ICDCodePCSShortName = iCDCodePCSShortName,
            ICDCodePCSName = iCDCodePCSName,
            TenantId = tenantId,
            CreateDate = createDate,
            UpdateDate = updateDate,
            CreatedBy = createdBy,
            UpdatedBy = updatedBy
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ICDCodePCSId")]
        [DataMember]
        [StringLength(7)]
        [Key]
        public virtual String ICDCodePCSId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ICDCodePCSShortName")]
        [DataMember]
        [Required]
        [StringLength(60)]
        public virtual String ICDCodePCSShortName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ICDCodePCSName")]
        [DataMember]
        [Required]
        [StringLength(2147483647)]
        public virtual String ICDCodePCSName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        
        public virtual Int32? TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreateDate")]
        [DataMember]
        
        public virtual DateTime? CreateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdateDate")]
        [DataMember]
        
        public virtual DateTime? UpdateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatedBy")]
        [DataMember]
        
        public virtual Int64? CreatedBy { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdatedBy")]
        [DataMember]
        
        public virtual Int64? UpdatedBy { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("ImmunizationCode")]
    public partial class ImmunizationCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected ImmunizationCode()
    {

    }
        public static  ImmunizationCode Create(
                        String immunizationName)
    {
        var @objectToReturn = new ImmunizationCode
        {
          

            ImmunizationName = immunizationName
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ImmunizationCodeId")]
        [DataMember]
        [Key]
        public virtual Int32 ImmunizationCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ImmunizationName")]
        [DataMember]
        [Required]
        [StringLength(100)]
        public virtual String ImmunizationName { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("Immunizations")]
    public partial class Immunizations
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected Immunizations()
    {

    }
        public static  Immunizations Create(
                        Int64 visitId,
                        Boolean archived,
                        Int32 administrationSiteId,
                        Int64 createdBy,
                        Int64? pid= null,
                        Int64? parentId= null,
                        Int32? tenantId= null,
                        Int32? immunizationCodeId= null,
                        DateTime? administeredDate= null,
                        Int64? administeredById= null,
                        String note= null,
                        DateTime? expirationDate= null,
                        Int32? completionStatusCodeId= null,
                        String status= null,
                        String informationSource= null,
                        DateTime? createDate= null,
                        DateTime? updateDate= null,
                        Int64? updatedBy= null)
    {
        var @objectToReturn = new Immunizations
        {
          

            Pid = pid,
            VisitId = visitId,
            Archived = archived,
            ParentId = parentId,
            TenantId = tenantId,
            ImmunizationCodeId = immunizationCodeId,
            AdministeredDate = administeredDate,
            AdministeredById = administeredById,
            Note = note,
            ExpirationDate = expirationDate,
            CompletionStatusCodeId = completionStatusCodeId,
            Status = status,
            InformationSource = informationSource,
            AdministrationSiteId = administrationSiteId,
            CreateDate = createDate,
            UpdateDate = updateDate,
            CreatedBy = createdBy,
            UpdatedBy = updatedBy
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Id")]
        [DataMember]
        [Key]
        public virtual Int64 Id { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Pid")]
        [DataMember]
        
        public virtual Int64? Pid { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("VisitId")]
        [DataMember]
        [Required]
        
        public virtual Int64 VisitId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Archived")]
        [DataMember]
        [Required]
        
        public virtual Boolean Archived { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ParentId")]
        [DataMember]
        
        public virtual Int64? ParentId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        
        public virtual Int32? TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ImmunizationCodeId")]
        [DataMember]
        
        public virtual Int32? ImmunizationCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AdministeredDate")]
        [DataMember]
        
        public virtual DateTime? AdministeredDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AdministeredById")]
        [DataMember]
        
        public virtual Int64? AdministeredById { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Note")]
        [DataMember]
        [StringLength(2147483647)]
        public virtual String Note { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ExpirationDate")]
        [DataMember]
        
        public virtual DateTime? ExpirationDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CompletionStatusCodeId")]
        [DataMember]
        
        public virtual Int32? CompletionStatusCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Status")]
        [DataMember]
        [StringLength(20)]
        public virtual String Status { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("InformationSource")]
        [DataMember]
        [StringLength(31)]
        public virtual String InformationSource { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AdministrationSiteId")]
        [DataMember]
        [Required]
        
        public virtual Int32 AdministrationSiteId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreateDate")]
        [DataMember]
        
        public virtual DateTime? CreateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdateDate")]
        [DataMember]
        
        public virtual DateTime? UpdateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatedBy")]
        [DataMember]
        [Required]
        
        public virtual Int64 CreatedBy { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdatedBy")]
        [DataMember]
        
        public virtual Int64? UpdatedBy { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("InformationSource")]
    public partial class InformationSource
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected InformationSource()
    {

    }
        public static  InformationSource Create(
                        String informationSourceName)
    {
        var @objectToReturn = new InformationSource
        {
          

            InformationSourceName = informationSourceName
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("InformationSourceId")]
        [DataMember]
        [Key]
        public virtual Int32 InformationSourceId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("InformationSourceName")]
        [DataMember]
        [Required]
        [StringLength(200)]
        public virtual String InformationSourceName { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("LifeStyle")]
    public partial class LifeStyle
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected LifeStyle()
    {

    }
        public static  LifeStyle Create(
                        Int64 pid,
                        Int64 visitId,
                        Boolean archived,
                        Int32 tenantId,
                        Int32 lifeStyleTypeId,
                        Boolean currentlyActive,
                        DateTime createDate,
                        DateTime updateDate,
                        Int64 createdBy,
                        Int64 updatedBy,
                        Int64? parentId= null,
                        DateTime? quitDate= null,
                        String note= null)
    {
        var @objectToReturn = new LifeStyle
        {
          

            Pid = pid,
            VisitId = visitId,
            Archived = archived,
            ParentId = parentId,
            TenantId = tenantId,
            LifeStyleTypeId = lifeStyleTypeId,
            QuitDate = quitDate,
            CurrentlyActive = currentlyActive,
            Note = note,
            CreateDate = createDate,
            UpdateDate = updateDate,
            CreatedBy = createdBy,
            UpdatedBy = updatedBy
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Id")]
        [DataMember]
        [Key]
        public virtual Int64 Id { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Pid")]
        [DataMember]
        [Required]
        
        public virtual Int64 Pid { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("VisitId")]
        [DataMember]
        [Required]
        
        public virtual Int64 VisitId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Archived")]
        [DataMember]
        [Required]
        
        public virtual Boolean Archived { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ParentId")]
        [DataMember]
        
        public virtual Int64? ParentId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        [Required]
        
        public virtual Int32 TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("LifeStyleTypeId")]
        [DataMember]
        [Required]
        
        public virtual Int32 LifeStyleTypeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("QuitDate")]
        [DataMember]
        
        public virtual DateTime? QuitDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CurrentlyActive")]
        [DataMember]
        [Required]
        
        public virtual Boolean CurrentlyActive { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Note")]
        [DataMember]
        [StringLength(2147483647)]
        public virtual String Note { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreateDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime CreateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdateDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime UpdateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatedBy")]
        [DataMember]
        [Required]
        
        public virtual Int64 CreatedBy { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdatedBy")]
        [DataMember]
        [Required]
        
        public virtual Int64 UpdatedBy { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("LifeStyleType")]
    public partial class LifeStyleType
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected LifeStyleType()
    {

    }
        public static  LifeStyleType Create(
                        String lifeStyleTypeName)
    {
        var @objectToReturn = new LifeStyleType
        {
          

            LifeStyleTypeName = lifeStyleTypeName
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("LifeStyleTypeId")]
        [DataMember]
        [Key]
        public virtual Int32 LifeStyleTypeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("LifeStyleTypeName")]
        [DataMember]
        [Required]
        [StringLength(200)]
        public virtual String LifeStyleTypeName { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("LoincCode")]
    public partial class LoincCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected LoincCode()
    {

    }
        public static  LoincCode Create(
                        String loincCodeId,
                        String component= null,
                        String property= null,
                        String timeAspct= null,
                        String systemCode= null,
                        String scaleType= null,
                        String methodType= null,
                        String className= null,
                        String formula= null,
                        String unitsRequired= null,
                        String submittedUnits= null,
                        String relatedNames= null,
                        String shortName= null,
                        String exampleUnits= null,
                        String longCommonName= null,
                        String unitsAndRange= null,
                        String exampleUcumUnits= null,
                        Int32? tenantId= null)
    {
        var @objectToReturn = new LoincCode
        {
          
            LoincCodeId = loincCodeId,
            Component = component,
            Property = property,
            TimeAspct = timeAspct,
            SystemCode = systemCode,
            ScaleType = scaleType,
            MethodType = methodType,
            ClassName = className,
            Formula = formula,
            UnitsRequired = unitsRequired,
            SubmittedUnits = submittedUnits,
            RelatedNames = relatedNames,
            ShortName = shortName,
            ExampleUnits = exampleUnits,
            LongCommonName = longCommonName,
            UnitsAndRange = unitsAndRange,
            ExampleUcumUnits = exampleUcumUnits,
            TenantId = tenantId
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("LoincCodeId")]
        [DataMember]
        [StringLength(10)]
        [Key]
        public virtual String LoincCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Component")]
        [DataMember]
        [StringLength(255)]
        public virtual String Component { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Property")]
        [DataMember]
        [StringLength(30)]
        public virtual String Property { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TimeAspct")]
        [DataMember]
        [StringLength(15)]
        public virtual String TimeAspct { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("SystemCode")]
        [DataMember]
        [StringLength(100)]
        public virtual String SystemCode { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ScaleType")]
        [DataMember]
        [StringLength(30)]
        public virtual String ScaleType { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("MethodType")]
        [DataMember]
        [StringLength(50)]
        public virtual String MethodType { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ClassName")]
        [DataMember]
        [StringLength(20)]
        public virtual String ClassName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Formula")]
        [DataMember]
        [StringLength(2147483647)]
        public virtual String Formula { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UnitsRequired")]
        [DataMember]
        [StringLength(1)]
        public virtual String UnitsRequired { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("SubmittedUnits")]
        [DataMember]
        [StringLength(35)]
        public virtual String SubmittedUnits { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("RelatedNames")]
        [DataMember]
        [StringLength(2147483647)]
        public virtual String RelatedNames { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ShortName")]
        [DataMember]
        [StringLength(45)]
        public virtual String ShortName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ExampleUnits")]
        [DataMember]
        [StringLength(255)]
        public virtual String ExampleUnits { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("LongCommonName")]
        [DataMember]
        [StringLength(255)]
        public virtual String LongCommonName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UnitsAndRange")]
        [DataMember]
        [StringLength(255)]
        public virtual String UnitsAndRange { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ExampleUcumUnits")]
        [DataMember]
        [StringLength(255)]
        public virtual String ExampleUcumUnits { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        
        public virtual Int32? TenantId { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("LoincPanelCode")]
    public partial class LoincPanelCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected LoincPanelCode()
    {

    }
        public static  LoincPanelCode Create(
                        Int32 parentId,
                        String parentLoincCodeId,
                        Int32 id,
                        Int32 sequence,
                        String loincCodeId,
                        String parentName= null,
                        String name= null)
    {
        var @objectToReturn = new LoincPanelCode
        {
          
            ParentId = parentId,
            ParentLoincCodeId = parentLoincCodeId,
            ParentName = parentName,
            Id = id,
            Sequence = sequence,
            LoincCodeId = loincCodeId,
            Name = name
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ParentId")]
        [DataMember]
        
        [Key]
        public virtual Int32 ParentId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ParentLoincCodeId")]
        [DataMember]
        [Required]
        [StringLength(10)]
        public virtual String ParentLoincCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ParentName")]
        [DataMember]
        [StringLength(255)]
        public virtual String ParentName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Id")]
        [DataMember]
        
        [Key]
        public virtual Int32 Id { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Sequence")]
        [DataMember]
        [Required]
        
        public virtual Int32 Sequence { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("LoincCodeId")]
        [DataMember]
        [Required]
        [StringLength(10)]
        public virtual String LoincCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Name")]
        [DataMember]
        [StringLength(255)]
        public virtual String Name { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("LoincRangeCode")]
    public partial class LoincRangeCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected LoincRangeCode()
    {

    }
        public static  LoincRangeCode Create(
                        String loincCodeId,
                        String loincRangeCodeName,
                        Int32 tenantId)
    {
        var @objectToReturn = new LoincRangeCode
        {
          
            LoincCodeId = loincCodeId,
            LoincRangeCodeName = loincRangeCodeName,
            TenantId = tenantId
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("LoincCodeId")]
        [DataMember]
        [StringLength(10)]
        [Key]
        public virtual String LoincCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("LoincRangeCodeName")]
        [DataMember]
        [Required]
        [StringLength(30)]
        public virtual String LoincRangeCodeName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        
        [Key]
        public virtual Int32 TenantId { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("LoincUnitCode")]
    public partial class LoincUnitCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected LoincUnitCode()
    {

    }
        public static  LoincUnitCode Create(
                        String loincCodeId,
                        String loincUnitCodeName,
                        Int32 tenantId)
    {
        var @objectToReturn = new LoincUnitCode
        {
          
            LoincCodeId = loincCodeId,
            LoincUnitCodeName = loincUnitCodeName,
            TenantId = tenantId
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("LoincCodeId")]
        [DataMember]
        [StringLength(10)]
        [Key]
        public virtual String LoincCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("LoincUnitCodeName")]
        [DataMember]
        [Required]
        [StringLength(30)]
        public virtual String LoincUnitCodeName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        
        [Key]
        public virtual Int32 TenantId { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("OrderCondition")]
    public partial class OrderCondition
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected OrderCondition()
    {

    }
        public static  OrderCondition Create(
                        Int64 orderId,
                        String iCDCodeCNId,
                        Boolean primaryCondition)
    {
        var @objectToReturn = new OrderCondition
        {
          
            OrderId = orderId,
            ICDCodeCNId = iCDCodeCNId,
            PrimaryCondition = primaryCondition
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("OrderId")]
        [DataMember]
        
        [Key]
        public virtual Int64 OrderId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ICDCodeCNId")]
        [DataMember]
        [StringLength(7)]
        [Key]
        public virtual String ICDCodeCNId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("PrimaryCondition")]
        [DataMember]
        [Required]
        
        public virtual Boolean PrimaryCondition { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("UserPreference")]
    public partial class UserPreference
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected UserPreference()
    {

    }
        public static  UserPreference Create(
                        Int64 id,
                        Int32 tenantId,
                        DateTime createDate,
                        DateTime updateDate,
                        Int64 createdBy,
                        Int64 updatedBy,
                        Int32? administrationSiteId= null,
                        String calendarColor= null)
    {
        var @objectToReturn = new UserPreference
        {
          
            Id = id,
            TenantId = tenantId,
            AdministrationSiteId = administrationSiteId,
            CalendarColor = calendarColor,
            CreateDate = createDate,
            UpdateDate = updateDate,
            CreatedBy = createdBy,
            UpdatedBy = updatedBy
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Id")]
        [DataMember]
        
        [Key]
        public virtual Int64 Id { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        [Required]
        
        public virtual Int32 TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AdministrationSiteId")]
        [DataMember]
        
        public virtual Int32? AdministrationSiteId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CalendarColor")]
        [DataMember]
        [StringLength(7)]
        public virtual String CalendarColor { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreateDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime CreateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdateDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime UpdateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatedBy")]
        [DataMember]
        [Required]
        
        public virtual Int64 CreatedBy { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdatedBy")]
        [DataMember]
        [Required]
        
        public virtual Int64 UpdatedBy { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("OrderResult")]
    public partial class OrderResult
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected OrderResult()
    {

    }
        public static  OrderResult Create(
                        Int64 orderId,
                        Int64 pid,
                        Int32 tenantId,
                        DateTime resultDate,
                        Boolean archived,
                        Int64 resultById,
                        String loincCodeId,
                        Int32 resultDataCodeId,
                        String resultData,
                        Int32 abnormalCodeId,
                        DateTime createDate,
                        DateTime updateDate,
                        Int64 createdBy,
                        Int64 updatedBy,
                        Int64? parentId= null,
                        String parentLoincCodeId= null,
                        Int32? administrationSiteId= null,
                        String unit= null,
                        String rangeValue= null,
                        String note= null,
                        Int32? resultStatusCodeId= null)
    {
        var @objectToReturn = new OrderResult
        {
          

            OrderId = orderId,
            Pid = pid,
            TenantId = tenantId,
            ResultDate = resultDate,
            Archived = archived,
            ParentId = parentId,
            ResultById = resultById,
            ParentLoincCodeId = parentLoincCodeId,
            LoincCodeId = loincCodeId,
            ResultDataCodeId = resultDataCodeId,
            ResultData = resultData,
            AdministrationSiteId = administrationSiteId,
            Unit = unit,
            RangeValue = rangeValue,
            AbnormalCodeId = abnormalCodeId,
            Note = note,
            ResultStatusCodeId = resultStatusCodeId,
            CreateDate = createDate,
            UpdateDate = updateDate,
            CreatedBy = createdBy,
            UpdatedBy = updatedBy
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Id")]
        [DataMember]
        [Key]
        public virtual Int64 Id { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("OrderId")]
        [DataMember]
        [Required]
        
        public virtual Int64 OrderId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Pid")]
        [DataMember]
        [Required]
        
        public virtual Int64 Pid { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        [Required]
        
        public virtual Int32 TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ResultDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime ResultDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Archived")]
        [DataMember]
        [Required]
        
        public virtual Boolean Archived { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ParentId")]
        [DataMember]
        
        public virtual Int64? ParentId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ResultById")]
        [DataMember]
        [Required]
        
        public virtual Int64 ResultById { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ParentLoincCodeId")]
        [DataMember]
        [StringLength(10)]
        public virtual String ParentLoincCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("LoincCodeId")]
        [DataMember]
        [Required]
        [StringLength(10)]
        public virtual String LoincCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ResultDataCodeId")]
        [DataMember]
        [Required]
        
        public virtual Int32 ResultDataCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ResultData")]
        [DataMember]
        [Required]
        [StringLength(255)]
        public virtual String ResultData { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AdministrationSiteId")]
        [DataMember]
        
        public virtual Int32? AdministrationSiteId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Unit")]
        [DataMember]
        [StringLength(10)]
        public virtual String Unit { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("RangeValue")]
        [DataMember]
        [StringLength(255)]
        public virtual String RangeValue { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AbnormalCodeId")]
        [DataMember]
        [Required]
        
        public virtual Int32 AbnormalCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Note")]
        [DataMember]
        [StringLength(2147483647)]
        public virtual String Note { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ResultStatusCodeId")]
        [DataMember]
        
        public virtual Int32? ResultStatusCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreateDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime CreateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdateDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime UpdateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatedBy")]
        [DataMember]
        [Required]
        
        public virtual Int64 CreatedBy { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdatedBy")]
        [DataMember]
        [Required]
        
        public virtual Int64 UpdatedBy { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("Appointment")]
    public partial class Appointment
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected Appointment()
    {

    }
        public static  Appointment Create(
                        Int32 tenantId,
                        Int32 providerId,
                        Int32 appointmentCodeId,
                        Int32 appointmentStatusCodeId,
                        Boolean allDayEvent,
                        DateTime startDate,
                        DateTime endDate,
                        String title,
                        DateTime createDate,
                        DateTime updateDate,
                        Int64 createdBy,
                        Int64 updatedBy,
                        Int32? pid= null,
                        Int32? administrationSiteId= null,
                        String fname= null,
                        String lname= null,
                        String mname= null,
                        DateTime? dOB= null,
                        String phoneCell= null,
                        String phoneHome= null,
                        String note= null)
    {
        var @objectToReturn = new Appointment
        {
          

            Pid = pid,
            TenantId = tenantId,
            ProviderId = providerId,
            AppointmentCodeId = appointmentCodeId,
            AppointmentStatusCodeId = appointmentStatusCodeId,
            AllDayEvent = allDayEvent,
            StartDate = startDate,
            EndDate = endDate,
            Title = title,
            AdministrationSiteId = administrationSiteId,
            Fname = fname,
            Lname = lname,
            Mname = mname,
            DOB = dOB,
            PhoneCell = phoneCell,
            PhoneHome = phoneHome,
            Note = note,
            CreateDate = createDate,
            UpdateDate = updateDate,
            CreatedBy = createdBy,
            UpdatedBy = updatedBy
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Id")]
        [DataMember]
        [Key]
        public virtual Int64 Id { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Pid")]
        [DataMember]
        
        public virtual Int32? Pid { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        [Required]
        
        public virtual Int32 TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ProviderId")]
        [DataMember]
        [Required]
        
        public virtual Int32 ProviderId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AppointmentCodeId")]
        [DataMember]
        [Required]
        
        public virtual Int32 AppointmentCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AppointmentStatusCodeId")]
        [DataMember]
        [Required]
        
        public virtual Int32 AppointmentStatusCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AllDayEvent")]
        [DataMember]
        [Required]
        
        public virtual Boolean AllDayEvent { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("StartDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime StartDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("EndDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime EndDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Title")]
        [DataMember]
        [Required]
        [StringLength(255)]
        public virtual String Title { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AdministrationSiteId")]
        [DataMember]
        
        public virtual Int32? AdministrationSiteId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Fname")]
        [DataMember]
        [StringLength(50)]
        public virtual String Fname { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Lname")]
        [DataMember]
        [StringLength(50)]
        public virtual String Lname { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Mname")]
        [DataMember]
        [StringLength(50)]
        public virtual String Mname { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DOB")]
        [DataMember]
        
        public virtual DateTime? DOB { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("PhoneCell")]
        [DataMember]
        [StringLength(20)]
        public virtual String PhoneCell { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("PhoneHome")]
        [DataMember]
        [StringLength(20)]
        public virtual String PhoneHome { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Note")]
        [DataMember]
        [StringLength(2147483647)]
        public virtual String Note { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreateDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime CreateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdateDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime UpdateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatedBy")]
        [DataMember]
        [Required]
        
        public virtual Int64 CreatedBy { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdatedBy")]
        [DataMember]
        [Required]
        
        public virtual Int64 UpdatedBy { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("AppointmentCode")]
    public partial class AppointmentCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected AppointmentCode()
    {

    }
        public static  AppointmentCode Create(
                        Int32 appointmentCodeId,
                        String appointmentCodeName)
    {
        var @objectToReturn = new AppointmentCode
        {
          
            AppointmentCodeId = appointmentCodeId,
            AppointmentCodeName = appointmentCodeName
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AppointmentCodeId")]
        [DataMember]
        
        [Key]
        public virtual Int32 AppointmentCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AppointmentCodeName")]
        [DataMember]
        [Required]
        [StringLength(1000)]
        public virtual String AppointmentCodeName { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("AppointmentStatusCode")]
    public partial class AppointmentStatusCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected AppointmentStatusCode()
    {

    }
        public static  AppointmentStatusCode Create(
                        Int32 appointmentStatusCodeId,
                        String appointmentStatusCodeName)
    {
        var @objectToReturn = new AppointmentStatusCode
        {
          
            AppointmentStatusCodeId = appointmentStatusCodeId,
            AppointmentStatusCodeName = appointmentStatusCodeName
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AppointmentStatusCodeId")]
        [DataMember]
        
        [Key]
        public virtual Int32 AppointmentStatusCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AppointmentStatusCodeName")]
        [DataMember]
        [Required]
        [StringLength(1000)]
        public virtual String AppointmentStatusCodeName { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("PatientVital")]
    public partial class PatientVital
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected PatientVital()
    {

    }
        public static  PatientVital Create(
                        Int64 visitId,
                        Int32 tenantId,
                        DateTime createDate,
                        Int64 createdBy,
                        Int64 pid,
                        Decimal? bps= null,
                        Decimal? bpd= null,
                        Decimal? weight= null,
                        Decimal? height= null,
                        Decimal? temperature= null,
                        String tempMethod= null,
                        Decimal? pulse= null,
                        Decimal? respiration= null,
                        Decimal? bMI= null,
                        String bMIStatus= null,
                        Decimal? waistCirc= null,
                        Decimal? headCirc= null,
                        Decimal? oxygenSaturation= null)
    {
        var @objectToReturn = new PatientVital
        {
          

            VisitId = visitId,
            TenantId = tenantId,
            CreateDate = createDate,
            CreatedBy = createdBy,
            Pid = pid,
            Bps = bps,
            Bpd = bpd,
            Weight = weight,
            Height = height,
            Temperature = temperature,
            TempMethod = tempMethod,
            Pulse = pulse,
            Respiration = respiration,
            BMI = bMI,
            BMIStatus = bMIStatus,
            WaistCirc = waistCirc,
            HeadCirc = headCirc,
            OxygenSaturation = oxygenSaturation
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("VitalId")]
        [DataMember]
        [Key]
        public virtual Int64 VitalId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("VisitId")]
        [DataMember]
        [Required]
        
        public virtual Int64 VisitId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        [Required]
        
        public virtual Int32 TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreateDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime CreateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatedBy")]
        [DataMember]
        [Required]
        
        public virtual Int64 CreatedBy { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Pid")]
        [DataMember]
        [Required]
        
        public virtual Int64 Pid { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Bps")]
        [DataMember]
        
        public virtual Decimal? Bps { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Bpd")]
        [DataMember]
        
        public virtual Decimal? Bpd { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Weight")]
        [DataMember]
        
        public virtual Decimal? Weight { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Height")]
        [DataMember]
        
        public virtual Decimal? Height { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Temperature")]
        [DataMember]
        
        public virtual Decimal? Temperature { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TempMethod")]
        [DataMember]
        [StringLength(255)]
        public virtual String TempMethod { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Pulse")]
        [DataMember]
        
        public virtual Decimal? Pulse { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Respiration")]
        [DataMember]
        
        public virtual Decimal? Respiration { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("BMI")]
        [DataMember]
        
        public virtual Decimal? BMI { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("BMIStatus")]
        [DataMember]
        [StringLength(255)]
        public virtual String BMIStatus { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("WaistCirc")]
        [DataMember]
        
        public virtual Decimal? WaistCirc { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("HeadCirc")]
        [DataMember]
        
        public virtual Decimal? HeadCirc { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("OxygenSaturation")]
        [DataMember]
        
        public virtual Decimal? OxygenSaturation { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("OrderSpecimen")]
    public partial class OrderSpecimen
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected OrderSpecimen()
    {

    }
        public static  OrderSpecimen Create(
                        Int64 orderId,
                        Int64 pid,
                        Int32 tenantId,
                        Boolean archived,
                        DateTime collectedDate,
                        Int64 collectedById,
                        Int32 statusCodeId,
                        Int32 specimenCodeId,
                        DateTime createDate,
                        DateTime updateDate,
                        Int64 createdBy,
                        Int64 updatedBy,
                        Int64? parentId= null,
                        String note= null,
                        Int32? administrationSiteId= null,
                        String specimenNumber= null)
    {
        var @objectToReturn = new OrderSpecimen
        {
          

            OrderId = orderId,
            Pid = pid,
            TenantId = tenantId,
            Archived = archived,
            ParentId = parentId,
            CollectedDate = collectedDate,
            CollectedById = collectedById,
            Note = note,
            StatusCodeId = statusCodeId,
            AdministrationSiteId = administrationSiteId,
            SpecimenNumber = specimenNumber,
            SpecimenCodeId = specimenCodeId,
            CreateDate = createDate,
            UpdateDate = updateDate,
            CreatedBy = createdBy,
            UpdatedBy = updatedBy
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Id")]
        [DataMember]
        [Key]
        public virtual Int64 Id { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("OrderId")]
        [DataMember]
        [Required]
        
        public virtual Int64 OrderId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Pid")]
        [DataMember]
        [Required]
        
        public virtual Int64 Pid { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        [Required]
        
        public virtual Int32 TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Archived")]
        [DataMember]
        [Required]
        
        public virtual Boolean Archived { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ParentId")]
        [DataMember]
        
        public virtual Int64? ParentId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CollectedDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime CollectedDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CollectedById")]
        [DataMember]
        [Required]
        
        public virtual Int64 CollectedById { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Note")]
        [DataMember]
        [StringLength(2147483647)]
        public virtual String Note { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("StatusCodeId")]
        [DataMember]
        [Required]
        
        public virtual Int32 StatusCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AdministrationSiteId")]
        [DataMember]
        
        public virtual Int32? AdministrationSiteId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("SpecimenNumber")]
        [DataMember]
        [StringLength(100)]
        public virtual String SpecimenNumber { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("SpecimenCodeId")]
        [DataMember]
        [Required]
        
        public virtual Int32 SpecimenCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreateDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime CreateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdateDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime UpdateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatedBy")]
        [DataMember]
        [Required]
        
        public virtual Int64 CreatedBy { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdatedBy")]
        [DataMember]
        [Required]
        
        public virtual Int64 UpdatedBy { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("OutcomeCode")]
    public partial class OutcomeCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected OutcomeCode()
    {

    }
        public static  OutcomeCode Create(
                        String outcomeCodeName)
    {
        var @objectToReturn = new OutcomeCode
        {
          

            OutcomeCodeName = outcomeCodeName
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("OutcomeCodeId")]
        [DataMember]
        [Key]
        public virtual Int32 OutcomeCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("OutcomeCodeName")]
        [DataMember]
        [Required]
        [StringLength(2147483647)]
        public virtual String OutcomeCodeName { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("PatientAllergy")]
    public partial class PatientAllergy
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected PatientAllergy()
    {

    }
        public static  PatientAllergy Create(
                        Int64 pid,
                        Int64 visitId,
                        Boolean archived,
                        Int32 tenantId,
                        String allergyName,
                        Int32 allergyTypeId,
                        String reactionName,
                        Int32 severityId,
                        Int32 allergyCategoryCodeId,
                        Int64 provider,
                        Int64 createdBy,
                        Int64? parentId= null,
                        DateTime? startDate= null,
                        DateTime? endDate= null,
                        String note= null,
                        String status= null,
                        DateTime? createDate= null,
                        DateTime? updateDate= null,
                        Int64? updatedBy= null)
    {
        var @objectToReturn = new PatientAllergy
        {
          

            Pid = pid,
            VisitId = visitId,
            Archived = archived,
            ParentId = parentId,
            TenantId = tenantId,
            AllergyName = allergyName,
            AllergyTypeId = allergyTypeId,
            ReactionName = reactionName,
            SeverityId = severityId,
            AllergyCategoryCodeId = allergyCategoryCodeId,
            StartDate = startDate,
            EndDate = endDate,
            Note = note,
            Status = status,
            Provider = provider,
            CreateDate = createDate,
            UpdateDate = updateDate,
            CreatedBy = createdBy,
            UpdatedBy = updatedBy
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("PatientAllergyId")]
        [DataMember]
        [Key]
        public virtual Int64 PatientAllergyId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Pid")]
        [DataMember]
        [Required]
        
        public virtual Int64 Pid { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("VisitId")]
        [DataMember]
        [Required]
        
        public virtual Int64 VisitId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Archived")]
        [DataMember]
        [Required]
        
        public virtual Boolean Archived { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ParentId")]
        [DataMember]
        
        public virtual Int64? ParentId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        [Required]
        
        public virtual Int32 TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AllergyName")]
        [DataMember]
        [Required]
        [StringLength(1000)]
        public virtual String AllergyName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AllergyTypeId")]
        [DataMember]
        [Required]
        
        public virtual Int32 AllergyTypeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ReactionName")]
        [DataMember]
        [Required]
        [StringLength(1000)]
        public virtual String ReactionName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("SeverityId")]
        [DataMember]
        [Required]
        
        public virtual Int32 SeverityId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AllergyCategoryCodeId")]
        [DataMember]
        [Required]
        
        public virtual Int32 AllergyCategoryCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("StartDate")]
        [DataMember]
        
        public virtual DateTime? StartDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("EndDate")]
        [DataMember]
        
        public virtual DateTime? EndDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Note")]
        [DataMember]
        [StringLength(1073741823)]
        public virtual String Note { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Status")]
        [DataMember]
        [StringLength(20)]
        public virtual String Status { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Provider")]
        [DataMember]
        [Required]
        
        public virtual Int64 Provider { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreateDate")]
        [DataMember]
        
        public virtual DateTime? CreateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdateDate")]
        [DataMember]
        
        public virtual DateTime? UpdateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatedBy")]
        [DataMember]
        [Required]
        
        public virtual Int64 CreatedBy { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdatedBy")]
        [DataMember]
        
        public virtual Int64? UpdatedBy { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("PatientData")]
    public partial class PatientData
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected PatientData()
    {

    }
        public static  PatientData Create(
                        Int32 tenantId,
                        String fname,
                        String lname,
                        String mname,
                        String street,
                        String postalCode,
                        String city,
                        String state,
                        String county,
                        String countryCode,
                        String driversLicense,
                        String identificationNumber,
                        String phoneHome,
                        String emergencyContactPhone,
                        String emergencyContactName,
                        String contactRelationship,
                        String phoneCell,
                        String gender,
                        String email,
                        String race,
                        String ethnicity,
                        String deceasedReason,
                        Boolean currentlyInVisit,
                        Int64 createdBy,
                        DateTime? dOB= null,
                        String billingNote= null,
                        DateTime? deceasedDate= null,
                        DateTime? createDate= null,
                        DateTime? updateDate= null,
                        Int64? updatedBy= null)
    {
        var @objectToReturn = new PatientData
        {
          

            TenantId = tenantId,
            Fname = fname,
            Lname = lname,
            Mname = mname,
            DOB = dOB,
            Street = street,
            PostalCode = postalCode,
            City = city,
            State = state,
            County = county,
            CountryCode = countryCode,
            DriversLicense = driversLicense,
            IdentificationNumber = identificationNumber,
            PhoneHome = phoneHome,
            EmergencyContactPhone = emergencyContactPhone,
            EmergencyContactName = emergencyContactName,
            ContactRelationship = contactRelationship,
            PhoneCell = phoneCell,
            Gender = gender,
            Email = email,
            Race = race,
            Ethnicity = ethnicity,
            BillingNote = billingNote,
            DeceasedDate = deceasedDate,
            DeceasedReason = deceasedReason,
            CurrentlyInVisit = currentlyInVisit,
            CreateDate = createDate,
            UpdateDate = updateDate,
            CreatedBy = createdBy,
            UpdatedBy = updatedBy
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Pid")]
        [DataMember]
        [Key]
        public virtual Int64 Pid { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        [Required]
        
        public virtual Int32 TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Fname")]
        [DataMember]
        [Required]
        [StringLength(50)]
        public virtual String Fname { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Lname")]
        [DataMember]
        [Required]
        [StringLength(50)]
        public virtual String Lname { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Mname")]
        [DataMember]
        [Required]
        [StringLength(50)]
        public virtual String Mname { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DOB")]
        [DataMember]
        
        public virtual DateTime? DOB { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Street")]
        [DataMember]
        [Required]
        [StringLength(50)]
        public virtual String Street { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("PostalCode")]
        [DataMember]
        [Required]
        [StringLength(20)]
        public virtual String PostalCode { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("City")]
        [DataMember]
        [Required]
        [StringLength(40)]
        public virtual String City { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("State")]
        [DataMember]
        [Required]
        [StringLength(20)]
        public virtual String State { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("County")]
        [DataMember]
        [Required]
        [StringLength(50)]
        public virtual String County { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CountryCode")]
        [DataMember]
        [Required]
        [StringLength(2)]
        public virtual String CountryCode { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DriversLicense")]
        [DataMember]
        [Required]
        [StringLength(50)]
        public virtual String DriversLicense { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("IdentificationNumber")]
        [DataMember]
        [Required]
        [StringLength(25)]
        public virtual String IdentificationNumber { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("PhoneHome")]
        [DataMember]
        [Required]
        [StringLength(20)]
        public virtual String PhoneHome { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("EmergencyContactPhone")]
        [DataMember]
        [Required]
        [StringLength(20)]
        public virtual String EmergencyContactPhone { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("EmergencyContactName")]
        [DataMember]
        [Required]
        [StringLength(50)]
        public virtual String EmergencyContactName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ContactRelationship")]
        [DataMember]
        [Required]
        [StringLength(20)]
        public virtual String ContactRelationship { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("PhoneCell")]
        [DataMember]
        [Required]
        [StringLength(20)]
        public virtual String PhoneCell { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Gender")]
        [DataMember]
        [Required]
        [StringLength(1)]
        public virtual String Gender { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Email")]
        [DataMember]
        [Required]
        [StringLength(50)]
        public virtual String Email { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Race")]
        [DataMember]
        [Required]
        [StringLength(50)]
        public virtual String Race { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Ethnicity")]
        [DataMember]
        [Required]
        [StringLength(50)]
        public virtual String Ethnicity { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("BillingNote")]
        [DataMember]
        [StringLength(50)]
        public virtual String BillingNote { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DeceasedDate")]
        [DataMember]
        
        public virtual DateTime? DeceasedDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DeceasedReason")]
        [DataMember]
        [Required]
        [StringLength(350)]
        public virtual String DeceasedReason { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CurrentlyInVisit")]
        [DataMember]
        [Required]
        
        public virtual Boolean CurrentlyInVisit { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreateDate")]
        [DataMember]
        
        public virtual DateTime? CreateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdateDate")]
        [DataMember]
        
        public virtual DateTime? UpdateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatedBy")]
        [DataMember]
        [Required]
        
        public virtual Int64 CreatedBy { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdatedBy")]
        [DataMember]
        
        public virtual Int64? UpdatedBy { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("AbpAuditLogs")]
    public partial class AbpAuditLogs
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected AbpAuditLogs()
    {

    }
        public static  AbpAuditLogs Create(
                        DateTime executionTime,
                        Int32 executionDuration,
                        Int32? tenantId= null,
                        Int64? userId= null,
                        String serviceName= null,
                        String methodName= null,
                        String parameters= null,
                        String clientIpAddress= null,
                        String clientName= null,
                        String browserInfo= null,
                        String exception= null,
                        Int64? impersonatorUserId= null,
                        Int32? impersonatorTenantId= null,
                        String customData= null)
    {
        var @objectToReturn = new AbpAuditLogs
        {
          

            TenantId = tenantId,
            UserId = userId,
            ServiceName = serviceName,
            MethodName = methodName,
            Parameters = parameters,
            ExecutionTime = executionTime,
            ExecutionDuration = executionDuration,
            ClientIpAddress = clientIpAddress,
            ClientName = clientName,
            BrowserInfo = browserInfo,
            Exception = exception,
            ImpersonatorUserId = impersonatorUserId,
            ImpersonatorTenantId = impersonatorTenantId,
            CustomData = customData
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Id")]
        [DataMember]
        [Key]
        public virtual Int64 Id { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        
        public virtual Int32? TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UserId")]
        [DataMember]
        
        public virtual Int64? UserId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ServiceName")]
        [DataMember]
        [StringLength(256)]
        public virtual String ServiceName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("MethodName")]
        [DataMember]
        [StringLength(256)]
        public virtual String MethodName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Parameters")]
        [DataMember]
        [StringLength(1024)]
        public virtual String Parameters { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ExecutionTime")]
        [DataMember]
        [Required]
        
        public virtual DateTime ExecutionTime { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ExecutionDuration")]
        [DataMember]
        [Required]
        
        public virtual Int32 ExecutionDuration { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ClientIpAddress")]
        [DataMember]
        [StringLength(64)]
        public virtual String ClientIpAddress { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ClientName")]
        [DataMember]
        [StringLength(128)]
        public virtual String ClientName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("BrowserInfo")]
        [DataMember]
        [StringLength(256)]
        public virtual String BrowserInfo { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Exception")]
        [DataMember]
        [StringLength(2000)]
        public virtual String Exception { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ImpersonatorUserId")]
        [DataMember]
        
        public virtual Int64? ImpersonatorUserId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ImpersonatorTenantId")]
        [DataMember]
        
        public virtual Int32? ImpersonatorTenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CustomData")]
        [DataMember]
        [StringLength(2000)]
        public virtual String CustomData { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("AbpPermissions")]
    public partial class AbpPermissions
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected AbpPermissions()
    {

    }
        public static  AbpPermissions Create(
                        String name,
                        Boolean isGranted,
                        DateTime creationTime,
                        String discriminator,
                        Int64? creatorUserId= null,
                        Int32? roleId= null,
                        Int64? userId= null,
                        Int32? tenantId= null)
    {
        var @objectToReturn = new AbpPermissions
        {
          

            Name = name,
            IsGranted = isGranted,
            CreationTime = creationTime,
            CreatorUserId = creatorUserId,
            RoleId = roleId,
            UserId = userId,
            Discriminator = discriminator,
            TenantId = tenantId
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Id")]
        [DataMember]
        [Key]
        public virtual Int64 Id { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Name")]
        [DataMember]
        [Required]
        [StringLength(128)]
        public virtual String Name { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("IsGranted")]
        [DataMember]
        [Required]
        
        public virtual Boolean IsGranted { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreationTime")]
        [DataMember]
        [Required]
        
        public virtual DateTime CreationTime { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatorUserId")]
        [DataMember]
        
        public virtual Int64? CreatorUserId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("RoleId")]
        [DataMember]
        
        public virtual Int32? RoleId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UserId")]
        [DataMember]
        
        public virtual Int64? UserId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Discriminator")]
        [DataMember]
        [Required]
        [StringLength(128)]
        public virtual String Discriminator { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        
        public virtual Int32? TenantId { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("AbpRoles")]
    public partial class AbpRoles
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected AbpRoles()
    {

    }
        public static  AbpRoles Create(
                        String name,
                        String displayName,
                        Boolean isStatic,
                        Boolean isDefault,
                        Boolean isDeleted,
                        DateTime creationTime,
                        Int32? tenantId= null,
                        Int64? deleterUserId= null,
                        DateTime? deletionTime= null,
                        DateTime? lastModificationTime= null,
                        Int64? lastModifierUserId= null,
                        Int64? creatorUserId= null)
    {
        var @objectToReturn = new AbpRoles
        {
          

            TenantId = tenantId,
            Name = name,
            DisplayName = displayName,
            IsStatic = isStatic,
            IsDefault = isDefault,
            IsDeleted = isDeleted,
            DeleterUserId = deleterUserId,
            DeletionTime = deletionTime,
            LastModificationTime = lastModificationTime,
            LastModifierUserId = lastModifierUserId,
            CreationTime = creationTime,
            CreatorUserId = creatorUserId
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Id")]
        [DataMember]
        [Key]
        public virtual Int32 Id { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        
        public virtual Int32? TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Name")]
        [DataMember]
        [Required]
        [StringLength(32)]
        public virtual String Name { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DisplayName")]
        [DataMember]
        [Required]
        [StringLength(64)]
        public virtual String DisplayName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("IsStatic")]
        [DataMember]
        [Required]
        
        public virtual Boolean IsStatic { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("IsDefault")]
        [DataMember]
        [Required]
        
        public virtual Boolean IsDefault { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("IsDeleted")]
        [DataMember]
        [Required]
        
        public virtual Boolean IsDeleted { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DeleterUserId")]
        [DataMember]
        
        public virtual Int64? DeleterUserId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DeletionTime")]
        [DataMember]
        
        public virtual DateTime? DeletionTime { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("LastModificationTime")]
        [DataMember]
        
        public virtual DateTime? LastModificationTime { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("LastModifierUserId")]
        [DataMember]
        
        public virtual Int64? LastModifierUserId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreationTime")]
        [DataMember]
        [Required]
        
        public virtual DateTime CreationTime { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatorUserId")]
        [DataMember]
        
        public virtual Int64? CreatorUserId { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("AbpUsers")]
    public partial class AbpUsers
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected AbpUsers()
    {

    }
        public static  AbpUsers Create(
                        String name,
                        String surname,
                        String userName,
                        String password,
                        String emailAddress,
                        Boolean isEmailConfirmed,
                        Boolean isActive,
                        Boolean isDeleted,
                        DateTime creationTime,
                        Int32 accessFailedCount,
                        Boolean isLockoutEnabled,
                        Boolean isPhoneNumberConfirmed,
                        Boolean isTwoFactorEnabled,
                        Int32? tenantId= null,
                        String authenticationSource= null,
                        String emailConfirmationCode= null,
                        String passwordResetCode= null,
                        DateTime? lastLoginTime= null,
                        Int64? deleterUserId= null,
                        DateTime? deletionTime= null,
                        DateTime? lastModificationTime= null,
                        Int64? lastModifierUserId= null,
                        Int64? creatorUserId= null,
                        DateTime? lockoutEndDateUtc= null,
                        String phoneNumber= null,
                        String securityStamp= null)
    {
        var @objectToReturn = new AbpUsers
        {
          

            TenantId = tenantId,
            AuthenticationSource = authenticationSource,
            Name = name,
            Surname = surname,
            UserName = userName,
            Password = password,
            EmailAddress = emailAddress,
            IsEmailConfirmed = isEmailConfirmed,
            EmailConfirmationCode = emailConfirmationCode,
            PasswordResetCode = passwordResetCode,
            LastLoginTime = lastLoginTime,
            IsActive = isActive,
            IsDeleted = isDeleted,
            DeleterUserId = deleterUserId,
            DeletionTime = deletionTime,
            LastModificationTime = lastModificationTime,
            LastModifierUserId = lastModifierUserId,
            CreationTime = creationTime,
            CreatorUserId = creatorUserId,
            LockoutEndDateUtc = lockoutEndDateUtc,
            AccessFailedCount = accessFailedCount,
            IsLockoutEnabled = isLockoutEnabled,
            PhoneNumber = phoneNumber,
            IsPhoneNumberConfirmed = isPhoneNumberConfirmed,
            SecurityStamp = securityStamp,
            IsTwoFactorEnabled = isTwoFactorEnabled
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Id")]
        [DataMember]
        [Key]
        public virtual Int64 Id { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        
        public virtual Int32? TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AuthenticationSource")]
        [DataMember]
        [StringLength(64)]
        public virtual String AuthenticationSource { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Name")]
        [DataMember]
        [Required]
        [StringLength(32)]
        public virtual String Name { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Surname")]
        [DataMember]
        [Required]
        [StringLength(32)]
        public virtual String Surname { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UserName")]
        [DataMember]
        [Required]
        [StringLength(32)]
        public virtual String UserName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Password")]
        [DataMember]
        [Required]
        [StringLength(128)]
        public virtual String Password { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("EmailAddress")]
        [DataMember]
        [Required]
        [StringLength(256)]
        public virtual String EmailAddress { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("IsEmailConfirmed")]
        [DataMember]
        [Required]
        
        public virtual Boolean IsEmailConfirmed { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("EmailConfirmationCode")]
        [DataMember]
        [StringLength(128)]
        public virtual String EmailConfirmationCode { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("PasswordResetCode")]
        [DataMember]
        [StringLength(328)]
        public virtual String PasswordResetCode { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("LastLoginTime")]
        [DataMember]
        
        public virtual DateTime? LastLoginTime { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("IsActive")]
        [DataMember]
        [Required]
        
        public virtual Boolean IsActive { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("IsDeleted")]
        [DataMember]
        [Required]
        
        public virtual Boolean IsDeleted { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DeleterUserId")]
        [DataMember]
        
        public virtual Int64? DeleterUserId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DeletionTime")]
        [DataMember]
        
        public virtual DateTime? DeletionTime { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("LastModificationTime")]
        [DataMember]
        
        public virtual DateTime? LastModificationTime { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("LastModifierUserId")]
        [DataMember]
        
        public virtual Int64? LastModifierUserId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreationTime")]
        [DataMember]
        [Required]
        
        public virtual DateTime CreationTime { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatorUserId")]
        [DataMember]
        
        public virtual Int64? CreatorUserId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("LockoutEndDateUtc")]
        [DataMember]
        
        public virtual DateTime? LockoutEndDateUtc { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AccessFailedCount")]
        [DataMember]
        [Required]
        
        public virtual Int32 AccessFailedCount { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("IsLockoutEnabled")]
        [DataMember]
        [Required]
        
        public virtual Boolean IsLockoutEnabled { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("PhoneNumber")]
        [DataMember]
        [StringLength(2147483647)]
        public virtual String PhoneNumber { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("IsPhoneNumberConfirmed")]
        [DataMember]
        [Required]
        
        public virtual Boolean IsPhoneNumberConfirmed { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("SecurityStamp")]
        [DataMember]
        [StringLength(2147483647)]
        public virtual String SecurityStamp { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("IsTwoFactorEnabled")]
        [DataMember]
        [Required]
        
        public virtual Boolean IsTwoFactorEnabled { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("AbpUserRoles")]
    public partial class AbpUserRoles
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected AbpUserRoles()
    {

    }
        public static  AbpUserRoles Create(
                        Int64 userId,
                        Int32 roleId,
                        DateTime creationTime,
                        Int64? creatorUserId= null,
                        Int32? tenantId= null)
    {
        var @objectToReturn = new AbpUserRoles
        {
          

            UserId = userId,
            RoleId = roleId,
            CreationTime = creationTime,
            CreatorUserId = creatorUserId,
            TenantId = tenantId
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Id")]
        [DataMember]
        [Key]
        public virtual Int64 Id { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UserId")]
        [DataMember]
        [Required]
        
        public virtual Int64 UserId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("RoleId")]
        [DataMember]
        [Required]
        
        public virtual Int32 RoleId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreationTime")]
        [DataMember]
        [Required]
        
        public virtual DateTime CreationTime { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatorUserId")]
        [DataMember]
        
        public virtual Int64? CreatorUserId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        
        public virtual Int32? TenantId { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("AbpTenants")]
    public partial class AbpTenants
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected AbpTenants()
    {

    }
        public static  AbpTenants Create(
                        String tenancyName,
                        String name,
                        Boolean isActive,
                        Boolean isDeleted,
                        DateTime creationTime,
                        Int64? deleterUserId= null,
                        DateTime? deletionTime= null,
                        DateTime? lastModificationTime= null,
                        Int64? lastModifierUserId= null,
                        Int64? creatorUserId= null,
                        Int32? editionId= null,
                        String connectionString= null)
    {
        var @objectToReturn = new AbpTenants
        {
          

            TenancyName = tenancyName,
            Name = name,
            IsActive = isActive,
            IsDeleted = isDeleted,
            DeleterUserId = deleterUserId,
            DeletionTime = deletionTime,
            LastModificationTime = lastModificationTime,
            LastModifierUserId = lastModifierUserId,
            CreationTime = creationTime,
            CreatorUserId = creatorUserId,
            EditionId = editionId,
            ConnectionString = connectionString
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Id")]
        [DataMember]
        [Key]
        public virtual Int32 Id { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenancyName")]
        [DataMember]
        [Required]
        [StringLength(64)]
        public virtual String TenancyName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Name")]
        [DataMember]
        [Required]
        [StringLength(128)]
        public virtual String Name { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("IsActive")]
        [DataMember]
        [Required]
        
        public virtual Boolean IsActive { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("IsDeleted")]
        [DataMember]
        [Required]
        
        public virtual Boolean IsDeleted { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DeleterUserId")]
        [DataMember]
        
        public virtual Int64? DeleterUserId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DeletionTime")]
        [DataMember]
        
        public virtual DateTime? DeletionTime { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("LastModificationTime")]
        [DataMember]
        
        public virtual DateTime? LastModificationTime { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("LastModifierUserId")]
        [DataMember]
        
        public virtual Int64? LastModifierUserId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreationTime")]
        [DataMember]
        [Required]
        
        public virtual DateTime CreationTime { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatorUserId")]
        [DataMember]
        
        public virtual Int64? CreatorUserId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("EditionId")]
        [DataMember]
        
        public virtual Int32? EditionId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ConnectionString")]
        [DataMember]
        [StringLength(1024)]
        public virtual String ConnectionString { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("PatientReviewOfSystem")]
    public partial class PatientReviewOfSystem
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected PatientReviewOfSystem()
    {

    }
        public static  PatientReviewOfSystem Create(
                        Int64 pid,
                        Int64 visitId,
                        Int32 tenantId,
                        Int32 reviewOfSystemCodeId,
                        Boolean normalLimits,
                        DateTime createDate,
                        Int64 createdBy,
                        String note= null)
    {
        var @objectToReturn = new PatientReviewOfSystem
        {
          

            Pid = pid,
            VisitId = visitId,
            TenantId = tenantId,
            ReviewOfSystemCodeId = reviewOfSystemCodeId,
            NormalLimits = normalLimits,
            Note = note,
            CreateDate = createDate,
            CreatedBy = createdBy
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Id")]
        [DataMember]
        [Key]
        public virtual Int64 Id { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Pid")]
        [DataMember]
        [Required]
        
        public virtual Int64 Pid { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("VisitId")]
        [DataMember]
        [Required]
        
        public virtual Int64 VisitId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        [Required]
        
        public virtual Int32 TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ReviewOfSystemCodeId")]
        [DataMember]
        [Required]
        
        public virtual Int32 ReviewOfSystemCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("NormalLimits")]
        [DataMember]
        [Required]
        
        public virtual Boolean NormalLimits { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Note")]
        [DataMember]
        [StringLength(2147483647)]
        public virtual String Note { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreateDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime CreateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatedBy")]
        [DataMember]
        [Required]
        
        public virtual Int64 CreatedBy { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("Prescription")]
    public partial class Prescription
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected Prescription()
    {

    }
        public static  Prescription Create(
                        Int64 pid,
                        Int64 visitId,
                        Boolean archived,
                        Int32 tenantId,
                        Int32 drugId,
                        Int32 doseUnitCodeId,
                        Single doseSize,
                        Int32 dosage,
                        Int32 frequencyCodeId,
                        Int32 drugRouteCodeId,
                        Int32 drugFormCodeId,
                        Int32 quantity,
                        Int32 providerId,
                        DateTime startDate,
                        Int32 duration,
                        Int32 therapyCodeId,
                        Boolean substitutionAllowed,
                        DateTime createDate,
                        Int64 createdBy,
                        Int64? parentId= null,
                        String rxNormName= null,
                        Int32? refills= null,
                        DateTime? endDate= null,
                        DateTime? refillDate= null,
                        String note= null,
                        Int32? statusCodeId= null,
                        DateTime? updateDate= null,
                        Int64? updatedBy= null)
    {
        var @objectToReturn = new Prescription
        {
          

            Pid = pid,
            VisitId = visitId,
            Archived = archived,
            ParentId = parentId,
            TenantId = tenantId,
            DrugId = drugId,
            RxNormName = rxNormName,
            DoseUnitCodeId = doseUnitCodeId,
            DoseSize = doseSize,
            Dosage = dosage,
            FrequencyCodeId = frequencyCodeId,
            DrugRouteCodeId = drugRouteCodeId,
            DrugFormCodeId = drugFormCodeId,
            Quantity = quantity,
            Refills = refills,
            ProviderId = providerId,
            StartDate = startDate,
            Duration = duration,
            EndDate = endDate,
            RefillDate = refillDate,
            TherapyCodeId = therapyCodeId,
            SubstitutionAllowed = substitutionAllowed,
            Note = note,
            StatusCodeId = statusCodeId,
            CreateDate = createDate,
            UpdateDate = updateDate,
            CreatedBy = createdBy,
            UpdatedBy = updatedBy
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("PrescriptionId")]
        [DataMember]
        [Key]
        public virtual Int64 PrescriptionId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Pid")]
        [DataMember]
        [Required]
        
        public virtual Int64 Pid { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("VisitId")]
        [DataMember]
        [Required]
        
        public virtual Int64 VisitId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Archived")]
        [DataMember]
        [Required]
        
        public virtual Boolean Archived { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ParentId")]
        [DataMember]
        
        public virtual Int64? ParentId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        [Required]
        
        public virtual Int32 TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DrugId")]
        [DataMember]
        [Required]
        
        public virtual Int32 DrugId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("RxNormName")]
        [DataMember]
        [StringLength(1000)]
        public virtual String RxNormName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DoseUnitCodeId")]
        [DataMember]
        [Required]
        
        public virtual Int32 DoseUnitCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DoseSize")]
        [DataMember]
        [Required]
        
        public virtual Single DoseSize { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Dosage")]
        [DataMember]
        [Required]
        
        public virtual Int32 Dosage { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("FrequencyCodeId")]
        [DataMember]
        [Required]
        
        public virtual Int32 FrequencyCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DrugRouteCodeId")]
        [DataMember]
        [Required]
        
        public virtual Int32 DrugRouteCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DrugFormCodeId")]
        [DataMember]
        [Required]
        
        public virtual Int32 DrugFormCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Quantity")]
        [DataMember]
        [Required]
        
        public virtual Int32 Quantity { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Refills")]
        [DataMember]
        
        public virtual Int32? Refills { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ProviderId")]
        [DataMember]
        [Required]
        
        public virtual Int32 ProviderId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("StartDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime StartDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Duration")]
        [DataMember]
        [Required]
        
        public virtual Int32 Duration { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("EndDate")]
        [DataMember]
        
        public virtual DateTime? EndDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("RefillDate")]
        [DataMember]
        
        public virtual DateTime? RefillDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TherapyCodeId")]
        [DataMember]
        [Required]
        
        public virtual Int32 TherapyCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("SubstitutionAllowed")]
        [DataMember]
        [Required]
        
        public virtual Boolean SubstitutionAllowed { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Note")]
        [DataMember]
        [StringLength(2147483647)]
        public virtual String Note { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("StatusCodeId")]
        [DataMember]
        
        public virtual Int32? StatusCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreateDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime CreateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdateDate")]
        [DataMember]
        
        public virtual DateTime? UpdateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatedBy")]
        [DataMember]
        [Required]
        
        public virtual Int64 CreatedBy { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdatedBy")]
        [DataMember]
        
        public virtual Int64? UpdatedBy { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("AbnormalCode")]
    public partial class AbnormalCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected AbnormalCode()
    {

    }
        public static  AbnormalCode Create(
                        String abnormalCodeName)
    {
        var @objectToReturn = new AbnormalCode
        {
          

            AbnormalCodeName = abnormalCodeName
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AbnormalCodeId")]
        [DataMember]
        [Key]
        public virtual Int32 AbnormalCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AbnormalCodeName")]
        [DataMember]
        [Required]
        [StringLength(30)]
        public virtual String AbnormalCodeName { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("AdministrationSite")]
    public partial class AdministrationSite
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected AdministrationSite()
    {

    }
        public static  AdministrationSite Create(
                        String administrationSiteName,
                        Int32 tenantId)
    {
        var @objectToReturn = new AdministrationSite
        {
          

            AdministrationSiteName = administrationSiteName,
            TenantId = tenantId
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AdministrationSiteId")]
        [DataMember]
        [Key]
        public virtual Int32 AdministrationSiteId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AdministrationSiteName")]
        [DataMember]
        [Required]
        [StringLength(200)]
        public virtual String AdministrationSiteName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        [Required]
        
        public virtual Int32 TenantId { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("PrescriptionCondition")]
    public partial class PrescriptionCondition
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected PrescriptionCondition()
    {

    }
        public static  PrescriptionCondition Create(
                        Int64 prescriptionId,
                        String iCDCodeCNId,
                        Boolean primaryCondition)
    {
        var @objectToReturn = new PrescriptionCondition
        {
          
            PrescriptionId = prescriptionId,
            ICDCodeCNId = iCDCodeCNId,
            PrimaryCondition = primaryCondition
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("PrescriptionId")]
        [DataMember]
        
        [Key]
        public virtual Int64 PrescriptionId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ICDCodeCNId")]
        [DataMember]
        [StringLength(7)]
        [Key]
        public virtual String ICDCodeCNId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("PrimaryCondition")]
        [DataMember]
        [Required]
        
        public virtual Boolean PrimaryCondition { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("AllergyCategoryCode")]
    public partial class AllergyCategoryCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected AllergyCategoryCode()
    {

    }
        public static  AllergyCategoryCode Create(
                        Int32 allergyCategoryCodeId,
                        String categoryName)
    {
        var @objectToReturn = new AllergyCategoryCode
        {
          
            AllergyCategoryCodeId = allergyCategoryCodeId,
            CategoryName = categoryName
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AllergyCategoryCodeId")]
        [DataMember]
        
        [Key]
        public virtual Int32 AllergyCategoryCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CategoryName")]
        [DataMember]
        [Required]
        [StringLength(1000)]
        public virtual String CategoryName { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("PriorityCode")]
    public partial class PriorityCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected PriorityCode()
    {

    }
        public static  PriorityCode Create(
                        String priorityCodeName)
    {
        var @objectToReturn = new PriorityCode
        {
          

            PriorityCodeName = priorityCodeName
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("PriorityCodeId")]
        [DataMember]
        [Key]
        public virtual Int32 PriorityCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("PriorityCodeName")]
        [DataMember]
        [Required]
        [StringLength(100)]
        public virtual String PriorityCodeName { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("AllergyCode")]
    public partial class AllergyCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected AllergyCode()
    {

    }
        public static  AllergyCode Create(
                        Int32 allergyCodeId,
                        String allergyName)
    {
        var @objectToReturn = new AllergyCode
        {
          
            AllergyCodeId = allergyCodeId,
            AllergyName = allergyName
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AllergyCodeId")]
        [DataMember]
        
        [Key]
        public virtual Int32 AllergyCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AllergyName")]
        [DataMember]
        [Required]
        [StringLength(1000)]
        public virtual String AllergyName { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("ProcedureOrder")]
    public partial class ProcedureOrder
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected ProcedureOrder()
    {

    }
        public static  ProcedureOrder Create(
                        Int64 pid,
                        Int64 visitId,
                        Int32 tenantId,
                        Int32 priorityCodeId,
                        DateTime orderDate,
                        Int64 orderdById,
                        String loincCodeId,
                        Int32 statusCodeId,
                        DateTime createDate,
                        DateTime updateDate,
                        Int64 createdBy,
                        Int64 updatedBy,
                        String note= null)
    {
        var @objectToReturn = new ProcedureOrder
        {
          

            Pid = pid,
            VisitId = visitId,
            TenantId = tenantId,
            PriorityCodeId = priorityCodeId,
            OrderDate = orderDate,
            OrderdById = orderdById,
            LoincCodeId = loincCodeId,
            Note = note,
            StatusCodeId = statusCodeId,
            CreateDate = createDate,
            UpdateDate = updateDate,
            CreatedBy = createdBy,
            UpdatedBy = updatedBy
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Id")]
        [DataMember]
        [Key]
        public virtual Int64 Id { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Pid")]
        [DataMember]
        [Required]
        
        public virtual Int64 Pid { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("VisitId")]
        [DataMember]
        [Required]
        
        public virtual Int64 VisitId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        [Required]
        
        public virtual Int32 TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("PriorityCodeId")]
        [DataMember]
        [Required]
        
        public virtual Int32 PriorityCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("OrderDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime OrderDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("OrderdById")]
        [DataMember]
        [Required]
        
        public virtual Int64 OrderdById { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("LoincCodeId")]
        [DataMember]
        [Required]
        [StringLength(10)]
        public virtual String LoincCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Note")]
        [DataMember]
        [StringLength(2147483647)]
        public virtual String Note { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("StatusCodeId")]
        [DataMember]
        [Required]
        
        public virtual Int32 StatusCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreateDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime CreateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdateDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime UpdateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatedBy")]
        [DataMember]
        [Required]
        
        public virtual Int64 CreatedBy { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdatedBy")]
        [DataMember]
        [Required]
        
        public virtual Int64 UpdatedBy { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("AllergyReactionCode")]
    public partial class AllergyReactionCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected AllergyReactionCode()
    {

    }
        public static  AllergyReactionCode Create(
                        Int32 reactionTypeId,
                        String reactionName)
    {
        var @objectToReturn = new AllergyReactionCode
        {
          
            ReactionTypeId = reactionTypeId,
            ReactionName = reactionName
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ReactionTypeId")]
        [DataMember]
        
        [Key]
        public virtual Int32 ReactionTypeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ReactionName")]
        [DataMember]
        [Required]
        [StringLength(1000)]
        public virtual String ReactionName { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("RelationshipCode")]
    public partial class RelationshipCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected RelationshipCode()
    {

    }
        public static  RelationshipCode Create(
                        String relationshipCodeName)
    {
        var @objectToReturn = new RelationshipCode
        {
          

            RelationshipCodeName = relationshipCodeName
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("RelationshipCodeId")]
        [DataMember]
        [Key]
        public virtual Int32 RelationshipCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("RelationshipCodeName")]
        [DataMember]
        [Required]
        [StringLength(100)]
        public virtual String RelationshipCodeName { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("AllergySeverityCode")]
    public partial class AllergySeverityCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected AllergySeverityCode()
    {

    }
        public static  AllergySeverityCode Create(
                        Int32 allergySeverityCodeId,
                        String allergySeverityCodeName)
    {
        var @objectToReturn = new AllergySeverityCode
        {
          
            AllergySeverityCodeId = allergySeverityCodeId,
            AllergySeverityCodeName = allergySeverityCodeName
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AllergySeverityCodeId")]
        [DataMember]
        
        [Key]
        public virtual Int32 AllergySeverityCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AllergySeverityCodeName")]
        [DataMember]
        [Required]
        [StringLength(1000)]
        public virtual String AllergySeverityCodeName { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("ResultDataCode")]
    public partial class ResultDataCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected ResultDataCode()
    {

    }
        public static  ResultDataCode Create(
                        String resultDataCodeName)
    {
        var @objectToReturn = new ResultDataCode
        {
          

            ResultDataCodeName = resultDataCodeName
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ResultDataCodeId")]
        [DataMember]
        [Key]
        public virtual Int32 ResultDataCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ResultDataCodeName")]
        [DataMember]
        [Required]
        [StringLength(10)]
        public virtual String ResultDataCodeName { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("AllergyTypeCode")]
    public partial class AllergyTypeCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected AllergyTypeCode()
    {

    }
        public static  AllergyTypeCode Create(
                        Int32 allergyTypeId,
                        String allergyTypeName,
                        Int32 priority)
    {
        var @objectToReturn = new AllergyTypeCode
        {
          
            AllergyTypeId = allergyTypeId,
            AllergyTypeName = allergyTypeName,
            Priority = priority
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AllergyTypeId")]
        [DataMember]
        
        [Key]
        public virtual Int32 AllergyTypeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AllergyTypeName")]
        [DataMember]
        [Required]
        [StringLength(1000)]
        public virtual String AllergyTypeName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Priority")]
        [DataMember]
        [Required]
        
        public virtual Int32 Priority { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("ResultStatusCode")]
    public partial class ResultStatusCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected ResultStatusCode()
    {

    }
        public static  ResultStatusCode Create(
                        String resultStatusCodeName)
    {
        var @objectToReturn = new ResultStatusCode
        {
          

            ResultStatusCodeName = resultStatusCodeName
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ResultStatusCodeId")]
        [DataMember]
        [Key]
        public virtual Int32 ResultStatusCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ResultStatusCodeName")]
        [DataMember]
        [Required]
        [StringLength(100)]
        public virtual String ResultStatusCodeName { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("ReviewOfSystemCode")]
    public partial class ReviewOfSystemCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected ReviewOfSystemCode()
    {

    }
        public static  ReviewOfSystemCode Create(
                        Int32 reviewOfSystemCodeId,
                        Int32 reviewOfSystemGroupCodeId,
                        String reviewOfSystemCodeName,
                        Boolean isShortCode)
    {
        var @objectToReturn = new ReviewOfSystemCode
        {
          
            ReviewOfSystemCodeId = reviewOfSystemCodeId,
            ReviewOfSystemGroupCodeId = reviewOfSystemGroupCodeId,
            ReviewOfSystemCodeName = reviewOfSystemCodeName,
            IsShortCode = isShortCode
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ReviewOfSystemCodeId")]
        [DataMember]
        
        [Key]
        public virtual Int32 ReviewOfSystemCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ReviewOfSystemGroupCodeId")]
        [DataMember]
        [Required]
        
        public virtual Int32 ReviewOfSystemGroupCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ReviewOfSystemCodeName")]
        [DataMember]
        [Required]
        [StringLength(255)]
        public virtual String ReviewOfSystemCodeName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("IsShortCode")]
        [DataMember]
        [Required]
        
        public virtual Boolean IsShortCode { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("ReviewOfSystemGroupCode")]
    public partial class ReviewOfSystemGroupCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected ReviewOfSystemGroupCode()
    {

    }
        public static  ReviewOfSystemGroupCode Create(
                        Int32 reviewOfSystemGroupCodeId,
                        String reviewOfSystemGroupCodeName,
                        Int32 sortOrder)
    {
        var @objectToReturn = new ReviewOfSystemGroupCode
        {
          
            ReviewOfSystemGroupCodeId = reviewOfSystemGroupCodeId,
            ReviewOfSystemGroupCodeName = reviewOfSystemGroupCodeName,
            SortOrder = sortOrder
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ReviewOfSystemGroupCodeId")]
        [DataMember]
        
        [Key]
        public virtual Int32 ReviewOfSystemGroupCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ReviewOfSystemGroupCodeName")]
        [DataMember]
        [Required]
        [StringLength(255)]
        public virtual String ReviewOfSystemGroupCodeName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("SortOrder")]
        [DataMember]
        [Required]
        
        public virtual Int32 SortOrder { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("SpecimenCode")]
    public partial class SpecimenCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected SpecimenCode()
    {

    }
        public static  SpecimenCode Create(
                        String specimenCodeName)
    {
        var @objectToReturn = new SpecimenCode
        {
          

            SpecimenCodeName = specimenCodeName
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("SpecimenCodeId")]
        [DataMember]
        [Key]
        public virtual Int32 SpecimenCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("SpecimenCodeName")]
        [DataMember]
        [Required]
        [StringLength(100)]
        public virtual String SpecimenCodeName { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("CompletionStatusCode")]
    public partial class CompletionStatusCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected CompletionStatusCode()
    {

    }
        public static  CompletionStatusCode Create(
                        String completionStatusName)
    {
        var @objectToReturn = new CompletionStatusCode
        {
          

            CompletionStatusName = completionStatusName
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CompletionStatusCodeId")]
        [DataMember]
        [Key]
        public virtual Int32 CompletionStatusCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CompletionStatusName")]
        [DataMember]
        [Required]
        [StringLength(100)]
        public virtual String CompletionStatusName { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("StatusCode")]
    public partial class StatusCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected StatusCode()
    {

    }
        public static  StatusCode Create(
                        String statusCodeName)
    {
        var @objectToReturn = new StatusCode
        {
          

            StatusCodeName = statusCodeName
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("StatusCodeId")]
        [DataMember]
        [Key]
        public virtual Int32 StatusCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("StatusCodeName")]
        [DataMember]
        [Required]
        [StringLength(2147483647)]
        public virtual String StatusCodeName { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("Diagnosis")]
    public partial class Diagnosis
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected Diagnosis()
    {

    }
        public static  Diagnosis Create(
                        Int64 pid,
                        Int64 visitId,
                        Boolean archived,
                        Int32 tenantId,
                        String iCDCodeCNId,
                        DateTime createDate,
                        Int64 createdBy,
                        Int64? parentId= null,
                        DateTime? diagnosisDate= null,
                        Int64? administeredById= null,
                        Int32? administrationSiteId= null,
                        String note= null,
                        Int32? statusCodeId= null,
                        DateTime? updateDate= null,
                        Int64? updatedBy= null)
    {
        var @objectToReturn = new Diagnosis
        {
          

            Pid = pid,
            VisitId = visitId,
            Archived = archived,
            ParentId = parentId,
            TenantId = tenantId,
            ICDCodeCNId = iCDCodeCNId,
            DiagnosisDate = diagnosisDate,
            AdministeredById = administeredById,
            AdministrationSiteId = administrationSiteId,
            Note = note,
            StatusCodeId = statusCodeId,
            CreateDate = createDate,
            UpdateDate = updateDate,
            CreatedBy = createdBy,
            UpdatedBy = updatedBy
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Id")]
        [DataMember]
        [Key]
        public virtual Int64 Id { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Pid")]
        [DataMember]
        [Required]
        
        public virtual Int64 Pid { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("VisitId")]
        [DataMember]
        [Required]
        
        public virtual Int64 VisitId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Archived")]
        [DataMember]
        [Required]
        
        public virtual Boolean Archived { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ParentId")]
        [DataMember]
        
        public virtual Int64? ParentId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        [Required]
        
        public virtual Int32 TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ICDCodeCNId")]
        [DataMember]
        [Required]
        [StringLength(7)]
        public virtual String ICDCodeCNId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DiagnosisDate")]
        [DataMember]
        
        public virtual DateTime? DiagnosisDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AdministeredById")]
        [DataMember]
        
        public virtual Int64? AdministeredById { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AdministrationSiteId")]
        [DataMember]
        
        public virtual Int32? AdministrationSiteId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Note")]
        [DataMember]
        [StringLength(2147483647)]
        public virtual String Note { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("StatusCodeId")]
        [DataMember]
        
        public virtual Int32? StatusCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreateDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime CreateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdateDate")]
        [DataMember]
        
        public virtual DateTime? UpdateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatedBy")]
        [DataMember]
        [Required]
        
        public virtual Int64 CreatedBy { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdatedBy")]
        [DataMember]
        
        public virtual Int64? UpdatedBy { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("Surgery")]
    public partial class Surgery
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected Surgery()
    {

    }
        public static  Surgery Create(
                        Int64 pid,
                        Int64 visitId,
                        Boolean archived,
                        Int32 tenantId,
                        String iCDCodePCSId,
                        Int32 outcomeCodeId,
                        DateTime createDate,
                        Int64 createdBy,
                        Int64? parentId= null,
                        DateTime? surgeryDate= null,
                        Int64? administeredById= null,
                        Int32? administrationSiteId= null,
                        String note= null,
                        Int32? statusCodeId= null,
                        DateTime? updateDate= null,
                        Int64? updatedBy= null)
    {
        var @objectToReturn = new Surgery
        {
          

            Pid = pid,
            VisitId = visitId,
            Archived = archived,
            ParentId = parentId,
            TenantId = tenantId,
            ICDCodePCSId = iCDCodePCSId,
            SurgeryDate = surgeryDate,
            AdministeredById = administeredById,
            AdministrationSiteId = administrationSiteId,
            OutcomeCodeId = outcomeCodeId,
            Note = note,
            StatusCodeId = statusCodeId,
            CreateDate = createDate,
            UpdateDate = updateDate,
            CreatedBy = createdBy,
            UpdatedBy = updatedBy
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Id")]
        [DataMember]
        [Key]
        public virtual Int64 Id { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Pid")]
        [DataMember]
        [Required]
        
        public virtual Int64 Pid { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("VisitId")]
        [DataMember]
        [Required]
        
        public virtual Int64 VisitId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Archived")]
        [DataMember]
        [Required]
        
        public virtual Boolean Archived { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ParentId")]
        [DataMember]
        
        public virtual Int64? ParentId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        [Required]
        
        public virtual Int32 TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ICDCodePCSId")]
        [DataMember]
        [Required]
        [StringLength(7)]
        public virtual String ICDCodePCSId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("SurgeryDate")]
        [DataMember]
        
        public virtual DateTime? SurgeryDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AdministeredById")]
        [DataMember]
        
        public virtual Int64? AdministeredById { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("AdministrationSiteId")]
        [DataMember]
        
        public virtual Int32? AdministrationSiteId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("OutcomeCodeId")]
        [DataMember]
        [Required]
        
        public virtual Int32 OutcomeCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Note")]
        [DataMember]
        [StringLength(2147483647)]
        public virtual String Note { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("StatusCodeId")]
        [DataMember]
        
        public virtual Int32? StatusCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreateDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime CreateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdateDate")]
        [DataMember]
        
        public virtual DateTime? UpdateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatedBy")]
        [DataMember]
        [Required]
        
        public virtual Int64 CreatedBy { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdatedBy")]
        [DataMember]
        
        public virtual Int64? UpdatedBy { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("Document")]
    public partial class Document
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected Document()
    {

    }
        public static  Document Create(
                        Int64 pid,
                        Int32 tenantId,
                        Int32 documentTypeCodeId,
                        Int32 documentCategoryCodeId,
                        String serverFileName,
                        DateTime createDate,
                        Int64 createdBy,
                        String documentDescription= null,
                        String note= null,
                        Int32? statusCodeId= null,
                        DateTime? updateDate= null,
                        Int64? updatedBy= null)
    {
        var @objectToReturn = new Document
        {
          

            Pid = pid,
            TenantId = tenantId,
            DocumentTypeCodeId = documentTypeCodeId,
            DocumentCategoryCodeId = documentCategoryCodeId,
            ServerFileName = serverFileName,
            DocumentDescription = documentDescription,
            Note = note,
            StatusCodeId = statusCodeId,
            CreateDate = createDate,
            UpdateDate = updateDate,
            CreatedBy = createdBy,
            UpdatedBy = updatedBy
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Id")]
        [DataMember]
        [Key]
        public virtual Int64 Id { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Pid")]
        [DataMember]
        [Required]
        
        public virtual Int64 Pid { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TenantId")]
        [DataMember]
        [Required]
        
        public virtual Int32 TenantId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DocumentTypeCodeId")]
        [DataMember]
        [Required]
        
        public virtual Int32 DocumentTypeCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DocumentCategoryCodeId")]
        [DataMember]
        [Required]
        
        public virtual Int32 DocumentCategoryCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("ServerFileName")]
        [DataMember]
        [Required]
        [StringLength(1024)]
        public virtual String ServerFileName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("DocumentDescription")]
        [DataMember]
        [StringLength(255)]
        public virtual String DocumentDescription { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("Note")]
        [DataMember]
        [StringLength(2147483647)]
        public virtual String Note { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("StatusCodeId")]
        [DataMember]
        
        public virtual Int32? StatusCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreateDate")]
        [DataMember]
        [Required]
        
        public virtual DateTime CreateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdateDate")]
        [DataMember]
        
        public virtual DateTime? UpdateDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("CreatedBy")]
        [DataMember]
        [Required]
        
        public virtual Int64 CreatedBy { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("UpdatedBy")]
        [DataMember]
        
        public virtual Int64? UpdatedBy { get; set; }

    }

    [Serializable]
    [DataContract]
    [Table("TherapyCode")]
    public partial class TherapyCode
    {
     /// <summary>
    /// We don't make constructor public and forcing to create object using <see cref="Create"/> method.
    /// But constructor can not be private since it's used by EntityFramework.
    /// Thats why we did it protected.
    /// </summary>
    protected TherapyCode()
    {

    }
        public static  TherapyCode Create(
                        String therapyCodeName)
    {
        var @objectToReturn = new TherapyCode
        {
          

            TherapyCodeName = therapyCodeName
        };

        return @objectToReturn;
    }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TherapyCodeId")]
        [DataMember]
        [Key]
        public virtual Int32 TherapyCodeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [DisplayName("TherapyCodeName")]
        [DataMember]
        [Required]
        [StringLength(100)]
        public virtual String TherapyCodeName { get; set; }

    }

}
