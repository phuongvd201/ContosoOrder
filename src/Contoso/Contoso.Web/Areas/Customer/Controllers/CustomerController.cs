using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

using Contoso.Web.Areas.Customer.Models;
using Contoso.Web.Models;

namespace Contoso.Web.Areas.Customer.Controllers
{
    public class CustomerController : Controller
    {
        readonly ContosoEntities dbContoso = new ContosoEntities();

        //
        // GET: /Customer/Customer/
        public ActionResult Index()
        {
            var products = (
                from a in dbContoso.Products
                select a
            ).ToList();

            List<SelectListItem> items = new List<SelectListItem>()
            {
                new SelectListItem()
                {
                    Text = "---Select Product---",
                    Value = ""
                }
            };

            items.AddRange(
                products
                    .Select(
                        c => new SelectListItem
                        {
                            Value = c.ProductId.ToString(),
                            Text = c.ProductName
                        }));

            ViewBag.Products = products;
            ViewBag.ProductId = items;

            return View();
        }

        //
        // POST: /Customer/Customer/Order
        [HttpPost]
        public JsonResult Order(NewOrderModel newOrder)
        {
            if (ModelState.IsValid)
            {
                if (newOrder != null && newOrder.OrderDetails != null && newOrder.OrderDetails.Count > 0)
                {
                    dbContoso.Customers.Add(newOrder.Customer);
                    dbContoso.SaveChanges();

                    var order = new Order()
                    {
                        OrderDate = DateTime.Now,
                        CustomerId = newOrder.Customer.CustomerId,
                        Status = "New"
                    };
                    dbContoso.Orders.Add(order);
                    dbContoso.SaveChanges();

                    foreach (var orderDetail in newOrder.OrderDetails)
                    {
                        orderDetail.OrderId = order.OrderId;
                        dbContoso.OrderDetails.Add(orderDetail);
                    }

                    dbContoso.SaveChanges();

                    return Json(new { success = true });
                }

                #region Test data
                //for (int i = 0; i < 200; i++)
                //{
                //    Random rnd = new Random();

                //    newOrder = new NewOrderModel()
                //    {
                //        Customer = new Web.Models.Customer()
                //        {
                //            Name = "Customer " + i,
                //            Email = "customer_mail" + i + "@contoso.com",
                //            Phone = "090321335" + i,
                //            Address = i + "Da Nang,  Viet Nam",
                //            Country = "Vietnam"
                //        },
                //        OrderDetails = new List<OrderDetail>()
                //        {
                //            new OrderDetail()
                //            {
                //                ProductId = rnd.Next(1, 128),
                //                Quantity = rnd.Next(1, 99)
                //            },
                //            new OrderDetail()
                //            {
                //                ProductId = rnd.Next(1, 128),
                //                Quantity = rnd.Next(1, 99)
                //            },
                //            new OrderDetail()
                //            {
                //                ProductId = rnd.Next(1, 128),
                //                Quantity = rnd.Next(1, 99)
                //            },
                //            new OrderDetail()
                //            {
                //                ProductId = rnd.Next(1, 128),
                //                Quantity = rnd.Next(1, 99)
                //            },
                //            new OrderDetail()
                //            {
                //                ProductId = rnd.Next(1, 128),
                //                Quantity = rnd.Next(1, 99)
                //            }
                //        }

                //    };

                //    dbContoso.Customers.Add(newOrder.Customer);
                //    dbContoso.SaveChanges();

                //    var order = new Order()
                //    {
                //        OrderDate = DateTime.Now,
                //        CustomerId = newOrder.Customer.CustomerId,
                //        Status = "New"
                //    };
                //    dbContoso.Orders.Add(order);
                //    dbContoso.SaveChanges();

                //    foreach (var orderDetail in newOrder.OrderDetails)
                //    {
                //        orderDetail.OrderId = order.OrderId;
                //        dbContoso.OrderDetails.Add(orderDetail);
                //    }
                //    dbContoso.SaveChanges();
                //}
                #endregion
            }

            return Json(new { success = false });
        }
    }
}