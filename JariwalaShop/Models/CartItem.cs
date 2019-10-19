using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JariwalaShop
{
    public class CartItem
    {
        public CartItem() { }

        public Product Product { get; set; }
        public decimal Quantity { get; set; }

        public CartItem(Product product, decimal quantity)
        {
            this.Product = product;
            this.Quantity = quantity;
        }

        public void AddQuantity(decimal quantity)
        {
            this.Quantity += quantity;
        }

        public string Display()
        {
            decimal totalPrice = Product.Price  * (Quantity/1000);
            string displayString = Product.Name + " (" + (Quantity/1000).ToString() + "Kg @ " + Product.Price.ToString("c") + " = " + totalPrice.ToString("c") + ")";
            return displayString;
        }
    }
}