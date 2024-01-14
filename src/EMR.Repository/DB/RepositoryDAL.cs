using System;
using System.Collections.Generic;
using EMR.Base;
using EMR.Entities;
using EMR.DataAccess.Infrastructure.Database;
using System.Threading.Tasks;
using System.Linq;
using System.Data.SqlClient;
using Dapper;
using Abp.Dependency;

namespace EMR.DAL
{

      public interface IDocumentCategoryCodeRepository: ISingletonDependency
      {
          Task<List<DocumentCategoryCode>> GetAllAsync();
          
        Task<DocumentCategoryCode> GetByDocumentCategoryCodeIdAsync(Int32 DocumentCategoryCodeId );
        Task UpdateAsync(DocumentCategoryCode model);

             Task<Int32> InsertAsync(DocumentCategoryCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for DocumentCategoryCode
    /// </summary>
    public partial class DocumentCategoryCodeRepository : RepositoryBase, IDocumentCategoryCodeRepository
    {

        public DocumentCategoryCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<DocumentCategoryCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<DocumentCategoryCode>("DocumentCategoryCode_GetAll", null);
      
                return (result?? new List<DocumentCategoryCode>()).ToList();
        }

        public async Task<DocumentCategoryCode> GetByDocumentCategoryCodeIdAsync(Int32 DocumentCategoryCodeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<DocumentCategoryCode>
                                      ("DocumentCategoryCode_GetByDocumentCategoryCodeId",
                        new 
                        {
                          DocumentCategoryCodeId = DocumentCategoryCodeId 
                          
                        }
                       );
            
          return (result?? new List<DocumentCategoryCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(DocumentCategoryCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("DocumentCategoryCodeId", model.DocumentCategoryCodeId));
                    parameters.Add(new SqlParameter("DocumentCategoryCodeName", model.DocumentCategoryCodeName));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("DocumentCategoryCode_Update", args);
        }


							public async Task<Int32> InsertAsync(DocumentCategoryCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("DocumentCategoryCodeName", model.DocumentCategoryCodeName));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int32>("DocumentCategoryCode_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt32(result);            
        }





    }

      public interface IDocumentOrderResultRepository: ISingletonDependency
      {
          Task<List<DocumentOrderResult>> GetAllAsync();
          
        Task<DocumentOrderResult> GetByDocumentIdAsync(Int64 DocumentId );
        Task UpdateAsync(DocumentOrderResult model);

             Task<Int64> InsertAsync(DocumentOrderResult model);

		      
          
          

        Task<List<DocumentOrderResult>> GetByOrderResultIdAsync(Int64 OrderResultId );

          
          
      }
    /// <summary>
    /// Data access layer for DocumentOrderResult
    /// </summary>
    public partial class DocumentOrderResultRepository : RepositoryBase, IDocumentOrderResultRepository
    {

        public DocumentOrderResultRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<DocumentOrderResult>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<DocumentOrderResult>("DocumentOrderResult_GetAll", null);
      
                return (result?? new List<DocumentOrderResult>()).ToList();
        }

        public async Task<DocumentOrderResult> GetByDocumentIdAsync(Int64 DocumentId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<DocumentOrderResult>
                                      ("DocumentOrderResult_GetByDocumentId",
                        new 
                        {
                          DocumentId = DocumentId 
                          
                        }
                       );
            
          return (result?? new List<DocumentOrderResult>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(DocumentOrderResult model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("DocumentId", model.DocumentId));
                    parameters.Add(new SqlParameter("OrderResultId", model.OrderResultId));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("DocumentOrderResult_Update", args);
        }


							public async Task<Int64> InsertAsync(DocumentOrderResult model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("OrderResultId", model.OrderResultId));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int64>("DocumentOrderResult_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt64(result);            
        }





        public async Task<List<DocumentOrderResult>> GetByOrderResultIdAsync(Int64 OrderResultId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<DocumentOrderResult>
                                      ("DocumentOrderResult_GetByOrderResultId",
                        new 
                        {
                          OrderResultId = OrderResultId 
                          
                        }
                       );
            
          return (result?? new List<DocumentOrderResult>()).ToList();
        }


    }

      public interface IVisitRepository: ISingletonDependency
      {
          Task<List<Visit>> GetAllAsync(int TenantId);
          
        Task<Visit> GetByIdAsync(Int64 Id , int TenantId);
        Task UpdateAsync(Visit model);

             Task<Int64> InsertAsync(Visit model);

		      
          
          

        Task<List<Visit>> GetByTenantIdAsync(Int32 TenantId );


        Task<List<Visit>> GetByPidAsync(Int64 Pid , int TenantId);

          
          
      }
    /// <summary>
    /// Data access layer for Visit
    /// </summary>
    public partial class VisitRepository : RepositoryBase, IVisitRepository
    {

        public VisitRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<Visit>> GetAllAsync(int TenantId)
        {
          var result = await _procExecutor.ExecuteProcAsync<Visit>("Visit_GetAll", new { TenantId });
      
                return (result?? new List<Visit>()).ToList();
        }

        public async Task<Visit> GetByIdAsync(Int64 Id , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<Visit>
                                      ("Visit_GetById",
                        new 
                        {
                          Id = Id 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<Visit>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(Visit model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("Id", model.Id));
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("VisitStatusCodeId", model.VisitStatusCodeId));
                    parameters.Add(new SqlParameter("VisitCodeId", model.VisitCodeId));
                    if(model.AdministrationSiteId.HasValue)
                        parameters.Add(new SqlParameter("AdministrationSiteId", model.AdministrationSiteId.Value));

                    parameters.Add(new SqlParameter("DoctorId", model.DoctorId));
                    parameters.Add(new SqlParameter("NurseId", model.NurseId));
                    if(model.Reason!=null)
                        parameters.Add(new SqlParameter("Reason", model.Reason));

                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate));
                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("Visit_Update", args);
        }


							public async Task<Int64> InsertAsync(Visit model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("VisitStatusCodeId", model.VisitStatusCodeId));
                    parameters.Add(new SqlParameter("VisitCodeId", model.VisitCodeId));
                    if(model.AdministrationSiteId.HasValue)
                        parameters.Add(new SqlParameter("AdministrationSiteId", model.AdministrationSiteId.Value));

                    parameters.Add(new SqlParameter("DoctorId", model.DoctorId));
                    parameters.Add(new SqlParameter("NurseId", model.NurseId));
                    if(model.Reason!=null)
                        parameters.Add(new SqlParameter("Reason", model.Reason));

                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate));
                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int64>("Visit_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt64(result);            
        }





        public async Task<List<Visit>> GetByTenantIdAsync(Int32 TenantId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<Visit>
                                      ("Visit_GetByTenantId",
                        new 
                        {
                          TenantId = TenantId 
                          
                        }
                       );
            
          return (result?? new List<Visit>()).ToList();
        }


        public async Task<List<Visit>> GetByPidAsync(Int64 Pid , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<Visit>
                                      ("Visit_GetByPid",
                        new 
                        {
                          Pid = Pid 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<Visit>()).ToList();
        }


    }

      public interface IDocumentTypeCodeRepository: ISingletonDependency
      {
          Task<List<DocumentTypeCode>> GetAllAsync();
          
        Task<DocumentTypeCode> GetByDocumentTypeCodeIdAsync(Int32 DocumentTypeCodeId );
        Task UpdateAsync(DocumentTypeCode model);

             Task<Int32> InsertAsync(DocumentTypeCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for DocumentTypeCode
    /// </summary>
    public partial class DocumentTypeCodeRepository : RepositoryBase, IDocumentTypeCodeRepository
    {

        public DocumentTypeCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<DocumentTypeCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<DocumentTypeCode>("DocumentTypeCode_GetAll", null);
      
                return (result?? new List<DocumentTypeCode>()).ToList();
        }

        public async Task<DocumentTypeCode> GetByDocumentTypeCodeIdAsync(Int32 DocumentTypeCodeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<DocumentTypeCode>
                                      ("DocumentTypeCode_GetByDocumentTypeCodeId",
                        new 
                        {
                          DocumentTypeCodeId = DocumentTypeCodeId 
                          
                        }
                       );
            
          return (result?? new List<DocumentTypeCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(DocumentTypeCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("DocumentTypeCodeId", model.DocumentTypeCodeId));
                    parameters.Add(new SqlParameter("DocumentTypeCodeName", model.DocumentTypeCodeName));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("DocumentTypeCode_Update", args);
        }


							public async Task<Int32> InsertAsync(DocumentTypeCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("DocumentTypeCodeName", model.DocumentTypeCodeName));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int32>("DocumentTypeCode_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt32(result);            
        }





    }

      public interface IVisitCodeRepository: ISingletonDependency
      {
          Task<List<VisitCode>> GetAllAsync();
          
        Task<VisitCode> GetByVisitCodeIdAsync(Int32 VisitCodeId );
        Task UpdateAsync(VisitCode model);

             Task<Int32> InsertAsync(VisitCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for VisitCode
    /// </summary>
    public partial class VisitCodeRepository : RepositoryBase, IVisitCodeRepository
    {

        public VisitCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<VisitCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<VisitCode>("VisitCode_GetAll", null);
      
                return (result?? new List<VisitCode>()).ToList();
        }

        public async Task<VisitCode> GetByVisitCodeIdAsync(Int32 VisitCodeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<VisitCode>
                                      ("VisitCode_GetByVisitCodeId",
                        new 
                        {
                          VisitCodeId = VisitCodeId 
                          
                        }
                       );
            
          return (result?? new List<VisitCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(VisitCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("VisitCodeId", model.VisitCodeId));
                    parameters.Add(new SqlParameter("VisitCodeName", model.VisitCodeName));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("VisitCode_Update", args);
        }


							public async Task<Int32> InsertAsync(VisitCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("VisitCodeName", model.VisitCodeName));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int32>("VisitCode_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt32(result);            
        }





    }

      public interface IDoseUnitCodeRepository: ISingletonDependency
      {
          Task<List<DoseUnitCode>> GetAllAsync();
          
        Task<DoseUnitCode> GetByDoseUnitCodeIdAsync(Int32 DoseUnitCodeId );
        Task UpdateAsync(DoseUnitCode model);

             Task<Int32> InsertAsync(DoseUnitCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for DoseUnitCode
    /// </summary>
    public partial class DoseUnitCodeRepository : RepositoryBase, IDoseUnitCodeRepository
    {

        public DoseUnitCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<DoseUnitCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<DoseUnitCode>("DoseUnitCode_GetAll", null);
      
                return (result?? new List<DoseUnitCode>()).ToList();
        }

        public async Task<DoseUnitCode> GetByDoseUnitCodeIdAsync(Int32 DoseUnitCodeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<DoseUnitCode>
                                      ("DoseUnitCode_GetByDoseUnitCodeId",
                        new 
                        {
                          DoseUnitCodeId = DoseUnitCodeId 
                          
                        }
                       );
            
          return (result?? new List<DoseUnitCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(DoseUnitCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("DoseUnitCodeId", model.DoseUnitCodeId));
                    parameters.Add(new SqlParameter("DoseUnitCodeName", model.DoseUnitCodeName));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("DoseUnitCode_Update", args);
        }


							public async Task<Int32> InsertAsync(DoseUnitCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("DoseUnitCodeName", model.DoseUnitCodeName));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int32>("DoseUnitCode_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt32(result);            
        }





    }

      public interface IVisitNoteRepository: ISingletonDependency
      {
          Task<List<VisitNote>> GetAllAsync(int TenantId);
          
        Task<VisitNote> GetByIdAsync(Int64 Id , int TenantId);
        Task UpdateAsync(VisitNote model);

             Task<Int64> InsertAsync(VisitNote model);

		      
          
          

        Task<List<VisitNote>> GetByVisitIdAsync(Int64 VisitId , int TenantId);


        Task<List<VisitNote>> GetByTenantIdAsync(Int32 TenantId );


        Task<List<VisitNote>> GetByPidAsync(Int64 Pid , int TenantId);

          
          
      }
    /// <summary>
    /// Data access layer for VisitNote
    /// </summary>
    public partial class VisitNoteRepository : RepositoryBase, IVisitNoteRepository
    {

        public VisitNoteRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<VisitNote>> GetAllAsync(int TenantId)
        {
          var result = await _procExecutor.ExecuteProcAsync<VisitNote>("VisitNote_GetAll", new { TenantId });
      
                return (result?? new List<VisitNote>()).ToList();
        }

        public async Task<VisitNote> GetByIdAsync(Int64 Id , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<VisitNote>
                                      ("VisitNote_GetById",
                        new 
                        {
                          Id = Id 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<VisitNote>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(VisitNote model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("Id", model.Id));
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("VisitId", model.VisitId));
                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate));
                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("VisitNote_Update", args);
        }


							public async Task<Int64> InsertAsync(VisitNote model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("VisitId", model.VisitId));
                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate));
                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int64>("VisitNote_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt64(result);            
        }





        public async Task<List<VisitNote>> GetByVisitIdAsync(Int64 VisitId , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<VisitNote>
                                      ("VisitNote_GetByVisitId",
                        new 
                        {
                          VisitId = VisitId 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<VisitNote>()).ToList();
        }


        public async Task<List<VisitNote>> GetByTenantIdAsync(Int32 TenantId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<VisitNote>
                                      ("VisitNote_GetByTenantId",
                        new 
                        {
                          TenantId = TenantId 
                          
                        }
                       );
            
          return (result?? new List<VisitNote>()).ToList();
        }


        public async Task<List<VisitNote>> GetByPidAsync(Int64 Pid , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<VisitNote>
                                      ("VisitNote_GetByPid",
                        new 
                        {
                          Pid = Pid 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<VisitNote>()).ToList();
        }


    }

      public interface IDrugCodeRepository: ISingletonDependency
      {
          Task<List<DrugCode>> GetAllAsync();
          
        Task<DrugCode> GetByIdAsync(Int32 Id );
        Task UpdateAsync(DrugCode model);

             Task InsertAsync(DrugCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for DrugCode
    /// </summary>
    public partial class DrugCodeRepository : RepositoryBase, IDrugCodeRepository
    {

        public DrugCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<DrugCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<DrugCode>("DrugCode_GetAll", null);
      
                return (result?? new List<DrugCode>()).ToList();
        }

        public async Task<DrugCode> GetByIdAsync(Int32 Id )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<DrugCode>
                                      ("DrugCode_GetById",
                        new 
                        {
                          Id = Id 
                          
                        }
                       );
            
          return (result?? new List<DrugCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(DrugCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("Id", model.Id));
                    parameters.Add(new SqlParameter("Name", model.Name));
                    parameters.Add(new SqlParameter("SideEffect", model.SideEffect));
                    parameters.Add(new SqlParameter("DoseUnit", model.DoseUnit));
                    parameters.Add(new SqlParameter("MinDoseSize", model.MinDoseSize));
                    parameters.Add(new SqlParameter("MaxDoseSize", model.MaxDoseSize));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("DrugCode_Update", args);
        }


							public async Task InsertAsync(DrugCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("Id", model.Id));
                    parameters.Add(new SqlParameter("Name", model.Name));
                    parameters.Add(new SqlParameter("SideEffect", model.SideEffect));
                    parameters.Add(new SqlParameter("DoseUnit", model.DoseUnit));
                    parameters.Add(new SqlParameter("MinDoseSize", model.MinDoseSize));
                    parameters.Add(new SqlParameter("MaxDoseSize", model.MaxDoseSize));
      
          
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    await _procExecutor.ExecuteAsync("DrugCode_Insert", args);            
        }





    }

      public interface IVisitStatusCodeRepository: ISingletonDependency
      {
          Task<List<VisitStatusCode>> GetAllAsync();
          
        Task<VisitStatusCode> GetByVisitStatusCodeIdAsync(Int32 VisitStatusCodeId );
        Task UpdateAsync(VisitStatusCode model);

             Task<Int32> InsertAsync(VisitStatusCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for VisitStatusCode
    /// </summary>
    public partial class VisitStatusCodeRepository : RepositoryBase, IVisitStatusCodeRepository
    {

        public VisitStatusCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<VisitStatusCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<VisitStatusCode>("VisitStatusCode_GetAll", null);
      
                return (result?? new List<VisitStatusCode>()).ToList();
        }

        public async Task<VisitStatusCode> GetByVisitStatusCodeIdAsync(Int32 VisitStatusCodeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<VisitStatusCode>
                                      ("VisitStatusCode_GetByVisitStatusCodeId",
                        new 
                        {
                          VisitStatusCodeId = VisitStatusCodeId 
                          
                        }
                       );
            
          return (result?? new List<VisitStatusCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(VisitStatusCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("VisitStatusCodeId", model.VisitStatusCodeId));
                    parameters.Add(new SqlParameter("VisitStatusCodeName", model.VisitStatusCodeName));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("VisitStatusCode_Update", args);
        }


							public async Task<Int32> InsertAsync(VisitStatusCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("VisitStatusCodeName", model.VisitStatusCodeName));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int32>("VisitStatusCode_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt32(result);            
        }





    }

      public interface IDrugFormCodeRepository: ISingletonDependency
      {
          Task<List<DrugFormCode>> GetAllAsync();
          
        Task<DrugFormCode> GetByDrugFormCodeIdAsync(Int32 DrugFormCodeId );
        Task UpdateAsync(DrugFormCode model);

             Task<Int32> InsertAsync(DrugFormCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for DrugFormCode
    /// </summary>
    public partial class DrugFormCodeRepository : RepositoryBase, IDrugFormCodeRepository
    {

        public DrugFormCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<DrugFormCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<DrugFormCode>("DrugFormCode_GetAll", null);
      
                return (result?? new List<DrugFormCode>()).ToList();
        }

        public async Task<DrugFormCode> GetByDrugFormCodeIdAsync(Int32 DrugFormCodeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<DrugFormCode>
                                      ("DrugFormCode_GetByDrugFormCodeId",
                        new 
                        {
                          DrugFormCodeId = DrugFormCodeId 
                          
                        }
                       );
            
          return (result?? new List<DrugFormCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(DrugFormCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("DrugFormCodeId", model.DrugFormCodeId));
                    parameters.Add(new SqlParameter("DrugFormCodeName", model.DrugFormCodeName));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("DrugFormCode_Update", args);
        }


							public async Task<Int32> InsertAsync(DrugFormCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("DrugFormCodeName", model.DrugFormCodeName));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int32>("DrugFormCode_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt32(result);            
        }





    }

      public interface IWebJobRepository: ISingletonDependency
      {
          Task<List<WebJob>> GetAllAsync();
          
        Task<WebJob> GetByJobIdAsync(Int16 JobId );
        Task UpdateAsync(WebJob model);

             Task InsertAsync(WebJob model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for WebJob
    /// </summary>
    public partial class WebJobRepository : RepositoryBase, IWebJobRepository
    {

        public WebJobRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<WebJob>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<WebJob>("WebJob_GetAll", null);
      
                return (result?? new List<WebJob>()).ToList();
        }

        public async Task<WebJob> GetByJobIdAsync(Int16 JobId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<WebJob>
                                      ("WebJob_GetByJobId",
                        new 
                        {
                          JobId = JobId 
                          
                        }
                       );
            
          return (result?? new List<WebJob>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(WebJob model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("JobId", model.JobId));
                    parameters.Add(new SqlParameter("JobName", model.JobName));
                    parameters.Add(new SqlParameter("Permissions", model.Permissions));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("WebJob_Update", args);
        }


							public async Task InsertAsync(WebJob model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("JobId", model.JobId));
                    parameters.Add(new SqlParameter("JobName", model.JobName));
                    parameters.Add(new SqlParameter("Permissions", model.Permissions));
      
          
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    await _procExecutor.ExecuteAsync("WebJob_Insert", args);            
        }





    }

      public interface IDrugRouteCodeRepository: ISingletonDependency
      {
          Task<List<DrugRouteCode>> GetAllAsync();
          
        Task<DrugRouteCode> GetByDrugRouteCodeIdAsync(Int32 DrugRouteCodeId );
        Task UpdateAsync(DrugRouteCode model);

             Task InsertAsync(DrugRouteCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for DrugRouteCode
    /// </summary>
    public partial class DrugRouteCodeRepository : RepositoryBase, IDrugRouteCodeRepository
    {

        public DrugRouteCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<DrugRouteCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<DrugRouteCode>("DrugRouteCode_GetAll", null);
      
                return (result?? new List<DrugRouteCode>()).ToList();
        }

        public async Task<DrugRouteCode> GetByDrugRouteCodeIdAsync(Int32 DrugRouteCodeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<DrugRouteCode>
                                      ("DrugRouteCode_GetByDrugRouteCodeId",
                        new 
                        {
                          DrugRouteCodeId = DrugRouteCodeId 
                          
                        }
                       );
            
          return (result?? new List<DrugRouteCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(DrugRouteCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("DrugRouteCodeId", model.DrugRouteCodeId));
                    parameters.Add(new SqlParameter("DrugRouteCodeName", model.DrugRouteCodeName));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("DrugRouteCode_Update", args);
        }


							public async Task InsertAsync(DrugRouteCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("DrugRouteCodeId", model.DrugRouteCodeId));
                    parameters.Add(new SqlParameter("DrugRouteCodeName", model.DrugRouteCodeName));
      
          
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    await _procExecutor.ExecuteAsync("DrugRouteCode_Insert", args);            
        }





    }

      public interface IWebJobHistoryRepository: ISingletonDependency
      {
          Task<List<WebJobHistory>> GetAllAsync();
          
        Task<WebJobHistory> GetByRunIdAsync(Int32 RunId );
        Task UpdateAsync(WebJobHistory model);

             Task<Int32> InsertAsync(WebJobHistory model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for WebJobHistory
    /// </summary>
    public partial class WebJobHistoryRepository : RepositoryBase, IWebJobHistoryRepository
    {

        public WebJobHistoryRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<WebJobHistory>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<WebJobHistory>("WebJobHistory_GetAll", null);
      
                return (result?? new List<WebJobHistory>()).ToList();
        }

        public async Task<WebJobHistory> GetByRunIdAsync(Int32 RunId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<WebJobHistory>
                                      ("WebJobHistory_GetByRunId",
                        new 
                        {
                          RunId = RunId 
                          
                        }
                       );
            
          return (result?? new List<WebJobHistory>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(WebJobHistory model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("JobId", model.JobId));
                    parameters.Add(new SqlParameter("RunId", model.RunId));
                    parameters.Add(new SqlParameter("CreationTime", model.CreationTime));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("WebJobHistory_Update", args);
        }


							public async Task<Int32> InsertAsync(WebJobHistory model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("JobId", model.JobId));
                    parameters.Add(new SqlParameter("CreationTime", model.CreationTime));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int32>("WebJobHistory_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt32(result);            
        }





    }

      public interface IFamilyHistoryRepository: ISingletonDependency
      {
          Task<List<FamilyHistory>> GetAllAsync(int TenantId);
          
        Task<FamilyHistory> GetByIdAsync(Int64 Id , int TenantId);
        Task UpdateAsync(FamilyHistory model);

             Task<Int64> InsertAsync(FamilyHistory model);

		      
        Task ArchiveAndInsertAsync(FamilyHistory model);

          
          

        Task<List<FamilyHistory>> GetByVisitIdAsync(Int64 VisitId , int TenantId);


        Task<List<FamilyHistory>> GetByTenantIdAsync(Int32 TenantId );


        Task<List<FamilyHistory>> GetByPidAsync(Int64 Pid , int TenantId);

          
          
      }
    /// <summary>
    /// Data access layer for FamilyHistory
    /// </summary>
    public partial class FamilyHistoryRepository : RepositoryBase, IFamilyHistoryRepository
    {

        public FamilyHistoryRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<FamilyHistory>> GetAllAsync(int TenantId)
        {
          var result = await _procExecutor.ExecuteProcAsync<FamilyHistory>("FamilyHistory_GetAll", new { TenantId });
      
                return (result?? new List<FamilyHistory>()).ToList();
        }

        public async Task<FamilyHistory> GetByIdAsync(Int64 Id , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<FamilyHistory>
                                      ("FamilyHistory_GetById",
                        new 
                        {
                          Id = Id 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<FamilyHistory>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(FamilyHistory model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("Id", model.Id));
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("VisitId", model.VisitId));
                    parameters.Add(new SqlParameter("Archived", model.Archived));
                    if(model.ParentId.HasValue)
                        parameters.Add(new SqlParameter("ParentId", model.ParentId.Value));

                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("RelationshipCodeId", model.RelationshipCodeId));
                    parameters.Add(new SqlParameter("ICDCodeCNId", model.ICDCodeCNId));
                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    if(model.StatusCodeId.HasValue)
                        parameters.Add(new SqlParameter("StatusCodeId", model.StatusCodeId.Value));

                    if(model.CreateDate.HasValue)
                        parameters.Add(new SqlParameter("CreateDate", model.CreateDate.Value));

                    if(model.UpdateDate.HasValue)
                        parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate.Value));

                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    if(model.UpdatedBy.HasValue)
                        parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy.Value));
      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("FamilyHistory_Update", args);
        }


							public async Task<Int64> InsertAsync(FamilyHistory model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("VisitId", model.VisitId));
                    parameters.Add(new SqlParameter("Archived", model.Archived));
                    if(model.ParentId.HasValue)
                        parameters.Add(new SqlParameter("ParentId", model.ParentId.Value));

                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("RelationshipCodeId", model.RelationshipCodeId));
                    parameters.Add(new SqlParameter("ICDCodeCNId", model.ICDCodeCNId));
                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    if(model.StatusCodeId.HasValue)
                        parameters.Add(new SqlParameter("StatusCodeId", model.StatusCodeId.Value));

                    if(model.CreateDate.HasValue)
                        parameters.Add(new SqlParameter("CreateDate", model.CreateDate.Value));

                    if(model.UpdateDate.HasValue)
                        parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate.Value));

                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    if(model.UpdatedBy.HasValue)
                        parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy.Value));

      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int64>("FamilyHistory_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt64(result);            
        }


        public async Task ArchiveAndInsertAsync(FamilyHistory model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("Id", model.Id));
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("VisitId", model.VisitId));
                    parameters.Add(new SqlParameter("Archived", model.Archived));
                    if(model.ParentId.HasValue)
                        parameters.Add(new SqlParameter("ParentId", model.ParentId.Value));

                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("RelationshipCodeId", model.RelationshipCodeId));
                    parameters.Add(new SqlParameter("ICDCodeCNId", model.ICDCodeCNId));
                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    if(model.StatusCodeId.HasValue)
                        parameters.Add(new SqlParameter("StatusCodeId", model.StatusCodeId.Value));

                    if(model.CreateDate.HasValue)
                        parameters.Add(new SqlParameter("CreateDate", model.CreateDate.Value));

                    if(model.UpdateDate.HasValue)
                        parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate.Value));

                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    if(model.UpdatedBy.HasValue)
                        parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy.Value));
      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("FamilyHistory_ArchiveAndInsert", args);
        }





        public async Task<List<FamilyHistory>> GetByVisitIdAsync(Int64 VisitId , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<FamilyHistory>
                                      ("FamilyHistory_GetByVisitId",
                        new 
                        {
                          VisitId = VisitId 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<FamilyHistory>()).ToList();
        }


        public async Task<List<FamilyHistory>> GetByTenantIdAsync(Int32 TenantId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<FamilyHistory>
                                      ("FamilyHistory_GetByTenantId",
                        new 
                        {
                          TenantId = TenantId 
                          
                        }
                       );
            
          return (result?? new List<FamilyHistory>()).ToList();
        }


        public async Task<List<FamilyHistory>> GetByPidAsync(Int64 Pid , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<FamilyHistory>
                                      ("FamilyHistory_GetByPid",
                        new 
                        {
                          Pid = Pid 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<FamilyHistory>()).ToList();
        }


    }

      public interface IFrequencyCodeRepository: ISingletonDependency
      {
          Task<List<FrequencyCode>> GetAllAsync();
          
        Task<FrequencyCode> GetByFrequencyCodeIdAsync(Int32 FrequencyCodeId );
        Task UpdateAsync(FrequencyCode model);

             Task<Int32> InsertAsync(FrequencyCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for FrequencyCode
    /// </summary>
    public partial class FrequencyCodeRepository : RepositoryBase, IFrequencyCodeRepository
    {

        public FrequencyCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<FrequencyCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<FrequencyCode>("FrequencyCode_GetAll", null);
      
                return (result?? new List<FrequencyCode>()).ToList();
        }

        public async Task<FrequencyCode> GetByFrequencyCodeIdAsync(Int32 FrequencyCodeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<FrequencyCode>
                                      ("FrequencyCode_GetByFrequencyCodeId",
                        new 
                        {
                          FrequencyCodeId = FrequencyCodeId 
                          
                        }
                       );
            
          return (result?? new List<FrequencyCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(FrequencyCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("FrequencyCodeId", model.FrequencyCodeId));
                    parameters.Add(new SqlParameter("FrequencyCodeName", model.FrequencyCodeName));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("FrequencyCode_Update", args);
        }


							public async Task<Int32> InsertAsync(FrequencyCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("FrequencyCodeName", model.FrequencyCodeName));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int32>("FrequencyCode_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt32(result);            
        }





    }

      public interface IICDCodeCNRepository: ISingletonDependency
      {
          Task<List<ICDCodeCN>> GetAllAsync(int TenantId);
          
        Task<ICDCodeCN> GetByICDCodeCNIdAsync(String ICDCodeCNId , int TenantId);
        Task UpdateAsync(ICDCodeCN model);

             Task InsertAsync(ICDCodeCN model);

		      
          
          
          

        Task<ICDCodeCN> GetByTenantIdAsync(Int32 TenantId );

          
      }
    /// <summary>
    /// Data access layer for ICDCodeCN
    /// </summary>
    public partial class ICDCodeCNRepository : RepositoryBase, IICDCodeCNRepository
    {

        public ICDCodeCNRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<ICDCodeCN>> GetAllAsync(int TenantId)
        {
          var result = await _procExecutor.ExecuteProcAsync<ICDCodeCN>("ICDCodeCN_GetAll", new { TenantId });
      
                return (result?? new List<ICDCodeCN>()).ToList();
        }

        public async Task<ICDCodeCN> GetByICDCodeCNIdAsync(String ICDCodeCNId , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<ICDCodeCN>
                                      ("ICDCodeCN_GetByICDCodeCNId",
                        new 
                        {
                          ICDCodeCNId = ICDCodeCNId 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<ICDCodeCN>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(ICDCodeCN model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("ICDCodeCNId", model.ICDCodeCNId));
                    parameters.Add(new SqlParameter("ICDCodeCNShortName", model.ICDCodeCNShortName));
                    parameters.Add(new SqlParameter("ICDCodeCNName", model.ICDCodeCNName));
                    if(model.TenantId.HasValue)
                        parameters.Add(new SqlParameter("TenantId", model.TenantId.Value));

                    if(model.CreateDate.HasValue)
                        parameters.Add(new SqlParameter("CreateDate", model.CreateDate.Value));

                    if(model.UpdateDate.HasValue)
                        parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate.Value));

                    if(model.CreatedBy.HasValue)
                        parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy.Value));

                    if(model.UpdatedBy.HasValue)
                        parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy.Value));
      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("ICDCodeCN_Update", args);
        }


							public async Task InsertAsync(ICDCodeCN model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("ICDCodeCNId", model.ICDCodeCNId));
                    parameters.Add(new SqlParameter("ICDCodeCNShortName", model.ICDCodeCNShortName));
                    parameters.Add(new SqlParameter("ICDCodeCNName", model.ICDCodeCNName));
                    if(model.TenantId.HasValue)
                        parameters.Add(new SqlParameter("TenantId", model.TenantId.Value));

                    if(model.CreateDate.HasValue)
                        parameters.Add(new SqlParameter("CreateDate", model.CreateDate.Value));

                    if(model.UpdateDate.HasValue)
                        parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate.Value));

                    if(model.CreatedBy.HasValue)
                        parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy.Value));

                    if(model.UpdatedBy.HasValue)
                        parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy.Value));

      
          
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    await _procExecutor.ExecuteAsync("ICDCodeCN_Insert", args);            
        }






        public async Task<ICDCodeCN> GetByTenantIdAsync(Int32 TenantId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<ICDCodeCN>
                                      ("ICDCodeCN_GetByTenantId",
                        new 
                        {
                          TenantId = TenantId 
                          
                        }
                       );
            
          return (result?? new List<ICDCodeCN>()).FirstOrDefault();            
        }

    }

      public interface IICDCodePCSRepository: ISingletonDependency
      {
          Task<List<ICDCodePCS>> GetAllAsync(int TenantId);
          
        Task<ICDCodePCS> GetByICDCodePCSIdAsync(String ICDCodePCSId , int TenantId);
        Task UpdateAsync(ICDCodePCS model);

             Task InsertAsync(ICDCodePCS model);

		      
          
          
          

        Task<ICDCodePCS> GetByTenantIdAsync(Int32 TenantId );

          
      }
    /// <summary>
    /// Data access layer for ICDCodePCS
    /// </summary>
    public partial class ICDCodePCSRepository : RepositoryBase, IICDCodePCSRepository
    {

        public ICDCodePCSRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<ICDCodePCS>> GetAllAsync(int TenantId)
        {
          var result = await _procExecutor.ExecuteProcAsync<ICDCodePCS>("ICDCodePCS_GetAll", new { TenantId });
      
                return (result?? new List<ICDCodePCS>()).ToList();
        }

        public async Task<ICDCodePCS> GetByICDCodePCSIdAsync(String ICDCodePCSId , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<ICDCodePCS>
                                      ("ICDCodePCS_GetByICDCodePCSId",
                        new 
                        {
                          ICDCodePCSId = ICDCodePCSId 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<ICDCodePCS>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(ICDCodePCS model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("ICDCodePCSId", model.ICDCodePCSId));
                    parameters.Add(new SqlParameter("ICDCodePCSShortName", model.ICDCodePCSShortName));
                    parameters.Add(new SqlParameter("ICDCodePCSName", model.ICDCodePCSName));
                    if(model.TenantId.HasValue)
                        parameters.Add(new SqlParameter("TenantId", model.TenantId.Value));

                    if(model.CreateDate.HasValue)
                        parameters.Add(new SqlParameter("CreateDate", model.CreateDate.Value));

                    if(model.UpdateDate.HasValue)
                        parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate.Value));

                    if(model.CreatedBy.HasValue)
                        parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy.Value));

                    if(model.UpdatedBy.HasValue)
                        parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy.Value));
      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("ICDCodePCS_Update", args);
        }


							public async Task InsertAsync(ICDCodePCS model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("ICDCodePCSId", model.ICDCodePCSId));
                    parameters.Add(new SqlParameter("ICDCodePCSShortName", model.ICDCodePCSShortName));
                    parameters.Add(new SqlParameter("ICDCodePCSName", model.ICDCodePCSName));
                    if(model.TenantId.HasValue)
                        parameters.Add(new SqlParameter("TenantId", model.TenantId.Value));

                    if(model.CreateDate.HasValue)
                        parameters.Add(new SqlParameter("CreateDate", model.CreateDate.Value));

                    if(model.UpdateDate.HasValue)
                        parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate.Value));

                    if(model.CreatedBy.HasValue)
                        parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy.Value));

                    if(model.UpdatedBy.HasValue)
                        parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy.Value));

      
          
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    await _procExecutor.ExecuteAsync("ICDCodePCS_Insert", args);            
        }






        public async Task<ICDCodePCS> GetByTenantIdAsync(Int32 TenantId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<ICDCodePCS>
                                      ("ICDCodePCS_GetByTenantId",
                        new 
                        {
                          TenantId = TenantId 
                          
                        }
                       );
            
          return (result?? new List<ICDCodePCS>()).FirstOrDefault();            
        }

    }

      public interface IImmunizationCodeRepository: ISingletonDependency
      {
          Task<List<ImmunizationCode>> GetAllAsync();
          
        Task<ImmunizationCode> GetByImmunizationCodeIdAsync(Int32 ImmunizationCodeId );
        Task UpdateAsync(ImmunizationCode model);

             Task<Int32> InsertAsync(ImmunizationCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for ImmunizationCode
    /// </summary>
    public partial class ImmunizationCodeRepository : RepositoryBase, IImmunizationCodeRepository
    {

        public ImmunizationCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<ImmunizationCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<ImmunizationCode>("ImmunizationCode_GetAll", null);
      
                return (result?? new List<ImmunizationCode>()).ToList();
        }

        public async Task<ImmunizationCode> GetByImmunizationCodeIdAsync(Int32 ImmunizationCodeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<ImmunizationCode>
                                      ("ImmunizationCode_GetByImmunizationCodeId",
                        new 
                        {
                          ImmunizationCodeId = ImmunizationCodeId 
                          
                        }
                       );
            
          return (result?? new List<ImmunizationCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(ImmunizationCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("ImmunizationCodeId", model.ImmunizationCodeId));
                    parameters.Add(new SqlParameter("ImmunizationName", model.ImmunizationName));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("ImmunizationCode_Update", args);
        }


							public async Task<Int32> InsertAsync(ImmunizationCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("ImmunizationName", model.ImmunizationName));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int32>("ImmunizationCode_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt32(result);            
        }





    }

      public interface IImmunizationsRepository: ISingletonDependency
      {
          Task<List<Immunizations>> GetAllAsync(int TenantId);
          
        Task<Immunizations> GetByIdAsync(Int64 Id , int TenantId);
        Task UpdateAsync(Immunizations model);

             Task<Int64> InsertAsync(Immunizations model);

		      
        Task ArchiveAndInsertAsync(Immunizations model);

          
          

        Task<List<Immunizations>> GetByVisitIdAsync(Int64 VisitId , int TenantId);


        Task<List<Immunizations>> GetByTenantIdAsync(Int32 TenantId );


        Task<List<Immunizations>> GetByPidAsync(Int64 Pid , int TenantId);

          
          
      }
    /// <summary>
    /// Data access layer for Immunizations
    /// </summary>
    public partial class ImmunizationsRepository : RepositoryBase, IImmunizationsRepository
    {

        public ImmunizationsRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<Immunizations>> GetAllAsync(int TenantId)
        {
          var result = await _procExecutor.ExecuteProcAsync<Immunizations>("Immunizations_GetAll", new { TenantId });
      
                return (result?? new List<Immunizations>()).ToList();
        }

        public async Task<Immunizations> GetByIdAsync(Int64 Id , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<Immunizations>
                                      ("Immunizations_GetById",
                        new 
                        {
                          Id = Id 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<Immunizations>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(Immunizations model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("Id", model.Id));
                    if(model.Pid.HasValue)
                        parameters.Add(new SqlParameter("Pid", model.Pid.Value));

                    parameters.Add(new SqlParameter("VisitId", model.VisitId));
                    parameters.Add(new SqlParameter("Archived", model.Archived));
                    if(model.ParentId.HasValue)
                        parameters.Add(new SqlParameter("ParentId", model.ParentId.Value));

                    if(model.TenantId.HasValue)
                        parameters.Add(new SqlParameter("TenantId", model.TenantId.Value));

                    if(model.ImmunizationCodeId.HasValue)
                        parameters.Add(new SqlParameter("ImmunizationCodeId", model.ImmunizationCodeId.Value));

                    if(model.AdministeredDate.HasValue)
                        parameters.Add(new SqlParameter("AdministeredDate", model.AdministeredDate.Value));

                    if(model.AdministeredById.HasValue)
                        parameters.Add(new SqlParameter("AdministeredById", model.AdministeredById.Value));

                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    if(model.ExpirationDate.HasValue)
                        parameters.Add(new SqlParameter("ExpirationDate", model.ExpirationDate.Value));

                    if(model.CompletionStatusCodeId.HasValue)
                        parameters.Add(new SqlParameter("CompletionStatusCodeId", model.CompletionStatusCodeId.Value));

                    if(model.Status!=null)
                        parameters.Add(new SqlParameter("Status", model.Status));

                    if(model.InformationSource!=null)
                        parameters.Add(new SqlParameter("InformationSource", model.InformationSource));

                    parameters.Add(new SqlParameter("AdministrationSiteId", model.AdministrationSiteId));
                    if(model.CreateDate.HasValue)
                        parameters.Add(new SqlParameter("CreateDate", model.CreateDate.Value));

                    if(model.UpdateDate.HasValue)
                        parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate.Value));

                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    if(model.UpdatedBy.HasValue)
                        parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy.Value));
      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("Immunizations_Update", args);
        }


							public async Task<Int64> InsertAsync(Immunizations model)
        {
          var parameters = new List<SqlParameter>();
          
                    if(model.Pid.HasValue)
                        parameters.Add(new SqlParameter("Pid", model.Pid.Value));

                    parameters.Add(new SqlParameter("VisitId", model.VisitId));
                    parameters.Add(new SqlParameter("Archived", model.Archived));
                    if(model.ParentId.HasValue)
                        parameters.Add(new SqlParameter("ParentId", model.ParentId.Value));

                    if(model.TenantId.HasValue)
                        parameters.Add(new SqlParameter("TenantId", model.TenantId.Value));

                    if(model.ImmunizationCodeId.HasValue)
                        parameters.Add(new SqlParameter("ImmunizationCodeId", model.ImmunizationCodeId.Value));

                    if(model.AdministeredDate.HasValue)
                        parameters.Add(new SqlParameter("AdministeredDate", model.AdministeredDate.Value));

                    if(model.AdministeredById.HasValue)
                        parameters.Add(new SqlParameter("AdministeredById", model.AdministeredById.Value));

                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    if(model.ExpirationDate.HasValue)
                        parameters.Add(new SqlParameter("ExpirationDate", model.ExpirationDate.Value));

                    if(model.CompletionStatusCodeId.HasValue)
                        parameters.Add(new SqlParameter("CompletionStatusCodeId", model.CompletionStatusCodeId.Value));

                    if(model.Status!=null)
                        parameters.Add(new SqlParameter("Status", model.Status));

                    if(model.InformationSource!=null)
                        parameters.Add(new SqlParameter("InformationSource", model.InformationSource));

                    parameters.Add(new SqlParameter("AdministrationSiteId", model.AdministrationSiteId));
                    if(model.CreateDate.HasValue)
                        parameters.Add(new SqlParameter("CreateDate", model.CreateDate.Value));

                    if(model.UpdateDate.HasValue)
                        parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate.Value));

                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    if(model.UpdatedBy.HasValue)
                        parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy.Value));

      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int64>("Immunizations_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt64(result);            
        }


        public async Task ArchiveAndInsertAsync(Immunizations model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("Id", model.Id));
                    if(model.Pid.HasValue)
                        parameters.Add(new SqlParameter("Pid", model.Pid.Value));

                    parameters.Add(new SqlParameter("VisitId", model.VisitId));
                    parameters.Add(new SqlParameter("Archived", model.Archived));
                    if(model.ParentId.HasValue)
                        parameters.Add(new SqlParameter("ParentId", model.ParentId.Value));

                    if(model.TenantId.HasValue)
                        parameters.Add(new SqlParameter("TenantId", model.TenantId.Value));

                    if(model.ImmunizationCodeId.HasValue)
                        parameters.Add(new SqlParameter("ImmunizationCodeId", model.ImmunizationCodeId.Value));

                    if(model.AdministeredDate.HasValue)
                        parameters.Add(new SqlParameter("AdministeredDate", model.AdministeredDate.Value));

                    if(model.AdministeredById.HasValue)
                        parameters.Add(new SqlParameter("AdministeredById", model.AdministeredById.Value));

                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    if(model.ExpirationDate.HasValue)
                        parameters.Add(new SqlParameter("ExpirationDate", model.ExpirationDate.Value));

                    if(model.CompletionStatusCodeId.HasValue)
                        parameters.Add(new SqlParameter("CompletionStatusCodeId", model.CompletionStatusCodeId.Value));

                    if(model.Status!=null)
                        parameters.Add(new SqlParameter("Status", model.Status));

                    if(model.InformationSource!=null)
                        parameters.Add(new SqlParameter("InformationSource", model.InformationSource));

                    parameters.Add(new SqlParameter("AdministrationSiteId", model.AdministrationSiteId));
                    if(model.CreateDate.HasValue)
                        parameters.Add(new SqlParameter("CreateDate", model.CreateDate.Value));

                    if(model.UpdateDate.HasValue)
                        parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate.Value));

                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    if(model.UpdatedBy.HasValue)
                        parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy.Value));
      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("Immunizations_ArchiveAndInsert", args);
        }





        public async Task<List<Immunizations>> GetByVisitIdAsync(Int64 VisitId , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<Immunizations>
                                      ("Immunizations_GetByVisitId",
                        new 
                        {
                          VisitId = VisitId 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<Immunizations>()).ToList();
        }


        public async Task<List<Immunizations>> GetByTenantIdAsync(Int32 TenantId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<Immunizations>
                                      ("Immunizations_GetByTenantId",
                        new 
                        {
                          TenantId = TenantId 
                          
                        }
                       );
            
          return (result?? new List<Immunizations>()).ToList();
        }


        public async Task<List<Immunizations>> GetByPidAsync(Int64 Pid , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<Immunizations>
                                      ("Immunizations_GetByPid",
                        new 
                        {
                          Pid = Pid 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<Immunizations>()).ToList();
        }


    }

      public interface IInformationSourceRepository: ISingletonDependency
      {
          Task<List<InformationSource>> GetAllAsync();
          
        Task<InformationSource> GetByInformationSourceIdAsync(Int32 InformationSourceId );
        Task UpdateAsync(InformationSource model);

             Task<Int32> InsertAsync(InformationSource model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for InformationSource
    /// </summary>
    public partial class InformationSourceRepository : RepositoryBase, IInformationSourceRepository
    {

        public InformationSourceRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<InformationSource>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<InformationSource>("InformationSource_GetAll", null);
      
                return (result?? new List<InformationSource>()).ToList();
        }

        public async Task<InformationSource> GetByInformationSourceIdAsync(Int32 InformationSourceId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<InformationSource>
                                      ("InformationSource_GetByInformationSourceId",
                        new 
                        {
                          InformationSourceId = InformationSourceId 
                          
                        }
                       );
            
          return (result?? new List<InformationSource>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(InformationSource model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("InformationSourceId", model.InformationSourceId));
                    parameters.Add(new SqlParameter("InformationSourceName", model.InformationSourceName));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("InformationSource_Update", args);
        }


							public async Task<Int32> InsertAsync(InformationSource model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("InformationSourceName", model.InformationSourceName));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int32>("InformationSource_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt32(result);            
        }





    }

      public interface ILifeStyleRepository: ISingletonDependency
      {
          Task<List<LifeStyle>> GetAllAsync(int TenantId);
          
        Task<LifeStyle> GetByIdAsync(Int64 Id , int TenantId);
        Task UpdateAsync(LifeStyle model);

             Task<Int64> InsertAsync(LifeStyle model);

		      
        Task ArchiveAndInsertAsync(LifeStyle model);

          
          

        Task<List<LifeStyle>> GetByVisitIdAsync(Int64 VisitId , int TenantId);


        Task<List<LifeStyle>> GetByTenantIdAsync(Int32 TenantId );


        Task<List<LifeStyle>> GetByPidAsync(Int64 Pid , int TenantId);

          
          
      }
    /// <summary>
    /// Data access layer for LifeStyle
    /// </summary>
    public partial class LifeStyleRepository : RepositoryBase, ILifeStyleRepository
    {

        public LifeStyleRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<LifeStyle>> GetAllAsync(int TenantId)
        {
          var result = await _procExecutor.ExecuteProcAsync<LifeStyle>("LifeStyle_GetAll", new { TenantId });
      
                return (result?? new List<LifeStyle>()).ToList();
        }

        public async Task<LifeStyle> GetByIdAsync(Int64 Id , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<LifeStyle>
                                      ("LifeStyle_GetById",
                        new 
                        {
                          Id = Id 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<LifeStyle>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(LifeStyle model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("Id", model.Id));
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("VisitId", model.VisitId));
                    parameters.Add(new SqlParameter("Archived", model.Archived));
                    if(model.ParentId.HasValue)
                        parameters.Add(new SqlParameter("ParentId", model.ParentId.Value));

                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("LifeStyleTypeId", model.LifeStyleTypeId));
                    if(model.QuitDate.HasValue)
                        parameters.Add(new SqlParameter("QuitDate", model.QuitDate.Value));

                    parameters.Add(new SqlParameter("CurrentlyActive", model.CurrentlyActive));
                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate));
                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("LifeStyle_Update", args);
        }


							public async Task<Int64> InsertAsync(LifeStyle model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("VisitId", model.VisitId));
                    parameters.Add(new SqlParameter("Archived", model.Archived));
                    if(model.ParentId.HasValue)
                        parameters.Add(new SqlParameter("ParentId", model.ParentId.Value));

                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("LifeStyleTypeId", model.LifeStyleTypeId));
                    if(model.QuitDate.HasValue)
                        parameters.Add(new SqlParameter("QuitDate", model.QuitDate.Value));

                    parameters.Add(new SqlParameter("CurrentlyActive", model.CurrentlyActive));
                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate));
                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int64>("LifeStyle_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt64(result);            
        }


        public async Task ArchiveAndInsertAsync(LifeStyle model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("Id", model.Id));
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("VisitId", model.VisitId));
                    parameters.Add(new SqlParameter("Archived", model.Archived));
                    if(model.ParentId.HasValue)
                        parameters.Add(new SqlParameter("ParentId", model.ParentId.Value));

                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("LifeStyleTypeId", model.LifeStyleTypeId));
                    if(model.QuitDate.HasValue)
                        parameters.Add(new SqlParameter("QuitDate", model.QuitDate.Value));

                    parameters.Add(new SqlParameter("CurrentlyActive", model.CurrentlyActive));
                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate));
                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("LifeStyle_ArchiveAndInsert", args);
        }





        public async Task<List<LifeStyle>> GetByVisitIdAsync(Int64 VisitId , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<LifeStyle>
                                      ("LifeStyle_GetByVisitId",
                        new 
                        {
                          VisitId = VisitId 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<LifeStyle>()).ToList();
        }


        public async Task<List<LifeStyle>> GetByTenantIdAsync(Int32 TenantId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<LifeStyle>
                                      ("LifeStyle_GetByTenantId",
                        new 
                        {
                          TenantId = TenantId 
                          
                        }
                       );
            
          return (result?? new List<LifeStyle>()).ToList();
        }


        public async Task<List<LifeStyle>> GetByPidAsync(Int64 Pid , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<LifeStyle>
                                      ("LifeStyle_GetByPid",
                        new 
                        {
                          Pid = Pid 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<LifeStyle>()).ToList();
        }


    }

      public interface ILifeStyleTypeRepository: ISingletonDependency
      {
          Task<List<LifeStyleType>> GetAllAsync();
          
        Task<LifeStyleType> GetByLifeStyleTypeIdAsync(Int32 LifeStyleTypeId );
        Task UpdateAsync(LifeStyleType model);

             Task<Int32> InsertAsync(LifeStyleType model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for LifeStyleType
    /// </summary>
    public partial class LifeStyleTypeRepository : RepositoryBase, ILifeStyleTypeRepository
    {

        public LifeStyleTypeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<LifeStyleType>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<LifeStyleType>("LifeStyleType_GetAll", null);
      
                return (result?? new List<LifeStyleType>()).ToList();
        }

        public async Task<LifeStyleType> GetByLifeStyleTypeIdAsync(Int32 LifeStyleTypeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<LifeStyleType>
                                      ("LifeStyleType_GetByLifeStyleTypeId",
                        new 
                        {
                          LifeStyleTypeId = LifeStyleTypeId 
                          
                        }
                       );
            
          return (result?? new List<LifeStyleType>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(LifeStyleType model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("LifeStyleTypeId", model.LifeStyleTypeId));
                    parameters.Add(new SqlParameter("LifeStyleTypeName", model.LifeStyleTypeName));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("LifeStyleType_Update", args);
        }


							public async Task<Int32> InsertAsync(LifeStyleType model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("LifeStyleTypeName", model.LifeStyleTypeName));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int32>("LifeStyleType_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt32(result);            
        }





    }

      public interface ILoincCodeRepository: ISingletonDependency
      {
          Task<List<LoincCode>> GetAllAsync(int TenantId);
          
        Task<LoincCode> GetByLoincCodeIdAsync(String LoincCodeId , int TenantId);
        Task UpdateAsync(LoincCode model);

             Task InsertAsync(LoincCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for LoincCode
    /// </summary>
    public partial class LoincCodeRepository : RepositoryBase, ILoincCodeRepository
    {

        public LoincCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<LoincCode>> GetAllAsync(int TenantId)
        {
          var result = await _procExecutor.ExecuteProcAsync<LoincCode>("LoincCode_GetAll", new { TenantId });
      
                return (result?? new List<LoincCode>()).ToList();
        }

        public async Task<LoincCode> GetByLoincCodeIdAsync(String LoincCodeId , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<LoincCode>
                                      ("LoincCode_GetByLoincCodeId",
                        new 
                        {
                          LoincCodeId = LoincCodeId 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<LoincCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(LoincCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("LoincCodeId", model.LoincCodeId));
                    if(model.Component!=null)
                        parameters.Add(new SqlParameter("Component", model.Component));

                    if(model.Property!=null)
                        parameters.Add(new SqlParameter("Property", model.Property));

                    if(model.TimeAspct!=null)
                        parameters.Add(new SqlParameter("TimeAspct", model.TimeAspct));

                    if(model.SystemCode!=null)
                        parameters.Add(new SqlParameter("SystemCode", model.SystemCode));

                    if(model.ScaleType!=null)
                        parameters.Add(new SqlParameter("ScaleType", model.ScaleType));

                    if(model.MethodType!=null)
                        parameters.Add(new SqlParameter("MethodType", model.MethodType));

                    if(model.ClassName!=null)
                        parameters.Add(new SqlParameter("ClassName", model.ClassName));

                    if(model.Formula!=null)
                        parameters.Add(new SqlParameter("Formula", model.Formula));

                    if(model.UnitsRequired!=null)
                        parameters.Add(new SqlParameter("UnitsRequired", model.UnitsRequired));

                    if(model.SubmittedUnits!=null)
                        parameters.Add(new SqlParameter("SubmittedUnits", model.SubmittedUnits));

                    if(model.RelatedNames!=null)
                        parameters.Add(new SqlParameter("RelatedNames", model.RelatedNames));

                    if(model.ShortName!=null)
                        parameters.Add(new SqlParameter("ShortName", model.ShortName));

                    if(model.ExampleUnits!=null)
                        parameters.Add(new SqlParameter("ExampleUnits", model.ExampleUnits));

                    if(model.LongCommonName!=null)
                        parameters.Add(new SqlParameter("LongCommonName", model.LongCommonName));

                    if(model.UnitsAndRange!=null)
                        parameters.Add(new SqlParameter("UnitsAndRange", model.UnitsAndRange));

                    if(model.ExampleUcumUnits!=null)
                        parameters.Add(new SqlParameter("ExampleUcumUnits", model.ExampleUcumUnits));

                    if(model.TenantId.HasValue)
                        parameters.Add(new SqlParameter("TenantId", model.TenantId.Value));
      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("LoincCode_Update", args);
        }


							public async Task InsertAsync(LoincCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("LoincCodeId", model.LoincCodeId));
                    if(model.Component!=null)
                        parameters.Add(new SqlParameter("Component", model.Component));

                    if(model.Property!=null)
                        parameters.Add(new SqlParameter("Property", model.Property));

                    if(model.TimeAspct!=null)
                        parameters.Add(new SqlParameter("TimeAspct", model.TimeAspct));

                    if(model.SystemCode!=null)
                        parameters.Add(new SqlParameter("SystemCode", model.SystemCode));

                    if(model.ScaleType!=null)
                        parameters.Add(new SqlParameter("ScaleType", model.ScaleType));

                    if(model.MethodType!=null)
                        parameters.Add(new SqlParameter("MethodType", model.MethodType));

                    if(model.ClassName!=null)
                        parameters.Add(new SqlParameter("ClassName", model.ClassName));

                    if(model.Formula!=null)
                        parameters.Add(new SqlParameter("Formula", model.Formula));

                    if(model.UnitsRequired!=null)
                        parameters.Add(new SqlParameter("UnitsRequired", model.UnitsRequired));

                    if(model.SubmittedUnits!=null)
                        parameters.Add(new SqlParameter("SubmittedUnits", model.SubmittedUnits));

                    if(model.RelatedNames!=null)
                        parameters.Add(new SqlParameter("RelatedNames", model.RelatedNames));

                    if(model.ShortName!=null)
                        parameters.Add(new SqlParameter("ShortName", model.ShortName));

                    if(model.ExampleUnits!=null)
                        parameters.Add(new SqlParameter("ExampleUnits", model.ExampleUnits));

                    if(model.LongCommonName!=null)
                        parameters.Add(new SqlParameter("LongCommonName", model.LongCommonName));

                    if(model.UnitsAndRange!=null)
                        parameters.Add(new SqlParameter("UnitsAndRange", model.UnitsAndRange));

                    if(model.ExampleUcumUnits!=null)
                        parameters.Add(new SqlParameter("ExampleUcumUnits", model.ExampleUcumUnits));

                    if(model.TenantId.HasValue)
                        parameters.Add(new SqlParameter("TenantId", model.TenantId.Value));

      
          
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    await _procExecutor.ExecuteAsync("LoincCode_Insert", args);            
        }





    }

      public interface ILoincPanelCodeRepository: ISingletonDependency
      {
          Task<List<LoincPanelCode>> GetAllAsync();
          
        Task<LoincPanelCode> GetByParentIdAsync(Int32 ParentId );
        Task UpdateAsync(LoincPanelCode model);

             Task InsertAsync(LoincPanelCode model);

		      
          
          

        Task<List<LoincPanelCode>> GetByParentLoincCodeIdAsync(String ParentLoincCodeId );


        Task<List<LoincPanelCode>> GetByLoincCodeIdAsync(String LoincCodeId );

          
          
      }
    /// <summary>
    /// Data access layer for LoincPanelCode
    /// </summary>
    public partial class LoincPanelCodeRepository : RepositoryBase, ILoincPanelCodeRepository
    {

        public LoincPanelCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<LoincPanelCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<LoincPanelCode>("LoincPanelCode_GetAll", null);
      
                return (result?? new List<LoincPanelCode>()).ToList();
        }

        public async Task<LoincPanelCode> GetByParentIdAsync(Int32 ParentId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<LoincPanelCode>
                                      ("LoincPanelCode_GetByParentId",
                        new 
                        {
                          ParentId = ParentId 
                          
                        }
                       );
            
          return (result?? new List<LoincPanelCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(LoincPanelCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("ParentId", model.ParentId));
                    parameters.Add(new SqlParameter("ParentLoincCodeId", model.ParentLoincCodeId));
                    if(model.ParentName!=null)
                        parameters.Add(new SqlParameter("ParentName", model.ParentName));

                    parameters.Add(new SqlParameter("Id", model.Id));
                    parameters.Add(new SqlParameter("Sequence", model.Sequence));
                    parameters.Add(new SqlParameter("LoincCodeId", model.LoincCodeId));
                    if(model.Name!=null)
                        parameters.Add(new SqlParameter("Name", model.Name));
      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("LoincPanelCode_Update", args);
        }


							public async Task InsertAsync(LoincPanelCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("ParentId", model.ParentId));
                    parameters.Add(new SqlParameter("ParentLoincCodeId", model.ParentLoincCodeId));
                    if(model.ParentName!=null)
                        parameters.Add(new SqlParameter("ParentName", model.ParentName));

                    parameters.Add(new SqlParameter("Id", model.Id));
                    parameters.Add(new SqlParameter("Sequence", model.Sequence));
                    parameters.Add(new SqlParameter("LoincCodeId", model.LoincCodeId));
                    if(model.Name!=null)
                        parameters.Add(new SqlParameter("Name", model.Name));

      
          
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    await _procExecutor.ExecuteAsync("LoincPanelCode_Insert", args);            
        }





        public async Task<List<LoincPanelCode>> GetByParentLoincCodeIdAsync(String ParentLoincCodeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<LoincPanelCode>
                                      ("LoincPanelCode_GetByParentLoincCodeId",
                        new 
                        {
                          ParentLoincCodeId = ParentLoincCodeId 
                          
                        }
                       );
            
          return (result?? new List<LoincPanelCode>()).ToList();
        }


        public async Task<List<LoincPanelCode>> GetByLoincCodeIdAsync(String LoincCodeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<LoincPanelCode>
                                      ("LoincPanelCode_GetByLoincCodeId",
                        new 
                        {
                          LoincCodeId = LoincCodeId 
                          
                        }
                       );
            
          return (result?? new List<LoincPanelCode>()).ToList();
        }


    }

      public interface ILoincRangeCodeRepository: ISingletonDependency
      {
          Task<List<LoincRangeCode>> GetAllAsync(int TenantId);
          
        Task<LoincRangeCode> GetByLoincCodeIdAsync(String LoincCodeId , int TenantId);
        Task UpdateAsync(LoincRangeCode model);

             Task InsertAsync(LoincRangeCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for LoincRangeCode
    /// </summary>
    public partial class LoincRangeCodeRepository : RepositoryBase, ILoincRangeCodeRepository
    {

        public LoincRangeCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<LoincRangeCode>> GetAllAsync(int TenantId)
        {
          var result = await _procExecutor.ExecuteProcAsync<LoincRangeCode>("LoincRangeCode_GetAll", new { TenantId });
      
                return (result?? new List<LoincRangeCode>()).ToList();
        }

        public async Task<LoincRangeCode> GetByLoincCodeIdAsync(String LoincCodeId , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<LoincRangeCode>
                                      ("LoincRangeCode_GetByLoincCodeId",
                        new 
                        {
                          LoincCodeId = LoincCodeId 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<LoincRangeCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(LoincRangeCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("LoincCodeId", model.LoincCodeId));
                    parameters.Add(new SqlParameter("LoincRangeCodeName", model.LoincRangeCodeName));
                    parameters.Add(new SqlParameter("TenantId", model.TenantId));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("LoincRangeCode_Update", args);
        }


							public async Task InsertAsync(LoincRangeCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("LoincCodeId", model.LoincCodeId));
                    parameters.Add(new SqlParameter("LoincRangeCodeName", model.LoincRangeCodeName));
                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
      
          
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    await _procExecutor.ExecuteAsync("LoincRangeCode_Insert", args);            
        }





    }

      public interface ILoincUnitCodeRepository: ISingletonDependency
      {
          Task<List<LoincUnitCode>> GetAllAsync(int TenantId);
          
        Task<LoincUnitCode> GetByLoincCodeIdAsync(String LoincCodeId , int TenantId);
        Task UpdateAsync(LoincUnitCode model);

             Task InsertAsync(LoincUnitCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for LoincUnitCode
    /// </summary>
    public partial class LoincUnitCodeRepository : RepositoryBase, ILoincUnitCodeRepository
    {

        public LoincUnitCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<LoincUnitCode>> GetAllAsync(int TenantId)
        {
          var result = await _procExecutor.ExecuteProcAsync<LoincUnitCode>("LoincUnitCode_GetAll", new { TenantId });
      
                return (result?? new List<LoincUnitCode>()).ToList();
        }

        public async Task<LoincUnitCode> GetByLoincCodeIdAsync(String LoincCodeId , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<LoincUnitCode>
                                      ("LoincUnitCode_GetByLoincCodeId",
                        new 
                        {
                          LoincCodeId = LoincCodeId 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<LoincUnitCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(LoincUnitCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("LoincCodeId", model.LoincCodeId));
                    parameters.Add(new SqlParameter("LoincUnitCodeName", model.LoincUnitCodeName));
                    parameters.Add(new SqlParameter("TenantId", model.TenantId));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("LoincUnitCode_Update", args);
        }


							public async Task InsertAsync(LoincUnitCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("LoincCodeId", model.LoincCodeId));
                    parameters.Add(new SqlParameter("LoincUnitCodeName", model.LoincUnitCodeName));
                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
      
          
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    await _procExecutor.ExecuteAsync("LoincUnitCode_Insert", args);            
        }





    }

      public interface IOrderConditionRepository: ISingletonDependency
      {
          Task<List<OrderCondition>> GetAllAsync();
          
        Task<OrderCondition> GetByOrderIdAsync(Int64 OrderId );
        Task UpdateAsync(OrderCondition model);

             Task InsertAsync(OrderCondition model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for OrderCondition
    /// </summary>
    public partial class OrderConditionRepository : RepositoryBase, IOrderConditionRepository
    {

        public OrderConditionRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<OrderCondition>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<OrderCondition>("OrderCondition_GetAll", null);
      
                return (result?? new List<OrderCondition>()).ToList();
        }

        public async Task<OrderCondition> GetByOrderIdAsync(Int64 OrderId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<OrderCondition>
                                      ("OrderCondition_GetByOrderId",
                        new 
                        {
                          OrderId = OrderId 
                          
                        }
                       );
            
          return (result?? new List<OrderCondition>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(OrderCondition model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("OrderId", model.OrderId));
                    parameters.Add(new SqlParameter("ICDCodeCNId", model.ICDCodeCNId));
                    parameters.Add(new SqlParameter("PrimaryCondition", model.PrimaryCondition));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("OrderCondition_Update", args);
        }


							public async Task InsertAsync(OrderCondition model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("OrderId", model.OrderId));
                    parameters.Add(new SqlParameter("ICDCodeCNId", model.ICDCodeCNId));
                    parameters.Add(new SqlParameter("PrimaryCondition", model.PrimaryCondition));
      
          
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    await _procExecutor.ExecuteAsync("OrderCondition_Insert", args);            
        }





    }

      public interface IUserPreferenceRepository: ISingletonDependency
      {
          Task<List<UserPreference>> GetAllAsync(int TenantId);
          
        Task<UserPreference> GetByIdAsync(Int64 Id , int TenantId);
        Task UpdateAsync(UserPreference model);

             Task InsertAsync(UserPreference model);

		      
          
          

        Task<List<UserPreference>> GetByTenantIdAsync(Int32 TenantId );

          
          
      }
    /// <summary>
    /// Data access layer for UserPreference
    /// </summary>
    public partial class UserPreferenceRepository : RepositoryBase, IUserPreferenceRepository
    {

        public UserPreferenceRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<UserPreference>> GetAllAsync(int TenantId)
        {
          var result = await _procExecutor.ExecuteProcAsync<UserPreference>("UserPreference_GetAll", new { TenantId });
      
                return (result?? new List<UserPreference>()).ToList();
        }

        public async Task<UserPreference> GetByIdAsync(Int64 Id , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<UserPreference>
                                      ("UserPreference_GetById",
                        new 
                        {
                          Id = Id 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<UserPreference>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(UserPreference model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("Id", model.Id));
                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    if(model.AdministrationSiteId.HasValue)
                        parameters.Add(new SqlParameter("AdministrationSiteId", model.AdministrationSiteId.Value));

                    if(model.CalendarColor!=null)
                        parameters.Add(new SqlParameter("CalendarColor", model.CalendarColor));

                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate));
                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("UserPreference_Update", args);
        }


							public async Task InsertAsync(UserPreference model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("Id", model.Id));
                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    if(model.AdministrationSiteId.HasValue)
                        parameters.Add(new SqlParameter("AdministrationSiteId", model.AdministrationSiteId.Value));

                    if(model.CalendarColor!=null)
                        parameters.Add(new SqlParameter("CalendarColor", model.CalendarColor));

                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate));
                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy));
      
          
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    await _procExecutor.ExecuteAsync("UserPreference_Insert", args);            
        }





        public async Task<List<UserPreference>> GetByTenantIdAsync(Int32 TenantId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<UserPreference>
                                      ("UserPreference_GetByTenantId",
                        new 
                        {
                          TenantId = TenantId 
                          
                        }
                       );
            
          return (result?? new List<UserPreference>()).ToList();
        }


    }

      public interface IOrderResultRepository: ISingletonDependency
      {
          Task<List<OrderResult>> GetAllAsync(int TenantId);
          
        Task<OrderResult> GetByIdAsync(Int64 Id , int TenantId);
        Task UpdateAsync(OrderResult model);

             Task<Int64> InsertAsync(OrderResult model);

		      
        Task ArchiveAndInsertAsync(OrderResult model);

          
          

        Task<List<OrderResult>> GetByOrderIdAsync(Int64 OrderId , int TenantId);

          
          
      }
    /// <summary>
    /// Data access layer for OrderResult
    /// </summary>
    public partial class OrderResultRepository : RepositoryBase, IOrderResultRepository
    {

        public OrderResultRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<OrderResult>> GetAllAsync(int TenantId)
        {
          var result = await _procExecutor.ExecuteProcAsync<OrderResult>("OrderResult_GetAll", new { TenantId });
      
                return (result?? new List<OrderResult>()).ToList();
        }

        public async Task<OrderResult> GetByIdAsync(Int64 Id , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<OrderResult>
                                      ("OrderResult_GetById",
                        new 
                        {
                          Id = Id 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<OrderResult>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(OrderResult model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("Id", model.Id));
                    parameters.Add(new SqlParameter("OrderId", model.OrderId));
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("ResultDate", model.ResultDate));
                    parameters.Add(new SqlParameter("Archived", model.Archived));
                    if(model.ParentId.HasValue)
                        parameters.Add(new SqlParameter("ParentId", model.ParentId.Value));

                    parameters.Add(new SqlParameter("ResultById", model.ResultById));
                    if(model.ParentLoincCodeId!=null)
                        parameters.Add(new SqlParameter("ParentLoincCodeId", model.ParentLoincCodeId));

                    parameters.Add(new SqlParameter("LoincCodeId", model.LoincCodeId));
                    parameters.Add(new SqlParameter("ResultDataCodeId", model.ResultDataCodeId));
                    parameters.Add(new SqlParameter("ResultData", model.ResultData));
                    if(model.AdministrationSiteId.HasValue)
                        parameters.Add(new SqlParameter("AdministrationSiteId", model.AdministrationSiteId.Value));

                    if(model.Unit!=null)
                        parameters.Add(new SqlParameter("Unit", model.Unit));

                    if(model.RangeValue!=null)
                        parameters.Add(new SqlParameter("RangeValue", model.RangeValue));

                    parameters.Add(new SqlParameter("AbnormalCodeId", model.AbnormalCodeId));
                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    if(model.ResultStatusCodeId.HasValue)
                        parameters.Add(new SqlParameter("ResultStatusCodeId", model.ResultStatusCodeId.Value));

                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate));
                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("OrderResult_Update", args);
        }


							public async Task<Int64> InsertAsync(OrderResult model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("OrderId", model.OrderId));
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("ResultDate", model.ResultDate));
                    parameters.Add(new SqlParameter("Archived", model.Archived));
                    if(model.ParentId.HasValue)
                        parameters.Add(new SqlParameter("ParentId", model.ParentId.Value));

                    parameters.Add(new SqlParameter("ResultById", model.ResultById));
                    if(model.ParentLoincCodeId!=null)
                        parameters.Add(new SqlParameter("ParentLoincCodeId", model.ParentLoincCodeId));

                    parameters.Add(new SqlParameter("LoincCodeId", model.LoincCodeId));
                    parameters.Add(new SqlParameter("ResultDataCodeId", model.ResultDataCodeId));
                    parameters.Add(new SqlParameter("ResultData", model.ResultData));
                    if(model.AdministrationSiteId.HasValue)
                        parameters.Add(new SqlParameter("AdministrationSiteId", model.AdministrationSiteId.Value));

                    if(model.Unit!=null)
                        parameters.Add(new SqlParameter("Unit", model.Unit));

                    if(model.RangeValue!=null)
                        parameters.Add(new SqlParameter("RangeValue", model.RangeValue));

                    parameters.Add(new SqlParameter("AbnormalCodeId", model.AbnormalCodeId));
                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    if(model.ResultStatusCodeId.HasValue)
                        parameters.Add(new SqlParameter("ResultStatusCodeId", model.ResultStatusCodeId.Value));

                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate));
                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int64>("OrderResult_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt64(result);            
        }


        public async Task ArchiveAndInsertAsync(OrderResult model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("Id", model.Id));
                    parameters.Add(new SqlParameter("OrderId", model.OrderId));
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("ResultDate", model.ResultDate));
                    parameters.Add(new SqlParameter("Archived", model.Archived));
                    if(model.ParentId.HasValue)
                        parameters.Add(new SqlParameter("ParentId", model.ParentId.Value));

                    parameters.Add(new SqlParameter("ResultById", model.ResultById));
                    if(model.ParentLoincCodeId!=null)
                        parameters.Add(new SqlParameter("ParentLoincCodeId", model.ParentLoincCodeId));

                    parameters.Add(new SqlParameter("LoincCodeId", model.LoincCodeId));
                    parameters.Add(new SqlParameter("ResultDataCodeId", model.ResultDataCodeId));
                    parameters.Add(new SqlParameter("ResultData", model.ResultData));
                    if(model.AdministrationSiteId.HasValue)
                        parameters.Add(new SqlParameter("AdministrationSiteId", model.AdministrationSiteId.Value));

                    if(model.Unit!=null)
                        parameters.Add(new SqlParameter("Unit", model.Unit));

                    if(model.RangeValue!=null)
                        parameters.Add(new SqlParameter("RangeValue", model.RangeValue));

                    parameters.Add(new SqlParameter("AbnormalCodeId", model.AbnormalCodeId));
                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    if(model.ResultStatusCodeId.HasValue)
                        parameters.Add(new SqlParameter("ResultStatusCodeId", model.ResultStatusCodeId.Value));

                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate));
                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("OrderResult_ArchiveAndInsert", args);
        }





        public async Task<List<OrderResult>> GetByOrderIdAsync(Int64 OrderId , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<OrderResult>
                                      ("OrderResult_GetByOrderId",
                        new 
                        {
                          OrderId = OrderId 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<OrderResult>()).ToList();
        }


    }

      public interface IAppointmentRepository: ISingletonDependency
      {
          Task<List<Appointment>> GetAllAsync(int TenantId);
          
        Task<Appointment> GetByIdAsync(Int64 Id , int TenantId);
        Task UpdateAsync(Appointment model);

             Task<Int64> InsertAsync(Appointment model);

		      
          
          

        Task<List<Appointment>> GetByTenantIdAsync(Int32 TenantId );


        Task<List<Appointment>> GetByPidAsync(Int32 Pid , int TenantId);


        Task<List<Appointment>> GetByProviderIdAsync(Int32 ProviderId , int TenantId);

          
          
      }
    /// <summary>
    /// Data access layer for Appointment
    /// </summary>
    public partial class AppointmentRepository : RepositoryBase, IAppointmentRepository
    {

        public AppointmentRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<Appointment>> GetAllAsync(int TenantId)
        {
          var result = await _procExecutor.ExecuteProcAsync<Appointment>("Appointment_GetAll", new { TenantId });
      
                return (result?? new List<Appointment>()).ToList();
        }

        public async Task<Appointment> GetByIdAsync(Int64 Id , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<Appointment>
                                      ("Appointment_GetById",
                        new 
                        {
                          Id = Id 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<Appointment>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(Appointment model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("Id", model.Id));
                    if(model.Pid.HasValue)
                        parameters.Add(new SqlParameter("Pid", model.Pid.Value));

                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("ProviderId", model.ProviderId));
                    parameters.Add(new SqlParameter("AppointmentCodeId", model.AppointmentCodeId));
                    parameters.Add(new SqlParameter("AppointmentStatusCodeId", model.AppointmentStatusCodeId));
                    parameters.Add(new SqlParameter("AllDayEvent", model.AllDayEvent));
                    parameters.Add(new SqlParameter("StartDate", model.StartDate));
                    parameters.Add(new SqlParameter("EndDate", model.EndDate));
                    parameters.Add(new SqlParameter("Title", model.Title));
                    if(model.AdministrationSiteId.HasValue)
                        parameters.Add(new SqlParameter("AdministrationSiteId", model.AdministrationSiteId.Value));

                    if(model.Fname!=null)
                        parameters.Add(new SqlParameter("Fname", model.Fname));

                    if(model.Lname!=null)
                        parameters.Add(new SqlParameter("Lname", model.Lname));

                    if(model.Mname!=null)
                        parameters.Add(new SqlParameter("Mname", model.Mname));

                    if(model.DOB.HasValue)
                        parameters.Add(new SqlParameter("DOB", model.DOB.Value));

                    if(model.PhoneCell!=null)
                        parameters.Add(new SqlParameter("PhoneCell", model.PhoneCell));

                    if(model.PhoneHome!=null)
                        parameters.Add(new SqlParameter("PhoneHome", model.PhoneHome));

                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate));
                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("Appointment_Update", args);
        }


							public async Task<Int64> InsertAsync(Appointment model)
        {
          var parameters = new List<SqlParameter>();
          
                    if(model.Pid.HasValue)
                        parameters.Add(new SqlParameter("Pid", model.Pid.Value));

                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("ProviderId", model.ProviderId));
                    parameters.Add(new SqlParameter("AppointmentCodeId", model.AppointmentCodeId));
                    parameters.Add(new SqlParameter("AppointmentStatusCodeId", model.AppointmentStatusCodeId));
                    parameters.Add(new SqlParameter("AllDayEvent", model.AllDayEvent));
                    parameters.Add(new SqlParameter("StartDate", model.StartDate));
                    parameters.Add(new SqlParameter("EndDate", model.EndDate));
                    parameters.Add(new SqlParameter("Title", model.Title));
                    if(model.AdministrationSiteId.HasValue)
                        parameters.Add(new SqlParameter("AdministrationSiteId", model.AdministrationSiteId.Value));

                    if(model.Fname!=null)
                        parameters.Add(new SqlParameter("Fname", model.Fname));

                    if(model.Lname!=null)
                        parameters.Add(new SqlParameter("Lname", model.Lname));

                    if(model.Mname!=null)
                        parameters.Add(new SqlParameter("Mname", model.Mname));

                    if(model.DOB.HasValue)
                        parameters.Add(new SqlParameter("DOB", model.DOB.Value));

                    if(model.PhoneCell!=null)
                        parameters.Add(new SqlParameter("PhoneCell", model.PhoneCell));

                    if(model.PhoneHome!=null)
                        parameters.Add(new SqlParameter("PhoneHome", model.PhoneHome));

                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate));
                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int64>("Appointment_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt64(result);            
        }





        public async Task<List<Appointment>> GetByTenantIdAsync(Int32 TenantId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<Appointment>
                                      ("Appointment_GetByTenantId",
                        new 
                        {
                          TenantId = TenantId 
                          
                        }
                       );
            
          return (result?? new List<Appointment>()).ToList();
        }


        public async Task<List<Appointment>> GetByPidAsync(Int32 Pid , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<Appointment>
                                      ("Appointment_GetByPid",
                        new 
                        {
                          Pid = Pid 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<Appointment>()).ToList();
        }


        public async Task<List<Appointment>> GetByProviderIdAsync(Int32 ProviderId , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<Appointment>
                                      ("Appointment_GetByProviderId",
                        new 
                        {
                          ProviderId = ProviderId 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<Appointment>()).ToList();
        }


    }

      public interface IAppointmentCodeRepository: ISingletonDependency
      {
          Task<List<AppointmentCode>> GetAllAsync();
          
        Task<AppointmentCode> GetByAppointmentCodeIdAsync(Int32 AppointmentCodeId );
        Task UpdateAsync(AppointmentCode model);

             Task InsertAsync(AppointmentCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for AppointmentCode
    /// </summary>
    public partial class AppointmentCodeRepository : RepositoryBase, IAppointmentCodeRepository
    {

        public AppointmentCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<AppointmentCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<AppointmentCode>("AppointmentCode_GetAll", null);
      
                return (result?? new List<AppointmentCode>()).ToList();
        }

        public async Task<AppointmentCode> GetByAppointmentCodeIdAsync(Int32 AppointmentCodeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<AppointmentCode>
                                      ("AppointmentCode_GetByAppointmentCodeId",
                        new 
                        {
                          AppointmentCodeId = AppointmentCodeId 
                          
                        }
                       );
            
          return (result?? new List<AppointmentCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(AppointmentCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("AppointmentCodeId", model.AppointmentCodeId));
                    parameters.Add(new SqlParameter("AppointmentCodeName", model.AppointmentCodeName));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("AppointmentCode_Update", args);
        }


							public async Task InsertAsync(AppointmentCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("AppointmentCodeId", model.AppointmentCodeId));
                    parameters.Add(new SqlParameter("AppointmentCodeName", model.AppointmentCodeName));
      
          
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    await _procExecutor.ExecuteAsync("AppointmentCode_Insert", args);            
        }





    }

      public interface IAppointmentStatusCodeRepository: ISingletonDependency
      {
          Task<List<AppointmentStatusCode>> GetAllAsync();
          
        Task<AppointmentStatusCode> GetByAppointmentStatusCodeIdAsync(Int32 AppointmentStatusCodeId );
        Task UpdateAsync(AppointmentStatusCode model);

             Task InsertAsync(AppointmentStatusCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for AppointmentStatusCode
    /// </summary>
    public partial class AppointmentStatusCodeRepository : RepositoryBase, IAppointmentStatusCodeRepository
    {

        public AppointmentStatusCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<AppointmentStatusCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<AppointmentStatusCode>("AppointmentStatusCode_GetAll", null);
      
                return (result?? new List<AppointmentStatusCode>()).ToList();
        }

        public async Task<AppointmentStatusCode> GetByAppointmentStatusCodeIdAsync(Int32 AppointmentStatusCodeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<AppointmentStatusCode>
                                      ("AppointmentStatusCode_GetByAppointmentStatusCodeId",
                        new 
                        {
                          AppointmentStatusCodeId = AppointmentStatusCodeId 
                          
                        }
                       );
            
          return (result?? new List<AppointmentStatusCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(AppointmentStatusCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("AppointmentStatusCodeId", model.AppointmentStatusCodeId));
                    parameters.Add(new SqlParameter("AppointmentStatusCodeName", model.AppointmentStatusCodeName));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("AppointmentStatusCode_Update", args);
        }


							public async Task InsertAsync(AppointmentStatusCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("AppointmentStatusCodeId", model.AppointmentStatusCodeId));
                    parameters.Add(new SqlParameter("AppointmentStatusCodeName", model.AppointmentStatusCodeName));
      
          
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    await _procExecutor.ExecuteAsync("AppointmentStatusCode_Insert", args);            
        }





    }

      public interface IPatientVitalRepository: ISingletonDependency
      {
          Task<List<PatientVital>> GetAllAsync(int TenantId);
          
        Task<PatientVital> GetByVitalIdAsync(Int64 VitalId , int TenantId);
        Task UpdateAsync(PatientVital model);

             Task<Int64> InsertAsync(PatientVital model);

		      
          
          

        Task<List<PatientVital>> GetByVisitIdAsync(Int64 VisitId , int TenantId);


        Task<List<PatientVital>> GetByTenantIdAsync(Int32 TenantId );


        Task<List<PatientVital>> GetByPidAsync(Int64 Pid , int TenantId);

          
          
      }
    /// <summary>
    /// Data access layer for PatientVital
    /// </summary>
    public partial class PatientVitalRepository : RepositoryBase, IPatientVitalRepository
    {

        public PatientVitalRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<PatientVital>> GetAllAsync(int TenantId)
        {
          var result = await _procExecutor.ExecuteProcAsync<PatientVital>("PatientVital_GetAll", new { TenantId });
      
                return (result?? new List<PatientVital>()).ToList();
        }

        public async Task<PatientVital> GetByVitalIdAsync(Int64 VitalId , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<PatientVital>
                                      ("PatientVital_GetByVitalId",
                        new 
                        {
                          VitalId = VitalId 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<PatientVital>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(PatientVital model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("VitalId", model.VitalId));
                    parameters.Add(new SqlParameter("VisitId", model.VisitId));
                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    if(model.Bps.HasValue)
                        parameters.Add(new SqlParameter("Bps", model.Bps.Value));

                    if(model.Bpd.HasValue)
                        parameters.Add(new SqlParameter("Bpd", model.Bpd.Value));

                    if(model.Weight.HasValue)
                        parameters.Add(new SqlParameter("Weight", model.Weight.Value));

                    if(model.Height.HasValue)
                        parameters.Add(new SqlParameter("Height", model.Height.Value));

                    if(model.Temperature.HasValue)
                        parameters.Add(new SqlParameter("Temperature", model.Temperature.Value));

                    if(model.TempMethod!=null)
                        parameters.Add(new SqlParameter("TempMethod", model.TempMethod));

                    if(model.Pulse.HasValue)
                        parameters.Add(new SqlParameter("Pulse", model.Pulse.Value));

                    if(model.Respiration.HasValue)
                        parameters.Add(new SqlParameter("Respiration", model.Respiration.Value));

                    if(model.BMI.HasValue)
                        parameters.Add(new SqlParameter("BMI", model.BMI.Value));

                    if(model.BMIStatus!=null)
                        parameters.Add(new SqlParameter("BMIStatus", model.BMIStatus));

                    if(model.WaistCirc.HasValue)
                        parameters.Add(new SqlParameter("WaistCirc", model.WaistCirc.Value));

                    if(model.HeadCirc.HasValue)
                        parameters.Add(new SqlParameter("HeadCirc", model.HeadCirc.Value));

                    if(model.OxygenSaturation.HasValue)
                        parameters.Add(new SqlParameter("OxygenSaturation", model.OxygenSaturation.Value));
      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("PatientVital_Update", args);
        }


							public async Task<Int64> InsertAsync(PatientVital model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("VisitId", model.VisitId));
                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    if(model.Bps.HasValue)
                        parameters.Add(new SqlParameter("Bps", model.Bps.Value));

                    if(model.Bpd.HasValue)
                        parameters.Add(new SqlParameter("Bpd", model.Bpd.Value));

                    if(model.Weight.HasValue)
                        parameters.Add(new SqlParameter("Weight", model.Weight.Value));

                    if(model.Height.HasValue)
                        parameters.Add(new SqlParameter("Height", model.Height.Value));

                    if(model.Temperature.HasValue)
                        parameters.Add(new SqlParameter("Temperature", model.Temperature.Value));

                    if(model.TempMethod!=null)
                        parameters.Add(new SqlParameter("TempMethod", model.TempMethod));

                    if(model.Pulse.HasValue)
                        parameters.Add(new SqlParameter("Pulse", model.Pulse.Value));

                    if(model.Respiration.HasValue)
                        parameters.Add(new SqlParameter("Respiration", model.Respiration.Value));

                    if(model.BMI.HasValue)
                        parameters.Add(new SqlParameter("BMI", model.BMI.Value));

                    if(model.BMIStatus!=null)
                        parameters.Add(new SqlParameter("BMIStatus", model.BMIStatus));

                    if(model.WaistCirc.HasValue)
                        parameters.Add(new SqlParameter("WaistCirc", model.WaistCirc.Value));

                    if(model.HeadCirc.HasValue)
                        parameters.Add(new SqlParameter("HeadCirc", model.HeadCirc.Value));

                    if(model.OxygenSaturation.HasValue)
                        parameters.Add(new SqlParameter("OxygenSaturation", model.OxygenSaturation.Value));

      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int64>("PatientVital_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt64(result);            
        }





        public async Task<List<PatientVital>> GetByVisitIdAsync(Int64 VisitId , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<PatientVital>
                                      ("PatientVital_GetByVisitId",
                        new 
                        {
                          VisitId = VisitId 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<PatientVital>()).ToList();
        }


        public async Task<List<PatientVital>> GetByTenantIdAsync(Int32 TenantId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<PatientVital>
                                      ("PatientVital_GetByTenantId",
                        new 
                        {
                          TenantId = TenantId 
                          
                        }
                       );
            
          return (result?? new List<PatientVital>()).ToList();
        }


        public async Task<List<PatientVital>> GetByPidAsync(Int64 Pid , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<PatientVital>
                                      ("PatientVital_GetByPid",
                        new 
                        {
                          Pid = Pid 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<PatientVital>()).ToList();
        }


    }

      public interface IOrderSpecimenRepository: ISingletonDependency
      {
          Task<List<OrderSpecimen>> GetAllAsync(int TenantId);
          
        Task<OrderSpecimen> GetByIdAsync(Int64 Id , int TenantId);
        Task UpdateAsync(OrderSpecimen model);

             Task<Int64> InsertAsync(OrderSpecimen model);

		      
        Task ArchiveAndInsertAsync(OrderSpecimen model);

          
          

        Task<List<OrderSpecimen>> GetByOrderIdAsync(Int64 OrderId , int TenantId);

          
          
      }
    /// <summary>
    /// Data access layer for OrderSpecimen
    /// </summary>
    public partial class OrderSpecimenRepository : RepositoryBase, IOrderSpecimenRepository
    {

        public OrderSpecimenRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<OrderSpecimen>> GetAllAsync(int TenantId)
        {
          var result = await _procExecutor.ExecuteProcAsync<OrderSpecimen>("OrderSpecimen_GetAll", new { TenantId });
      
                return (result?? new List<OrderSpecimen>()).ToList();
        }

        public async Task<OrderSpecimen> GetByIdAsync(Int64 Id , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<OrderSpecimen>
                                      ("OrderSpecimen_GetById",
                        new 
                        {
                          Id = Id 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<OrderSpecimen>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(OrderSpecimen model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("Id", model.Id));
                    parameters.Add(new SqlParameter("OrderId", model.OrderId));
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("Archived", model.Archived));
                    if(model.ParentId.HasValue)
                        parameters.Add(new SqlParameter("ParentId", model.ParentId.Value));

                    parameters.Add(new SqlParameter("CollectedDate", model.CollectedDate));
                    parameters.Add(new SqlParameter("CollectedById", model.CollectedById));
                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    parameters.Add(new SqlParameter("StatusCodeId", model.StatusCodeId));
                    if(model.AdministrationSiteId.HasValue)
                        parameters.Add(new SqlParameter("AdministrationSiteId", model.AdministrationSiteId.Value));

                    if(model.SpecimenNumber!=null)
                        parameters.Add(new SqlParameter("SpecimenNumber", model.SpecimenNumber));

                    parameters.Add(new SqlParameter("SpecimenCodeId", model.SpecimenCodeId));
                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate));
                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("OrderSpecimen_Update", args);
        }


							public async Task<Int64> InsertAsync(OrderSpecimen model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("OrderId", model.OrderId));
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("Archived", model.Archived));
                    if(model.ParentId.HasValue)
                        parameters.Add(new SqlParameter("ParentId", model.ParentId.Value));

                    parameters.Add(new SqlParameter("CollectedDate", model.CollectedDate));
                    parameters.Add(new SqlParameter("CollectedById", model.CollectedById));
                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    parameters.Add(new SqlParameter("StatusCodeId", model.StatusCodeId));
                    if(model.AdministrationSiteId.HasValue)
                        parameters.Add(new SqlParameter("AdministrationSiteId", model.AdministrationSiteId.Value));

                    if(model.SpecimenNumber!=null)
                        parameters.Add(new SqlParameter("SpecimenNumber", model.SpecimenNumber));

                    parameters.Add(new SqlParameter("SpecimenCodeId", model.SpecimenCodeId));
                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate));
                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int64>("OrderSpecimen_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt64(result);            
        }


        public async Task ArchiveAndInsertAsync(OrderSpecimen model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("Id", model.Id));
                    parameters.Add(new SqlParameter("OrderId", model.OrderId));
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("Archived", model.Archived));
                    if(model.ParentId.HasValue)
                        parameters.Add(new SqlParameter("ParentId", model.ParentId.Value));

                    parameters.Add(new SqlParameter("CollectedDate", model.CollectedDate));
                    parameters.Add(new SqlParameter("CollectedById", model.CollectedById));
                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    parameters.Add(new SqlParameter("StatusCodeId", model.StatusCodeId));
                    if(model.AdministrationSiteId.HasValue)
                        parameters.Add(new SqlParameter("AdministrationSiteId", model.AdministrationSiteId.Value));

                    if(model.SpecimenNumber!=null)
                        parameters.Add(new SqlParameter("SpecimenNumber", model.SpecimenNumber));

                    parameters.Add(new SqlParameter("SpecimenCodeId", model.SpecimenCodeId));
                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate));
                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("OrderSpecimen_ArchiveAndInsert", args);
        }





        public async Task<List<OrderSpecimen>> GetByOrderIdAsync(Int64 OrderId , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<OrderSpecimen>
                                      ("OrderSpecimen_GetByOrderId",
                        new 
                        {
                          OrderId = OrderId 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<OrderSpecimen>()).ToList();
        }


    }

      public interface IOutcomeCodeRepository: ISingletonDependency
      {
          Task<List<OutcomeCode>> GetAllAsync();
          
        Task<OutcomeCode> GetByOutcomeCodeIdAsync(Int32 OutcomeCodeId );
        Task UpdateAsync(OutcomeCode model);

             Task<Int32> InsertAsync(OutcomeCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for OutcomeCode
    /// </summary>
    public partial class OutcomeCodeRepository : RepositoryBase, IOutcomeCodeRepository
    {

        public OutcomeCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<OutcomeCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<OutcomeCode>("OutcomeCode_GetAll", null);
      
                return (result?? new List<OutcomeCode>()).ToList();
        }

        public async Task<OutcomeCode> GetByOutcomeCodeIdAsync(Int32 OutcomeCodeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<OutcomeCode>
                                      ("OutcomeCode_GetByOutcomeCodeId",
                        new 
                        {
                          OutcomeCodeId = OutcomeCodeId 
                          
                        }
                       );
            
          return (result?? new List<OutcomeCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(OutcomeCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("OutcomeCodeId", model.OutcomeCodeId));
                    parameters.Add(new SqlParameter("OutcomeCodeName", model.OutcomeCodeName));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("OutcomeCode_Update", args);
        }


							public async Task<Int32> InsertAsync(OutcomeCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("OutcomeCodeName", model.OutcomeCodeName));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int32>("OutcomeCode_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt32(result);            
        }





    }

      public interface IPatientAllergyRepository: ISingletonDependency
      {
          Task<List<PatientAllergy>> GetAllAsync(int TenantId);
          
        Task<PatientAllergy> GetByPatientAllergyIdAsync(Int64 PatientAllergyId , int TenantId);
        Task UpdateAsync(PatientAllergy model);

             Task<Int64> InsertAsync(PatientAllergy model);

		      
        Task ArchiveAndInsertAsync(PatientAllergy model);

          
          

        Task<List<PatientAllergy>> GetByVisitIdAsync(Int64 VisitId , int TenantId);


        Task<List<PatientAllergy>> GetByTenantIdAsync(Int32 TenantId );


        Task<List<PatientAllergy>> GetByPidAsync(Int64 Pid , int TenantId);

          
          
      }
    /// <summary>
    /// Data access layer for PatientAllergy
    /// </summary>
    public partial class PatientAllergyRepository : RepositoryBase, IPatientAllergyRepository
    {

        public PatientAllergyRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<PatientAllergy>> GetAllAsync(int TenantId)
        {
          var result = await _procExecutor.ExecuteProcAsync<PatientAllergy>("PatientAllergy_GetAll", new { TenantId });
      
                return (result?? new List<PatientAllergy>()).ToList();
        }

        public async Task<PatientAllergy> GetByPatientAllergyIdAsync(Int64 PatientAllergyId , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<PatientAllergy>
                                      ("PatientAllergy_GetByPatientAllergyId",
                        new 
                        {
                          PatientAllergyId = PatientAllergyId 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<PatientAllergy>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(PatientAllergy model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("PatientAllergyId", model.PatientAllergyId));
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("VisitId", model.VisitId));
                    parameters.Add(new SqlParameter("Archived", model.Archived));
                    if(model.ParentId.HasValue)
                        parameters.Add(new SqlParameter("ParentId", model.ParentId.Value));

                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("AllergyName", model.AllergyName));
                    parameters.Add(new SqlParameter("AllergyTypeId", model.AllergyTypeId));
                    parameters.Add(new SqlParameter("ReactionName", model.ReactionName));
                    parameters.Add(new SqlParameter("SeverityId", model.SeverityId));
                    parameters.Add(new SqlParameter("AllergyCategoryCodeId", model.AllergyCategoryCodeId));
                    if(model.StartDate.HasValue)
                        parameters.Add(new SqlParameter("StartDate", model.StartDate.Value));

                    if(model.EndDate.HasValue)
                        parameters.Add(new SqlParameter("EndDate", model.EndDate.Value));

                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    if(model.Status!=null)
                        parameters.Add(new SqlParameter("Status", model.Status));

                    parameters.Add(new SqlParameter("Provider", model.Provider));
                    if(model.CreateDate.HasValue)
                        parameters.Add(new SqlParameter("CreateDate", model.CreateDate.Value));

                    if(model.UpdateDate.HasValue)
                        parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate.Value));

                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    if(model.UpdatedBy.HasValue)
                        parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy.Value));
      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("PatientAllergy_Update", args);
        }


							public async Task<Int64> InsertAsync(PatientAllergy model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("VisitId", model.VisitId));
                    parameters.Add(new SqlParameter("Archived", model.Archived));
                    if(model.ParentId.HasValue)
                        parameters.Add(new SqlParameter("ParentId", model.ParentId.Value));

                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("AllergyName", model.AllergyName));
                    parameters.Add(new SqlParameter("AllergyTypeId", model.AllergyTypeId));
                    parameters.Add(new SqlParameter("ReactionName", model.ReactionName));
                    parameters.Add(new SqlParameter("SeverityId", model.SeverityId));
                    parameters.Add(new SqlParameter("AllergyCategoryCodeId", model.AllergyCategoryCodeId));
                    if(model.StartDate.HasValue)
                        parameters.Add(new SqlParameter("StartDate", model.StartDate.Value));

                    if(model.EndDate.HasValue)
                        parameters.Add(new SqlParameter("EndDate", model.EndDate.Value));

                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    if(model.Status!=null)
                        parameters.Add(new SqlParameter("Status", model.Status));

                    parameters.Add(new SqlParameter("Provider", model.Provider));
                    if(model.CreateDate.HasValue)
                        parameters.Add(new SqlParameter("CreateDate", model.CreateDate.Value));

                    if(model.UpdateDate.HasValue)
                        parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate.Value));

                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    if(model.UpdatedBy.HasValue)
                        parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy.Value));

      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int64>("PatientAllergy_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt64(result);            
        }


        public async Task ArchiveAndInsertAsync(PatientAllergy model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("PatientAllergyId", model.PatientAllergyId));
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("VisitId", model.VisitId));
                    parameters.Add(new SqlParameter("Archived", model.Archived));
                    if(model.ParentId.HasValue)
                        parameters.Add(new SqlParameter("ParentId", model.ParentId.Value));

                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("AllergyName", model.AllergyName));
                    parameters.Add(new SqlParameter("AllergyTypeId", model.AllergyTypeId));
                    parameters.Add(new SqlParameter("ReactionName", model.ReactionName));
                    parameters.Add(new SqlParameter("SeverityId", model.SeverityId));
                    parameters.Add(new SqlParameter("AllergyCategoryCodeId", model.AllergyCategoryCodeId));
                    if(model.StartDate.HasValue)
                        parameters.Add(new SqlParameter("StartDate", model.StartDate.Value));

                    if(model.EndDate.HasValue)
                        parameters.Add(new SqlParameter("EndDate", model.EndDate.Value));

                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    if(model.Status!=null)
                        parameters.Add(new SqlParameter("Status", model.Status));

                    parameters.Add(new SqlParameter("Provider", model.Provider));
                    if(model.CreateDate.HasValue)
                        parameters.Add(new SqlParameter("CreateDate", model.CreateDate.Value));

                    if(model.UpdateDate.HasValue)
                        parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate.Value));

                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    if(model.UpdatedBy.HasValue)
                        parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy.Value));
      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("PatientAllergy_ArchiveAndInsert", args);
        }





        public async Task<List<PatientAllergy>> GetByVisitIdAsync(Int64 VisitId , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<PatientAllergy>
                                      ("PatientAllergy_GetByVisitId",
                        new 
                        {
                          VisitId = VisitId 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<PatientAllergy>()).ToList();
        }


        public async Task<List<PatientAllergy>> GetByTenantIdAsync(Int32 TenantId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<PatientAllergy>
                                      ("PatientAllergy_GetByTenantId",
                        new 
                        {
                          TenantId = TenantId 
                          
                        }
                       );
            
          return (result?? new List<PatientAllergy>()).ToList();
        }


        public async Task<List<PatientAllergy>> GetByPidAsync(Int64 Pid , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<PatientAllergy>
                                      ("PatientAllergy_GetByPid",
                        new 
                        {
                          Pid = Pid 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<PatientAllergy>()).ToList();
        }


    }

      public interface IPatientDataRepository: ISingletonDependency
      {
          Task<List<PatientData>> GetAllAsync(int TenantId);
          
        Task<PatientData> GetByPidAsync(Int64 Pid , int TenantId);
        Task UpdateAsync(PatientData model);

             Task<Int64> InsertAsync(PatientData model);

		      
          
          

        Task<List<PatientData>> GetByLnameAsync(String Lname , int TenantId);


        Task<List<PatientData>> GetByMnameAsync(String Mname , int TenantId);


        Task<List<PatientData>> GetByFnameAsync(String Fname , int TenantId);


        Task<List<PatientData>> GetByTenantIdAsync(Int32 TenantId );

          
          
      }
    /// <summary>
    /// Data access layer for PatientData
    /// </summary>
    public partial class PatientDataRepository : RepositoryBase, IPatientDataRepository
    {

        public PatientDataRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<PatientData>> GetAllAsync(int TenantId)
        {
          var result = await _procExecutor.ExecuteProcAsync<PatientData>("PatientData_GetAll", new { TenantId });
      
                return (result?? new List<PatientData>()).ToList();
        }

        public async Task<PatientData> GetByPidAsync(Int64 Pid , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<PatientData>
                                      ("PatientData_GetByPid",
                        new 
                        {
                          Pid = Pid 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<PatientData>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(PatientData model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("Fname", model.Fname));
                    parameters.Add(new SqlParameter("Lname", model.Lname));
                    parameters.Add(new SqlParameter("Mname", model.Mname));
                    if(model.DOB.HasValue)
                        parameters.Add(new SqlParameter("DOB", model.DOB.Value));

                    parameters.Add(new SqlParameter("Street", model.Street));
                    parameters.Add(new SqlParameter("PostalCode", model.PostalCode));
                    parameters.Add(new SqlParameter("City", model.City));
                    parameters.Add(new SqlParameter("State", model.State));
                    parameters.Add(new SqlParameter("County", model.County));
                    parameters.Add(new SqlParameter("CountryCode", model.CountryCode));
                    parameters.Add(new SqlParameter("DriversLicense", model.DriversLicense));
                    parameters.Add(new SqlParameter("IdentificationNumber", model.IdentificationNumber));
                    parameters.Add(new SqlParameter("PhoneHome", model.PhoneHome));
                    parameters.Add(new SqlParameter("EmergencyContactPhone", model.EmergencyContactPhone));
                    parameters.Add(new SqlParameter("EmergencyContactName", model.EmergencyContactName));
                    parameters.Add(new SqlParameter("ContactRelationship", model.ContactRelationship));
                    parameters.Add(new SqlParameter("PhoneCell", model.PhoneCell));
                    parameters.Add(new SqlParameter("Gender", model.Gender));
                    parameters.Add(new SqlParameter("Email", model.Email));
                    parameters.Add(new SqlParameter("Race", model.Race));
                    parameters.Add(new SqlParameter("Ethnicity", model.Ethnicity));
                    if(model.BillingNote!=null)
                        parameters.Add(new SqlParameter("BillingNote", model.BillingNote));

                    if(model.DeceasedDate.HasValue)
                        parameters.Add(new SqlParameter("DeceasedDate", model.DeceasedDate.Value));

                    parameters.Add(new SqlParameter("DeceasedReason", model.DeceasedReason));
                    parameters.Add(new SqlParameter("CurrentlyInVisit", model.CurrentlyInVisit));
                    if(model.CreateDate.HasValue)
                        parameters.Add(new SqlParameter("CreateDate", model.CreateDate.Value));

                    if(model.UpdateDate.HasValue)
                        parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate.Value));

                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    if(model.UpdatedBy.HasValue)
                        parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy.Value));
      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("PatientData_Update", args);
        }


							public async Task<Int64> InsertAsync(PatientData model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("Fname", model.Fname));
                    parameters.Add(new SqlParameter("Lname", model.Lname));
                    parameters.Add(new SqlParameter("Mname", model.Mname));
                    if(model.DOB.HasValue)
                        parameters.Add(new SqlParameter("DOB", model.DOB.Value));

                    parameters.Add(new SqlParameter("Street", model.Street));
                    parameters.Add(new SqlParameter("PostalCode", model.PostalCode));
                    parameters.Add(new SqlParameter("City", model.City));
                    parameters.Add(new SqlParameter("State", model.State));
                    parameters.Add(new SqlParameter("County", model.County));
                    parameters.Add(new SqlParameter("CountryCode", model.CountryCode));
                    parameters.Add(new SqlParameter("DriversLicense", model.DriversLicense));
                    parameters.Add(new SqlParameter("IdentificationNumber", model.IdentificationNumber));
                    parameters.Add(new SqlParameter("PhoneHome", model.PhoneHome));
                    parameters.Add(new SqlParameter("EmergencyContactPhone", model.EmergencyContactPhone));
                    parameters.Add(new SqlParameter("EmergencyContactName", model.EmergencyContactName));
                    parameters.Add(new SqlParameter("ContactRelationship", model.ContactRelationship));
                    parameters.Add(new SqlParameter("PhoneCell", model.PhoneCell));
                    parameters.Add(new SqlParameter("Gender", model.Gender));
                    parameters.Add(new SqlParameter("Email", model.Email));
                    parameters.Add(new SqlParameter("Race", model.Race));
                    parameters.Add(new SqlParameter("Ethnicity", model.Ethnicity));
                    if(model.BillingNote!=null)
                        parameters.Add(new SqlParameter("BillingNote", model.BillingNote));

                    if(model.DeceasedDate.HasValue)
                        parameters.Add(new SqlParameter("DeceasedDate", model.DeceasedDate.Value));

                    parameters.Add(new SqlParameter("DeceasedReason", model.DeceasedReason));
                    parameters.Add(new SqlParameter("CurrentlyInVisit", model.CurrentlyInVisit));
                    if(model.CreateDate.HasValue)
                        parameters.Add(new SqlParameter("CreateDate", model.CreateDate.Value));

                    if(model.UpdateDate.HasValue)
                        parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate.Value));

                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    if(model.UpdatedBy.HasValue)
                        parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy.Value));

      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int64>("PatientData_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt64(result);            
        }





        public async Task<List<PatientData>> GetByLnameAsync(String Lname , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<PatientData>
                                      ("PatientData_GetByLname",
                        new 
                        {
                          Lname = Lname 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<PatientData>()).ToList();
        }


        public async Task<List<PatientData>> GetByMnameAsync(String Mname , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<PatientData>
                                      ("PatientData_GetByMname",
                        new 
                        {
                          Mname = Mname 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<PatientData>()).ToList();
        }


        public async Task<List<PatientData>> GetByFnameAsync(String Fname , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<PatientData>
                                      ("PatientData_GetByFname",
                        new 
                        {
                          Fname = Fname 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<PatientData>()).ToList();
        }


        public async Task<List<PatientData>> GetByTenantIdAsync(Int32 TenantId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<PatientData>
                                      ("PatientData_GetByTenantId",
                        new 
                        {
                          TenantId = TenantId 
                          
                        }
                       );
            
          return (result?? new List<PatientData>()).ToList();
        }


    }

      public interface IAbpAuditLogsRepository: ISingletonDependency
      {
          Task<List<AbpAuditLogs>> GetAllAsync(int TenantId);
          
        Task<AbpAuditLogs> GetByIdAsync(Int64 Id , int TenantId);
        Task UpdateAsync(AbpAuditLogs model);

             Task<Int64> InsertAsync(AbpAuditLogs model);

		      
          
          

        Task<List<AbpAuditLogs>> GetByTenantIdAsync(Int32 TenantId );


        Task<List<AbpAuditLogs>> GetByUserIdAsync(Int64 UserId , int TenantId);


        Task<List<AbpAuditLogs>> GetByExecutionTimeAsync(DateTime ExecutionTime , int TenantId);

          
          
      }
    /// <summary>
    /// Data access layer for AbpAuditLogs
    /// </summary>
    public partial class AbpAuditLogsRepository : RepositoryBase, IAbpAuditLogsRepository
    {

        public AbpAuditLogsRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<AbpAuditLogs>> GetAllAsync(int TenantId)
        {
          var result = await _procExecutor.ExecuteProcAsync<AbpAuditLogs>("AbpAuditLogs_GetAll", new { TenantId });
      
                return (result?? new List<AbpAuditLogs>()).ToList();
        }

        public async Task<AbpAuditLogs> GetByIdAsync(Int64 Id , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<AbpAuditLogs>
                                      ("AbpAuditLogs_GetById",
                        new 
                        {
                          Id = Id 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<AbpAuditLogs>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(AbpAuditLogs model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("Id", model.Id));
                    if(model.TenantId.HasValue)
                        parameters.Add(new SqlParameter("TenantId", model.TenantId.Value));

                    if(model.UserId.HasValue)
                        parameters.Add(new SqlParameter("UserId", model.UserId.Value));

                    if(model.ServiceName!=null)
                        parameters.Add(new SqlParameter("ServiceName", model.ServiceName));

                    if(model.MethodName!=null)
                        parameters.Add(new SqlParameter("MethodName", model.MethodName));

                    if(model.Parameters!=null)
                        parameters.Add(new SqlParameter("Parameters", model.Parameters));

                    parameters.Add(new SqlParameter("ExecutionTime", model.ExecutionTime));
                    parameters.Add(new SqlParameter("ExecutionDuration", model.ExecutionDuration));
                    if(model.ClientIpAddress!=null)
                        parameters.Add(new SqlParameter("ClientIpAddress", model.ClientIpAddress));

                    if(model.ClientName!=null)
                        parameters.Add(new SqlParameter("ClientName", model.ClientName));

                    if(model.BrowserInfo!=null)
                        parameters.Add(new SqlParameter("BrowserInfo", model.BrowserInfo));

                    if(model.Exception!=null)
                        parameters.Add(new SqlParameter("Exception", model.Exception));

                    if(model.ImpersonatorUserId.HasValue)
                        parameters.Add(new SqlParameter("ImpersonatorUserId", model.ImpersonatorUserId.Value));

                    if(model.ImpersonatorTenantId.HasValue)
                        parameters.Add(new SqlParameter("ImpersonatorTenantId", model.ImpersonatorTenantId.Value));

                    if(model.CustomData!=null)
                        parameters.Add(new SqlParameter("CustomData", model.CustomData));
      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("AbpAuditLogs_Update", args);
        }


							public async Task<Int64> InsertAsync(AbpAuditLogs model)
        {
          var parameters = new List<SqlParameter>();
          
                    if(model.TenantId.HasValue)
                        parameters.Add(new SqlParameter("TenantId", model.TenantId.Value));

                    if(model.UserId.HasValue)
                        parameters.Add(new SqlParameter("UserId", model.UserId.Value));

                    if(model.ServiceName!=null)
                        parameters.Add(new SqlParameter("ServiceName", model.ServiceName));

                    if(model.MethodName!=null)
                        parameters.Add(new SqlParameter("MethodName", model.MethodName));

                    if(model.Parameters!=null)
                        parameters.Add(new SqlParameter("Parameters", model.Parameters));

                    parameters.Add(new SqlParameter("ExecutionTime", model.ExecutionTime));
                    parameters.Add(new SqlParameter("ExecutionDuration", model.ExecutionDuration));
                    if(model.ClientIpAddress!=null)
                        parameters.Add(new SqlParameter("ClientIpAddress", model.ClientIpAddress));

                    if(model.ClientName!=null)
                        parameters.Add(new SqlParameter("ClientName", model.ClientName));

                    if(model.BrowserInfo!=null)
                        parameters.Add(new SqlParameter("BrowserInfo", model.BrowserInfo));

                    if(model.Exception!=null)
                        parameters.Add(new SqlParameter("Exception", model.Exception));

                    if(model.ImpersonatorUserId.HasValue)
                        parameters.Add(new SqlParameter("ImpersonatorUserId", model.ImpersonatorUserId.Value));

                    if(model.ImpersonatorTenantId.HasValue)
                        parameters.Add(new SqlParameter("ImpersonatorTenantId", model.ImpersonatorTenantId.Value));

                    if(model.CustomData!=null)
                        parameters.Add(new SqlParameter("CustomData", model.CustomData));

      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int64>("AbpAuditLogs_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt64(result);            
        }





        public async Task<List<AbpAuditLogs>> GetByTenantIdAsync(Int32 TenantId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<AbpAuditLogs>
                                      ("AbpAuditLogs_GetByTenantId",
                        new 
                        {
                          TenantId = TenantId 
                          
                        }
                       );
            
          return (result?? new List<AbpAuditLogs>()).ToList();
        }


        public async Task<List<AbpAuditLogs>> GetByUserIdAsync(Int64 UserId , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<AbpAuditLogs>
                                      ("AbpAuditLogs_GetByUserId",
                        new 
                        {
                          UserId = UserId 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<AbpAuditLogs>()).ToList();
        }


        public async Task<List<AbpAuditLogs>> GetByExecutionTimeAsync(DateTime ExecutionTime , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<AbpAuditLogs>
                                      ("AbpAuditLogs_GetByExecutionTime",
                        new 
                        {
                          ExecutionTime = ExecutionTime 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<AbpAuditLogs>()).ToList();
        }


    }

      public interface IAbpPermissionsRepository: ISingletonDependency
      {
          Task<List<AbpPermissions>> GetAllAsync(int TenantId);
          
        Task<AbpPermissions> GetByIdAsync(Int64 Id , int TenantId);
        Task UpdateAsync(AbpPermissions model);

             Task<Int64> InsertAsync(AbpPermissions model);

		      
          
        Task<List<AbpPermissions>> GetByRoleIdAsync(Int32 RoleId , int TenantId);
        
        Task<List<AbpPermissions>> GetByUserIdAsync(Int64 UserId , int TenantId);
        
          

        Task<List<AbpPermissions>> GetByNameAsync(String Name , int TenantId);

          
          
      }
    /// <summary>
    /// Data access layer for AbpPermissions
    /// </summary>
    public partial class AbpPermissionsRepository : RepositoryBase, IAbpPermissionsRepository
    {

        public AbpPermissionsRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<AbpPermissions>> GetAllAsync(int TenantId)
        {
          var result = await _procExecutor.ExecuteProcAsync<AbpPermissions>("AbpPermissions_GetAll", new { TenantId });
      
                return (result?? new List<AbpPermissions>()).ToList();
        }

        public async Task<AbpPermissions> GetByIdAsync(Int64 Id , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<AbpPermissions>
                                      ("AbpPermissions_GetById",
                        new 
                        {
                          Id = Id 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<AbpPermissions>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(AbpPermissions model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("Id", model.Id));
                    parameters.Add(new SqlParameter("Name", model.Name));
                    parameters.Add(new SqlParameter("IsGranted", model.IsGranted));
                    parameters.Add(new SqlParameter("CreationTime", model.CreationTime));
                    if(model.CreatorUserId.HasValue)
                        parameters.Add(new SqlParameter("CreatorUserId", model.CreatorUserId.Value));

                    if(model.RoleId.HasValue)
                        parameters.Add(new SqlParameter("RoleId", model.RoleId.Value));

                    if(model.UserId.HasValue)
                        parameters.Add(new SqlParameter("UserId", model.UserId.Value));

                    parameters.Add(new SqlParameter("Discriminator", model.Discriminator));
                    if(model.TenantId.HasValue)
                        parameters.Add(new SqlParameter("TenantId", model.TenantId.Value));
      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("AbpPermissions_Update", args);
        }


							public async Task<Int64> InsertAsync(AbpPermissions model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("Name", model.Name));
                    parameters.Add(new SqlParameter("IsGranted", model.IsGranted));
                    parameters.Add(new SqlParameter("CreationTime", model.CreationTime));
                    if(model.CreatorUserId.HasValue)
                        parameters.Add(new SqlParameter("CreatorUserId", model.CreatorUserId.Value));

                    if(model.RoleId.HasValue)
                        parameters.Add(new SqlParameter("RoleId", model.RoleId.Value));

                    if(model.UserId.HasValue)
                        parameters.Add(new SqlParameter("UserId", model.UserId.Value));

                    parameters.Add(new SqlParameter("Discriminator", model.Discriminator));
                    if(model.TenantId.HasValue)
                        parameters.Add(new SqlParameter("TenantId", model.TenantId.Value));

      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int64>("AbpPermissions_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt64(result);            
        }



        public async Task<List<AbpPermissions>> GetByRoleIdAsync(Int32 RoleId , int TenantId)
        {
        var result = await _procExecutor
                      .ExecuteProcAsync<AbpPermissions>
                        ("AbpPermissions_GetByRoleId",
                        new 
                        {
                          RoleId = RoleId 
                          , TenantId 
                        }
                       );
      
                return (result?? new List<AbpPermissions>()).ToList();
    
        }
        public async Task<List<AbpPermissions>> GetByUserIdAsync(Int64 UserId , int TenantId)
        {
        var result = await _procExecutor
                      .ExecuteProcAsync<AbpPermissions>
                        ("AbpPermissions_GetByUserId",
                        new 
                        {
                          UserId = UserId 
                          , TenantId 
                        }
                       );
      
                return (result?? new List<AbpPermissions>()).ToList();
    
        }


        public async Task<List<AbpPermissions>> GetByNameAsync(String Name , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<AbpPermissions>
                                      ("AbpPermissions_GetByName",
                        new 
                        {
                          Name = Name 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<AbpPermissions>()).ToList();
        }


    }

      public interface IAbpRolesRepository: ISingletonDependency
      {
          Task<List<AbpRoles>> GetAllAsync(int TenantId);
          
        Task<AbpRoles> GetByIdAsync(Int32 Id , int TenantId);
        Task UpdateAsync(AbpRoles model);

             Task<Int32> InsertAsync(AbpRoles model);

		      
          
        Task<List<AbpRoles>> GetByDeleterUserIdAsync(Int64 DeleterUserId , int TenantId);
        
        Task<List<AbpRoles>> GetByLastModifierUserIdAsync(Int64 LastModifierUserId , int TenantId);
        
        Task<List<AbpRoles>> GetByCreatorUserIdAsync(Int64 CreatorUserId , int TenantId);
        
          

        Task<List<AbpRoles>> GetByIsDeletedAsync(Boolean IsDeleted , int TenantId);


        Task<List<AbpRoles>> GetByTenantIdAsync(Int32 TenantId );


        Task<List<AbpRoles>> GetByNameAsync(String Name , int TenantId);

          
          
      }
    /// <summary>
    /// Data access layer for AbpRoles
    /// </summary>
    public partial class AbpRolesRepository : RepositoryBase, IAbpRolesRepository
    {

        public AbpRolesRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<AbpRoles>> GetAllAsync(int TenantId)
        {
          var result = await _procExecutor.ExecuteProcAsync<AbpRoles>("AbpRoles_GetAll", new { TenantId });
      
                return (result?? new List<AbpRoles>()).ToList();
        }

        public async Task<AbpRoles> GetByIdAsync(Int32 Id , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<AbpRoles>
                                      ("AbpRoles_GetById",
                        new 
                        {
                          Id = Id 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<AbpRoles>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(AbpRoles model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("Id", model.Id));
                    if(model.TenantId.HasValue)
                        parameters.Add(new SqlParameter("TenantId", model.TenantId.Value));

                    parameters.Add(new SqlParameter("Name", model.Name));
                    parameters.Add(new SqlParameter("DisplayName", model.DisplayName));
                    parameters.Add(new SqlParameter("IsStatic", model.IsStatic));
                    parameters.Add(new SqlParameter("IsDefault", model.IsDefault));
                    parameters.Add(new SqlParameter("IsDeleted", model.IsDeleted));
                    if(model.DeleterUserId.HasValue)
                        parameters.Add(new SqlParameter("DeleterUserId", model.DeleterUserId.Value));

                    if(model.DeletionTime.HasValue)
                        parameters.Add(new SqlParameter("DeletionTime", model.DeletionTime.Value));

                    if(model.LastModificationTime.HasValue)
                        parameters.Add(new SqlParameter("LastModificationTime", model.LastModificationTime.Value));

                    if(model.LastModifierUserId.HasValue)
                        parameters.Add(new SqlParameter("LastModifierUserId", model.LastModifierUserId.Value));

                    parameters.Add(new SqlParameter("CreationTime", model.CreationTime));
                    if(model.CreatorUserId.HasValue)
                        parameters.Add(new SqlParameter("CreatorUserId", model.CreatorUserId.Value));
      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("AbpRoles_Update", args);
        }


							public async Task<Int32> InsertAsync(AbpRoles model)
        {
          var parameters = new List<SqlParameter>();
          
                    if(model.TenantId.HasValue)
                        parameters.Add(new SqlParameter("TenantId", model.TenantId.Value));

                    parameters.Add(new SqlParameter("Name", model.Name));
                    parameters.Add(new SqlParameter("DisplayName", model.DisplayName));
                    parameters.Add(new SqlParameter("IsStatic", model.IsStatic));
                    parameters.Add(new SqlParameter("IsDefault", model.IsDefault));
                    parameters.Add(new SqlParameter("IsDeleted", model.IsDeleted));
                    if(model.DeleterUserId.HasValue)
                        parameters.Add(new SqlParameter("DeleterUserId", model.DeleterUserId.Value));

                    if(model.DeletionTime.HasValue)
                        parameters.Add(new SqlParameter("DeletionTime", model.DeletionTime.Value));

                    if(model.LastModificationTime.HasValue)
                        parameters.Add(new SqlParameter("LastModificationTime", model.LastModificationTime.Value));

                    if(model.LastModifierUserId.HasValue)
                        parameters.Add(new SqlParameter("LastModifierUserId", model.LastModifierUserId.Value));

                    parameters.Add(new SqlParameter("CreationTime", model.CreationTime));
                    if(model.CreatorUserId.HasValue)
                        parameters.Add(new SqlParameter("CreatorUserId", model.CreatorUserId.Value));

      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int32>("AbpRoles_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt32(result);            
        }



        public async Task<List<AbpRoles>> GetByDeleterUserIdAsync(Int64 DeleterUserId , int TenantId)
        {
        var result = await _procExecutor
                      .ExecuteProcAsync<AbpRoles>
                        ("AbpRoles_GetByDeleterUserId",
                        new 
                        {
                          DeleterUserId = DeleterUserId 
                          , TenantId 
                        }
                       );
      
                return (result?? new List<AbpRoles>()).ToList();
    
        }
        public async Task<List<AbpRoles>> GetByLastModifierUserIdAsync(Int64 LastModifierUserId , int TenantId)
        {
        var result = await _procExecutor
                      .ExecuteProcAsync<AbpRoles>
                        ("AbpRoles_GetByLastModifierUserId",
                        new 
                        {
                          LastModifierUserId = LastModifierUserId 
                          , TenantId 
                        }
                       );
      
                return (result?? new List<AbpRoles>()).ToList();
    
        }
        public async Task<List<AbpRoles>> GetByCreatorUserIdAsync(Int64 CreatorUserId , int TenantId)
        {
        var result = await _procExecutor
                      .ExecuteProcAsync<AbpRoles>
                        ("AbpRoles_GetByCreatorUserId",
                        new 
                        {
                          CreatorUserId = CreatorUserId 
                          , TenantId 
                        }
                       );
      
                return (result?? new List<AbpRoles>()).ToList();
    
        }


        public async Task<List<AbpRoles>> GetByIsDeletedAsync(Boolean IsDeleted , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<AbpRoles>
                                      ("AbpRoles_GetByIsDeleted",
                        new 
                        {
                          IsDeleted = IsDeleted 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<AbpRoles>()).ToList();
        }


        public async Task<List<AbpRoles>> GetByTenantIdAsync(Int32 TenantId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<AbpRoles>
                                      ("AbpRoles_GetByTenantId",
                        new 
                        {
                          TenantId = TenantId 
                          
                        }
                       );
            
          return (result?? new List<AbpRoles>()).ToList();
        }


        public async Task<List<AbpRoles>> GetByNameAsync(String Name , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<AbpRoles>
                                      ("AbpRoles_GetByName",
                        new 
                        {
                          Name = Name 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<AbpRoles>()).ToList();
        }


    }

      public interface IAbpUsersRepository: ISingletonDependency
      {
          Task<List<AbpUsers>> GetAllAsync(int TenantId);
          
        Task<AbpUsers> GetByIdAsync(Int64 Id , int TenantId);
        Task UpdateAsync(AbpUsers model);

             Task<Int64> InsertAsync(AbpUsers model);

		      
          
        Task<List<AbpUsers>> GetByDeleterUserIdAsync(Int64 DeleterUserId , int TenantId);
        
        Task<List<AbpUsers>> GetByLastModifierUserIdAsync(Int64 LastModifierUserId , int TenantId);
        
        Task<List<AbpUsers>> GetByCreatorUserIdAsync(Int64 CreatorUserId , int TenantId);
        
          

        Task<List<AbpUsers>> GetByUserNameAsync(String UserName , int TenantId);


        Task<List<AbpUsers>> GetByIsDeletedAsync(Boolean IsDeleted , int TenantId);


        Task<List<AbpUsers>> GetByTenantIdAsync(Int32 TenantId );


        Task<List<AbpUsers>> GetByEmailAddressAsync(String EmailAddress , int TenantId);

          
          
      }
    /// <summary>
    /// Data access layer for AbpUsers
    /// </summary>
    public partial class AbpUsersRepository : RepositoryBase, IAbpUsersRepository
    {

        public AbpUsersRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<AbpUsers>> GetAllAsync(int TenantId)
        {
          var result = await _procExecutor.ExecuteProcAsync<AbpUsers>("AbpUsers_GetAll", new { TenantId });
      
                return (result?? new List<AbpUsers>()).ToList();
        }

        public async Task<AbpUsers> GetByIdAsync(Int64 Id , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<AbpUsers>
                                      ("AbpUsers_GetById",
                        new 
                        {
                          Id = Id 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<AbpUsers>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(AbpUsers model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("Id", model.Id));
                    if(model.TenantId.HasValue)
                        parameters.Add(new SqlParameter("TenantId", model.TenantId.Value));

                    if(model.AuthenticationSource!=null)
                        parameters.Add(new SqlParameter("AuthenticationSource", model.AuthenticationSource));

                    parameters.Add(new SqlParameter("Name", model.Name));
                    parameters.Add(new SqlParameter("Surname", model.Surname));
                    parameters.Add(new SqlParameter("UserName", model.UserName));
                    parameters.Add(new SqlParameter("Password", model.Password));
                    parameters.Add(new SqlParameter("EmailAddress", model.EmailAddress));
                    parameters.Add(new SqlParameter("IsEmailConfirmed", model.IsEmailConfirmed));
                    if(model.EmailConfirmationCode!=null)
                        parameters.Add(new SqlParameter("EmailConfirmationCode", model.EmailConfirmationCode));

                    if(model.PasswordResetCode!=null)
                        parameters.Add(new SqlParameter("PasswordResetCode", model.PasswordResetCode));

                    if(model.LastLoginTime.HasValue)
                        parameters.Add(new SqlParameter("LastLoginTime", model.LastLoginTime.Value));

                    parameters.Add(new SqlParameter("IsActive", model.IsActive));
                    parameters.Add(new SqlParameter("IsDeleted", model.IsDeleted));
                    if(model.DeleterUserId.HasValue)
                        parameters.Add(new SqlParameter("DeleterUserId", model.DeleterUserId.Value));

                    if(model.DeletionTime.HasValue)
                        parameters.Add(new SqlParameter("DeletionTime", model.DeletionTime.Value));

                    if(model.LastModificationTime.HasValue)
                        parameters.Add(new SqlParameter("LastModificationTime", model.LastModificationTime.Value));

                    if(model.LastModifierUserId.HasValue)
                        parameters.Add(new SqlParameter("LastModifierUserId", model.LastModifierUserId.Value));

                    parameters.Add(new SqlParameter("CreationTime", model.CreationTime));
                    if(model.CreatorUserId.HasValue)
                        parameters.Add(new SqlParameter("CreatorUserId", model.CreatorUserId.Value));

                    if(model.LockoutEndDateUtc.HasValue)
                        parameters.Add(new SqlParameter("LockoutEndDateUtc", model.LockoutEndDateUtc.Value));

                    parameters.Add(new SqlParameter("AccessFailedCount", model.AccessFailedCount));
                    parameters.Add(new SqlParameter("IsLockoutEnabled", model.IsLockoutEnabled));
                    if(model.PhoneNumber!=null)
                        parameters.Add(new SqlParameter("PhoneNumber", model.PhoneNumber));

                    parameters.Add(new SqlParameter("IsPhoneNumberConfirmed", model.IsPhoneNumberConfirmed));
                    if(model.SecurityStamp!=null)
                        parameters.Add(new SqlParameter("SecurityStamp", model.SecurityStamp));

                    parameters.Add(new SqlParameter("IsTwoFactorEnabled", model.IsTwoFactorEnabled));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("AbpUsers_Update", args);
        }


							public async Task<Int64> InsertAsync(AbpUsers model)
        {
          var parameters = new List<SqlParameter>();
          
                    if(model.TenantId.HasValue)
                        parameters.Add(new SqlParameter("TenantId", model.TenantId.Value));

                    if(model.AuthenticationSource!=null)
                        parameters.Add(new SqlParameter("AuthenticationSource", model.AuthenticationSource));

                    parameters.Add(new SqlParameter("Name", model.Name));
                    parameters.Add(new SqlParameter("Surname", model.Surname));
                    parameters.Add(new SqlParameter("UserName", model.UserName));
                    parameters.Add(new SqlParameter("Password", model.Password));
                    parameters.Add(new SqlParameter("EmailAddress", model.EmailAddress));
                    parameters.Add(new SqlParameter("IsEmailConfirmed", model.IsEmailConfirmed));
                    if(model.EmailConfirmationCode!=null)
                        parameters.Add(new SqlParameter("EmailConfirmationCode", model.EmailConfirmationCode));

                    if(model.PasswordResetCode!=null)
                        parameters.Add(new SqlParameter("PasswordResetCode", model.PasswordResetCode));

                    if(model.LastLoginTime.HasValue)
                        parameters.Add(new SqlParameter("LastLoginTime", model.LastLoginTime.Value));

                    parameters.Add(new SqlParameter("IsActive", model.IsActive));
                    parameters.Add(new SqlParameter("IsDeleted", model.IsDeleted));
                    if(model.DeleterUserId.HasValue)
                        parameters.Add(new SqlParameter("DeleterUserId", model.DeleterUserId.Value));

                    if(model.DeletionTime.HasValue)
                        parameters.Add(new SqlParameter("DeletionTime", model.DeletionTime.Value));

                    if(model.LastModificationTime.HasValue)
                        parameters.Add(new SqlParameter("LastModificationTime", model.LastModificationTime.Value));

                    if(model.LastModifierUserId.HasValue)
                        parameters.Add(new SqlParameter("LastModifierUserId", model.LastModifierUserId.Value));

                    parameters.Add(new SqlParameter("CreationTime", model.CreationTime));
                    if(model.CreatorUserId.HasValue)
                        parameters.Add(new SqlParameter("CreatorUserId", model.CreatorUserId.Value));

                    if(model.LockoutEndDateUtc.HasValue)
                        parameters.Add(new SqlParameter("LockoutEndDateUtc", model.LockoutEndDateUtc.Value));

                    parameters.Add(new SqlParameter("AccessFailedCount", model.AccessFailedCount));
                    parameters.Add(new SqlParameter("IsLockoutEnabled", model.IsLockoutEnabled));
                    if(model.PhoneNumber!=null)
                        parameters.Add(new SqlParameter("PhoneNumber", model.PhoneNumber));

                    parameters.Add(new SqlParameter("IsPhoneNumberConfirmed", model.IsPhoneNumberConfirmed));
                    if(model.SecurityStamp!=null)
                        parameters.Add(new SqlParameter("SecurityStamp", model.SecurityStamp));

                    parameters.Add(new SqlParameter("IsTwoFactorEnabled", model.IsTwoFactorEnabled));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int64>("AbpUsers_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt64(result);            
        }



        public async Task<List<AbpUsers>> GetByDeleterUserIdAsync(Int64 DeleterUserId , int TenantId)
        {
        var result = await _procExecutor
                      .ExecuteProcAsync<AbpUsers>
                        ("AbpUsers_GetByDeleterUserId",
                        new 
                        {
                          DeleterUserId = DeleterUserId 
                          , TenantId 
                        }
                       );
      
                return (result?? new List<AbpUsers>()).ToList();
    
        }
        public async Task<List<AbpUsers>> GetByLastModifierUserIdAsync(Int64 LastModifierUserId , int TenantId)
        {
        var result = await _procExecutor
                      .ExecuteProcAsync<AbpUsers>
                        ("AbpUsers_GetByLastModifierUserId",
                        new 
                        {
                          LastModifierUserId = LastModifierUserId 
                          , TenantId 
                        }
                       );
      
                return (result?? new List<AbpUsers>()).ToList();
    
        }
        public async Task<List<AbpUsers>> GetByCreatorUserIdAsync(Int64 CreatorUserId , int TenantId)
        {
        var result = await _procExecutor
                      .ExecuteProcAsync<AbpUsers>
                        ("AbpUsers_GetByCreatorUserId",
                        new 
                        {
                          CreatorUserId = CreatorUserId 
                          , TenantId 
                        }
                       );
      
                return (result?? new List<AbpUsers>()).ToList();
    
        }


        public async Task<List<AbpUsers>> GetByUserNameAsync(String UserName , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<AbpUsers>
                                      ("AbpUsers_GetByUserName",
                        new 
                        {
                          UserName = UserName 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<AbpUsers>()).ToList();
        }


        public async Task<List<AbpUsers>> GetByIsDeletedAsync(Boolean IsDeleted , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<AbpUsers>
                                      ("AbpUsers_GetByIsDeleted",
                        new 
                        {
                          IsDeleted = IsDeleted 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<AbpUsers>()).ToList();
        }


        public async Task<List<AbpUsers>> GetByTenantIdAsync(Int32 TenantId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<AbpUsers>
                                      ("AbpUsers_GetByTenantId",
                        new 
                        {
                          TenantId = TenantId 
                          
                        }
                       );
            
          return (result?? new List<AbpUsers>()).ToList();
        }


        public async Task<List<AbpUsers>> GetByEmailAddressAsync(String EmailAddress , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<AbpUsers>
                                      ("AbpUsers_GetByEmailAddress",
                        new 
                        {
                          EmailAddress = EmailAddress 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<AbpUsers>()).ToList();
        }


    }

      public interface IAbpUserRolesRepository: ISingletonDependency
      {
          Task<List<AbpUserRoles>> GetAllAsync(int TenantId);
          
        Task<AbpUserRoles> GetByIdAsync(Int64 Id , int TenantId);
        Task UpdateAsync(AbpUserRoles model);

             Task<Int64> InsertAsync(AbpUserRoles model);

		      
          
        Task<List<AbpUserRoles>> GetByUserIdAsync(Int64 UserId , int TenantId);
        
          

        Task<List<AbpUserRoles>> GetByRoleIdAsync(Int32 RoleId , int TenantId);

          
          
      }
    /// <summary>
    /// Data access layer for AbpUserRoles
    /// </summary>
    public partial class AbpUserRolesRepository : RepositoryBase, IAbpUserRolesRepository
    {

        public AbpUserRolesRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<AbpUserRoles>> GetAllAsync(int TenantId)
        {
          var result = await _procExecutor.ExecuteProcAsync<AbpUserRoles>("AbpUserRoles_GetAll", new { TenantId });
      
                return (result?? new List<AbpUserRoles>()).ToList();
        }

        public async Task<AbpUserRoles> GetByIdAsync(Int64 Id , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<AbpUserRoles>
                                      ("AbpUserRoles_GetById",
                        new 
                        {
                          Id = Id 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<AbpUserRoles>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(AbpUserRoles model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("Id", model.Id));
                    parameters.Add(new SqlParameter("UserId", model.UserId));
                    parameters.Add(new SqlParameter("RoleId", model.RoleId));
                    parameters.Add(new SqlParameter("CreationTime", model.CreationTime));
                    if(model.CreatorUserId.HasValue)
                        parameters.Add(new SqlParameter("CreatorUserId", model.CreatorUserId.Value));

                    if(model.TenantId.HasValue)
                        parameters.Add(new SqlParameter("TenantId", model.TenantId.Value));
      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("AbpUserRoles_Update", args);
        }


							public async Task<Int64> InsertAsync(AbpUserRoles model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("UserId", model.UserId));
                    parameters.Add(new SqlParameter("RoleId", model.RoleId));
                    parameters.Add(new SqlParameter("CreationTime", model.CreationTime));
                    if(model.CreatorUserId.HasValue)
                        parameters.Add(new SqlParameter("CreatorUserId", model.CreatorUserId.Value));

                    if(model.TenantId.HasValue)
                        parameters.Add(new SqlParameter("TenantId", model.TenantId.Value));

      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int64>("AbpUserRoles_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt64(result);            
        }



        public async Task<List<AbpUserRoles>> GetByUserIdAsync(Int64 UserId , int TenantId)
        {
        var result = await _procExecutor
                      .ExecuteProcAsync<AbpUserRoles>
                        ("AbpUserRoles_GetByUserId",
                        new 
                        {
                          UserId = UserId 
                          , TenantId 
                        }
                       );
      
                return (result?? new List<AbpUserRoles>()).ToList();
    
        }


        public async Task<List<AbpUserRoles>> GetByRoleIdAsync(Int32 RoleId , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<AbpUserRoles>
                                      ("AbpUserRoles_GetByRoleId",
                        new 
                        {
                          RoleId = RoleId 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<AbpUserRoles>()).ToList();
        }


    }

      public interface IAbpTenantsRepository: ISingletonDependency
      {
          Task<List<AbpTenants>> GetAllAsync();
          
        Task<AbpTenants> GetByIdAsync(Int32 Id );
        Task UpdateAsync(AbpTenants model);

             Task<Int32> InsertAsync(AbpTenants model);

		      
          
        Task<List<AbpTenants>> GetByDeleterUserIdAsync(Int64 DeleterUserId );
        
        Task<List<AbpTenants>> GetByLastModifierUserIdAsync(Int64 LastModifierUserId );
        
        Task<List<AbpTenants>> GetByCreatorUserIdAsync(Int64 CreatorUserId );
        
          

        Task<List<AbpTenants>> GetByIsDeletedAsync(Boolean IsDeleted );


        Task<List<AbpTenants>> GetByTenancyNameAsync(String TenancyName );

          
          
      }
    /// <summary>
    /// Data access layer for AbpTenants
    /// </summary>
    public partial class AbpTenantsRepository : RepositoryBase, IAbpTenantsRepository
    {

        public AbpTenantsRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<AbpTenants>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<AbpTenants>("AbpTenants_GetAll", null);
      
                return (result?? new List<AbpTenants>()).ToList();
        }

        public async Task<AbpTenants> GetByIdAsync(Int32 Id )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<AbpTenants>
                                      ("AbpTenants_GetById",
                        new 
                        {
                          Id = Id 
                          
                        }
                       );
            
          return (result?? new List<AbpTenants>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(AbpTenants model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("Id", model.Id));
                    parameters.Add(new SqlParameter("TenancyName", model.TenancyName));
                    parameters.Add(new SqlParameter("Name", model.Name));
                    parameters.Add(new SqlParameter("IsActive", model.IsActive));
                    parameters.Add(new SqlParameter("IsDeleted", model.IsDeleted));
                    if(model.DeleterUserId.HasValue)
                        parameters.Add(new SqlParameter("DeleterUserId", model.DeleterUserId.Value));

                    if(model.DeletionTime.HasValue)
                        parameters.Add(new SqlParameter("DeletionTime", model.DeletionTime.Value));

                    if(model.LastModificationTime.HasValue)
                        parameters.Add(new SqlParameter("LastModificationTime", model.LastModificationTime.Value));

                    if(model.LastModifierUserId.HasValue)
                        parameters.Add(new SqlParameter("LastModifierUserId", model.LastModifierUserId.Value));

                    parameters.Add(new SqlParameter("CreationTime", model.CreationTime));
                    if(model.CreatorUserId.HasValue)
                        parameters.Add(new SqlParameter("CreatorUserId", model.CreatorUserId.Value));

                    if(model.EditionId.HasValue)
                        parameters.Add(new SqlParameter("EditionId", model.EditionId.Value));

                    if(model.ConnectionString!=null)
                        parameters.Add(new SqlParameter("ConnectionString", model.ConnectionString));
      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("AbpTenants_Update", args);
        }


							public async Task<Int32> InsertAsync(AbpTenants model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("TenancyName", model.TenancyName));
                    parameters.Add(new SqlParameter("Name", model.Name));
                    parameters.Add(new SqlParameter("IsActive", model.IsActive));
                    parameters.Add(new SqlParameter("IsDeleted", model.IsDeleted));
                    if(model.DeleterUserId.HasValue)
                        parameters.Add(new SqlParameter("DeleterUserId", model.DeleterUserId.Value));

                    if(model.DeletionTime.HasValue)
                        parameters.Add(new SqlParameter("DeletionTime", model.DeletionTime.Value));

                    if(model.LastModificationTime.HasValue)
                        parameters.Add(new SqlParameter("LastModificationTime", model.LastModificationTime.Value));

                    if(model.LastModifierUserId.HasValue)
                        parameters.Add(new SqlParameter("LastModifierUserId", model.LastModifierUserId.Value));

                    parameters.Add(new SqlParameter("CreationTime", model.CreationTime));
                    if(model.CreatorUserId.HasValue)
                        parameters.Add(new SqlParameter("CreatorUserId", model.CreatorUserId.Value));

                    if(model.EditionId.HasValue)
                        parameters.Add(new SqlParameter("EditionId", model.EditionId.Value));

                    if(model.ConnectionString!=null)
                        parameters.Add(new SqlParameter("ConnectionString", model.ConnectionString));

      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int32>("AbpTenants_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt32(result);            
        }



        public async Task<List<AbpTenants>> GetByDeleterUserIdAsync(Int64 DeleterUserId )
        {
        var result = await _procExecutor
                      .ExecuteProcAsync<AbpTenants>
                        ("AbpTenants_GetByDeleterUserId",
                        new 
                        {
                          DeleterUserId = DeleterUserId 
                          
                        }
                       );
      
                return (result?? new List<AbpTenants>()).ToList();
    
        }
        public async Task<List<AbpTenants>> GetByLastModifierUserIdAsync(Int64 LastModifierUserId )
        {
        var result = await _procExecutor
                      .ExecuteProcAsync<AbpTenants>
                        ("AbpTenants_GetByLastModifierUserId",
                        new 
                        {
                          LastModifierUserId = LastModifierUserId 
                          
                        }
                       );
      
                return (result?? new List<AbpTenants>()).ToList();
    
        }
        public async Task<List<AbpTenants>> GetByCreatorUserIdAsync(Int64 CreatorUserId )
        {
        var result = await _procExecutor
                      .ExecuteProcAsync<AbpTenants>
                        ("AbpTenants_GetByCreatorUserId",
                        new 
                        {
                          CreatorUserId = CreatorUserId 
                          
                        }
                       );
      
                return (result?? new List<AbpTenants>()).ToList();
    
        }


        public async Task<List<AbpTenants>> GetByIsDeletedAsync(Boolean IsDeleted )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<AbpTenants>
                                      ("AbpTenants_GetByIsDeleted",
                        new 
                        {
                          IsDeleted = IsDeleted 
                          
                        }
                       );
            
          return (result?? new List<AbpTenants>()).ToList();
        }


        public async Task<List<AbpTenants>> GetByTenancyNameAsync(String TenancyName )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<AbpTenants>
                                      ("AbpTenants_GetByTenancyName",
                        new 
                        {
                          TenancyName = TenancyName 
                          
                        }
                       );
            
          return (result?? new List<AbpTenants>()).ToList();
        }


    }

      public interface IPatientReviewOfSystemRepository: ISingletonDependency
      {
          Task<List<PatientReviewOfSystem>> GetAllAsync(int TenantId);
          
        Task<PatientReviewOfSystem> GetByIdAsync(Int64 Id , int TenantId);
        Task UpdateAsync(PatientReviewOfSystem model);

             Task<Int64> InsertAsync(PatientReviewOfSystem model);

		      
          
          

        Task<List<PatientReviewOfSystem>> GetByVisitIdAsync(Int64 VisitId , int TenantId);


        Task<List<PatientReviewOfSystem>> GetByTenantIdAsync(Int32 TenantId );


        Task<List<PatientReviewOfSystem>> GetByPidAsync(Int64 Pid , int TenantId);

          
          
      }
    /// <summary>
    /// Data access layer for PatientReviewOfSystem
    /// </summary>
    public partial class PatientReviewOfSystemRepository : RepositoryBase, IPatientReviewOfSystemRepository
    {

        public PatientReviewOfSystemRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<PatientReviewOfSystem>> GetAllAsync(int TenantId)
        {
          var result = await _procExecutor.ExecuteProcAsync<PatientReviewOfSystem>("PatientReviewOfSystem_GetAll", new { TenantId });
      
                return (result?? new List<PatientReviewOfSystem>()).ToList();
        }

        public async Task<PatientReviewOfSystem> GetByIdAsync(Int64 Id , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<PatientReviewOfSystem>
                                      ("PatientReviewOfSystem_GetById",
                        new 
                        {
                          Id = Id 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<PatientReviewOfSystem>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(PatientReviewOfSystem model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("Id", model.Id));
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("VisitId", model.VisitId));
                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("ReviewOfSystemCodeId", model.ReviewOfSystemCodeId));
                    parameters.Add(new SqlParameter("NormalLimits", model.NormalLimits));
                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("PatientReviewOfSystem_Update", args);
        }


							public async Task<Int64> InsertAsync(PatientReviewOfSystem model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("VisitId", model.VisitId));
                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("ReviewOfSystemCodeId", model.ReviewOfSystemCodeId));
                    parameters.Add(new SqlParameter("NormalLimits", model.NormalLimits));
                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int64>("PatientReviewOfSystem_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt64(result);            
        }





        public async Task<List<PatientReviewOfSystem>> GetByVisitIdAsync(Int64 VisitId , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<PatientReviewOfSystem>
                                      ("PatientReviewOfSystem_GetByVisitId",
                        new 
                        {
                          VisitId = VisitId 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<PatientReviewOfSystem>()).ToList();
        }


        public async Task<List<PatientReviewOfSystem>> GetByTenantIdAsync(Int32 TenantId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<PatientReviewOfSystem>
                                      ("PatientReviewOfSystem_GetByTenantId",
                        new 
                        {
                          TenantId = TenantId 
                          
                        }
                       );
            
          return (result?? new List<PatientReviewOfSystem>()).ToList();
        }


        public async Task<List<PatientReviewOfSystem>> GetByPidAsync(Int64 Pid , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<PatientReviewOfSystem>
                                      ("PatientReviewOfSystem_GetByPid",
                        new 
                        {
                          Pid = Pid 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<PatientReviewOfSystem>()).ToList();
        }


    }

      public interface IPrescriptionRepository: ISingletonDependency
      {
          Task<List<Prescription>> GetAllAsync(int TenantId);
          
        Task<Prescription> GetByPrescriptionIdAsync(Int64 PrescriptionId , int TenantId);
        Task UpdateAsync(Prescription model);

             Task<Int64> InsertAsync(Prescription model);

		      
        Task ArchiveAndInsertAsync(Prescription model);

          
          

        Task<List<Prescription>> GetByVisitIdAsync(Int64 VisitId , int TenantId);


        Task<List<Prescription>> GetByTenantIdAsync(Int32 TenantId );


        Task<List<Prescription>> GetByPidAsync(Int64 Pid , int TenantId);

          
          
      }
    /// <summary>
    /// Data access layer for Prescription
    /// </summary>
    public partial class PrescriptionRepository : RepositoryBase, IPrescriptionRepository
    {

        public PrescriptionRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<Prescription>> GetAllAsync(int TenantId)
        {
          var result = await _procExecutor.ExecuteProcAsync<Prescription>("Prescription_GetAll", new { TenantId });
      
                return (result?? new List<Prescription>()).ToList();
        }

        public async Task<Prescription> GetByPrescriptionIdAsync(Int64 PrescriptionId , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<Prescription>
                                      ("Prescription_GetByPrescriptionId",
                        new 
                        {
                          PrescriptionId = PrescriptionId 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<Prescription>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(Prescription model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("PrescriptionId", model.PrescriptionId));
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("VisitId", model.VisitId));
                    parameters.Add(new SqlParameter("Archived", model.Archived));
                    if(model.ParentId.HasValue)
                        parameters.Add(new SqlParameter("ParentId", model.ParentId.Value));

                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("DrugId", model.DrugId));
                    if(model.RxNormName!=null)
                        parameters.Add(new SqlParameter("RxNormName", model.RxNormName));

                    parameters.Add(new SqlParameter("DoseUnitCodeId", model.DoseUnitCodeId));
                    parameters.Add(new SqlParameter("DoseSize", model.DoseSize));
                    parameters.Add(new SqlParameter("Dosage", model.Dosage));
                    parameters.Add(new SqlParameter("FrequencyCodeId", model.FrequencyCodeId));
                    parameters.Add(new SqlParameter("DrugRouteCodeId", model.DrugRouteCodeId));
                    parameters.Add(new SqlParameter("DrugFormCodeId", model.DrugFormCodeId));
                    parameters.Add(new SqlParameter("Quantity", model.Quantity));
                    if(model.Refills.HasValue)
                        parameters.Add(new SqlParameter("Refills", model.Refills.Value));

                    parameters.Add(new SqlParameter("ProviderId", model.ProviderId));
                    parameters.Add(new SqlParameter("StartDate", model.StartDate));
                    parameters.Add(new SqlParameter("Duration", model.Duration));
                    if(model.EndDate.HasValue)
                        parameters.Add(new SqlParameter("EndDate", model.EndDate.Value));

                    if(model.RefillDate.HasValue)
                        parameters.Add(new SqlParameter("RefillDate", model.RefillDate.Value));

                    parameters.Add(new SqlParameter("TherapyCodeId", model.TherapyCodeId));
                    parameters.Add(new SqlParameter("SubstitutionAllowed", model.SubstitutionAllowed));
                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    if(model.StatusCodeId.HasValue)
                        parameters.Add(new SqlParameter("StatusCodeId", model.StatusCodeId.Value));

                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    if(model.UpdateDate.HasValue)
                        parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate.Value));

                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    if(model.UpdatedBy.HasValue)
                        parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy.Value));
      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("Prescription_Update", args);
        }


							public async Task<Int64> InsertAsync(Prescription model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("VisitId", model.VisitId));
                    parameters.Add(new SqlParameter("Archived", model.Archived));
                    if(model.ParentId.HasValue)
                        parameters.Add(new SqlParameter("ParentId", model.ParentId.Value));

                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("DrugId", model.DrugId));
                    if(model.RxNormName!=null)
                        parameters.Add(new SqlParameter("RxNormName", model.RxNormName));

                    parameters.Add(new SqlParameter("DoseUnitCodeId", model.DoseUnitCodeId));
                    parameters.Add(new SqlParameter("DoseSize", model.DoseSize));
                    parameters.Add(new SqlParameter("Dosage", model.Dosage));
                    parameters.Add(new SqlParameter("FrequencyCodeId", model.FrequencyCodeId));
                    parameters.Add(new SqlParameter("DrugRouteCodeId", model.DrugRouteCodeId));
                    parameters.Add(new SqlParameter("DrugFormCodeId", model.DrugFormCodeId));
                    parameters.Add(new SqlParameter("Quantity", model.Quantity));
                    if(model.Refills.HasValue)
                        parameters.Add(new SqlParameter("Refills", model.Refills.Value));

                    parameters.Add(new SqlParameter("ProviderId", model.ProviderId));
                    parameters.Add(new SqlParameter("StartDate", model.StartDate));
                    parameters.Add(new SqlParameter("Duration", model.Duration));
                    if(model.EndDate.HasValue)
                        parameters.Add(new SqlParameter("EndDate", model.EndDate.Value));

                    if(model.RefillDate.HasValue)
                        parameters.Add(new SqlParameter("RefillDate", model.RefillDate.Value));

                    parameters.Add(new SqlParameter("TherapyCodeId", model.TherapyCodeId));
                    parameters.Add(new SqlParameter("SubstitutionAllowed", model.SubstitutionAllowed));
                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    if(model.StatusCodeId.HasValue)
                        parameters.Add(new SqlParameter("StatusCodeId", model.StatusCodeId.Value));

                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    if(model.UpdateDate.HasValue)
                        parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate.Value));

                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    if(model.UpdatedBy.HasValue)
                        parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy.Value));

      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int64>("Prescription_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt64(result);            
        }


        public async Task ArchiveAndInsertAsync(Prescription model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("PrescriptionId", model.PrescriptionId));
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("VisitId", model.VisitId));
                    parameters.Add(new SqlParameter("Archived", model.Archived));
                    if(model.ParentId.HasValue)
                        parameters.Add(new SqlParameter("ParentId", model.ParentId.Value));

                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("DrugId", model.DrugId));
                    if(model.RxNormName!=null)
                        parameters.Add(new SqlParameter("RxNormName", model.RxNormName));

                    parameters.Add(new SqlParameter("DoseUnitCodeId", model.DoseUnitCodeId));
                    parameters.Add(new SqlParameter("DoseSize", model.DoseSize));
                    parameters.Add(new SqlParameter("Dosage", model.Dosage));
                    parameters.Add(new SqlParameter("FrequencyCodeId", model.FrequencyCodeId));
                    parameters.Add(new SqlParameter("DrugRouteCodeId", model.DrugRouteCodeId));
                    parameters.Add(new SqlParameter("DrugFormCodeId", model.DrugFormCodeId));
                    parameters.Add(new SqlParameter("Quantity", model.Quantity));
                    if(model.Refills.HasValue)
                        parameters.Add(new SqlParameter("Refills", model.Refills.Value));

                    parameters.Add(new SqlParameter("ProviderId", model.ProviderId));
                    parameters.Add(new SqlParameter("StartDate", model.StartDate));
                    parameters.Add(new SqlParameter("Duration", model.Duration));
                    if(model.EndDate.HasValue)
                        parameters.Add(new SqlParameter("EndDate", model.EndDate.Value));

                    if(model.RefillDate.HasValue)
                        parameters.Add(new SqlParameter("RefillDate", model.RefillDate.Value));

                    parameters.Add(new SqlParameter("TherapyCodeId", model.TherapyCodeId));
                    parameters.Add(new SqlParameter("SubstitutionAllowed", model.SubstitutionAllowed));
                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    if(model.StatusCodeId.HasValue)
                        parameters.Add(new SqlParameter("StatusCodeId", model.StatusCodeId.Value));

                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    if(model.UpdateDate.HasValue)
                        parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate.Value));

                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    if(model.UpdatedBy.HasValue)
                        parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy.Value));
      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("Prescription_ArchiveAndInsert", args);
        }





        public async Task<List<Prescription>> GetByVisitIdAsync(Int64 VisitId , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<Prescription>
                                      ("Prescription_GetByVisitId",
                        new 
                        {
                          VisitId = VisitId 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<Prescription>()).ToList();
        }


        public async Task<List<Prescription>> GetByTenantIdAsync(Int32 TenantId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<Prescription>
                                      ("Prescription_GetByTenantId",
                        new 
                        {
                          TenantId = TenantId 
                          
                        }
                       );
            
          return (result?? new List<Prescription>()).ToList();
        }


        public async Task<List<Prescription>> GetByPidAsync(Int64 Pid , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<Prescription>
                                      ("Prescription_GetByPid",
                        new 
                        {
                          Pid = Pid 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<Prescription>()).ToList();
        }


    }

      public interface IAbnormalCodeRepository: ISingletonDependency
      {
          Task<List<AbnormalCode>> GetAllAsync();
          
        Task<AbnormalCode> GetByAbnormalCodeIdAsync(Int32 AbnormalCodeId );
        Task UpdateAsync(AbnormalCode model);

             Task<Int32> InsertAsync(AbnormalCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for AbnormalCode
    /// </summary>
    public partial class AbnormalCodeRepository : RepositoryBase, IAbnormalCodeRepository
    {

        public AbnormalCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<AbnormalCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<AbnormalCode>("AbnormalCode_GetAll", null);
      
                return (result?? new List<AbnormalCode>()).ToList();
        }

        public async Task<AbnormalCode> GetByAbnormalCodeIdAsync(Int32 AbnormalCodeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<AbnormalCode>
                                      ("AbnormalCode_GetByAbnormalCodeId",
                        new 
                        {
                          AbnormalCodeId = AbnormalCodeId 
                          
                        }
                       );
            
          return (result?? new List<AbnormalCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(AbnormalCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("AbnormalCodeId", model.AbnormalCodeId));
                    parameters.Add(new SqlParameter("AbnormalCodeName", model.AbnormalCodeName));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("AbnormalCode_Update", args);
        }


							public async Task<Int32> InsertAsync(AbnormalCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("AbnormalCodeName", model.AbnormalCodeName));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int32>("AbnormalCode_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt32(result);            
        }





    }

      public interface IAdministrationSiteRepository: ISingletonDependency
      {
          Task<List<AdministrationSite>> GetAllAsync(int TenantId);
          
        Task<AdministrationSite> GetByAdministrationSiteIdAsync(Int32 AdministrationSiteId , int TenantId);
        Task UpdateAsync(AdministrationSite model);

             Task<Int32> InsertAsync(AdministrationSite model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for AdministrationSite
    /// </summary>
    public partial class AdministrationSiteRepository : RepositoryBase, IAdministrationSiteRepository
    {

        public AdministrationSiteRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<AdministrationSite>> GetAllAsync(int TenantId)
        {
          var result = await _procExecutor.ExecuteProcAsync<AdministrationSite>("AdministrationSite_GetAll", new { TenantId });
      
                return (result?? new List<AdministrationSite>()).ToList();
        }

        public async Task<AdministrationSite> GetByAdministrationSiteIdAsync(Int32 AdministrationSiteId , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<AdministrationSite>
                                      ("AdministrationSite_GetByAdministrationSiteId",
                        new 
                        {
                          AdministrationSiteId = AdministrationSiteId 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<AdministrationSite>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(AdministrationSite model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("AdministrationSiteId", model.AdministrationSiteId));
                    parameters.Add(new SqlParameter("AdministrationSiteName", model.AdministrationSiteName));
                    parameters.Add(new SqlParameter("TenantId", model.TenantId));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("AdministrationSite_Update", args);
        }


							public async Task<Int32> InsertAsync(AdministrationSite model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("AdministrationSiteName", model.AdministrationSiteName));
                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int32>("AdministrationSite_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt32(result);            
        }





    }

      public interface IPrescriptionConditionRepository: ISingletonDependency
      {
          Task<List<PrescriptionCondition>> GetAllAsync();
          
        Task<PrescriptionCondition> GetByPrescriptionIdAsync(Int64 PrescriptionId );
        Task UpdateAsync(PrescriptionCondition model);

             Task InsertAsync(PrescriptionCondition model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for PrescriptionCondition
    /// </summary>
    public partial class PrescriptionConditionRepository : RepositoryBase, IPrescriptionConditionRepository
    {

        public PrescriptionConditionRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<PrescriptionCondition>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<PrescriptionCondition>("PrescriptionCondition_GetAll", null);
      
                return (result?? new List<PrescriptionCondition>()).ToList();
        }

        public async Task<PrescriptionCondition> GetByPrescriptionIdAsync(Int64 PrescriptionId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<PrescriptionCondition>
                                      ("PrescriptionCondition_GetByPrescriptionId",
                        new 
                        {
                          PrescriptionId = PrescriptionId 
                          
                        }
                       );
            
          return (result?? new List<PrescriptionCondition>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(PrescriptionCondition model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("PrescriptionId", model.PrescriptionId));
                    parameters.Add(new SqlParameter("ICDCodeCNId", model.ICDCodeCNId));
                    parameters.Add(new SqlParameter("PrimaryCondition", model.PrimaryCondition));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("PrescriptionCondition_Update", args);
        }


							public async Task InsertAsync(PrescriptionCondition model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("PrescriptionId", model.PrescriptionId));
                    parameters.Add(new SqlParameter("ICDCodeCNId", model.ICDCodeCNId));
                    parameters.Add(new SqlParameter("PrimaryCondition", model.PrimaryCondition));
      
          
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    await _procExecutor.ExecuteAsync("PrescriptionCondition_Insert", args);            
        }





    }

      public interface IAllergyCategoryCodeRepository: ISingletonDependency
      {
          Task<List<AllergyCategoryCode>> GetAllAsync();
          
        Task<AllergyCategoryCode> GetByAllergyCategoryCodeIdAsync(Int32 AllergyCategoryCodeId );
        Task UpdateAsync(AllergyCategoryCode model);

             Task InsertAsync(AllergyCategoryCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for AllergyCategoryCode
    /// </summary>
    public partial class AllergyCategoryCodeRepository : RepositoryBase, IAllergyCategoryCodeRepository
    {

        public AllergyCategoryCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<AllergyCategoryCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<AllergyCategoryCode>("AllergyCategoryCode_GetAll", null);
      
                return (result?? new List<AllergyCategoryCode>()).ToList();
        }

        public async Task<AllergyCategoryCode> GetByAllergyCategoryCodeIdAsync(Int32 AllergyCategoryCodeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<AllergyCategoryCode>
                                      ("AllergyCategoryCode_GetByAllergyCategoryCodeId",
                        new 
                        {
                          AllergyCategoryCodeId = AllergyCategoryCodeId 
                          
                        }
                       );
            
          return (result?? new List<AllergyCategoryCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(AllergyCategoryCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("AllergyCategoryCodeId", model.AllergyCategoryCodeId));
                    parameters.Add(new SqlParameter("CategoryName", model.CategoryName));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("AllergyCategoryCode_Update", args);
        }


							public async Task InsertAsync(AllergyCategoryCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("AllergyCategoryCodeId", model.AllergyCategoryCodeId));
                    parameters.Add(new SqlParameter("CategoryName", model.CategoryName));
      
          
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    await _procExecutor.ExecuteAsync("AllergyCategoryCode_Insert", args);            
        }





    }

      public interface IPriorityCodeRepository: ISingletonDependency
      {
          Task<List<PriorityCode>> GetAllAsync();
          
        Task<PriorityCode> GetByPriorityCodeIdAsync(Int32 PriorityCodeId );
        Task UpdateAsync(PriorityCode model);

             Task<Int32> InsertAsync(PriorityCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for PriorityCode
    /// </summary>
    public partial class PriorityCodeRepository : RepositoryBase, IPriorityCodeRepository
    {

        public PriorityCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<PriorityCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<PriorityCode>("PriorityCode_GetAll", null);
      
                return (result?? new List<PriorityCode>()).ToList();
        }

        public async Task<PriorityCode> GetByPriorityCodeIdAsync(Int32 PriorityCodeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<PriorityCode>
                                      ("PriorityCode_GetByPriorityCodeId",
                        new 
                        {
                          PriorityCodeId = PriorityCodeId 
                          
                        }
                       );
            
          return (result?? new List<PriorityCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(PriorityCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("PriorityCodeId", model.PriorityCodeId));
                    parameters.Add(new SqlParameter("PriorityCodeName", model.PriorityCodeName));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("PriorityCode_Update", args);
        }


							public async Task<Int32> InsertAsync(PriorityCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("PriorityCodeName", model.PriorityCodeName));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int32>("PriorityCode_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt32(result);            
        }





    }

      public interface IAllergyCodeRepository: ISingletonDependency
      {
          Task<List<AllergyCode>> GetAllAsync();
          
        Task<AllergyCode> GetByAllergyCodeIdAsync(Int32 AllergyCodeId );
        Task UpdateAsync(AllergyCode model);

             Task InsertAsync(AllergyCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for AllergyCode
    /// </summary>
    public partial class AllergyCodeRepository : RepositoryBase, IAllergyCodeRepository
    {

        public AllergyCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<AllergyCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<AllergyCode>("AllergyCode_GetAll", null);
      
                return (result?? new List<AllergyCode>()).ToList();
        }

        public async Task<AllergyCode> GetByAllergyCodeIdAsync(Int32 AllergyCodeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<AllergyCode>
                                      ("AllergyCode_GetByAllergyCodeId",
                        new 
                        {
                          AllergyCodeId = AllergyCodeId 
                          
                        }
                       );
            
          return (result?? new List<AllergyCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(AllergyCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("AllergyCodeId", model.AllergyCodeId));
                    parameters.Add(new SqlParameter("AllergyName", model.AllergyName));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("AllergyCode_Update", args);
        }


							public async Task InsertAsync(AllergyCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("AllergyCodeId", model.AllergyCodeId));
                    parameters.Add(new SqlParameter("AllergyName", model.AllergyName));
      
          
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    await _procExecutor.ExecuteAsync("AllergyCode_Insert", args);            
        }





    }

      public interface IProcedureOrderRepository: ISingletonDependency
      {
          Task<List<ProcedureOrder>> GetAllAsync(int TenantId);
          
        Task<ProcedureOrder> GetByIdAsync(Int64 Id , int TenantId);
        Task UpdateAsync(ProcedureOrder model);

             Task<Int64> InsertAsync(ProcedureOrder model);

		      
          
          

        Task<List<ProcedureOrder>> GetByVisitIdAsync(Int64 VisitId , int TenantId);


        Task<List<ProcedureOrder>> GetByTenantIdAsync(Int32 TenantId );


        Task<List<ProcedureOrder>> GetByPidAsync(Int64 Pid , int TenantId);

          
          
      }
    /// <summary>
    /// Data access layer for ProcedureOrder
    /// </summary>
    public partial class ProcedureOrderRepository : RepositoryBase, IProcedureOrderRepository
    {

        public ProcedureOrderRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<ProcedureOrder>> GetAllAsync(int TenantId)
        {
          var result = await _procExecutor.ExecuteProcAsync<ProcedureOrder>("ProcedureOrder_GetAll", new { TenantId });
      
                return (result?? new List<ProcedureOrder>()).ToList();
        }

        public async Task<ProcedureOrder> GetByIdAsync(Int64 Id , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<ProcedureOrder>
                                      ("ProcedureOrder_GetById",
                        new 
                        {
                          Id = Id 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<ProcedureOrder>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(ProcedureOrder model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("Id", model.Id));
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("VisitId", model.VisitId));
                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("PriorityCodeId", model.PriorityCodeId));
                    parameters.Add(new SqlParameter("OrderDate", model.OrderDate));
                    parameters.Add(new SqlParameter("OrderdById", model.OrderdById));
                    parameters.Add(new SqlParameter("LoincCodeId", model.LoincCodeId));
                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    parameters.Add(new SqlParameter("StatusCodeId", model.StatusCodeId));
                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate));
                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("ProcedureOrder_Update", args);
        }


							public async Task<Int64> InsertAsync(ProcedureOrder model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("VisitId", model.VisitId));
                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("PriorityCodeId", model.PriorityCodeId));
                    parameters.Add(new SqlParameter("OrderDate", model.OrderDate));
                    parameters.Add(new SqlParameter("OrderdById", model.OrderdById));
                    parameters.Add(new SqlParameter("LoincCodeId", model.LoincCodeId));
                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    parameters.Add(new SqlParameter("StatusCodeId", model.StatusCodeId));
                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate));
                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int64>("ProcedureOrder_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt64(result);            
        }





        public async Task<List<ProcedureOrder>> GetByVisitIdAsync(Int64 VisitId , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<ProcedureOrder>
                                      ("ProcedureOrder_GetByVisitId",
                        new 
                        {
                          VisitId = VisitId 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<ProcedureOrder>()).ToList();
        }


        public async Task<List<ProcedureOrder>> GetByTenantIdAsync(Int32 TenantId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<ProcedureOrder>
                                      ("ProcedureOrder_GetByTenantId",
                        new 
                        {
                          TenantId = TenantId 
                          
                        }
                       );
            
          return (result?? new List<ProcedureOrder>()).ToList();
        }


        public async Task<List<ProcedureOrder>> GetByPidAsync(Int64 Pid , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<ProcedureOrder>
                                      ("ProcedureOrder_GetByPid",
                        new 
                        {
                          Pid = Pid 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<ProcedureOrder>()).ToList();
        }


    }

      public interface IAllergyReactionCodeRepository: ISingletonDependency
      {
          Task<List<AllergyReactionCode>> GetAllAsync();
          
        Task<AllergyReactionCode> GetByReactionTypeIdAsync(Int32 ReactionTypeId );
        Task UpdateAsync(AllergyReactionCode model);

             Task InsertAsync(AllergyReactionCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for AllergyReactionCode
    /// </summary>
    public partial class AllergyReactionCodeRepository : RepositoryBase, IAllergyReactionCodeRepository
    {

        public AllergyReactionCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<AllergyReactionCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<AllergyReactionCode>("AllergyReactionCode_GetAll", null);
      
                return (result?? new List<AllergyReactionCode>()).ToList();
        }

        public async Task<AllergyReactionCode> GetByReactionTypeIdAsync(Int32 ReactionTypeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<AllergyReactionCode>
                                      ("AllergyReactionCode_GetByReactionTypeId",
                        new 
                        {
                          ReactionTypeId = ReactionTypeId 
                          
                        }
                       );
            
          return (result?? new List<AllergyReactionCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(AllergyReactionCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("ReactionTypeId", model.ReactionTypeId));
                    parameters.Add(new SqlParameter("ReactionName", model.ReactionName));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("AllergyReactionCode_Update", args);
        }


							public async Task InsertAsync(AllergyReactionCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("ReactionTypeId", model.ReactionTypeId));
                    parameters.Add(new SqlParameter("ReactionName", model.ReactionName));
      
          
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    await _procExecutor.ExecuteAsync("AllergyReactionCode_Insert", args);            
        }





    }

      public interface IRelationshipCodeRepository: ISingletonDependency
      {
          Task<List<RelationshipCode>> GetAllAsync();
          
        Task<RelationshipCode> GetByRelationshipCodeIdAsync(Int32 RelationshipCodeId );
        Task UpdateAsync(RelationshipCode model);

             Task<Int32> InsertAsync(RelationshipCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for RelationshipCode
    /// </summary>
    public partial class RelationshipCodeRepository : RepositoryBase, IRelationshipCodeRepository
    {

        public RelationshipCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<RelationshipCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<RelationshipCode>("RelationshipCode_GetAll", null);
      
                return (result?? new List<RelationshipCode>()).ToList();
        }

        public async Task<RelationshipCode> GetByRelationshipCodeIdAsync(Int32 RelationshipCodeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<RelationshipCode>
                                      ("RelationshipCode_GetByRelationshipCodeId",
                        new 
                        {
                          RelationshipCodeId = RelationshipCodeId 
                          
                        }
                       );
            
          return (result?? new List<RelationshipCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(RelationshipCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("RelationshipCodeId", model.RelationshipCodeId));
                    parameters.Add(new SqlParameter("RelationshipCodeName", model.RelationshipCodeName));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("RelationshipCode_Update", args);
        }


							public async Task<Int32> InsertAsync(RelationshipCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("RelationshipCodeName", model.RelationshipCodeName));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int32>("RelationshipCode_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt32(result);            
        }





    }

      public interface IAllergySeverityCodeRepository: ISingletonDependency
      {
          Task<List<AllergySeverityCode>> GetAllAsync();
          
        Task<AllergySeverityCode> GetByAllergySeverityCodeIdAsync(Int32 AllergySeverityCodeId );
        Task UpdateAsync(AllergySeverityCode model);

             Task InsertAsync(AllergySeverityCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for AllergySeverityCode
    /// </summary>
    public partial class AllergySeverityCodeRepository : RepositoryBase, IAllergySeverityCodeRepository
    {

        public AllergySeverityCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<AllergySeverityCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<AllergySeverityCode>("AllergySeverityCode_GetAll", null);
      
                return (result?? new List<AllergySeverityCode>()).ToList();
        }

        public async Task<AllergySeverityCode> GetByAllergySeverityCodeIdAsync(Int32 AllergySeverityCodeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<AllergySeverityCode>
                                      ("AllergySeverityCode_GetByAllergySeverityCodeId",
                        new 
                        {
                          AllergySeverityCodeId = AllergySeverityCodeId 
                          
                        }
                       );
            
          return (result?? new List<AllergySeverityCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(AllergySeverityCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("AllergySeverityCodeId", model.AllergySeverityCodeId));
                    parameters.Add(new SqlParameter("AllergySeverityCodeName", model.AllergySeverityCodeName));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("AllergySeverityCode_Update", args);
        }


							public async Task InsertAsync(AllergySeverityCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("AllergySeverityCodeId", model.AllergySeverityCodeId));
                    parameters.Add(new SqlParameter("AllergySeverityCodeName", model.AllergySeverityCodeName));
      
          
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    await _procExecutor.ExecuteAsync("AllergySeverityCode_Insert", args);            
        }





    }

      public interface IResultDataCodeRepository: ISingletonDependency
      {
          Task<List<ResultDataCode>> GetAllAsync();
          
        Task<ResultDataCode> GetByResultDataCodeIdAsync(Int32 ResultDataCodeId );
        Task UpdateAsync(ResultDataCode model);

             Task<Int32> InsertAsync(ResultDataCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for ResultDataCode
    /// </summary>
    public partial class ResultDataCodeRepository : RepositoryBase, IResultDataCodeRepository
    {

        public ResultDataCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<ResultDataCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<ResultDataCode>("ResultDataCode_GetAll", null);
      
                return (result?? new List<ResultDataCode>()).ToList();
        }

        public async Task<ResultDataCode> GetByResultDataCodeIdAsync(Int32 ResultDataCodeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<ResultDataCode>
                                      ("ResultDataCode_GetByResultDataCodeId",
                        new 
                        {
                          ResultDataCodeId = ResultDataCodeId 
                          
                        }
                       );
            
          return (result?? new List<ResultDataCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(ResultDataCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("ResultDataCodeId", model.ResultDataCodeId));
                    parameters.Add(new SqlParameter("ResultDataCodeName", model.ResultDataCodeName));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("ResultDataCode_Update", args);
        }


							public async Task<Int32> InsertAsync(ResultDataCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("ResultDataCodeName", model.ResultDataCodeName));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int32>("ResultDataCode_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt32(result);            
        }





    }

      public interface IAllergyTypeCodeRepository: ISingletonDependency
      {
          Task<List<AllergyTypeCode>> GetAllAsync();
          
        Task<AllergyTypeCode> GetByAllergyTypeIdAsync(Int32 AllergyTypeId );
        Task UpdateAsync(AllergyTypeCode model);

             Task InsertAsync(AllergyTypeCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for AllergyTypeCode
    /// </summary>
    public partial class AllergyTypeCodeRepository : RepositoryBase, IAllergyTypeCodeRepository
    {

        public AllergyTypeCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<AllergyTypeCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<AllergyTypeCode>("AllergyTypeCode_GetAll", null);
      
                return (result?? new List<AllergyTypeCode>()).ToList();
        }

        public async Task<AllergyTypeCode> GetByAllergyTypeIdAsync(Int32 AllergyTypeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<AllergyTypeCode>
                                      ("AllergyTypeCode_GetByAllergyTypeId",
                        new 
                        {
                          AllergyTypeId = AllergyTypeId 
                          
                        }
                       );
            
          return (result?? new List<AllergyTypeCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(AllergyTypeCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("AllergyTypeId", model.AllergyTypeId));
                    parameters.Add(new SqlParameter("AllergyTypeName", model.AllergyTypeName));
                    parameters.Add(new SqlParameter("Priority", model.Priority));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("AllergyTypeCode_Update", args);
        }


							public async Task InsertAsync(AllergyTypeCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("AllergyTypeId", model.AllergyTypeId));
                    parameters.Add(new SqlParameter("AllergyTypeName", model.AllergyTypeName));
                    parameters.Add(new SqlParameter("Priority", model.Priority));
      
          
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    await _procExecutor.ExecuteAsync("AllergyTypeCode_Insert", args);            
        }





    }

      public interface IResultStatusCodeRepository: ISingletonDependency
      {
          Task<List<ResultStatusCode>> GetAllAsync();
          
        Task<ResultStatusCode> GetByResultStatusCodeIdAsync(Int32 ResultStatusCodeId );
        Task UpdateAsync(ResultStatusCode model);

             Task<Int32> InsertAsync(ResultStatusCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for ResultStatusCode
    /// </summary>
    public partial class ResultStatusCodeRepository : RepositoryBase, IResultStatusCodeRepository
    {

        public ResultStatusCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<ResultStatusCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<ResultStatusCode>("ResultStatusCode_GetAll", null);
      
                return (result?? new List<ResultStatusCode>()).ToList();
        }

        public async Task<ResultStatusCode> GetByResultStatusCodeIdAsync(Int32 ResultStatusCodeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<ResultStatusCode>
                                      ("ResultStatusCode_GetByResultStatusCodeId",
                        new 
                        {
                          ResultStatusCodeId = ResultStatusCodeId 
                          
                        }
                       );
            
          return (result?? new List<ResultStatusCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(ResultStatusCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("ResultStatusCodeId", model.ResultStatusCodeId));
                    parameters.Add(new SqlParameter("ResultStatusCodeName", model.ResultStatusCodeName));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("ResultStatusCode_Update", args);
        }


							public async Task<Int32> InsertAsync(ResultStatusCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("ResultStatusCodeName", model.ResultStatusCodeName));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int32>("ResultStatusCode_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt32(result);            
        }





    }

      public interface IReviewOfSystemCodeRepository: ISingletonDependency
      {
          Task<List<ReviewOfSystemCode>> GetAllAsync();
          
        Task<ReviewOfSystemCode> GetByReviewOfSystemCodeIdAsync(Int32 ReviewOfSystemCodeId );
        Task UpdateAsync(ReviewOfSystemCode model);

             Task InsertAsync(ReviewOfSystemCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for ReviewOfSystemCode
    /// </summary>
    public partial class ReviewOfSystemCodeRepository : RepositoryBase, IReviewOfSystemCodeRepository
    {

        public ReviewOfSystemCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<ReviewOfSystemCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<ReviewOfSystemCode>("ReviewOfSystemCode_GetAll", null);
      
                return (result?? new List<ReviewOfSystemCode>()).ToList();
        }

        public async Task<ReviewOfSystemCode> GetByReviewOfSystemCodeIdAsync(Int32 ReviewOfSystemCodeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<ReviewOfSystemCode>
                                      ("ReviewOfSystemCode_GetByReviewOfSystemCodeId",
                        new 
                        {
                          ReviewOfSystemCodeId = ReviewOfSystemCodeId 
                          
                        }
                       );
            
          return (result?? new List<ReviewOfSystemCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(ReviewOfSystemCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("ReviewOfSystemCodeId", model.ReviewOfSystemCodeId));
                    parameters.Add(new SqlParameter("ReviewOfSystemGroupCodeId", model.ReviewOfSystemGroupCodeId));
                    parameters.Add(new SqlParameter("ReviewOfSystemCodeName", model.ReviewOfSystemCodeName));
                    parameters.Add(new SqlParameter("IsShortCode", model.IsShortCode));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("ReviewOfSystemCode_Update", args);
        }


							public async Task InsertAsync(ReviewOfSystemCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("ReviewOfSystemCodeId", model.ReviewOfSystemCodeId));
                    parameters.Add(new SqlParameter("ReviewOfSystemGroupCodeId", model.ReviewOfSystemGroupCodeId));
                    parameters.Add(new SqlParameter("ReviewOfSystemCodeName", model.ReviewOfSystemCodeName));
                    parameters.Add(new SqlParameter("IsShortCode", model.IsShortCode));
      
          
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    await _procExecutor.ExecuteAsync("ReviewOfSystemCode_Insert", args);            
        }





    }

      public interface IReviewOfSystemGroupCodeRepository: ISingletonDependency
      {
          Task<List<ReviewOfSystemGroupCode>> GetAllAsync();
          
        Task<ReviewOfSystemGroupCode> GetByReviewOfSystemGroupCodeIdAsync(Int32 ReviewOfSystemGroupCodeId );
        Task UpdateAsync(ReviewOfSystemGroupCode model);

             Task InsertAsync(ReviewOfSystemGroupCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for ReviewOfSystemGroupCode
    /// </summary>
    public partial class ReviewOfSystemGroupCodeRepository : RepositoryBase, IReviewOfSystemGroupCodeRepository
    {

        public ReviewOfSystemGroupCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<ReviewOfSystemGroupCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<ReviewOfSystemGroupCode>("ReviewOfSystemGroupCode_GetAll", null);
      
                return (result?? new List<ReviewOfSystemGroupCode>()).ToList();
        }

        public async Task<ReviewOfSystemGroupCode> GetByReviewOfSystemGroupCodeIdAsync(Int32 ReviewOfSystemGroupCodeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<ReviewOfSystemGroupCode>
                                      ("ReviewOfSystemGroupCode_GetByReviewOfSystemGroupCodeId",
                        new 
                        {
                          ReviewOfSystemGroupCodeId = ReviewOfSystemGroupCodeId 
                          
                        }
                       );
            
          return (result?? new List<ReviewOfSystemGroupCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(ReviewOfSystemGroupCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("ReviewOfSystemGroupCodeId", model.ReviewOfSystemGroupCodeId));
                    parameters.Add(new SqlParameter("ReviewOfSystemGroupCodeName", model.ReviewOfSystemGroupCodeName));
                    parameters.Add(new SqlParameter("SortOrder", model.SortOrder));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("ReviewOfSystemGroupCode_Update", args);
        }


							public async Task InsertAsync(ReviewOfSystemGroupCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("ReviewOfSystemGroupCodeId", model.ReviewOfSystemGroupCodeId));
                    parameters.Add(new SqlParameter("ReviewOfSystemGroupCodeName", model.ReviewOfSystemGroupCodeName));
                    parameters.Add(new SqlParameter("SortOrder", model.SortOrder));
      
          
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    await _procExecutor.ExecuteAsync("ReviewOfSystemGroupCode_Insert", args);            
        }





    }

      public interface ISpecimenCodeRepository: ISingletonDependency
      {
          Task<List<SpecimenCode>> GetAllAsync();
          
        Task<SpecimenCode> GetBySpecimenCodeIdAsync(Int32 SpecimenCodeId );
        Task UpdateAsync(SpecimenCode model);

             Task<Int32> InsertAsync(SpecimenCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for SpecimenCode
    /// </summary>
    public partial class SpecimenCodeRepository : RepositoryBase, ISpecimenCodeRepository
    {

        public SpecimenCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<SpecimenCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<SpecimenCode>("SpecimenCode_GetAll", null);
      
                return (result?? new List<SpecimenCode>()).ToList();
        }

        public async Task<SpecimenCode> GetBySpecimenCodeIdAsync(Int32 SpecimenCodeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<SpecimenCode>
                                      ("SpecimenCode_GetBySpecimenCodeId",
                        new 
                        {
                          SpecimenCodeId = SpecimenCodeId 
                          
                        }
                       );
            
          return (result?? new List<SpecimenCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(SpecimenCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("SpecimenCodeId", model.SpecimenCodeId));
                    parameters.Add(new SqlParameter("SpecimenCodeName", model.SpecimenCodeName));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("SpecimenCode_Update", args);
        }


							public async Task<Int32> InsertAsync(SpecimenCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("SpecimenCodeName", model.SpecimenCodeName));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int32>("SpecimenCode_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt32(result);            
        }





    }

      public interface ICompletionStatusCodeRepository: ISingletonDependency
      {
          Task<List<CompletionStatusCode>> GetAllAsync();
          
        Task<CompletionStatusCode> GetByCompletionStatusCodeIdAsync(Int32 CompletionStatusCodeId );
        Task UpdateAsync(CompletionStatusCode model);

             Task<Int32> InsertAsync(CompletionStatusCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for CompletionStatusCode
    /// </summary>
    public partial class CompletionStatusCodeRepository : RepositoryBase, ICompletionStatusCodeRepository
    {

        public CompletionStatusCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<CompletionStatusCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<CompletionStatusCode>("CompletionStatusCode_GetAll", null);
      
                return (result?? new List<CompletionStatusCode>()).ToList();
        }

        public async Task<CompletionStatusCode> GetByCompletionStatusCodeIdAsync(Int32 CompletionStatusCodeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<CompletionStatusCode>
                                      ("CompletionStatusCode_GetByCompletionStatusCodeId",
                        new 
                        {
                          CompletionStatusCodeId = CompletionStatusCodeId 
                          
                        }
                       );
            
          return (result?? new List<CompletionStatusCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(CompletionStatusCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("CompletionStatusCodeId", model.CompletionStatusCodeId));
                    parameters.Add(new SqlParameter("CompletionStatusName", model.CompletionStatusName));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("CompletionStatusCode_Update", args);
        }


							public async Task<Int32> InsertAsync(CompletionStatusCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("CompletionStatusName", model.CompletionStatusName));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int32>("CompletionStatusCode_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt32(result);            
        }





    }

      public interface IStatusCodeRepository: ISingletonDependency
      {
          Task<List<StatusCode>> GetAllAsync();
          
        Task<StatusCode> GetByStatusCodeIdAsync(Int32 StatusCodeId );
        Task UpdateAsync(StatusCode model);

             Task<Int32> InsertAsync(StatusCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for StatusCode
    /// </summary>
    public partial class StatusCodeRepository : RepositoryBase, IStatusCodeRepository
    {

        public StatusCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<StatusCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<StatusCode>("StatusCode_GetAll", null);
      
                return (result?? new List<StatusCode>()).ToList();
        }

        public async Task<StatusCode> GetByStatusCodeIdAsync(Int32 StatusCodeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<StatusCode>
                                      ("StatusCode_GetByStatusCodeId",
                        new 
                        {
                          StatusCodeId = StatusCodeId 
                          
                        }
                       );
            
          return (result?? new List<StatusCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(StatusCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("StatusCodeId", model.StatusCodeId));
                    parameters.Add(new SqlParameter("StatusCodeName", model.StatusCodeName));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("StatusCode_Update", args);
        }


							public async Task<Int32> InsertAsync(StatusCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("StatusCodeName", model.StatusCodeName));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int32>("StatusCode_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt32(result);            
        }





    }

      public interface IDiagnosisRepository: ISingletonDependency
      {
          Task<List<Diagnosis>> GetAllAsync(int TenantId);
          
        Task<Diagnosis> GetByIdAsync(Int64 Id , int TenantId);
        Task UpdateAsync(Diagnosis model);

             Task<Int64> InsertAsync(Diagnosis model);

		      
        Task ArchiveAndInsertAsync(Diagnosis model);

          
          

        Task<List<Diagnosis>> GetByVisitIdAsync(Int64 VisitId , int TenantId);


        Task<List<Diagnosis>> GetByTenantIdAsync(Int32 TenantId );


        Task<List<Diagnosis>> GetByPidAsync(Int64 Pid , int TenantId);

          
          
      }
    /// <summary>
    /// Data access layer for Diagnosis
    /// </summary>
    public partial class DiagnosisRepository : RepositoryBase, IDiagnosisRepository
    {

        public DiagnosisRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<Diagnosis>> GetAllAsync(int TenantId)
        {
          var result = await _procExecutor.ExecuteProcAsync<Diagnosis>("Diagnosis_GetAll", new { TenantId });
      
                return (result?? new List<Diagnosis>()).ToList();
        }

        public async Task<Diagnosis> GetByIdAsync(Int64 Id , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<Diagnosis>
                                      ("Diagnosis_GetById",
                        new 
                        {
                          Id = Id 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<Diagnosis>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(Diagnosis model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("Id", model.Id));
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("VisitId", model.VisitId));
                    parameters.Add(new SqlParameter("Archived", model.Archived));
                    if(model.ParentId.HasValue)
                        parameters.Add(new SqlParameter("ParentId", model.ParentId.Value));

                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("ICDCodeCNId", model.ICDCodeCNId));
                    if(model.DiagnosisDate.HasValue)
                        parameters.Add(new SqlParameter("DiagnosisDate", model.DiagnosisDate.Value));

                    if(model.AdministeredById.HasValue)
                        parameters.Add(new SqlParameter("AdministeredById", model.AdministeredById.Value));

                    if(model.AdministrationSiteId.HasValue)
                        parameters.Add(new SqlParameter("AdministrationSiteId", model.AdministrationSiteId.Value));

                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    if(model.StatusCodeId.HasValue)
                        parameters.Add(new SqlParameter("StatusCodeId", model.StatusCodeId.Value));

                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    if(model.UpdateDate.HasValue)
                        parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate.Value));

                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    if(model.UpdatedBy.HasValue)
                        parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy.Value));
      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("Diagnosis_Update", args);
        }


							public async Task<Int64> InsertAsync(Diagnosis model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("VisitId", model.VisitId));
                    parameters.Add(new SqlParameter("Archived", model.Archived));
                    if(model.ParentId.HasValue)
                        parameters.Add(new SqlParameter("ParentId", model.ParentId.Value));

                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("ICDCodeCNId", model.ICDCodeCNId));
                    if(model.DiagnosisDate.HasValue)
                        parameters.Add(new SqlParameter("DiagnosisDate", model.DiagnosisDate.Value));

                    if(model.AdministeredById.HasValue)
                        parameters.Add(new SqlParameter("AdministeredById", model.AdministeredById.Value));

                    if(model.AdministrationSiteId.HasValue)
                        parameters.Add(new SqlParameter("AdministrationSiteId", model.AdministrationSiteId.Value));

                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    if(model.StatusCodeId.HasValue)
                        parameters.Add(new SqlParameter("StatusCodeId", model.StatusCodeId.Value));

                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    if(model.UpdateDate.HasValue)
                        parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate.Value));

                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    if(model.UpdatedBy.HasValue)
                        parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy.Value));

      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int64>("Diagnosis_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt64(result);            
        }


        public async Task ArchiveAndInsertAsync(Diagnosis model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("Id", model.Id));
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("VisitId", model.VisitId));
                    parameters.Add(new SqlParameter("Archived", model.Archived));
                    if(model.ParentId.HasValue)
                        parameters.Add(new SqlParameter("ParentId", model.ParentId.Value));

                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("ICDCodeCNId", model.ICDCodeCNId));
                    if(model.DiagnosisDate.HasValue)
                        parameters.Add(new SqlParameter("DiagnosisDate", model.DiagnosisDate.Value));

                    if(model.AdministeredById.HasValue)
                        parameters.Add(new SqlParameter("AdministeredById", model.AdministeredById.Value));

                    if(model.AdministrationSiteId.HasValue)
                        parameters.Add(new SqlParameter("AdministrationSiteId", model.AdministrationSiteId.Value));

                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    if(model.StatusCodeId.HasValue)
                        parameters.Add(new SqlParameter("StatusCodeId", model.StatusCodeId.Value));

                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    if(model.UpdateDate.HasValue)
                        parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate.Value));

                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    if(model.UpdatedBy.HasValue)
                        parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy.Value));
      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("Diagnosis_ArchiveAndInsert", args);
        }





        public async Task<List<Diagnosis>> GetByVisitIdAsync(Int64 VisitId , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<Diagnosis>
                                      ("Diagnosis_GetByVisitId",
                        new 
                        {
                          VisitId = VisitId 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<Diagnosis>()).ToList();
        }


        public async Task<List<Diagnosis>> GetByTenantIdAsync(Int32 TenantId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<Diagnosis>
                                      ("Diagnosis_GetByTenantId",
                        new 
                        {
                          TenantId = TenantId 
                          
                        }
                       );
            
          return (result?? new List<Diagnosis>()).ToList();
        }


        public async Task<List<Diagnosis>> GetByPidAsync(Int64 Pid , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<Diagnosis>
                                      ("Diagnosis_GetByPid",
                        new 
                        {
                          Pid = Pid 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<Diagnosis>()).ToList();
        }


    }

      public interface ISurgeryRepository: ISingletonDependency
      {
          Task<List<Surgery>> GetAllAsync(int TenantId);
          
        Task<Surgery> GetByIdAsync(Int64 Id , int TenantId);
        Task UpdateAsync(Surgery model);

             Task<Int64> InsertAsync(Surgery model);

		      
        Task ArchiveAndInsertAsync(Surgery model);

          
          

        Task<List<Surgery>> GetByVisitIdAsync(Int64 VisitId , int TenantId);


        Task<List<Surgery>> GetByTenantIdAsync(Int32 TenantId );


        Task<List<Surgery>> GetByPidAsync(Int64 Pid , int TenantId);

          
          
      }
    /// <summary>
    /// Data access layer for Surgery
    /// </summary>
    public partial class SurgeryRepository : RepositoryBase, ISurgeryRepository
    {

        public SurgeryRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<Surgery>> GetAllAsync(int TenantId)
        {
          var result = await _procExecutor.ExecuteProcAsync<Surgery>("Surgery_GetAll", new { TenantId });
      
                return (result?? new List<Surgery>()).ToList();
        }

        public async Task<Surgery> GetByIdAsync(Int64 Id , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<Surgery>
                                      ("Surgery_GetById",
                        new 
                        {
                          Id = Id 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<Surgery>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(Surgery model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("Id", model.Id));
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("VisitId", model.VisitId));
                    parameters.Add(new SqlParameter("Archived", model.Archived));
                    if(model.ParentId.HasValue)
                        parameters.Add(new SqlParameter("ParentId", model.ParentId.Value));

                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("ICDCodePCSId", model.ICDCodePCSId));
                    if(model.SurgeryDate.HasValue)
                        parameters.Add(new SqlParameter("SurgeryDate", model.SurgeryDate.Value));

                    if(model.AdministeredById.HasValue)
                        parameters.Add(new SqlParameter("AdministeredById", model.AdministeredById.Value));

                    if(model.AdministrationSiteId.HasValue)
                        parameters.Add(new SqlParameter("AdministrationSiteId", model.AdministrationSiteId.Value));

                    parameters.Add(new SqlParameter("OutcomeCodeId", model.OutcomeCodeId));
                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    if(model.StatusCodeId.HasValue)
                        parameters.Add(new SqlParameter("StatusCodeId", model.StatusCodeId.Value));

                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    if(model.UpdateDate.HasValue)
                        parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate.Value));

                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    if(model.UpdatedBy.HasValue)
                        parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy.Value));
      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("Surgery_Update", args);
        }


							public async Task<Int64> InsertAsync(Surgery model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("VisitId", model.VisitId));
                    parameters.Add(new SqlParameter("Archived", model.Archived));
                    if(model.ParentId.HasValue)
                        parameters.Add(new SqlParameter("ParentId", model.ParentId.Value));

                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("ICDCodePCSId", model.ICDCodePCSId));
                    if(model.SurgeryDate.HasValue)
                        parameters.Add(new SqlParameter("SurgeryDate", model.SurgeryDate.Value));

                    if(model.AdministeredById.HasValue)
                        parameters.Add(new SqlParameter("AdministeredById", model.AdministeredById.Value));

                    if(model.AdministrationSiteId.HasValue)
                        parameters.Add(new SqlParameter("AdministrationSiteId", model.AdministrationSiteId.Value));

                    parameters.Add(new SqlParameter("OutcomeCodeId", model.OutcomeCodeId));
                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    if(model.StatusCodeId.HasValue)
                        parameters.Add(new SqlParameter("StatusCodeId", model.StatusCodeId.Value));

                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    if(model.UpdateDate.HasValue)
                        parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate.Value));

                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    if(model.UpdatedBy.HasValue)
                        parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy.Value));

      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int64>("Surgery_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt64(result);            
        }


        public async Task ArchiveAndInsertAsync(Surgery model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("Id", model.Id));
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("VisitId", model.VisitId));
                    parameters.Add(new SqlParameter("Archived", model.Archived));
                    if(model.ParentId.HasValue)
                        parameters.Add(new SqlParameter("ParentId", model.ParentId.Value));

                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("ICDCodePCSId", model.ICDCodePCSId));
                    if(model.SurgeryDate.HasValue)
                        parameters.Add(new SqlParameter("SurgeryDate", model.SurgeryDate.Value));

                    if(model.AdministeredById.HasValue)
                        parameters.Add(new SqlParameter("AdministeredById", model.AdministeredById.Value));

                    if(model.AdministrationSiteId.HasValue)
                        parameters.Add(new SqlParameter("AdministrationSiteId", model.AdministrationSiteId.Value));

                    parameters.Add(new SqlParameter("OutcomeCodeId", model.OutcomeCodeId));
                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    if(model.StatusCodeId.HasValue)
                        parameters.Add(new SqlParameter("StatusCodeId", model.StatusCodeId.Value));

                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    if(model.UpdateDate.HasValue)
                        parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate.Value));

                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    if(model.UpdatedBy.HasValue)
                        parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy.Value));
      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("Surgery_ArchiveAndInsert", args);
        }





        public async Task<List<Surgery>> GetByVisitIdAsync(Int64 VisitId , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<Surgery>
                                      ("Surgery_GetByVisitId",
                        new 
                        {
                          VisitId = VisitId 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<Surgery>()).ToList();
        }


        public async Task<List<Surgery>> GetByTenantIdAsync(Int32 TenantId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<Surgery>
                                      ("Surgery_GetByTenantId",
                        new 
                        {
                          TenantId = TenantId 
                          
                        }
                       );
            
          return (result?? new List<Surgery>()).ToList();
        }


        public async Task<List<Surgery>> GetByPidAsync(Int64 Pid , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<Surgery>
                                      ("Surgery_GetByPid",
                        new 
                        {
                          Pid = Pid 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<Surgery>()).ToList();
        }


    }

      public interface IDocumentRepository: ISingletonDependency
      {
          Task<List<Document>> GetAllAsync(int TenantId);
          
        Task<Document> GetByIdAsync(Int64 Id , int TenantId);
        Task UpdateAsync(Document model);

             Task<Int64> InsertAsync(Document model);

		      
          
          

        Task<List<Document>> GetByTenantIdAsync(Int32 TenantId );


        Task<List<Document>> GetByPidAsync(Int64 Pid , int TenantId);

          
          
      }
    /// <summary>
    /// Data access layer for Document
    /// </summary>
    public partial class DocumentRepository : RepositoryBase, IDocumentRepository
    {

        public DocumentRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<Document>> GetAllAsync(int TenantId)
        {
          var result = await _procExecutor.ExecuteProcAsync<Document>("Document_GetAll", new { TenantId });
      
                return (result?? new List<Document>()).ToList();
        }

        public async Task<Document> GetByIdAsync(Int64 Id , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<Document>
                                      ("Document_GetById",
                        new 
                        {
                          Id = Id 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<Document>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(Document model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("Id", model.Id));
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("DocumentTypeCodeId", model.DocumentTypeCodeId));
                    parameters.Add(new SqlParameter("DocumentCategoryCodeId", model.DocumentCategoryCodeId));
                    parameters.Add(new SqlParameter("ServerFileName", model.ServerFileName));
                    if(model.DocumentDescription!=null)
                        parameters.Add(new SqlParameter("DocumentDescription", model.DocumentDescription));

                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    if(model.StatusCodeId.HasValue)
                        parameters.Add(new SqlParameter("StatusCodeId", model.StatusCodeId.Value));

                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    if(model.UpdateDate.HasValue)
                        parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate.Value));

                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    if(model.UpdatedBy.HasValue)
                        parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy.Value));
      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("Document_Update", args);
        }


							public async Task<Int64> InsertAsync(Document model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("Pid", model.Pid));
                    parameters.Add(new SqlParameter("TenantId", model.TenantId));
                    parameters.Add(new SqlParameter("DocumentTypeCodeId", model.DocumentTypeCodeId));
                    parameters.Add(new SqlParameter("DocumentCategoryCodeId", model.DocumentCategoryCodeId));
                    parameters.Add(new SqlParameter("ServerFileName", model.ServerFileName));
                    if(model.DocumentDescription!=null)
                        parameters.Add(new SqlParameter("DocumentDescription", model.DocumentDescription));

                    if(model.Note!=null)
                        parameters.Add(new SqlParameter("Note", model.Note));

                    if(model.StatusCodeId.HasValue)
                        parameters.Add(new SqlParameter("StatusCodeId", model.StatusCodeId.Value));

                    parameters.Add(new SqlParameter("CreateDate", model.CreateDate));
                    if(model.UpdateDate.HasValue)
                        parameters.Add(new SqlParameter("UpdateDate", model.UpdateDate.Value));

                    parameters.Add(new SqlParameter("CreatedBy", model.CreatedBy));
                    if(model.UpdatedBy.HasValue)
                        parameters.Add(new SqlParameter("UpdatedBy", model.UpdatedBy.Value));

      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int64>("Document_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt64(result);            
        }





        public async Task<List<Document>> GetByTenantIdAsync(Int32 TenantId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<Document>
                                      ("Document_GetByTenantId",
                        new 
                        {
                          TenantId = TenantId 
                          
                        }
                       );
            
          return (result?? new List<Document>()).ToList();
        }


        public async Task<List<Document>> GetByPidAsync(Int64 Pid , int TenantId)
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<Document>
                                      ("Document_GetByPid",
                        new 
                        {
                          Pid = Pid 
                          , TenantId 
                        }
                       );
            
          return (result?? new List<Document>()).ToList();
        }


    }

      public interface ITherapyCodeRepository: ISingletonDependency
      {
          Task<List<TherapyCode>> GetAllAsync();
          
        Task<TherapyCode> GetByTherapyCodeIdAsync(Int32 TherapyCodeId );
        Task UpdateAsync(TherapyCode model);

             Task<Int32> InsertAsync(TherapyCode model);

		      
          
          
          
          
      }
    /// <summary>
    /// Data access layer for TherapyCode
    /// </summary>
    public partial class TherapyCodeRepository : RepositoryBase, ITherapyCodeRepository
    {

        public TherapyCodeRepository (IProcExecutor procExecutor): base(procExecutor)
        {
           
        }

        public async Task<List<TherapyCode>> GetAllAsync()
        {
          var result = await _procExecutor.ExecuteProcAsync<TherapyCode>("TherapyCode_GetAll", null);
      
                return (result?? new List<TherapyCode>()).ToList();
        }

        public async Task<TherapyCode> GetByTherapyCodeIdAsync(Int32 TherapyCodeId )
        {
            var result = await _procExecutor
                      .ExecuteProcAsync<TherapyCode>
                                      ("TherapyCode_GetByTherapyCodeId",
                        new 
                        {
                          TherapyCodeId = TherapyCodeId 
                          
                        }
                       );
            
          return (result?? new List<TherapyCode>()).FirstOrDefault();                    
        }

        public async Task UpdateAsync(TherapyCode model)
        {
          var parameters = new List<SqlParameter>();
      
      
                    parameters.Add(new SqlParameter("TherapyCodeId", model.TherapyCodeId));
                    parameters.Add(new SqlParameter("TherapyCodeName", model.TherapyCodeName));      
                          var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
          await _procExecutor.ExecuteAsync("TherapyCode_Update", args);
        }


							public async Task<Int32> InsertAsync(TherapyCode model)
        {
          var parameters = new List<SqlParameter>();
          
                    parameters.Add(new SqlParameter("TherapyCodeName", model.TherapyCodeName));
      
          
                    Object result = null;
                    var args = new DynamicParameters(new {});
                    parameters.ForEach(p => args.Add(p.ParameterName, p.Value));
                    result = await _procExecutor.ExecuteScalarAsync<Int32>("TherapyCode_Insert", args);
                    if (result == null || Convert.IsDBNull(result))
                        throw new Exception("Can not get inserted auto number from db.");
                    else
                        return Convert.ToInt32(result);            
        }





    }

}
