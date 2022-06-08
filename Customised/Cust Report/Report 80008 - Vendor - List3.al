report 80008 "Vendor - List3"
{
    // version NAVW17.00,Rev01,Eff02

    DefaultLayout = RDLC;
    RDLCLayout = './Vendor - List3.rdlc';
    Caption = 'Vendor - List';

    dataset
    {
        dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
        {
            CalcFields = Field60008;
            DataItemTableView = SORTING(Document No., Line No.) WHERE(Quantity = FILTER(> 0), Qty. Rcd. Not Invoiced=FILTER(>0), Field60013=CONST(No));
            RequestFilterFields = "Buy-from Vendor No.";
            column(FORMAT_TODAY_0_4_;FORMAT(TODAY,0,4))
            {
            }
            column(COMPANYNAME;COMPANYNAME)
            {
            }
            column(USERID;USERID)
            {
            }
            column(Purch__Rcpt__Line__Order_No__;"Order No.")
            {
            }
            column(Purch__Rcpt__Line__No__;"No.")
            {
            }
            column(Purch__Rcpt__Line_Quantity;Quantity)
            {
            }
            column(Purch__Rcpt__Line_Description;Description)
            {
            }
            column(Purch__Rcpt__Line__Qty__Rcd__Not_Invoiced_;"Qty. Rcd. Not Invoiced")
            {
            }
            column(Purch__Rcpt__Line__Unit_Cost__LCY__;"Unit Cost (LCY)")
            {
            }
            column(Purch__Rcpt__Line__Unit_of_Measure_Code_;"Unit of Measure Code")
            {
            }
            column(Purch__Rcpt__Line__Document_date_;"Document date")
            {
            }
            column(Purch__Rcpt__Line___Unit_Cost__LCY____Purch__Rcpt__Line___Qty__Rcd__Not_Invoiced_;"Purch. Rcpt. Line"."Unit Cost (LCY)"*"Purch. Rcpt. Line"."Qty. Rcd. Not Invoiced")
            {
            }
            column(Pending_Days_;"Pending Days")
            {
            }
            column(Sno__;"Sno.")
            {
            }
            column(Purch__rcpt__Header___Vendor_Shipment_No__;"Purch. rcpt. Header"."Vendor Shipment No.")
            {
            }
            column(Vendor_name;Vendor_name)
            {
            }
            column(Total_Value_;"Total Value")
            {
            }
            column(Pending_BillsCaption;Pending_BillsCaptionLbl)
            {
            }
            column(Purch__Rcpt__Line__Order_No__Caption;FIELDCAPTION("Order No."))
            {
            }
            column(Purch__Rcpt__Line__No__Caption;FIELDCAPTION("No."))
            {
            }
            column(Purch__Rcpt__Line_QuantityCaption;Purch__Rcpt__Line_QuantityCaptionLbl)
            {
            }
            column(Purch__Rcpt__Line_DescriptionCaption;FIELDCAPTION(Description))
            {
            }
            column(Qty__To_InvoiceCaption;Qty__To_InvoiceCaptionLbl)
            {
            }
            column(Inward_DateCaption;Inward_DateCaptionLbl)
            {
            }
            column(Purch__Rcpt__Line__Unit_Cost__LCY__Caption;FIELDCAPTION("Unit Cost (LCY)"))
            {
            }
            column(UOMCaption;UOMCaptionLbl)
            {
            }
            column(Total_CostCaption;Total_CostCaptionLbl)
            {
            }
            column(Pending_DaysCaption;Pending_DaysCaptionLbl)
            {
            }
            column(S_NoCaption;S_NoCaptionLbl)
            {
            }
            column(Vendor_Shipment_No_Caption;Vendor_Shipment_No_CaptionLbl)
            {
            }
            column(Vendor_NameCaption;Vendor_NameCaptionLbl)
            {
            }
            column(Purch__Rcpt__Line_Document_No_;"Document No.")
            {
            }
            column(Purch__Rcpt__Line_Line_No_;"Line No.")
            {
            }
            column(ShowOutPutGVar;ShowOutPutGVar)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF VAT THEN
                BEGIN
                  IF Vendor.GET("Purch. Rcpt. Line"."Buy-from Vendor No.") THEN
                  BEGIN
                    IF Vendor."State Code"<>'ANP' THEN
                      CurrReport.SKIP;
                  END;
                END;
                IF BOM_Items THEN
                BEGIN
                  PBML.RESET;

                  PBML.SETCURRENTKEY(PBML.Type,PBML."No.");
                  PBML.SETRANGE(PBML."No.","Purch. Rcpt. Line"."No.");
                  PBML.SETRANGE(PBML.Status,PBML.Status::"1");
                  IF NOT PBML.FIND('-') THEN
                     CurrReport.SKIP;
                END;

                // Rev01 Copy code from // Purch. Rcpt. Line, Body (3) - OnPostSection()

                 "Pending Days":=0;
                 Vendor_name:='';
                IF Choice=Choice::Both THEN
                BEGIN
                  "Purch. rcpt. Header".RESET;
                  "Purch. rcpt. Header".SETRANGE("Purch. rcpt. Header"."No.","Purch. Rcpt. Line"."Document No.");
                  IF "Purch. rcpt. Header".FIND('-') THEN
                  BEGIN
                    "Shpmt. No":="Purch. rcpt. Header"."Vendor Shipment No.";
                    "Bill transfered Date":="Purch. rcpt. Header"."Bill Transfered Date";
                    Vendor_name:="Purch. rcpt. Header"."Buy-from Vendor Name";
                    IF "Purch. rcpt. Header"."Bill Transfered Date">0D THEN
                       "Pending Days":=TODAY-"Purch. rcpt. Header"."Bill Transfered Date";
                    IF NOT "Purch. rcpt. Header"."Bill Received" THEN
                       ShowOutPutGVar:=FALSE
                    ELSE
                    BEGIN
                      "Total Value"+="Purch. Rcpt. Line"."Qty. Rcd. Not Invoiced"*"Purch. Rcpt. Line"."Unit Cost (LCY)";
                       "Sno."+=1;
                    END;

                  END;

                  IF Excel AND (  "Purch. rcpt. Header"."Bill Received" ) THEN
                  BEGIN
                    Row+=1;
                    Entercell(Row,1,FORMAT("Sno."),FALSE,TempExcelbuffer."Cell Type"::Number);
                    Entercell(Row,2,"Purch. Rcpt. Line"."Order No.",FALSE,TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row,3,"Purch. Rcpt. Line"."Document No.",FALSE,TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row,4,"No.",FALSE,TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row,5,Description,FALSE,TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row,6,Vendor_name,FALSE,TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row,7,FORMAT("Purch. Rcpt. Line".Quantity),FALSE,TempExcelbuffer."Cell Type"::Number);
                    Entercell(Row,8,FORMAT("Purch. Rcpt. Line"."Qty. Rcd. Not Invoiced"),FALSE,TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row,9,FORMAT("Purch. Rcpt. Line"."Unit of Measure Code"),FALSE,TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row,10,FORMAT("Purch. Rcpt. Line"."Document date"),FALSE,TempExcelbuffer."Cell Type"::Date);
                    Entercell(Row,11,FORMAT("Purch. Rcpt. Line"."Unit Cost (LCY)"),FALSE,TempExcelbuffer."Cell Type"::Number);
                    Entercell(Row,12,FORMAT("Purch. Rcpt. Line"."Unit Cost (LCY)"*"Purch. Rcpt. Line"."Qty. Rcd. Not Invoiced"),FALSE,TempExcelbuffer."Cell Type"::Number);
                    Entercell(Row,13,FORMAT(TODAY-"Purch. Rcpt. Line"."Document date"),FALSE,TempExcelbuffer."Cell Type"::Date);
                    Entercell(Row,14,FORMAT("Purch. rcpt. Header"."Vendor Shipment No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row,15,FORMAT("Purch. rcpt. Header"."Posting Date"),FALSE,TempExcelbuffer."Cell Type"::Date);
                  END;

                END ELSE
                IF Choice=Choice::Purchase THEN
                BEGIN
                  "Purch. rcpt. Header".RESET;
                  "Purch. rcpt. Header".SETRANGE("Purch. rcpt. Header"."No.","Purch. Rcpt. Line"."Document No.");
                  IF "Purch. rcpt. Header".FIND('-') THEN
                  BEGIN
                    "Bill Transfered":=FALSE;
                    IF   "Purch. rcpt. Header"."Bill Transfered" THEN
                    BEGIN
                      "Bill Transfered":=TRUE;
                      "Shpmt. No":="Purch. rcpt. Header"."Vendor Shipment No.";
                      "Bill transfered Date":="Purch. rcpt. Header"."Bill Transfered Date";
                      Vendor.RESET;
                      Vendor_name:="Purch. rcpt. Header"."Buy-from Vendor Name";


                      IF "Purch. rcpt. Header"."Bill Transfered Date">0D THEN
                      "Pending Days":=TODAY-"Purch. rcpt. Header"."Bill Transfered Date";
                    END;
                  END;
                  IF "Bill Transfered" THEN
                  BEGIN
                     "Sno."+=1;
                     "Total Value"+="Purch. Rcpt. Line"."Qty. Rcd. Not Invoiced"*"Purch. Rcpt. Line"."Unit Cost (LCY)";
                    ShowOutPutGVar:=TRUE;
                  END ELSE
                    ShowOutPutGVar:=FALSE;

                  IF Excel AND "Bill Transfered" AND "Purch. rcpt. Header"."Bill Received" THEN
                  BEGIN
                    Row+=1;
                    Entercell(Row,1,FORMAT("Sno."),FALSE,TempExcelbuffer."Cell Type"::Number);
                    Entercell(Row,2,"Purch. Rcpt. Line"."Order No.",FALSE,TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row,3,"Purch. Rcpt. Line"."Document No.",FALSE,TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row,4,"No.",FALSE,TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row,5,Description,FALSE,TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row,6,Vendor_name,FALSE,TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row,7,FORMAT("Purch. Rcpt. Line".Quantity),FALSE,TempExcelbuffer."Cell Type"::Number);
                    Entercell(Row,8,FORMAT("Purch. Rcpt. Line"."Qty. Rcd. Not Invoiced"),FALSE,TempExcelbuffer."Cell Type"::Number);
                    Entercell(Row,9,FORMAT("Purch. Rcpt. Line"."Unit of Measure Code"),FALSE,TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row,10,FORMAT("Purch. Rcpt. Line"."Document date"),FALSE,TempExcelbuffer."Cell Type"::Date);
                    Entercell(Row,11,FORMAT("Purch. Rcpt. Line"."Unit Cost (LCY)"),FALSE,TempExcelbuffer."Cell Type"::Number);
                    Entercell(Row,12,FORMAT("Purch. Rcpt. Line"."Unit Cost (LCY)"*"Purch. Rcpt. Line"."Qty. Rcd. Not Invoiced"),FALSE,TempExcelbuffer."Cell Type"::Number);
                    Entercell(Row,13,FORMAT(TODAY-"Purch. Rcpt. Line"."Document date"),FALSE,TempExcelbuffer."Cell Type"::Date);
                    Entercell(Row,14,FORMAT("Purch. rcpt. Header"."Vendor Shipment No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row,15,FORMAT("Purch. rcpt. Header"."Bill Transfered Date"),FALSE,TempExcelbuffer."Cell Type"::Date);
                  //   Entercell(Row,16,FORMAT(TODAY-"Purch. rcpt. Header"."Bill Transfered Date"),FALSE);

                  END;
                END ELSE
                BEGIN
                  "Purch. rcpt. Header".RESET;
                  "Purch. rcpt. Header".SETRANGE("Purch. rcpt. Header"."No.","Purch. Rcpt. Line"."Document No.");
                  IF "Purch. rcpt. Header".FIND('-') THEN
                  BEGIN
                    "Bill Transfered":=TRUE;
                    IF  NOT( "Purch. rcpt. Header"."Bill Transfered" )THEN
                    BEGIN
                      "Bill Transfered":=FALSE;
                      "Shpmt. No":="Purch. rcpt. Header"."Vendor Shipment No.";
                      "Bill transfered Date":="Purch. rcpt. Header"."Bill Transfered Date";
                      Vendor_name:="Purch. rcpt. Header"."Buy-from Vendor Name";
                    IF NOT "Purch. rcpt. Header"."Bill Received" THEN
                       ShowOutPutGVar:=FALSE
                    ELSE
                    BEGIN


                    END;


                       IF "Purch. rcpt. Header"."Posting Date">0D THEN
                      "Pending Days":=TODAY-"Purch. rcpt. Header"."Posting Date";
                    END;
                  END;
                  IF NOT("Bill Transfered")  AND ("Purch. rcpt. Header"."Bill Received") THEN
                  BEGIN
                    "Sno."+=1;
                    ShowOutPutGVar:=TRUE;
                     "Total Value"+="Purch. Rcpt. Line"."Qty. Rcd. Not Invoiced"*"Purch. Rcpt. Line"."Unit Cost (LCY)";
                  END ELSE
                    ShowOutPutGVar:=FALSE;

                  IF Excel AND NOT("Bill Transfered") AND ("Purch. rcpt. Header"."Bill Received")  THEN
                  BEGIN
                    Row+=1;
                    Entercell(Row,1,FORMAT("Sno."),FALSE,TempExcelbuffer."Cell Type"::Number);
                    Entercell(Row,2,"Purch. Rcpt. Line"."Order No.",FALSE,TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row,3,"Purch. Rcpt. Line"."Document No.",FALSE,TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row,4,"No.",FALSE,TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row,5,Description,FALSE,TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row,6,Vendor_name,FALSE,TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row,7,FORMAT("Purch. Rcpt. Line".Quantity),FALSE,TempExcelbuffer."Cell Type"::Number);
                    Entercell(Row,8,FORMAT("Purch. Rcpt. Line"."Qty. Rcd. Not Invoiced"),FALSE,TempExcelbuffer."Cell Type"::Number);
                    Entercell(Row,9,FORMAT("Purch. Rcpt. Line"."Unit of Measure Code"),FALSE,TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row,10,FORMAT("Purch. Rcpt. Line"."Document date"),FALSE,TempExcelbuffer."Cell Type"::Date);
                    Entercell(Row,11,FORMAT("Purch. Rcpt. Line"."Unit Cost (LCY)"),FALSE,TempExcelbuffer."Cell Type"::Number);
                    Entercell(Row,12,FORMAT("Purch. Rcpt. Line"."Unit Cost (LCY)"*"Purch. Rcpt. Line"."Qty. Rcd. Not Invoiced"),FALSE,TempExcelbuffer."Cell Type"::Number);
                    Entercell(Row,13,FORMAT(TODAY-"Purch. Rcpt. Line"."Document date"),FALSE,TempExcelbuffer."Cell Type"::Date);
                    Entercell(Row,14,FORMAT("Purch. rcpt. Header"."Vendor Shipment No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                  END;
                END;
                // Rev01 Copy code from // Purch. Rcpt. Line, Body (3) - OnPostSection()
            end;

            trigger OnPostDataItem();
            begin
                 IF Excel THEN
                 BEGIN
                   TempExcelbuffer.CreateBook('Pending Invoices');//Rev01
                   TempExcelbuffer.WriteSheet('Pending Invoices',COMPANYNAME,USERID);//Rev01
                  TempExcelbuffer.CloseBook; //Rev01
                  TempExcelbuffer.OpenExcel; //Rev01
                  TempExcelbuffer.GiveUserControl;//Rev01

                 END;
            end;

            trigger OnPreDataItem();
            begin
                SETFILTER("Document date",'>%1',033108D);
                 IF Excel THEN
                   BEGIN
                     CLEAR(TempExcelbuffer);
                     TempExcelbuffer.DELETEALL;
                   END;
                IF BOM_Items THEN
                  "Purch. Rcpt. Line".SETRANGE("Purch. Rcpt. Line".Type,"Purch. Rcpt. Line".Type::Item);

                // Rev01 Copy code from  // Purch. Rcpt. Line, Header (2) - OnPreSection()
                Row+=1;
                IF Excel AND (Row=1)THEN
                BEGIN
                  EnterHeadings(Row,1,'Serial No.',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,2,'Purchase Order No.',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,3,'Inward No.',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,4,'Item No.',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,5,'Description',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,6,'Vendor',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,7,'Qty. Received',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,8,'Qty. To Invocice',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,9,'UOM',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,10,'Inward Date',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,11,'Unit Cost(LCY)',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,12,'Total Cost(LCY)',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,13,'Pending Days',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,14,'Vendor Shipment No.',TRUE,TempExcelbuffer."Cell Type"::Text);
                END;
                // Rev01 Copy code from  // Purch. Rcpt. Line, Header (2) - OnPreSection()
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Control1102152001)
                {
                    ShowCaption = false;
                    field(Choice;Choice)
                    {
                        Caption = 'Choice';
                    }
                    field(Excel;Excel)
                    {
                        Caption = 'Excel';
                    }
                    field(VAT;VAT)
                    {
                        Caption = 'VAT Bills';
                    }
                    field(BOM_Items;BOM_Items)
                    {
                        Caption = 'BOM Items';
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        VendFilter : Text[250];
        VendAddr : array [8] of Text[50];
        FormatAddr : Codeunit "Format Address";
        "Purch. rcpt. Header" : Record "Purch. Rcpt. Header";
        "Bill transfered Date" : Date;
        "Shpmt. No" : Text[30];
        Vendor : Record Vendor;
        Vendor_name : Text[50];
        "Total Value" : Decimal;
        "Sno." : Integer;
        TempExcelbuffer : Record "Excel Buffer";
        Row : Integer;
        Excel : Boolean;
        "Bill Transfered" : Boolean;
        "Pending Days" : Integer;
        Choice : Option Purchase,STR,Both;
        VAT : Boolean;
        BOM_Items : Boolean;
        PBML : Record "Production BOM Line";
        Pending_BillsCaptionLbl : Label 'Pending Bills';
        Purch__Rcpt__Line_QuantityCaptionLbl : Label 'Qty. Received';
        Qty__To_InvoiceCaptionLbl : Label 'Qty. To Invoice';
        Inward_DateCaptionLbl : Label 'Inward Date';
        UOMCaptionLbl : Label 'UOM';
        Total_CostCaptionLbl : Label 'Total Cost';
        Pending_DaysCaptionLbl : Label 'Pending Days';
        S_NoCaptionLbl : Label 'S.No';
        Vendor_Shipment_No_CaptionLbl : Label 'Vendor Shipment No.';
        Vendor_NameCaptionLbl : Label 'Vendor Name';
        ShowOutPutGVar : Boolean;

    (13012)]
    procedure Entercell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[1000];bold : Boolean;CellType : Option);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.",RowNo);
        TempExcelbuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelbuffer."Cell Value as Text" := CellValue;
        TempExcelbuffer.Bold:=bold ;
        TempExcelbuffer."Cell Type" := CellType;
        TempExcelbuffer.INSERT;
    end;

    (13021)]
    procedure EnterHeadings(RowNo : Integer;ColumnNo : Integer;CellValue : Text[100];Bold : Boolean;CellType : Option);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.",RowNo);
        TempExcelbuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelbuffer."Cell Value as Text" := FORMAT(CellValue);
        TempExcelbuffer.Bold:=Bold ;
        TempExcelbuffer."Cell Type" := CellType;
        TempExcelbuffer.Formula := '';
        TempExcelbuffer.INSERT;
    end;

    (13031)]
    procedure "Entercell New"();
    begin
    end;
}

