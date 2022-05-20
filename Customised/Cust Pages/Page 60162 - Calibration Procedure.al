page 60162 "Calibration Procedure"
{
    // version Cal1.0,Rev01

    Caption = 'Calibration Procedure';
    PageType = Document;
    SourceTable = "Calibration Procedure Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No.";"No.")
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
            }
            part(Control7;"Cal Proc Subform")
            {
                SubPageLink = No.=FIELD(No.);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("C&al Procedure")
            {
                Caption = 'C&al Procedure';
                action(List)
                {
                    Caption = 'List';
                    Image = EditList;
                    RunObject = Page "Cal Proc Header List";
                    RunPageLink = No.=FIELD(No.);
                    ShortCutKey = 'F5';
                }
            }
        }
    }

    trigger OnOpenPage();
    begin
        IF CaptionCode <> '' THEN BEGIN
          CurrPage.CAPTION := CaptionCode +' '+CaptionDescription +' - '+ CurrPage.CAPTION;
        END;
    end;

    var
        CalProcSetup : Record "Calibration Setup";
        CaptionCode : Code[20];
        CaptionDescription : Text[30];

    [LineStart(13498)]
    procedure SetCaption(CaptionCode2 : Code[20];CaptionDescription2 : Text[30]);
    begin
        CaptionCode := CaptionCode2;
        CaptionDescription := CaptionDescription2;
    end;
}

