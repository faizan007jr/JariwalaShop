using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JariwalaShop
{
    public class Product
    {
        public int ProductCode { get; set; }
        public string Name { get; set; }
        public string Image { get; set; }
        public int Size { get; set; }
        public decimal Price { get; set; }
        public decimal Quantity { get; set; }
    }
}