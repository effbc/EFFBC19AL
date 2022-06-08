page 60141 "Material Issue Subform-1"
{
    // version MI1.0

    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Material Issues Line";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Item No."; "Item No.")
                {
                }
                field(Description; Description)
                {
                    Editable = false;
                }
                field("Description 2"; "Description 2")
                {
                }
                field("Gross Weight"; "Gross Weight")
                {
                }
                field(Inventory; Inventory)
                {
                    Caption = 'Inventory at Location';
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                }
                field(Quantity; Quantity)
                {
                }
                field("Qty. to Receive"; "Qty. to Receive")
                {
                }
                field("Quantity Received"; "Quantity Received")
                {

                    trigger OnDrillDown();
                    var
                        "PostedMat.RcptLine": Record "Posted Material Issues Line";
                    begin
                        TESTFIELD("Document No.");
                        TESTFIELD("Item No.");
                        "PostedMat.RcptLine".SETRANGE("Material Issue No.", "Document No.");
                        "PostedMat.RcptLine".SETRANGE("PostedMat.RcptLine"."Material Issue Line No.");
                        PAGE.RUNMODAL(0, "PostedMat.RcptLine");
                    end;
                }
                field("Prod. Order No."; "Prod. Order No.")
                {
                    Editable = false;
                }
                field("Prod. Order Line No."; "Prod. Order Line No.")
                {
                    Editable = false;
                }
                field("Prod. Order Comp. Line No."; "Prod. Order Comp. Line No.")
                {
                    Editable = false;
                }
                field("Dimension Set ID"; "Dimension Set ID")
                {
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        MatIssuesLine: Record "Material Issues Line";
        TrackingSpecification: Record "Mat.Issue Track. Specification";

    (12466)]
    procedure ItemAvailability(AvailabilityType: Option Date,Variant,Location);
    begin
        ItemAvailability(AvailabilityType);
    end;

    (12469)]
    procedure ShowDimensions();
    begin
        Rec.ShowDimensions;
    end;

    (12472)]
    procedure OpenItemTrackingLines();
    var
        Item: Record Item;
        Text001: TextConst ENU = 'You must specify Item Tracking Code in Item No. =''%1''.';
    begin
        Item.GET("Item No.");
        IF Item."Item Tracking Code" <> '' THEN BEGIN
            TrackingSpecification.SETRANGE("Order No.", "Document No.");
            TrackingSpecification.SETRANGE("Order Line No.", "Line No.");
            TrackingSpecification.SETRANGE("Item No.", "Item No.");
            TrackingSpecification.SETRANGE("Location Code", "Transfer-from Code");
            PAGE.RUN(PAGE::"Mat.Issues Track.Specification", TrackingSpecification);
        END ELSE
            MESSAGE(Text001, "Item No.");
    end;
}

