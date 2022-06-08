report 33000009 "Pay Sensitivity"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './Pay Sensitivity.rdlc';

    dataset
    {
        dataitem("Pay Grade"; "Pay Grade")
        {
            DataItemTableView = SORTING(Designation Code);
            RequestFilterFields = "Designation Code";
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
            column(Pay_Grade__Designation_Code_; "Designation Code")
            {
            }
            column(Pay_Grade_Description; Description)
            {
            }
            column(Pay_Grade__Av__Cost_Per_Employee_; "Av. Cost Per Employee")
            {
            }
            column(Pay_Grade__Av__Projected_Cost_Per_Employe_; "Av. Projected Cost Per Employe")
            {
            }
            column(Pay_Grade__Current_Cost_; "Current Cost")
            {
            }
            column(Pay_Grade__Projected_Cost_; "Projected Cost")
            {
            }
            column(CompCurrentCost; CompCurrentCost)
            {
            }
            column(NetImpact; NetImpact)
            {
            }
            column(CompProjectedCost; CompProjectedCost)
            {
            }
            column(Net__; "Net%")
            {
            }
            column(Grade_Sensitivity_AnalysisCaption; Grade_Sensitivity_AnalysisCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Pay_Grade__Designation_Code_Caption; FIELDCAPTION("Designation Code"))
            {
            }
            column(Pay_Grade_DescriptionCaption; FIELDCAPTION(Description))
            {
            }
            column(Pay_Grade__Av__Cost_Per_Employee_Caption; FIELDCAPTION("Av. Cost Per Employee"))
            {
            }
            column(Pay_Grade__Av__Projected_Cost_Per_Employe_Caption; FIELDCAPTION("Av. Projected Cost Per Employe"))
            {
            }
            column(Pay_Grade__Current_Cost_Caption; FIELDCAPTION("Current Cost"))
            {
            }
            column(Pay_Grade__Projected_Cost_Caption; FIELDCAPTION("Projected Cost"))
            {
            }
            column(Comp_Current_CostCaption; Comp_Current_CostCaptionLbl)
            {
            }
            column(Comp_Projected_CostCaption; Comp_Projected_CostCaptionLbl)
            {
            }
            column(Net_ImpactCaption; Net_ImpactCaptionLbl)
            {
            }
            column(Net_Diff__In___Caption; Net_Diff__In___CaptionLbl)
            {
            }

            trigger OnAfterGetRecord();
            begin
                PayPayrollEmployee.RESET;
                PayPayrollEmployee.SETRANGE("Leave Date", 0D);
                PayPayrollEmployee.SETFILTER(PayPayrollEmployee."Job Title/Grade", PayGrade."Designation Code");
                "Current Cost" := "Av. Cost Per Employee" * PayPayrollEmployee.COUNT;
                "Projected Cost" := "Av. Projected Cost Per Employe" * PayPayrollEmployee.COUNT;
                UpdateCompanyCost;
            end;

            trigger OnPreDataItem();
            begin
                LastFieldNo := FIELDNO("Designation Code");

                PayPayrollEmployee.RESET;
                PayPayrollEmployee.SETRANGE("Leave Date", 0D);
                PayPayrollEmployee.SETFILTER(PayPayrollEmployee."Job Title/Grade", PayGrade."Designation Code");
                "Current Cost" := "Av. Cost Per Employee" * PayPayrollEmployee.COUNT;
                "Projected Cost" := "Av. Projected Cost Per Employe" * PayPayrollEmployee.COUNT;
                UpdateCompanyCost;
                PayPayrollEmployee.SETFILTER(PayPayrollEmployee."Job Title/Grade", PayGrade."Designation Code");
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
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        CompCurrentCost: Decimal;
        CompProjectedCost: Decimal;
        NetImpact: Decimal;
        "Net%": Decimal;
        PayPayrollEmployee: Record Employee;
        PayGrade: Record "Pay Grade";
        Grade_Sensitivity_AnalysisCaptionLbl: Label 'Grade Sensitivity Analysis';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Comp_Current_CostCaptionLbl: Label 'Comp.Current Cost';
        Comp_Projected_CostCaptionLbl: Label 'Comp.Projected Cost';
        Net_ImpactCaptionLbl: Label 'Net Impact';
        Net_Diff__In___CaptionLbl: Label 'Net Diff( In %)';

    (20166)]
    procedure UpdateCompanyCost();
    begin
        CompProjectedCost := 0;
        CompCurrentCost := 0;
        NetImpact := 0;
        PayPayrollEmployee.RESET;
        PayPayrollEmployee.SETRANGE("Leave Date", 0D);
        PayGrade.RESET;
        IF PayGrade.FIND('-') THEN BEGIN
            REPEAT
                PayGrade.CALCFIELDS("Av. Cost Per Employee");
                PayGrade.CALCFIELDS("Av. Projected Cost Per Employe");
                CompProjectedCost := CompProjectedCost + PayGrade."Av. Projected Cost Per Employe" * PayPayrollEmployee.COUNT;
                CompCurrentCost := CompCurrentCost + PayGrade."Av. Cost Per Employee" * PayPayrollEmployee.COUNT;
            UNTIL PayGrade.NEXT = 0;
        END;
        NetImpact := CompProjectedCost - CompCurrentCost;
        //"Net%" := (NetImpact / (CompProjectedCost + CompCurrentCost)) * 100;
        "Net%" := (NetImpact / (CompCurrentCost)) * 100;
    end;
}

