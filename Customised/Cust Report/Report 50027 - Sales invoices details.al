report 50027 "Sales invoices details"
{
    // version ESPL 1.0

    DefaultLayout = RDLC;
    RDLCLayout = './Sales invoices details.rdlc';

    dataset
    {
        dataitem("<Sales Invoice Header1>"; "Sales Invoice Header")
        {
            column(Sales_Invoice_Header1___Order_No__; "Order No.")
            {
            }
            column(Completed__Invoice__ListCaption; Completed__Invoice__ListCaptionLbl)
            {
            }
            column(Sales_Invoice_Line1__DescriptionCaption; "<Sales Invoice Line1>".FIELDCAPTION(Description))
            {
            }
            column(Sales_Invoice_Line1__QuantityCaption; "<Sales Invoice Line1>".FIELDCAPTION(Quantity))
            {
            }
            column(Sale_order_noCaption; Sale_order_noCaptionLbl)
            {
            }
            column(Sales_Invoice_Header1__No_; "No.")
            {
            }
            dataitem("<Sales Invoice Line1>"; "Sales Invoice Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document No., Line No.) ORDER(Ascending);
                column(Sales_Invoice_Line1__Description; Description)
                {
                }
                column(Sales_Invoice_Line1__Quantity; Quantity)
                {
                }
                column(Sales_Invoice_Line1__Document_No_; "Document No.")
                {
                }
                column(Sales_Invoice_Line1__Line_No_; "Line No.")
                {
                }

                trigger OnPreDataItem();
                begin
                    "<Sales Invoice Line1>".SETFILTER("<Sales Invoice Line1>"."Document No.", "<Sales Invoice Header1>"."No.")
                end;
            }
        }
        dataitem("Sales Header"; "Sales Header")
        {
            column(Patially__Invoice__ListCaption; Patially__Invoice__ListCaptionLbl)
            {
            }
            column(Pending_Sale_Order_Invoice__ListCaption; Pending_Sale_Order_Invoice__ListCaptionLbl)
            {
            }
            column(Sales_Header_Document_Type; "Document Type")
            {
            }
            column(Sales_Header_No_; "No.")
            {
            }
            dataitem("Sales Invoice Header"; "Sales Invoice Header")
            {
                DataItemTableView = SORTING(No.) ORDER(Ascending);

                trigger OnPreDataItem();
                begin
                    IF (posel = posel::pending) OR (posel = posel::partial) THEN BEGIN
                        "Sales Invoice Header".SETFILTER("Sales Invoice Header"."Order No.", text1);
                        IF "Sales Invoice Header".COUNT > 0 THEN
                            flag := FALSE
                        ELSE
                            flag := TRUE;
                    END;
                    IF posel = posel::completed THEN BEGIN
                        EXIT;
                        //  "Sales Invoice Header".SETFILTER("Sales Invoice Header"."No.","<Sales Invoice Header1>"."No.");
                    END;
                end;
            }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document Type, Document No., Line No.) ORDER(Ascending);
                column(Sales_Line__Document_No__; "Document No.")
                {
                }
                column(Sales_Line__No__; "No.")
                {
                }
                column(Sales_Line_Description; Description)
                {
                }
                column(Sales_Line_Quantity; Quantity)
                {
                }
                column(Sales_Line__Quantity_Invoiced_; "Quantity Invoiced")
                {
                }
                column(Sale_order_noCaption_Control1000000001; Sale_order_noCaption_Control1000000001Lbl)
                {
                }
                column(ItemCaption; ItemCaptionLbl)
                {
                }
                column(Sales_Line_DescriptionCaption; FIELDCAPTION(Description))
                {
                }
                column(Sales_Line_QuantityCaption; FIELDCAPTION(Quantity))
                {
                }
                column(Sales_Line__Quantity_Invoiced_Caption; FIELDCAPTION("Quantity Invoiced"))
                {
                }
                column(Sales_Line_Document_Type; "Document Type")
                {
                }
                column(Sales_Line_Line_No_; "Line No.")
                {
                }

                trigger OnPreDataItem();
                begin
                    IF (posel = posel::pending) OR (posel = posel::partial) THEN
                        "Sales Line".SETFILTER("Sales Line"."Document No.", text1)
                    ELSE
                        "Sales Line".SETFILTER("Sales Line"."Document No.", ' ')
                end;
            }

            trigger OnPreDataItem();
            begin
                IF posel = posel::pending THEN BEGIN
                    text1 := "Sales Header"."No.";
                    flag := TRUE;
                END
                ELSE
                    IF posel = posel::partial THEN
                        text1 := "Sales Header"."No."
                    ELSE
                        IF posel = posel::completed THEN BEGIN
                            "Sales Header".SETFILTER("Sales Header"."No.", '');
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

    var
        posel: Option pending,partial,completed;
        text1: Text[30];
        flag: Boolean;
        Completed__Invoice__ListCaptionLbl: Label 'Completed  Invoice  List';
        Sale_order_noCaptionLbl: Label 'Sale order no';
        Patially__Invoice__ListCaptionLbl: Label '" Patially  Invoice  List"';
        Pending_Sale_Order_Invoice__ListCaptionLbl: Label '" Pending Sale Order Invoice  List"';
        Sale_order_noCaption_Control1000000001Lbl: Label 'Sale order no';
        ItemCaptionLbl: Label 'Item';
}

