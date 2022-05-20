page 33000258 "Inspection Data Sheet Subform"
{
    // version QC1.0

    AutoSplitKey = true;
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = ListPart;
    SaveValues = true;
    SourceTable = "Inspection Datasheet Line";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                IndentationColumn = DescriptionIndent;
                IndentationControls = Description;
                ShowCaption = false;
                field("Character Code";"Character Code")
                {
                    Editable = false;
                }
                field(Description;Description)
                {
                    Editable = false;
                }
                field("Serial No.";"Serial No.")
                {
                }
                field("Item No.";"Item No.")
                {
                }
                field("Sampling Plan Code";"Sampling Plan Code")
                {
                    Editable = false;
                }
                field("Reason Code";"Reason Code")
                {
                }
                field("Rework Reason Code";"Rework Reason Code")
                {
                }
                field("Unit Of Measure Code";"Unit Of Measure Code")
                {
                    Editable = false;
                }
                field("Bench Mark Time(In Min.)";"Bench Mark Time(In Min.)")
                {
                    Editable = false;
                }
                field("Time Taken(In Min.)";"Time Taken(In Min.)")
                {
                }
                field(Qualitative;Qualitative)
                {
                    Editable = false;
                }
                field("Normal Value (Num)";"Normal Value (Num)")
                {
                    Editable = false;
                }
                field("Min. Value (Num)";"Min. Value (Num)")
                {
                    Editable = false;
                }
                field(Accept;Accept)
                {
                }
                field("Max. Value (Num)";"Max. Value (Num)")
                {
                    Editable = false;
                }
                field("Actual Value (Num)";"Actual Value (Num)")
                {
                }
                field("Normal Value (Text)";"Normal Value (Text)")
                {
                    Editable = false;
                }
                field("Min. Value (Text)";"Min. Value (Text)")
                {
                    Editable = false;
                }
                field("Max. Value (Text)";"Max. Value (Text)")
                {
                    Editable = false;
                }
                field(Remarks;Remarks)
                {
                }
                field("Inspection Persons";"Inspection Persons")
                {
                }
                field("Actual  Value (Text)";"Actual  Value (Text)")
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
                action(Defects)
                {
                    Caption = 'Defects';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #33000257. Unsupported part was commented. Please check it.
                        /*CurrPage.subPage.Page.*/
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
        DefectTracking : Record "Defect Tracking Details";
        InspectionDataSheets : Codeunit "Inspection Data Sheets";
        InspectionDatasheetHeader : Record "Inspection Datasheet Header";
        ProdOrdNo : Code[20];
        [InDataSet]
        "Character CodeEmphasize" : Boolean;
        [InDataSet]
        DescriptionEmphasize : Boolean;
        [InDataSet]
        DescriptionIndent : Integer;

    [LineStart(23017)]
    procedure ShowDefects();
    begin
        DefectTracking.SETRANGE("IDS No.","Document No.");
        DefectTracking.SETRANGE("IDS Line No.","Line No.");
        PAGE.RUN(60075,DefectTracking);
    end;

    [LineStart(23022)]
    local procedure CharacterCodeOnFormat();
    begin
        "Character CodeEmphasize" := "Character Type" <> "Character Type"::Standard;
    end;

    [LineStart(23025)]
    local procedure DescriptionOnFormat();
    begin
        DescriptionEmphasize := "Character Type" <> "Character Type"::Standard;
        DescriptionIndent := Indentation;
    end;
}

