table 33000931 "Product Configurations Master"
{
    // version EFF ver

    LookupPageID = "Product Configuration Mater";
    Permissions = TableData "Production BOM Header"=rimd;

    fields
    {
        field(1;Sno;Integer)
        {
            AutoIncrement = true;
            Editable = false;
            Enabled = true;
        }
        field(2;Product;Code[20])
        {
        }
        field(3;Configuration;Code[50])
        {
        }
    }

    keys
    {
        key(Key1;Sno)
        {
        }
        key(Key2;Configuration,Product)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;Configuration,Product)
        {
        }
    }
}

