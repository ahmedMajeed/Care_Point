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
    
    public partial class Notification
    {
        public long ID { get; set; }
        public string Text { get; set; }
        public System.DateTime Time { get; set; }
        public string Read { get; set; }
        public long CitizenID { get; set; }
    
        public virtual Citizen Citizen { get; set; }
    }
}
