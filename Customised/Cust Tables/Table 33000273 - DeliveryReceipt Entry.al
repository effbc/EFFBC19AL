table 33000273 "Delivery/Receipt Entry"
{
    // version QC1.0

    Caption = 'Delivery Chanlan';
    DrillDownPageID = "Delivery/Receipt Entries";
    LookupPageID = "Delivery/Receipt Entries";

    fields
    {
        field(1;"Entry No.";Integer)
        {
            Caption = 'Entry No.';
        }
        field(2;"Item No.";Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(3;"Posting Date";Date)
        {
            Caption = 'Posting Date';
        }
        field(5;"Source No.";Code[20])
        {
            Caption = 'Source No.';
            Description = 'Purchase Receipt numberr or Production Order number';
        }
        field(6;"Order Line No.";Integer)
        {
        }
        field(7;"Document No.";Code[20])
        {
            Caption = 'Document No.';
            Description = 'Inspection Receipt number';
        }
        field(8;Description;Text[50])
        {
            Caption = 'Description';
        }
        field(9;"Location Code";Code[20])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(10;Quantity;Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0:5;
        }
        field(11;"Remaining Quantity";Decimal)
        {
            Caption = 'Remaining Quantity';
            DecimalPlaces = 0:5;
        }
        field(12;"Applies-to Entry";Integer)
        {
            Caption = 'Applies-to Entry';
        }
        field(13;Open;Boolean)
        {
            Caption = 'Open';
            InitValue = true;
        }
        field(14;Positive;Boolean)
        {
            Caption = 'Positive';
        }
        field(15;"Source Type";Option)
        {
            Caption = 'Source Type';
            OptionCaption = 'In bound,WIP';
            OptionMembers = "In bound",WIP;
        }
        field(16;"Lot No.";Code[20])
        {
        }
        field(17;"Applies-To- Entry";Integer)
        {
            TableRelation = "Quality Ledger Entry";
        }
        field(20;"Item Ledger Entry No.";Integer)
        {
            TableRelation = "Item Ledger Entry";
        }
        field(21;"Serial No.";Code[20])
        {
            Caption = 'Serial No.';
        }
        field(22;"Item ledger Lot No.";Code[20])
        {
            Caption = 'Lot No.';
        }
        field(23;"Warranty Date";Date)
        {
            Caption = 'Warranty Date';
        }
        field(24;"Expiration Date";Date)
        {
            Caption = 'Expiration Date';
        }
        field(25;"Rework Level";Integer)
        {
        }
        field(26;"New Location Code";Code[20])
        {
            TableRelation = Location;
        }
        field(27;"Vendor No.";Code[20])
        {
            TableRelation = Vendor;
        }
        field(28;"Order No.";Code[20])
        {
        }
        field(29;"In bound Item Ledger Entry No.";Integer)
        {
            TableRelation = "Item Ledger Entry";
        }
        field(30;"Sub Assembly Code";Code[20])
        {
            TableRelation = "Sub Assembly";
        }
        field(40;"Document Type";Option)
        {
            OptionMembers = "Out bound","In Bound";
        }
        field(41;"Out Bound Entry";Integer)
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

