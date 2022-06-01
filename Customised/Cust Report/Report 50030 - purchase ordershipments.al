report 50030 "purchase ordershipments"
{
    // version ESPL 1.0

    // {IF (posel =posel :: pending) OR (posel= posel::completed) THEN
    // BEGIN
    //   IF cnt= 0   THEN
    //    CurrReport.SHOWOUTPUT:=TRUE
    //   ELSE
    //    CurrReport.SHOWOUTPUT:=FALSE;
    // END
    // ELSE
    //  IF posel = posel :: partial THEN
    //  BEGIN
    //  IF cnt<> 0 THEN
    //   CurrReport.SHOWOUTPUT:=TRUE
    //   ELSE
    //    CurrReport.SHOWOUTPUT:=FALSE;
    //  END
    //  ELSE
    DefaultLayout = RDLC;
    RDLCLayout = './purchase ordershipments.rdlc';


    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = SORTING(Document Type, No.) WHERE(Document Type=CONST(Order));
            RequestFilterFields = "Document Type", "No.";
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(TODAY; TODAY)
            {
            }
            column(USERID; USERID)
            {
            }
            column(TODAY_Control1000000039; TODAY)
            {
            }
            column(USERID_Control1000000038; USERID)
            {
            }
            column(COMPANYNAME_Control1000000036; COMPANYNAME)
            {
            }
            column(No__Of_Orders_; "No. Of Orders")
            {
            }
            column(Received_Purchase_Orders_ListCaption; Received_Purchase_Orders_ListCaptionLbl)
            {
            }
            column(Partially_Recived_Purchase_Orders_ListCaption; Partially_Recived_Purchase_Orders_ListCaptionLbl)
            {
            }
            column(Pending_Purchase_Order_ListCaption; Pending_Purchase_Order_ListCaptionLbl)
            {
            }
            column(No__Of_OrdersCaption; No__Of_OrdersCaptionLbl)
            {
            }
            column(Purchase_Header_Document_Type; "Document Type")
            {
            }
            column(Purchase_Header_No_; "No.")
            {
            }
            dataitem("<Purchase Line1>"; "Purchase Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document Type, Document No., Line No.) WHERE(Quantity = FILTER(> 0), Expected Receipt Date=FILTER(<>''));
                column(Purchase_Line1___Document_No__;"Document No.")
                {
                }
                column(Purchase_Line1___Document_Date_;"Document Date")
                {
                }
                column(Purchase_Line1___Document_No___Control1000000021;"Document No.")
                {
                }
                column(Purchase_Line1___Document_Date__Control1000000054;"Document Date")
                {
                }
                column(Purchase_Line1___Document_No___Control1000000000;"Document No.")
                {
                }
                column(Purchase_Line1___Document_Date__Control1000000056;"Document Date")
                {
                }
                column(Deviation;Deviation)
                {
                }
                column(Purchase_Line1___Quantity_Received_;"Quantity Received")
                {
                }
                column(Purchase_Line1__Quantity;Quantity)
                {
                }
                column(Purchase_Line1__Description;Description)
                {
                }
                column(Purchase_Line1___Quantity_Invoiced_;"Quantity Invoiced")
                {
                }
                column(Purchase_Line1___Quantity_Received__Control1000000029;"Quantity Received")
                {
                }
                column(Purchase_Line1__Quantity_Control1000000030;Quantity)
                {
                }
                column(Purchase_Line1__Description_Control1000000031;Description)
                {
                }
                column(Purchase_Line1____Purchase_Line1____Outstanding_Quantity_;"<Purchase Line1>"."Outstanding Quantity")
                {
                }
                column(Deviation_Control1000000048;Deviation)
                {
                }
                column(Purchase_Line1____Direct_Unit_Cost____Purchase_Line1____Outstanding_Quantity_;"<Purchase Line1>"."Direct Unit Cost"*"<Purchase Line1>"."Outstanding Quantity")
                {
                }
                column(Purchase_Line1__Description_Control1000000002;Description)
                {
                }
                column(Purchase_Line1__Quantity_Control1000000004;Quantity)
                {
                }
                column(Purchase_Line1___Quantity_Received__Control1000000007;"Quantity Received")
                {
                }
                column(Purchase_Line1___Quantity_Invoiced__Control1000000014;"Quantity Invoiced")
                {
                }
                column(Order_NoCaption;Order_NoCaptionLbl)
                {
                }
                column(DescriptionCaption;DescriptionCaptionLbl)
                {
                }
                column(QTYCaption;QTYCaptionLbl)
                {
                }
                column(Quantity_ReceivedCaption;Quantity_ReceivedCaptionLbl)
                {
                }
                column(DeviationCaption;DeviationCaptionLbl)
                {
                }
                column(Order_DateCaption;Order_DateCaptionLbl)
                {
                }
                column(Order_NoCaption_Control1000000022;Order_NoCaption_Control1000000022Lbl)
                {
                }
                column(DescriptionCaption_Control1000000023;DescriptionCaption_Control1000000023Lbl)
                {
                }
                column(QTYCaption_Control1000000024;QTYCaption_Control1000000024Lbl)
                {
                }
                column(Quantity_ReceivedCaption_Control1000000026;Quantity_ReceivedCaption_Control1000000026Lbl)
                {
                }
                column(Quantity_InvoicedCaption;Quantity_InvoicedCaptionLbl)
                {
                }
                column(Remaining_QuantityCaption;Remaining_QuantityCaptionLbl)
                {
                }
                column(DeviationCaption_Control1000000049;DeviationCaption_Control1000000049Lbl)
                {
                }
                column(Order_AmountCaption;Order_AmountCaptionLbl)
                {
                }
                column(Order_DateCaption_Control1000000055;Order_DateCaption_Control1000000055Lbl)
                {
                }
                column(Order_NoCaption_Control1000000001;Order_NoCaption_Control1000000001Lbl)
                {
                }
                column(Purchase_Line1__Description_Control1000000002Caption;FIELDCAPTION(Description))
                {
                }
                column(QTYCaption_Control1000000005;QTYCaption_Control1000000005Lbl)
                {
                }
                column(Purchase_Line1___Quantity_Received__Control1000000007Caption;FIELDCAPTION("Quantity Received"))
                {
                }
                column(Purchase_Line1___Quantity_Invoiced__Control1000000014Caption;FIELDCAPTION("Quantity Invoiced"))
                {
                }
                column(Order_DateCaption_Control1000000057;Order_DateCaption_Control1000000057Lbl)
                {
                }
                column(Purchase_Line1__Document_Type;"Document Type")
                {
                }
                column(Purchase_Line1__Line_No_;"Line No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                     QTY_INV:=0;
                     "New Order":=FALSE;
                      IF "<Purchase Line1>"."Document No."<>"Order No" THEN
                     BEGIN
                     "New Order":=TRUE;
                     "Order No":="<Purchase Line1>"."Document No.";
                     END;
                end;

                trigger OnPreDataItem();
                begin
                    // "<Purchase Line1>".SETRANGE("<Purchase Line1>"."Expected Receipt Date",>TODAY);
                      IF posel=posel::completed THEN
                     "<Purchase Line1>".SETRANGE("<Purchase Line1>"."Outstanding Quantity",0)
                      ELSE IF posel=posel::pending THEN
                      "<Purchase Line1>".SETRANGE("<Purchase Line1>"."Quantity Received",0)
                      ELSE IF posel=posel::partial THEN
                      BEGIN
                       "<Purchase Line1>".SETFILTER("<Purchase Line1>"."Outstanding Quantity",'>%1',0);
                       "<Purchase Line1>".SETFILTER("<Purchase Line1>"."Quantity Received",'>%1',0);
                       END;
                       "Order No":="<Purchase Line1>"."Document No.";
                end;
            }
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
        cnt : Integer;
        posel : Option pending,partial,completed;
        "New Order" : Boolean;
        "Order No" : Code[50];
        PIL : Record "Purch. Inv. Line";
        QTY_INV : Decimal;
        Deviation : Integer;
        "No. Of Orders" : Integer;
        Received_Purchase_Orders_ListCaptionLbl : Label 'Received Purchase Orders List';
        Partially_Recived_Purchase_Orders_ListCaptionLbl : Label 'Partially Recived Purchase Orders List';
        Pending_Purchase_Order_ListCaptionLbl : Label '" Pending Purchase Order List"';
        No__Of_OrdersCaptionLbl : Label 'No. Of Orders';
        Order_NoCaptionLbl : Label 'Order No';
        DescriptionCaptionLbl : Label 'Description';
        QTYCaptionLbl : Label 'QTY';
        Quantity_ReceivedCaptionLbl : Label 'Quantity Received';
        DeviationCaptionLbl : Label 'Deviation';
        Order_DateCaptionLbl : Label 'Order Date';
        Order_NoCaption_Control1000000022Lbl : Label 'Order No';
        DescriptionCaption_Control1000000023Lbl : Label 'Description';
        QTYCaption_Control1000000024Lbl : Label 'QTY';
        Quantity_ReceivedCaption_Control1000000026Lbl : Label 'Quantity Received';
        Quantity_InvoicedCaptionLbl : Label 'Quantity Invoiced';
        Remaining_QuantityCaptionLbl : Label 'Remaining Quantity';
        DeviationCaption_Control1000000049Lbl : Label 'Deviation';
        Order_AmountCaptionLbl : Label 'Order Amount';
        Order_DateCaption_Control1000000055Lbl : Label 'Order Date';
        Order_NoCaption_Control1000000001Lbl : Label 'Order No';
        QTYCaption_Control1000000005Lbl : Label 'QTY';
        Order_DateCaption_Control1000000057Lbl : Label 'Order Date';
}

