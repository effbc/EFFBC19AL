page 54000 "Account Manager Role Center1"
{
    // version NAVW16.00.01,NAVIN6.00

    Caption = 'Role Center';
    PageType = Card;

    layout
    {
    }

    actions
    {
        area(navigation)
        {
            group("Actions")
            {
                Caption = 'Actions';
                action("Sales &Credit Memo")
                {
                    Caption = 'Sales &Credit Memo';
                    Image = CreditMemo;
                    RunObject = Page "Sales Credit Memos";
                }
                action("P&urchase Credit Memo")
                {
                    Caption = 'P&urchase Credit Memo';
                    Image = CreditMemo;
                    RunObject = Page "Purchase Credit Memos";
                }
                action("Cas&h Receipt Journal")
                {
                    Caption = 'Cas&h Receipt Journal';
                    Image = CashReceiptJournal;
                    RunObject = Page "Cash Receipt Journal";
                }
                action("Pa&yment Journal")
                {
                    Caption = 'Pa&yment Journal';
                    Image = PaymentJournal;
                    RunObject = Page "Payment Journal";
                }
                separator(Action97)
                {
                }
                action("Analysis &View")
                {
                    Caption = 'Analysis &View';
                    RunObject = Page "Analysis View List";
                }
                action("Analysis by &Dimensions")
                {
                    Caption = 'Analysis by &Dimensions';
                    RunObject = Page "Analysis by Dimensions";
                }
                action("Calculate Deprec&iation")
                {
                    Caption = 'Calculate Deprec&iation';
                    Ellipsis = true;
                    Image = CalculateDepreciation;
                    RunObject = Report "Calculate Depreciation";
                }
                action("Import Co&nsolidation from Database")
                {
                    Caption = 'Import Co&nsolidation from Database';
                    Ellipsis = true;
                    RunObject = Report "Import Consolidation from DB";
                }
                action("Bank Account R&econciliation")
                {
                    Caption = 'Bank Account R&econciliation';
                    RunObject = Page "Bank Acc. Reconciliation List";
                }
                action("Adjust E&xchange Rates")
                {
                    Caption = 'Adjust E&xchange Rates';
                    Ellipsis = true;
                    Image = AdjustExchangeRates;
                    RunObject = Report "Adjust Exchange Rates";
                }
                action("P&ost Inventory Cost to G/L")
                {
                    Caption = 'P&ost Inventory Cost to G/L';
                    RunObject = Report "Post Inventory Cost to G/L";
                }
                separator(Action73)
                {
                }
                action("C&reate Reminders")
                {
                    Caption = 'C&reate Reminders';
                    Ellipsis = true;
                    Image = CreateReminders;
                    RunObject = Report "Create Reminders";
                }
                action("Create Finance Charge &Memos")
                {
                    Caption = 'Create Finance Charge &Memos';
                    Ellipsis = true;
                    Image = CreateFinanceChargememo;
                    RunObject = Report "Create Finance Charge Memos";
                }
                separator(Action80)
                {
                }
                action("Payment Service Tax")
                {
                    Caption = 'Payment Service Tax';
                    RunObject = Page "Service Tax Payment";
                }
                action("VAT Settlement")
                {
                    Caption = 'VAT Settlement';
                    RunObject = Page "VAT Settlement List";
                }
                action("TDS Adjustment Journal")
                {
                    Caption = 'TDS Adjustment Journal';
                    RunObject = Page "TDS Adjustment Journal";
                }
                separator(Action1500081)
                {
                }
                action("Intrastat &Journal")
                {
                    Caption = 'Intrastat &Journal';
                    RunObject = Page "Intrastat Jnl. Batches";
                }
                action("Calc. and Pos&t VAT Settlement")
                {
                    Caption = 'Calc. and Pos&t VAT Settlement';
                    RunObject = Report "Calc. and Post VAT Settlement";
                }
                action("General &Ledger Setup")
                {
                    Caption = 'General &Ledger Setup';
                    RunObject = Page "General Ledger Setup";
                }
                action("&Sales && Receivables Setup")
                {
                    Caption = '&Sales && Receivables Setup';
                    RunObject = Page "Sales & Receivables Setup";
                }
                action("&Purchases && Payables Setup")
                {
                    Caption = '&Purchases && Payables Setup';
                    RunObject = Page "Purchases & Payables Setup";
                }
                action("&Fixet Asset Setup")
                {
                    Caption = '&Fixet Asset Setup';
                    RunObject = Page "Fixed Asset Setup";
                }
                action("Navi&gate")
                {
                    Caption = 'Navi&gate';
                    Image = Navigate;
                    RunObject = Page Navigate;
                }
            }
            group(Home)
            {
                Caption = 'Home';
                action("Chart of Accounts")
                {
                    Caption = 'Chart of Accounts';
                    RunObject = Page "Chart of Accounts";
                }
                action(Vendors)
                {
                    Caption = 'Vendors';
                    RunObject = Page "Vendor List";
                }
                action(Balance)
                {
                    Caption = 'Balance';
                    Image = Balance;
                    RunObject = Page "Vendor List";
                    RunPageView = WHERE(Balance (LCY)=FILTER(<>0));
                }
                action("Purchase Orders")
                {
                    Caption = 'Purchase Orders';
                    RunObject = Page "Purchase Order List";
                }
                action(Budgets)
                {
                    Caption = 'Budgets';
                    RunObject = Page "G/L Budget Names";
                }
                action("Bank Accounts")
                {
                    Caption = 'Bank Accounts';
                    RunObject = Page "Bank Account List";
                }
                action(Items)
                {
                    Caption = 'Items';
                    RunObject = Page "Item List";
                }
                action(Customers)
                {
                    Caption = 'Customers';
                    RunObject = Page "Customer List";
                }
                action(Action13)
                {
                    Caption = 'Balance';
                    Image = Balance;
                    RunObject = Page "Customer List";
                                    RunPageView = WHERE(Balance (LCY)=FILTER(<>0));
                }
                action("Sales Orders")
                {
                    Caption = 'Sales Orders';
                    RunObject = Page "Sales Order List";
                }
            }
            group(Journals)
            {
                Caption = 'Journals';
                action("Purchase Journals")
                {
                    Caption = 'Purchase Journals';
                    RunObject = Page "General Journal Batches";
                                    RunPageView = WHERE(Template Type=CONST(Purchases),Recurring=CONST(No));
                }
                action("Sales Journals")
                {
                    Caption = 'Sales Journals';
                    RunObject = Page "General Journal Batches";
                                    RunPageView = WHERE(Template Type=CONST(Sales),Recurring=CONST(No));
                }
                action("Cash Receipt Voucher")
                {
                    Caption = 'Cash Receipt Voucher';
                    Image = Journals;
                    RunObject = Page "General Journal Batches";
                                    RunPageView = WHERE(Template Type=CONST(Cash Receipts),Sub Type=CONST(Cash Receipt Voucher),Recurring=CONST(No));
                }
                action("Cash Receipt Journals")
                {
                    Caption = 'Cash Receipt Journals';
                    Image = Journals;
                    RunObject = Page "General Journal Batches";
                                    RunPageView = WHERE(Template Type=CONST(Cash Receipts),Recurring=CONST(No));
                }
                action("Bank Receipt Voucher")
                {
                    Caption = 'Bank Receipt Voucher';
                    Image = Journals;
                    RunObject = Page "General Journal Batches";
                                    RunPageView = WHERE(Template Type=CONST(Cash Receipts),Sub Type=CONST(Bank Receipt Voucher),Recurring=CONST(No));
                }
                action("Payment Journals")
                {
                    Caption = 'Payment Journals';
                    Image = Journals;
                    RunObject = Page "General Journal Batches";
                                    RunPageView = WHERE(Template Type=CONST(Payments),Recurring=CONST(No));
                }
                action("Cash Payment Voucher")
                {
                    Caption = 'Cash Payment Voucher';
                    Image = Journals;
                    RunObject = Page "General Journal Batches";
                                    RunPageView = WHERE(Template Type=CONST(Payments),Sub Type=CONST(Cash Payment Voucher),Recurring=CONST(No));
                }
                action("Bank Payment Voucher")
                {
                    Caption = 'Bank Payment Voucher';
                    Image = Journals;
                    RunObject = Page "General Journal Batches";
                                    RunPageView = WHERE(Template Type=CONST(Payments),Sub Type=CONST(Bank Payment Voucher),Recurring=CONST(No));
                }
                action("IC General Journals")
                {
                    Caption = 'IC General Journals';
                    RunObject = Page "General Journal Batches";
                                    RunPageView = WHERE(Template Type=CONST(Intercompany),Recurring=CONST(No));
                }
                action("General Journals")
                {
                    Caption = 'General Journals';
                    RunObject = Page "General Journal Batches";
                                    RunPageView = WHERE(Template Type=CONST(General),Recurring=CONST(No));
                }
                action("General Voucher")
                {
                    Caption = 'General Voucher';
                    RunObject = Page "General Journal Batches";
                                    RunPageView = WHERE(Template Type=CONST(General),Sub Type=CONST(Journal Voucher),Recurring=CONST(No));
                }
                action("Contra Voucher")
                {
                    Caption = 'Contra Voucher';
                    RunObject = Page "General Journal Batches";
                                    RunPageView = WHERE(Template Type=CONST(General),Sub Type=CONST(Contra Voucher),Recurring=CONST(No));
                }
                action("Intrastat Journals")
                {
                    Caption = 'Intrastat Journals';
                    RunObject = Page "Intrastat Jnl. Batches";
                }
            }
            group("Fixed Assets")
            {
                Caption = 'Fixed Assets';
                action(Action17)
                {
                    Caption = 'Fixed Assets';
                    RunObject = Page "Fixed Asset List";
                }
                action(Insurance)
                {
                    Caption = 'Insurance';
                    RunObject = Page "Insurance List";
                }
                action("Fixed Assets G/L Journals")
                {
                    Caption = 'Fixed Assets G/L Journals';
                    RunObject = Page "General Journal Batches";
                                    RunPageView = WHERE(Template Type=CONST(Assets),Recurring=CONST(No));
                }
                action("Fixed Assets Journals")
                {
                    Caption = 'Fixed Assets Journals';
                    RunObject = Page "FA Journal Batches";
                                    RunPageView = WHERE(Recurring=CONST(No));
                }
                action("Fixed Assets Reclass. Journals")
                {
                    Caption = 'Fixed Assets Reclass. Journals';
                    RunObject = Page "FA Reclass. Journal Batches";
                }
                action("Insurance Journals")
                {
                    Caption = 'Insurance Journals';
                    RunObject = Page "Insurance Journal Batches";
                }
                action("Recurring Fixed Asset Journals")
                {
                    Caption = 'Recurring Fixed Asset Journals';
                    RunObject = Page "FA Journal Batches";
                                    RunPageView = WHERE(Recurring=CONST(Yes));
                }
            }
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                action("Posted Sales Invoices")
                {
                    Caption = 'Posted Sales Invoices';
                    RunObject = Page "Posted Sales Invoices";
                }
                action("Posted Sales Credit Memos")
                {
                    Caption = 'Posted Sales Credit Memos';
                    RunObject = Page "Posted Sales Credit Memos";
                }
                action("Posted Purchase Invoices")
                {
                    Caption = 'Posted Purchase Invoices';
                    RunObject = Page "Posted Purchase Invoices";
                }
                action("Posted Purchase Credit Memos")
                {
                    Caption = 'Posted Purchase Credit Memos';
                    RunObject = Page "Posted Purchase Credit Memos";
                }
                action("Issued Reminders")
                {
                    Caption = 'Issued Reminders';
                    RunObject = Page "Issued Reminder List";
                }
                action("Issued Fin. Charge Memos")
                {
                    Caption = 'Issued Fin. Charge Memos';
                    RunObject = Page "Issued Fin. Charge Memo List";
                }
                action("G/L Registers")
                {
                    Caption = 'G/L Registers';
                    RunObject = Page "G/L Registers";
                }
            }
            group(Administration)
            {
                Caption = 'Administration';
                action(Currencies)
                {
                    Caption = 'Currencies';
                    RunObject = Page Currencies;
                }
                action("Accounting Periods")
                {
                    Caption = 'Accounting Periods';
                    Image = AccountingPeriods;
                    RunObject = Page "Accounting Periods";
                }
                action("Number Series")
                {
                    Caption = 'Number Series';
                    RunObject = Page "No. Series";
                }
                action("Analysis Views")
                {
                    Caption = 'Analysis Views';
                    RunObject = Page "Analysis View List";
                }
                action("Account Schedules")
                {
                    Caption = 'Account Schedules';
                    RunObject = Page "Account Schedule Names";
                }
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page Dimensions;
                }
                action("Bank Account Posting Groups")
                {
                    Caption = 'Bank Account Posting Groups';
                    RunObject = Page "Bank Account Posting Groups";
                }
            }
            group(Reports)
            {
                Caption = 'Reports';
                action("&G/L Trial Balance")
                {
                    Caption = '&G/L Trial Balance';
                    RunObject = Report "Trial Balance";
                }
                action("&Bank Detail Trial Balance")
                {
                    Caption = '&Bank Detail Trial Balance';
                    RunObject = Report "Bank Acc. - Detail Trial Bal.";
                }
                action("&Account Schedule")
                {
                    Caption = '&Account Schedule';
                    RunObject = Report "Account Schedule";
                }
                action("Bu&dget")
                {
                    Caption = 'Bu&dget';
                    RunObject = Report Budget;
                }
                action("Trial Bala&nce/Budget")
                {
                    Caption = 'Trial Bala&nce/Budget';
                    RunObject = Report "Trial Balance/Budget";
                }
                action("Trial Balance by &Period")
                {
                    Caption = 'Trial Balance by &Period';
                    RunObject = Report "Trial Balance by Period";
                }
                action("&Fiscal Year Balance")
                {
                    Caption = '&Fiscal Year Balance';
                    RunObject = Report "Fiscal Year Balance";
                }
                action("Balance Comp. - Prev. Y&ear")
                {
                    Caption = 'Balance Comp. - Prev. Y&ear';
                    RunObject = Report "Balance Comp. - Prev. Year";
                }
                action("&Closing Trial Balance")
                {
                    Caption = '&Closing Trial Balance';
                    RunObject = Report "Closing Trial Balance";
                }
                separator(Action49)
                {
                }
                action(Ledgers)
                {
                    Caption = 'Ledgers';
                    RunObject = Report Ledger;
                }
                action("Voucher Register")
                {
                    Caption = 'Voucher Register';
                    RunObject = Report "Voucher Register";
                }
                action("Day Book")
                {
                    Caption = 'Day Book';
                    RunObject = Report "Day Book";
                }
                action("Cash Book")
                {
                    Caption = 'Cash Book';
                    RunObject = Report "Cash Book";
                }
                action("Bank Book")
                {
                    Caption = 'Bank Book';
                    RunObject = Report "Bank Book";
                }
                separator(Action1500012)
                {
                }
                action("Aged Accounts &Receivable")
                {
                    Caption = 'Aged Accounts &Receivable';
                    RunObject = Report "Aged Accounts Receivable";
                }
                action("Aged Accounts Pa&yable")
                {
                    Caption = 'Aged Accounts Pa&yable';
                    RunObject = Report "Aged Accounts Payable";
                }
                action("Reconcile Cus&t. and Vend. Accs")
                {
                    Caption = 'Reconcile Cus&t. and Vend. Accs';
                    RunObject = Report "Reconcile Cust. and Vend. Accs";
                }
                action("EC Sales &List")
                {
                    Caption = 'EC Sales &List';
                    RunObject = Report "EC Sales List";
                }
                separator(Action60)
                {
                }
                action("&Intrastat - Checklist")
                {
                    Caption = '&Intrastat - Checklist';
                    RunObject = Report "Intrastat - Checklist";
                }
                action("Intrastat - For&m")
                {
                    Caption = 'Intrastat - For&m';
                    RunObject = Report "Intrastat - Form";
                }
            }
        }
    }
}

