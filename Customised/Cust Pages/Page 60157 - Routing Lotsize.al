page 60157 "Routing Lotsize"
{
    PageType = Worksheet;
    SourceTable = "Routing Line";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Routing No.";"Routing No.")
                {
                    Editable = false;
                }
                field("Operation No.";"Operation No.")
                {
                    Editable = false;
                }
                field("Operation Description";"Operation Description")
                {
                    Editable = false;
                }
                field(Type;Type)
                {
                    Editable = false;
                }
                field("No.";"No.")
                {
                    Editable = false;
                }
                field("Lot Size";"Lot Size")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnQueryClosePage(CloseAction : Action) : Boolean;
    begin
        RoutingHeader.SETRANGE("No.","Routing No.");
        IF RoutingHeader.FINDFIRST THEN BEGIN
          RoutingHeader.Status := RoutingHeader.Status :: Certified;
          RoutingHeader.MODIFY;
        END;
    end;

    var
        RoutingHeader : Record "Routing Header";
}

