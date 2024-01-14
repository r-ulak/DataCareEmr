using System;

namespace EMR
{
    public class EMRConsts
    {
        public const string BlobConnectionStringName = "azure.storage.ConnectionString";
        public const string BlobAllowedOriginsName = "azure.storgae.allowedOrigins";
        public const string LocalizationSourceName = "EMR";
        public const string EMRAzureIndexNameICD10PCS = "icdcodepcs";
        public const string EMRAzureIndexNameICD10CN = "icdcodecn";
        public const string EMRAzureIndexNameLoinc = "loinccode";
        public const int EMRAzureICD10PCSLimit = 20;
        public const int EMRAzureICD10CNLimit = 20;
        public const int EMRAzureLoincLimit = 20;
        public const int ActiveStatus = 1;
        public const int PendingResultStatus = 1;
        public const int SignedAndReviewedByLabOrRad = 2;
        public const int NotApplicableOrderStatus = 4;
        public const int RegistrationVisitStatusCode = 1;
        public const int SASTokenExpiration = 5;
        public static TimeSpan TwentyFourHourTimeSpan = new TimeSpan(24, 0, 0);
        public const string EMRAllowedUploadExtension = @"([^\s]+(\.(?i)(jpg|jpeg|png|gif|bmp|pdf|dcm|dcm30))$)";
        public const string EMRAllowedImageExtension = @"([^\s]+(\.(?i)(jpg|jpeg|png|gif|bmp))$)";
    }
}