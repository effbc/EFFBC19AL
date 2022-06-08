page 33000270 "Inpection Receipt Line"
{
    // version C1.0,Rev01

    DelayedInsert = true;
    InsertAllowed = false;
    PageType = ListPart;
    SourceTable = "Inspection Receipt Line";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                IndentationColumn = DescriptionIndent;
                IndentationControls = Description;
                ShowCaption = false;
                field("Character Code"; "Character Code")
                {
                    Editable = false;
                }
                field(Description; Description)
                {
                    Editable = false;
                }
                field("Item No."; "Item No.")
                {
                }
                field("Sampling Plan Code"; "Sampling Plan Code")
                {
                    Editable = false;
                }
                field("Normal Value (Num)"; "Normal Value (Num)")
                {
                    Editable = false;
                }
                field("Min. Value (Num)"; "Min. Value (Num)")
                {
                    Editable = false;
                }
                field("Max. Value (Num)"; "Max. Value (Num)")
                {
                    Editable = false;
                }
                field("Normal Value (Text)"; "Normal Value (Text)")
                {
                    Editable = false;
                }
                field("Min. Value (Text)"; "Min. Value (Text)")
                {
                    Editable = false;
                }
                field("Max. Value (Text)"; "Max. Value (Text)")
                {
                    Editable = false;
                }
                field("Unit Of Measure Code"; "Unit Of Measure Code")
                {
                    Editable = false;
                }
                field("Lot Size - Min"; "Lot Size - Min")
                {
                    Editable = false;
                }
                field("Lot Size - Max"; "Lot Size - Max")
                {
                    Editable = false;
                }
                field("Allowable Defects - Max"; "Allowable Defects - Max")
                {
                    Editable = false;
                }
                field("Total Qty"; "Total Qty")
                {
                    Editable = false;
                }
                field("Accepted Qty"; "Accepted Qty")
                {
                    Editable = false;
                }
                field("Rejected Qty"; "Rejected Qty")
                {
                    Editable = false;
                }
                field(Accept; Accept)
                {
                }
                field("Reason Code"; "Reason Code")
                {
                }
                field("Rework Reason Code"; "Rework Reason Code")
                {
                }
                field("Inspection Persons"; "Inspection Persons")
                {
                }
                field(Remarks; Remarks)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Receipt")
            {
                Caption = '&Receipt';
                action("&Defects")
                {
                    Caption = '&Defects';
                    Image = PrevErrorMessage;

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #33000268. Unsupported part was commented. Please check it.
                        /*CurrPage.InpectionReceiptLine.Page.*/
                        ShowDefectsPage;

                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        DescriptionIndent := 0;
        CharacterCodeOnFormat;
        DescriptionOnFormat;
    end;

    var
        DefectTracking: Record "Defect Tracking Details";
        [InDataSet]
        "Character CodeEmphasize": Boolean;
        [InDataSet]
        DescriptionEmphasize: Boolean;
        [InDataSet]
        DescriptionIndent: Integer;

    (23580)]
    procedure ShowDefectsPage();
    begin
        DefectTracking.SETRANGE("IDS No.", "IDS No.");
        DefectTracking.SETRANGE("IDS Line No.", "IDS Line No.");
        PAGE.RUN(60075, DefectTracking);
    end;

    (23585)]
    local procedure CharacterCodeOnFormat();
    begin
        "Character CodeEmphasize" := "Character Type" <> "Character Type"::Standard;
    end;

    (23588)]
    local procedure DescriptionOnFormat();
    begin
        DescriptionEmphasize := "Character Type" <> "Character Type"::Standard;
        DescriptionIndent := Indentation;
    end;
}

