report 33000010 "Pay Grade"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './Pay Grade.rdlc';

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
            column(Pay_Grade__TABLECAPTION___________EmpFilter; "Pay Grade".TABLECAPTION + ' : ' + EmpFilter)
            {
            }
            column(Pay_Grade__Designation_Code_; "Designation Code")
            {
            }
            column(Pay_Grade_Description; Description)
            {
            }
            column(Pay_Grade__Bonus___; "Bonus %")
            {
            }
            column(Pay_Grade__OT_Times_; "OT Times")
            {
            }
            column(Pay_Grade__No_of_Employee_; "No of Employee")
            {
            }
            column(Grade_ListCaption; Grade_ListCaptionLbl)
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
            column(Pay_Grade__Bonus___Caption; FIELDCAPTION("Bonus %"))
            {
            }
            column(Pay_Grade__OT_Times_Caption; FIELDCAPTION("OT Times"))
            {
            }
            column(Pay_Grade__No_of_Employee_Caption; FIELDCAPTION("No of Employee"))
            {
            }
            column(SNo_Caption; SNo_CaptionLbl)
            {
            }
            column(Pay_Element_CodeCaption; Pay_Element_CodeCaptionLbl)
            {
            }
            column(Pay_Grade_Line_DescriptionCaption; "Pay Grade Line".FIELDCAPTION(Description))
            {
            }
            column(Pay_Grade_Line_TypeCaption; "Pay Grade Line".FIELDCAPTION(Type))
            {
            }
            column(Pay_Grade_Line__Paid_Category_Caption; "Pay Grade Line".FIELDCAPTION("Paid Category"))
            {
            }
            column(Pay_Grade_Line_AmountCaption; "Pay Grade Line".FIELDCAPTION(Amount))
            {
            }
            column(Yearly_AmountCaption; Yearly_AmountCaptionLbl)
            {
            }
            dataitem("Pay Grade Line"; "Pay Grade Line")
            {
                DataItemLink = Pay Designation=FIELD(Designation Code);
                DataItemTableView = SORTING(Pay Element Code, Pay Designation) ORDER(Ascending);
                column(Pay_Grade_Line__Pay_Element_Code_; "Pay Element Code")
                {
                }
                column(Pay_Grade_Line_Description; Description)
                {
                }
                column(Pay_Grade_Line_Type; Type)
                {
                }
                column(Pay_Grade_Line__Paid_Category_; "Paid Category")
                {
                }
                column(Pay_Grade_Line_Amount; Amount)
                {
                }
                column(Sno; Sno)
                {
                }
                column(YearlyAmount; YearlyAmount)
                {
                }
                column(TotalAmount; TotalAmount)
                {
                }
                column(Yearly_Amount_TotalCaption; Yearly_Amount_TotalCaptionLbl)
                {
                }
                column(Pay_Grade_Line_Pay_Designation; "Pay Designation")
                {
                }

                trigger OnPreDataItem();
                begin
                    "Pay Grade Line".SETFILTER("Pay Grade Line"."Paid Category", '<> 0');
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
        EmpFilter := "Pay Grade".GETFILTERS;
    end;

    var
        Sno: Integer;
        YearlyAmount: Decimal;
        TotalAmount: Decimal;
        EmpFilter: Text[250];
        Grade_ListCaptionLbl: Label 'Grade List';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        SNo_CaptionLbl: Label 'SNo.';
        Pay_Element_CodeCaptionLbl: Label 'Pay Element Code';
        Yearly_AmountCaptionLbl: Label 'Yearly Amount';
        Yearly_Amount_TotalCaptionLbl: Label 'Yearly Amount Total';
}

