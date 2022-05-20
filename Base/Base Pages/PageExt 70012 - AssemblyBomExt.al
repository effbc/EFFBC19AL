pageextension 70012 AssemblyBomExt extends "Assembly BOM"
{
    // version NAVW19.00.00.46773

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.

        modify("Control 1")
        {

            //Unsupported feature: Change Name on "Control 1". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 28". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 28". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 32". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 32". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 22". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 22". Please convert manually.


        //Unsupported feature: Change Name on "Control 24". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 24". Please convert manually.


        //Unsupported feature: Change Name on "Control 26". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 26". Please convert manually.


        //Unsupported feature: Change Name on "Control 3". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 3". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change PagePartID on "Control 18". Please convert manually.


        //Unsupported feature: Change Name on "Control 18". Please convert manually.


        //Unsupported feature: Change Name on "Control 17". Please convert manually.


        //Unsupported feature: Change Name on "Control 11". Please convert manually.


        //Unsupported feature: Change PagePartID on "Control 13". Please convert manually.


        //Unsupported feature: Change Name on "Control 13". Please convert manually.


        //Unsupported feature: Change PagePartID on "Control 9". Please convert manually.


        //Unsupported feature: Change Name on "Control 9". Please convert manually.

    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.

        modify("Action 19")
        {

            //Unsupported feature: Change RunObject on "Action 19". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 19". Please convert manually.

        }
        modify(CalcStandardCost)
        {
            Promoted = true;
        }
        modify(CalcUnitPrice)
        {
            Promoted = true;
        }
        addafter("Action 19")
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action(Action1000000001)
                {
                    Caption = 'E&xplode BOM';
                    Image = ExplodeBOM;
                    RunObject = Codeunit "BOM-Explode BOM";
                }
                separator(Action1000000002)
                {
                }
                action("Copy &Assembly")
                {
                    Caption = 'Copy &Assembly';

                    trigger OnAction();
                    begin
                        IF PAGE.RUNMODAL(PAGE::"Item List", Item) = ACTION::LookupOK THEN BEGIN
                            BomComponent.SETRANGE("Parent Item No.", Item."No.");
                            IF BomComponent.FINDSET THEN
                                REPEAT
                                    TOBomComponent.INIT;
                                    TOBomComponent."Parent Item No." := "Parent Item No.";
                                    TmpBomComponent.SETRANGE("Parent Item No.", "Parent Item No.");
                                    IF TmpBomComponent.FINDLAST THEN
                                        TOBomComponent."Line No." := TmpBomComponent."Line No." + 10000
                                    ELSE
                                        TOBomComponent."Line No." := BomComponent."Line No.";
                                    TOBomComponent.Type := BomComponent.Type;
                                    TOBomComponent.VALIDATE("No.", BomComponent."No.");
                                    TOBomComponent.VALIDATE("Quantity per", BomComponent."Quantity per");
                                    TOBomComponent.Position := BomComponent.Position;
                                    TOBomComponent."Position 2" := BomComponent."Position 2";
                                    TOBomComponent."Position 3" := BomComponent."Position 3";
                                    TOBomComponent."Machine No." := BomComponent."Machine No.";
                                    TOBomComponent."Lead-Time Offset" := BomComponent."Lead-Time Offset";
                                    TOBomComponent."Variant Code" := BomComponent."Variant Code";
                                    TOBomComponent."Installed in Line No." := BomComponent."Installed in Line No.";
                                    TOBomComponent."Installed in Item No." := BomComponent."Installed in Item No.";
                                    TOBomComponent."Assembly BOM" := BomComponent."Assembly BOM";
                                    TOBomComponent."BOM Description" := BomComponent."BOM Description";
                                    TOBomComponent.INSERT;
                                UNTIL BomComponent.NEXT = 0;
                        END;
                    end;
                }
            }
        }
    }


    //Unsupported feature: PropertyModification on "CalcStandardCost(Action 5).OnAction.CalcStdCost(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CalcStandardCost : 5812;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CalcStandardCost : "Calculate Standard Cost";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CalcUnitPrice(Action 15).OnAction.CalcStdCost(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CalcUnitPrice : 5812;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CalcUnitPrice : "Calculate Standard Cost";
    //Variable type has not been exported.

    var
        BomComponent: Record "BOM Component";
        CopyAssembly: Report "QCinspection details";
        Item: Record Item;
        TOBomComponent: Record "BOM Component";
        TmpBomComponent: Record "BOM Component";

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

