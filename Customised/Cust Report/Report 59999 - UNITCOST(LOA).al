report 59999 "UNITCOST(LOA)"
{
    DefaultLayout = RDLC;
    RDLCLayout = './UNITCOST(LOA).rdlc';

    dataset
    {
        dataitem("Sales Header";"Sales Header")
        {
            column(Sales_Header_Document_Type;"Document Type")
            {
            }
            column(Sales_Header_No_;"No.")
            {
            }
            dataitem("Sales Line";"Sales Line")
            {
                column(Sales_Line__Unitcost_LOA__;"Unitcost(LOA)")
                {
                }
                column(Sales_Line__Line_Amount_LOA__;"Line Amount(LOA)")
                {
                }
                column(Sales_Line__OutStanding_LOA__;"OutStanding(LOA)")
                {
                }
                column(Sales_Line__Unitcost_LOA__Caption;FIELDCAPTION("Unitcost(LOA)"))
                {
                }
                column(Sales_Line__Line_Amount_LOA__Caption;FIELDCAPTION("Line Amount(LOA)"))
                {
                }
                column(Sales_Line__OutStanding_LOA__Caption;FIELDCAPTION("OutStanding(LOA)"))
                {
                }
                column(Sales_Line_Document_Type;"Document Type")
                {
                }
                column(Sales_Line_Document_No_;"Document No.")
                {
                }
                column(Sales_Line_Line_No_;"Line No.")
                {
                }
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

