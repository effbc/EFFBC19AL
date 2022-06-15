page 60266 "Quote LookUp Types"
{
    // version B2BQTO

    Caption = 'Quote LookUp Types';
    DelayedInsert = true;
    PageType = List;
    SourceTable = "Quote LookUp Type";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ID; ID)
                {
                }
                field(Name; Name)
                {
                }
                field(Description; Description)
                {
                }
            }
        }
    }

    actions
    {
    }
}

