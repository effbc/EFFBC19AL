report 50011 "Production Status"
{
    // version ESPL 1.0

    // {COUN := "Prod. Order Routing Line"."Routing Reference No.";
    // //MESSAGE('FLAG %1 COUNT %2',FLAG,COUN);
    // 
    // 
    //       IF "Prod. Order Routing Line"."Routing Status" = 0 THEN
    //       BEGIN
    //            EVALUATE(pos,"Prod. Order Routing Line"."Operation No.");
    //            IF pos=1010 THEN
    //              ABC := ' Works yet to start at production'
    //           ELSE IF pos <= 3000 THEN
    //              ABC := abdul1
    //            ELSE IF ((pos > 3000) AND (pos <= 4000)) OR (pos = 9999) THEN
    //            BEGIN
    //            IF pos= 3001 THEN
    //              ABC := 'YET to start at MPR'
    //            ELSE
    //               ABC := abdul2;
    //            END
    //            ELSE IF (pos > 4000) AND (pos <= 5000) THEN
    //            BEGIN
    //              IF pos=4001 THEN
    //               ABC:= 'YET to start at SHF'
    //             ELSE
    //               ABC := abdul3;
    //            END;
    //            IF COUN <> flag THEN
    //            showoutput := TRUE
    //            ELSE
    //            showoutput := FALSE;
    //            flag := "Prod. Order Routing Line"."Routing Reference No.";
    //       END
    //       ELSE
    // 
    //            //CurrReport.SHOWOUTPUT := FALSE;
    //        BEGIN
    //            showoutput := FALSE;
    DefaultLayout = RDLC;
    RDLCLayout = './Production Status.rdlc';


    dataset
    {
        dataitem("Sales Header";"Sales Header")
        {
            RequestFilterFields = "Customer OrderNo.";
            ReqFilterHeading = 'Production Status';
            column(companyinfo_Name;companyinfo.Name)
            {
            }
            column(USERID;USERID)
            {
            }
            column(FORMAT_TODAY_0_4_;FORMAT(TODAY,0,4))
            {
            }
            column(CurrReport_PAGENO;CurrReport.PAGENO)
            {
            }
            column(USERID_Control1000000019;USERID)
            {
            }
            column(CurrReport_PAGENO_Control1000000024;CurrReport.PAGENO)
            {
            }
            column(companyinfo_Name_Control1000000025;companyinfo.Name)
            {
            }
            column(FORMAT_TODAY_0_4__Control1000000026;FORMAT(TODAY,0,4))
            {
            }
            column(PageCaption;PageCaptionLbl)
            {
            }
            column(Sale_Order___Production_StatusCaption;Sale_Order___Production_StatusCaptionLbl)
            {
            }
            column(PageCaption_Control1000000023;PageCaption_Control1000000023Lbl)
            {
            }
            column(Sale_Order___Production_StatusCaption_Control1000000027;Sale_Order___Production_StatusCaption_Control1000000027Lbl)
            {
            }
            column(StatusCaption;StatusCaptionLbl)
            {
            }
            column(Compound_ItemCaption;Compound_ItemCaptionLbl)
            {
            }
            column(Sales_Header_Document_Type;"Document Type")
            {
            }
            column(Sales_Header_No_;"No.")
            {
            }
            dataitem("Production Order";"Production Order")
            {
                DataItemLink = Sales Order No.=FIELD(No.);
                RequestFilterFields = Status,"No.","Sales Order No.";
                column(Production_Order_Status;Status)
                {
                }
                column(Production_Order_No_;"No.")
                {
                }
                column(Production_Order_Sales_Order_No_;"Sales Order No.")
                {
                }
                dataitem("Prod. Order Line";"Prod. Order Line")
                {
                    DataItemLink = Prod. Order No.=FIELD(No.);
                    RequestFilterFields = "Line No.";
                    column(Production_Order___Sales_Order_No__;"Production Order"."Sales Order No.")
                    {
                    }
                    column(Prod__Order_Line__Prod__Order_No__;"Prod. Order No.")
                    {
                    }
                    column(Production_Order__Description;"Production Order".Description)
                    {
                    }
                    column(Production_Order___Due_Date_;"Production Order"."Due Date")
                    {
                    }
                    column(Sales_Header___Bill_to_Name_;"Sales Header"."Bill-to Name")
                    {
                    }
                    column(Sales_Header___Bill_to_Address_;"Sales Header"."Bill-to Address")
                    {
                    }
                    column(Sales_Header___Customer_OrderNo__;"Sales Header"."Customer OrderNo.")
                    {
                    }
                    column(Sales_Header___Bill_to_City_;"Sales Header"."Bill-to City")
                    {
                    }
                    column(Sale_Order_No__Caption;Sale_Order_No__CaptionLbl)
                    {
                    }
                    column(StatusCaption_Control1000000046;StatusCaption_Control1000000046Lbl)
                    {
                    }
                    column(Compound_ItemCaption_Control1000000047;Compound_ItemCaption_Control1000000047Lbl)
                    {
                    }
                    column(Production_Order_No__Caption;Production_Order_No__CaptionLbl)
                    {
                    }
                    column(ProductCaption;ProductCaptionLbl)
                    {
                    }
                    column(Due_Date_Caption;Due_Date_CaptionLbl)
                    {
                    }
                    column(CustName_Caption;CustName_CaptionLbl)
                    {
                    }
                    column(Customer_Order_No__Caption;Customer_Order_No__CaptionLbl)
                    {
                    }
                    column(Prod__Order_Line_Status;Status)
                    {
                    }
                    column(Prod__Order_Line_Line_No_;"Line No.")
                    {
                    }
                    dataitem("Prod. Order Routing Line";"Prod. Order Routing Line")
                    {
                        DataItemLink = Prod. Order No.=FIELD(Prod. Order No.),Routing Reference No.=FIELD(Line No.);
                        DataItemTableView = SORTING(Status,Prod. Order No.,Routing Reference No.,Routing No.,Operation No.);
                        column(Prod__Order_Line__Description;"Prod. Order Line".Description)
                        {
                        }
                        column(Prod_Status;Prod_Status)
                        {
                        }
                        column(Prod__Order_Routing_Line_Status;Status)
                        {
                        }
                        column(Prod__Order_Routing_Line_Prod__Order_No_;"Prod. Order No.")
                        {
                        }
                        column(Prod__Order_Routing_Line_Routing_Reference_No_;"Routing Reference No.")
                        {
                        }
                        column(Prod__Order_Routing_Line_Routing_No_;"Routing No.")
                        {
                        }
                        column(Prod__Order_Routing_Line_Operation_No_;"Operation No.")
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                              IF NOT Completed THEN
                              BEGIN
                               Prod_Status:='';
                               IF "Prod. Order Line".Quantity=1 THEN
                               BEGIN
                                 Temp:="Prod. Order Routing Line"."Operation Description";
                                 "cAPACITY LEDSGER ENTRY".RESET;
                                 "cAPACITY LEDSGER ENTRY".SETCURRENTKEY("cAPACITY LEDSGER ENTRY"."Order No.",
                                                                        "cAPACITY LEDSGER ENTRY"."Order Line No.",
                                                                        "cAPACITY LEDSGER ENTRY"."Routing No.",
                                                                        "cAPACITY LEDSGER ENTRY"."Routing Reference No.",
                                                                        "cAPACITY LEDSGER ENTRY"."Operation No.",
                                                                         "cAPACITY LEDSGER ENTRY"."Last Output Line");
                                 "cAPACITY LEDSGER ENTRY".SETRANGE("cAPACITY LEDSGER ENTRY"."Order No.","Production Order"."No.");
                                 "cAPACITY LEDSGER ENTRY".SETRANGE("cAPACITY LEDSGER ENTRY"."Order Line No.","Prod. Order Line"."Line No.");
                                 "cAPACITY LEDSGER ENTRY".SETRANGE("cAPACITY LEDSGER ENTRY"."Operation No.","Prod. Order Routing Line"."Operation No.");
                                 IF NOT "cAPACITY LEDSGER ENTRY".FIND('-') THEN
                                 BEGIN
                                   Prod_Status:="Prod. Order Routing Line"."Operation Description"+ ' PENDING AT '+"Prod. Order Routing Line"."Work Center No.";
                                  Completed:=TRUE;
                                 END ELSE
                                 BEGIN
                                   IF "Prod. Order Routing Line"."Operation No."='9999' THEN
                                    Prod_Status:='COMPLETED';
                                 END;
                               END ELSE
                               BEGIN
                                 "No. Of Cards":=0;
                                 "cAPACITY LEDSGER ENTRY".SETCURRENTKEY("cAPACITY LEDSGER ENTRY"."Order No.",
                                                                        "cAPACITY LEDSGER ENTRY"."Order Line No.",
                                                                        "cAPACITY LEDSGER ENTRY"."Routing No.",
                                                                        "cAPACITY LEDSGER ENTRY"."Routing Reference No.",
                                                                        "cAPACITY LEDSGER ENTRY"."Operation No.",
                                                                         "cAPACITY LEDSGER ENTRY"."Last Output Line");
                                 "cAPACITY LEDSGER ENTRY".SETRANGE("cAPACITY LEDSGER ENTRY"."Order No.","Production Order"."No.");
                                 "cAPACITY LEDSGER ENTRY".SETRANGE("cAPACITY LEDSGER ENTRY"."Order Line No.","Prod. Order Line"."Line No.");
                                 "cAPACITY LEDSGER ENTRY".SETRANGE("cAPACITY LEDSGER ENTRY"."Operation No.","Prod. Order Routing Line"."Operation No.");
                                 "cAPACITY LEDSGER ENTRY".SETRANGE("cAPACITY LEDSGER ENTRY"."Reason Code",'');
                                 IF "cAPACITY LEDSGER ENTRY".FIND('-') THEN
                                 REPEAT
                                   "No. Of Cards"+="cAPACITY LEDSGER ENTRY"."Output Quantity"
                                 UNTIL "cAPACITY LEDSGER ENTRY".NEXT=0;

                                 IF "No. Of Cards"<"Prod. Order Line".Quantity THEN
                                 BEGIN
                                   Prod_Status:=FORMAT("Prod. Order Line".Quantity-"No. Of Cards")+' No. of CARDS '+
                                   "Prod. Order Routing Line"."Operation Description"+ ' PENDING AT '+"Prod. Order Routing Line"."Work Center No.";
                                   Completed:=TRUE;
                                 END ELSE
                                 BEGIN

                                   IF "Prod. Order Routing Line"."Operation No."='9999' THEN
                                   BEGIN
                                     Prod_Status:='COMPLETED';

                                   END;
                                 END;

                               END;
                             END;
                        end;

                        trigger OnPreDataItem();
                        begin
                             Completed:=FALSE;
                        end;
                    }
                }
            }

            trigger OnPreDataItem();
            begin
                IF Choice<>Choice::Prod_Status THEN
                CurrReport.BREAK;
            end;
        }
        dataitem("<Prod. Order Line1>";"Prod. Order Line")
        {
            DataItemTableView = SORTING(Status,Prod. Order No.,Line No.) ORDER(Ascending);
            RequestFilterFields = Status,"Prod. Order No.","Line No.";
            ReqFilterHeading = 'Compound Consumption';
            column(Prod__Order_Line1___Prod__Order_No__;"Prod. Order No.")
            {
            }
            column(Prod__Order_Line1__Description;Description)
            {
            }
            column(Prod__Order_Line1___Item_No__;"Item No.")
            {
            }
            column(Prod__Order_Line1__Quantity;Quantity)
            {
            }
            column(Line_Count_;"Line Count")
            {
            }
            column(Quantity__Line_Count_;Quantity-"Line Count")
            {
            }
            column(Actual_Qty;Actual_Qty)
            {
            }
            column(Consumed_Qty;Consumed_Qty)
            {
            }
            column(Pending_Qty;Pending_Qty)
            {
            }
            column(Compound_Consumption_StatusCaption;Compound_Consumption_StatusCaptionLbl)
            {
            }
            column(Prod__Order_Line1___Prod__Order_No__Caption;FIELDCAPTION("Prod. Order No."))
            {
            }
            column(Item_No_Caption;Item_No_CaptionLbl)
            {
            }
            column(DescriptionCaption;DescriptionCaptionLbl)
            {
            }
            column(QtyCaption;QtyCaptionLbl)
            {
            }
            column(Consumed_QuantityCaption;Consumed_QuantityCaptionLbl)
            {
            }
            column(Quantity_To_ConsumeCaption;Quantity_To_ConsumeCaptionLbl)
            {
            }
            column(Prod__Order_Line1__Status;Status)
            {
            }
            column(Prod__Order_Line1__Line_No_;"Line No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                  "Line Count":=0;
                  IF item.GET("<Prod. Order Line1>"."Item No.") THEN
                  BEGIN
                    IF item."Product Group Code"<>'CPCB' THEN
                      CurrReport.SKIP;
                  END;
                  "Item ledger entry".SETCURRENTKEY("Item ledger entry"."Item No.","Item ledger entry"."Order No.",                                 "Item ledger entry"."Entry Type");
                  "Item ledger entry".SETFILTER("Item ledger entry"."Entry Type",'Consumption');
                  "Item ledger entry".SETRANGE("Item ledger entry"."Item No.","<Prod. Order Line1>"."Item No.");
                   "Item ledger entry".SETRANGE("Item ledger entry"."Order No.","<Prod. Order Line1>"."Prod. Order No.");
                  IF "Item ledger entry".FIND('-') THEN
                  REPEAT
                    "Line Count"-="Item ledger entry".Quantity;
                  UNTIL "Item ledger entry".NEXT=0;
            end;

            trigger OnPreDataItem();
            begin
                IF Choice<>Choice::Con_Status THEN
                CurrReport.BREAK;
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

    var
        COUN : Integer;
        flag : Integer;
        ABC : Text[500];
        showoutput : Boolean;
        pos : Integer;
        abdul1 : Label '"Pending at Production "';
        abdul2 : Label 'Pending at MPR';
        abdul3 : Label 'Pending at SHF';
        companyinfo : Record "Company Information";
        cnt : Integer;
        flag1 : Integer;
        flag2 : Boolean;
        cnt1 : Integer;
        "cAPACITY LEDSGER ENTRY" : Record "Capacity Ledger Entry";
        Prod_Status : Text[500];
        Completed : Boolean;
        Temp : Text[200];
        "No. Of Cards" : Integer;
        "Item ledger entry" : Record "Item Ledger Entry";
        "Line Count" : Integer;
        Choice : Option Prod_Status,Con_Status;
        item : Record Item;
        Actual_Qty : Integer;
        Consumed_Qty : Integer;
        Pending_Qty : Integer;
        PageCaptionLbl : Label 'Page';
        Sale_Order___Production_StatusCaptionLbl : Label 'Sale Order / Production Status';
        PageCaption_Control1000000023Lbl : Label 'Page';
        Sale_Order___Production_StatusCaption_Control1000000027Lbl : Label 'Sale Order / Production Status';
        StatusCaptionLbl : Label 'Status';
        Compound_ItemCaptionLbl : Label 'Compound Item';
        Sale_Order_No__CaptionLbl : Label 'Sale Order No.:';
        StatusCaption_Control1000000046Lbl : Label 'Status';
        Compound_ItemCaption_Control1000000047Lbl : Label 'Compound Item';
        Production_Order_No__CaptionLbl : Label 'Production Order No.:';
        ProductCaptionLbl : Label 'Product';
        Due_Date_CaptionLbl : Label 'Due Date:';
        CustName_CaptionLbl : Label 'CustName:';
        Customer_Order_No__CaptionLbl : Label 'Customer Order No.:';
        Compound_Consumption_StatusCaptionLbl : Label 'Compound Consumption Status';
        Item_No_CaptionLbl : Label 'Item No.';
        DescriptionCaptionLbl : Label 'Description';
        QtyCaptionLbl : Label 'Qty';
        Consumed_QuantityCaptionLbl : Label 'Consumed Quantity';
        Quantity_To_ConsumeCaptionLbl : Label 'Quantity To Consume';
}

