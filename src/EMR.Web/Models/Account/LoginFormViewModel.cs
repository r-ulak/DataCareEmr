namespace EMR.Web.Models.Account
{
    public class LoginFormViewModel
    {
        public string ReturnUrl { get; set; }

        public bool IsMultiTenancyEnabled { get; set; }
    }
}