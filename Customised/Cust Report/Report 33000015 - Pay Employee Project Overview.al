report 33000015 "Pay Employee Project Overview"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './Pay Employee Project Overview.rdlc';

    dataset
    {
        dataitem(Employee;Employee)
        {
            DataItemTableView = SORTING(No.);
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
            column(Employee__No__;"No.")
            {
            }
            column(FullName;FullName)
            {
            }
            column(Employee__Job_Title_Grade_;"Job Title/Grade")
            {
            }
            column(Employee__Department_Code_;"Department Code")
            {
            }
            column(Employee_Project_OverviewCaption;Employee_Project_OverviewCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Employee__No__Caption;FIELDCAPTION("No."))
            {
            }
            column(NameCaption;NameCaptionLbl)
            {
            }
            column(GradeCaption;GradeCaptionLbl)
            {
            }
            column(DepartmentCaption;DepartmentCaptionLbl)
            {
            }
            column(Date_RangeCaption;Date_RangeCaptionLbl)
            {
            }
            column(SNoCaption;SNoCaptionLbl)
            {
            }
            column(Project_CodeCaption;Project_CodeCaptionLbl)
            {
            }
            column(Project_DescriptionCaption;Project_DescriptionCaptionLbl)
            {
            }
            column(Date_of_TransferCaption;Date_of_TransferCaptionLbl)
            {
            }
            dataitem("Pay Employee Project";"Pay Employee Project")
            {
                DataItemLink = Employee Code=FIELD(No.);
                DataItemTableView = SORTING(Employee Code);
                column(Pay_Employee_Project__Project_Code_;"Project Code")
                {
                }
                column(Pay_Employee_Project__Effective_Date_of_Transfer_;"Effective Date of Transfer")
                {
                }
                column(ProjectDescription;ProjectDescription)
                {
                }
                column(SNo;SNo)
                {
                }
                column(Pay_Employee_Project_Employee_Code;"Employee Code")
                {
                }

                trigger OnPreDataItem();
                begin
                    "Pay Employee Project".RESET;
                    "Pay Employee Project".SETRANGE("Pay Employee Project"."Employee Code",Employee."No.");
                    IF (DateFrom=0D) AND (DateTo<>0D ) THEN
                     "Pay Employee Project".SETFILTER("Pay Employee Project"."Effective Date of Transfer",'< 1%',DateTo)

                    ELSE IF (DateFrom<>0D) AND (DateTo=0D) THEN
                      "Pay Employee Project".SETRANGE("Pay Employee Project"."Effective Date of Transfer",DateFrom)
                    ELSE IF (DateFrom<>0D) AND (DateTo<>0D) THEN
                      "Pay Employee Project".SETRANGE("Pay Employee Project"."Effective Date of Transfer",DateFrom,DateTo)
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

    var
        PayCompanyPolicy : Record "Pay Company Policy";
        DimensionValue : Record "Dimension Value";
        ProjectDescription : Text[50];
        SNo : Integer;
        DateFrom : Date;
        DateTo : Date;
        Employee_Project_OverviewCaptionLbl : Label 'Employee Project Overview';
        CurrReport_PAGENOCaptionLbl : Label 'Page';
        NameCaptionLbl : Label 'Name';
        GradeCaptionLbl : Label 'Grade';
        DepartmentCaptionLbl : Label 'Department';
        Date_RangeCaptionLbl : Label 'Date Range';
        SNoCaptionLbl : Label 'SNo';
        Project_CodeCaptionLbl : Label 'Project Code';
        Project_DescriptionCaptionLbl : Label 'Project Description';
        Date_of_TransferCaptionLbl : Label 'Date of Transfer';
}

