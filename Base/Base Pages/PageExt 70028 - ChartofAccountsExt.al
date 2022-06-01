pageextension 70028 ChartofAccountsExt extends "Chart of Accounts"
{
    Editable = true;
    layout
    {
        addafter("Account Type")
        {
            field("PL Head"; "PL Head")
            {
            }
            field(Reflected_in_pl_userid; Reflected_in_pl_userid)
            {
            }
            field(Reflected_in_pl_datetime; Reflected_in_pl_datetime)
            {
            }
        }

        addafter(Totaling)
        {
            field("Budgeted Amount"; "Budgeted Amount")
            {
            }
            field("Budget Filter"; "Budget Filter")
            {
            }
        }
        addafter(Balance)
        {
            field("Cash Account"; "Cash Account")
            {
                Visible = false;
            }
            field("TDS Account"; "TDS Account")
            {
                Visible = false;
            }
            field("Work Tax Account"; "Work Tax Account")
            {
                Visible = false;
            }
        }
    }
    actions
    {
        addafter("A&ccount")
        {
            action(Card)
            {
                ShortCutKey = 'Shift+F5';
                Caption = 'Card';
                RunObject = Page "G/L Account Card";
                RunPageLink = "No." = FIELD("No."), "Date Filter" = FIELD("Date Filter"), "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"), "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"), "Budget Filter" = FIELD("Budget Filter"), "Business Unit Filter" = FIELD("Business Unit Filter");
            }
        }
        addafter("Receivables-Payables")
        {
            action("&MSPT Receivables-Payables")
            {
                Caption = '&MSPT Receivables-Payables';
                RunObject = Page "MSPT Receivables-Payables";
            }
        }
        modify("Ledger E&ntries")
        {
            Promoted = false;
        }
        modify("G/L Register")
        {
            Promoted = true;
        }
        modify(IndentChartOfAccounts)
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify("Close Income Statement")
        {
            Promoted = true;
            PromotedIsBig = true;
        }

        modify("Detail Trial Balance")
        {
            Promoted = true;
        }
        modify("Trial Balance")
        {
            Promoted = true;
        }
        modify("Trial Balance by Period")
        {
            Promoted = false;
        }
        modify(Action1900210206)
        {
            Promoted = true;
        }

    }

}

