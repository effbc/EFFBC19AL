report 50202 "BG Expired Details"
{
    DefaultLayout = RDLC;
    RDLCLayout = './BG Expired Details.rdlc';

    dataset
    {
        dataitem("Bank Guarantee"; "Bank Guarantee")
        {
            DataItemTableView = SORTING(BG No.) ORDER(Ascending) WHERE(Status = CONST(Open));
            column(Bank_Guarantee__BG_No__; "BG No.")
            {
            }
            column(Bank_Guarantee__Customer_Order_No__; "Customer Order No.")
            {
            }
            column(Bank_Guarantee__BG_Value_; "BG Value")
            {
            }
            column(Bank_Guarantee__Expiry_Date_; "Expiry Date")
            {
            }
            column(Bank_Guarantee__Claim_Date_; "Claim Date")
            {
            }
            column(Bank_Guarantee__BG_No__Caption; FIELDCAPTION("BG No."))
            {
            }
            column(Bank_Guarantee__Customer_Order_No__Caption; FIELDCAPTION("Customer Order No."))
            {
            }
            column(Bank_Guarantee__BG_Value_Caption; FIELDCAPTION("BG Value"))
            {
            }
            column(Bank_Guarantee__Expiry_Date_Caption; FIELDCAPTION("Expiry Date"))
            {
            }
            column(Bank_Guarantee__Claim_Date_Caption; FIELDCAPTION("Claim Date"))
            {
            }

            trigger OnPreDataItem();
            begin
                //"Bank Guarantee".SETFILTER("Bank Guarantee"."Expiry Date",'<%1',TODAY+10);
                //"Bank Guarantee".SETFILTER("Bank Guarantee"."Claim Date",'<%1',TODAY+10);
            end;
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

