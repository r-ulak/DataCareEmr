using EMR;

namespace Common
{
    public static class AppSettings
    {
        static public string ResetPasswordEmailTemplate { get; set; }
        static public string ConfirmEmailTemplate { get; set; }
        static AppSettings()
        {
            ResetPasswordEmailTemplate = Resource.passwordreset;
            ConfirmEmailTemplate = Resource.emailconfirm;
        }

    }
}
