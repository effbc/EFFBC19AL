table 33000932 "Vendor Wise Available Makes"
{

    fields
    {
        field(1;"Vendor Number";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
            ValidateTableRelation = false;

            trigger OnValidate();
            begin
                if Vendor.Get("Vendor Number") then
                  begin
                    "Vendor Name" := Vendor.Name;
                    "Vendor Type" := Vendor."Vendor Type";
                  end
            end;
        }
        field(2;"Vendor Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Make;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Make.Make WHERE (Blocked=CONST(false));
        }
        field(4;"Vendor Type";Option)
        {
            CaptionML = ENU='Vendor Type',
                        ENN='Vendor Type';
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU=' ,Manufacturer,First Stage Dealer,Second Stage Dealer,Importer,Trader,Authorized distributor,Online Supplier,Survice Provider',
                              ENN=' ,Manufacturer,First Stage Dealer,Second Stage Dealer,Importer,Trader,Authorized distributor';
            OptionMembers = " ",Manufacturer,"First Stage Dealer","Second Stage Dealer",Importer,Trader,"Authorized distributor","Online Supplier","Survice Provider";
        }
        field(5;"Last Updated Time";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Product Group Code";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Product Group".Code WHERE ("Item Category Code"=CONST('MECH'));
        }
    }

    keys
    {
        key(Key1;"Vendor Number",Make,"Product Group Code")
        {
        }
        key(Key2;"Vendor Number","Product Group Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        "Last Updated Time" := CurrentDateTime;
    end;

    trigger OnModify();
    begin
        "Last Updated Time" := CurrentDateTime;
    end;

    var
        Vendor : Record Vendor;
}

