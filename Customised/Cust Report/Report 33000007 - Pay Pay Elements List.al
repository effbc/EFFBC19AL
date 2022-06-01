report 33000007 "Pay Pay Elements List"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './Pay Pay Elements List.rdlc';

    dataset
    {
        dataitem("Pay Elements"; "Pay Elements")
        {
            RequestFilterFields = "Code", "Paid Category";
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
            column(Pay_Elements__TABLECAPTION___________EmpFilter; "Pay Elements".TABLECAPTION + ' : ' + EmpFilter)
            {
            }
            column(Pay_Elements_Code; Code)
            {
            }
            column(Pay_Elements__Paid_Category_; "Paid Category")
            {
            }
            column(Pay_Elements_Description; Description)
            {
            }
            column(Pay_Elements__Deduction_For_LWP_; "Deduction For LWP")
            {
            }
            column(Pay_Elements__Avail_During_Prob_; "Avail During Prob")
            {
            }
            column(Pay_Elements__GL_Code_; "GL Code")
            {
            }
            column(Pay_Elements__Calc__Depend_On_Heads_; "Calc. Depend On Heads")
            {
            }
            column(Pay_Elements__Included_In_Pay_Slip_; "Included In Pay Slip")
            {
            }
            column(Pay_Elements__Leave_Encashment_; "Leave Encashment")
            {
            }
            column(Pay_Elements_Overtime; Overtime)
            {
            }
            column(Pay_Elements_PF; PF)
            {
            }
            column(Pay_Elements_ESI; ESI)
            {
            }
            column(Pay_Elements_Bonus; Bonus)
            {
            }
            column(Pay_Elements_Amount; Amount)
            {
            }
            column(Srno; Srno)
            {
            }
            column(Pay_ElementsCaption; Pay_ElementsCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Pay_Elements_CodeCaption; FIELDCAPTION(Code))
            {
            }
            column(Pay_Elements__Paid_Category_Caption; FIELDCAPTION("Paid Category"))
            {
            }
            column(Pay_Elements_DescriptionCaption; FIELDCAPTION(Description))
            {
            }
            column(Pay_Elements__Deduction_For_LWP_Caption; FIELDCAPTION("Deduction For LWP"))
            {
            }
            column(Pay_Elements__Avail_During_Prob_Caption; FIELDCAPTION("Avail During Prob"))
            {
            }
            column(Pay_Elements__GL_Code_Caption; FIELDCAPTION("GL Code"))
            {
            }
            column(Pay_Elements__Calc__Depend_On_Heads_Caption; FIELDCAPTION("Calc. Depend On Heads"))
            {
            }
            column(Pay_Elements__Included_In_Pay_Slip_Caption; FIELDCAPTION("Included In Pay Slip"))
            {
            }
            column(Pay_Elements__Leave_Encashment_Caption; FIELDCAPTION("Leave Encashment"))
            {
            }
            column(Pay_Elements_OvertimeCaption; FIELDCAPTION(Overtime))
            {
            }
            column(Pay_Elements_PFCaption; FIELDCAPTION(PF))
            {
            }
            column(Pay_Elements_ESICaption; FIELDCAPTION(ESI))
            {
            }
            column(Pay_Elements_BonusCaption; FIELDCAPTION(Bonus))
            {
            }
            column(Pay_Elements_AmountCaption; FIELDCAPTION(Amount))
            {
            }
            column(S__No_Caption; S__No_CaptionLbl)
            {
            }
            column(Pay_Elements_Sorting_Order; "Sorting Order")
            {
            }

            trigger OnAfterGetRecord();
            begin
                Srno := Srno + 1;
            end;

            trigger OnPreDataItem();
            begin
                LastFieldNo := FIELDNO("Sorting Order");
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
        Srno := 0;
    end;

    trigger OnPreReport();
    begin
        EmpFilter := "Pay Elements".GETFILTERS;
    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        Srno: Integer;
        EmpFilter: Text[250];
        Pay_ElementsCaptionLbl: Label 'Pay Elements';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        S__No_CaptionLbl: TextConst ENU = 'S. No.', ENG = 'Sr no.';
}

