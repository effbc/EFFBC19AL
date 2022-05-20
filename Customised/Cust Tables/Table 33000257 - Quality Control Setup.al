table 33000257 "Quality Control Setup"
{
    // version QC1.1,WIP1.1,Cal1.0


    fields
    {
        field(1;"Primary Key";Code[20])
        {
        }
        field(2;"Specification Nos.";Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(3;"Inspection Datasheet Nos.";Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(4;"Posted Inspect. Datasheet Nos.";Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(5;"Inspection Receipt Nos.";Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(6;"Sampling Plan Warning";Boolean)
        {
        }
        field(7;"Invoice After Inspection Only";Boolean)
        {
        }
        field(8;"Sampling Rounding";Option)
        {
            OptionMembers = Nearest,Up,Down;
        }
        field(9;"Production Batch No.";Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(10;"Sub Assembly Nos.";Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(11;"Rating Per Accepted Qty.";Decimal)
        {
        }
        field(12;"Rating Per Accepted UD Qty.";Decimal)
        {
        }
        field(13;"Rating Per Rework Qty.";Decimal)
        {
        }
        field(14;"Rating Per Rejected Qty.";Decimal)
        {
        }
        field(15;"Quality Before Receipt";Boolean)
        {
        }
        field(16;"Purchase Consignment No.";Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(17;"Assay Nos.";Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(25;"Posted IDS. No. Is IDS No.";Boolean)
        {
        }
        field(26;"Equipment No.";Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(27;"Calibration Procedure No.";Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(60001;"Rejected IR No.";Code[20])
        {
        }
    }

    keys
    {
        key(Key1;"Primary Key")
        {
        }
    }

    fieldgroups
    {
    }
}

