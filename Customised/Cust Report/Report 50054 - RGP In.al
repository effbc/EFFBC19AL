report 50054 "RGP In"
{
    // version B2B 1.0,Cal1.0

    DefaultLayout = RDLC;
    RDLCLayout = './RGP In.rdlc';

    dataset
    {
        dataitem("Material Issues Header"; "Material Issues Header")
        {
            ReqFilterHeading = 'Gate Pass';
            column(Material_Issues_Header_No_; "No.")
            {
            }
            dataitem("Mat.Issue Track. Specification"; "Mat.Issue Track. Specification")
            {
                DataItemLink = Order No.=FIELD(No.);
                DataItemTableView = SORTING(Order No., Order Line No., Item No., Location Code, Lot No., Serial No., Appl.-to Item Entry) ORDER(Ascending);
                column(Mat_Issue_Track__Specification_Quantity; Quantity)
                {
                }
                column(Mat_Issue_Track__Specification__Serial_No__; "Serial No.")
                {
                }
                column(Mat_Issue_Track__Specification__Lot_No__; "Lot No.")
                {
                }
                column(Item_Desc_; "Item Desc")
                {
                }
                column(Mat_Issue_Track__Specification_Quantity_Control1102154000; Quantity)
                {
                }
                column(Mat_Issue_Track__Specification__Serial_No___Control1102154002; "Serial No.")
                {
                }
                column(Mat_Issue_Track__Specification__Lot_No___Control1102154004; "Lot No.")
                {
                }
                column(Item_Desc__Control1102154015; "Item Desc")
                {
                }
                column(ItemCaption; ItemCaptionLbl)
                {
                }
                column(SerialCaption; SerialCaptionLbl)
                {
                }
                column(QuantityCaption; QuantityCaptionLbl)
                {
                }
                column(LOTCaption; LOTCaptionLbl)
                {
                }
                column(Mat_Issue_Track__Specification_Order_No_; "Order No.")
                {
                }
                column(Mat_Issue_Track__Specification_Order_Line_No_; "Order Line No.")
                {
                }
                column(Mat_Issue_Track__Specification_Item_No_; "Item No.")
                {
                }
                column(Mat_Issue_Track__Specification_Location_Code; "Location Code")
                {
                }
                column(Mat_Issue_Track__Specification_Appl__to_Item_Entry; "Appl.-to Item Entry")
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
        Text000: Label 'COPY';
        cnt: Integer;
        prnt: Boolean;
        "Item Desc": Text[30];
        Item: Record Item;
        ItemCaptionLbl: Label 'Item';
        SerialCaptionLbl: Label 'Serial';
        QuantityCaptionLbl: Label 'Quantity';
        LOTCaptionLbl: Label 'LOT';
}

