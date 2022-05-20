report 80004 "Finance Charge Memo Nos.3"
{
    // version NAVW17.00

    DefaultLayout = RDLC;
    RDLCLayout = './Finance Charge Memo Nos.3.rdlc';
    Caption = 'Finance Charge Memo Nos.';

    dataset
    {
        dataitem("Sales Invoice Header";"Sales Invoice Header")
        {
            DataItemTableView = SORTING(Posting Date) ORDER(Ascending);
            RequestFilterFields = "Posting Date";
            column(From_Date;From_Date)
            {
            }
            column(To_Date;To_Date)
            {
            }
            column(Total_Value_;"Total Value")
            {
            }
            column(Total_Payment_;"Total Payment")
            {
            }
            column(Total_Remaining_;"Total Remaining")
            {
            }
            column(Dispatch_ReportCaption;Dispatch_ReportCaptionLbl)
            {
            }
            column(PeriodCaption;PeriodCaptionLbl)
            {
            }
            column(ToCaption;ToCaptionLbl)
            {
            }
            column(Total_Dispatch_ValueCaption;Total_Dispatch_ValueCaptionLbl)
            {
            }
            column(Sales_Invoice_Header_No_;"No.")
            {
            }
            dataitem("<Sales Invoice Header1>";"Sales Invoice Header")
            {
                DataItemTableView = SORTING(Posting Date) ORDER(Ascending);
                column(Max_Date;Max_Date)
                {
                }
                column(Min_Date;Min_Date)
                {
                }
                column(Sales_Invoice_Header1____Sales_Invoice_Header1____Order_No__;"<Sales Invoice Header1>"."Order No.")
                {
                }
                column(Sales_Invoice_Header1____Sales_Invoice_Header1____Sell_to_Customer_Name_;"<Sales Invoice Header1>"."Sell-to Customer Name")
                {
                }
                column(Bill_Value;Bill_Value)
                {
                }
                column(Sales_Invoice_Header1___Due_Date_;"Due Date")
                {
                }
                column(Payment;Payment)
                {
                }
                column(CLE__Remaining_Amt___LCY__;CLE."Remaining Amt. (LCY)")
                {
                }
                column(Dev;Dev)
                {
                }
                column(CLE__Posting_Date_;CLE."Posting Date")
                {
                }
                column(Perid_Value_;"Perid Value")
                {
                }
                column(Period_Payment_;"Period Payment")
                {
                }
                column(Period_Remianing_;"Period Remianing")
                {
                }
                column(TO__Caption;TO__CaptionLbl)
                {
                }
                column(FROM___Caption;FROM___CaptionLbl)
                {
                }
                column(No_Caption;No_CaptionLbl)
                {
                }
                column(CustomerCaption;CustomerCaptionLbl)
                {
                }
                column(Bill_ValueCaption;Bill_ValueCaptionLbl)
                {
                }
                column(Due_DateCaption;Due_DateCaptionLbl)
                {
                }
                column(Payment_AmountCaption;Payment_AmountCaptionLbl)
                {
                }
                column(Remaining_AmountCaption;Remaining_AmountCaptionLbl)
                {
                }
                column(DeviationCaption;DeviationCaptionLbl)
                {
                }
                column(Bill_DateCaption;Bill_DateCaptionLbl)
                {
                }
                column(Sales_Invoice_Header1__No_;"No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                      Bill_Value:=0;
                      "Due Date":=0D;
                      Dev:='';
                      Payment:=0;
                      Sales.SETRANGE(Sales."Document No.","<Sales Invoice Header1>"."No.");
                      IF Sales.FIND('-') THEN
                      REPEAT
                        Bill_Value+=Sales."Amount To Customer";
                      UNTIL Sales.NEXT=0;
                    
                    
                    CLE.SETCURRENTKEY(CLE."Document No.",CLE."Document Type",CLE."Customer No.");
                    CLE.SETRANGE(CLE."Document No.","<Sales Invoice Header1>"."No.");
                    IF CLE.FIND('-') THEN
                    BEGIN
                      CLE.CALCFIELDS(CLE."Remaining Amt. (LCY)");
                      "Due Date":=CLE."Due Date";
                      Payment:=Bill_Value- CLE."Remaining Amt. (LCY)";
                    END;
                    /*CLE.RESET;
                    CLE.SETCURRENTKEY(CLE."Document Type",CLE."Customer No.",CLE."Posting Date",CLE."Currency Code");
                    CLE.SETFILTER(CLE."Document Type",'Payment');
                    CLE.SETRANGE(CLE."Applies-to Doc. No.","<Sales Invoice Header1>"."No.");
                    if CLE.FIND('-') then
                    repeat
                      Payment+=
                    until CLE.NEXT=0; */
                    
                    IF ("Due Date">0D) AND (CLE."Remaining Amt. (LCY)">0) THEN
                    BEGIN
                      IF ("Due Date"<TODAY)  THEN
                        Deviation:=TODAY-"Due Date";
                       Dev:= FORMAT(Deviation)+'Days';
                    END;

                end;

                trigger OnPostDataItem();
                begin
                          Min_Date:=Max_Date+1;
                end;

                trigger OnPreDataItem();
                begin

                         "<Sales Invoice Header1>".SETRANGE("<Sales Invoice Header1>"."Posting Date",Min_Date,Max_Date);
                       //  Min_Date:=Max_Date+1;
                        IF  "<Sales Invoice Header1>".COUNT=0 THEN
                          CurrReport.BREAK;


                         "Period Payment":=0;
                         "Perid Value":=0;
                         "Period Remianing":=0;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                   Max_Date:= CALCDATE(Period_Length,Min_Date);
                     IF   Max_Date>To_Date THEN
                     CurrReport.BREAK;
            end;

            trigger OnPreDataItem();
            begin

                     CLEAR(TempExcelbuffer);
                     TempExcelbuffer.DELETEALL;

                   IF "Sales Invoice Header".GETFILTER("Sales Invoice Header"."Posting Date")<>'' THEN
                   BEGIN
                     From_Date:="Sales Invoice Header".GETRANGEMIN("Sales Invoice Header"."Posting Date");
                     To_Date:="Sales Invoice Header".GETRANGEMAX("Sales Invoice Header"."Posting Date");
                   END ELSE
                   BEGIN
                     From_Date:=040107D;
                     To_Date:=TODAY;
                   END;
                   IF Period_Length='' THEN
                     Period_Length:='1W';
                   Max_Date:=From_Date;
                   Min_Date:=From_Date;
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
         TempExcelbuffer.CreateBook('');//B2B
         //TempExcelbuffer.CreateSheet('"Production BOM Header"."No."','',COMPANYNAME,'');//B2B
         TempExcelbuffer.GiveUserControl;
    end;

    var
        Text000 : Label 'No number series has been used for the following entries:';
        Text001 : Label 'The number series %1 %2 has been used for the following entries:';
        Text002 : Label 'There is a gap in the number series.';
        Text003 : Label 'The documents are not listed according to Posting Date because they were not entered in that order.';
        Text004 : Label 'Issued Finance Charge Memo: %1';
        From_Date : Date;
        To_Date : Date;
        Period_Length : Text[30];
        Bill_Value : Decimal;
        "Perid Value" : Decimal;
        "Total Value" : Decimal;
        Sales : Record "Sales Invoice Line";
        Max_Date : Date;
        Min_Date : Date;
        "Due Date" : Date;
        CLE : Record "Cust. Ledger Entry";
        Payment : Decimal;
        Deviation : Integer;
        "Period Payment" : Decimal;
        "Total Payment" : Decimal;
        "Period Remianing" : Decimal;
        "Total Remaining" : Decimal;
        Dev : Text[30];
        TempExcelbuffer : Record "Excel Buffer";
        Row : Integer;
        Dispatch_ReportCaptionLbl : Label 'Dispatch Report';
        PeriodCaptionLbl : Label 'Period';
        ToCaptionLbl : Label 'To';
        Total_Dispatch_ValueCaptionLbl : Label 'Total Dispatch Value';
        TO__CaptionLbl : Label 'TO :';
        FROM___CaptionLbl : Label 'FROM  :';
        No_CaptionLbl : Label 'No.';
        CustomerCaptionLbl : Label 'Customer';
        Bill_ValueCaptionLbl : Label 'Bill Value';
        Due_DateCaptionLbl : Label 'Due Date';
        Payment_AmountCaptionLbl : Label 'Payment Amount';
        Remaining_AmountCaptionLbl : Label 'Remaining Amount';
        DeviationCaptionLbl : Label 'Deviation';
        Bill_DateCaptionLbl : Label 'Bill Date';

    [LineStart(12135)]
    local procedure AddError(Text : Text[250]);
    begin
    end;

    [LineStart(12138)]
    procedure Entercell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[1000];bold : Boolean);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.",RowNo);
        TempExcelbuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelbuffer."Cell Value as Text" := CellValue;
        TempExcelbuffer.Bold:=bold ;

        TempExcelbuffer.INSERT;
    end;

    [LineStart(12147)]
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

    [LineStart(12157)]
    procedure "Entercell New"();
    begin
    end;
}

