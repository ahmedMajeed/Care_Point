
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
    
public partial class Attachment
{

    public long ID { get; set; }

    public long TypeID { get; set; }

    public System.DateTime Date { get; set; }

    public Nullable<bool> IsRead { get; set; }

    public long SpecialistID { get; set; }

    public long CitizenID { get; set; }

    public string FilePath { get; set; }

    public string FileName { get; set; }



    public virtual AttachmentType AttachmentType { get; set; }

    public virtual Citizen Citizen { get; set; }

    public virtual Specialist Specialist { get; set; }

}

}
