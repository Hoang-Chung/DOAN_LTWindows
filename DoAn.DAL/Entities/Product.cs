using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DoAn.DAL.Entities
{
    public class Product
    {
        [Key]
        public int Id { get; set; }  

        [Required]
        [StringLength(20)]
        public string Code { get; set; }  // dạng mã sản phẩm vd: GIAY, DEP

        [Required]
        [StringLength(100)]
        public string Name { get; set; }  

        [Required]
        public int Price { get; set; } 

        [Required]
        public byte Gender { get; set; } // Gioi tinh dùng -- khó chưa

        public int? Amount { get; set; }  // so luong khi đăng bán

        [Required]
        public DateTime CreatedDate { get; set; } 

        [Required]
        [StringLength(100)]
        public string ListColor { get; set; }  // cái này thêm vào thì đc, xóa cũng đc

        [Required]
        public byte Status { get; set; }   // trạng thái

        public int? IdType { get; set; }   // id Loại

        public int? IdDiscount { get; set; }   // Giảm giá không
    }
}
