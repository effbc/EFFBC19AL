report 60003 "Vendor Day wise Balance"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Vendor Day wise Balance.rdlc';

    dataset
    {
        dataitem(Vendor;Vendor)
        {
            DataItemTableView = SORTING(Search Name) ORDER(Ascending) WHERE(Blocked=CONST(" "));
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";
            column(Vendor_No_;"No.")
            {
            }
            dataitem("Vendor Ledger Entry";"Vendor Ledger Entry")
            {
                CalcFields = Amount (LCY);
                DataItemLink = Vendor No.=FIELD(No.);
                DataItemTableView = SORTING(Vendor No.,Posting Date,Currency Code) ORDER(Ascending) WHERE(Posting Date=FILTER(04/01/09..03/31/2035));
                column(TODAY;TODAY)
                {
                }
                column(UPPERCASE_Vendor_Name_;UPPERCASE(Vendor.Name))
                {
                }
                column(Vendor_Ledger_Entry__Posting_Date_;"Posting Date")
                {
                }
                column(Debt_Amount;Debt_Amount)
                {
                    DecimalPlaces = 0:0;
                }
                column(ABS_Crdt_Amount_;ABS(Crdt_Amount))
                {
                    DecimalPlaces = 0:0;
                }
                column(Final_Bal;Final_Bal)
                {
                    DecimalPlaces = 0:0;
                }
                column(Narration;Narration)
                {
                }
                column(Vendor_Ledger_Entry__Posting_Date__Control1102154005;"Posting Date")
                {
                }
                column(Debt_Amount_Control1102154006;Debt_Amount)
                {
                    DecimalPlaces = 0:0;
                }
                column(ABS_Crdt_Amount__Control1102154007;ABS(Crdt_Amount))
                {
                    DecimalPlaces = 0:0;
                }
                column(Final_Bal_Control1102154008;Final_Bal)
                {
                    DecimalPlaces = 0:0;
                }
                column(Narration_Control1102154019;Narration)
                {
                }
                column(Vendor_Ledger_Entry__Posting_Date__Control1102154020;"Posting Date")
                {
                }
                column(Debt_Amount_Control1102154021;Debt_Amount)
                {
                    DecimalPlaces = 0:0;
                }
                column(ABS_Crdt_Amount__Control1102154022;ABS(Crdt_Amount))
                {
                    DecimalPlaces = 0:0;
                }
                column(Final_Bal_Control1102154023;Final_Bal)
                {
                    DecimalPlaces = 0:0;
                }
                column(Narration_Control1102154029;Narration)
                {
                }
                column(TOTAL_DEBT;TOTAL_DEBT)
                {
                    DecimalPlaces = 0:0;
                }
                column(ABS_TOTLA_CREDIT_;ABS(TOTLA_CREDIT))
                {
                    DecimalPlaces = 0:0;
                }
                column(Final_Bal_Control1102154038;Final_Bal)
                {
                    DecimalPlaces = 0:0;
                }
                column(DAY_WISE_BALANCECaption;DAY_WISE_BALANCECaptionLbl)
                {
                }
                column(POSTING_DATECaption;POSTING_DATECaptionLbl)
                {
                }
                column(NARRATIONCaption;NARRATIONCaptionLbl)
                {
                }
                column(DEBIT_AMOUNTCaption;DEBIT_AMOUNTCaptionLbl)
                {
                }
                column(CREDIT_AMOUNTCaption;CREDIT_AMOUNTCaptionLbl)
                {
                }
                column(FINAL_BALANCECaption;FINAL_BALANCECaptionLbl)
                {
                }
                column(To_Provide_Insight_For_Enhancing_WealthCaption;To_Provide_Insight_For_Enhancing_WealthCaptionLbl)
                {
                }
                column(Vendor_Ledger_Entry_Entry_No_;"Entry No.")
                {
                }
                column(Vendor_Ledger_Entry_Vendor_No_;"Vendor No.")
                {
                }
            }

            trigger OnAfterGetRecord();
            begin
                TOTAL_DEBT:=0;
                TOTLA_CREDIT:=0;
            end;

            trigger OnPreDataItem();
            begin
                Newline:=10;
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
        Debt_Amount : Decimal;
        Crdt_Amount : Decimal;
        Final_Bal : Decimal;
        Narration : Text[1000];
        Newline : Char;
        No_Of_Narrations : Integer;
        TOTAL_DEBT : Decimal;
        TOTLA_CREDIT : Decimal;
        DAY_WISE_BALANCECaptionLbl : Label 'DAY WISE BALANCE';
        POSTING_DATECaptionLbl : Label 'POSTING DATE';
        NARRATIONCaptionLbl : Label 'NARRATION';
        DEBIT_AMOUNTCaptionLbl : Label 'DEBIT AMOUNT';
        CREDIT_AMOUNTCaptionLbl : Label 'CREDIT AMOUNT';
        FINAL_BALANCECaptionLbl : Label 'FINAL BALANCE';
        To_Provide_Insight_For_Enhancing_WealthCaptionLbl : Label 'To Provide Insight For Enhancing Wealth';
}

