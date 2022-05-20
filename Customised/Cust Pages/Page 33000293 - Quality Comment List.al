page 33000293 "Quality Comment List"
{
    // version QC1.0

    AutoSplitKey = true;
    Caption = 'Comment List';
    DelayedInsert = true;
    Editable = false;
    PageType = List;
    SourceTable = "Quality Comment Line";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Type;Type)
                {
                }
                field("No.";"No.")
                {
                }
                field(Date;Date)
                {
                }
                field(Comment;Comment)
                {
                }
            }
        }
    }

    actions
    {
    }
}

