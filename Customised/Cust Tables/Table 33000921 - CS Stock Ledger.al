table 33000921 "CS Stock Ledger"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
        }
        field(2;"Posted By";Code[50])
        {
        }
        field(3;"Posting Date";Date)
        {
        }
        field(4;Received;Boolean)
        {
        }
        field(5;"Transaction ID";Code[20])
        {
        }
        field(6;"Transaction Type";Option)
        {
            OptionCaption = ',Change Status,Card Transfer,Custmer card Transfer,Open';
            OptionMembers = ,"Change Status","Card Transfer","Custmer card Transfer",Open;
        }
        field(7;Location;Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No."=CONST(2),
                                                          Blocked=FILTER(false));
        }
        field(8;"User ID";Code[50])
        {
        }
        field(9;Remarks;Code[100])
        {
        }
        field(10;"Mode of Transport";Option)
        {
            OptionMembers = " ",Courier,Train,Bus,"By Hand",VRL,Lorry,ANL;
        }
        field(11;"Courier Details";Code[100])
        {
        }
        field(12;"Line No.";Integer)
        {
        }
        field(13;"Item No";Code[20])
        {
            TableRelation = Item."No.";
        }
        field(14;Quantity;Decimal)
        {
        }
        field(15;Reason;Code[20])
        {
        }
        field(16;"Card Status";Option)
        {
            OptionMembers = ,Working,"Non Working";
        }
        field(17;Station;Code[20])
        {
        }
        field(18;"Received By";Code[50])
        {
        }
        field(19;"Received Date";Date)
        {
        }
        field(20;NonReturnable;Boolean)
        {
        }
        field(22;"DC No";Code[20])
        {
        }
        field(23;"Customer No";Code[20])
        {
            Description = 'for led cards process';
        }
        field(24;"Responsible Persion";Code[30])
        {
            Description = 'For LED Cards';
        }
        field(25;Stock_Adjusted;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
        }
    }

    fieldgroups
    {
    }
}

