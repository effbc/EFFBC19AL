report 50178 Trans
{
    DefaultLayout = RDLC;
    RDLCLayout = './Trans.rdlc';

    dataset
    {
        dataitem("Gen. Journal Line";"Gen. Journal Line")
        {
            DataItemTableView = WHERE(Validate Posting=FILTER(Yes));
            RequestFilterFields = "Posting Date","Journal Batch Name";
            column(Gen__Journal_Line__Posting_Date_;"Posting Date")
            {
            }
            column(accname;accname)
            {
            }
            column(Gen__Journal_Line_Description;Description)
            {
            }
            column(Gen__Journal_Line_Amount;Amount)
            {
            }
            column(dimcode_1_;dimcode[1])
            {
            }
            column(dimensionvalue_1_;dimensionvalue[1])
            {
            }
            column(dimcode_2_;dimcode[2])
            {
            }
            column(dimcode_3_;dimcode[3])
            {
            }
            column(dimcode_4_;dimcode[4])
            {
            }
            column(dimcode_5_;dimcode[5])
            {
            }
            column(dimensionvalue_3_;dimensionvalue[3])
            {
            }
            column(dimensionvalue_2_;dimensionvalue[2])
            {
            }
            column(dimensionvalue_4_;dimensionvalue[4])
            {
            }
            column(dimensionvalue_5_;dimensionvalue[5])
            {
            }
            column(Gen__Journal_Line__Gen__Journal_Line___Document_No__;"Gen. Journal Line"."Document No.")
            {
            }
            column(Gen__Journal_Line__Gen__Journal_Line___Cheque_Date_;"Gen. Journal Line"."Cheque Date")
            {
            }
            column(Gen__Journal_Line__Gen__Journal_Line___Cheque_No__;"Gen. Journal Line"."Cheque No.")
            {
            }
            column(Posting_DateCaption;Posting_DateCaptionLbl)
            {
            }
            column(Account_No_Caption;Account_No_CaptionLbl)
            {
            }
            column(DescriptionCaption;DescriptionCaptionLbl)
            {
            }
            column(AmountCaption;AmountCaptionLbl)
            {
            }
            column(Dimension_CodeCaption;Dimension_CodeCaptionLbl)
            {
            }
            column(Dimension_ValueCaption;Dimension_ValueCaptionLbl)
            {
            }
            column(Document_No_Caption;Document_No_CaptionLbl)
            {
            }
            column(Cheq_DateCaption;Cheq_DateCaptionLbl)
            {
            }
            column(Cheq_NoCaption;Cheq_NoCaptionLbl)
            {
            }
            column(Gen__Journal_Line_Journal_Template_Name;"Journal Template Name")
            {
            }
            column(Gen__Journal_Line_Journal_Batch_Name;"Journal Batch Name")
            {
            }
            column(Gen__Journal_Line_Line_No_;"Line No.")
            {
            }

            trigger OnPreDataItem();
            begin
                  i:=0;
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
        lastentryno : Integer;
        preentryno : Integer;
        dimensionvalue : array [15] of Text[50];
        dimcode : array [15] of Text[50];
        i : Integer;
        "g/lacc" : Record "G/L Account";
        accname : Text[50];
        GJL : Record "Gen. Journal Line";
        bank : Record "Bank Account";
        cust : Record Customer;
        vend : Record Vendor;
        preno : Code[50];
        sno : Integer;
        user : Record User;
        Posting_DateCaptionLbl : Label 'Posting Date';
        Account_No_CaptionLbl : Label 'Account No.';
        DescriptionCaptionLbl : Label 'Description';
        AmountCaptionLbl : Label 'Amount';
        Dimension_CodeCaptionLbl : Label 'Dimension Code';
        Dimension_ValueCaptionLbl : Label 'Dimension Value';
        Document_No_CaptionLbl : Label 'Document No.';
        Cheq_DateCaptionLbl : Label 'Cheq Date';
        Cheq_NoCaptionLbl : Label 'Cheq No';
}

