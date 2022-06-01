page 60128 "Routing Line Movement"
{
    // version Rev01

    PageType = Worksheet;
    SourceTable = "Prod. Order Routing Line";

    layout
    {
        area(content)
        {
            field("COUNT"; COUNT)
            {
            }
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Starting Date"; "Starting Date")
                {
                    Editable = false;
                }
                field("Prod. Order No."; "Prod. Order No.")
                {
                    Editable = false;
                }
                field("Routing Reference No."; "Routing Reference No.")
                {
                    Editable = false;
                }
                field("Routing No."; "Routing No.")
                {
                    Editable = false;
                }
                field("Operation No."; "Operation No.")
                {
                    Editable = false;
                }
                field("Operation Description"; "Operation Description")
                {
                    Editable = false;
                }
                field(Type; Type)
                {
                    Editable = false;
                }
                field("No."; "No.")
                {
                    Editable = false;
                }
                field("Run Time"; "Run Time")
                {
                }
                field("Starting Time"; "Starting Time")
                {
                }
                field("Ending Time"; "Ending Time")
                {
                }
                field("Work Center No."; "Work Center No.")
                {
                    Editable = false;
                }
                field(Move; Move)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("APPLY ALL")
            {
                Caption = 'APPLY ALL';
                Image = Apply;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    IF FINDSET THEN
                        REPEAT
                            Move := TRUE;
                            MODIFY;
                        UNTIL NEXT = 0;
                end;
            }
            action("CANCEL ALL")
            {
                Caption = 'CANCEL ALL';
                Image = UnApply;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    IF FINDSET THEN
                        REPEAT
                            Move := FALSE;
                            MODIFY;
                        UNTIL NEXT = 0;
                end;
            }
        }
    }
}

