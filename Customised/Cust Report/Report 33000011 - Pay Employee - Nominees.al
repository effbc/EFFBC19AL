report 33000011 "Pay Employee - Nominees"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './Pay Employee - Nominees.rdlc';

    dataset
    {
        dataitem(Employee;Employee)
        {
            DataItemTableView = SORTING(No.);
            RequestFilterFields = "No.","Job Title/Grade","Department Code";
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
            column(Employee__No__;"No.")
            {
            }
            column(Name;Name)
            {
            }
            column(Employee___NomineesCaption;Employee___NomineesCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(NameCaption;NameCaptionLbl)
            {
            }
            column(Employee_CodeCaption;Employee_CodeCaptionLbl)
            {
            }
            column(Pay_Employee_Nominee__Nominee_Name_Caption;"Pay Employee Nominee".FIELDCAPTION("Nominee Name"))
            {
            }
            column(Pay_Employee_Nominee__Nominee_DOB_Caption;"Pay Employee Nominee".FIELDCAPTION("Nominee DOB"))
            {
            }
            column(Pay_Employee_Nominee__Nominee_Relation_Caption;"Pay Employee Nominee".FIELDCAPTION("Nominee Relation"))
            {
            }
            column(Pay_Employee_Nominee__Nominee_Dependent_Caption;"Pay Employee Nominee".FIELDCAPTION("Nominee Dependent"))
            {
            }
            column(Nominee_AddressCaption;Nominee_AddressCaptionLbl)
            {
            }
            column(Pay_Employee_Nominee__Nominee_PF_Share_Percent_Caption;"Pay Employee Nominee".FIELDCAPTION("Nominee PF Share Percent"))
            {
            }
            column(SNoCaption;SNoCaptionLbl)
            {
            }
            dataitem("Pay Employee Nominee";"Pay Employee Nominee")
            {
                DataItemLink = Employee No=FIELD(No.);
                column(Pay_Employee_Nominee__Nominee_PF_Share_Percent_;"Nominee PF Share Percent")
                {
                }
                column(Pay_Employee_Nominee__Nominee_Name_;"Nominee Name")
                {
                }
                column(Pay_Employee_Nominee__Nominee_DOB_;"Nominee DOB")
                {
                }
                column(Pay_Employee_Nominee__Nominee_Relation_;"Nominee Relation")
                {
                }
                column(Pay_Employee_Nominee__Nominee_Dependent_;"Nominee Dependent")
                {
                }
                column(Address;Address)
                {
                }
                column(SNo;SNo)
                {
                }
                column(Pay_Employee_Nominee_Employee_No;"Employee No")
                {
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

    trigger OnPreReport();
    begin
        EmpFilter := Employee.GETFILTERS;
    end;

    var
        Name : Text[50];
        Address : Text[200];
        SNo : Integer;
        EmpFilter : Text[250];
        Employee___NomineesCaptionLbl : Label 'Employee - Nominees';
        CurrReport_PAGENOCaptionLbl : Label 'Page';
        NameCaptionLbl : Label 'Name';
        Employee_CodeCaptionLbl : Label 'Employee Code';
        Nominee_AddressCaptionLbl : Label 'Nominee Address';
        SNoCaptionLbl : Label 'SNo';
}

