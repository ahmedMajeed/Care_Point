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
    
    public partial class MedicineActiveIngredient
    {
        public long MedicineID { get; set; }
        public long ActiveIngredientID { get; set; }
        public double Concentration { get; set; }
    
        public virtual ActiveIngredient ActiveIngredient { get; set; }
        public virtual Medicine Medicine { get; set; }
    }
}
