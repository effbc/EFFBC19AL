report 33000055 "Pay Employees - Pay Elements"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './Pay Employees - Pay Elements.rdlc';

    dataset
    {
        dataitem(Employee;Employee)
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.","Job Title","Job Title/Grade","Department Code";
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
            column(Employee_TABLECAPTION__________EmployeesFilter;Employee.TABLECAPTION + ':' +  EmployeesFilter)
            {
            }
            column(Employee__Latest_Pay_Revision_Date_;"Latest Pay Revision Date")
            {
            }
            column(SlNo;SlNo)
            {
            }
            column(EmployeeName;EmployeeName)
            {
            }
            column(EmployeeJobTitle;EmployeeJobTitle)
            {
            }
            column(EmployeeDept;EmployeeDept)
            {
            }
            column(EmployeeGrade;EmployeeGrade)
            {
            }
            column(Employee___Pay_ElementsCaption;Employee___Pay_ElementsCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Employee_NameCaption;Employee_NameCaptionLbl)
            {
            }
            column(Employee__Latest_Pay_Revision_Date_Caption;FIELDCAPTION("Latest Pay Revision Date"))
            {
            }
            column(Sl__No_Caption;Sl__No_CaptionLbl)
            {
            }
            column(Job_TitleCaption;Job_TitleCaptionLbl)
            {
            }
            column(DepartmentCaption;DepartmentCaptionLbl)
            {
            }
            column(GradeCaption;GradeCaptionLbl)
            {
            }
            column(Employee_No_;"No.")
            {
            }
            dataitem("Pay Employee Elements";"Pay Employee Elements")
            {
                DataItemLink = Employee No=FIELD(No.);
                DataItemTableView = SORTING(Pay Structure Date,Sorting Order) ORDER(Ascending);
                RequestFilterFields = "Pay Element Code";
                column(Pay_Employee_Elements__TABLECAPTION_________PayEmpElementsFilter;"Pay Employee Elements".TABLECAPTION + ':' + PayEmpElementsFilter)
                {
                }
                column(Pay_Employee_Elements__Pay_Structure_Date_;"Pay Structure Date")
                {
                }
                column(PayEmployeeElement;PayEmployeeElement)
                {
                }
                column(Pay_Employee_Elements_Amount;Amount)
                {
                }
                column(Pay_Employee_Elements_Type;Type)
                {
                }
                column(CalcDependsOn;CalcDependsOn)
                {
                }
                column(Pay_Employee_Elements_Percent;Percent)
                {
                }
                column(Pay_Employee_Elements__Paid_Category_;"Paid Category")
                {
                }
                column(Pay_ElementCaption;Pay_ElementCaptionLbl)
                {
                }
                column(Pay_Employee_Elements_AmountCaption;FIELDCAPTION(Amount))
                {
                }
                column(Pay_Employee_Elements_TypeCaption;FIELDCAPTION(Type))
                {
                }
                column(EmptyStringCaption;EmptyStringCaptionLbl)
                {
                }
                column(Calc__depends_onCaption;Calc__depends_onCaptionLbl)
                {
                }
                column(Pay_Employee_Elements__Paid_Category_Caption;FIELDCAPTION("Paid Category"))
                {
                }
                column(Pay_Employee_Elements__Pay_Structure_Date_Caption;FIELDCAPTION("Pay Structure Date"))
                {
                }
                column(Pay_Employee_Elements_Employee_No;"Employee No")
                {
                }
                column(Pay_Employee_Elements_Pay_Element_Code;"Pay Element Code")
                {
                }
                column(Pay_Employee_Elements_Template_Name;"Template Name")
                {
                }
                column(Pay_Employee_Elements_Document_No;"Document No")
                {
                }

                trigger OnPreDataItem();
                begin
                    PayEmpElementsFilter := "Pay Employee Elements".GETFILTERS;
                    IF PayStructureDate <> 0D THEN
                     BEGIN
                       PayEmployeeElements.RESET;
                       PayEmployeeElements.SETCURRENTKEY("Employee No","Pay Structure Date");
                       PayEmployeeElements.SETFILTER("Employee No",Employee."No.");
                       PayEmployeeElements.SETFILTER("Pay Structure Date",'<=%1', PayStructureDate);
                       IF PayEmployeeElements.FIND('+') THEN
                          "Pay Employee Elements".SETRANGE("Pay Structure Date", PayEmployeeElements."Pay Structure Date");
                     END
                end;
            }

            trigger OnPreDataItem();
            begin
                EmployeesFilter := Employee.GETFILTERS;
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
        SlNo := 0;
    end;

    var
        SlNo : Integer;
        EmployeeName : Text[100];
        JobTitles : Record "Job Titles";
        PayGrade : Record "Pay Grade";
        PayCompanyPolicy : Record "Pay Company Policy";
        DimensionValue : Record "Dimension Value";
        EmployeeJobTitle : Text[50];
        EmployeeDept : Text[50];
        EmployeeGrade : Text[50];
        PayStructureDate : Date;
        PayEmployeeElement : Text[100];
        PayElements : Record "Pay Elements";
        CalcDependsOn : Text[100];
        PayEmployeeElements : Record "Pay Employee Elements";
        EmployeesFilter : Text[100];
        PayEmpElementsFilter : Text[100];
        Employee___Pay_ElementsCaptionLbl : Label 'Employee - Pay Elements';
        CurrReport_PAGENOCaptionLbl : Label 'Page';
        Employee_NameCaptionLbl : Label 'Employee Name';
        Sl__No_CaptionLbl : Label 'Sl. No.';
        Job_TitleCaptionLbl : Label 'Job Title';
        DepartmentCaptionLbl : Label 'Department';
        GradeCaptionLbl : Label 'Grade';
        Pay_ElementCaptionLbl : Label 'Pay Element';
        EmptyStringCaptionLbl : Label '%';
        Calc__depends_onCaptionLbl : Label 'Calc. depends on';
}

