pageextension 70030 CompanyInformationExt extends "Company Information"
{
    layout
    {
        addafter("Home Page")
        {
            field("Phone No. 2"; "Phone No. 2")
            {
                ApplicationArea = All;
            }
        }
        addbefore("VAT Registration No.")
        {
            field("Composition2"; Composition)
            {
                ApplicationArea = All;
            }
            field("C.S.T.Date"; "C.S.T.Date")
            {
                ApplicationArea = All;
            }
        }
        addafter("System Indicator Text")
        {
            group(Insurance)
            {
                CaptionML = ENU = 'Insurance',
                            ENN = 'Service Tax';
                field("Insurance Policy No."; "Insurance Policy No.")
                {
                    ApplicationArea = All;
                }
                field("Insurance Policy Name"; "Insurance Policy Name")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {

    }

}

