using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DoAn.DAL.Entities
{
    public class DiscountProduct
    {
        [Key]
        public int Id { get; set; }  

        [Required]
        [StringLength(100)]
        public string Info { get; set; }  

        [Required]
        public int Discount { get; set; }  

        [Required]
        public DateTime CreatedDate { get; set; }  
    }
}
