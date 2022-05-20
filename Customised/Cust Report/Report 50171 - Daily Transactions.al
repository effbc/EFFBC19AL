report 50171 "Daily Transactions"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Daily Transactions.rdlc';

    dataset
    {
        dataitem("<G/L Entry1>";"G/L Entry")
        {
            DataItemTableView = SORTING(G/L Account No.,Posting Date) ORDER(Ascending);
            RequestFilterFields = "Posting Date";
            column(DAT;DAT)
            {
            }
            column(debitamt;debitamt)
            {
            }
            column(creditamt;creditamt)
            {
            }
            column(debname;debname)
            {
            }
            column(crename;crename)
            {
            }
            column(TOTDEB1;TOTDEB1)
            {
            }
            column(TOTCRE1;TOTCRE1)
            {
            }
            column(Transactions_as_on_Caption;Transactions_as_on_CaptionLbl)
            {
            }
            column(Paid_AmountCaption;Paid_AmountCaptionLbl)
            {
            }
            column(Account_NameCaption;Account_NameCaptionLbl)
            {
            }
            column(Account_NameCaption_Control1102154021;Account_NameCaption_Control1102154021Lbl)
            {
            }
            column(Received_AmountCaption;Received_AmountCaptionLbl)
            {
            }
            column(G_L_Entry1__Entry_No_;"Entry No.")
            {
            }
            column(G_L_Entry1__G_L_Account_No_;"G/L Account No.")
            {
            }
        }
        dataitem("G/L Account";"G/L Account")
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending) WHERE(Account Type=FILTER(Posting));
            RequestFilterFields = "No.","Date Filter","Global Dimension 1 Filter","Global Dimension 2 Filter";
            column(DAT_Control1102154006;DAT)
            {
            }
            column(Detailed_Transactions_as_on_Caption;Detailed_Transactions_as_on_CaptionLbl)
            {
            }
            column(G_L_Account_No_;"No.")
            {
            }
            column(G_L_Account_Date_Filter;"Date Filter")
            {
            }
            column(G_L_Account_Global_Dimension_1_Filter;"Global Dimension 1 Filter")
            {
            }
            column(G_L_Account_Global_Dimension_2_Filter;"Global Dimension 2 Filter")
            {
            }
            dataitem("G/L Entry";"G/L Entry")
            {
                DataItemLink = G/L Account No.=FIELD(No.),Posting Date=FIELD(Date Filter),Global Dimension 1 Code=FIELD(Global Dimension 1 Filter),Global Dimension 2 Code=FIELD(Global Dimension 2 Filter);
                DataItemTableView = SORTING(G/L Account No.,Posting Date) ORDER(Ascending) WHERE(Document No.=FILTER(BPV*|CPV*|BRV*|CRV*));
                RequestFilterFields = "Posting Date";
                column(G_L_Account__Name;"G/L Account".Name)
                {
                }
                column(G_L_Entry__Credit_Amount_;"Credit Amount")
                {
                }
                column(G_L_Entry_Description;Description)
                {
                }
                column(G_L_Entry__Debit_Amount_;"Debit Amount")
                {
                }
                column(iduser;iduser)
                {
                }
                column(totdeb;totdeb)
                {
                }
                column(totcre;totcre)
                {
                }
                column(Debit_AmountCaption;Debit_AmountCaptionLbl)
                {
                }
                column(Credit_AmountCaption;Credit_AmountCaptionLbl)
                {
                }
                column(DescriptionCaption;DescriptionCaptionLbl)
                {
                }
                column(Employee_NameCaption;Employee_NameCaptionLbl)
                {
                }
                column(TotalsCaption;TotalsCaptionLbl)
                {
                }
                column(G_L_Entry_Entry_No_;"Entry No.")
                {
                }
                column(G_L_Entry_G_L_Account_No_;"G/L Account No.")
                {
                }
                column(G_L_Entry_Posting_Date;"Posting Date")
                {
                }
                column(G_L_Entry_Global_Dimension_1_Code;"Global Dimension 1 Code")
                {
                }
                column(G_L_Entry_Global_Dimension_2_Code;"Global Dimension 2 Code")
                {
                }

                trigger OnPreDataItem();
                begin
                           sno:=0;
                          tranno:=0;


                    //("G/L Entry".SETFILTER("G/L Entry"."Document No.",'BPV*')
                    "G/L Entry".SETRANGE("G/L Entry"."Posting Date","<G/L Entry1>"."Posting Date");
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
        /* FILTER:="G/L Account".GETFILTER("G/L Account"."Date Filter");
         EVALUATE(DAT,FILTER);*/
         FILTER:="<G/L Entry1>".GETFILTER("<G/L Entry1>"."Posting Date");
         EVALUATE(DAT,FILTER);

    end;

    var
        debitamt : Decimal;
        creditamt : Decimal;
        sno : Integer;
        tranno : Integer;
        totdeb : Decimal;
        totcre : Decimal;
        "FILTER" : Text[30];
        DAT : Date;
        DEBACC : Code[10];
        CREACC : Code[10];
        "g/l account1" : Record "G/L Account";
        debname : Text[100];
        crename : Text[100];
        filter1 : Text[30];
        TransDebits : Decimal;
        TransCredits : Decimal;
        AccountChanged : Boolean;
        TOTDEB1 : Decimal;
        TOTCRE1 : Decimal;
        ANV : Record "Analysis View Entry";
        iduser : Text[100];
        user : Record User;
        Transactions_as_on_CaptionLbl : Label '"Transactions as on "';
        Paid_AmountCaptionLbl : Label 'Paid Amount';
        Account_NameCaptionLbl : Label 'Account Name';
        Account_NameCaption_Control1102154021Lbl : Label 'Account Name';
        Received_AmountCaptionLbl : Label 'Received Amount';
        Detailed_Transactions_as_on_CaptionLbl : Label '"Detailed Transactions as on "';
        Debit_AmountCaptionLbl : Label 'Debit Amount';
        Credit_AmountCaptionLbl : Label 'Credit Amount';
        DescriptionCaptionLbl : Label 'Description';
        Employee_NameCaptionLbl : Label 'Employee Name';
        TotalsCaptionLbl : Label 'Totals';
}

