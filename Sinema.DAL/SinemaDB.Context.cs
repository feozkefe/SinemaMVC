﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Sinema.DAL
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class SinemaEntities : DbContext
    {
        public SinemaEntities()
            : base("name=SinemaEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Bilet> Bilet { get; set; }
        public virtual DbSet<Calisan> Calisan { get; set; }
        public virtual DbSet<Film> Film { get; set; }
        public virtual DbSet<FilmTur> FilmTur { get; set; }
        public virtual DbSet<Musteri> Musteri { get; set; }
        public virtual DbSet<Salon> Salon { get; set; }
        public virtual DbSet<Seans> Seans { get; set; }
    }
}
