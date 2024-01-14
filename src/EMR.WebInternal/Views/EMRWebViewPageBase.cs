using Abp.Web.Mvc.Views;

namespace EMR.WebInterenal.Views
{
    public abstract class EMRWebViewPageBase : EMRWebViewPageBase<dynamic>
    {

    }

    public abstract class EMRWebViewPageBase<TModel> : AbpWebViewPage<TModel>
    {
        protected EMRWebViewPageBase()
        {
            LocalizationSourceName = EMRConsts.LocalizationSourceName;
        }
    }
}