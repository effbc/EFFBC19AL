report 90056 test
{
    // version EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './test.rdlc';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            RequestFilterFields = "No.";
            column(Order_No_Caption; Order_No_CaptionLbl)
            {
            }
            column(Order_AmountCaption; Order_AmountCaptionLbl)
            {
            }
            column(Product_NameCaption; Product_NameCaptionLbl)
            {
            }
            column(Customer_NameCaption; Customer_NameCaptionLbl)
            {
            }
            column(Sales_Header_Document_Type; "Document Type")
            {
            }
            column(Sales_Header_No_; "No.")
            {
            }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document Type, Document No., Line No.) ORDER(Ascending);
                column(Sales_Header___No__; "Sales Header"."No.")
                {
                }
                column(s; s)
                {
                }
                column(Sales_Header__Product; "Sales Header".Product)
                {
                }
                column(Sales_Header___Sell_to_Customer_Name_; "Sales Header"."Sell-to Customer Name")
                {
                }
                column(Sales_Line_Document_Type; "Document Type")
                {
                }
                column(Sales_Line_Document_No_; "Document No.")
                {
                }
                column(Sales_Line_Line_No_; "Line No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    "Sales Line".SETFILTER("Sales Line"."Tax Group Code", 'MPBI|EDB');
                    REPEAT
                    BEGIN
                        amt := amt + ("Sales Line"."Qty. to Ship" * "Sales Line"."Unit Price") + "Sales Line"."Tax Amount" + "Sales Line"."Excise Amount"
                        + "Sales Line"."VAT Amount 2";//B2B Changes Vat Amount to VAT Amount 2
                        s := amt;
                    END;
                    UNTIL ("Sales Line".NEXT = 0);
                    amt := 0;
                end;
            }

            trigger OnPreDataItem();
            begin
                TempExcelBuffer.DELETEALL;
                CLEAR(TempExcelBuffer);
                row := 0;

                amt := 0;
                IF finish = TRUE THEN
                    "Sales Header".SETFILTER("Sales Header"."Order Status", 'Ready for Dispatch');
                IF semi = TRUE THEN
                    "Sales Header".SETFILTER("Sales Header"."Order Status", 'Ready For RDSO|Inprogress');
                IF (semi = TRUE) OR (finish = TRUE) THEN
                    "Sales Header".SETFILTER("Sales Header"."Order Status", 'Ready For RDSO|Inprogress|Ready for Dispatch');
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

    trigger OnPostReport();
    begin
        IF Excel THEN BEGIN
            TempExcelBuffer.CreateBook('', '');//B2B //EFFUPG
                                               //TempExcelBuffer.CreateSheet('test excel','',COMPANYNAME,'');//B2B
            TempExcelBuffer.GiveUserControl;
        END
    end;

    var
        amt: Decimal;
        s: Decimal;
        semi: Boolean;
        finish: Boolean;
        TempExcelBuffer: Record "Excel Buffer";
        row: Integer;
        Excel: Boolean;
        Order_No_CaptionLbl: Label 'Order No.';
        Order_AmountCaptionLbl: Label 'Order Amount';
        Product_NameCaptionLbl: Label 'Product Name';
        Customer_NameCaptionLbl: Label 'Customer Name';

    (18873)]
    procedure EnterCell(RowNo: Integer; ColumnNo: Integer; CellValue: Text[250]; Bold: Boolean);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.", RowNo);
        TempExcelBuffer.VALIDATE("Column No.", ColumnNo);
        TempExcelBuffer."Cell Value as Text" := CellValue;
        TempExcelBuffer.Bold := Bold;
        TempExcelBuffer.INSERT;
    end;

    (18881)]
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

