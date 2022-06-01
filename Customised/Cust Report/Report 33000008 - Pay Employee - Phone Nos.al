report 33000008 "Pay Employee - Phone Nos"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './Pay Employee - Phone Nos.rdlc';

    dataset
    {
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "No.", "Phone No.", "Birth Date";
            column(USERID; USERID)
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(Employee_TABLECAPTION___________EmpFilter; Employee.TABLECAPTION + ' : ' + EmpFilter)
            {
            }
            column(Employee__No__; "No.")
            {
            }
            column(name; name)
            {
            }
            column(sno; sno)
            {
            }
            column(Employee__Phone_No__; "Phone No.")
            {
            }
            column(Employee__Mobile_Phone_No__; "Mobile Phone No.")
            {
            }
            column(Employee__E_Mail_; "E-Mail")
            {
            }
            column(Employee__Home_Page_; "Home Page")
            {
            }
            column(Employee_Extension; Extension)
            {
            }
            column(Employee___Phone_Nos_Caption; Employee___Phone_Nos_CaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(S_No_Caption; S_No_CaptionLbl)
            {
            }
            column(Employee_No_Caption; Employee_No_CaptionLbl)
            {
            }
            column(NameCaption; NameCaptionLbl)
            {
            }
            column(Phone_No_Caption; Phone_No_CaptionLbl)
            {
            }
            column(Employee_ExtensionCaption; FIELDCAPTION(Extension))
            {
            }
            column(Mobile_No_Caption; Mobile_No_CaptionLbl)
            {
            }
            column(E_MailCaption; E_MailCaptionLbl)
            {
            }
            column(Home_PageCaption; Home_PageCaptionLbl)
            {
            }

            trigger OnAfterGetRecord();
            begin
                sno := sno + 1;
                name := Employee.FullName;
            end;

            trigger OnPreDataItem();
            begin
                sno := 0;
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

    trigger OnPreReport();
    begin
        EmpFilter := Employee.GETFILTERS;
    end;

    var
        sno: Integer;
        name: Text[30];
        companyname1: Text[30];
        Address1: Text[30];
        Address2: Text[30];
        City: Text[30];
        company: Record "Company Information";
        EmpFilter: Text[250];
        Employee___Phone_Nos_CaptionLbl: TextConst ENU = 'Employee - Phone Nos.', ENG = 'List of Employee Phone No.s / EMail Addresses';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        S_No_CaptionLbl: Label 'S.No.';
        Employee_No_CaptionLbl: TextConst ENU = 'Employee No.', ENG = 'Code';
        NameCaptionLbl: Label 'Name';
        Phone_No_CaptionLbl: Label 'Phone No.';
        Mobile_No_CaptionLbl: Label 'Mobile No.';
        E_MailCaptionLbl: Label 'E-Mail';
        Home_PageCaptionLbl: Label 'Home Page';
}

