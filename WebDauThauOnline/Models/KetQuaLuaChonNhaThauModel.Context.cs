﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebDauThauOnline.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class KetQuaLuaChonNhaThauEntities : DbContext
    {
        public KetQuaLuaChonNhaThauEntities()
            : base("name=KetQuaLuaChonNhaThauEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<KetQuaLuaChonNhaThau_ThongTinChiTiet> KetQuaLuaChonNhaThau_ThongTinChiTiet { get; set; }
    }
}
