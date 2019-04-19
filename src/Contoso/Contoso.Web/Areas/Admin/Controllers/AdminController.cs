using System;
using System.Linq;
using System.Web.Mvc;
using Contoso.Web.Areas.Admin.Models;
using Contoso.Web.Models;

namespace Contoso.Web.Areas.Admin.Controllers
{
    
    [Authorize(Roles = "Admin")]
    public class AdminController : Controller
    {
        private const int PAGE_SIZE = 25;

        ContosoEntities dbContoso = new ContosoEntities();

        //
        // GET: /Admin/Admin/
        public ActionResult Index()
        {

            var orderViewModel = GetListOrdersPaging();


            ViewBag.TotalPages = orderViewModel.TotalPages;
            return View(orderViewModel);
        }
        
        [HttpPost]
        public PartialViewResult GetViewOrderPaging(int page = 1, string sortField ="", string sortDirection = "")
        {
            var orderViewModel = GetListOrdersPaging(page, sortField, sortDirection);

            return PartialView("_OrderListPaging", orderViewModel);
        }


        public OrderListViewModel GetListOrdersPaging(int page = 1, string sortField = "", string sortDirection = "")
        {
            OrderListViewModel orderListViewModel = new OrderListViewModel();

            var preAllOrdersList = (from d in dbContoso.OrderDetails
                                    join o in dbContoso.Orders on d.OrderId equals o.OrderId
                                    join c in dbContoso.Customers on o.CustomerId equals c.CustomerId
                                    join p in dbContoso.Products on d.ProductId equals p.ProductId

                                    select new
                                    {
                                        OrderId = d.OrderId,
                                        OrderDate = o.OrderDate,
                                        Status = o.Status,
                                        CustomerName = c.Name,
                                        Country = c.Country,
                                        Quantity = d.Quantity,
                                        Price = p.Price
                                    }).GroupBy(l => new { l.OrderId, l.OrderDate, l.Status, l.CustomerName, l.Country })
                                  .Select(cl => new OrderViewModel()
                                  {
                                      OrderId = cl.Key.OrderId,
                                      OrderDate = cl.Key.OrderDate,
                                      Status = cl.Key.Status,
                                      CustomerName = cl.Key.CustomerName,
                                      Country = cl.Key.Country,
                                      Total = cl.Sum(c => c.Price * c.Quantity),
                                  });

            switch (sortField)
            {
                case "CustomerName":
                    preAllOrdersList = (sortDirection == "asc") ?  preAllOrdersList.OrderBy(s => s.CustomerName)
                        :  preAllOrdersList.OrderByDescending(s => s.CustomerName);
                    break;

                case "OrderDate":
                    preAllOrdersList = (sortDirection == "asc") ? preAllOrdersList.OrderBy(s => s.OrderDate)
                        : preAllOrdersList.OrderByDescending(s => s.OrderDate);
                    break;

                default:
                    preAllOrdersList = preAllOrdersList.OrderBy(s => s.CustomerName);
                    break;

            }

            orderListViewModel.CurrentPage = page;
            orderListViewModel.PageSize = PAGE_SIZE;
            orderListViewModel.SortField = sortField;
            orderListViewModel.SortDirection = sortDirection;

            if (preAllOrdersList.Count()%PAGE_SIZE == 0)
            {
                orderListViewModel.TotalPages = preAllOrdersList.Count()/PAGE_SIZE;
            }
            else
            {
                orderListViewModel.TotalPages = (preAllOrdersList.Count() / PAGE_SIZE) + 1;
            }


            var ordersPagingList = preAllOrdersList.Skip((page - 1) * PAGE_SIZE).Take(PAGE_SIZE).ToList();

            if (ordersPagingList.Count() <= PAGE_SIZE)
                orderListViewModel.IsLastRecord = 2;

            if (orderListViewModel.IsLastRecord != 2)
            {
                orderListViewModel.IsLastRecord = ordersPagingList.Count() <= PAGE_SIZE ? 1 : 0;
            }

            orderListViewModel.OrderList = ordersPagingList;

            return orderListViewModel;

        }

        public ActionResult OrderDetails(int orderId)
        {

            OrderDetailsViewModel orderDetailViewModel = null;

            var orderDetail = (from o in dbContoso.Orders 
                                    join c in dbContoso.Customers on o.CustomerId equals c.CustomerId
                                    where o.OrderId == orderId
                                    select new
                                    {
                                        OrderId = o.OrderId,
                                        OrderDate = o.OrderDate,
                                        Status = o.Status,
                                        CustomerId = c.CustomerId,
                                        CustomerName = c.Name,
                                        Email = c.Email,
                                        Address = c.Address,
                                        Phone = c.Phone,
                                        Country = c.Country,
                                    }).SingleOrDefault();

            var orderDetailInfos = (from d in dbContoso.OrderDetails
                                    join o in dbContoso.Orders on d.OrderId equals o.OrderId
                                    join p in dbContoso.Products on d.ProductId equals p.ProductId
                                    where d.OrderId == orderId
                                    select new OrderDetailInfo
                                    {
                                        OrderId = d.OrderId,
                                        Quantity = d.Quantity,
                                        ProductName = p.ProductName,
                                        Price = p.Price,
                                        Total = p.Price * d.Quantity
                                    }).ToList();

            if (orderDetail != null)
            {
                orderDetailViewModel = new OrderDetailsViewModel()
                {
                    Customer = new Web.Models.Customer()
                    {
                        CustomerId =  orderDetail.CustomerId,
                        Name = orderDetail.CustomerName,
                        Email = orderDetail.Email,
                        Address = orderDetail.Address,
                        Phone = orderDetail.Phone,
                        Country = orderDetail.Country,
                    },
                    Order = new Order()
                    {
                        OrderId = orderDetail.OrderId,
                        OrderDate = orderDetail.OrderDate,
                        Status = orderDetail.Status

                    },
                    OrderDetailInfos = orderDetailInfos
                };
            }

            return View(orderDetailViewModel);
        }

        public ActionResult Approve(int orderId)
        {
            var query =
                from ord in dbContoso.Orders
                where ord.OrderId == orderId
                select ord;


            foreach (var ord in query)
            {
                ord.Status = "Approve";
            }

            try
            {
                dbContoso.SaveChanges();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                // Provide for exceptions.
            }

            return RedirectToAction("Index","Admin", new {Area="Admin"});
        }

        public ActionResult Reject(int orderId)
        {
            var query =
                from ord in dbContoso.Orders
                where ord.OrderId == orderId
                select ord;


            foreach (var ord in query)
            {
                ord.Status = "Reject";
            }

            try
            {
                dbContoso.SaveChanges();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                // Provide for exceptions.
            }

            return RedirectToAction("Index", "Admin", new { Area = "Admin" });
        }

    }
}