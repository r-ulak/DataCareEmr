using System.Threading.Tasks;
using EMR.Entities;

namespace EMR.Manager.Service
{
    public interface ILoincUnitCodeManager
    {
        Task<LoincUnitCode> GetUnitCodeAsync(LoincUnitCode input);
    }
}
