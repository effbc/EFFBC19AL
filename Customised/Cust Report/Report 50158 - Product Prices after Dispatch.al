report 50158 "Product Prices after Dispatch"
{
    // version EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './Product Prices after Dispatch.rdlc';

    dataset
    {
        dataitem(Item;Item)
        {
            RequestFilterFields = "No.";
            column(Item_No_;"No.")
            {
            }
            dataitem("Sales Invoice Line";"Sales Invoice Line")
            {
                DataItemLink = No.=FIELD(No.);
                DataItemTableView = SORTING(Document No.,Line No.) ORDER(Ascending);
                column(Sales_Invoice_Line__No__;"No.")
                {
                }
                column(Sales_Invoice_Line_Description;Description)
                {
                }
                column(unitpricewithouttaxes;unitpricewithouttaxes)
                {
                }
                column(unitpricewithtaxes;unitpricewithtaxes)
                {
                }
                column(custname;custname)
                {
                }
                column(Sales_Invoice_Line__Document_Date_;"Document Date")
                {
                }
                column(Sales_Invoice_Line_Quantity;Quantity)
                {
                }
                column(Sales_Invoice_Line__External_Document_No__;"External Document No.")
                {
                }
                column(totwithouttaxes;totwithouttaxes)
                {
                }
                column(totuwithtaxes;totuwithtaxes)
                {
                }
                column(Sales_Invoice_Line__No__Caption;FIELDCAPTION("No."))
                {
                }
                column(Sales_Invoice_Line_DescriptionCaption;FIELDCAPTION(Description))
                {
                }
                column(Unit_Price_Without_TaxesCaption;Unit_Price_Without_TaxesCaptionLbl)
                {
                }
                column(Unit_Price_With_TaxesCaption;Unit_Price_With_TaxesCaptionLbl)
                {
                }
                column(Customer_NameCaption;Customer_NameCaptionLbl)
                {
                }
                column(Sales_Invoice_Line_QuantityCaption;FIELDCAPTION(Quantity))
                {
                }
                column(Invoiced_DateCaption;Invoiced_DateCaptionLbl)
                {
                }
                column(Sales_Invoice_Line__External_Document_No__Caption;FIELDCAPTION("External Document No."))
                {
                }
                column(Total_Unit_Price_Without_TaxesCaption;Total_Unit_Price_Without_TaxesCaptionLbl)
                {
                }
                column(Total_Unit_Price_With_TaxesCaption;Total_Unit_Price_With_TaxesCaptionLbl)
                {
                }
                column(Sales_Invoice_Line_Document_No_;"Document No.")
                {
                }
                column(Sales_Invoice_Line_Line_No_;"Line No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    unitpricewithtaxes:=0;
                    unitpricewithouttaxes:=0;
                    totuwithtaxes:=0;
                    totwithouttaxes:=0;

                    custname:='';
                    IF "Sales Invoice Line"."Amount To Customer">0 THEN
                    unitpricewithtaxes:=ROUND("Sales Invoice Line"."Amount To Customer"/"Sales Invoice Line".Quantity,1);
                    IF "Sales Invoice Line".Amount>0 THEN
                    unitpricewithouttaxes:=ROUND("Sales Invoice Line".Amount/"Sales Invoice Line".Quantity,1);
                    customer.SETRANGE(customer."No.","Sales Invoice Line"."Sell-to Customer No.");
                    IF customer.FIND('-') THEN
                    BEGIN
                    custname:=customer.Name;
                    custpostinggroup:=customer."Customer Posting Group";
                    END;
                    totwithouttaxes:=(unitpricewithouttaxes*"Sales Invoice Line".Quantity);
                    totuwithtaxes:=(unitpricewithtaxes*"Sales Invoice Line".Quantity);
                end;

                trigger OnPreDataItem();
                begin
                    "Sales Invoice Line".CALCFIELDS("Sales Invoice Line"."Document Date");
                    "Sales Invoice Line".SETRANGE("Sales Invoice Line"."Document Date",fromdt,todate);
                end;
            }

            trigger OnPreDataItem();
            begin
                 IF Excel THEN
                 BEGIN
                 CLEAR(TempExcelBuffer);
                 TempExcelBuffer.DELETEALL;
                 END;
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
        IF Excel THEN
        BEGIN
          TempExcelBuffer.CreateBook('','');//B2B //EFFUPG
          //TempExcelBuffer.CreateSheet('Total Item History','',COMPANYNAME,'');//B2B
          TempExcelBuffer.GiveUserControl;
        END
    end;

    var
        unitpricewithtaxes : Decimal;
        unitpricewithouttaxes : Decimal;
        customer : Record Customer;
        custname : Text[50];
        TempExcelBuffer : Record "Excel Buffer" temporary;
        row : Integer;
        Excel : Boolean;
        fromdt : Date;
        todate : Date;
        totuwithtaxes : Decimal;
        totwithouttaxes : Decimal;
        custpostinggroup : Text[50];
        Unit_Price_Without_TaxesCaptionLbl : Label 'Unit Price Without Taxes';
        Unit_Price_With_TaxesCaptionLbl : Label 'Unit Price With Taxes';
        Customer_NameCaptionLbl : Label 'Customer Name';
        Invoiced_DateCaptionLbl : Label 'Invoiced Date';
        Total_Unit_Price_Without_TaxesCaptionLbl : Label 'Total Unit Price Without Taxes';
        Total_Unit_Price_With_TaxesCaptionLbl : Label 'Total Unit Price With Taxes';

    [LineStart(8242)]
    procedure EnterCell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[500];Bold : Boolean);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.",RowNo);
        TempExcelBuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelBuffer."Cell Value as Text" := CellValue;
        TempExcelBuffer.Bold:=Bold ;
        TempExcelBuffer.INSERT;
    end;

    [LineStart(8250)]
    procedure EnterHeadings(RowNo : Integer;ColumnNo : Integer;CellValue : Text[250];Bold : Boolean);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.",RowNo);
        TempExcelBuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelBuffer."Cell Value as Text" := FORMAT(CellValue);
        TempExcelBuffer.Bold:=Bold ;
        TempExcelBuffer.Formula := '';
        TempExcelBuffer.INSERT;
    end;
}

