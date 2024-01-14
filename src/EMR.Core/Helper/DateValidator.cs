using System;
using System.ComponentModel.DataAnnotations;
using Abp.Runtime.Validation;
using Abp.Timing;

namespace EMR.Helper
{
    public static class DateValidator
    {
        public static void ValidateDateWithMinDate(DateTime minDate, CustomValidationContext context, DateTime? checkDate)
        {
            if (checkDate == DateTime.MinValue || checkDate == null)
            {
                checkDate = null;
            }
            else if (!(checkDate.Value.Date <= Clock.Now.Date && checkDate.Value.Date >= minDate.Date))
            {
                context.Results.Add(new ValidationResult($"Date range must be between {minDate} and today"));
            }
        }

        public static void ValidateDateWithMinDate(DateTime minDate, CustomValidationContext context, DateTime checkDate)
        {
            if (checkDate == DateTime.MinValue)
            {
                context.Results.Add(new ValidationResult($"Date range must be between {minDate} and today"));
            }
            else if (!(checkDate.Date <= Clock.Now.Date && checkDate.Date >= minDate.Date))
            {
                context.Results.Add(new ValidationResult($"Date range must be between {minDate} and today"));
            }
        }
    }
}
