namespace DoAn.DAL.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Prduct : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.DiscountProducts",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Info = c.String(nullable: false, maxLength: 100),
                        Discount = c.Int(nullable: false),
                        CreatedDate = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Products",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Code = c.String(nullable: false, maxLength: 20),
                        Name = c.String(nullable: false, maxLength: 100),
                        Price = c.Int(nullable: false),
                        Gender = c.Byte(nullable: false),
                        Amount = c.Int(),
                        CreatedDate = c.DateTime(nullable: false),
                        ListColor = c.String(nullable: false, maxLength: 100),
                        Status = c.Byte(nullable: false),
                        IdType = c.Int(),
                        IdDiscount = c.Int(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Types",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 100),
                        SizeForm = c.Int(),
                        SizeTo = c.Int(),
                    })
                .PrimaryKey(t => t.Id);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.Types");
            DropTable("dbo.Products");
            DropTable("dbo.DiscountProducts");
        }
    }
}
