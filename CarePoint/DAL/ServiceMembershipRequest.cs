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
    
    public partial class ServiceMembershipRequest
    {
        public long SpecialistID { get; set; }
        public long ServiceID { get; set; }
        public System.DateTime RequestTime { get; set; }
        public bool IsConfirmed { get; set; }
    
        public virtual Specialist Specialist { get; set; }
        public virtual Service Service { get; set; }
    }
}
