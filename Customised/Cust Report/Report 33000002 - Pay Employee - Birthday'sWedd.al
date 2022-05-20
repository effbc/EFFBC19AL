report 33000002 "Pay Employee - Birthday's/Wedd"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './Pay Employee - Birthday'sWedd.rdlc';

    dataset
    {
        dataitem(Employee;Employee)
        {
            RequestFilterFields = "No.","Phone No.","Birth Date";
            column(USERID;USERID)
            {
            }
            column(COMPANYNAME;COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO;CurrReport.PAGENO)
            {
            }
            column(FORMAT_TODAY_0_4_;FORMAT(TODAY,0,4))
            {
            }
            column(Employee_TABLECAPTION___________EmpFilter;Employee.TABLECAPTION + ' : ' + EmpFilter)
            {
            }
            column(EmpCaption;EmpCaption)
            {
            }
            column(sno;sno)
            {
            }
            column(FORMAT__Birth_Date__0_4_;FORMAT("Birth Date",0,4))
            {
            }
            column(Employee_Extension;Extension)
            {
            }
            column(FORMAT__Marriage_Date__0_4_;FORMAT("Marriage Date",0,4))
            {
            }
            column(EmpValue;EmpValue)
            {
            }
            column(Employee___Birthday_s__Weddings_Caption;Employee___Birthday_s__Weddings_CaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(S_No_Caption;S_No_CaptionLbl)
            {
            }
            column(Birthday_DateCaption;Birthday_DateCaptionLbl)
            {
            }
            column(Wedding_DateCaption;Wedding_DateCaptionLbl)
            {
            }
            column(Extension_No_Caption;Extension_No_CaptionLbl)
            {
            }
            column(Employee_No_;"No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF (DATE2DMY(Employee."Birth Date",2)<>month+1) AND
                  (DATE2DMY(Employee."Marriage Date",2)<>month+1)   THEN
                  CurrReport.SKIP
            end;

            trigger OnPreDataItem();
            begin
                Employee.SETFILTER(Employee."Birth Date",'<>%1',0D);
                Employee.SETFILTER("Marriage Date",'<>%1',0D);
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

    trigger OnInitReport();
    begin
        companytable.GET;
    end;

    trigger OnPreReport();
    begin
        filterby := Employee.GETFILTERS;
        EmpFilter := Employee.GETFILTERS;
    end;

    var
        sno : Integer;
        companyname1 : Text[30];
        Address1 : Text[30];
        Address2 : Text[30];
        City : Text[30];
        company : Record "Company Information";
        month : Option January,February,March,April,May,June,July,August,September,October,November,December;
        dt : Date;
        filterby : Text[250];
        companytable : Record "Company Information";
        MonthNo : Integer;
        PrintEmpNo : Boolean;
        EmpCaption : Text[100];
        EmpValue : Text[200];
        EmpFilter : Text[250];
        Employee___Birthday_s__Weddings_CaptionLbl : TextConst ENU='Employee - Birthday''s/ Weddings ',ENG='List of Employees'' Birthday/Wedding List';
        CurrReport_PAGENOCaptionLbl : Label 'Page';
        S_No_CaptionLbl : Label 'S.No.';
        Birthday_DateCaptionLbl : Label 'Birthday Date';
        Wedding_DateCaptionLbl : Label 'Wedding Date';
        Extension_No_CaptionLbl : Label 'Extension No.';
}

