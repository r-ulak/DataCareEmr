using System.Web.Mvc;
using Abp.Web.Mvc.Authorization;

namespace EMR.Web.Controllers
{
    [AbpMvcAuthorize]
    public class HomeController : EMRControllerBase
    {
        public ActionResult Index()
        {
            return View("~/App/Main/views/layout/layout.cshtml"); //Layout of the angular application.
        }
	}
}