using Abp.Dependency;
using System.Collections.Generic;
using EMR.DAL;
using System.Threading.Tasks;
using EMR.DTO;
using EMR.Redis;
using System.Linq;

namespace EMR.Manager.Service
{
    /// <summary>
    /// Manager methods for ReviewOfSystemCode
    /// </summary>
    public class ReviewOfSystemCodeManager : IReviewOfSystemCodeManager, ISingletonDependency
    {
        private readonly IReviewOfSystemCodeRepositoryExtended _reviewofsystemRepositoryExtended;
        private readonly IRedisCacheStore _cacheStore;

        public ReviewOfSystemCodeManager(IReviewOfSystemCodeRepositoryExtended reviewofsystemRepositoryExtended,
            IRedisCacheStore cacheStore)
        {
            _reviewofsystemRepositoryExtended = reviewofsystemRepositoryExtended;
            _cacheStore = cacheStore;
        }

        public async Task<List<ReviewOfSystemGroupedCodeResultDto>> GetAllReviewOfSystemCodeAsync()
        {
            return await _cacheStore.GetAsync("ReviewOfSystemCode",
                EMRConsts.TwentyFourHourTimeSpan, GroupReviewOfSystemCodeAsync);
        }

        public async Task<List<ReviewOfSystemGroupedCodeResultDto>> GroupReviewOfSystemCodeAsync()
        {
            var result = await _reviewofsystemRepositoryExtended.GetAllReviewOfSystemCodeAsync();
            return
                result.
                    GroupBy(x => new { x.ReviewOfSystemGroupCodeName, x.SortOrder },
                        (key, group) =>
                        {
                            var reviewOfSystemCodeResultDtos = @group as IList<ReviewOfSystemCodeResultDto> ?? @group.ToList();
                            return new ReviewOfSystemGroupedCodeResultDto()
                            {
                                ReviewOfSystemGroupCodeName = key.ReviewOfSystemGroupCodeName,
                                SortOrder = key.SortOrder,
                                ReviewOfSystemCode = reviewOfSystemCodeResultDtos,
                                IsShort = reviewOfSystemCodeResultDtos.Count(x => x.IsShortCode) > 0,
                                IsComprehensive = reviewOfSystemCodeResultDtos.Count(x => !x.IsShortCode) > 0
                            };
                        }).OrderBy(x => x.SortOrder)
                    .ToList();
        }
    }
}
