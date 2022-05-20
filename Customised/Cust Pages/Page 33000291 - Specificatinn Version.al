page 33000291 "Specificatinn Version"
{
    // version QC1.0,Rev01

    PageType = Document;
    SourceTable = "Specification Version";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Version Code";"Version Code")
                {

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                          CurrPage.UPDATE;
                    end;
                }
                field(Description;Description)
                {
                }
                field(Status;Status)
                {
                }
                field("Starting Date";"Starting Date")
                {
                }
                field("Last Date Modified";"Last Date Modified")
                {
                }
            }
            part(Control1102152012;"Specification Subform")
            {
                SubPageLink = Spec ID=FIELD(Specification No.),Version Code=FIELD(Version Code);
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctons")
            {
                Caption = 'F&unctons';
                Image = "Action";
                action("Copy Specification Header")
                {
                    Caption = 'Copy Specification Header';
                    Image = CopyDocument;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        IF NOT CONFIRM(Text000,FALSE) THEN
                          EXIT;

                        SpecHeader.GET("Specification No.");
                        SpecCopy.CopySpec("Specification No.",'',SpecHeader,"Version Code");
                    end;
                }
                action("Copy Specification Version")
                {
                    Caption = 'Copy Specification Version';
                    Image = CopyRouteVersion;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        SpecCopy.CopyFromVersion(Rec);
                    end;
                }
                action(Indent)
                {
                    Caption = 'Indent';
                    Image = Indent;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        SpecIndent.IndentSpecVersion(Rec);
                    end;
                }
            }
        }
    }

    var
        SpecIndent : Codeunit "Spec Line-Indent";
        Text000 : Label 'Copy from Specification?';
        SpecHeader : Record "Specification Header";
        SpecCopy : Codeunit "Specification-Copy";
}

