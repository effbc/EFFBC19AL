report 50217 "Vendor Notification"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Vendor Notification.rdlc';

    dataset
    {
        dataitem("Purchase Line"; "Purchase Line")
        {
            DataItemTableView = SORTING(Deviated Receipt Date) ORDER(Ascending) WHERE(Qty. to Receive=FILTER(>0),Document Type=CONST(Order));
            RequestFilterFields = "Buy-from Vendor No.";
            column(WEEK_QTY;WEEK_QTY)
            {
            }
            column(Purchase_Line_Description;Description)
            {
            }
            column(Test;Test)
            {
            }
            column(Items_To_be_Sent_to_EfftronicsCaption;Items_To_be_Sent_to_EfftronicsCaptionLbl)
            {
            }
            column(Item_DescriptionCaption;Item_DescriptionCaptionLbl)
            {
            }
            column(Qty_to_send_in_Present_weekCaption;Qty_to_send_in_Present_weekCaptionLbl)
            {
            }
            column(Qty_to_send_in_FutureCaption;Qty_to_send_in_FutureCaptionLbl)
            {
            }
            column(Purchase_Line_Document_Type;"Document Type")
            {
            }
            column(Purchase_Line_Document_No_;"Document No.")
            {
            }
            column(Purchase_Line_Line_No_;"Line No.")
            {
            }
            column(Purchase_Line_No_;"No.")
            {
            }
            column(Purchase_Line___Qty__to_Receive_;"Purchase Line"."Qty. to Receive")
            {
            }
            column(Purchase_Line___Order_Date_;"Purchase Line"."Order Date")
            {
            }
            column(Purchase_Line___Deviated_Receipt_Date_;"Purchase Line"."Deviated Receipt Date")
            {
            }
            column(Purchase_Line_PLBody3;PLBody3)
            {
            }
            column(Purchase_Order_Caption;Purchase_Order_CaptionLbl)
            {
            }
            column(Item_Caption;Item_CaptionLbl)
            {
            }
            column(Desc_Caption;Desc_CaptionLbl)
            {
            }
            column(Qty_Receive_Caption;Qty_Receive_CaptionLbl)
            {
            }
            column(Order_Date_Caoption;Order_Date_CaoptionLbl)
            {
            }
            column(Date_Caption;Date_CaptionLbl)
            {
            }

            trigger OnAfterGetRecord();
            begin
                /*
                  WEEK_QTY:=0;
                  FUT_QTY:=0;
                  Test:='';
                  IF NOT DUM.GET("Purchase Line"."No.") THEN
                  BEGIN
                    DUM.INIT;
                    DUM."No.":="Purchase Line"."No.";
                    DUM.INSERT;
                
                    PL.RESET;
                    PL.SETCURRENTKEY(PL."Deviated Receipt Date");
                    PL.SETFILTER(PL."No.","Purchase Line"."No.");
                    PL.SETFILTER(PL."Buy-from Vendor No.","Purchase Line"."Buy-from Vendor No.");
                    PL.SETFILTER(PL."Qty. to Receive",'>%1',0);
                    PL.SETFILTER(PL."Document Type",'ORDER');
                    IF PL.FINDFIRST THEN
                    REPEAT
                     i:= PL."Deviated Receipt Date"-TODAY;
                      IF (PL."Deviated Receipt Date"-TODAY) <7 THEN
                      BEGIN
                          WEEK_QTY:=WEEK_QTY+PL."Qty. to Receive";
                      END
                      ELSE
                      BEGIN
                        FUT_QTY:=FUT_QTY+PL."Qty. to Receive";
                        Test:=Test+FORMAT(PL."Qty. to Receive")+' '+PL."Unit of Measure" +' on '+FORMAT(PL."Deviated Receipt Date")+',  ';
                      END;
                    UNTIL PL.NEXT=0;
                  END;
                  {IF Test<>'' THEN
                  Test:=COPYSTR(Test,1,STRLEN(Test)-1);
                   }
                */
                
                //Purchase Line, Body (3) - OnPreSection()
                /*
                  PH.RESET;
                  PH.SETFILTER(PH."No.","Purchase Line"."Document No.");
                  IF PH.FINDFIRST THEN
                  BEGIN
                  item.RESET;
                  item.SETFILTER(item."No.","Purchase Line"."No.");
                  IF item.FINDFIRST THEN
                  BEGIN
                    IF  ((TODAY-PH."Order Date")=ROUND(((CALCDATE(item."Safety Lead Time",010101D)-010101D)-4)/2-0.5,1)) OR
                        ((TODAY-PH."Order Date")=ROUND(((CALCDATE(item."Safety Lead Time",010101D)-010101D)-4)/4-0.5,1))THEN
                      CurrReport.SHOWOUTPUT:=TRUE
                    ELSE
                      CurrReport.SHOWOUTPUT:=FALSE;
                  END
                  ELSE
                    CurrReport.SHOWOUTPUT:=FALSE;
                  END
                  ELSE
                  CurrReport.SHOWOUTPUT:=FALSE;
                */
                
                PLBody3 := TRUE;
                
                PH.RESET;
                PH.SETFILTER(PH."No.","Purchase Line"."Document No.");
                IF PH.FINDFIRST THEN BEGIN
                  Order_Date:=PH."Order Date";
                END;
                
                
                IF "Purchase Line".MARK=TRUE THEN
                  //CurrReport.SHOWOUTPUT:=TRUE
                  PLBody3 := TRUE
                ELSE
                  //CurrReport.SHOWOUTPUT:=FALSE;
                  PLBody3 := FALSE;
                //Purchase Line, Body (3) - OnPreSection()

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
        PH : Record "Purchase Header";
        Order_Date : Date;
        DUM : Record Item temporary;
        PL : Record "Purchase Line";
        WEEK_QTY : Decimal;
        FUT_QTY : Decimal;
        i : Decimal;
        Test : Code[250];
        Items_To_be_Sent_to_EfftronicsCaptionLbl : Label 'Items To be Sent to Efftronics';
        Item_DescriptionCaptionLbl : Label 'Item Description';
        Qty_to_send_in_Present_weekCaptionLbl : Label 'Qty to send in Present week';
        Qty_to_send_in_FutureCaptionLbl : Label 'Qty to send in Future';
        Purchase_Order_CaptionLbl : Label 'Purchase Order No.';
        Item_CaptionLbl : Label 'Item No.';
        Desc_CaptionLbl : Label 'Description';
        Qty_Receive_CaptionLbl : Label 'Qty. to Receive';
        Order_Date_CaoptionLbl : Label 'Order Date';
        Date_CaptionLbl : Label '"Date to be Reached to Efftronics "';
        PLBody3 : Boolean;
}

