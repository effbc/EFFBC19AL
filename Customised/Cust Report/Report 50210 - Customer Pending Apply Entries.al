report 50210 "Customer Pending Apply Entries"
{
    // version EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './Customer Pending Apply Entries.rdlc';
    Permissions = TableData "Cust. Ledger Entry" = rimd;

    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            DataItemTableView = WHERE(Remaining Amount=FILTER(<-100),Posting Date=FILTER(>=04/01/08),Payment Type=FILTER(<>Advance));
            column(Cust__Ledger_Entry__Customer_No__;"Customer No.")
            {
            }
            column(Cust__Ledger_Entry__Document_No__;"Document No.")
            {
            }
            column(Cust__Ledger_Entry__Payment_Type_;"Payment Type")
            {
            }
            column(NAME;NAME)
            {
            }
            column(Cust__Ledger_Entry__Sale_Order_no_;"Sale Order no")
            {
            }
            column(Cust__Ledger_Entry__Cust__Ledger_Entry___Remaining_Amount_;"Cust. Ledger Entry"."Remaining Amount")
            {
            }
            column(C;C)
            {
            }
            column(Cust__Ledger_Entry__Document_No__Caption;FIELDCAPTION("Document No."))
            {
            }
            column(Cust__Ledger_Entry__Payment_Type_Caption;FIELDCAPTION("Payment Type"))
            {
            }
            column(Customer_NameCaption;Customer_NameCaptionLbl)
            {
            }
            column(Cust__Ledger_Entry__Sale_Order_no_Caption;FIELDCAPTION("Sale Order no"))
            {
            }
            column(SALES_PENDING_APPLY_ENTRIESCaption;SALES_PENDING_APPLY_ENTRIESCaptionLbl)
            {
            }
            column(Cust__Ledger_Entry__Customer_No__Caption;FIELDCAPTION("Customer No."))
            {
            }
            column(Cust__Ledger_Entry__Cust__Ledger_Entry___Remaining_Amount_Caption;Cust__Ledger_Entry__Cust__Ledger_Entry___Remaining_Amount_CaptionLbl)
            {
            }
            column(Total_Sales_Pending_AmountCaption;Total_Sales_Pending_AmountCaptionLbl)
            {
            }
            column(Cust__Ledger_Entry_Entry_No_;"Entry No.")
            {
            }

            trigger OnAfterGetRecord();
            begin

                C2+= "Cust. Ledger Entry"."Remaining Amount";
            end;

            trigger OnPreDataItem();
            begin
                 X := -1;
            end;
        }
        dataitem("<Cust. Ledger Entry1>";"Cust. Ledger Entry")
        {
            DataItemTableView = WHERE(Remaining Amount=FILTER(<-100),Posting Date=FILTER(>=04/01/08),Payment Type=FILTER(<>Advance));
            column(Cust__Ledger_Entry1___Customer_No__;"<Cust. Ledger Entry1>"."Customer No.")
            {
            }
            column(Cust__Ledger_Entry1___Sale_Order_no_;"<Cust. Ledger Entry1>"."Sale Order no")
            {
            }
            column(Cust__Ledger_Entry1___Document_No__;"<Cust. Ledger Entry1>"."Document No.")
            {
            }
            column(Cust__Ledger_Entry1___Payment_Type_;"<Cust. Ledger Entry1>"."Payment Type")
            {
            }
            column(NAME1;NAME1)
            {
            }
            column(Cust__Ledger_Entry1___Remaining_Amount_;"<Cust. Ledger Entry1>"."Remaining Amount")
            {
            }
            column(C1;C1)
            {
            }
            column(C2_X;C2*X)
            {
            }
            column(Cust__Ledger_Entry1___Customer_No__Caption;Cust__Ledger_Entry1___Customer_No__CaptionLbl)
            {
            }
            column(Cust__Ledger_Entry1___Sale_Order_no_Caption;Cust__Ledger_Entry1___Sale_Order_no_CaptionLbl)
            {
            }
            column(Cust__Ledger_Entry1___Document_No__Caption;Cust__Ledger_Entry1___Document_No__CaptionLbl)
            {
            }
            column(Cust__Ledger_Entry1___Payment_Type_Caption;Cust__Ledger_Entry1___Payment_Type_CaptionLbl)
            {
            }
            column(CS_PENDING_APPLY_ENTRIESCaption;CS_PENDING_APPLY_ENTRIESCaptionLbl)
            {
            }
            column(Customer_NameCaption_Control1102156027;Customer_NameCaption_Control1102156027Lbl)
            {
            }
            column(Cust__Ledger_Entry1___Remaining_Amount_Caption;Cust__Ledger_Entry1___Remaining_Amount_CaptionLbl)
            {
            }
            column(Total_CS_Pending_AmountCaption;Total_CS_Pending_AmountCaptionLbl)
            {
            }
            column(Total___Pending_Apply_EntriesCaption;Total___Pending_Apply_EntriesCaptionLbl)
            {
            }
            column(Cust__Ledger_Entry1__Entry_No_;"Entry No.")
            {
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

    trigger OnPostReport();
    begin
        IF EXCEL THEN
        BEGIN
         TempExcelbuffer.CreateBook('','');//B2B //EFFUPG
        //TempExcelbuffer.CreateSheet('Customer Pending Apply Entries','',COMPANYNAME,'');//B2B
         TempExcelbuffer.GiveUserControl;
        END;
    end;

    trigger OnPreReport();
    begin
        IF EXCEL THEN
        BEGIN
          CLEAR(TempExcelbuffer);
          TempExcelbuffer.DELETEALL;
        END;
    end;

    var
        Customer : Record Customer;
        NAME : Text[100];
        EXCEL : Boolean;
        TempExcelbuffer : Record "Excel Buffer";
        Row : Integer;
        COST : Decimal;
        DEPT : Text[30];
        X : Decimal;
        A1 : Decimal;
        A2 : Decimal;
        C : Decimal;
        C1 : Decimal;
        CustLedgEntry : Record "Cust. Ledger Entry";
        C2 : Decimal;
        NAME1 : Text[100];
        formatadress : Codeunit "Format Address";
        SP : Record "Salesperson/Purchaser";
        Customer_NameCaptionLbl : Label 'Customer Name';
        SALES_PENDING_APPLY_ENTRIESCaptionLbl : Label 'SALES PENDING APPLY ENTRIES';
        Cust__Ledger_Entry__Cust__Ledger_Entry___Remaining_Amount_CaptionLbl : Label 'Remaining Amount';
        Total_Sales_Pending_AmountCaptionLbl : Label 'Total Sales Pending Amount';
        Cust__Ledger_Entry1___Customer_No__CaptionLbl : Label 'Customer No.';
        Cust__Ledger_Entry1___Sale_Order_no_CaptionLbl : Label 'Sale Order no';
        Cust__Ledger_Entry1___Document_No__CaptionLbl : Label 'Document No.';
        Cust__Ledger_Entry1___Payment_Type_CaptionLbl : Label 'Payement Type';
        CS_PENDING_APPLY_ENTRIESCaptionLbl : Label 'CS PENDING APPLY ENTRIES';
        Customer_NameCaption_Control1102156027Lbl : Label 'Customer Name';
        Cust__Ledger_Entry1___Remaining_Amount_CaptionLbl : Label 'Remaining Amount';
        Total_CS_Pending_AmountCaptionLbl : Label 'Total CS Pending Amount';
        Total___Pending_Apply_EntriesCaptionLbl : Label 'Total   Pending Apply Entries';

    [LineStart(8709)]
    procedure Entercell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[1000];bold : Boolean);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.",RowNo);
        TempExcelbuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelbuffer."Cell Value as Text" := CellValue;
        TempExcelbuffer.Bold:=bold ;

        TempExcelbuffer.INSERT;
    end;

    [LineStart(8718)]
    procedure EnterHeadings(RowNo : Integer;ColumnNo : Integer;CellValue : Text[100];Bold : Boolean);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.",RowNo);
        TempExcelbuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelbuffer."Cell Value as Text" := FORMAT(CellValue);
        TempExcelbuffer.Bold:=Bold ;

        TempExcelbuffer.Formula := '';
        TempExcelbuffer.INSERT;
    end;
}

