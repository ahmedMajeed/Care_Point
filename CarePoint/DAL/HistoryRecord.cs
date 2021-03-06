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
    
    public partial class HistoryRecord
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public HistoryRecord()
        {
            this.Doses = new HashSet<Dose>();
            this.Diseases = new HashSet<Disease>();
            this.Symptoms = new HashSet<Symptom>();
        }
    
        public long ID { get; set; }
        public System.DateTime Date { get; set; }
        public string Remarks { get; set; }
        public Nullable<bool> IsRead { get; set; }
        public long CitizenID { get; set; }
        public Nullable<long> MedicalPlaceID { get; set; }
        public long SpecialistID { get; set; }
    
        public virtual Citizen Citizen { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Dose> Doses { get; set; }
        public virtual MedicalPlace MedicalPlace { get; set; }
        public virtual Specialist Specialist { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Disease> Diseases { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Symptom> Symptoms { get; set; }
    }
}
