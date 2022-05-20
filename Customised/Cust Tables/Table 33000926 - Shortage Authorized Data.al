table 33000926 "Shortage Authorized Data"
{
    Description = 'Details of authorized  items in shortage process';

    fields
    {
        field(1;"Item No";Code[20])
        {
            TableRelation = Item;
        }
        field(2;"Planned Date";Date)
        {
        }
        field(3;Shortage;Decimal)
        {
        }
        field(4;"Planned Purchase Date";Date)
        {
        }
        field(5;"Suitable Vendor";Code[20])
        {
            TableRelation = "Item Vendor"."Vendor No." WHERE ("Item No."=FIELD("Item No"),
                                                              "Total Qty. Supplied"=FILTER(>0));
        }
        field(6;"Unit Cost";Decimal)
        {
        }
        field(7;"Production Orders";Code[20])
        {
            TableRelation = "Production Order"."No." WHERE (Status=CONST(Released),
                                                            "Prod Start date"=FIELD("Planned Date"));
        }
        field(8;Description;Text[100])
        {
        }
        field(9;"Planned Purchase Dare (WOB)";Date)
        {
        }
        field(10;Authorisation;Option)
        {
            OptionMembers = Open,WAP,CBP,WFA,Authorised,indent;
        }
        field(11;"Minimum Order. Qty";Decimal)
        {
        }
        field(12;"Unit Of Measure";Code[10])
        {
        }
        field(13;"Vendor Name";Text[50])
        {
        }
        field(14;"Indent No.";Code[20])
        {
        }
        field(15;"Production Order No.";Code[20])
        {
        }
        field(16;"Sales Order No.";Code[30])
        {
        }
        field(17;"Customer Name";Text[50])
        {
        }
        field(18;"Product Type";Code[20])
        {
        }
        field(19;Product;Code[30])
        {
        }
        field(20;"Direct Unit Cost";Decimal)
        {
        }
        field(21;"Material Required Date";Date)
        {
        }
        field(22;"Possible Procured Date";Date)
        {
        }
        field(23;"Possible Production Plan Date";Date)
        {
        }
        field(24;"Material Required Day";Integer)
        {
        }
        field(25;"Lead Time";DateFormula)
        {
            CalcFormula = Lookup(Item."Safety Lead Time" WHERE ("No."=FIELD("Item No")));
            FieldClass = FlowField;
        }
        field(26;"Accepted By Purchase";Boolean)
        {
        }
        field(27;"Within Buffer";Boolean)
        {
        }
        field(28;"Alternated Item";Code[20])
        {
            TableRelation = Item;
        }
        field(29;"Lead Time2";Text[30])
        {
        }
        field(30;Total;Decimal)
        {
        }
        field(31;"Vitual Purchase Date";Date)
        {
        }
        field(32;"Virtual Vendor";Code[10])
        {
            TableRelation = Vendor;
        }
        field(33;"Virtual Value";Decimal)
        {
        }
        field(34;"Virtual Payment Date";Date)
        {
        }
        field(35;"Virtual Vendor Name";Text[50])
        {
        }
        field(36;"Prod. Order Line No.";Integer)
        {
        }
        field(37;"Prod. Order Comp Line No.";Integer)
        {
        }
        field(38;"Creation Date";Date)
        {
        }
        field(39;Item_MOQ;Decimal)
        {
        }
        field(40;Item_Eff_MOQ;Decimal)
        {
            DecimalPlaces = 0:5;
        }
    }

    keys
    {
        key(Key1;"Item No","Planned Purchase Date","Production Order No.","Sales Order No.","Creation Date")
        {
        }
        key(Key2;"Item No","Planned Date")
        {
        }
        key(Key3;"Sales Order No.","Item No")
        {
        }
        key(Key4;"Planned Purchase Date")
        {
        }
    }

    fieldgroups
    {
    }
}

