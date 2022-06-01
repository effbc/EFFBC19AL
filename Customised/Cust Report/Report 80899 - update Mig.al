report 80899 "update Mig"
{
    DefaultLayout = RDLC;
    RDLCLayout = './update Mig.rdlc';

    dataset
    {
        dataitem("Config. Package Record"; "Config. Package Record")
        {
            dataitem("Config. Package Data"; "Config. Package Data")
            {
                DataItemLink = Package Code=FIELD(Package Code),Table ID=FIELD(Table ID    DataClassification = CustomerContent;
);

                trigger OnAfterGetRecord();
                begin
                    WITH TempServLine DO BEGIN
                      CASE "Config. Package Data"."Field ID" OF
                      1 : "Document No." := "Config. Package Data".Value;
                      2 : EVALUATE("Line No.","Config. Package Data".Value);
                      3 : EVALUATE("Service Item Line No.","Config. Package Data".Value);
                      4 :"Service Item No." := "Config. Package Data".Value;
                      5: "Service Item Serial No." := "Config. Package Data".Value;
                      6 : "Service Item Description" := "Config. Package Data".Value;
                      7 : EVALUATE("Posting Date","Config. Package Data".Value);
                      8 : EVALUATE("Order Date","Config. Package Data".Value);
                      9 : EVALUATE(Type,"Config. Package Data".Value);
                      10 : "No." := "Config. Package Data".Value;
                      11 : "Unit of Measure" := "Config. Package Data".Value;
                      12 : EVALUATE("Qty. per Unit of Measure","Config. Package Data".Value);
                      13 : "Variant Code" := "Config. Package Data".Value;
                      14 : "Bin Code" := "Config. Package Data".Value;
                      15: "Customer No." := "Config. Package Data".Value;
                      16 : "Ship-to Code" := "Config. Package Data".Value;
                      17 : "Bill-to Customer No." := "Config. Package Data".Value;
                      18 : Description:= "Config. Package Data".Value;
                      19 : "Description 2" := "Config. Package Data".Value;
                      20 :"Unit of Measure Code" := "Config. Package Data".Value;
                      23 : "Posting Group" := "Config. Package Data".Value;
                      26 : EVALUATE(Posted,"Config. Package Data".Value);
                      33 : EVALUATE("Exclude Warranty","Config. Package Data".Value);
                      34 : EVALUATE(Warranty,"Config. Package Data".Value);
                      35 : "Job No." := "Config. Package Data".Value;
                      36 : "Contract No." := "Config. Package Data".Value;
                      38 : EVALUATE("Contract Disc. %","Config. Package Data".Value);
                      39 : EVALUATE("Warranty Disc. %","Config. Package Data".Value);
                      43 : EVALUATE("Line Discount %","Config. Package Data".Value);
                      44 : EVALUATE("Line Discount Amount","Config. Package Data".Value);
                      45 : EVALUATE("VAT Calculation Type","Config. Package Data".Value);
                      46 : "VAT Bus. Posting Group" := "Config. Package Data".Value;
                      47 : "VAT Prod. Posting Group" := "Config. Package Data".Value;
                      48 : EVALUATE("VAT Base Amount","Config. Package Data".Value);
                      49 : EVALUATE("VAT %","Config. Package Data".Value);
                      50 : EVALUATE("Amount Including VAT","Config. Package Data".Value);
                      51 : "Tax Area Code" := "Config. Package Data".Value;
                      52 : EVALUATE("Tax Liable","Config. Package Data".Value);
                      53 : "Tax Group Code" := "Config. Package Data".Value;
                      54 : "Serv. Price Adjmt. Gr. Code" := "Config. Package Data".Value;
                      55 : "Customer Price Group" := "Config. Package Data".Value;
                      56 : EVALUATE(Quantity,"Config. Package Data".Value);
                      57 : EVALUATE("Qty. to Invoice","Config. Package Data".Value);
                      58 : EVALUATE("Unit Price","Config. Package Data".Value);
                      59 : EVALUATE("Unit Cost","Config. Package Data".Value);
                      60 : EVALUATE("Unit Cost (LCY)","Config. Package Data".Value);
                      61 : EVALUATE("Cost Amount","Config. Package Data".Value);
                      62 : EVALUATE("Total Amount","Config. Package Data".Value);
                      63 : EVALUATE(Amount,"Config. Package Data".Value);
                      65 : EVALUATE("Component Line No.","Config. Package Data".Value);
                      66 : EVALUATE("Spare Part Action","Config. Package Data".Value);
                      67 :"Fault Reason Code" := "Config. Package Data".Value;
                      68 : "Replaced Item No." := "Config. Package Data".Value;
                      69 : EVALUATE("Exclude Contract Discount","Config. Package Data".Value);
                      71 : EVALUATE("Document Type","Config. Package Data".Value);
                      73 : "Work Type Code" := "Config. Package Data".Value;
                      74 : "Gen. Bus. Posting Group" := "Config. Package Data".Value;
                      75 : "Gen. Prod. Posting Group" := "Config. Package Data".Value;
                      76 : EVALUATE(Chargeable,"Config. Package Data".Value);
                      78 : "Responsibility Center" := "Config. Package Data".Value;
                      79 : "Location Code" := "Config. Package Data".Value;
                      81 : EVALUATE("Attached to Line No.","Config. Package Data".Value);
                      82 : "Item Category Code" := "Config. Package Data".Value;
                      83 : EVALUATE(Nonstock,"Config. Package Data".Value);
                      84 : "Product Group Code" := "Config. Package Data".Value;
                      85 : EVALUATE("Quantity (Base)","Config. Package Data".Value);
                      86 : EVALUATE("Qty. to Invoice (Base)","Config. Package Data".Value);
                      87 : EVALUATE("Expected Receipt Date","Config. Package Data".Value);
                      88 : EVALUATE("Outstanding Qty. (Base)","Config. Package Data".Value);
                      89 : EVALUATE("Reserved Qty. (Base)","Config. Package Data".Value);
                      90 : EVALUATE("Reserved Quantity","Config. Package Data".Value);
                      91 : EVALUATE(Reserve,"Config. Package Data".Value);
                      92 : EVALUATE("Apply to Service Entry","Config. Package Data".Value);
                      93 : EVALUATE("Substitution Available","Config. Package Data".Value);
                      94 : EVALUATE("Price Adjmt. Status","Config. Package Data".Value);
                      97 : EVALUATE("Line Discount Type","Config. Package Data".Value);
                      7001 : EVALUATE("Allow Line Disc.","Config. Package Data".Value);
                      7002 : "Customer Disc. Group" := "Config. Package Data".Value;
                      60003 : "Resolution Description" := "Config. Package Data".Value;
                      60004 : "Fault Code Description" := "Config. Package Data".Value;
                      60005 : "Fault Area Description" := "Config. Package Data".Value;
                      60006 : "Symptom Description" := "Config. Package Data".Value;
                      60009 : "To Location" := "Config. Package Data".Value;
                      60011 : "From Location" := "Config. Package Data".Value;
                      60012 : EVALUATE(Account,"Config. Package Data".Value);
                      60013 : EVALUATE("WK.ST.Date","Config. Package Data".Value);
                      60014 : EVALUATE("WK.FH.Date","Config. Package Data".Value);
                      60015 : EVALUATE(Levels,"Config. Package Data".Value);
                      60016 : Status  := "Config. Package Data".Value;
                      60017 : "Sub Service Item No." := "Config. Package Data".Value;
                      60018 : "Service item Lot No" := "Config. Package Data".Value;
                      60019 : Zone := "Config. Package Data".Value;
                      60020 : Division := "Config. Package Data".Value;
                      60021 : EVALUATE(Station,"Config. Package Data".Value);
                      60022 : EVALUATE("Sent date time","Config. Package Data".Value);
                      60023 : EVALUATE(Unitcost,"Config. Package Data".Value);
                      60024 : "Sub Service item serial No." := "Config. Package Data".Value;
                      END;
                    END;
                end;

                trigger OnPostDataItem();
                begin
                    TempServLine.INSERT;
                end;

                trigger OnPreDataItem();
                begin
                    TempServLine.INIT;
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        TempServLine : Record "Temp Service Line";
}

