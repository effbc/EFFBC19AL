page 60271 "Sales  Quote Specification"
{
    // version B2BQTO

    DelayedInsert = true;
    PageType = Worksheet;
    SourceTable = "Sales Quote Specification";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                }
                field("Lookup Type ID"; "Lookup Type ID")
                {
                }
                field("Lookup Type Name"; "Lookup Type Name")
                {
                }
                field("Lookup Code"; "Lookup Code")
                {
                }
                field(Description; Description)
                {
                }
                field("Sales Quote No."; "Sales Quote No.")
                {
                }
                field(FieldNo1; FieldNo1)
                {
                    Editable = EditLookUp;
                }
                field(FieldNo2; FieldNo2)
                {
                    Editable = EditLookUp;
                }
                field(FieldNo3; FieldNo3)
                {
                    Editable = EditLookUp;
                }
                field(FieldNo4; FieldNo4)
                {
                    Editable = EditLookUp;
                }
                field(FieldNo5; FieldNo5)
                {
                    Editable = EditLookUp;
                }
                field(FieldNo6; FieldNo6)
                {
                    Editable = EditLookUp;
                }
                field(Qty; Qty)
                {
                    Editable = EditLookUp;
                }
                field(Rate; Rate)
                {
                    Editable = EditLookUp;
                }
                field(Amount; Amount)
                {
                    Editable = EditLookUp;
                }
                field(Remarks; Remarks)
                {
                    Editable = EditLookUp;
                }
                field("Terms LookUp"; "Terms LookUp")
                {
                    Editable = TermLookUp;
                }
                field("Schedule LookUp"; "Schedule LookUp")
                {
                    Editable = SechLookup;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Action1102152009)
            {
                action(Specification)
                {
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        LookUpType.RESET;
                        LookUpType.SETRANGE("Lookup Type ID", Rec."Lookup Type ID");
                        CLEAR(QuoteLookUpList);
                        QuoteLookUpList.SETRECORD(LookUpType);
                        QuoteLookUpList.SETTABLEVIEW(LookUpType);
                        QuoteLookUpList.LOOKUPMODE(TRUE);
                        QuoteLookUpList.CarrySalesQuoteNo(Rec."Sales Quote No.");
                        IF QuoteLookUpList.RUNMODAL = ACTION::LookupOK THEN;

                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        IF "Lookup Type ID" = 5 THEN
            SechLookup := TRUE
        ELSE
            SechLookup := FALSE;

        IF "Lookup Type ID" = 3 THEN
            TermLookUp := TRUE
        ELSE
            TermLookUp := FALSE;

        IF ("Lookup Type ID" = 5) OR ("Lookup Type ID" = 3) THEN
            EditLookUp := TRUE
        ELSE
            EditLookUp := FALSE;
    end;

    var
        LookUpType: Record "Quote Lookup";
        QuoteLookUpList: Page "Quote LookUp List";
        EditLookUp: Boolean;
        SechLookup: Boolean;
        TermLookUp: Boolean;
}

