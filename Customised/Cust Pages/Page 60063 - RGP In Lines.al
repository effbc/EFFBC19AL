page 60063 "RGP In Lines"
{
    // version B2B1.0,Cal1.0

    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "RGP In Line";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field(Type; Type)
                {

                    trigger OnValidate();
                    var
                        RGPInLine: Record "RGP In Line";
                    begin
                        IF (xRec.Type <> Type::" ") THEN BEGIN
                            IF (xRec.Type <> Type) THEN BEGIN
                                "No." := '';
                                Description := '';
                                Quantity := 0;
                                UOM := '';
                            END;
                        END;
                        TypeOnAfterValidate;
                    end;
                }
                field("No."; "No.")
                {
                }
                field("Production Order Line No."; "Production Order Line No.")
                {
                }
                field("Production Order"; "Production Order")
                {
                }
                field("Drawing No."; "Drawing No.")
                {
                }
                field("Operation No."; "Operation No.")
                {
                }
                field("MRIR No."; "MRIR No.")
                {
                }
                field("Routing No."; "Routing No.")
                {
                }
                field("Material Group"; "Material Group")
                {
                }
                field("S.L.No."; "S.L.No.")
                {
                }
                field(Purpose; Purpose)
                {
                }
                field("Submited TO (dept)"; "Submited TO (dept)")
                {
                }
                field("Submition Date"; "Submition Date")
                {
                }
                field("Exp. Date"; "Exp. Date")
                {
                }
                field("Exp.Incurred"; "Exp.Incurred")
                {
                }
                field("RET/NRET"; "RET/NRET")
                {
                }
                field(Remarks; Remarks)
                {
                }
                field(Description; Description)
                {
                }
                field(Quantity; Quantity)
                {

                    trigger OnValidate();
                    begin
                        IF (xRec.Quantity <> Quantity) THEN BEGIN
                            RGPApplied.SETRANGE("Document No.", "Document No.");
                            RGPApplied.SETRANGE("Document Line No.", "Line No.");
                            IF RGPApplied.FINDSET THEN BEGIN
                                REPEAT
                                    EntryNo := RGPApplied."Applied To Entry";
                                    RGPLedgerEntry.SETRANGE("Entry No.", EntryNo);
                                    IF RGPLedgerEntry.FINDFIRST THEN BEGIN
                                        RGPLedgerEntry."Applies To" := '';
                                        RGPLedgerEntry.MODIFY;
                                    END;
                                UNTIL RGPApplied.NEXT = 0;
                            END;

                            RGPApplied.DELETEALL;

                            TempLedgerEntry.DELETEALL;

                        END;
                    end;
                }
                field(UOM; UOM)
                {
                }
                field("Quantity to Recieve"; "Quantity to Recieve")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    var
        RGPApplied: Record "Temp. Applied RGPs";
        EntryNo: Integer;
        RGPLedgerEntry: Record "RGP Ledger Entries";
        TempLedgerEntry: Record "Temp. RGP Ledger Entry";

    [LineStart(5822)]
    procedure RGPEntries(var RGPInHeader: Record "RGP In Header"; var RGPInLine: Record "RGP In Line");
    var
        TempLedgerEntry: Record "Temp. RGP Ledger Entry";
    begin
        TempLedgerEntry.SETRANGE("Line No.", 1);
        IF NOT TempLedgerEntry.FINDFIRST THEN BEGIN
            TempLedgerEntry."Line No." := 1;
            TempLedgerEntry.Consignee := RGPInHeader.Consignee;
            TempLedgerEntry."Consignee No." := RGPInHeader."Consignee No.";
            TempLedgerEntry.Type := RGPInLine.Type;
            TempLedgerEntry."No." := RGPInLine."No.";
            TempLedgerEntry.Quantity := RGPInLine.Quantity;
            TempLedgerEntry."Quantity to Recieve" := RGPInLine.Quantity;
            TempLedgerEntry."RGP In No." := RGPInLine."Document No.";
            TempLedgerEntry."RGP Line No." := RGPInLine."Line No.";
            TempLedgerEntry."RGP Document Date" := RGPInHeader."RGP In Date";
            TempLedgerEntry.INSERT;
            COMMIT;
            //END ELSE BEGIN
            //  TempLedgerEntry.Quantity:=RGPInLine.Quantity;
            //  TempLedgerEntry.MODIFY;
        END;
        //COMMIT;
    end;

    [LineStart(5843)]
    procedure showEntries(var RGPHeader: Record "RGP In Header");
    var
        RGPLedgerEntry: Record "RGP Ledger Entries";
        Text001: Label 'Line No. %1 is copied from RGP Out No. %2,You cannot apply entries to this line.';
        RGPLedgerEntryForm: Page "RGP Type Ledger Entries";
    begin
        IF "Quantity to Recieve" <> 0 THEN
            ERROR(Text001, "Line No.", "RGP Out Document No.");

        RGPEntries(RGPHeader, Rec);

        CLEAR(RGPLedgerEntryForm);

        RGPLedgerEntry.SETRANGE(Consignee, RGPHeader.Consignee);
        RGPLedgerEntry.SETRANGE("Consignee No.", RGPHeader."Consignee No.");
        RGPLedgerEntry.SETRANGE(Type, Type);
        RGPLedgerEntry.SETRANGE("No.", "No.");
        RGPLedgerEntry.SETRANGE("Document Type", RGPLedgerEntry."Document Type"::Out);
        RGPLedgerEntry.SETRANGE(Open, TRUE);
        RGPLedgerEntryForm.SETTABLEVIEW(RGPLedgerEntry);
        RGPLedgerEntryForm.RUNMODAL;
    end;

    [LineStart(5860)]
    local procedure TypeOnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;
}

