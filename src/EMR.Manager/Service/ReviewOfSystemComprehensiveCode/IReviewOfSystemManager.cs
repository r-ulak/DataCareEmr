using System.Collections.Generic;
using System.Threading.Tasks;
using EMR.DTO;

namespace EMR.Manager.Service
{
    public interface IReviewOfSystemCodeManager
    {
      
        Task<List<ReviewOfSystemGroupedCodeResultDto>> GetAllReviewOfSystemCodeAsync();        
            
   
   }
}
