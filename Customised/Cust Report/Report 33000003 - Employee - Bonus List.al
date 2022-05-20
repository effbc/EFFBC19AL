report 33000003 "Employee - Bonus List"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './Employee - Bonus List.rdlc';

    dataset
    {
        dataitem(Employee;Employee)
        {
            DataItemTableView = SORTING(No.);
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";
            column(FORMAT_TODAY_0_4_;FORMAT(TODAY,0,4))
            {
            }
            column(COMPANYNAME;COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO;CurrReport.PAGENO)
            {
            }
            column(USERID;USERID)
            {
            }
            column(Employee_TABLECAPTION___________EmpFilter;Employee.TABLECAPTION + ' : ' + EmpFilter)
            {
            }
            column(ShowOnHeader;ShowOnHeader)
            {
            }
            column(Employee__No__;"No.")
            {
            }
            column(sno;sno)
            {
            }
            column(EmpValue;EmpValue)
            {
            }
            column(AllTotalStr;AllTotalStr)
            {
            }
            column(ShowOnDetailLine;ShowOnDetailLine)
            {
            }
            column(ShowOnFooter;ShowOnFooter)
            {
            }
            column(Employee___Bonus_ListCaption;Employee___Bonus_ListCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Employee_CodeCaption;Employee_CodeCaptionLbl)
            {
            }
            column(Sl__No_Caption;Sl__No_CaptionLbl)
            {
            }
            column(NameCaption;NameCaptionLbl)
            {
            }
            column(TotalCaption;TotalCaptionLbl)
            {
            }
            column(TotalCaption_Control1000000023;TotalCaption_Control1000000023Lbl)
            {
            }
            dataitem("Pay Employee Pay Details";"Pay Employee Pay Details")
            {
                DataItemLink = Employee No=FIELD(No.);
                DataItemTableView = SORTING(Year,Month,Employee No,Pay Element Code,ForMonthDate);

                trigger OnPreDataItem();
                begin
                    "Pay Employee Pay Details".RESET;
                    "Pay Employee Pay Details".SETRANGE("Pay Employee Pay Details"."Employee No",Employee."No.");
                    "Pay Employee Pay Details".SETRANGE("Pay Employee Pay Details".PayRollMonthDate,BonusYearStDate,BonusYearEndDate);
                    "Pay Employee Pay Details".SETFILTER("Pay Employee Pay Details"."Bonus %",'> %1',0);
                end;
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

    trigger OnPreReport();
    begin
        IF BonusYearId=0 THEN
          ERROR(Tex0001);
        EmpFilter:= Employee.GETFILTERS;
    end;

    var
        sno : Integer;
        PrintEmpNo : Boolean;
        EmpValue : Text[200];
        RvEmpDetails : Record "Pay Employee Pay Details";
        Bonus : Decimal;
        Exgratia : Decimal;
        ExExgratia : Decimal;
        BonusChk : Boolean;
        ExGratiachk : Boolean;
        ExExGratiaChk : Boolean;
        BonusYearId : Integer;
        BonusYearStDate : Date;
        BonusYearEndDate : Date;
        BonusYear : Record "Pay Year";
        BonusTotal : Decimal;
        ExGratiaTotal : Decimal;
        ExExGratiaTotal : Decimal;
        AllTotal : Decimal;
        ShowOnDetailLine : Text[100];
        ShowOnHeader : Text[100];
        ShowOnFooter : Text[100];
        Tex0001 : Label 'Please Choose a Bonus Year.';
        AllTotalStr : Text[100];
        EmpFilter : Text[250];
        Employee___Bonus_ListCaptionLbl : Label 'Employee - Bonus List';
        CurrReport_PAGENOCaptionLbl : Label 'Page';
        Employee_CodeCaptionLbl : Label 'Employee Code';
        Sl__No_CaptionLbl : Label 'Sl. No.';
        NameCaptionLbl : Label 'Name';
        TotalCaptionLbl : Label 'Total';
        TotalCaption_Control1000000023Lbl : Label 'Total';
}

