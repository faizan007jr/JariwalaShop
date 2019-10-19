using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace JariwalaShop
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Temporary;
            routes.EnableFriendlyUrls(settings);

            routes.MapPageRoute("AddProduct", "Admin/AddProduct", "~/AddProduct.aspx");
            routes.MapPageRoute("EditProduct", "Admin/EditProduct", "~/EditProduct.aspx");
            routes.MapPageRoute("Order", "Admin/Order", "~/Order.aspx");
        }
    }
}
