report 33000038 "Pay Monthly Confirmation"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './Pay Monthly Confirmation.rdlc';

    dataset
    {
        dataitem(Employee;Employee)
        {
            DataItemTableView = SORTING(No.);
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
            column(SNo;SNo)
            {
            }
            column(Employee_Title________Employee__First_Name_________Employee__Last_Name_;Employee.Title + ' ' +Employee."First Name" + ' '+ Employee."Last Name")
            {
            }
            column(Employee__Job_Title_Grade_;"Job Title/Grade")
            {
            }
            column(Employee__Department_Code_;"Department Code")
            {
            }
            column(Employee__Employment_Date_;"Employment Date")
            {
            }
            column(Employee__No_Of_Month_For_Confirmation_;"No Of Month For Confirmation")
            {
            }
            column(Employee_Monthly_Confirmation_ListCaption;Employee_Monthly_Confirmation_ListCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(NameCaption;NameCaptionLbl)
            {
            }
            column(GradeCaption;GradeCaptionLbl)
            {
            }
            column(SNo_Caption;SNo_CaptionLbl)
            {
            }
            column(Department_CodeCaption;Department_CodeCaptionLbl)
            {
            }
            column(Date_of_JoiningCaption;Date_of_JoiningCaptionLbl)
            {
            }
            column(Confirmation_Period_Months_Caption;Confirmation_Period_Months_CaptionLbl)
            {
            }
            column(Employee_No_;"No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                Employee.SETFILTER( Employee."Employment Date",'<> %1', 0D);
                MonthVar := FORMAT(Employee."No Of Month For Confirmation") +'M';
                IF ( (DATE2DMY(Employee."Employment Date",2) + Employee."No Of Month For Confirmation" )
                   <> MonthList +1)  THEN
                   CurrReport.SKIP
                ELSE

                  IF DATE2DMY(CALCDATE(MonthVar,Employee."Employment Date"),3) <> Year THEN
                  CurrReport.SKIP
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

    var
        SNo : Integer;
        MonthList : Option January,February,March,April,May,June,July,August,September,October,November,December;
        Year : Integer;
        MonthVar : Text[30];
        Employee_Monthly_Confirmation_ListCaptionLbl : Label 'Employee Monthly Confirmation List';
        CurrReport_PAGENOCaptionLbl : Label 'Page';
        NameCaptionLbl : Label 'Name';
        GradeCaptionLbl : Label 'Grade';
        SNo_CaptionLbl : Label 'SNo.';
        Department_CodeCaptionLbl : Label 'Department Code';
        Date_of_JoiningCaptionLbl : Label 'Date of Joining';
        Confirmation_Period_Months_CaptionLbl : Label 'Confirmation Period(Months)';
}

