page 60159 "Calibration List Form"
{
    // version Cal1.0

    CardPageID = Calibration;
    Editable = false;
    PageType = List;
    SourceTable = Calibration;

    layout
    {
        area(content)
        {
            field("xRec.COUNT";xRec.COUNT)
            {
            }
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Equipment No";"Equipment No")
                {
                }
                field(Description;Description)
                {
                }
                field("IR No";"IR No")
                {
                }
                field("Item No";"Item No")
                {
                }
                field("Item Desc";"Item Desc")
                {
                }
                field("Lot No";"MFG. Serial No.")
                {
                }
                field("Purchase Date";"Purchase Date")
                {
                }
                field(Make;Manufacturer)
                {
                }
                field("Eqpt. Serial No.";"Eqpt. Serial No.")
                {
                }
                field("Last Calibration Date";"Last Calibration Date")
                {
                }
                field("Calibration Period";"Calibration Period")
                {
                }
                field("Posting Date";"Created Date")
                {
                }
                field("Next Calibration Due On";"Next Calibration Due On")
                {
                }
                field("Unit cost(LCY)";"Unit cost(LCY)")
                {
                }
                field("Model No.";"Model No.")
                {
                }
                field("Equipment Type";"Equipment Type")
                {
                }
                field(Classification;Classification)
                {
                }
                field(Remarks;Remarks)
                {
                }
                field("Delay Days";"Delay Days")
                {
                }
                field("Reason for Delay";"Reason for Delay")
                {
                }
                field("Master Item";"Master Item")
                {
                    Editable = false;
                }
                field("Owner of the Equpmnt";"Owner of the Equpmnt")
                {
                }
                field("Owner of the Equpmnt_Dept";"Owner of the Equpmnt_Dept")
                {
                }
                field("Owner of the Equipment name";"Owner of the Equpmnt_empid")
                {
                }
                field("Life time in Yrs";"Life time in Yrs")
                {
                }
                field(Transfered_from;Transfered_from)
                {
                }
                field("Created By";"Created By")
                {
                }
                field("Calibration Party";"Calibration Party")
                {
                }
            }
        }
    }

    actions
    {
    }
}

