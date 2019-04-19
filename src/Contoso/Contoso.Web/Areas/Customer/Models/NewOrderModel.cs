using System.Collections.Generic;
using Contoso.Web.Models;

namespace Contoso.Web.Areas.Customer.Models
{
    public class NewOrderModel
    {
        public Contoso.Web.Models.Customer Customer { get; set; }

        public Order Order { get; set; }
        public List<OrderDetail> OrderDetails { get; set; }
    }
}