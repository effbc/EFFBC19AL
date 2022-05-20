page 60160 "Calibration Setup"
{
    // version Cal1.0,Rev01

    PageType = Worksheet;
    SourceTable = "Calibration Setup";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Equipment No.";"Equipment No.")
                {
                    Editable = false;
                }
                field("Procedure No.";"Procedure No.")
                {
                }
                field("Procedure Description";"Procedure Description")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("C&alProc")
            {
                Caption = 'C&alProc';
                Visible = false;
                action(Card)
                {
                    Caption = 'Card';
                    Image = Card;
                    ShortCutKey = 'Shift+F5';

                    trigger OnAction();
                    begin
                        CLEAR(CalPro);
                        IF CalProHeader.GET(CalProHeader."No.") THEN BEGIN
                          IF "Procedure No." <> '' THEN BEGIN
                            CalPro.SETRECORD(CalProHeader);
                          END;
                        END;
                        CalPro.RUN;
                    end;
                }
            }
        }
    }

    var
        CalProHeader : Record "Calibration Procedure Header";
        CalPro : Page "Calibration Procedure";
}

