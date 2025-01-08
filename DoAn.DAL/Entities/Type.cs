using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DoAn.DAL.Entities
{
    public class Type // loại, giày , dép, guốc
    {
        [Key]
        public int Id { get; set; } 

        [Required]
        [StringLength(100)]
        public string Name { get; set; }  

        public int? SizeForm { get; set; }  

        public int? SizeTo { get; set; }  
    }
}
