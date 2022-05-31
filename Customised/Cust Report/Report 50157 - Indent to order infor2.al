report 50157 "Indent to order infor2"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Indent to order infor2.rdlc';

    dataset
    {
        dataitem("Purchase Line"; "Purchase Line")
        {
            DataItemTableView = SORTING(Indent No.);
            RequestFilterFields = "Indent No.";
            column(itemno; itemno)
            {
            }
            column(Purchase_Line_Quantity; Quantity)
            {
            }
            column(unitcost; unitcost)
            {
            }
            column(dateofit; dateofit)
            {
            }
            column(converteddays; converteddays)
            {
            }
            column(itemdesc; itemdesc)
            {
            }
            column(Indent_DetailsCaption; Indent_DetailsCaptionLbl)
            {
            }
            column(Item_NoCaption; Item_NoCaptionLbl)
            {
            }
            column(Item_DescriptionCaption; Item_DescriptionCaptionLbl)
            {
            }
            column(QuantityCaption; QuantityCaptionLbl)
            {
            }
            column(Unit_CostCaption; Unit_CostCaptionLbl)
            {
            }
            column(Expected_DateCaption; Expected_DateCaptionLbl)
            {
            }
            column(Days_taken_to_Convert_from_Indent_to_OrderCaption; Days_taken_to_Convert_from_Indent_to_OrderCaptionLbl)
            {
            }
            column(Purchase_Line_Document_Type; "Document Type")
            {
            }
            column(Purchase_Line_Document_No_; "Document No.")
            {
            }
            column(Purchase_Line_Line_No_; "Line No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                itemno := '';
                itemdesc := '';
                Quantity := 0;
                unitcost := 0;
                "expected date" := 0D;
                converteddays := '';
                IL.SETRANGE(IL."Document No.", "Purchase Line"."Indent No.");
                IL.SETRANGE(IL."Line No.", "Purchase Line"."Indent Line No.");
                IL.SETRANGE(IL."Order Mail", FALSE);
                IF IL.FIND('-') THEN BEGIN
                    itemno := IL."No.";
                    itemdesc := IL.Description;
                    Quantity := IL.Quantity;
                    unitcost := IL."Unit Cost";
                    IH.SETRANGE(IH."No.", IL."Document No.");
                    IF IH.FIND('-') THEN BEGIN
                        dateofit := DT2DATE(IH."Release Date Time");
                        converteddays := FORMAT(TODAY - dateofit);
                    END;
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
        IL: Record "Indent Line";
        itemno: Code[20];
        quantity: Decimal;
        unitcost: Decimal;
        "expected date": Date;
        converteddays: Text[100];
        IH: Record "Indent Header";
        dateofit: Date;
        itemdesc: Text[250];
        Indent_DetailsCaptionLbl: Label 'Indent Details';
        Item_NoCaptionLbl: Label 'Item No';
        Item_DescriptionCaptionLbl: Label 'Item Description';
        QuantityCaptionLbl: Label 'Quantity';
        Unit_CostCaptionLbl: Label 'Unit Cost';
        Expected_DateCaptionLbl: Label 'Expected Date';
        Days_taken_to_Convert_from_Indent_to_OrderCaptionLbl: Label 'Days taken to Convert from Indent to Order';
}

