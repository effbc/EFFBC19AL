page 60066 "DC Subform"
{
    // version B2B1.0

    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "DC Line";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field(Type; Type)
                {
                }
                field("Line No."; "Line No.")
                {
                }
                field("No."; "No.")
                {
                }
                field(Description; Description)
                {
                }
                field("Unit Cost"; "Unit Cost")
                {
                }
                field("Case No."; "Case No.")
                {
                }
                field(Quantity; Quantity)
                {
                }
                field("Serial Or Lot No"; "Serial Or Lot No")
                {
                }
                field("Non-Returnable"; "Non-Returnable")
                {
                }
                field("Unit Of Measure"; "Unit Of Measure")
                {
                }
                field("Net Wt./Kgs."; "Net Wt./Kgs.")
                {
                }
                field("Gross Wt./Kgs."; "Gross Wt./Kgs.")
                {
                }
                field("Size.of Case"; "Size.of Case")
                {
                }
                field("Returned Quantity"; "Returned Quantity")
                {
                }
                field("Returned Serial Or Lot No"; "Returned Serial Or Lot No")
                {
                }
                field(Returned; Returned)
                {
                    Visible = ReturnedVisible;

                    trigger OnValidate();
                    begin
                        IF Returned = TRUE THEN BEGIN
                            IF "Returned Quantity" <> Quantity THEN
                                ERROR('Returned Quantity must be equal to Quantity!');
                            DCL.RESET;
                            DCL.SETRANGE(DCL."Document No.", "Document No.");
                            DCL.SETFILTER(DCL."Line No.", '<>%1', "Line No.");
                            DCL.SETRANGE(DCL."Non-Returnable", FALSE);
                            DCL.SETRANGE(DCL.Returned, FALSE);
                            IF NOT DCL.FINDFIRST THEN BEGIN
                                DCH.RESET;
                                DCH.SETRANGE(DCH."No.", "Document No.");
                                //DCH.SETRANGE(DCH.NonReturnable,FALSE);
                                IF DCH.FINDFIRST THEN BEGIN
                                    DCH.Returned := TRUE;
                                    DCH."Returned Date" := TODAY();
                                    DCH.MODIFY;
                                END;
                            END;
                            "Returned Date" := TODAY();
                            MODIFY;
                        END
                        ELSE BEGIN
                            IF "Non-Returnable" = FALSE THEN BEGIN
                                DCH.RESET;
                                DCH.SETRANGE(DCH."No.", "Document No.");
                                //DCH.SETRANGE(DCH.NonReturnable,FALSE);
                                IF DCH.FINDFIRST THEN BEGIN
                                    DCH.Returned := FALSE;
                                    DCH."Returned Date" := 0D;
                                    DCH.MODIFY;
                                END;
                            END;
                            "Returned Date" := 0D;
                            MODIFY;
                        END;
                    end;
                }
                field(Remarks; Remarks)
                {
                }
                field("Returned Date"; "Returned Date")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(DC)
            {
                Caption = 'DC';
                action("Item &Tracking Lines")
                {
                    Caption = 'Item &Tracking Lines';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #60065. Unsupported part was commented. Please check it.
                        /*CurrPage.DCLine.FORM.*/
                        OpenItemTrackingLines;

                    end;
                }
            }
        }
    }

    trigger OnInit();
    begin
        ReturnedVisible := TRUE;
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        Type := Type::Item
    end;

    trigger OnOpenPage();
    begin
        IF UPPERCASE(USERID) IN ['EFFTRONICS\DMADHAVI', 'EFFTRONICS\ANANDA', 'EFFTRONICS\MARY', 'EFFTRONICS\RATNA', 'EFFTRONICS\PRANAVI', 'EFFTRONICS\VIJAYA', 'EFFTRONICS\KSUGUNA', 'EFFTRONICS\PARDHU', 'EFFTRONICS\RENUKACH'] THEN
            ReturnedVisible := TRUE
        ELSE
            ReturnedVisible := FALSE;
    end;

    var
        TrackingSpecification: Record "Mat.Issue Track. Specification";
        DCH: Record "DC Header";
        [InDataSet]
        ReturnedVisible: Boolean;
        DCL: Record "DC Line";

    [LineStart(6015)]
    procedure OpenItemTrackingLines();
    var
        Item: Record Item;
        Text001: TextConst ENU = 'You must specify Item Tracking Code in Item No. =''%1''.';
    begin
        Item.GET("No.");
        IF Item."Item Tracking Code" <> '' THEN BEGIN
            TrackingSpecification.SETRANGE("Order No.", "Document No.");
            TrackingSpecification.SETRANGE("Order Line No.", "Line No.");
            TrackingSpecification.SETRANGE("Item No.", "No.");
            DCH.RESET;
            DCH.SETFILTER(DCH."No.", "Document No.");
            IF DCH.FINDFIRST THEN
                TrackingSpecification.SETRANGE("Location Code", DCH.SessionCode);
            //MESSAGE(FORMAT(TrackingSpecification.COUNT));
            //PAGE.RUN(60097,TrackingSpecification);
            PAGE.RUN(PAGE::"Mat.Issues Track.Specification", TrackingSpecification);
        END ELSE
            MESSAGE(Text001, "No.");
    end;
}

