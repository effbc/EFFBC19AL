table 33000274 "Sub Assembly"
{
    // version WIP1.0

    LookupPageID = "Sub Assembly List";

    fields
    {
        field(1;"No.";Code[20])
        {
        }
        field(2;Description;Text[30])
        {

            trigger OnValidate();
            begin
                "Search Name" := Description;
            end;
        }
        field(3;"Search Name";Code[20])
        {
        }
        field(4;"Spec Id";Code[20])
        {
            TableRelation = "Specification Header";
        }
        field(5;"QC Enabled";Boolean)
        {
        }
        field(6;"Unit Of Measure Code";Code[20])
        {
            TableRelation = "Sub Assembly Unit of Measure".Code WHERE ("Sub Assembly No."=FIELD("No."));
        }
        field(7;Inventory;Decimal)
        {
        }
        field(8;"Qty. On Inspection";Decimal)
        {
        }
        field(9;"Qty. On Rejection";Decimal)
        {
        }
        field(10;"Qty. On Rework";Decimal)
        {
        }
        field(11;Block;Boolean)
        {
        }
        field(12;"No. Series";Code[20])
        {
            TableRelation = "No. Series".Code;
        }
    }

    keys
    {
        key(Key1;"No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        QualitySetup.Get;
        QualitySetup.TestField("Sub Assembly Nos.");
        if "No." = '' then begin
          NoSeriesMgt.InitSeries(QualitySetup."Sub Assembly Nos.",xRec."No. Series",0D,"No.","No. Series");
        end;
    end;

    var
        NoSeriesMgt : Codeunit NoSeriesManagement;
        QualitySetup : Record "Quality Control Setup";
        SubAssembly : Record "Sub Assembly";

    [LineStart(7923)]
    procedure AssistEdit() : Boolean;
    begin
        QualitySetup.Get;
        QualitySetup.TestField("Sub Assembly Nos.");
        if NoSeriesMgt.SelectSeries(QualitySetup."Sub Assembly Nos.",xRec."No. Series","No. Series") then begin
          NoSeriesMgt.SetSeries("No.");
          exit(true);
        end;
    end;
}

