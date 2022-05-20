report 50156 "Indent to order info"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Indent to order info.rdlc';

    dataset
    {
        dataitem("Purchase Header";"Purchase Header")
        {
            DataItemTableView = SORTING(Document Type,No.) ORDER(Ascending);
            RequestFilterFields = "No.";
            column(Purchase_Header__No__;"No.")
            {
            }
            column(Purchase_Header__Buy_from_Vendor_Name_;"Buy-from Vendor Name")
            {
            }
            column(Purchase_Order_DetialsCaption;Purchase_Order_DetialsCaptionLbl)
            {
            }
            column(Purchase_Header__No__Caption;FIELDCAPTION("No."))
            {
            }
            column(Purchase_Header__Buy_from_Vendor_Name_Caption;FIELDCAPTION("Buy-from Vendor Name"))
            {
            }
            column(Purchase_Header_Document_Type;"Document Type")
            {
            }
            dataitem("Purchase Line";"Purchase Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = WHERE(Quantity=FILTER(>0));
                column(Purchase_Line__No__;"No.")
                {
                }
                column(Purchase_Line_Description;Description)
                {
                }
                column(Purchase_Line_Quantity;Quantity)
                {
                }
                column(Purchase_Line__Unit_Cost__LCY__;"Unit Cost (LCY)")
                {
                }
                column(Purchase_Line__Expected_Receipt_Date_;"Expected Receipt Date")
                {
                }
                column(noofdays;noofdays)
                {
                }
                column(lineamount;lineamount)
                {
                }
                column(Purchase_Line__No__Caption;FIELDCAPTION("No."))
                {
                }
                column(Purchase_Line_DescriptionCaption;FIELDCAPTION(Description))
                {
                }
                column(Purchase_Line_QuantityCaption;FIELDCAPTION(Quantity))
                {
                }
                column(Purchase_Line__Unit_Cost__LCY__Caption;FIELDCAPTION("Unit Cost (LCY)"))
                {
                }
                column(Expected_DateCaption;Expected_DateCaptionLbl)
                {
                }
                column(Days_taken_to_convert_from_Indent_to_orderCaption;Days_taken_to_convert_from_Indent_to_orderCaptionLbl)
                {
                }
                column(AmountCaption;AmountCaptionLbl)
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

                trigger OnAfterGetRecord();
                begin
                    lineamount:=0;
                    /*      INH.RESET;
                          INH.SETRANGE(INH."No.","Purchase Line"."Indent No.");
                          INH.SETRANGE(INH."Delivery Location",'R&D STR');
                          IF INH.FIND('-') THEN
                          BEGIN
                            dateofit:=DT2DATE(INH."Release Date Time");
                            noofdays:=FORMAT(TODAY-dateofit);
                          END;*/
                       lineamount:="Purchase Line".Quantity*"Purchase Line"."Direct Unit Cost";
                    
                    //        Subject:='YOUR INDENT ('+Prev_Indent +' ) FOR '+PREV_PROJECT+' HAS BEEN ORDERED ';
                    //       Prev_Indent:="Purchase Line"."Indent No.";

                end;

                trigger OnPreDataItem();
                begin
                    Prev_Indent:='';
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
        INH : Record "Indent Header";
        INL : Record "Indent Line";
        dateofit : Date;
        noofdays : Text[30];
        user : Record User;
        Prev_Indent : Code[20];
        lineamount : Decimal;
        Purchase_Order_DetialsCaptionLbl : Label 'Purchase Order Detials';
        Expected_DateCaptionLbl : Label 'Expected Date';
        Days_taken_to_convert_from_Indent_to_orderCaptionLbl : Label 'Days taken to convert from Indent to order';
        AmountCaptionLbl : Label 'Amount';
}

