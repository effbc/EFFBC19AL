page 60237 "Safety Stock"
{
    Editable = true;
    PageType = List;
    SourceTable = "Safety stock";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Product;Product)
                {
                    Editable = PageEditable;
                }
                field(Description;Description)
                {
                    Editable = PageEditable;
                }
                field("Product type";"Product type")
                {
                    Editable = PageEditable;
                }
                field(Quantity;Quantity)
                {
                    Editable = PageEditable;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Calc Safety Stock")
            {

                trigger OnAction();
                begin
                    SS."Calc Safety Stock";
                end;
            }
        }
    }

    trigger OnDeleteRecord() : Boolean;
    begin
        IF NOT (USERID IN ['EFFTRONICS\PRANAVI','EFFTRONICS\ANILKUMAR','EFFTRONICS\GRAVI']) THEN
          ERROR('You Do not have Rights!');
    end;

    trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    begin
        IF NOT (USERID IN ['EFFTRONICS\PRANAVI','EFFTRONICS\ANILKUMAR','EFFTRONICS\GRAVI']) THEN
          ERROR('You Do not have Rights!');
    end;

    trigger OnModifyRecord() : Boolean;
    begin
        IF NOT (USERID IN ['EFFTRONICS\PRANAVI','EFFTRONICS\ANILKUMAR','EFFTRONICS\GRAVI']) THEN
          ERROR('You Do not have Rights!');
    end;

    trigger OnOpenPage();
    begin
        PageEditable := FALSE;
        IF USERID IN ['EFFTRONICS\PRANAVI','EFFTRONICS\ANILKUMAR','EFFTRONICS\GRAVI'] THEN
          PageEditable := TRUE
        ELSE
         PageEditable := FALSE;
    end;

    var
        SS : Record "Safety stock";
        PageEditable : Boolean;
}

