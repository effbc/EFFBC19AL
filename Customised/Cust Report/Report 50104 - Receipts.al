report 50104 Receipts
{
    // version sreenivas,EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './Receipts.rdlc';

    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.";
            column(fromdate; fromdate)
            {
            }
            column(todate; todate)
            {
            }
            column("sum"; sum)
            {
            }
            column(Total_Receipts_ReceivedCaption; Total_Receipts_ReceivedCaptionLbl)
            {
            }
            column(FromCaption; FromCaptionLbl)
            {
            }
            column(ToCaption; ToCaptionLbl)
            {
            }
            column(AmountCaption; AmountCaptionLbl)
            {
            }
            column(Document_No_Caption; Document_No_CaptionLbl)
            {
            }
            column(Customer_NameCaption; Customer_NameCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(Grand_TotalCaption; Grand_TotalCaptionLbl)
            {
            }
            column(Customer_No_; "No.")
            {
            }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemLink = Customer No.=FIELD(No.);
                DataItemTableView = SORTING(Entry No.) ORDER(Ascending);
                RequestFilterFields = '';
                column(Amount_; -(Amount))
                {
                }
                column(Cust__Ledger_Entry__Document_No__; "Document No.")
                {
                }
                column(Customer_Name; Customer.Name)
                {
                }
                column(Cust__Ledger_Entry__Amount_; ("Cust. Ledger Entry".Amount))
                {
                }
                column(Cust__Ledger_Entry_Entry_No_; "Entry No.")
                {
                }
                column(Cust__Ledger_Entry_Customer_No_; "Customer No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    IF "Cust. Ledger Entry".Amount > 0 THEN
                        CurrReport.SKIP;
                    CurrReport.CREATETOTALS("Cust. Ledger Entry".Amount);
                end;

                trigger OnPreDataItem();
                begin

                    SETRANGE("Cust. Ledger Entry"."Posting Date", fromdate, todate);
                    "Cust. Ledger Entry".SETFILTER("Cust. Ledger Entry"."Document No.", 'bpv*|brv*|jv*')
                end;
            }

            trigger OnPreDataItem();
            begin
                sum := 0;
                TempExcelBuffer.DELETEALL;
                CLEAR(TempExcelBuffer);
                row := 0;
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
        IF Excel THEN BEGIN
            TempExcelBuffer.CreateBook('', '');//B2B //EFFUPG
                                               //TempExcelBuffer.CreateSheet('test excel','',COMPANYNAME,'');//B2B
            TempExcelBuffer.GiveUserControl;
        END;
    end;

    var
        fromdate: Date;
        todate: Date;
        cusno: Code[10];
        cusname: Text[40];
        "sum": Decimal;
        TempExcelBuffer: Record "Excel Buffer" temporary;
        row: Integer;
        Excel: Boolean;
        Total_Receipts_ReceivedCaptionLbl: Label 'Total Receipts Received';
        FromCaptionLbl: Label 'From';
        ToCaptionLbl: Label 'To';
        AmountCaptionLbl: Label 'Amount';
        Document_No_CaptionLbl: Label 'Document No.';
        Customer_NameCaptionLbl: Label 'Customer Name';
        TotalCaptionLbl: Label 'Total';
        Grand_TotalCaptionLbl: Label 'Grand Total';

    [LineStart(6763)]
    procedure EnterCell(RowNo: Integer; ColumnNo: Integer; CellValue: Text[250]; Bold: Boolean);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.", RowNo);
        TempExcelBuffer.VALIDATE("Column No.", ColumnNo);
        TempExcelBuffer."Cell Value as Text" := CellValue;
        TempExcelBuffer.Bold := Bold;
        TempExcelBuffer.INSERT;
    end;

    [LineStart(6771)]
    procedure EnterHeadings(RowNo: Integer; ColumnNo: Integer; CellValue: Text[250]; Bold: Boolean);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.", RowNo);
        TempExcelBuffer.VALIDATE("Column No.", ColumnNo);
        TempExcelBuffer."Cell Value as Text" := FORMAT(CellValue);
        TempExcelBuffer.Bold := Bold;
        TempExcelBuffer.Formula := '';
        TempExcelBuffer.INSERT;
    end;
}

