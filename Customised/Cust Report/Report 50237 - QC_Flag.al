report 50237 QC_Flag
{
    // version Rev01,Eff02

    DefaultLayout = RDLC;
    RDLCLayout = './QC_Flag.rdlc';

    dataset
    {
        dataitem("Inspection Receipt Header"; "Inspection Receipt Header")
        {
            column(Inspection_Receipt_Header__Vendor_Name_; "Vendor Name")
            {
            }
            column(Inspection_Receipt_Header__Item_Description_; "Item Description")
            {
            }
            column(Inspection_Receipt_Header__Vendor_Name_Caption; FIELDCAPTION("Vendor Name"))
            {
            }
            column(Inspection_Receipt_Header__Item_Description_Caption; FIELDCAPTION("Item Description"))
            {
            }
            column(Inspection_Receipt_Header_No_; "No.")
            {
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }
}

