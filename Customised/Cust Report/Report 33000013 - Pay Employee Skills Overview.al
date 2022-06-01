report 33000013 "Pay Employee Skills Overview"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './Pay Employee Skills Overview.rdlc';

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = SORTING(No.);
            RequestFilterFields = "No.";
            column(Employee__No__; "No.")
            {
            }
            column(Employee__No___Control1000000020; "No.")
            {
            }
            column(Employee__Department_Code_; "Department Code")
            {
            }
            column(Employee__Job_Title_Grade_; "Job Title/Grade")
            {
            }
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
            column(SNoCaption; SNoCaptionLbl)
            {
            }
            column(Skill_CodeCaption; Skill_CodeCaptionLbl)
            {
            }
            column(Skill_DescriptionCaption; Skill_DescriptionCaptionLbl)
            {
            }
            column(NameCaption; NameCaptionLbl)
            {
            }
            column(DepartmentCaption; DepartmentCaptionLbl)
            {
            }
            column(Employee_NoCaption; Employee_NoCaptionLbl)
            {
            }
            column(GradeCaption; GradeCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Employees_Skill_OverviewCaption; Employees_Skill_OverviewCaptionLbl)
            {
            }
            dataitem("Pay Employee Skill"; "Pay Employee Skill")
            {
                DataItemLink = EmployeeNo = FIELD(No.);
                DataItemTableView = SORTING(EmployeeNo, Skill Code, Line No.);
                column(SNo; SNo)
                {
                }
                column(Pay_Employee_Skill__Skill_Code_; "Skill Code")
                {
                }
                column(Pay_Employee_Skill__Skill_Name_; "Skill Name")
                {
                }
                column(Pay_Employee_Skill_EmployeeNo; EmployeeNo)
                {
                }
                column(Pay_Employee_Skill_Line_No_; "Line No.")
                {
                }

                trigger OnPreDataItem();
                begin
                    "Pay Employee Skill".RESET;
                    "Pay Employee Skill".SETRANGE("Pay Employee Skill".EmployeeNo, Employee."No.");
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
        SNo: Integer;
        RVQualification: Record Qualification;
        QualificationDescription: Text[50];
        SNoCaptionLbl: Label 'SNo';
        Skill_CodeCaptionLbl: Label 'Skill Code';
        Skill_DescriptionCaptionLbl: Label 'Skill Description';
        NameCaptionLbl: Label 'Name';
        DepartmentCaptionLbl: Label 'Department';
        Employee_NoCaptionLbl: Label 'Employee No';
        GradeCaptionLbl: Label 'Grade';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Employees_Skill_OverviewCaptionLbl: Label 'Employees Skill Overview';
}

