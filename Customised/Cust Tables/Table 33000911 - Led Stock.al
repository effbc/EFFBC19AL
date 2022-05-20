table 33000911 "Led Stock"
{

    fields
    {
        field(1;"Item No";Code[20])
        {
            TableRelation = Item."No." WHERE ("Product Group Code"=FILTER('FPRODUCT'),
                                              "Item Sub Group Code"=FILTER('LED LIGHT'),
                                              Blocked=FILTER(false));

            trigger OnValidate();
            begin
                item.Reset;
                item.SetFilter(item."No.","Item No");
                if item.FindFirst then
                begin
                  Desc:=item.Description;
                end
            end;
        }
        field(2;Desc;Text[30])
        {
        }
        field(3;"Stock at Prod";Decimal)
        {
        }
        field(4;"Stock at LMD";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Item No")
        {
        }
    }

    fieldgroups
    {
    }

    var
        item : Record Item;
}

