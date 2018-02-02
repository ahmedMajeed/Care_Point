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
    
    public partial class Service
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Service()
        {
            this.ServiceMembershipRequests = new HashSet<ServiceMembershipRequest>();
            this.ServiceRatings = new HashSet<ServiceRating>();
            this.WorkSlots = new HashSet<WorkSlot>();
        }
    
        public long ID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public long CategoryID { get; set; }
        public Nullable<decimal> Cost { get; set; }
        public Nullable<long> ProviderID { get; set; }
    
        public virtual MedicalPlace MedicalPlace { get; set; }
        public virtual ServiceCategory ServiceCategory { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ServiceMembershipRequest> ServiceMembershipRequests { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ServiceRating> ServiceRatings { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WorkSlot> WorkSlots { get; set; }
    }
}