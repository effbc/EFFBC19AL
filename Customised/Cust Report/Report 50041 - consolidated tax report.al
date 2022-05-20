report 50041 "consolidated tax report"
{
    // version NAVIN3.70,Rev01,EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './consolidated tax report.rdlc';

    dataset
    {
        dataitem("Tax Entry";"Tax Entry")
        {
            DataItemTableView = SORTING(Type);
            column(FORMAT_TODAY_0_4_;FORMAT(TODAY,0,4))
            {
            }
            column(COMPANYNAME;COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO;CurrReport.PAGENO)
            {
            }
            column(USERID;USERID)
            {
            }
            column(Tax_EntryCaption;Tax_EntryCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Invoice_No_Caption;Invoice_No_CaptionLbl)
            {
            }
            column(Total_qtyCaption;Total_qtyCaptionLbl)
            {
            }
            column(Assessable_ValueCaption;Assessable_ValueCaptionLbl)
            {
            }
            column(CST__Caption;CST__CaptionLbl)
            {
            }
            column(CST_AmountCaption;CST_AmountCaptionLbl)
            {
            }
            column(BED_AmountCaption;BED_AmountCaptionLbl)
            {
            }
            column(Purch__Inv__Line__VAT___Caption;"Purch. Inv. Line".FIELDCAPTION("VAT %"))
            {
            }
            column(Vat_AmountCaption;Vat_AmountCaptionLbl)
            {
            }
            column(TotalCaption;TotalCaptionLbl)
            {
            }
            column(Form_codeCaption;Form_codeCaptionLbl)
            {
            }
            column(Vendor_Customer_NameCaption;Vendor_Customer_NameCaptionLbl)
            {
            }
            column(Customer_Order_No_Caption;Customer_Order_No_CaptionLbl)
            {
            }
            column(ProductCaption;ProductCaptionLbl)
            {
            }
            column(Concerned_Sales_PersonCaption;Concerned_Sales_PersonCaptionLbl)
            {
            }
            column(C_Form_StatusCaption;C_Form_StatusCaptionLbl)
            {
            }
            column(Form_No_Caption;Form_No_CaptionLbl)
            {
            }
            column(E_Cess_AmountCaption;E_Cess_AmountCaptionLbl)
            {
            }
            column(SHE_Cess_AmountCaption;SHE_Cess_AmountCaptionLbl)
            {
            }
            column(Tax_Entry_Entry_No_;"Entry No.")
            {
            }
            column(Tax_Entry_Type;Type)
            {
            }
            column(Tax_Entry_Document_No_;"Document No.")
            {
            }
            column(Customer_Name_Vendor_Name;Customer.Name+Vendor.Name)
            {
            }
            column(Tax_Entry___External_Document_No__;"Tax Entry"."External Document No.")
            {
            }
            column(Purch__Inv__Line_Quantity;PILQuantiy)
            {
            }
            column(Purch__Inv__Line__Purch__Inv__Line___Line_Amount_;PILLineAmount)
            {
            }
            column(Purch__Inv__Line__Tax___;"Purch. Inv. Line"."Tax %")
            {
            }
            column(Purch__Inv__Line__Purch__Inv__Line___Tax_Amount_;PILTaxAmount)
            {
            }
            column(Purch__Inv__Line__Purch__Inv__Line___Excise_Amount_;PILExciseAmount)
            {
            }
            column(Purch__Inv__Line__VAT___;"Purch. Inv. Line"."VAT %")
            {
            }
            column(Purch__Inv__Line__Purch__Inv__Line___Tax_Amount__Control1000000033;"Purch. Inv. Line"."Tax Amount")
            {
            }
            column(Purch__Inv__Line_Amount;PILAmount)
            {
            }
            column(Tax_Entry___Form_Code_;"Tax Entry"."Form Code")
            {
            }
            column(Purch__Inv__Line_Document_No_;"Purch. Inv. Line"."Document No.")
            {
            }
            column(Purch__Inv__Line_Line_No_;"Purch. Inv. Line"."Line No.")
            {
            }
            column(Sales_Invoice_Line_Document_No_;"Sales Invoice Line"."Document No.")
            {
            }
            column(Sales_Invoice_Line_Line_No_;"Sales Invoice Line"."Line No.")
            {
            }
            column(taxamt;taxamt)
            {
            }
            column(Customer_Name_Vendor_Name_Control1000000035;Customer.Name+Vendor.Name)
            {
            }
            column(bedamt;bedamt)
            {
            }
            column(taxper2;taxper2)
            {
            }
            column(vatamt;vatamt)
            {
            }
            column(Tax_Entry___Form_Code__Control1000000040;"Tax Entry"."Form Code")
            {
            }
            column(Tax_Entry___External_Document_No___Control1000000041;"Tax Entry"."External Document No.")
            {
            }
            column(qty1;qty1)
            {
            }
            column(asseblevalue;asseblevalue)
            {
            }
            column(taxper1;taxper1)
            {
            }
            column(cusordno;cusordno)
            {
            }
            column(Sales_Invoice_Line_Amount;SILAmount)
            {
            }
            column(desctext;desctext)
            {
            }
            column(person_name_;"person name")
            {
            }
            column(cap;cap)
            {
            }
            column(SalesInvoiceHeader__Form_No__;SalesInvoiceHeader."Form No.")
            {
            }
            column(bedamt_2_100;bedamt*2/100)
            {
            }
            column(bedamt_1_100;bedamt*1/100)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF SalesInvoiceHeader.GET("Document No.") THEN
                  IF Customer.GET(SalesInvoiceHeader."Sell-to Customer No.") THEN;
                IF PurchaseInvoiceHeader.GET("Document No.") THEN
                  IF Vendor.GET(PurchaseInvoiceHeader."Buy-from Vendor No.") THEN;

                LastFieldNo := FIELDNO(Type);
                //"Purch. Inv. Line" data Item
                //Rev01
                PILQuantiy := 0;
                PILAmount := 0;
                PILLineAmount := 0;
                PILTaxAmount := 0;
                PILExciseAmount := 0;
                //Rev01
                "Purch. Inv. Line".RESET;
                "Purch. Inv. Line".SETCURRENTKEY("Document No.","Line No.");
                "Purch. Inv. Line".SETRANGE("Document No.","Tax Entry"."Document No.");
                IF "Purch. Inv. Line".FINDFIRST THEN
                  REPEAT
                    IF c<>"Tax Entry"."External Document No." THEN BEGIN
                      //Rev01 Code Copied From //Purch. Inv. Line, Footer (1) - OnPreSection()
                      //Rev01
                      PILQuantiy += "Purch. Inv. Line".Quantity;
                      PILAmount += "Purch. Inv. Line".Amount;
                      PILLineAmount += "Purch. Inv. Line"."Line Amount";
                      PILTaxAmount += "Purch. Inv. Line"."Tax Amount";
                      PILExciseAmount += "Purch. Inv. Line"."Excise Amount";
                      //Rev01
                      Amount:="Purch. Inv. Line"."Line Amount"+"Purch. Inv. Line"."Tax Amount"+
                      "Purch. Inv. Line"."Excise Amount"+"Purch. Inv. Line"."Tax Amount";
                      c:="Tax Entry"."External Document No.";
                      //Rev01 Code Copied From //Purch. Inv. Line, Footer (1) - OnPreSection()
                    END;
                  UNTIL "Purch. Inv. Line".NEXT=0;
                //"Purch. Inv. Line" data Item

                //"Sales Invoice Line" Data Item
                bedamt:=0;
                qty1:=0;
                taxamt:=0;
                vatamt:=0;
                asseblevalue:=0;
                Amount:=0;
                cessamt:=0;
                sheamount:=0;
                taxper1:=0;
                taxper2:=0;
                //Rev01
                SILQuantiy := 0;
                SILAmount := 0;
                SILLineAmount := 0;
                SILTaxAmount := 0;
                SILExciseAmount := 0;
                //Rev01
                "Sales Invoice Line".RESET;
                "Sales Invoice Line".SETCURRENTKEY("Document No.","Line No.");
                "Sales Invoice Line".SETRANGE("Document No.","Tax Entry"."Document No.");
                IF "Sales Invoice Line".FINDFIRST THEN
                  REPEAT
                    amt1:=0;
                    IF c<>"Tax Entry"."External Document No." THEN BEGIN
                      //Rev01
                      SILQuantiy += "Sales Invoice Line".Quantity;
                      SILAmount += "Sales Invoice Line".Amount;
                      SILLineAmount += "Sales Invoice Line"."Line Amount";
                      SILTaxAmount += "Sales Invoice Line"."Tax Amount";
                      SILExciseAmount += "Sales Invoice Line"."Excise Amount";
                      //Rev01
                      IF ("Sales Invoice Line".Quantity<>0) AND("Sales Invoice Line".Amount<>0) THEN
                      BEGIN
                        IF ("Sales Invoice Line"."Tax Area Code"='SALES CST') THEN
                        taxper1:="Sales Invoice Line"."Tax %";
                        IF ("Sales Invoice Line"."Tax Area Code"='SALES VAT') THEN
                        taxper2:="Sales Invoice Line"."Tax %";
                      END;
                      Amount:=amt1+"Sales Invoice Line"."Amount To Customer";
                      bedamt:=bedamt+"Sales Invoice Line"."BED Amount";
                      IF "Sales Invoice Line"."Unit Price"<>0 THEN
                        qty1:=qty1+"Sales Invoice Line".Quantity;
                      asseblevalue+="Sales Invoice Line"."Line Amount";
                      IF ("Sales Invoice Line"."Tax Area Code"='SALES CST') THEN
                        taxamt+="Sales Invoice Line"."Tax Amount";
                      IF ("Sales Invoice Line"."Tax Area Code"='SALES VAT') THEN
                        vatamt+="Sales Invoice Line"."Tax Amount";
                      cessamt+="Sales Invoice Line"."eCess Amount";
                    END;
                  UNTIL "Sales Invoice Line".NEXT = 0;
                //Rev01 Code Copied from  //Sales Invoice Line, Footer (1) - OnPreSection()
                cap:='';
                cusordno := '';
                "person name" := '';
                desctext:= '';
                c:="Tax Entry"."External Document No.";
                SalesInvoiceHeader.RESET;
                SalesInvoiceHeader.SETRANGE(SalesInvoiceHeader."No.","Sales Invoice Line"."Document No.");
                IF SalesInvoiceHeader.FIND('-') THEN
                  cusordno:=SalesInvoiceHeader."Customer OrderNo.";
                  IF SalesInvoiceHeader."C-form Status"=1 THEN
                    cap:='Not Received';
                  IF SalesInvoiceHeader."C-form Status"=2 THEN
                    cap:='Received';
                  IF SalesInvoiceHeader."C-form Status"=3 THEN
                    cap:='Difference Amount';

                "sales person".RESET;
                "sales person".SETRANGE("sales person".Code,SalesInvoiceHeader."Salesperson Code");
                IF "sales person".FIND('-') THEN
                  "person name":="sales person".Name;

                IF "Sales Invoice Line"."Amount To Customer">0 THEN
                  desctext:="Sales Invoice Line".Description;
                //Rev01 Code Copied from //Sales Invoice Line, Footer (1) - OnPreSection()
                //Rev01 Code Copied from  //Sales Invoice Line, Footer (1) - OnPostSection()
                IF SILQuantiy<>0 THEN  //rev01
                BEGIN
                  row:=row+1;
                  EnterCell(row,1,FORMAT(SalesInvoiceHeader."Posting Date"),FALSE,TempExcelBuffer."Cell Type"::Date);
                  EnterCell(row,2,FORMAT(SalesInvoiceHeader."Sell-to Customer Name"),FALSE,TempExcelBuffer."Cell Type"::Text);
                  EnterCell(row,3,FORMAT(SalesInvoiceHeader."Customer OrderNo."),FALSE,TempExcelBuffer."Cell Type"::Text);
                  EnterCell(row,4,FORMAT(SalesInvoiceHeader."External Document No."),FALSE,TempExcelBuffer."Cell Type"::Text);
                  EnterCell(row,5,FORMAT(desctext),FALSE,TempExcelBuffer."Cell Type"::Text);
                  EnterCell(row,6,FORMAT(qty1),FALSE,TempExcelBuffer."Cell Type"::Number);
                  EnterCell(row,7,FORMAT(taxper2),FALSE,TempExcelBuffer."Cell Type"::Number);
                  EnterCell(row,8,FORMAT(ROUND(vatamt,1)),FALSE,TempExcelBuffer."Cell Type"::Number);
                  EnterCell(row,9,FORMAT(taxper1),FALSE,TempExcelBuffer."Cell Type"::Number);
                  EnterCell(row,10,FORMAT(ROUND(taxamt,1)),FALSE,TempExcelBuffer."Cell Type"::Number);
                  EnterCell(row,11,FORMAT(ROUND(Amount,1)),FALSE,TempExcelBuffer."Cell Type"::Number);
                  EnterCell(row,12,FORMAT("Tax Entry"."Form Code"),FALSE,TempExcelBuffer."Cell Type"::Text);
                  EnterCell(row,14,FORMAT("person name"),FALSE,TempExcelBuffer."Cell Type"::Text);
                  IF (taxper1=12.5) OR(taxper2=12.5)  THEN
                  EnterCell(row,15,FORMAT('Not Applicable'),FALSE,TempExcelBuffer."Cell Type"::Text)
                  ELSE
                  EnterCell(row,15,FORMAT(SalesInvoiceHeader."C-form Status"),FALSE,TempExcelBuffer."Cell Type"::Text);
                  EnterCell(row,16,FORMAT(SalesInvoiceHeader."Form No."),FALSE,TempExcelBuffer."Cell Type"::Text);
                  EnterCell(row,17,FORMAT(ROUND(bedamt,1)),FALSE,TempExcelBuffer."Cell Type"::Number);
                  EnterCell(row,18,FORMAT(ROUND(2/3*cessamt,1)),FALSE,TempExcelBuffer."Cell Type"::Number);
                  EnterCell(row,19,FORMAT(ROUND(1/3*cessamt,1)),FALSE,TempExcelBuffer."Cell Type"::Number);
                  EnterCell(row,20,FORMAT(ROUND(asseblevalue,1)),FALSE,TempExcelBuffer."Cell Type"::Number);
                  EnterCell(row,21,FORMAT(SalesInvoiceHeader."Customer Posting Group"),FALSE,TempExcelBuffer."Cell Type"::Text);
                END;
                //Rev01 Code Copied from  //Sales Invoice Line, Footer (1) - OnPostSection()

                //"Sales Invoice Line" Data Item
            end;

            trigger OnPreDataItem();
            begin
                TempExcelBuffer.DELETEALL;
                CLEAR(TempExcelBuffer);
                row:=0;
                
                IF SelectType = 0 THEN BEGIN
                  SETRANGE(Type,Type::Sale);
                  CustVendorNo := 'Customer No.';
                  CustVendorName := 'Customer Name';
                END ELSE BEGIN
                  SETRANGE(Type,Type::Purchase);
                  CustVendorNo := 'Vendor No.';
                  CustVendorName := 'Vendor Name';
                END;
                IF "fyear08-09"=TRUE THEN
                SETRANGE("Posting Date",(040108D),(033109D));
                SETRANGE("Posting Date",FromDate,EndDate);
                IF "fyear07-08"=TRUE THEN
                SETRANGE("Posting Date",(040107D),(033108D));
                IF "fyear09-10"=TRUE THEN
                SETRANGE("Posting Date",(040109D),(033110D));
                IF "fyear10-11"=TRUE THEN
                SETRANGE("Posting Date",(040110D),(033111D));
                IF "fyear11-12"=TRUE THEN
                SETRANGE("Posting Date",(040111D),(033112D));
                IF "fyear12-13"=TRUE THEN
                SETRANGE("Posting Date",(040112D),(033113D));
                IF "fyear13-14"=TRUE THEN
                SETRANGE("Posting Date",(040113D),(033114D));
                IF "fyear14-15"=TRUE THEN
                SETRANGE("Posting Date",(040114D),(033115D));
                
                IF CForm THEN
                  SETRANGE("Form Code",'C')
                ELSE
                  SETFILTER("Form Code",'<>%1','C');
                
                
                //Rev01 Code Copied from // Tax Entry, Header (1) - OnPreSection()
                
                 /*
                    FOR i:=1 TO 30 DO
                    BEGIN
                    a[i]:="Purch. Inv. Line"."Document No.";
                   "Purch. Inv. Line".NEXT "Purch. Inv. Line".NEXT;
                    END;
                 */
                 sumfqty:=0;
                    i:=0;
                    totalamt:=0;
                   // j:="Purch. Inv. Line"."Document No.";
                row+=1;
                EnterHeadings(row,1,'DATE',TRUE,TempExcelBuffer."Cell Type"::Text);
                EnterHeadings(row,2,'CUSTOMER_NAME',TRUE,TempExcelBuffer."Cell Type"::Text);
                EnterHeadings(row,3,'CUSTOMER ORDER_NO',TRUE,TempExcelBuffer."Cell Type"::Text);
                EnterHeadings(row,4,'INVOICE NO',TRUE,TempExcelBuffer."Cell Type"::Text);
                EnterHeadings(row,5,'PRODUCT',TRUE,TempExcelBuffer."Cell Type"::Text);
                EnterHeadings(row,6,'QUANTITY',TRUE,TempExcelBuffer."Cell Type"::Text);
                EnterHeadings(row,7,'VAT %',TRUE,TempExcelBuffer."Cell Type"::Text);
                EnterHeadings(row,8,'VAT AMOUNT',TRUE,TempExcelBuffer."Cell Type"::Text);
                EnterHeadings(row,9,'TAX %',TRUE,TempExcelBuffer."Cell Type"::Text);
                EnterHeadings(row,10,'TAX AMOUNT',TRUE,TempExcelBuffer."Cell Type"::Text);
                EnterHeadings(row,11,'BILLED AMOUNT',TRUE,TempExcelBuffer."Cell Type"::Text);
                EnterHeadings(row,12,'FORM',TRUE,TempExcelBuffer."Cell Type"::Text);
                EnterHeadings(row,13,'REMARKS',TRUE,TempExcelBuffer."Cell Type"::Text);
                EnterHeadings(row,14,'CONCERNED EXECUTIVE',TRUE,TempExcelBuffer."Cell Type"::Text);
                EnterHeadings(row,15,'C-FORM STATUS',TRUE,TempExcelBuffer."Cell Type"::Text);
                EnterHeadings(row,16,'FORM NO.',TRUE,TempExcelBuffer."Cell Type"::Text);
                EnterHeadings(row,17,'EXCISE AMOUNT',TRUE,TempExcelBuffer."Cell Type"::Text);
                EnterHeadings(row,18,'E.CESS',TRUE,TempExcelBuffer."Cell Type"::Text);
                EnterHeadings(row,19,'SHE.CESS',TRUE,TempExcelBuffer."Cell Type"::Text);
                EnterHeadings(row,20,'ASSEBLE VALUE',TRUE,TempExcelBuffer."Cell Type"::Text);
                EnterHeadings(row,21,'CUSTOMER POSTING GROUP',TRUE,TempExcelBuffer."Cell Type"::Text);
                
                
                //Rev01 Code Copied from // Tax Entry, Header (1) - OnPreSection()

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(General)
                {
                    field(SelectType;SelectType)
                    {
                        Caption = 'Type';
                    }
                    field(CForm;CForm)
                    {
                        Caption = 'C form';
                    }
                    field("fyear08-09";"fyear08-09")
                    {
                        Caption = 'Financial Year 08-09';
                    }
                    field("fyear07-08";"fyear07-08")
                    {
                        Caption = 'Financial Year 07-08';
                    }
                    field("fyear09-10";"fyear09-10")
                    {
                        Caption = 'Financial Year 09-10';
                    }
                    field("fyear10-11";"fyear10-11")
                    {
                        Caption = 'Financial Year 10-11';
                    }
                    field("fyear11-12";"fyear11-12")
                    {
                        Caption = 'Financial Year 11-12';
                    }
                    field("fyear12-13";"fyear12-13")
                    {
                        Caption = 'Financial Year 12-13';
                    }
                    field("fyear13-14";"fyear13-14")
                    {
                        Caption = 'Financial Year 13-14';
                    }
                    field("fyear14-15";"fyear14-15")
                    {
                        Caption = 'Financial Year 14-15';
                    }
                    field(Excel;Excel)
                    {
                        Caption = 'Excel';
                    }
                    field(Option;Option)
                    {
                        Caption = 'Option';
                        Visible = false;
                    }
                    field(FileName;FileName)
                    {
                        Caption = 'Workbook File Name';

                        trigger OnAssistEdit();
                        begin
                            ////Rev01 Begin
                            RequestFile;
                            FileName := ExcelBuf.SelectSheetsName(ServerFileName);

                            //FileName := CommonDialogMgt.OpenFile(Text002,FileName,2,'',0);
                            //Rev01 End
                        end;

                        trigger OnValidate();
                        begin
                            RequestFile; //Rev01
                        end;
                    }
                    field(SheetName;SheetName)
                    {
                        Caption = 'Worksheet Name';

                        trigger OnAssistEdit();
                        begin
                            //Rev01 Begin
                            IF ServerFileName = '' THEN
                              RequestFile;

                            SheetName := ExcelBuf.SelectSheetsName(ServerFileName);

                            //SheetName := ExcelBuf.SelectSheetsName(FileName);
                            //Rev01 End
                        end;
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

    trigger OnPostReport();
    begin
        /*IF Option = Option::"Update Workbook" THEN BEGIN
          TempExcelBuffer.OpenBook(FileName,SheetName);
          TempExcelBuffer.CreateSheet(SheetName,'',COMPANYNAME,USERID);
        END ELSE BEGIN
          TempExcelBuffer.CreateBook('');//B2B
          //TempExcelBuffer.CreateSheet('test excel','',COMPANYNAME,'');//B2B
        END;
        */
        IF Excel THEN
         BEGIN
         /*
          TempExcelBuffer.CreateBook('consolidated tax report','');//Rev01 //EFFUPG
          TempExcelBuffer.WriteSheet('consolidated tax report',COMPANYNAME,USERID);//Rev01
          TempExcelBuffer.CloseBook; //Rev01
          TempExcelBuffer.OpenExcel; //Rev01
          TempExcelBuffer.GiveUserControl;//Rev01
          */
          TempExcelBuffer.CreateBookAndOpenExcel('','consolidated tax report','consolidated tax report',COMPANYNAME,USERID); //EFFUPG
         END;
        
        
        
        /*IF Option = Option::"Update Workbook" THEN BEGIN
          RequestOptionsForm.FileName.ENABLED(TRUE);
          RequestOptionsForm.SheetName.ENABLED(TRUE);
        END ELSE BEGIN
          FileName := '';
          SheetName := '';
          RequestOptionsForm.FileName.ENABLED(FALSE);
          RequestOptionsForm.SheetName.ENABLED(FALSE);
        END;
        */

    end;

    var
        LastFieldNo : Integer;
        FooterPrinted : Boolean;
        TotalFor : Label '"Total for "';
        aofqty : array [10] of Integer;
        name : Text[30];
        sumfqty : Integer;
        lineno : Integer;
        i : Integer;
        nofrec : array [30] of Integer;
        total : Integer;
        amount : Decimal;
        j : Code[10];
        d : Code[10];
        a : array [30] of Code[10];
        totalamt : Decimal;
        c : Text[30];
        company : Record "Company Information";
        SelectType : Option Sales,Purchases;
        CustVendorNo : Text[30];
        CustVendorName : Text[50];
        FromDate : Date;
        EndDate : Date;
        CForm : Boolean;
        SalesInvoiceHeader : Record "Sales Invoice Header";
        PurchaseInvoiceHeader : Record "Purch. Inv. Header";
        Customer : Record Customer;
        Vendor : Record Vendor;
        cusordno : Code[65];
        TempExcelBuffer : Record "Excel Buffer" temporary;
        row : Integer;
        Excel : Boolean;
        "sales person" : Record "Salesperson/Purchaser";
        "person name" : Text[40];
        taxper1 : Decimal;
        taxper2 : Decimal;
        FileName : Text[250];
        SheetName : Text[250];
        Option : Option "Create Workbook","Update Workbook";
        Text002 : Label 'Update Workbook';
        "fyear08-09" : Boolean;
        "fyear09-10" : Boolean;
        "fyear10-11" : Boolean;
        cap : Text[30];
        "fyear07-08" : Boolean;
        bedamt : Decimal;
        qty1 : Decimal;
        asseblevalue : Decimal;
        taxamt : Decimal;
        vatamt : Decimal;
        amt1 : Decimal;
        desctext : Text[1000];
        cessamt : Decimal;
        sheamount : Decimal;
        "fyear11-12" : Boolean;
        "fyear12-13" : Boolean;
        Tax_EntryCaptionLbl : Label 'Tax Entry';
        CurrReport_PAGENOCaptionLbl : Label 'Page';
        Invoice_No_CaptionLbl : Label 'Invoice No.';
        Total_qtyCaptionLbl : Label 'Total qty';
        Assessable_ValueCaptionLbl : Label 'Assessable Value';
        CST__CaptionLbl : Label 'CST %';
        CST_AmountCaptionLbl : Label 'CST Amount';
        BED_AmountCaptionLbl : Label 'BED Amount';
        Vat_AmountCaptionLbl : Label 'Vat Amount';
        TotalCaptionLbl : Label 'Total';
        Form_codeCaptionLbl : Label 'Form code';
        Vendor_Customer_NameCaptionLbl : Label 'Vendor/Customer Name';
        Customer_Order_No_CaptionLbl : Label 'Customer Order No.';
        ProductCaptionLbl : Label 'Product';
        Concerned_Sales_PersonCaptionLbl : Label 'Concerned Sales Person';
        C_Form_StatusCaptionLbl : Label 'C-Form Status';
        Form_No_CaptionLbl : Label 'Form No.';
        E_Cess_AmountCaptionLbl : Label 'E.Cess Amount';
        SHE_Cess_AmountCaptionLbl : Label 'SHE.Cess Amount';
        "fyear13-14" : Boolean;
        "fyear14-15" : Boolean;
        "--Rev01---" : Integer;
        ServerFileName : Text;
        FileMgt : Codeunit "File Management";
        Text006 : Label 'Import Excel File';
        Text029 : Label 'You must enter a file name.';
        ExcelBuf : Record "Excel Buffer";
        "Purch. Inv. Line" : Record "Purch. Inv. Line";
        "Sales Invoice Line" : Record "Sales Invoice Line";
        PILQuantiy : Decimal;
        PILAmount : Decimal;
        PILLineAmount : Decimal;
        PILTaxAmount : Decimal;
        PILExciseAmount : Decimal;
        SILQuantiy : Decimal;
        SILAmount : Decimal;
        SILLineAmount : Decimal;
        SILTaxAmount : Decimal;
        SILExciseAmount : Decimal;

    [LineStart(3258)]
    procedure EnterCell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[250];Bold : Boolean;CellType : Option);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.",RowNo);
        TempExcelBuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelBuffer."Cell Value as Text" := CellValue;
        TempExcelBuffer.Bold:=Bold ;
        TempExcelBuffer."Cell Type" := CellType;
        TempExcelBuffer.INSERT;
    end;

    [LineStart(3267)]
    procedure EnterHeadings(RowNo : Integer;ColumnNo : Integer;CellValue : Text[250];Bold : Boolean;CellType : Option);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.",RowNo);
        TempExcelBuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelBuffer."Cell Value as Text" := FORMAT(CellValue);
        TempExcelBuffer.Bold:=Bold ;
        TempExcelBuffer.Formula := '';
        TempExcelBuffer."Cell Type" := CellType;
        TempExcelBuffer.INSERT;
    end;

    [LineStart(3277)]
    procedure UpdateRequestForm();
    begin
    end;

    [LineStart(3280)]
    procedure "--Rev01--"();
    begin
    end;

    [LineStart(3283)]
    procedure RequestFile();
    begin
        IF FileName <> '' THEN
          ServerFileName := FileMgt.UploadFile(Text006,FileName)
        ELSE
          ServerFileName := FileMgt.UploadFile(Text006,'.xlsx');

        ValidateServerFileName;
        FileName := FileMgt.GetFileName(ServerFileName);
    end;

    [LineStart(3292)]
    local procedure ValidateServerFileName();
    begin
        IF ServerFileName = '' THEN BEGIN
          FileName := '';
          SheetName := '';
          ERROR(Text029);
        END;
    end;
}

