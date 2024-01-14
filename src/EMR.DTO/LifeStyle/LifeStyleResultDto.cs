using Abp.AutoMapper;
using EMR.Entities;
using System;

namespace EMR.DTO
{
    [AutoMap(typeof(LifeStyle))]
    public class LifeStyleResultDto
    {
        public long Id { get; set; }
        public int LifeStyleTypeId { get; set; }
        public string LifeStyleTypeName { get; set; }
        public DateTime? QuitDate { get; set; }
        public bool CurrentlyActive { get; set; }
        public string Note { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime UpdateDate { get; set; }
        public string CreatedByName { get; set; }
        public string UpdatedByName { get; set; }

    }

}