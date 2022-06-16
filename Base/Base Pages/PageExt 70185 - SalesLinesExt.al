pageextension 70185 SalesLinesExt extends "Sales Lines"
{
    layout
    {
        addbefore(Control1)
        {
            field("Change to Specified Plan Date"; Rec."Change to Specified Plan Date")
            {
                ApplicationArea = All;

            }
        }
        addafter(Quantity)
        {
            field("To Be Shipped Qty"; "To Be Shipped Qty")
            {
                ApplicationArea = All;

            }
            field("Material Reuired Date"; "Material Reuired Date")
            {
                ApplicationArea = All;

            }
            field("Planned Shipment Date"; "Planned Shipment Date")
            {
                ApplicationArea = All;

            }


        }
        addafter("Shortcut Dimension 1 Code")
        {
            field("Line Amount(LOA)"; "Line Amount(LOA)")
            {
                ApplicationArea = All;

            }
            field("Unitcost(LOA)"; "Unitcost(LOA)")
            {
                ApplicationArea = All;

            }
            field("OutStanding(LOA)"; "OutStanding(LOA)")
            {
                ApplicationArea = All;

            }
        }

    }
    var
        "G|L": Record "General Ledger Setup";
        Sales_Line: Record "Sales Line";
        "Plan Change": Codeunit "Plan Change";

    LOCAL PROCEDURE ToBeShippedQtyOnAfterInput(VAR Text: Text[1024]);
    BEGIN
        IF (USERID <> 'EFFTRONICS\PADMAJA') AND (USERID <> '07TE024') THEN
            ERROR('You dont have rights to chage');
    END;


    LOCAL PROCEDURE MaterialReuiredDateOnAfterInpu(VAR Text: Text[1024]);
    BEGIN
        IF (USERID <> 'EFFTRONICS\PADMAJA') AND (USERID <> '07TE024') THEN
            ERROR('You dont have rights to chage');
    END;


    LOCAL PROCEDURE PlanShiftingDateOnAfterInput(VAR Text: Text[1024]);
    BEGIN
        IF (USERID <> 'EFFTRONICS\PADMAJA') AND (USERID <> '07TE024') THEN
            ERROR('You dont have rights to chage');
    END;


    LOCAL PROCEDURE ChangetoSpecifiedPlanDatOnPush();
    BEGIN
        IF (USERID <> 'EFFTRONICS\PADMAJA') AND (USERID <> '07TE024') THEN
            ERROR('You dont have rights to chage');
    END;


}

