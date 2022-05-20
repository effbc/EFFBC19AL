report 50192 "blocked items"
{
    DefaultLayout = RDLC;
    RDLCLayout = './blocked items.rdlc';

    dataset
    {
        dataitem(Item;Item)
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending) WHERE(Blocked=CONST(Yes));
            PrintOnlyIfDetail = true;
            column(item_code;item_code)
            {
            }
            column(Item_No_;"No.")
            {
            }
            dataitem("Production BOM Line";"Production BOM Line")
            {
                DataItemLink = No.=FIELD(No.);
                DataItemTableView = SORTING(Type,No.) ORDER(Ascending) WHERE(Type=CONST(Item));
                column(Production_BOM_Line__Production_BOM_No__;"Production BOM No.")
                {
                }
                column(Production_BOM_Line_Quantity;Quantity)
                {
                }
                column(Production_BOM_Line__Version_Code_;"Version Code")
                {
                }
                column(PRODUCTION_BOM_SCaption;PRODUCTION_BOM_SCaptionLbl)
                {
                }
                column(BOMCaption;BOMCaptionLbl)
                {
                }
                column(QUANTITYCaption;QUANTITYCaptionLbl)
                {
                }
                column(VERSIONCaption;VERSIONCaptionLbl)
                {
                }
                column(Production_BOM_Line_Line_No_;"Line No.")
                {
                }
                column(Production_BOM_Line_No_;"No.")
                {
                }
            }
            dataitem("Prod. Order Component";"Prod. Order Component")
            {
                DataItemLink = Item No.=FIELD(No.);
                DataItemTableView = SORTING(Production Plan Date,Item No.,Prod. Order No.) ORDER(Ascending) WHERE(Production Plan Date=FILTER(>08/03/10));
                column(Prod__Order_Component__Prod__Order_No__;"Prod. Order No.")
                {
                }
                column(Prod__Order_Component__Expected_Quantity_;"Expected Quantity")
                {
                }
                column(Prod__Order_Component__Source_No__;"Source No.")
                {
                }
                column(Prod__Order_Component__Prod__Order_No__Caption;FIELDCAPTION("Prod. Order No."))
                {
                }
                column(Prod__Order_Component__Expected_Quantity_Caption;FIELDCAPTION("Expected Quantity"))
                {
                }
                column(Prod__Order_Component__Source_No__Caption;FIELDCAPTION("Source No."))
                {
                }
                column(PRODCUTION_ORDERSCaption;PRODCUTION_ORDERSCaptionLbl)
                {
                }
                column(Prod__Order_Component_Status;Status)
                {
                }
                column(Prod__Order_Component_Prod__Order_Line_No_;"Prod. Order Line No.")
                {
                }
                column(Prod__Order_Component_Line_No_;"Line No.")
                {
                }
                column(Prod__Order_Component_Item_No_;"Item No.")
                {
                }
            }
            dataitem("Purchase Line";"Purchase Line")
            {
                DataItemLink = No.=FIELD(No.);
                DataItemTableView = SORTING(No.,Buy-from Vendor No.) ORDER(Ascending) WHERE(Qty. to Receive=FILTER(>0));
                column(Purchase_Line__Document_No__;"Document No.")
                {
                }
                column(Purchase_Line_Quantity;Quantity)
                {
                }
                column(Purchase_Line__Location_Code_;"Location Code")
                {
                }
                column(Purchase_Line__Expected_Receipt_Date_;"Expected Receipt Date")
                {
                }
                column(PURCHASE_ORDERSCaption;PURCHASE_ORDERSCaptionLbl)
                {
                }
                column(Purchase_Line__Document_No__Caption;FIELDCAPTION("Document No."))
                {
                }
                column(Purchase_Line_QuantityCaption;FIELDCAPTION(Quantity))
                {
                }
                column(Purchase_Line__Location_Code_Caption;FIELDCAPTION("Location Code"))
                {
                }
                column(Purchase_Line__Expected_Receipt_Date_Caption;FIELDCAPTION("Expected Receipt Date"))
                {
                }
                column(Purchase_Line_Document_Type;"Document Type")
                {
                }
                column(Purchase_Line_Line_No_;"Line No.")
                {
                }
                column(Purchase_Line_No_;"No.")
                {
                }
            }
            dataitem("Indent Line";"Indent Line")
            {
                DataItemLink = No.=FIELD(No.);
                DataItemTableView = SORTING(No.) ORDER(Ascending) WHERE(Indent Status=CONST(Indent));
                column(Indent_Line__Document_No__;"Document No.")
                {
                }
                column(Indent_Line_Quantity;Quantity)
                {
                }
                column(Indent_Line__Delivery_Location_;"Delivery Location")
                {
                }
                column(INDENTSCaption;INDENTSCaptionLbl)
                {
                }
                column(Indent_Line__Document_No__Caption;FIELDCAPTION("Document No."))
                {
                }
                column(Indent_Line_QuantityCaption;FIELDCAPTION(Quantity))
                {
                }
                column(Indent_Line__Delivery_Location_Caption;FIELDCAPTION("Delivery Location"))
                {
                }
                column(Indent_Line_Line_No_;"Line No.")
                {
                }
                column(Indent_Line_No_;"No.")
                {
                }
            }
            dataitem("Sales Line";"Sales Line")
            {
                DataItemLink = No.=FIELD(No.);
                DataItemTableView = SORTING(Type,No.,Variant Code,Drop Shipment,Location Code,Document Type,Shipment Date) ORDER(Ascending) WHERE(Type=CONST(Item),Qty. to Ship=FILTER(>0));
                column(Sales_Line__Document_No__;"Document No.")
                {
                }
                column(Sales_Line_Quantity;Quantity)
                {
                }
                column(Sales_Line__Document_No__Caption;FIELDCAPTION("Document No."))
                {
                }
                column(Sales_Line_QuantityCaption;FIELDCAPTION(Quantity))
                {
                }
                column(SALE_ORDERSCaption;SALE_ORDERSCaptionLbl)
                {
                }
                column(Sales_Line_Document_Type;"Document Type")
                {
                }
                column(Sales_Line_Line_No_;"Line No.")
                {
                }
                column(Sales_Line_No_;"No.")
                {
                }
            }
            dataitem("Material Issues Line";"Material Issues Line")
            {
                DataItemLink = Item No.=FIELD(No.);
                DataItemTableView = SORTING(Item No.,Prod. Order No.,Prod. Order Line No.) ORDER(Ascending);
                column(Material_Issues_Line__Document_No__;"Document No.")
                {
                }
                column(Material_Issues_Line_Quantity;Quantity)
                {
                }
                column(Material_Issues_Line__Transfer_from_Code_;"Transfer-from Code")
                {
                }
                column(Material_Issues_Line__Document_No__Caption;FIELDCAPTION("Document No."))
                {
                }
                column(Material_Issues_Line_QuantityCaption;FIELDCAPTION(Quantity))
                {
                }
                column(Material_Issues_Line__Transfer_from_Code_Caption;FIELDCAPTION("Transfer-from Code"))
                {
                }
                column(MATERIAL_REQUESTSCaption;MATERIAL_REQUESTSCaptionLbl)
                {
                }
                column(Material_Issues_Line_Line_No_;"Line No.")
                {
                }
                column(Material_Issues_Line_Item_No_;"Item No.")
                {
                }
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
        item_code : Text[100];
        PRODUCTION_BOM_SCaptionLbl : Label 'PRODUCTION BOM''S';
        BOMCaptionLbl : Label 'BOM';
        QUANTITYCaptionLbl : Label 'QUANTITY';
        VERSIONCaptionLbl : Label 'VERSION';
        PRODCUTION_ORDERSCaptionLbl : Label 'PRODCUTION ORDERS';
        PURCHASE_ORDERSCaptionLbl : Label 'PURCHASE ORDERS';
        INDENTSCaptionLbl : Label 'INDENTS';
        SALE_ORDERSCaptionLbl : Label 'SALE ORDERS';
        MATERIAL_REQUESTSCaptionLbl : Label 'MATERIAL REQUESTS';
}

