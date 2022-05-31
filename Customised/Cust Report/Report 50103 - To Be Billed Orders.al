report 50103 "To Be Billed Orders"
{
    // version sreenivas,EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './To Be Billed Orders.rdlc';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = SORTING(Order Date, Customer Posting Group) ORDER(Ascending) WHERE(Order Status=FILTER(<>Temporary Close));
            RequestFilterFields = "Customer Posting Group";
            column(Sales_Header__Sales_Header___Sale_Order_Total_Amount_;"Sales Header"."Sale Order Total Amount")
            {
            }
            column(pendingamt;pendingamt)
            {
            }
            column(supplyamt;supplyamt)
            {
            }
            column(installationamt;installationamt)
            {
            }
            column(PENDING_SALE_ORDER_WISE_DETAILSCaption;PENDING_SALE_ORDER_WISE_DETAILSCaptionLbl)
            {
            }
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
            column(ORDER_RELEASE_DATECaption;ORDER_RELEASE_DATECaptionLbl)
            {
            }
            column(DAYS_PENDINGCaption;DAYS_PENDINGCaptionLbl)
            {
            }
            column(INSPECTION_BYCaption;INSPECTION_BYCaptionLbl)
            {
            }
            column(RDSO_DATECaption;RDSO_DATECaptionLbl)
            {
            }
            column(DISPATCH_DATECaption;DISPATCH_DATECaptionLbl)
            {
            }
            column(PAYMENT_DATECaption;PAYMENT_DATECaptionLbl)
            {
            }
            column(Product_Type_with_VersionCaption;Product_Type_with_VersionCaptionLbl)
            {
            }
            column(Sales_Line_QuantityCaption;"Sales Line".FIELDCAPTION(Quantity))
            {
            }
            column(Call_Letter_StatusCaption;Call_Letter_StatusCaptionLbl)
            {
            }
            column(Call_Letter_DateCaption;Call_Letter_DateCaptionLbl)
            {
            }
            column(BG_StatusCaption;BG_StatusCaptionLbl)
            {
            }
            column(Sales_Person_NameCaption;Sales_Person_NameCaptionLbl)
            {
            }
            column(Base_Plan_Installation_Start_DateCaption;Base_Plan_Installation_Start_DateCaptionLbl)
            {
            }
            column(Base_Compeletion_DateCaption;Base_Compeletion_DateCaptionLbl)
            {
            }
            column(Revised_Target_DateCaption;Revised_Target_DateCaptionLbl)
            {
            }
            column(Inst_IssuesCaption;Inst_IssuesCaptionLbl)
            {
            }
            column(ORDER_VALUECaption;ORDER_VALUECaptionLbl)
            {
            }
            column(Payment_termsCaption;Payment_termsCaptionLbl)
            {
            }
            column(ORDER_STATUSCaption;ORDER_STATUSCaptionLbl)
            {
            }
            column(EXPECTED_AMOUNTCaption;EXPECTED_AMOUNTCaptionLbl)
            {
            }
            column(Res_DeptCaption;Res_DeptCaptionLbl)
            {
            }
            column(Installation_StatusCaption;Installation_StatusCaptionLbl)
            {
            }
            column(Actual_Start_DateCaption;Actual_Start_DateCaptionLbl)
            {
            }
            column(Revised_Comp_DateCaption;Revised_Comp_DateCaptionLbl)
            {
            }
            column(Deviated_DaysCaption;Deviated_DaysCaptionLbl)
            {
            }
            column(Total_Order_AmountCaption;Total_Order_AmountCaptionLbl)
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
                column(pendingamt_Control1102154031;pendingamt)
                {
                }
                column(Sales_Header___Sell_to_Customer_Name_;"Sales Header"."Sell-to Customer Name")
                {
                }
                column(supplyamt_Control1102154033;supplyamt)
                {
                }
                column(installationamt_Control1102154034;installationamt)
                {
                }
                column(Sales_Header___Sale_Order_Total_Amount_;"Sales Header"."Sale Order Total Amount")
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
                column(Sales_Header__Inspection;"Sales Header".Inspection)
                {
                }
                column(Sales_Header__CallLetterExpireDate;"Sales Header".CallLetterExpireDate)
                {
                }
                column(Sales_Header__CallLetterRecivedDate;"Sales Header".CallLetterRecivedDate)
                {
                }
                column(Sales_Header___Payment_Date_;"Sales Header"."Payments Date")
                {
                }
                column(Sales_Header__Product;"Sales Header".Product)
                {
                }
                column(Sales_Line_Quantity;Quantity)
                {
                }
                column(Sales_Header___Call_letters_Status_;"Sales Header"."Call letters Status")
                {
                }
                column(Sales_Header___Call_Letter_Exp_Date_;"Sales Header"."Call Letter Exp.Date")
                {
                }
                column(Sales_Header___BG_Status_;"Sales Header"."BG Status")
                {
                }
                column(sales_person__Name;"sales person".Name)
                {
                }
                column(Sales_Header___Inst_Start_Date_;"Sales Header"."Inst.Start Date")
                {
                }
                column(Sales_Header___Base_PLan_Comp__Date_;"Sales Header"."Base PLan Comp. Date")
                {
                }
                column(Sales_Header___Revised_Target_Date_;"Sales Header"."Revised Target Date")
                {
                }
                column(Sales_Header__Remarks;"Sales Header".Remarks)
                {
                }
                column(paymentt1;paymentt1)
                {
                }
                column(Sales_Header___Order_Status_;"Sales Header"."Order Status")
                {
                }
                column(Sales_Header___Exp_Payment_;"Sales Header"."Exp.Payment")
                {
                }
                column(Sales_Header__Installation;"Sales Header".Installation)
                {
                }
                column(Sales_Header___Inst_Status_;"Sales Header"."Inst.Status")
                {
                }
                column(Sales_Header___Assured_Date_;"Sales Header"."Assured Date")
                {
                }
                column(Sales_Header___Revised_Comp_Date_;"Sales Header"."Revised Comp.Date")
                {
                }
                column(Sales_Header___Deviated_Days_;"Sales Header"."Deviated Days")
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
                      BED:=0;
                      EPS.SETRANGE("Excise Bus. Posting Group","Sales Line"."Excise Bus. Posting Group");
                      EPS.SETRANGE("Excise Prod. Posting Group","Sales Line"."Excise Prod. Posting Group");
                      IF ("Sales Header"."Posting Date"<> 0D) THEN
                        EPS.SETRANGE("From Date",0D,"Sales Header"."Posting Date")
                      ELSE
                        EPS.SETRANGE("From Date",0D,WORKDATE);
                      IF EPS.FIND('+') THEN
                         BED:=EPS."BED %";

                        IF ("Sales Line"."Qty. to Invoice">0) AND (("Sales Line".Type="Sales Line".Type::Item) OR ("Sales Line"."No."='46400')) THEN
                         BEGIN
                          IF (("Sales Line"."Gen. Prod. Posting Group"<>'BOI') OR ("Sales Line"."Gen. Prod. Posting Group"<>'MISC')
                             OR ("Sales Line"."Gen. Prod. Posting Group"<>'COMP-UNITS')) THEN
                            BEGIN
                          exciseamt:=("Sales Line"."Qty. to Invoice"*"Sales Line"."Unit Price")*(BED)/100;
                          cessamt:=exciseamt*3/100;
                          END;
                          taxamt:=(("Sales Line"."Qty. to Invoice"*"Sales Line"."Unit Price")+exciseamt+cessamt)*("Sales Line"."Tax %")/100;
                          IF ("Sales Header".Structure='SALE-E+V') OR("Sales Header".Structure='SALE-VAT')  THEN
                          BEGIN
                           vatamt:=(("Sales Line"."Qty. to Invoice"*"Sales Line"."Unit Price")+exciseamt+cessamt)*("Sales Line"."Tax %")/100;
                           //vat % need to gather
                          END ELSE
                           vatamt:=0;
                          IF "Sales Line"."Tax %"=0 THEN
                          taxamt:=0;
                          pendingamt:=pendingamt+("Sales Line"."Qty. to Invoice"*"Sales Line"."Unit Price")+exciseamt+taxamt+vatamt+cessamt;
                          supplyamt:=supplyamt+("Sales Line"."Qty. to Invoice"*"Sales Line"."Unit Price")+exciseamt+taxamt+vatamt+cessamt;
                        END; //ELSE
                    //   supplyamt:=0;

                       // pendingamt:=pendingamt+supplyamt;
                       // supplyamt:=pendingamt;
                       IF ("Sales Line"."Qty. to Invoice">0) THEN
                        BEGIN
                          IF ("Sales Line".Type="Sales Line".Type::"G/L Account") AND ("Sales Line"."No."='47300')  THEN
                            BEGIN
                               installationamt:=installationamt+"Sales Line"."Line Amount";
                               pendingamt+="Sales Line"."Line Amount";
                            END;
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
                end;
            }

            trigger OnAfterGetRecord();
            begin
                //  CurrReport.CREATETOTALS(ordervalue);
                 CurrReport.CREATETOTALS("Sales Header"."Sale Order Total Amount");
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
                  installationamt:=0;
                TempExcelBuffer.DELETEALL;
                CLEAR(TempExcelBuffer);
                row:=0;
                
                /*  IF(FromDate=0D) OR (EndDate=0D) THEN
                  BEGIN
                  MESSAGE('Provide the correct data filter');
                  CurrReport.BREAK;
                  END;*/
                IF (fyear0809=TRUE) AND (fyear0708=TRUE) AND (fyear0607=TRUE) AND (fyear0506=TRUE) THEN
                SETFILTER("Sales Header"."No.",'EFF/SAL/05-06/*|EFF/SAL/06-07/*|EFF/SAL/07-08/*|EFF/SAL/08-09/*');
                IF (fyear0809=TRUE) AND (fyear0708=TRUE) AND (fyear0607=TRUE) AND (fyear0506=FALSE) THEN
                SETFILTER("Sales Header"."No.",'EFF/SAL/06-07/*|EFF/SAL/07-08/*|EFF/SAL/08-09/*');
                
                IF fyear0607=TRUE THEN
                BEGIN
                //SETRANGE("Order Date",FromDate,EndDate);
                SETRANGE("Sales Header"."No.",'EFF/SAL/06-07/001','EFF/SAL/06-07/*');
                END;
                IF fyear0708=TRUE THEN
                BEGIN
                //SETRANGE("Sales Header"."No.",'EFF/SAL/07-08/001','EFF/SAL/07-08/*');
                SETFILTER("Sales Header"."No.",'EFF/SAL/07-08/*');
                END;
                IF fyear0809=TRUE THEN
                BEGIN
                SETFILTER("Sales Header"."No.",'EFF/SAL/08-09/*');
                END;
                IF fyear0910=TRUE THEN
                SETFILTER("Sales Header"."No.",'EFF/SAL/09-10/*');
                
                //IF fyear1011=TRUE THEN
                //SETFILTER("Sales Header"."No.",'EFF/SAL/10-11/*');
                
                IF fyear0506=TRUE THEN
                SETRANGE("Sales Header"."No.",'EFF/SAL/05-06/001','EFF/SAL/05-06/*');
                /*IF (fyear0809<>TRUE) AND (fyear0708<>TRUE) AND (fyear0607<>TRUE) AND (fyear0506<>TRUE) THEN
                  BEGIN
                    MESSAGE('Please select one of the opitons');
                    CurrReport.BREAK;
                  END;
                */IF (fyear0809=TRUE) AND (fyear0708=TRUE)  THEN
                SETFILTER("Sales Header"."No.",'EFF/SAL/07-08/*|EFF/SAL/08-09/*');
                IF (fyear0607=TRUE) AND (fyear0708=TRUE)  THEN
                SETFILTER("Sales Header"."No.",'EFF/SAL/06-07/*|EFF/SAL/07-08/*');
                IF (fyear0506=TRUE) AND (fyear0607=TRUE)  THEN
                SETFILTER("Sales Header"."No.",'EFF/SAL/05-06*|EFF/SAL/06-07/*');

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
          //TempExcelBuffer.CreateSheet('test excel','',COMPANYNAME,'');
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
        paymentt1 : Text[200];
        ordreldate : Text[50];
        pendingdays : Text[50];
        EPS : Record "Excise Posting Setup";
        BED : Decimal;
        PENDING_SALE_ORDER_WISE_DETAILSCaptionLbl : Label 'PENDING SALE ORDER WISE DETAILS';
        CUSTOMER_ORDER_NO_CaptionLbl : Label 'CUSTOMER ORDER NO.';
        CUSTOMER_NAMECaptionLbl : Label 'CUSTOMER NAME';
        PENDING_AMOUNTCaptionLbl : Label 'PENDING AMOUNT';
        SUPPLY_AMOUNTCaptionLbl : Label 'SUPPLY AMOUNT';
        INSTALLATION_AMOUNTCaptionLbl : Label 'INSTALLATION AMOUNT';
        ORDER_NO_CaptionLbl : Label 'ORDER NO.';
        ORDER_RELEASE_DATECaptionLbl : Label 'ORDER RELEASE DATE';
        DAYS_PENDINGCaptionLbl : Label 'DAYS PENDING';
        INSPECTION_BYCaptionLbl : Label 'INSPECTION BY';
        RDSO_DATECaptionLbl : Label 'RDSO DATE';
        DISPATCH_DATECaptionLbl : Label 'DISPATCH DATE';
        PAYMENT_DATECaptionLbl : Label 'PAYMENT DATE';
        Product_Type_with_VersionCaptionLbl : Label 'Product Type with Version';
        Call_Letter_StatusCaptionLbl : Label 'Call Letter Status';
        Call_Letter_DateCaptionLbl : Label 'Call Letter Date';
        BG_StatusCaptionLbl : Label 'BG Status';
        Sales_Person_NameCaptionLbl : Label 'Sales Person Name';
        Base_Plan_Installation_Start_DateCaptionLbl : Label 'Base Plan Installation Start Date';
        Base_Compeletion_DateCaptionLbl : Label 'Base Compeletion Date';
        Revised_Target_DateCaptionLbl : Label 'Revised Target Date';
        Inst_IssuesCaptionLbl : Label 'Inst.Issues';
        ORDER_VALUECaptionLbl : Label 'ORDER VALUE';
        Payment_termsCaptionLbl : Label 'Payment terms';
        ORDER_STATUSCaptionLbl : Label 'ORDER STATUS';
        EXPECTED_AMOUNTCaptionLbl : Label 'EXPECTED AMOUNT';
        Res_DeptCaptionLbl : Label 'Res.Dept';
        Installation_StatusCaptionLbl : Label 'Installation Status';
        Actual_Start_DateCaptionLbl : Label 'Actual Start Date';
        Revised_Comp_DateCaptionLbl : Label 'Revised Comp.Date';
        Deviated_DaysCaptionLbl : Label 'Deviated Days';
        Total_Order_AmountCaptionLbl : Label 'Total Order Amount';

    [LineStart(6738)]
    procedure EnterCell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[250];Bold : Boolean);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.",RowNo);
        TempExcelBuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelBuffer."Cell Value as Text" := CellValue;
        TempExcelBuffer.Bold:=Bold ;
        TempExcelBuffer.INSERT;
    end;

    [LineStart(6746)]
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

