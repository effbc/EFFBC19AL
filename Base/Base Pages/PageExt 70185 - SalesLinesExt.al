pageextension 70185 SalesLinesExt extends "Sales Lines"
{
    layout
    {
        addbefore(Control1)
        {
            field("Change to Specified Plan Date"; Rec."Change to Specified Plan Date")
            {

            }
        }
        addafter(Quantity)
        {
            field("To Be Shipped Qty"; "To Be Shipped Qty")
            {

            }
            field("Material Reuired Date"; "Material Reuired Date")
            {

            }
            field("Planned Shipment Date"; "Planned Shipment Date")
            {

            }


        }
        addafter("Shortcut Dimension 1 Code")
        {
            field("Line Amount(LOA)"; "Line Amount(LOA)")
            {

            }
            field("Unitcost(LOA)"; "Unitcost(LOA)")
            {

            }
            field("OutStanding(LOA)"; "OutStanding(LOA)")
            {

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

