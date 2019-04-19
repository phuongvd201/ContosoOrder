using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Contoso.Web.Areas.Admin.Models
{

    public class OrderViewModel
    {
        public int OrderId { get; set; }

        public DateTime OrderDate { get; set; }

        public String Status { get; set; }

        public int CustomerId { get; set; }

        public string CustomerName { get; set; }

        public string Country { get; set; }

        public decimal Total { get; set; }
    }


    public class OrderListViewModel
    {
        public IEnumerable<OrderViewModel> OrderList { get; set; }

        public int CurrentPage;
        public int PageSize;
        public int TotalPages;
        public string SortField;
        public string SortDirection;
        public string Search;
        public int IsLastRecord;
        public int Count;
    }
}