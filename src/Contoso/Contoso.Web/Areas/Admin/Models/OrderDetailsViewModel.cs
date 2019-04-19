using System.Collections.Generic;
using Contoso.Web.Models;

namespace Contoso.Web.Areas.Admin.Models
{
    public class OrderDetailsViewModel
    {
        public Web.Models.Customer Customer { get; set; }

        public Order Order { get; set; }

        public List<OrderDetailInfo> OrderDetailInfos { get; set; }
    }

    public class OrderDetailInfo
    {
        public int OrderId { get; set; }
        public string ProductName { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
        public decimal Total { get; set; }
    }
}