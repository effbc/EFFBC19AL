pageextension 70030 CompanyInformationExt extends "Company Information"
{
    layout
    {
        addafter("Home Page")
        {
            field("Phone No. 2"; "Phone No. 2")
            {
            }
        }
        addbefore("VAT Registration No.")
        {
            field("Composition2"; Composition)
            {
            }
            field("C.S.T.Date"; "C.S.T.Date")
            {
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
                }
                field("Insurance Policy Name"; "Insurance Policy Name")
                {
                }
            }
        }
    }
    actions
    {

    }

}

