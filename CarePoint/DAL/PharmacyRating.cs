
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
    
public partial class PharmacyRating
{

    public long CitizenID { get; set; }

    public long PharmacyID { get; set; }

    public Nullable<int> Rating { get; set; }



    public virtual Citizen Citizen { get; set; }

    public virtual Pharmacy Pharmacy { get; set; }

}

}
