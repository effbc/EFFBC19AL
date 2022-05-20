table 150023 Transaction
{
    // version DEBUGW13.10.01,Rev01

    LookupPageID = 150025;

    fields
    {
        field(1;"No.";Integer)
        {
        }
        field(2;Description;Text[80])
        {
        }
        field(3;"Login Date";Date)
        {
        }
        field(4;"Login Time";Time)
        {
        }
        field(5;"Connection ID";Integer)
        {
        }
        field(6;Date;Date)
        {
        }
        field(7;Time;Time)
        {
        }
        field(8;"User ID";Code[50])
        {
            Description = 'Rev01';
            TableRelation = User;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(9;"Locking Rule Violations";Boolean)
        {
            CalcFormula = Exist("Locking Rule Violation" WHERE ("Login Date"=FIELD("Login Date"),
                                                                "Login Time"=FIELD("Login Time"),
                                                                "Connection ID"=FIELD("Connection ID"),
                                                                "Transaction No."=FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(35;"Source Object";Text[50])
        {
        }
        field(36;"Source Function/Trigger";Text[132])
        {
        }
        field(37;"Source Text";Text[132])
        {
        }
        field(38;"Source Line No.";Integer)
        {
        }
    }

    keys
    {
        key(Key1;"Login Date","Login Time","Connection ID","No.")
        {
        }
        key(Key2;Date,Time)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        TransactionLock.SetRange("Login Date","Login Date");
        TransactionLock.SetRange("Login Time","Login Time");
        TransactionLock.SetRange("Connection ID","Connection ID");
        TransactionLock.SetRange("Transaction No.","No.");
        TransactionLock.DeleteAll;
    end;

    var
        TransactionLock : Record "Transaction Lock";
}

