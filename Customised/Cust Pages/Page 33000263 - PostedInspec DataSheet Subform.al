page 33000263 "PostedInspec DataSheet Subform"
{
    // version QC1.0

    Editable = false;
    PageType = ListPart;
    SourceTable = "Posted Inspect Datasheet Line";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                IndentationColumn = DescriptionIndent;
                IndentationControls = Description;
                ShowCaption = false;
                field("Line No."; "Line No.")
                {
                    Editable = false;
                }
                field("Character Code"; "Character Code")
                {
                    Editable = false;
                }
                field(Description; Description)
                {
                    Editable = false;
                }
                field("Serial No."; "Serial No.")
                {
                }
                field("Item No."; "Item No.")
                {
                }
                field("Sampling Plan Code"; "Sampling Plan Code")
                {
                    Editable = false;
                }
                field("Unit Of Measure Code"; "Unit Of Measure Code")
                {
                    Editable = false;
                }
                field("Normal Value (Num)"; "Normal Value (Num)")
                {
                    Editable = false;
                }
                field("Actul Time(In Hours)"; "Actul Time(In Hours)")
                {
                }
                field("Time Taken(In Hours)"; "Time Taken(In Hours)")
                {
                }
                field("Reason Code"; "Reason Code")
                {
                }
                field(Remarks; Remarks)
                {
                }
                field("Inspection Persons"; "Inspection Persons")
                {
                }
                field("Min. Value (Num)"; "Min. Value (Num)")
                {
                    Editable = false;
                }
                field(Accept; Accept)
                {
                }
                field("Max. Value (Num)"; "Max. Value (Num)")
                {
                    Editable = false;
                }
                field("Actual Value (Num)"; "Actual Value (Num)")
                {
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
                field("Actual  Value (Text)"; "Actual  Value (Text)")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                action("&Defects")
                {
                    Caption = '&Defects';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #33000262. Unsupported part was commented. Please check it.
                        /*CurrPage.DataSheetLine.Page.*/
                        ShowDefects;

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

    (23055)]
    procedure ShowDefects();
    begin
        DefectTracking.SETRANGE("IDS No.", "Document No.");
        DefectTracking.SETRANGE("IDS Line No.", "Line No.");
        PAGE.RUN(60075, DefectTracking);
    end;

    (23060)]
    local procedure CharacterCodeOnFormat();
    begin
        "Character CodeEmphasize" := "Character Type" <> "Character Type"::Standard;
    end;

    (23063)]
    local procedure DescriptionOnFormat();
    begin
        DescriptionEmphasize := "Character Type" <> "Character Type"::Standard;
        DescriptionIndent := Indentation;
    end;
}

