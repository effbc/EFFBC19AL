report 33000026 "Pay Employee Branch Overview"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './Pay Employee Branch Overview.rdlc';

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = SORTING(No.);
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            column(USERID; USERID)
            {
            }
            column(Employee__No__; "No.")
            {
            }
            column(Employee__Job_Title_Grade_; "Job Title/Grade")
            {
            }
            column(Employee__Department_Code_; "Department Code")
            {
            }
            column(FullEmpName; FullEmpName)
            {
            }
            column(Pay_Employees_Branch_OverviewCaption; Pay_Employees_Branch_OverviewCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Employee__No__Caption; FIELDCAPTION("No."))
            {
            }
            column(Employee__Job_Title_Grade_Caption; FIELDCAPTION("Job Title/Grade"))
            {
            }
            column(Employee__Department_Code_Caption; FIELDCAPTION("Department Code"))
            {
            }
            column(DateCaption; DateCaptionLbl)
            {
            }
            column(BranchCaption; BranchCaptionLbl)
            {
            }
            column(NameCaption; NameCaptionLbl)
            {
            }
            dataitem("Pay Employee Branch"; "Pay Employee Branch")
            {
                DataItemLink = Employee Code=FIELD(No.);
                DataItemTableView = SORTING(Employee Code, Branch Code, Effective Date of Transfer);
                column(Pay_Employee_Branch__Effective_Date_of_Transfer_; "Effective Date of Transfer")
                {
                }
                column(BranchName; BranchName)
                {
                }
                column(Pay_Employee_Branch_Employee_Code; "Employee Code")
                {
                }
                column(Pay_Employee_Branch_Branch_Code; "Branch Code")
                {
                }
                dataitem("Pay Branch Policy"; "Pay Branch Policy")
                {
                    DataItemLink = Branch Code=FIELD(Branch Code);
                    DataItemTableView = SORTING(LineNo, Branch Code);
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

    var
        BranchName: Text[30];
        BranchRec: Record "Pay Branch Policy";
        FullEmpName: Text[30];
        EmpRec: Record Employee;
        Pay_Employees_Branch_OverviewCaptionLbl: Label 'Pay Employees Branch Overview';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        DateCaptionLbl: Label 'Date';
        BranchCaptionLbl: Label 'Branch';
        NameCaptionLbl: Label 'Name';
}

