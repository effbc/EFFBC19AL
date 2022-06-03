report 33000036 "Pay Grade Revision"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './Pay Grade Revision.rdlc';

    dataset
    {
        dataitem("Pay Grade Line"; "Pay Grade Line")
        {
            DataItemTableView = SORTING(Pay Element Code, Pay Designation);
            RequestFilterFields = "Pay Designation", "Pay Element Code";
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
            column(MEffectiveDate; MEffectiveDate)
            {
            }
            column(MStructureDate; MStructureDate)
            {
            }
            column(Pay_Grade_Line__Pay_Designation_; "Pay Designation")
            {
            }
            column(Pay_Grade_Line__Pay_Element_Code_; "Pay Element Code")
            {
            }
            column(Pay_Grade_Line_Description; Description)
            {
            }
            column(Pay_Grade_Line_Percent; Percent)
            {
            }
            column(Pay_Grade_Line_Amount; Amount)
            {
            }
            column(Pay_Grade_Line__Revised_Absolute_ND_; "Revised Absolute ND")
            {
            }
            column(Pay_Grade_Line__Revised_Percent_ND_; "Revised Percent ND")
            {
            }
            column(Pay_Grade_Line__Revised_Percent_Dep_; "Revised Percent Dep")
            {
            }
            column(Pay_Grade_Line__Revised_Amount_; "Revised Amount")
            {
            }
            column(Pay_Grade_RevisionCaption; Pay_Grade_RevisionCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Effective_DateCaption; Effective_DateCaptionLbl)
            {
            }
            column(Grade_Caption; Grade_CaptionLbl)
            {
            }
            column(Structure_Date_Caption; Structure_Date_CaptionLbl)
            {
            }
            column(Pay_ElementCaption; Pay_ElementCaptionLbl)
            {
            }
            column(Pay_Grade_Line_DescriptionCaption; FIELDCAPTION(Description))
            {
            }
            column(Pay_Grade_Line_PercentCaption; FIELDCAPTION(Percent))
            {
            }
            column(Pay_Grade_Line_AmountCaption; FIELDCAPTION(Amount))
            {
            }
            column(Non_Dependable__Revised___Caption; Non_Dependable__Revised___CaptionLbl)
            {
            }
            column(Revised_Absolute_Non_DependableCaption; Revised_Absolute_Non_DependableCaptionLbl)
            {
            }
            column(Revised_Percentage_DependableCaption; Revised_Percentage_DependableCaptionLbl)
            {
            }
            column(Pay_Grade_Line__Revised_Amount_Caption; FIELDCAPTION("Revised Amount"))
            {
            }

            trigger OnPreDataItem();
            begin
                //"Pay Grade Line".RESET;
                //"Pay Grade Line".SETRANGE("Pay Grade Line"."Pay Designation",MGradeCode);
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
        MGradeCode: Code[10];
        MStructureDate: Date;
        MEffectiveDate: Date;
        Pay_Grade_RevisionCaptionLbl: Label 'Pay Grade Revision';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Effective_DateCaptionLbl: Label 'Effective Date';
        Grade_CaptionLbl: Label '"Grade "';
        Structure_Date_CaptionLbl: Label '"Structure Date "';
        Pay_ElementCaptionLbl: Label 'Pay Element';
        Non_Dependable__Revised___CaptionLbl: Label 'Non Dependable (Revised %)';
        Revised_Absolute_Non_DependableCaptionLbl: Label 'Revised Absolute Non Dependable';
        Revised_Percentage_DependableCaptionLbl: Label 'Revised Percentage Dependable';

    [LineStart(20444)]
    procedure TakeGradeCode(GradeCode: Code[10]; StructureDate: Date; EffectiveDate: Date);
    begin
        MGradeCode := GradeCode;
        MStructureDate := StructureDate;
        MEffectiveDate := EffectiveDate;
    end;
}

