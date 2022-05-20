page 60161 "Cal Proc Header List"
{
    // version Cal1.0

    Caption = 'Cal Proc Header List';
    CardPageID = "Calibration Procedure";
    Editable = false;
    PageType = List;
    SourceTable = "Calibration Procedure Header";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("No.";"No.")
                {
                }
                field(Description;Description)
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        CalProcSetup : Record "Calibration Setup";
}

