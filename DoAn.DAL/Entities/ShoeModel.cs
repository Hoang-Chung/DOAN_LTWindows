using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DoAn.DAL.Entities
{
    public class ShoeModel : DbContext
    {
        public ShoeModel() : base("QuanLyBanGiay")
        {
        }
        public DbSet<Product> Products { get; set; }
        public DbSet<Type> Types { get; set; }
        public DbSet<DiscountProduct> DiscountProducts { get; set; }



    }
}


