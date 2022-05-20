report 50201 totalorderDetails
{
    // version EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './totalorderDetails.rdlc';

    dataset
    {
        dataitem("Sales Header";"Sales Header")
        {
            DataItemTableView = SORTING(Order Date,Customer Posting Group) ORDER(Ascending) WHERE(Order Status=FILTER(<>Temporary Close));
            RequestFilterFields = "Order Date";
            column(CUSTOMER_ORDER_NO_Caption;CUSTOMER_ORDER_NO_CaptionLbl)
            {
            }
            column(CUSTOMER_NAMECaption;CUSTOMER_NAMECaptionLbl)
            {
            }
            column(PENDING_AMOUNTCaption;PENDING_AMOUNTCaptionLbl)
            {
            }
            column(SUPPLY_AMOUNTCaption;SUPPLY_AMOUNTCaptionLbl)
            {
            }
            column(INSTALLATION_AMOUNTCaption;INSTALLATION_AMOUNTCaptionLbl)
            {
            }
            column(ORDER_NO_Caption;ORDER_NO_CaptionLbl)
            {
            }
            column(ORDER_DATECaption;ORDER_DATECaptionLbl)
            {
            }
            column(DAYS_PENDINGCaption;DAYS_PENDINGCaptionLbl)
            {
            }
            column(ORDER_VALUECaption;ORDER_VALUECaptionLbl)
            {
            }
            column(INVOICED_AMOUNTCaption;INVOICED_AMOUNTCaptionLbl)
            {
            }
            column(TOTAL_RECEIVED_AMOUNTCaption;TOTAL_RECEIVED_AMOUNTCaptionLbl)
            {
            }
            column(TOTAL_DEDUCTION_AMTCaption;TOTAL_DEDUCTION_AMTCaptionLbl)
            {
            }
            column(BALANCE_NEED_TO_RECEIVECaption;BALANCE_NEED_TO_RECEIVECaptionLbl)
            {
            }
            column(Sales_Header_Document_Type;"Document Type")
            {
            }
            column(Sales_Header_No_;"No.")
            {
            }
            dataitem("Sales Line";"Sales Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document No.) ORDER(Ascending);
                column(Sales_Header___Customer_OrderNo__;"Sales Header"."Customer OrderNo.")
                {
                }
                column(pendingamt;pendingamt)
                {
                }
                column(Sales_Header___Sell_to_Customer_Name_;"Sales Header"."Sell-to Customer Name")
                {
                }
                column(supplyamt;supplyamt)
                {
                }
                column(installationamt;installationamt)
                {
                }
                column(Sales_Header___Total_Order_Amount_;"Sales Header"."Total Order Amount")
                {
                }
                column(Sales_Header___No__;"Sales Header"."No.")
                {
                }
                column(ordreldate;ordreldate)
                {
                }
                column(pendingdays;pendingdays)
                {
                }
                column(invoicedamt;invoicedamt)
                {
                }
                column(totalreceived_dedu;totalreceived-dedu)
                {
                }
                column(dedu;dedu)
                {
                }
                column(invoicedamt_totalreceived;invoicedamt-totalreceived)
                {
                }
                column(Sales_person_name_;"Sales person name")
                {
                }
                column(Sales_Header___Customer_Posting_Group_;"Sales Header"."Customer Posting Group")
                {
                }
                column(Sales_Line_Document_Type;"Document Type")
                {
                }
                column(Sales_Line_Document_No_;"Document No.")
                {
                }
                column(Sales_Line_Line_No_;"Line No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                      tempqty:="Sales Line".Quantity-"Sales Line"."Quantity Invoiced";
                       tempunitprice:="Sales Line"."Unitcost(LOA)";
                     IF (tempqty>0) AND (("Sales Line".Type="Sales Line".Type::Item)) THEN
                         BEGIN
                          IF (("Sales Line"."Gen. Prod. Posting Group"='MPBI-FINIS') OR ("Sales Line"."Gen. Prod. Posting Group"='EDB-FINISH')
                          OR("Sales Line"."Gen. Prod. Posting Group"='COMP-UNITS')) THEN
                          PMANF:=PMANF+(tempqty*tempunitprice);
                          IF (("Sales Line"."Gen. Prod. Posting Group"='RAW-MAT') OR ("Sales Line"."Gen. Prod. Posting Group"='BOI'))THEN
                          PBOI:=PBOI+("Sales Line"."Outstanding Quantity"*tempunitprice);
                          IF (("Sales Line"."Gen. Prod. Posting Group"='SOFTWARE'))THEN
                          PSW:=PSW+(tempqty*tempunitprice);
                          pendingamt:=pendingamt+(tempqty*tempunitprice);
                          supplyamt+=(tempqty*"Sales Line"."Unitcost(LOA)");
                         END;
                        IF "Sales Line"."Qty. Shipped Not Invoiced">0 THEN
                        BEGIN
                         IF (("Sales Line"."Gen. Prod. Posting Group"='BOI') OR ("Sales Line"."Gen. Prod. Posting Group"='RAW-MAT'))THEN
                          PBOI+="Sales Line"."Qty. Shipped Not Invoiced"*tempunitprice;
                        END;
                        IF (tempqty>0) THEN
                        BEGIN
                          IF ("Sales Line".Type="Sales Line".Type::"G/L Account") AND ("Sales Line"."No."='47300')  THEN
                            BEGIN
                               installationamt:=installationamt+(tempqty*"Sales Line"."Unitcost(LOA)");
                               pendingamt+="Sales Line"."Line Amount";
                               PINST:=PINST+(tempqty*"Sales Line"."Unitcost(LOA)");
                            END;
                          IF ("Sales Line".Type="Sales Line".Type::"G/L Account") AND ("Sales Line"."No."='46300')  THEN
                            BEGIN
                                  PBOI:=PBOI+("Sales Line"."Outstanding Quantity"*tempunitprice);
                            END;

                         IF (("Sales Line".Type="Sales Line".Type::"G/L Account")AND(("Sales Line"."No."='47505')OR("Sales Line"."No."='46400')
                         OR("Sales Line"."No."='18100'))) THEN
                          PSW:=PSW+(tempqty*tempunitprice);
                        END;
                        IF pendingamt=0 THEN
                          CurrReport.SKIP;
                    "sales person".SETRANGE("sales person".Code,"Sales Header"."Salesperson Code");
                    IF "sales person".FIND('-') THEN
                    "Sales person name":="sales person".Name;
                    "payment terms".SETRANGE("payment terms".Code,"Sales Header"."Payment Terms Code");
                    IF "payment terms".FIND('-') THEN
                     paymentt1:="payment terms".Description;
                end;

                trigger OnPreDataItem();
                begin
                       //ordervalue:=0;
                       //supplyamt:=0;
                       //pendingamt:=0;
                       //installationamt:=0;
                       totalordervalue:=0;
                       taxamt:=0;
                       vatamt:=0;
                       exciseamt:=0;
                       pendingamt:=0;
                       cessamt:=0;
                       tempqty:=0;
                      PMANF:=0;
                      PBOI:=0;
                      PINST:=0;
                      PSW:=0;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                invoicedamt:=0;
                dedu:=0;
                totalreceived:=0;
                installationbilled:=0;
                OMANF:=0;
                OBOI:=0;
                OINST:=0;
                OSW:=0;
                Dmanf:=0;
                DBOI:=0;
                DINST:=0;
                DSW:=0;
                "Sales Header".CALCFIELDS("Sales Header"."Installation Amount","Sales Header"."Bought out Items Amount",
                "Sales Header"."Software Amount","Sales Header"."Total Order(LOA)Value");
                OINST:="Sales Header"."Installation Amount";
                OBOI:="Sales Header"."Bought out Items Amount";
                OSW:="Sales Header"."Software Amount";
                OMANF:="Sales Header"."Total Order(LOA)Value"-(OINST+OBOI+OSW);
                SIH.SETRANGE(SIH."Sell-to Customer No.","Sales Header"."Sell-to Customer No.");
                SIH.SETRANGE(SIH."Order No.","Sales Header"."No.");
                IF SIH.FIND('-') THEN
                REPEAT
                SIL.SETRANGE(SIL."Document No.",SIH."No.");
                IF SIL.FIND('-') THEN
                REPEAT
                pos:=STRPOS(SIL."External Document No.",str);
                pos1:=STRPOS(SIL."External Document No.",str1);
                pos2:=STRPOS(SIL."External Document No.",str2);
                IF (pos<>0)AND(SIL."No."<>'47505') AND (SIL."No."<>'46400')AND (SIL."No."<>'18100') THEN
                BEGIN
                installationbilled+=SIL."Amount To Customer";
                DINST:=DINST+SIL."Amount To Customer";
                END;
                IF (pos<>0)AND((SIL."No."='47505') OR (SIL."No."='46400')OR(SIL."No."='18100')) THEN
                DSW:=DSW+SIL."Amount To Customer";

                IF (SIL."External Document No."='031') OR(SIL."External Document No."='035')  THEN
                DSW:=DSW+SIL."Amount To Customer";

                IF pos2<>0 THEN
                DBOI:=DBOI+SIL."Amount To Customer";

                IF (pos1=0)AND(pos=0)THEN
                BEGIN
                invoicedamt+=SIL."Amount To Customer";
                END;

                IF (pos1<>0) AND ((SIL."No."='47505')OR(SIL."No."='46400')OR(SIL."No."='18100'))  THEN
                DSW:=DSW+SIL."Amount To Customer";

                UNTIL SIL.NEXT=0;
                CLE.SETRANGE(CLE."Customer No.",SIH."Sell-to Customer No.");
                CLE.SETRANGE(CLE."Document No.",SIH."No.");
                CLE.SETRANGE(CLE."External Document No.",SIH."External Document No.");
                IF CLE.FIND('-') THEN
                REPEAT
                  CLE.CALCFIELDS(CLE.Amount,CLE."Remaining Amount");
                  amt:=CLE.Amount;
                  remain:=CLE."Remaining Amount";
                  "Total Remin":="Total Remin"+remain;
                  total_amt:=total_amt+CLE.Amount;
                  totalremain:=totalremain+CLE."Remaining Amount";
                  totalreceived:=totalreceived+(amt-remain);
                  //totalinvoiced:=totalinvoiced+amt;
                UNTIL CLE.NEXT=0;
                CLE2.SETRANGE(CLE2."Customer No.",SIH."Sell-to Customer No.");
                CLE2.SETRANGE(CLE2."Customer ord No",SIH."Order No.");
                CLE2.SETFILTER(CLE2."Document No.",'JV*');
                IF CLE2.FIND('-') THEN
                REPEAT
                   CLE2.CALCFIELDS(CLE2.Amount);
                 // desc:=CLE2.Description;
                  //IF STRLEN(desc)>20 THEN
                    //desc+=desc+FORMAT(charline);
                  //dedu+=CLE2.Amount;
                IF (docno=CLE2."Document No.") THEN
                //CurrReport.SKIP
                j:=1
                ELSE
                BEGIN
                docno:=CLE2."Document No.";
                GE.SETRANGE(GE."Document No.",CLE2."Document No.");
                IF GE.FIND('-') THEN
                REPEAT
                IF GE."G/L Account No."='23700' THEN
                BEGIN
                //  AC1+=GE."Debit Amount";
                  dedu+=GE."Debit Amount";
                END;
                IF GE."G/L Account No."='20400' THEN
                BEGIN
                ///  AC1+=GE."Credit Amount";
                  dedu+=GE."Credit Amount";
                END;

                IF (GE."G/L Account No."='53500') OR (GE."G/L Account No."='24606') THEN
                BEGIN
                //AC2+=GE."Debit Amount";
                dedu+=GE."Debit Amount";
                END;
                IF GE."G/L Account No."='59600' THEN
                BEGIN
                //AC3+=GE."Debit Amount";
                dedu+=GE."Debit Amount";
                END;
                IF GE."G/L Account No."='25700' THEN
                BEGIN
                //  sd+=GE."Debit Amount";
                  dedu+=GE."Debit Amount";
                END;
                IF GE."G/L Account No."='46200' THEN
                BEGIN
                 // CV+=GE."Debit Amount";
                  dedu+=GE."Debit Amount";
                END;

                UNTIL  GE.NEXT=0;
                END;
                UNTIL CLE2.NEXT=0;

                UNTIL SIH.NEXT=0;
                Dmanf:=invoicedamt-DBOI-DSW;
                //  CurrReport.CREATETOTALS(ordervalue);
                 CurrReport.CREATETOTALS("Sales Header"."Total Order(LOA)Value");
                // CurrReport.CREATETOTALS(ordervalue);
                 CurrReport.CREATETOTALS(pendingamt);
                 CurrReport.CREATETOTALS(supplyamt);
                 CurrReport.CREATETOTALS(installationamt);
            end;

            trigger OnPreDataItem();
            begin
                  pendingamt:=0;
                  ordervalue:=0;
                  supplyamt:=0;
                  i:=1;
                  installationamt:=0;
                  str:='IN';
                  str1:='SI';
                  str2:='CI';
                 IF Excel THEN
                 BEGIN
                 CLEAR(TempExcelBuffer);
                 TempExcelBuffer.DELETEALL;
                 END;

                IF (fyear0809=TRUE) AND (fyear0708=TRUE) AND (fyear0607=TRUE) AND (fyear0506=TRUE) THEN
                SETFILTER("Sales Header"."No.",'EFF/SAL/05-06/*|EFF/SAL/06-07/*|EFF/SAL/07-08/*|EFF/SAL/08-09/*');
                IF (fyear0809=TRUE) AND (fyear0708=TRUE) AND (fyear0607=TRUE) AND (fyear0506=FALSE) THEN
                SETFILTER("Sales Header"."No.",'EFF/SAL/06-07/*|EFF/SAL/07-08/*|EFF/SAL/08-09/*');

                IF fyear0607=TRUE THEN
                BEGIN
                //SETRANGE("Sales Header"."No.",'EFF/SAL/06-07/001','EFF/SAL/06-07/*');
                SETFILTER("Sales Header"."No.",'EFF/SAL/06-07/*');
                END;
                IF fyear0708=TRUE THEN
                BEGIN
                //SETRANGE("Sales Header"."No.",'EFF/SAL/07-08/001','EFF/SAL/07-08/*');
                SETFILTER("Sales Header"."No.",'EFF/SAL/07-08/*');
                END;
                IF fyear0809=TRUE THEN
                BEGIN
                //SETRANGE("Sales Header"."No.",'EFF/SAL/08-09/001','EFF/SAL/08-09/*');
                SETFILTER("Sales Header"."No.",'EFF/SAL/08-09/*');
                END;
                IF fyear0910=TRUE THEN
                BEGIN
                //SETFILTER("Sales Header"."No.",'EFF/SAL/09-10/001','EFF/SAL/09-10/*');
                SETFILTER("Sales Header"."No.",'EFF/SAL/09-10/*');
                END;
                IF fyear1011=TRUE THEN
                BEGIN
                //SETRANGE("Sales Header"."No.",'EFF/SAL/10-11/001','EFF/SAL/10-11/*');
                SETFILTER("Sales Header"."No.",'EFF/SAL/10-11/*');
                END;
                IF fyear1112=TRUE THEN
                BEGIN
                SETFILTER("Sales Header"."No.",'EFF/SAL/11-12/*');
                END;
                IF fyear1213=TRUE THEN
                BEGIN
                SETFILTER("Sales Header"."No.",'EFF/SAL/12-13/*');
                END;


                IF (fyear0809=TRUE) AND (fyear0910=TRUE)AND(fyear0708=TRUE)AND(fyear1011=TRUE)  THEN
                SETFILTER("Sales Header"."No.",'EFF/SAL/09-10/*|EFF/SAL/08-09/*|EFF/SAL/07-08/*|EFF/SAL/10-11/*');
                IF fyear0506=TRUE THEN
                SETRANGE("Sales Header"."No.",'EFF/SAL/05-06/001','EFF/SAL/05-06/*');
                IF (fyear0809=TRUE) AND (fyear0708=TRUE)  THEN
                SETFILTER("Sales Header"."No.",'EFF/SAL/07-08/*|EFF/SAL/08-09/*');
                IF (fyear0607=TRUE) AND (fyear0708=TRUE)  THEN
                SETFILTER("Sales Header"."No.",'EFF/SAL/06-07/*|EFF/SAL/07-08/*');
                IF (fyear0506=TRUE) AND (fyear0607=TRUE)  THEN
                SETFILTER("Sales Header"."No.",'EFF/SAL/05-06*|EFF/SAL/06-07/*');
            end;
        }
        dataitem("Sales Invoice Header";"Sales Invoice Header")
        {
            DataItemTableView = SORTING(Order No.) ORDER(Ascending) WHERE(Order No.=FILTER(EFF/SAL/08-09/*|EFF/SAL/09-10/*));
            RequestFilterFields = "Order Date";
            column(ordn;ordn)
            {
            }
            column(ordname;ordname)
            {
            }
            column(ordcno;ordcno)
            {
            }
            column(Sales_Invoice_Header__Order_Date_;"Order Date")
            {
            }
            column(ordcamt;ordcamt)
            {
            }
            column(silinvamt;silinvamt)
            {
            }
            column(totalreceived3;totalreceived3)
            {
            }
            column(dedu3;dedu3)
            {
            }
            column(silinvamt_totalreceived3_dedu3;silinvamt-totalreceived3-dedu3)
            {
            }
            column(Sales_Invoice_Header__Sales_Invoice_Header___Salesperson_Code_;"Sales Invoice Header"."Salesperson Code")
            {
            }
            column(Sales_Invoice_Header__Sales_Invoice_Header___Customer_Posting_Group_;"Sales Invoice Header"."Customer Posting Group")
            {
            }
            column(totalordcamt;totalordcamt)
            {
            }
            column(totalinvoiced3;totalinvoiced3)
            {
            }
            column(ctotalreceived3;ctotalreceived3)
            {
            }
            column(Total_Order_AmountCaption;Total_Order_AmountCaptionLbl)
            {
            }
            column(Sales_Invoice_Header_No_;"No.")
            {
            }
            column(Sales_Invoice_Header_Order_No_;"Order No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                  test1:=FALSE;
                  ordcamt:=0;
                dedu3:=0;
                totalreceived3:=0;
                installationbilled:=0;
                CMANF:=0;
                CBOI:=0;
                CINST:=0;
                CSW:=0;
                //  "Sales Invoice Header".SETFILTER("Sales Invoice Header"."Order Date","Report Filters");
                  i:=1;
                  WHILE (ord[i]<>'') DO
                  BEGIN
                 IF "Sales Invoice Header"."Order No."<>ord[i] THEN
                   test:='yes'
                   ELSE
                    test1:=TRUE;
                  i:=i+1;
                  END;
                   IF (test1<>TRUE) THEN
                  BEGIN
                   IF ("Sales Invoice Header"."Order No."<>ordn) OR(ordn='') THEN
                    BEGIN
                     totalordcamt+=("Sales Invoice Header"."Sale Order Total Amount");
                       ordn:="Sales Invoice Header"."Order No.";
                     ordname:="Sales Invoice Header"."Sell-to Customer Name";
                     ordcno:="Sales Invoice Header"."Customer OrderNo.";
                   silinvamt:=0;
                   SIH1.SETRANGE(SIH1."Order No.","Sales Invoice Header"."Order No.");
                  IF SIH1.FIND('-') THEN
                  REPEAT
                  IF SIH1."Sale Order Total Amount"<>0 THEN
                  BEGIN
                  ordcamt:=SIH1."Sale Order Total Amount";
                  END;
                  SIL1.SETRANGE(SIL1."Document No.",SIH1."No.");
                  IF SIL1.FIND('-') THEN
                  REPEAT
                  pos:=STRPOS(SIL1."External Document No.",str);
                  pos1:=STRPOS(SIL1."External Document No.",str1);
                  pos2:=STRPOS(SIL1."External Document No.",str2);
                  IF (pos1=0)AND(pos=0) THEN
                  silinvamt+=SIL1."Amount To Customer";  //closed orders manfacturing amount

                  IF (pos<>0) AND(SIL1."No."<>'47505') AND(SIL1."No."<>'46400')AND(SIL1."No."<>'18100') THEN
                  BEGIN
                  installationbilled+=SIL1."Amount To Customer";  //closed orders installation amount
                  CINST:=CINST+SIL1."Amount To Customer";
                  END;
                  IF pos2<>0 THEN
                  CBOI:=CBOI+SIL1."Amount To Customer";       //closed orders BOI amount
                  IF ((SIL1."No."='47505') OR(SIL1."No."='46400')OR(SIL1."No."='18100')) THEN
                  CSW:=CSW+SIL1."Amount To Customer";
                  UNTIL SIL1.NEXT=0;

                CLE3.SETRANGE(CLE3."Customer No.",SIH1."Sell-to Customer No.");
                CLE3.SETRANGE(CLE3."Document No.",SIH1."No.");
                CLE3.SETRANGE(CLE3."External Document No.",SIH1."External Document No.");
                IF CLE3.FIND('-') THEN
                REPEAT
                  CLE3.CALCFIELDS(CLE3.Amount,CLE3."Remaining Amount");
                  amt3:=CLE3.Amount;
                  remain3:=CLE3."Remaining Amount";
                  "total Remin3":="total Remin3"+remain3;
                  total_amt3:=total_amt3+CLE.Amount;
                  totalremain3:=totalremain3+CLE3."Remaining Amount";
                  totalreceived3:=totalreceived3+(amt3-remain3);
                  totalinvoiced3:=totalinvoiced3+amt3;
                UNTIL CLE3.NEXT=0;
                CLE4.SETRANGE(CLE4."Customer No.",SIH1."Sell-to Customer No.");
                CLE4.SETRANGE(CLE4."Customer ord No",SIH1."Order No.");
                CLE4.SETFILTER(CLE4."Document No.",'JV*');
                IF CLE4.FIND('-') THEN
                REPEAT
                   CLE4.CALCFIELDS(CLE4.Amount);
                  //desc3:=CLE4.Description;
                  //IF STRLEN(desc3)>20 THEN
                  //  desc3+=desc3+FORMAT(charline);
                  //dedu+=CLE2.Amount;
                IF (docno3=CLE4."Document No.") THEN
                CurrReport.SKIP
                ELSE
                BEGIN
                docno3:=CLE4."Document No.";
                GE3.SETRANGE(GE3."Document No.",CLE4."Document No.");
                IF GE3.FIND('-') THEN
                REPEAT
                IF GE3."G/L Account No."='23700' THEN
                BEGIN
                //  AC1+=GE."Debit Amount";
                  dedu3+=GE3."Debit Amount";
                END;
                IF GE3."G/L Account No."='20400' THEN
                BEGIN
                ///  AC1+=GE."Credit Amount";
                  dedu3+=GE3."Credit Amount";
                END;

                IF (GE3."G/L Account No."='53500') OR (GE3."G/L Account No."='24606') THEN
                BEGIN
                //AC2+=GE."Debit Amount";
                dedu3+=GE3."Debit Amount";
                END;
                IF GE3."G/L Account No."='59600' THEN
                BEGIN
                //AC3+=GE."Debit Amount";
                dedu3+=GE3."Debit Amount";
                END;
                IF GE3."G/L Account No."='25700' THEN
                BEGIN
                //  sd+=GE."Debit Amount";
                  dedu3+=GE3."Debit Amount";
                END;
                IF GE3."G/L Account No."='46200' THEN
                BEGIN
                 // CV+=GE."Debit Amount";
                  dedu3+=GE3."Debit Amount";
                END;

                UNTIL  GE3.NEXT=0;
                END;
                UNTIL CLE4.NEXT=0;

                  UNTIL SIH1.NEXT=0;
                CMANF:=silinvamt-(CBOI);
                    END;// ELSE
                //    CurrReport.SKIP;
                  //i:=i+1;
                  END;
            end;

            trigger OnPreDataItem();
            begin
                 //"Report Filters":="Sales Header".GETFILTERS;
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
          //TempExcelBuffer.CreateSheet('Total Orders Summary','',COMPANYNAME,'');//B2B
          TempExcelBuffer.GiveUserControl;
        END
    end;

    var
        FromDate : Date;
        EndDate : Date;
        ordervalue : Decimal;
        pendingamt : Decimal;
        supplyamt : Decimal;
        installationamt : Decimal;
        totalordervalue : Decimal;
        fyear0607 : Boolean;
        fyear0708 : Boolean;
        fyear0809 : Boolean;
        fyear0910 : Boolean;
        fyear0506 : Boolean;
        fyear1011 : Boolean;
        exciseamt : Decimal;
        taxamt : Decimal;
        vatamt : Decimal;
        cessamt : Decimal;
        TempExcelBuffer : Record "Excel Buffer" temporary;
        row : Integer;
        Excel : Boolean;
        "sales person" : Record "Salesperson/Purchaser";
        "Sales person name" : Text[30];
        "payment terms" : Record "Payment Terms";
        paymentt1 : Text[100];
        SIH : Record "Sales Invoice Header";
        SIL : Record "Sales Invoice Line";
        invoicedamt : Decimal;
        CLE : Record "Cust. Ledger Entry";
        amt : Decimal;
        remain : Decimal;
        total_amt : Decimal;
        totalremain : Decimal;
        "Total Remin" : Decimal;
        totalreceived : Decimal;
        CLE2 : Record "Cust. Ledger Entry";
        charline : Char;
        desc : Text[100];
        docno : Code[20];
        GE : Record "G/L Entry";
        dedu : Decimal;
        ord : array [500] of Code[20];
        i : Integer;
        SIH1 : Record "Sales Invoice Header";
        test : Text[3];
        test1 : Boolean;
        ordn : Code[20];
        sordno : Code[20];
        SIL1 : Record "Sales Invoice Line";
        silinvamt : Decimal;
        ordname : Text[50];
        ordcno : Text[65];
        ordcamt : Decimal;
        "Report Filters" : Text[200];
        CLE3 : Record "Cust. Ledger Entry";
        CLE4 : Record "Cust. Ledger Entry";
        GE3 : Record "G/L Entry";
        docno3 : Code[20];
        desc3 : Text[100];
        amt3 : Decimal;
        remain3 : Decimal;
        total_amt3 : Decimal;
        totalremain3 : Decimal;
        "total Remin3" : Decimal;
        totalreceived3 : Decimal;
        dedu3 : Decimal;
        totalordcamt : Decimal;
        totalinvoiced3 : Decimal;
        ctotalreceived3 : Decimal;
        excel1 : Boolean;
        j : Integer;
        tempqty : Decimal;
        str : Text[3];
        str1 : Text[3];
        str2 : Text[3];
        pos : Integer;
        pos1 : Integer;
        pos2 : Integer;
        pos3 : Integer;
        tempunitprice : Decimal;
        ordreldate : Date;
        pendingdays : Integer;
        installationbilled : Decimal;
        OMANF : Decimal;
        OBOI : Decimal;
        OINST : Decimal;
        OSW : Decimal;
        Dmanf : Decimal;
        DBOI : Decimal;
        DINST : Decimal;
        DSW : Decimal;
        PMANF : Decimal;
        PBOI : Decimal;
        PINST : Decimal;
        PSW : Decimal;
        CMANF : Decimal;
        CBOI : Decimal;
        CINST : Decimal;
        CSW : Decimal;
        fyear1112 : Boolean;
        fyear1213 : Boolean;
        CUSTOMER_ORDER_NO_CaptionLbl : Label 'CUSTOMER ORDER NO.';
        CUSTOMER_NAMECaptionLbl : Label 'CUSTOMER NAME';
        PENDING_AMOUNTCaptionLbl : Label 'PENDING AMOUNT';
        SUPPLY_AMOUNTCaptionLbl : Label 'SUPPLY AMOUNT';
        INSTALLATION_AMOUNTCaptionLbl : Label 'INSTALLATION AMOUNT';
        ORDER_NO_CaptionLbl : Label 'ORDER NO.';
        ORDER_DATECaptionLbl : Label 'ORDER DATE';
        DAYS_PENDINGCaptionLbl : Label 'DAYS PENDING';
        ORDER_VALUECaptionLbl : Label 'ORDER VALUE';
        INVOICED_AMOUNTCaptionLbl : Label 'INVOICED AMOUNT';
        TOTAL_RECEIVED_AMOUNTCaptionLbl : Label 'TOTAL RECEIVED AMOUNT';
        TOTAL_DEDUCTION_AMTCaptionLbl : Label 'TOTAL DEDUCTION AMT';
        BALANCE_NEED_TO_RECEIVECaptionLbl : Label 'BALANCE NEED TO RECEIVE';
        Total_Order_AmountCaptionLbl : Label 'Total Order Amount';

    [LineStart(8556)]
    procedure EnterCell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[500];Bold : Boolean);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.",RowNo);
        TempExcelBuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelBuffer."Cell Value as Text" := CellValue;
        TempExcelBuffer.Bold:=Bold ;
        TempExcelBuffer.INSERT;
    end;

    [LineStart(8564)]
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

