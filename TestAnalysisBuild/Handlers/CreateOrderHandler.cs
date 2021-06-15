using System;
using System.Threading.Tasks;
using NServiceBus;

namespace TestAnalysisBuild.Handlers
{
    public class CreateOrderHandler : IHandleMessages<CreateOrder>
    {
        
        public Task Handle(CreateOrder message, IMessageHandlerContext context)
        {
            throw new NotImplementedException();
        }
    }

    public class CreateOrder : ICommand
    {
        public Guid OrderId { get; set; }
    }
}