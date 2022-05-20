report 33000006 "Pay Employee Salary Overview"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './Pay Employee Salary Overview.rdlc';

    dataset
    {
        dataitem("Pay Elements";"Pay Elements")
        {
            DataItemTableView = SORTING(Code);
            RequestFilterFields = "Employee No Filter","Grade Filter","Branch Filter";
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
            column(Pay_Elements__TABLECAPTION___________FilterString;"Pay Elements".TABLECAPTION + ' : ' + FilterString)
            {
            }
            column(Month_____FORMAT_MonthList_____Year_______FORMAT_Year_;'Month : '+FORMAT(MonthList) + 'Year : ' + FORMAT(Year))
            {
            }
            column(Pay_Elements_Code;Code)
            {
            }
            column(Pay_Elements_Description;Description)
            {
            }
            column(Pay_Elements_PayablePEPD;PayablePEPD)
            {
            }
            column(SNO;SNO)
            {
            }
            column(Pay_ElementsCaption;Pay_ElementsCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(PayableCaption;PayableCaptionLbl)
            {
            }
            column(Pay_Elements_DescriptionCaption;FIELDCAPTION(Description))
            {
            }
            column(Pay_Element_CodeCaption;Pay_Element_CodeCaptionLbl)
            {
            }
            column(Srl__No_Caption;Srl__No_CaptionLbl)
            {
            }

            trigger OnAfterGetRecord();
            begin
                "Pay Elements".CALCFIELDS(PayablePEPD);
            end;

            trigger OnPreDataItem();
            begin
                IF MonthList +1 >12 THEN
                  STDate :=DMY2DATE(1,1,Year)
                ELSE
                  STDate :=DMY2DATE(1,MonthList+1,Year);

                IF MonthList +2 >12 THEN
                  EndDate :=(DMY2DATE(1,1,Year))-1
                ELSE
                  EndDate :=(DMY2DATE(1,MonthList+2,Year))-1;

                "Pay Elements".SETRANGE("Pay Elements"."Date Filter",STDate,EndDate);
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
        MonthList :=DATE2DMY(WORKDATE,2)-1;
        Year :=DATE2DMY(WORKDATE,3);
    end;

    trigger OnPreReport();
    begin
        IF Year <= 0 THEN ERROR(Text001);
        FilterString := "Pay Elements".GETFILTERS;
    end;

    var
        MonthList : Option January,Februrary,March,April,May,June,July,August,September,October,November,December;
        Year : Integer;
        SNO : Integer;
        STDate : Date;
        EndDate : Date;
        FilterString : Text[250];
        Text001 : Label 'Required appropriate Year.';
        Pay_ElementsCaptionLbl : Label 'Pay Elements';
        CurrReport_PAGENOCaptionLbl : Label 'Page';
        PayableCaptionLbl : Label 'Payable';
        Pay_Element_CodeCaptionLbl : Label 'Pay Element Code';
        Srl__No_CaptionLbl : Label 'Srl. No.';
}

