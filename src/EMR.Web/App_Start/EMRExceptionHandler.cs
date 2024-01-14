using System.Collections.Generic;
using Abp.Dependency;
using Abp.Events.Bus.Exceptions;
using Abp.Events.Bus.Handlers;
using Castle.Core.Logging;
using Microsoft.ApplicationInsights;

namespace EMR.Web.App_Start
{
    public class EMRExceptionHandler : IEventHandler<AbpHandledExceptionData>, ITransientDependency
    {
        public ILogger Logger { get; set; }

        public void HandleEvent(AbpHandledExceptionData eventData)
        {
            var telemetryClient = new TelemetryClient();
            telemetryClient.TrackException(eventData.Exception);
            Logger.Error(eventData.EventSource.ToString(), eventData.Exception);
        }
    }
}