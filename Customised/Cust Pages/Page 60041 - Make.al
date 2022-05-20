page 60041 Make
{
    // version B2B1.0

    Editable = true;
    PageType = List;
    SourceTable = Make;

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field(Make;Make)
                {
                }
                field("Created By";"Created By")
                {
                }
                field("Entry Date Time";"Entry Date Time")
                {
                }
                field(Blocked;Blocked)
                {
                }
                field("Vendors Link";"Vendors Link")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage();
    begin
         IF UPPERCASE(USERID) IN ['EFFTRONICS\BRAHMAIAH','EFFTRONICS\PARDHU','EFFTRONICS\ANILKUMAR','EFFTRONICS\RENUKACH','EFFTRONICS\CHOWDARY',
                              'EFFTRONICS\SUPRIYA','EFFTRONICS\AVINASH','EFFTRONICS\KAMESWARI'] THEN
           CurrPage.EDITABLE:=TRUE
         ELSE
           CurrPage.EDITABLE:=FALSE;
    end;
}

