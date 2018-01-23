//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class MedicalPlace
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public MedicalPlace()
        {
            this.CareRequests = new HashSet<CareRequest>();
            this.HistoryRecords = new HashSet<HistoryRecord>();
            this.Pharmacies = new HashSet<Pharmacy>();
            this.Services = new HashSet<Service>();
            this.SOSses = new HashSet<SOSs>();
            this.Specialists = new HashSet<Specialist>();
        }
    
        public long ID { get; set; }
        public string Name { get; set; }
        public long TypeID { get; set; }
        public System.Data.Entity.Spatial.DbGeography Location { get; set; }
        public byte[] Photo { get; set; }
        public bool IsConfirmed { get; set; }
        public byte[] Permission { get; set; }
        public string Description { get; set; }
        public Nullable<long> OwnerID { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CareRequest> CareRequests { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HistoryRecord> HistoryRecords { get; set; }
        public virtual MedicalPlaceType MedicalPlaceType { get; set; }
        public virtual Specialist Owner { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Pharmacy> Pharmacies { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Service> Services { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SOSs> SOSses { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Specialist> Specialists { get; set; }
    }
}
