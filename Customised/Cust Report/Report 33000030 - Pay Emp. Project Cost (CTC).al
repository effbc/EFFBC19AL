report 33000030 "Pay Emp. Project Cost (CTC)"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './Pay Emp. Project Cost (CTC).rdlc';

    dataset
    {
        dataitem("Pay Employee Project Cost";"Pay Employee Project Cost")
        {
            DataItemTableView = SORTING(Employee No.,Project Code,OnDate);
            RequestFilterFields = "Employee No.";
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
            column(Pay_Employee_Project_Cost__Employee_No__;"Employee No.")
            {
            }
            column(EmployeeName;EmployeeName)
            {
            }
            column(Pay_Employee_Project_Cost__Project_Code_;"Project Code")
            {
            }
            column(Pay_Employee_Project_Cost_OnDate;OnDate)
            {
            }
            column(Pay_Employee_Project_Cost__CTC_Hourly_Amount_;"CTC Hourly Amount")
            {
            }
            column(Pay_Employee_Project_Cost__CTC_Rate_Basis_Caption;Pay_Employee_Project_Cost__CTC_Rate_Basis_CaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Pay_Employee_Project_Cost__Employee_No__Caption;FIELDCAPTION("Employee No."))
            {
            }
            column(Pay_Employee_Project_Cost_OnDateCaption;FIELDCAPTION(OnDate))
            {
            }
            column(Pay_Employee_Project_Cost__Project_Code_Caption;FIELDCAPTION("Project Code"))
            {
            }
            column(Pay_Employee_Project_Cost__CTC_Hourly_Amount_Caption;FIELDCAPTION("CTC Hourly Amount"))
            {
            }

            trigger OnPreDataItem();
            begin
                LastFieldNo := FIELDNO("Employee No.");
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

    var
        LastFieldNo : Integer;
        FooterPrinted : Boolean;
        EmployeeName : Text[50];
        PayPayrollEmployee : Record Employee;
        Pay_Employee_Project_Cost__CTC_Rate_Basis_CaptionLbl : Label 'Pay Employee Project Cost (CTC Rate Basis)';
        CurrReport_PAGENOCaptionLbl : Label 'Page';
}

