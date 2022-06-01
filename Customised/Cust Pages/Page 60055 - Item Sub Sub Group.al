page 60055 "Item Sub Sub Group"
{
    // version B2B1.0

    Editable = true;
    PageType = List;
    SourceTable = "Item Sub Sub Group";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Code"; Code)
                {
                }
                field(Description; Description)
                {
                }
                field(Module; Module)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit();
    begin
        IF USERID IN ['EFFTRONICS\JHANSI', 'EFFTRONICS\SUNDAR', 'EFFTRONICS\PRANAVI', 'EFFTRONICS\VIJAYA', 'EFFTRONICS\RAMALAKSHMI'] THEN
            CurrPage.EDITABLE := TRUE
        ELSE
            CurrPage.EDITABLE := FALSE;
    end;

    var
        FormEditable: Boolean;
}

