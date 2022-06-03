report 50177 "Day wise"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Day wise.rdlc';

    dataset
    {
        dataitem("Analysis View Entry"; "Analysis View Entry")
        {
            RequestFilterFields = "Posting Date";
            column(DAT; DAT)
            {
            }
            column(Analysis_View_Entry__Analysis_View_Entry___Debit_Amount_; "Analysis View Entry"."Debit Amount")
            {
            }
            column(AcctName; AcctName)
            {
            }
            column(desc; desc)
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(Account_HeadCaption; Account_HeadCaptionLbl)
            {
            }
            column(AmountCaption; AmountCaptionLbl)
            {
            }
            column(EXPENSES_AS_ON_Caption; EXPENSES_AS_ON_CaptionLbl)
            {
            }
            column(Analysis_View_Entry_Analysis_View_Code; "Analysis View Code")
            {
            }
            column(Analysis_View_Entry_Account_No_; "Account No.")
            {
            }
            column(Analysis_View_Entry_Account_Source; "Account Source")
            {
            }
            column(Analysis_View_Entry_Dimension_1_Value_Code; "Dimension 1 Value Code")
            {
            }
            column(Analysis_View_Entry_Dimension_2_Value_Code; "Dimension 2 Value Code")
            {
            }
            column(Analysis_View_Entry_Dimension_3_Value_Code; "Dimension 3 Value Code")
            {
            }
            column(Analysis_View_Entry_Dimension_4_Value_Code; "Dimension 4 Value Code")
            {
            }
            column(Analysis_View_Entry_Business_Unit_Code; "Business Unit Code")
            {
            }
            column(Analysis_View_Entry_Posting_Date; "Posting Date")
            {
            }
            column(Analysis_View_Entry_Entry_No_; "Entry No.")
            {
            }
            column(Analysis_View_Entry_Cash_Flow_Forecast_No_; "Cash Flow Forecast No.")
            {
            }

            trigger OnPreDataItem();
            begin
                "Analysis View Entry".SETFILTER("Analysis View Entry"."Analysis View Code", '*EXP*');
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
        FILTER := "Analysis View Entry".GETFILTER("Analysis View Entry"."Posting Date");
        EVALUATE(DAT, FILTER);
    end;

    var
        debamt: Decimal;
        "g/l account": Record "G/L Account";
        AcctName: Text[100];
        "g/l entry": Record "G/L Entry";
        desc: Text[250];
        "FILTER": Text[30];
        DAT: Date;
        DescriptionCaptionLbl: Label 'Description';
        Account_HeadCaptionLbl: Label 'Account Head';
        AmountCaptionLbl: Label 'Amount';
        EXPENSES_AS_ON_CaptionLbl: Label '"EXPENSES AS ON "';
}

