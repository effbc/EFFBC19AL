tableextension 70018 GenJournalLineExt extends "Gen. Journal Line"
{


    fields
    {


        modify("Posting Date")
        {
            ClosingDates = true;
        }

        modify("Document Date")
        {
            ClosingDates = true;
        }




        field(13701; "Source Curr. Excise Amount"; Decimal)
        {
            CaptionML = ENU = 'Source Curr. Excise Amount',
                        ENN = 'Source Curr. Excise Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13702; "Source Curr. Tax Amount"; Decimal)
        {
            CaptionML = ENU = 'Source Curr. Tax Amount',
                        ENN = 'Source Curr. Tax Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13703; "State Code"; Code[10])
        {
            CaptionML = ENU = 'State Code',
                        ENN = 'State Code';
            DataClassification = ToBeClassified;
        }
        field(13706; "Excise Bus. Posting Group"; Code[10])
        {
            CaptionML = ENU = 'Excise Bus. Posting Group',
                        ENN = 'Excise Bus. Posting Group';
            DataClassification = ToBeClassified;
        }
        field(13707; "Excise Prod. Posting Group"; Code[10])
        {
            CaptionML = ENU = 'Excise Prod. Posting Group',
                        ENN = 'Excise Prod. Posting Group';
            DataClassification = ToBeClassified;
        }
        field(13708; "Excise Amount"; Decimal)
        {
            CaptionML = ENU = 'Excise Amount',
                        ENN = 'Excise Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13709; "BED %"; Decimal)
        {
            CaptionML = ENU = 'BED %',
                        ENN = 'BED %';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13710; "BED Calculation Type"; Option)
        {
            CaptionML = ENU = 'BED Calculation Type',
                        ENN = 'BED Calculation Type';
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = 'Excise %,Amount/Unit,% of Accessable Value,Excise %+Amount/Unit,% of MRP',
                              ENN = 'Excise %,Amount/Unit,% of Accessable Value,Excise %+Amount/Unit,% of MRP';
            OptionMembers = "Excise %","Amount/Unit","% of Accessable Value","Excise %+Amount/Unit","% of MRP";
        }
        field(13711; "Amount Including Excise"; Decimal)
        {
            CaptionML = ENU = 'Amount Including Excise',
                        ENN = 'Amount Including Excise';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13712; "Excise Base Amount"; Decimal)
        {
            CaptionML = ENU = 'Excise Base Amount',
                        ENN = 'Excise Base Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13716; "TDS/TCS Amount"; Decimal)
        {
            CaptionML = ENU = 'TDS/TCS Amount',
                        ENN = 'TDS/TCS Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13717; "Service Tax"; Decimal)
        {
            CaptionML = ENU = 'Service Tax',
                        ENN = 'Service Tax';
            DataClassification = ToBeClassified;
        }
        field(13718; "Tax Amount"; Decimal)
        {
            CaptionML = ENU = 'Tax Amount',
                        ENN = 'Tax Amount';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 4;
        }
        field(13736; PLA; Boolean)
        {
            CaptionML = ENU = 'PLA',
                        ENN = 'PLA';
            DataClassification = ToBeClassified;
        }
        field(13737; "Tax %"; Decimal)
        {
            CaptionML = ENU = 'Tax %',
                        ENN = 'Tax %';
            DataClassification = ToBeClassified;
        }
        field(13744; "Tax Base Amount"; Decimal)
        {
            CaptionML = ENU = 'Tax Base Amount',
                        ENN = 'Tax Base Amount';
            DataClassification = ToBeClassified;
        }
        field(13746; Cenvat; Boolean)
        {
            CaptionML = ENU = 'Cenvat',
                        ENN = 'Cenvat';
            DataClassification = ToBeClassified;
        }
        field(13747; "Location Code"; Code[10])
        {
            CaptionML = ENU = 'Location Code',
                        ENN = 'Location Code';
            DataClassification = ToBeClassified;
            TableRelation = Location;

            trigger OnValidate();
            var
                GenJournalBatch: Record "Gen. Journal Batch";
                GSTComponent: Record "GST Component";
                Location2: Record Location;
                LocationARNNo: Code[15];
            begin
            end;
        }
        field(13750; "Source Curr. Tax Base Amount"; Decimal)
        {
            CaptionML = ENU = 'Source Curr. Tax Base Amount',
                        ENN = 'Source Curr. Tax Base Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13753; "Tax Amount (LCY)"; Decimal)
        {
            CaptionML = ENU = 'Tax Amount (LCY)',
                        ENN = 'Tax Amount (LCY)';
            DataClassification = ToBeClassified;
        }
        field(13754; "Tax Base Amount (LCY)"; Decimal)
        {
            CaptionML = ENU = 'Tax Base Amount (LCY)',
                        ENN = 'Tax Base Amount (LCY)';
            DataClassification = ToBeClassified;
        }
        field(13758; "TDS Nature of Deduction"; Code[10])
        {
            CaptionML = ENU = 'TDS Nature of Deduction',
                        ENN = 'TDS Nature of Deduction';
            DataClassification = ToBeClassified;
            TableRelation = "TDS Nature of Deduction";

            trigger OnValidate();
            var
                CompanyInfo: Record "Company Information";
                Location: Record Location;
            begin
            end;
        }
        field(13759; "Assessee Code"; Code[10])
        {
            CaptionML = ENU = 'Assessee Code',
                        ENN = 'Assessee Code';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Assessee Code";
        }
        field(13760; "TDS/TCS %"; Decimal)
        {
            CaptionML = ENU = 'TDS/TCS %',
                        ENN = 'TDS/TCS %';
            DataClassification = ToBeClassified;
            DecimalPlaces = 2 : 3;
            Editable = false;
        }
        field(13761; "TDS/TCS Amt Incl Surcharge"; Decimal)
        {
            CaptionML = ENU = 'TDS/TCS Amt Incl Surcharge',
                        ENN = 'TDS/TCS Amt Incl Surcharge';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13763; "Bal. TDS/TCS Including SHECESS"; Decimal)
        {
            CaptionML = ENU = 'Bal. TDS/TCS Including SHECESS',
                        ENN = 'Bal. TDS/TCS Including SHECESS';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13764; "Party Type"; Option)
        {
            BlankNumbers = DontBlank;
            CaptionML = ENU = 'Party Type',
                        ENN = 'Party Type';
            DataClassification = ToBeClassified;
            InitValue = " ";
            OptionCaptionML = ENU = ' ,Party,Customer,Vendor',
                              ENN = ' ,Party,Customer,Vendor';
            OptionMembers = " ",Party,Customer,Vendor;
        }
        field(13765; "Party Code"; Code[20])
        {
            CaptionML = ENU = 'Party Code',
                        ENN = 'Party Code';
            DataClassification = ToBeClassified;
            TableRelation = IF ("Party Type" = CONST(Party)) Party.Code
            ELSE
            IF ("Party Type" = CONST(Vendor)) Vendor."No."
            ELSE
            IF ("Party Type" = CONST(Customer)) Customer."No.";
        }
        field(13773; "Form Code"; Code[10])
        {
            CaptionML = ENU = 'Form Code',
                        ENN = 'Form Code';
            DataClassification = ToBeClassified;
            TableRelation = "Form Codes";
        }
        field(13774; "Form No."; Code[10])
        {
            CaptionML = ENU = 'Form No.',
                        ENN = 'Form No.';
            DataClassification = ToBeClassified;
            TableRelation = "Tax Forms Details";
        }
        field(13779; "LC No."; Code[20])
        {
            CaptionML = ENU = 'LC No.',
                        ENN = 'LC No.';
            DataClassification = ToBeClassified;
            TableRelation = "LC Detail"."No." WHERE(Closed = CONST(false),
                                                     Released = CONST(true));
        }
        field(13780; "Work Tax Base Amount"; Decimal)
        {
            CaptionML = ENU = 'Work Tax Base Amount',
                        ENN = 'Work Tax Base Amount';
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(13781; "Work Tax %"; Decimal)
        {
            CaptionML = ENU = 'Work Tax %',
                        ENN = 'Work Tax %';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13782; "Work Tax Amount"; Decimal)
        {
            CaptionML = ENU = 'Work Tax Amount',
                        ENN = 'Work Tax Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13786; "TDS Category"; Option)
        {
            CaptionML = ENU = 'TDS Category',
                        ENN = 'TDS Category';
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = ' ,A,C,S,T',
                              ENN = ' ,A,C,S,T';
            OptionMembers = " ",A,C,S,T;
        }
        field(13787; "Surcharge %"; Decimal)
        {
            CaptionML = ENU = 'Surcharge %',
                        ENN = 'Surcharge %';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13788; "Surcharge Amount"; Decimal)
        {
            CaptionML = ENU = 'Surcharge Amount',
                        ENN = 'Surcharge Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13789; "Concessional Code"; Code[10])
        {
            CaptionML = ENU = 'Concessional Code',
                        ENN = 'Concessional Code';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Concessional Codes";
        }
        field(13790; "Work Tax Paid"; Boolean)
        {
            CaptionML = ENU = 'Work Tax Paid',
                        ENN = 'Work Tax Paid';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16301; "Pay TDS"; Boolean)
        {
            CaptionML = ENU = 'Pay TDS',
                        ENN = 'Pay TDS';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16302; "Pay Work Tax"; Boolean)
        {
            CaptionML = ENU = 'Pay Work Tax',
                        ENN = 'Pay Work Tax';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16303; "TDS Entry"; Boolean)
        {
            CaptionML = ENU = 'TDS Entry',
                        ENN = 'TDS Entry';
            DataClassification = ToBeClassified;
        }
        field(16304; "Pay Excise"; Boolean)
        {
            CaptionML = ENU = 'Pay Excise',
                        ENN = 'Pay Excise';
            DataClassification = ToBeClassified;
        }
        field(16307; "TDS/TCS Base Amount"; Decimal)
        {
            CaptionML = ENU = 'TDS/TCS Base Amount',
                        ENN = 'TDS/TCS Base Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16308; "Challan No."; Code[20])
        {
            CaptionML = ENU = 'Challan No.',
                        ENN = 'Challan No.';
            DataClassification = ToBeClassified;
        }
        field(16309; "Challan Date"; Date)
        {
            CaptionML = ENU = 'Challan Date',
                        ENN = 'Challan Date';
            DataClassification = ToBeClassified;
        }
        field(16310; Adjustment; Boolean)
        {
            CaptionML = ENU = 'Adjustment',
                        ENN = 'Adjustment';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16312; "Pay Sales Tax"; Boolean)
        {
            CaptionML = ENU = 'Pay Sales Tax',
                        ENN = 'Pay Sales Tax';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16313; "E.C.C. No."; Code[20])
        {
            CaptionML = ENU = 'E.C.C. No.',
                        ENN = 'E.C.C. No.';
            DataClassification = ToBeClassified;
            TableRelation = "E.C.C. Nos.";
        }
        field(16340; "Balance Work Tax Amount"; Decimal)
        {
            CaptionML = ENU = 'Balance Work Tax Amount',
                        ENN = 'Balance Work Tax Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16350; "Pay VAT"; Boolean)
        {
            CaptionML = ENU = 'Pay VAT',
                        ENN = 'Pay VAT';
            DataClassification = ToBeClassified;
        }
        field(16351; "VAT Claim Amount"; Decimal)
        {
            CaptionML = ENU = 'VAT Claim Amount',
                        ENN = 'VAT Claim Amount';
            DataClassification = ToBeClassified;
        }
        field(16352; "Refund VAT"; Boolean)
        {
            CaptionML = ENU = 'Refund VAT',
                        ENN = 'Refund VAT';
            DataClassification = ToBeClassified;
        }
        field(16353; "Balance Surcharge Amount"; Decimal)
        {
            CaptionML = ENU = 'Balance Surcharge Amount',
                        ENN = 'Balance Surcharge Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16354; "Cheque Date"; Date)
        {
            CaptionML = ENU = 'Cheque Date',
                        ENN = 'Cheque Date';
            DataClassification = ToBeClassified;
        }
        field(16358; "Surcharge Base Amount"; Decimal)
        {
            CaptionML = ENU = 'Surcharge Base Amount',
                        ENN = 'Surcharge Base Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16359; "TDS Group"; Option)
        {
            CaptionML = ENU = 'TDS Group',
                        ENN = 'TDS Group';
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaptionML = ENU = ' ,Contractor,Commission,Professional,Interest,Rent,Dividend,Interest on Securities,Lotteries,Insurance Commission,NSS,Mutual fund,Brokerage,Income from Units,Capital Assets,Horse Races,Sports Association,Payable to Non Residents,Income of Mutual Funds,Units,Foreign Currency Bonds,FII from Securities,Others,Rent for Plant & Machinery,Rent for Land & Building,Banking Services,Compensation On Immovable Property,PF Accumulated,Payment For Immovable Property,Goods',
                              ENN = ' ,Contractor,Commission,Professional,Interest,Rent,Dividend,Interest on Securities,Lotteries,Insurance Commission,NSS,Mutual fund,Brokerage,Income from Units,Capital Assets,Horse Races,Sports Association,Payable to Non Residents,Income of Mutual Funds,Units,Foreign Currency Bonds,FII from Securities,Others,Rent for Plant & Machinery,Rent for Land & Building,Banking Services,Compensation On Immovable Property,PF Accumulated,Payment For Immovable Property,Goods';
            OptionMembers = " ",Contractor,Commission,Professional,Interest,Rent,Dividend,"Interest on Securities",Lotteries,"Insurance Commission",NSS,"Mutual fund",Brokerage,"Income from Units","Capital Assets","Horse Races","Sports Association","Payable to Non Residents","Income of Mutual Funds",Units,"Foreign Currency Bonds","FII from Securities",Others,"Rent for Plant & Machinery","Rent for Land & Building","Banking Services","Compensation On Immovable Property","PF Accumulated","Payment For Immovable Property",Goods;
        }
        field(16360; "Work Tax Nature Of Deduction"; Code[10])
        {
            CaptionML = ENU = 'Work Tax Nature Of Deduction',
                        ENN = 'Work Tax Nature Of Deduction';
            DataClassification = ToBeClassified;
            TableRelation = "TDS Nature of Deduction";

            trigger OnLookup();
            begin
                /*NODLines.RESET;
                CASE "Party Type" OF
                  "Party Type"::Vendor:
                    NODLines.SETRANGE(Type,NODLines.Type::Vendor);
                  "Party Type"::Customer:
                    NODLines.SETRANGE(Type,NODLines.Type::Customer);
                  "Party Type"::Party:
                    NODLines.SETRANGE(Type,NODLines.Type::Party);
                END;
                NODLines.SETRANGE("No.","Party Code");
                NODLines.SETRANGE("TDS Group",NODLines."TDS Group"::Others);
                IF NODLines.FIND('-') THEN
                  REPEAT
                    TDSNOD.RESET;
                    TDSNOD.SETRANGE(Code,NODLines."NOD/NOC");
                    IF TDSNOD.FINDFIRST THEN
                      TDSNOD.MODIFYALL(Mark,TRUE);
                    COMMIT;
                  UNTIL NODLines.NEXT = 0;
                
                TDSNOD.RESET;
                TDSNOD.SETRANGE(Mark,TRUE);
                
                IF PAGE.RUNMODAL(PAGE::"TDS Nature of Deductions",TDSNOD) = ACTION::LookupOK THEN BEGIN
                  NODLines.RESET;
                  CASE "Party Type" OF
                    "Party Type"::Vendor:
                      NODLines.SETRANGE(Type,NODLines.Type::Vendor);
                    "Party Type"::Customer:
                      NODLines.SETRANGE(Type,NODLines.Type::Customer);
                    "Party Type"::Party:
                      NODLines.SETRANGE(Type,NODLines.Type::Party);
                  END;
                
                  NODLines.SETRANGE("No.","Party Code");
                  NODLines.SETRANGE("NOD/NOC",TDSNOD.Code);
                  IF (NOT NODLines.FIND('-')) AND (TDSNOD.Code <> '') THEN
                    FIELDERROR("TDS Nature of Deduction",Text13701);
                  "Work Tax Nature Of Deduction" := TDSNOD.Code;
                END;
                
                VALIDATE("Work Tax Nature Of Deduction");
                */

            end;

            trigger OnValidate();
            begin
                /*TESTFIELD("GST on Advance Payment",FALSE);
                TDSNOD.MODIFYALL(Mark,FALSE);
                NODLines.RESET;
                CASE "Party Type" OF
                  "Party Type"::Vendor:
                    NODLines.SETRANGE(Type,NODLines.Type::Vendor);
                  "Party Type"::Customer:
                    NODLines.SETRANGE(Type,NODLines.Type::Customer);
                  "Party Type"::Party:
                    NODLines.SETRANGE(Type,NODLines.Type::Party);
                END;
                NODLines.SETRANGE("No.","Party Code");
                NODLines.SETRANGE("NOD/NOC","Work Tax Nature Of Deduction");
                NODLines.SETRANGE("TDS Group",NODLines."TDS Group"::Others);
                IF (NOT NODLines.FIND('-')) AND ("Work Tax Nature Of Deduction" <> '') THEN
                  FIELDERROR("Work Tax Nature Of Deduction",Text13701);
                IF TDSNOD.GET("Work Tax Nature Of Deduction") THEN
                  "Work Tax Group" := TDSNOD."TDS Group"
                ELSE
                  "Work Tax Group" := "Work Tax Group"::" ";
                CalculateTDS;
                */

            end;
        }
        field(16361; "Work Tax Group"; Option)
        {
            CaptionML = ENU = 'Work Tax Group',
                        ENN = 'Work Tax Group';
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaptionML = ENU = ' ,Contractor,Commission,Professional,Interest,Rent,Dividend,Interest on Securities,Lotteries,Insurance Commission,NSS,Mutual fund,Brokerage,Income from Units,Capital Assets,Horse Races,Sports Association,Payable to Non Residents,Income of Mutual Funds,Units,Foreign Currency Bonds,FII from Securities,Others',
                              ENN = ' ,Contractor,Commission,Professional,Interest,Rent,Dividend,Interest on Securities,Lotteries,Insurance Commission,NSS,Mutual fund,Brokerage,Income from Units,Capital Assets,Horse Races,Sports Association,Payable to Non Residents,Income of Mutual Funds,Units,Foreign Currency Bonds,FII from Securities,Others';
            OptionMembers = " ",Contractor,Commission,Professional,Interest,Rent,Dividend,"Interest on Securities",Lotteries,"Insurance Commission",NSS,"Mutual fund",Brokerage,"Income from Units","Capital Assets","Horse Races","Sports Association","Payable to Non Residents","Income of Mutual Funds",Units,"Foreign Currency Bonds","FII from Securities",Others;
        }
        field(16362; "Balance TDS/TCS Amount"; Decimal)
        {
            CaptionML = ENU = 'Balance TDS/TCS Amount',
                        ENN = 'Balance TDS/TCS Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16363; "Temp TDS/TCS Base"; Decimal)
        {
            CaptionML = ENU = 'Temp TDS/TCS Base',
                        ENN = 'Temp TDS/TCS Base';
            DataClassification = ToBeClassified;
        }
        field(16364; "Excise Posting"; Boolean)
        {
            CaptionML = ENU = 'Excise Posting',
                        ENN = 'Excise Posting';
            DataClassification = ToBeClassified;
        }
        field(16365; "Product Type"; Option)
        {
            CaptionML = ENU = 'Product Type',
                        ENN = 'Product Type';
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = ',Item,FA',
                              ENN = ',Item,FA';
            OptionMembers = ,Item,FA;
        }
        field(16366; "Excise Charge"; Boolean)
        {
            CaptionML = ENU = 'Excise Charge',
                        ENN = 'Excise Charge';
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                /*IF "Excise Charge" = TRUE THEN BEGIN
                  "Pay Excise" := FALSE;
                  "Pay Work Tax" := FALSE;
                  "Pay TDS" := FALSE;
                  "Pay VAT" := FALSE;
                  "Refund VAT" := FALSE;
                  TESTFIELD(PLA,FALSE);
                  TESTFIELD("Account Type","Account Type"::"G/L Account");
                  TESTFIELD("Bal. Account Type","Bal. Account Type"::"G/L Account");
                END;
                */

            end;
        }
        field(16370; "Deferred Claim FA Excise"; Boolean)
        {
            CaptionML = ENU = 'Deferred Claim FA Excise',
                        ENN = 'Deferred Claim FA Excise';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16372; "Cheque No."; Code[10])
        {
            CaptionML = ENU = 'Cheque No.',
                        ENN = 'Cheque No.';
            DataClassification = ToBeClassified;
        }
        field(16374; Deferred; Boolean)
        {
            CaptionML = ENU = 'Deferred',
                        ENN = 'Deferred';
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                /*IF Deferred THEN
                  TESTFIELD("ADC VAT Amount",0);
                  */

            end;
        }
        field(16375; "Service Tax Type"; Option)
        {
            CaptionML = ENU = 'Service Tax Type',
                        ENN = 'Service Tax Type';
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = 'Sale,Purchase,Charge',
                              ENN = 'Sale,Purchase,Charge';
            OptionMembers = Sale,Purchase,Charge;

            trigger OnValidate();
            begin
                CalculateServiceTax;
                CalculateTDS;
            end;
        }
        field(16376; "Service Tax Group Code"; Code[20])
        {
            CaptionML = ENU = 'Service Tax Group Code',
                        ENN = 'Service Tax Group Code';
            DataClassification = ToBeClassified;
            TableRelation = "Service Tax Groups".Code;
        }
        field(16377; "Service Tax Registration No."; Code[20])
        {
            CaptionML = ENU = 'Service Tax Registration No.',
                        ENN = 'Service Tax Registration No.';
            DataClassification = ToBeClassified;
            TableRelation = "Service Tax Registration Nos.".Code;
        }
        field(16378; "Service Tax Base Amount (LCY)"; Decimal)
        {
            CaptionML = ENU = 'Service Tax Base Amount (LCY)',
                        ENN = 'Service Tax Base Amount (LCY)';
            DataClassification = ToBeClassified;
            Editable = true;

            trigger OnValidate();
            var
                ServiceTaxSetup: Record "Service Tax Setup";
            begin
            end;
        }
        field(16379; "Service Tax Amount"; Decimal)
        {
            CaptionML = ENU = 'Service Tax Amount',
                        ENN = 'Service Tax Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16382; "Service Tax Entry"; Boolean)
        {
            CaptionML = ENU = 'Service Tax Entry',
                        ENN = 'Service Tax Entry';
            DataClassification = ToBeClassified;
        }
        field(16383; "eCESS %"; Decimal)
        {
            CaptionML = ENU = 'eCESS %',
                        ENN = 'eCESS %';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16384; "eCESS on TDS/TCS Amount"; Decimal)
        {
            CaptionML = ENU = 'eCESS on TDS/TCS Amount',
                        ENN = 'eCESS on TDS/TCS Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16385; "Total TDS/TCS Incl. SHE CESS"; Decimal)
        {
            CaptionML = ENU = 'Total TDS/TCS Incl. SHE CESS',
                        ENN = 'Total TDS/TCS Incl. SHE CESS';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16388; "Balance eCESS on TDS/TCS Amt"; Decimal)
        {
            CaptionML = ENU = 'Balance eCESS on TDS/TCS Amt',
                        ENN = 'Balance eCESS on TDS/TCS Amt';
            DataClassification = ToBeClassified;
        }
        field(16389; "Per Contract"; Boolean)
        {
            CaptionML = ENU = 'Per Contract',
                        ENN = 'Per Contract';
            DataClassification = ToBeClassified;
        }
        field(16390; "Capital Item"; Boolean)
        {
            CaptionML = ENU = 'Capital Item',
                        ENN = 'Capital Item';
            DataClassification = ToBeClassified;
        }
        field(16391; "Item No."; Code[20])
        {
            CaptionML = ENU = 'Item No.',
                        ENN = 'Item No.';
            DataClassification = ToBeClassified;
        }
        field(16406; "Service Tax eCess Amount"; Decimal)
        {
            CaptionML = ENU = 'Service Tax eCess Amount',
                        ENN = 'Service Tax eCess Amount';
            DataClassification = ToBeClassified;
        }
        field(16460; "Goes to Excise Entry"; Boolean)
        {
            CaptionML = ENU = 'Goes to Excise Entry',
                        ENN = 'Goes to Excise Entry';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16461; "From Excise"; Boolean)
        {
            CaptionML = ENU = 'From Excise',
                        ENN = 'From Excise';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16478; "T.A.N. No."; Code[10])
        {
            CaptionML = ENU = 'T.A.N. No.',
                        ENN = 'T.A.N. No.';
            DataClassification = ToBeClassified;
            TableRelation = "T.A.N. Nos.";
        }
        field(16491; "VAT Type"; Option)
        {
            CaptionML = ENU = 'VAT Type',
                        ENN = 'VAT Type';
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = ' ,Item,Capital Goods',
                              ENN = ' ,Item,Capital Goods';
            OptionMembers = " ",Item,"Capital Goods";
        }
        field(16492; "TDS From Orders"; Boolean)
        {
            CaptionML = ENU = 'TDS From Orders',
                        ENN = 'TDS From Orders';
            DataClassification = ToBeClassified;
        }
        field(16493; "Consignment Note No."; Code[20])
        {
            CaptionML = ENU = 'Consignment Note No.',
                        ENN = 'Consignment Note No.';
            DataClassification = ToBeClassified;
        }
        field(16494; "Declaration Form (GTA)"; Boolean)
        {
            CaptionML = ENU = 'Declaration Form (GTA)',
                        ENN = 'Declaration Form (GTA)';
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                CalculateServiceTax;
            end;
        }
        field(16496; "Service Type (Rev. Chrg.)"; Option)
        {
            CaptionML = ENU = 'Service Type (Rev. Chrg.)',
                        ENN = 'Service Type (Rev. Chrg.)';
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = ' ,Inward,Outward Stock Transfer,Outward Input Service,Outward',
                              ENN = ' ,Inward,Outward Stock Transfer,Outward Input Service,Outward';
            OptionMembers = " ",Inward,"Outward Stock Transfer","Outward Input Service",Outward;
        }
        field(16500; "TCS Nature of Collection"; Code[10])
        {
            CaptionML = ENU = 'TCS Nature of Collection',
                        ENN = 'TCS Nature of Collection';
            DataClassification = ToBeClassified;
            TableRelation = "TCS Nature Of Collection";

            trigger OnLookup();
            var
                NatureOfCollection: Record "TCS Nature Of Collection";
                TempNatureOfCollection: Record "TCS Nature Of Collection" temporary;
            begin
                /*NOCLine.RESET;
                NOCLine.SETRANGE(Type,"Party Type");
                NOCLine.SETRANGE("No.","Party Code");
                NOCLine.SETRANGE("TDS for Customer",FALSE);
                IF "Party Type" = "Party Type"::Party THEN
                  NOCLine.SETRANGE("TCS Party",TRUE);
                IF NOCLine.FIND('-') THEN
                  REPEAT
                    NatureOfCollection.GET(NOCLine."NOD/NOC");
                    TempNatureOfCollection := NatureOfCollection;
                    TempNatureOfCollection.INSERT;
                  UNTIL NOCLine.NEXT = 0;
                
                IF PAGE.RUNMODAL(PAGE::"TCS Nature of Collections",TempNatureOfCollection) = ACTION::LookupOK THEN
                  "TCS Nature of Collection" := TempNatureOfCollection.Code;
                VALIDATE("TCS Nature of Collection");
                */

            end;

            trigger OnValidate();
            var
                CompanyInfo: Record "Company Information";
                Location: Record Location;
            begin
            end;
        }
        field(16502; "Pay TCS"; Boolean)
        {
            CaptionML = ENU = 'Pay TCS',
                        ENN = 'Pay TCS';
            DataClassification = ToBeClassified;
        }
        field(16503; "TCS Entry"; Boolean)
        {
            CaptionML = ENU = 'TCS Entry',
                        ENN = 'TCS Entry';
            DataClassification = ToBeClassified;
        }
        field(16504; "TCS Type"; Option)
        {
            CaptionML = ENU = 'TCS Type',
                        ENN = 'TCS Type';
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = ' ,A,B,C,D,E,F,G,H,I,J,K,L,M,N,1H',
                              ENN = ' ,A,B,C,D,E,F,G,H,I,J,K,L,M,N,1H';
            OptionMembers = " ",A,B,C,D,E,F,G,H,I,J,K,L,M,N,"1H";
        }
        field(16505; "T.C.A.N. No."; Code[10])
        {
            CaptionML = ENU = 'T.C.A.N. No.',
                        ENN = 'T.C.A.N. No.';
            DataClassification = ToBeClassified;
            TableRelation = "T.C.A.N. No.";
        }
        field(16506; "TCS From Orders"; Boolean)
        {
            CaptionML = ENU = 'TCS From Orders',
                        ENN = 'TCS From Orders';
            DataClassification = ToBeClassified;
        }
        field(16507; "FA Shift Line No."; Integer)
        {
            CaptionML = ENU = 'FA Shift Line No.',
                        ENN = 'FA Shift Line No.';
            DataClassification = ToBeClassified;

            trigger OnLookup();
            var
                FAShift: Record "FA Shift";
            begin
            end;
        }
        field(16508; "Non ITC Claimable Usage %"; Decimal)
        {
            CaptionML = ENU = 'Non ITC Claimable Usage %',
                        ENN = 'Non ITC Claimable Usage %';
            DataClassification = ToBeClassified;
            Editable = true;
            MinValue = 0;
        }
        field(16509; "Input Credit/Output Tax Amount"; Decimal)
        {
            CaptionML = ENU = 'Input Credit/Output Tax Amount',
                        ENN = 'Input Credit/Output Tax Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16510; "Amount Loaded on Item"; Decimal)
        {
            CaptionML = ENU = 'Amount Loaded on Item',
                        ENN = 'Amount Loaded on Item';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16518; "Tax Amount Loaded on Inventory"; Decimal)
        {
            CaptionML = ENU = 'Tax Amount Loaded on Inventory',
                        ENN = 'Tax Amount Loaded on Inventory';
            DataClassification = ToBeClassified;
        }
        field(16519; Deferment; Boolean)
        {
            CaptionML = ENU = 'Deferment',
                        ENN = 'Deferment';
            DataClassification = ToBeClassified;
        }
        field(16520; "VAT Entry"; Boolean)
        {
            CaptionML = ENU = 'VAT Entry',
                        ENN = 'VAT Entry';
            DataClassification = ToBeClassified;
        }
        field(16521; "Standard Deduction Amount"; Decimal)
        {
            CaptionML = ENU = 'Standard Deduction Amount',
                        ENN = 'Standard Deduction Amount';
            DataClassification = ToBeClassified;
        }
        field(16522; "Service Tax Rounding Precision"; Decimal)
        {
            CaptionML = ENU = 'Service Tax Rounding Precision',
                        ENN = 'Service Tax Rounding Precision';
            DataClassification = ToBeClassified;
        }
        field(16523; "Service Tax Rounding Type"; Option)
        {
            CaptionML = ENU = 'Service Tax Rounding Type',
                        ENN = 'Service Tax Rounding Type';
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = 'Nearest,Up,Down',
                              ENN = 'Nearest,Up,Down';
            OptionMembers = Nearest,Up,Down;
        }
        field(16525; "Standard Deduction Amount(ACY)"; Decimal)
        {
            CaptionML = ENU = 'Standard Deduction Amount(ACY)',
                        ENN = 'Standard Deduction Amount(ACY)';
            DataClassification = ToBeClassified;
        }
        field(16526; "Input/Output Tax Amount"; Decimal)
        {
            CaptionML = ENU = 'Input/Output Tax Amount',
                        ENN = 'Input/Output Tax Amount';
            DataClassification = ToBeClassified;
        }
        field(16527; "Excise Refund"; Boolean)
        {
            CaptionML = ENU = 'Excise Refund',
                        ENN = 'Excise Refund';
            DataClassification = ToBeClassified;
        }
        field(16528; "VAT Adjustment Entry"; Boolean)
        {
            CaptionML = ENU = 'VAT Adjustment Entry',
                        ENN = 'VAT Adjustment Entry';
            DataClassification = ToBeClassified;
        }
        field(16529; Trading; Boolean)
        {
            CaptionML = ENU = 'Trading',
                        ENN = 'Trading';
            DataClassification = ToBeClassified;
        }
        field(16530; "Sales Return Order"; Boolean)
        {
            CaptionML = ENU = 'Sales Return Order',
                        ENN = 'Sales Return Order';
            DataClassification = ToBeClassified;
        }
        field(16531; "Excise as Service Tax Credit"; Boolean)
        {
            CaptionML = ENU = 'Excise as Service Tax Credit',
                        ENN = 'Excise as Service Tax Credit';
            DataClassification = ToBeClassified;
        }
        field(16532; "Serv. Tax on Advance Payment"; Boolean)
        {
            CaptionML = ENU = 'Serv. Tax on Advance Payment',
                        ENN = 'Serv. Tax on Advance Payment';
            DataClassification = ToBeClassified;
        }
        field(16533; "Transaction No. Serv. Tax"; Integer)
        {
            CaptionML = ENU = 'Transaction No. Serv. Tax',
                        ENN = 'Transaction No. Serv. Tax';
            DataClassification = ToBeClassified;
        }
        field(16534; "ADC VAT Amount"; Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU = 'ADC VAT Amount',
                        ENN = 'ADC VAT Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16537; CVD; Boolean)
        {
            CaptionML = ENU = 'CVD',
                        ENN = 'CVD';
            DataClassification = ToBeClassified;
        }
        field(16539; "Source Curr. ADC VAT Amount"; Decimal)
        {
            CaptionML = ENU = 'Source Curr. ADC VAT Amount',
                        ENN = 'Source Curr. ADC VAT Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16547; "Service Tax SHE Cess Amount"; Decimal)
        {
            CaptionML = ENU = 'Service Tax SHE Cess Amount',
                        ENN = 'Service Tax SHE Cess Amount';
            DataClassification = ToBeClassified;
        }
        field(16548; "SHE Cess % on TDS/TCS"; Decimal)
        {
            CaptionML = ENU = 'SHE Cess % on TDS/TCS',
                        ENN = 'SHE Cess % on TDS/TCS';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16549; "SHE Cess on TDS/TCS Amount"; Decimal)
        {
            CaptionML = ENU = 'SHE Cess on TDS/TCS Amount',
                        ENN = 'SHE Cess on TDS/TCS Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16553; "Bal. SHE Cess on TDS/TCS Amt"; Decimal)
        {
            CaptionML = ENU = 'Bal. SHE Cess on TDS/TCS Amt',
                        ENN = 'Bal. SHE Cess on TDS/TCS Amt';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16554; "TDS Certificate Receivable"; Boolean)
        {
            CaptionML = ENU = 'TDS Certificate Receivable',
                        ENN = 'TDS Certificate Receivable';
            DataClassification = ToBeClassified;
        }
        field(16555; "Input Service Distribution"; Boolean)
        {
            CaptionML = ENU = 'Input Service Distribution',
                        ENN = 'Input Service Distribution';
            DataClassification = ToBeClassified;
        }
        field(16556; "Stale Cheque"; Boolean)
        {
            CaptionML = ENU = 'Stale Cheque',
                        ENN = 'Stale Cheque';
            DataClassification = ToBeClassified;
        }
        field(16557; "ST Pure Agent"; Boolean)
        {
            CaptionML = ENU = 'ST Pure Agent',
                        ENN = 'ST Pure Agent';
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                CalculateServiceTax;
            end;
        }
        field(16558; "Nature of Services"; Option)
        {
            CaptionML = ENU = 'Nature of Services',
                        ENN = 'Nature of Services';
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = ' ,Exempted,Export',
                              ENN = ' ,Exempted,Export';
            OptionMembers = " ",Exempted,Export;

            trigger OnValidate();
            begin
                CalculateServiceTax;
            end;
        }
        field(16559; "Work Tax % Applied"; Decimal)
        {
            CaptionML = ENU = 'Work Tax % Applied',
                        ENN = 'Work Tax % Applied';
            DataClassification = ToBeClassified;
        }
        field(16560; "W.T Amount"; Decimal)
        {
            CaptionML = ENU = 'W.T Amount',
                        ENN = 'W.T Amount';
            DataClassification = ToBeClassified;
        }
        field(16561; "Works Tax"; Boolean)
        {
            CaptionML = ENU = 'Work Tax',
                        ENN = 'Work Tax';
            DataClassification = ToBeClassified;
        }
        field(16562; "Reverse Work Tax"; Boolean)
        {
            CaptionML = ENU = 'Reverse Work Tax',
                        ENN = 'Reverse Work Tax';
            DataClassification = ToBeClassified;
        }
        field(16563; "CWIP G/L Type"; Option)
        {
            CaptionML = ENU = 'CWIP G/L Type',
                        ENN = 'CWIP G/L Type';
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = ' ,Labor,Material,Overheads',
                              ENN = ' ,Labor,Material,Overheads';
            OptionMembers = " ",Labor,Material,Overheads;
        }
        field(16564; CWIP; Boolean)
        {
            CaptionML = ENU = 'CWIP',
                        ENN = 'CWIP';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16565; "Shift Type"; Option)
        {
            CaptionML = ENU = 'Shift Type',
                        ENN = 'Shift Type';
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = 'Single,Double,Triple',
                              ENN = 'Single,Double,Triple';
            OptionMembers = Single,Double,Triple;
        }
        field(16566; "Industry Type"; Option)
        {
            CaptionML = ENU = 'Industry Type',
                        ENN = 'Industry Type';
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = 'Normal,Non Seasonal,Seasonal',
                              ENN = 'Normal,Non Seasonal,Seasonal';
            OptionMembers = Normal,"Non Seasonal",Seasonal;
        }
        field(16567; "No. of Days for Shift"; Integer)
        {
            CaptionML = ENU = 'No. of Days for Shift',
                        ENN = 'No. of Days for Shift';
            DataClassification = ToBeClassified;
            MinValue = 0;
        }
        field(16568; "VATable Purchase Tax"; Decimal)
        {
            CaptionML = ENU = 'VATable Purchase Tax',
                        ENN = 'VATable Purchase Tax';
            DataClassification = ToBeClassified;
        }
        field(16569; "Sale Return Type"; Option)
        {
            CaptionML = ENU = 'Sale Return Type',
                        ENN = 'Sale Return Type';
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = ' ,Sales  Cancellation',
                              ENN = ' ,Sales  Cancellation';
            OptionMembers = " ","Sales  Cancellation";
        }
        field(16570; "RG/Service Tax Set Off Date"; Date)
        {
            CaptionML = ENU = 'RG/Service Tax Set Off Date',
                        ENN = 'RG/Service Tax Set Off Date';
            DataClassification = ToBeClassified;
        }
        field(16571; "PLA Set Off Date"; Date)
        {
            CaptionML = ENU = 'PLA Set Off Date',
                        ENN = 'PLA Set Off Date';
            DataClassification = ToBeClassified;
        }
        field(16572; "Insert S.T Recoverable"; Boolean)
        {
            CaptionML = ENU = 'Insert S.T Recoverable',
                        ENN = 'Insert S.T Recoverable';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16573; "Offline Application"; Boolean)
        {
            CaptionML = ENU = 'Offline Application',
                        ENN = 'Offline Application';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16574; "S.T From Order"; Boolean)
        {
            CaptionML = ENU = 'S.T From Order',
                        ENN = 'S.T From Order';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16575; "Un Application Entry"; Boolean)
        {
            CaptionML = ENU = 'Un Application Entry',
                        ENN = 'Un Application Entry';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16576; "Include Serv. Tax in TDS Base"; Boolean)
        {
            CaptionML = ENU = 'Include Serv. Tax in TDS Base',
                        ENN = 'Include Serv. Tax in TDS Base';
            DataClassification = ToBeClassified;
        }
        field(16577; "TDS Line Amount"; Decimal)
        {
            CaptionML = ENU = 'TDS Line Amount',
                        ENN = 'TDS Line Amount';
            DataClassification = ToBeClassified;
        }
        field(16578; Posting; Boolean)
        {
            CaptionML = ENU = 'Posting',
                        ENN = 'Posting';
            DataClassification = ToBeClassified;
        }
        field(16579; "Applied TDS Base Amount"; Decimal)
        {
            CaptionML = ENU = 'Applied TDS Base Amount',
                        ENN = 'Applied TDS Base Amount';
            DataClassification = ToBeClassified;
        }
        field(16580; PoT; Boolean)
        {
            CaptionML = ENU = 'PoT',
                        ENN = 'PoT';
            DataClassification = ToBeClassified;
        }
        field(16581; "TDS/TCS Base Amount Applied"; Decimal)
        {
            CaptionML = ENU = 'TDS/TCS Base Amount Applied',
                        ENN = 'TDS/TCS Base Amount Applied';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16582; "TDS/TCS Base Amount Adjusted"; Boolean)
        {
            CaptionML = ENU = 'TDS/TCS Base Amount Adjusted',
                        ENN = 'TDS/TCS Base Amount Adjusted';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16583; "Work Tax Base Amount Applied"; Decimal)
        {
            CaptionML = ENU = 'Work Tax Base Amount Applied',
                        ENN = 'Work Tax Base Amount Applied';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16584; "Work Tax Base Amount Adjusted"; Boolean)
        {
            CaptionML = ENU = 'Work Tax Base Amount Adjusted',
                        ENN = 'Work Tax Base Amount Adjusted';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16585; "Tot. Serv Tax Amount (Intm)"; Decimal)
        {
            CaptionML = ENU = 'Tot. Serv Tax Amount (Intm)',
                        ENN = 'Tot. Serv Tax Amount (Intm)';
            DataClassification = ToBeClassified;
        }
        field(16586; "Nature of Remittance"; Code[10])
        {
            CaptionML = ENU = 'Nature of Remittance',
                        ENN = 'Nature of Remittance';
            DataClassification = ToBeClassified;
            TableRelation = "TDS Nature of Remittance";

            trigger OnLookup();
            var
                NatureOfRemittance: Record "TDS Nature of Remittance";
            begin
            end;
        }
        field(16587; "Act Applicable"; Option)
        {
            CaptionML = ENU = 'Act Applicable',
                        ENN = 'Act Applicable';
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = ' ,IT,DTAA',
                              ENN = ' ,IT,DTAA';
            OptionMembers = " ",IT,DTAA;
        }
        field(16588; "Country Code"; Code[10])
        {
            CaptionML = ENU = 'Country Code',
                        ENN = 'Country Code';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Country/Region";
        }
        field(16589; "Service Tax SBC %"; Decimal)
        {
            CaptionML = ENU = 'Service Tax SBC %',
                        ENN = 'Service Tax SBC %';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16590; "Service Tax SBC Amount"; Decimal)
        {
            CaptionML = ENU = 'Service Tax SBC Amount(LCY)',
                        ENN = 'Service Tax SBC Amount(LCY)';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16591; "Service Tax SBC Amount (Intm)"; Decimal)
        {
            CaptionML = ENU = 'Service Tax SBC Amount(Intm)',
                        ENN = 'Service Tax SBC Amount(Intm)';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16592; "SBC G/L Account"; Code[20])
        {
            CaptionML = ENU = 'SBC G/L Account',
                        ENN = 'SBC G/L Account';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16593; "KK Cess%"; Decimal)
        {
            CaptionML = ENU = 'KK Cess%',
                        ENN = 'KK Cess%';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16594; "KK Cess Amount"; Decimal)
        {
            CaptionML = ENU = 'KK Cess Amount',
                        ENN = 'KK Cess Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16595; "KK Cess Amount (Intm)"; Decimal)
        {
            CaptionML = ENU = 'KK Cess Amount (Intm)',
                        ENN = 'KK Cess Amount (Intm)';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16596; "KK Cess G/L Account"; Code[20])
        {
            CaptionML = ENU = 'KK Cess G/L Account',
                        ENN = 'KK Cess G/L Account';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16601; "Nature of Supply"; Option)
        {
            CaptionML = ENU = 'Nature of Supply',
                        ENN = 'Nature of Supply';
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaptionML = ENU = 'B2B,B2C',
                              ENN = 'B2B,B2C';
            OptionMembers = B2B,B2C;
        }
        field(16602; "GST Group Code"; Code[20])
        {
            CaptionML = ENU = 'GST Group Code',
                        ENN = 'GST Group Code';
            DataClassification = ToBeClassified;
            TableRelation = "GST Group";

            trigger OnValidate();
            var
                GSTGroup: Record "GST Group";
                SalesReceivablesSetup: Record "Sales & Receivables Setup";
                GenJournalLine2: Record "Gen. Journal Line";
            begin
            end;
        }
        field(16603; "GST Group Type"; Option)
        {
            CaptionML = ENU = 'GST Group Type',
                        ENN = 'GST Group Type';
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaptionML = ENU = 'Goods,Service',
                              ENN = 'Goods,Service';
            OptionMembers = Goods,Service;
        }
        field(16604; "GST Base Amount"; Decimal)
        {
            CaptionML = ENU = 'GST Base Amount',
                        ENN = 'GST Base Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16605; "GST %"; Decimal)
        {
            CaptionML = ENU = 'GST %',
                        ENN = 'GST %';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16606; "Total GST Amount"; Decimal)
        {
            CaptionML = ENU = 'Total GST Amount',
                        ENN = 'Total GST Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16607; "GST Place of Supply"; Option)
        {
            CaptionML = ENU = 'GST Place of Supply',
                        ENN = 'GST Place of Supply';
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = ' ,Bill-to Address,Ship-to Address,Location Address',
                              ENN = ' ,Bill-to Address,Ship-to Address,Location Address';
            OptionMembers = " ","Bill-to Address","Ship-to Address","Location Address";
        }
        field(16608; "GST Customer Type"; Option)
        {
            CaptionML = ENU = 'GST Customer Type',
                        ENN = 'GST Customer Type';
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaptionML = ENU = ' ,Registered,Unregistered,Export,Deemed Export,Exempted,SEZ Development,SEZ Unit',
                              ENN = ' ,Registered,Unregistered,Export,Deemed Export,Exempted,SEZ Development,SEZ Unit';
            OptionMembers = " ",Registered,Unregistered,Export,"Deemed Export",Exempted,"SEZ Development","SEZ Unit";
        }
        field(16609; "GST Vendor Type"; Option)
        {
            CaptionML = ENU = 'GST Vendor Type',
                        ENN = 'GST Vendor Type';
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaptionML = ENU = ' ,Registered,Composite,Unregistered,Import,Exempted,SEZ',
                              ENN = ' ,Registered,Composite,Unregistered,Import,Exempted,SEZ';
            OptionMembers = " ",Registered,Composite,Unregistered,Import,Exempted,SEZ;
        }
        field(16611; "HSN/SAC Code"; Code[8])
        {
            CaptionML = ENU = 'HSN/SAC Code',
                        ENN = 'HSN/SAC Code';
            DataClassification = ToBeClassified;
            TableRelation = "HSN/SAC".Code WHERE("GST Group Code" = FIELD("GST Group Code"));

            trigger OnValidate();
            var
                GenJournalLine: Record "Gen. Journal Line";
            begin
            end;
        }
        field(16612; Exempted; Boolean)
        {
            CaptionML = ENU = 'Exempted',
                        ENN = 'Exempted';
            DataClassification = ToBeClassified;
        }
        field(16613; "GST Component Code"; Code[10])
        {
            CaptionML = ENU = 'GST Component Code',
                        ENN = 'GST Component Code';
            DataClassification = ToBeClassified;
            TableRelation = "GST Component";

            trigger OnValidate();
            var
                GSTComponent: Record "GST Component";
                Location2: Record Location;
                LocationARNNo: Code[15];
            begin
            end;
        }
        field(16614; "GST on Advance Payment"; Boolean)
        {
            CaptionML = ENU = 'GST on Advance Payment',
                        ENN = 'GST on Advance Payment';
            DataClassification = ToBeClassified;
        }
        field(16615; "Ship-to Code"; Code[10])
        {
            CaptionML = ENU = 'Ship-to Code',
                        ENN = 'Ship-to Code';
            DataClassification = ToBeClassified;
            TableRelation = IF ("Account Type" = CONST(Customer)) "Ship-to Address".Code WHERE("Customer No." = FIELD("Account No."));
        }
        field(16616; "Tax Type"; Option)
        {
            CaptionML = ENU = 'Tax Type',
                        ENN = 'Tax Type';
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = ' ,Sales Tax,Excise,Service Tax,GST Credit,GST Liability,GST TDS Credit,GST TCS Credit',
                              ENN = ' ,Sales Tax,Excise,Service Tax,GST Credit,GST Liability,GST TDS Credit,GST TCS Credit';
            OptionMembers = " ","Sales Tax",Excise,"Service Tax","GST Credit","GST Liability","GST TDS Credit","GST TCS Credit";

            trigger OnValidate();
            var
                GSTComponent: Record "GST Component";
            begin
            end;
        }
        field(16617; "GST Jurisdiction Type"; Option)
        {
            CaptionML = ENU = 'GST Jurisdiction Type',
                        ENN = 'GST Jurisdiction Type';
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaptionML = ENU = 'Intrastate,Interstate',
                              ENN = 'Intrastate,Interstate';
            OptionMembers = Intrastate,Interstate;
        }
        field(16618; "Adv. Pmt. Adjustment"; Boolean)
        {
            CaptionML = ENU = 'Adv. Pmt. Adjustment',
                        ENN = 'Adv. Pmt. Adjustment';
            DataClassification = ToBeClassified;
        }
        field(16619; "GST Bill-to/BuyFrom State Code"; Code[10])
        {
            CaptionML = ENU = 'GST Bill-to/BuyFrom State Code',
                        ENN = 'GST Bill-to/BuyFrom State Code';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = State;
        }
        field(16620; "GST Ship-to State Code"; Code[10])
        {
            CaptionML = ENU = 'GST Ship-to State Code',
                        ENN = 'GST Ship-to State Code';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = State;
        }
        field(16621; "Location State Code"; Code[10])
        {
            CaptionML = ENU = 'Location State Code',
                        ENN = 'Location State Code';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = State;
        }
        field(16622; "GST Inv. Rounding Precision"; Decimal)
        {
            CaptionML = ENU = 'GST Inv. Rounding Precision',
                        ENN = 'GST Inv. Rounding Precision';
            DataClassification = ToBeClassified;
            MinValue = 0;
        }
        field(16623; "GST Inv. Rounding Type"; Option)
        {
            CaptionML = ENU = 'GST Inv. Rounding Type',
                        ENN = 'GST Inv. Rounding Type';
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = 'Nearest,Up,Down',
                              ENN = 'Nearest,Up,Down';
            OptionMembers = Nearest,Up,Down;
        }
        field(16624; "GST Input Service Distribution"; Boolean)
        {
            CaptionML = ENU = 'GST Input Service Distribution',
                        ENN = 'GST Input Service Distribution';
            DataClassification = ToBeClassified;
        }
        field(16625; "GST Reverse Charge"; Boolean)
        {
            CaptionML = ENU = 'GST Reverse Charge',
                        ENN = 'GST Reverse Charge';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16626; "GST Reason Type"; Option)
        {
            CaptionML = ENU = 'GST Reason Type',
                        ENN = 'GST Reason Type';
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = ' ,Sales Return,Post Sale Discount,Deficiency in Service,Correction in Invoice,Change in POS,Finalization of Provisional Assessment,Others',
                              ENN = ' ,Sales Return,Post Sale Discount,Deficiency in Service,Correction in Invoice,Change in POS,Finalization of Provisional Assessment,Others';
            OptionMembers = " ","Sales Return","Post Sale Discount","Deficiency in Service","Correction in Invoice","Change in POS","Finalization of Provisional Assessment",Others;
        }
        field(16627; "Bank Charge"; Boolean)
        {
            CaptionML = ENU = 'Bank Charge',
                        ENN = 'Bank Charge';
            DataClassification = ToBeClassified;
        }
        field(16628; "Total GST Amount (LCY)"; Decimal)
        {
            CaptionML = ENU = 'Total GST Amount (LCY)',
                        ENN = 'Total GST Amount (LCY)';
            DataClassification = ToBeClassified;
        }
        field(16629; "RCM Exempt"; Boolean)
        {
            CaptionML = ENU = 'RCM Exempt',
                        ENN = 'RCM Exempt';
            DataClassification = ToBeClassified;
        }
        field(16630; "Order Address Code"; Code[10])
        {
            CaptionML = ENU = 'Order Address Code',
                        ENN = 'Order Address Code';
            DataClassification = ToBeClassified;
            TableRelation = IF ("Account Type" = CONST(Vendor)) "Order Address".Code WHERE("Vendor No." = FIELD("Account No."));

            trigger OnValidate();
            var
                DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
                Vendor: Record Vendor;
                OrderAddress: Record "Order Address";
            begin
            end;
        }
        field(16631; "Vendor GST Reg. No."; Code[15])
        {
            CaptionML = ENU = 'Vendor GST Reg. No.',
                        ENN = 'Vendor GST Reg. No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16632; "Associated Enterprises"; Boolean)
        {
            CaptionML = ENU = 'Associated Enterprises',
                        ENN = 'Associated Enterprises';
            DataClassification = ToBeClassified;
        }
        field(16633; "Purch. Invoice Type"; Option)
        {
            CaptionML = ENU = 'Purch. Invoice Type',
                        ENN = 'Purch. Invoice Type';
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = ' ,Self Invoice,Debit Note,Supplementary,Non-GST',
                              ENN = ' ,Self Invoice,Debit Note,Supplementary,Non-GST';
            OptionMembers = " ","Self Invoice","Debit Note",Supplementary,"Non-GST";
        }
        field(16634; "Inc. GST in TDS Base"; Boolean)
        {
            CaptionML = ENU = 'Inc. GST in TDS Base',
                        ENN = 'Inc. GST in TDS Base';
            DataClassification = ToBeClassified;
        }
        field(16635; "GST Credit"; Option)
        {
            CaptionML = ENU = 'GST Credit',
                        ENN = 'GST Credit';
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = 'Availment,Non-Availment',
                              ENN = 'Availment,Non-Availment';
            OptionMembers = Availment,"Non-Availment";
        }
        field(16636; "GST Without Payment of Duty"; Boolean)
        {
            CaptionML = ENU = 'GST Without Payment of Duty',
                        ENN = 'GST Without Payment of Duty';
            DataClassification = ToBeClassified;
        }
        field(16637; "Sales Invoice Type"; Option)
        {
            CaptionML = ENU = 'Sales Invoice Type',
                        ENN = 'Sales Invoice Type';
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = ' ,Bill of Supply,Export,Supplementary,Debit Note,Non-GST,Taxable',
                              ENN = ' ,Bill of Supply,Export,Supplementary,Debit Note,Non-GST,Taxable';
            OptionMembers = " ","Bill of Supply",Export,Supplementary,"Debit Note","Non-GST",Taxable;

            trigger OnValidate();
            var
                GenJournalLine: Record "Gen. Journal Line";
                TotalNoOfLines: Integer;
            begin
            end;
        }
        field(16638; "Bill Of Export No."; Text[20])
        {
            CaptionML = ENU = 'Bill Of Export No.',
                        ENN = 'Bill Of Export No.';
            DataClassification = ToBeClassified;
        }
        field(16639; "Bill Of Export Date"; Date)
        {
            CaptionML = ENU = 'Bill Of Export Date',
                        ENN = 'Bill Of Export Date';
            DataClassification = ToBeClassified;
        }
        field(16640; "e-Commerce Customer"; Code[20])
        {
            CaptionML = ENU = 'e-Commerce Customer',
                        ENN = 'e-Commerce Customer';
            DataClassification = ToBeClassified;
            TableRelation = Customer WHERE("e-Commerce Operator" = CONST(true));
        }
        field(16641; "e-Commerce Merchant Id"; Code[30])
        {
            CaptionML = ENU = 'e-Commerce Merchant Id',
                        ENN = 'e-Commerce Merchant Id';
            DataClassification = ToBeClassified;
            TableRelation = "e-Commerce Merchant Id"."Merchant Id" WHERE("Merchant Id" = FIELD("e-Commerce Merchant Id"),
                                                                          "Customer No." = FIELD("e-Commerce Customer"));
        }
        field(16642; "Custom Duty Amount"; Decimal)
        {
            CaptionML = ENU = 'Custom Duty Amount',
                        ENN = 'Custom Duty Amount';
            DataClassification = ToBeClassified;
        }
        field(16643; "GST Assessable Value"; Decimal)
        {
            CaptionML = ENU = 'GST Assessable Value',
                        ENN = 'GST Assessable Value';
            DataClassification = ToBeClassified;
        }
        field(16644; "GST in Journal"; Boolean)
        {
            CaptionML = ENU = 'GST in Journal',
                        ENN = 'GST in Journal';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16645; "GST Transaction Type"; Option)
        {
            CaptionML = ENU = 'GST Transaction Type',
                        ENN = 'GST Transaction Type';
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = ' ,Purchase,Sale',
                              ENN = ' ,Purchase,Sale';
            OptionMembers = " ",Purchase,Sale;
        }
        field(16646; "Journal Entry"; Boolean)
        {
            CaptionML = ENU = 'Journal Entry',
                        ENN = 'Journal Entry';
            DataClassification = ToBeClassified;
        }
        field(16647; "Custom Duty Amount (LCY)"; Decimal)
        {
            CaptionML = ENU = 'Custom Duty Amount (LCY)',
                        ENN = 'Custom Duty Amount (LCY)';
            DataClassification = ToBeClassified;
        }
        field(16648; "Bill of Entry No."; Text[20])
        {
            CaptionML = ENU = 'Bill of Entry No.',
                        ENN = 'Bill of Entry No.';
            DataClassification = ToBeClassified;
        }
        field(16649; "Bill of Entry Date"; Date)
        {
            CaptionML = ENU = 'Bill of Entry Date',
                        ENN = 'Bill of Entry Date';
            DataClassification = ToBeClassified;
        }
        field(16650; "GST in Journal Allocations"; Boolean)
        {
            CaptionML = ENU = 'GST in Journal Allocations',
                        ENN = 'GST in Journal Allocations';
            DataClassification = ToBeClassified;
        }
        field(16651; "Allocation Line No."; Integer)
        {
            CaptionML = ENU = 'Allocation Line No.',
                        ENN = 'Allocation Line No.';
            DataClassification = ToBeClassified;
        }
        field(16652; "Journal Line No."; Integer)
        {
            CaptionML = ENU = 'Journal Line No.',
                        ENN = 'Journal Line No.';
            DataClassification = ToBeClassified;
        }
        field(16653; "Journal Alloc. Template Name"; Code[10])
        {
            CaptionML = ENU = 'Journal Alloc. Template Name',
                        ENN = 'Journal Alloc. Template Name';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template";
        }
        field(16654; "Old Document No."; Code[20])
        {
            CaptionML = ENU = 'Old Document No.',
                        ENN = 'Old Document No.';
            DataClassification = ToBeClassified;
        }
        field(16655; "GST Adjustment Entry"; Boolean)
        {
            CaptionML = ENU = 'GST Adjustment Entry',
                        ENN = 'GST Adjustment Entry';
            DataClassification = ToBeClassified;
        }
        field(16656; "Location GST Reg. No."; Code[15])
        {
            CaptionML = ENU = 'Location GST Reg. No.',
                        ENN = 'Location GST Reg. No.';
            DataClassification = ToBeClassified;
            TableRelation = "GST Registration Nos.";

            trigger OnValidate();
            var
                GSTRegistrationNos: Record "GST Registration Nos.";
                Location: Record Location;
                GSTComponent: Record "GST Component";
                Location2: Record Location;
            begin
            end;
        }
        field(16657; "Customer GST Reg. No."; Code[15])
        {
            CaptionML = ENU = 'Customer GST Reg. No.',
                        ENN = 'Customer GST Reg. No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16658; "Ship-to GST Reg. No."; Code[15])
        {
            CaptionML = ENU = 'Ship-to GST Reg. No.',
                        ENN = 'Ship-to GST Reg. No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16659; "Order Address GST Reg. No."; Code[15])
        {
            CaptionML = ENU = 'Order Address GST Reg. No.',
                        ENN = 'Order Address GST Reg. No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16660; "Order Address State Code"; Code[10])
        {
            CaptionML = ENU = 'Order Address State Code',
                        ENN = 'Order Address State Code';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16661; "Bill to-Location(POS)"; Code[10])
        {
            CaptionML = ENU = 'Bill to-Location(POS)',
                        ENN = 'Bill to-Location(POS)';
            DataClassification = ToBeClassified;
            TableRelation = Location WHERE("Use As In-Transit" = CONST(false));
        }
        field(16662; "Reference Invoice No."; Code[20])
        {
            CaptionML = ENU = 'Reference Invoice No.',
                        ENN = 'Reference Invoice No.';
            DataClassification = ToBeClassified;
        }
        field(16663; "Without Bill Of Entry"; Boolean)
        {
            CaptionML = ENU = 'Without Bill Of Entry',
                        ENN = 'Without Bill Of Entry';
            DataClassification = ToBeClassified;
        }
        field(16664; "Amount Excl. GST"; Decimal)
        {
            CaptionML = ENU = 'Amount Excl. GST',
                        ENN = 'Amount Excl. GST';
            DataClassification = ToBeClassified;
        }
        field(16665; "GST TDS"; Boolean)
        {
            CaptionML = ENU = 'GST TDS',
                        ENN = 'GST TDS';
            DataClassification = ToBeClassified;
        }
        field(16666; "GST TDS/TCS %"; Decimal)
        {
            CaptionML = ENU = 'GST TDS/TCS %',
                        ENN = 'GST TDS/TCS %';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16667; "GST TDS/TCS Base Amount (LCY)"; Decimal)
        {
            CaptionML = ENU = 'GST TDS/TCS Base Amount (LCY)',
                        ENN = 'GST TDS/TCS Base Amount (LCY)';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16668; "GST TDS/TCS Amount (LCY)"; Decimal)
        {
            CaptionML = ENU = 'GST TDS/TCS Amount (LCY)',
                        ENN = 'GST TDS/TCS Amount (LCY)';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16669; "GST TCS"; Boolean)
        {
            CaptionML = ENU = 'GST TCS',
                        ENN = 'GST TCS';
            DataClassification = ToBeClassified;

            trigger OnValidate();
            var
                GSTGroup: Record "GST Group";
            begin
            end;
        }
        field(16670; "GST TCS State Code"; Code[10])
        {
            CaptionML = ENU = 'GST TCS State Code',
                        ENN = 'GST TCS State Code';
            DataClassification = ToBeClassified;
            TableRelation = State;
        }
        field(16671; "GST TDS/TCS Base Amount"; Decimal)
        {
            CaptionML = ENU = 'GST TDS/TCS Base Amount',
                        ENN = 'GST TDS/TCS Base Amount';
            DataClassification = ToBeClassified;
        }
        field(16680; "Supply Finish Date"; Option)
        {
            CaptionML = ENU = 'Supply Finish Date',
                        ENN = 'Supply Finish Date';
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = ' ,Before Rate Change,After Rate Change',
                              ENN = ' ,Before Rate Change,After Rate Change';
            OptionMembers = " ","Before Rate Change","After Rate Change";
        }
        field(16682; "Payment Date"; Option)
        {
            CaptionML = ENU = 'Payment Date',
                        ENN = 'Payment Date';
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = ' ,Before Rate Change,After Rate Change',
                              ENN = ' ,Before Rate Change,After Rate Change';
            OptionMembers = " ","Before Rate Change","After Rate Change";
        }
        field(16683; "Rate Change Applicable"; Boolean)
        {
            CaptionML = ENU = 'Rate Change Applicable',
                        ENN = 'Rate Change Applicable';
            DataClassification = ToBeClassified;
        }
        field(16684; "POS as Vendor State"; Boolean)
        {
            CaptionML = ENU = 'POS as Vendor State',
                        ENN = 'POS as Vendor State';
            DataClassification = ToBeClassified;
        }
        field(16685; "TDS Adjustment"; Boolean)
        {
            CaptionML = ENU = 'TDS Adjustment',
                        ENN = 'TDS Adjustment';
            DataClassification = ToBeClassified;
        }
        field(16686; "Exclude GST in TCS Base"; Boolean)
        {
            CaptionML = ENU = 'Exclude GST in TCS Base',
                        ENN = 'Exclude GST in TCS Base';
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                //CheckValidationforExclGSTTCSBase;
            end;
        }
        field(16687; "GST On Assessable Value"; Boolean)
        {
            CaptionML = ENU = 'GST On Assessable Value',
                        ENN = 'GST On Assessable Value';
            DataClassification = ToBeClassified;

            trigger OnValidate();
            var
                GSTGroup: Record "GST Group";
            begin
            end;
        }
        field(16688; "GST Assessable Value Sale(LCY)"; Decimal)
        {
            CaptionML = ENU = 'GST Assessable Value Sale(LCY)',
                        ENN = 'GST Assessable Value Sale(LCY)';
            DataClassification = ToBeClassified;
        }
        field(16689; "Provisional Entry"; Boolean)
        {
            CaptionML = ENU = 'Provisional Entry',
                        ENN = 'Provisional Entry';
            DataClassification = ToBeClassified;

            trigger OnValidate();
            var
                LineCnt: Integer;
            begin
            end;
        }
        field(16690; "Applied Provisional Entry"; Integer)
        {
            CaptionML = ENU = 'Applied Provisional Entry',
                        ENN = 'Applied Provisional Entry';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16691; "POS Out Of India"; Boolean)
        {
            CaptionML = ENU = 'POS Out Of India',
                        ENN = 'POS Out Of India';
            DataClassification = ToBeClassified;

            trigger OnValidate();
            var
                GenJournalLine: Record "Gen. Journal Line";
                GenJournalLine2: Record "Gen. Journal Line";
                ConfigType: Option Vendor,Customer;
                GSTVendorType: Option " ",Registered,Composite,Unregistered,Import,Exempted,SEZ;
                GSTCustType: Option " ",Registered,Unregistered,Export,"Deemed Export",Exempted,"SEZ Development","SEZ Unit";
            begin
            end;
        }
        field(16692; "Sales Amount"; Decimal)
        {
            CaptionML = ENU = 'Sales Amount',
                        ENN = 'Sales Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(60019; "Vendor Invoice Date"; Date)
        {
        }
        field(60061; "Sale Order No"; Code[20])
        {
            TableRelation = "Sales Header"."No.";
        }
        field(60062; "Sale invoice order no"; Code[20])
        {
            TableRelation = "Sales Invoice Header"."No.";
        }
        field(60063; "Customer Ord no"; Code[65])
        {
        }
        field(60064; "Payment Type"; Option)
        {
            OptionCaption = ',Supply Payment,AMC Amount,Final Payment,Inst.Payment,Advance,Receipt,Contra,Payment,Journal';
            OptionMembers = ,"Supply Payment","AMC Amount","Final Payment","Inst.Payment",Advance,Receipt,Contra,Payment,Journal;
        }
        field(60065; "Sale Invoice No"; Code[20])
        {
            TableRelation = "Sales Invoice Header"."No." WHERE("Order No." = FIELD("Sale Order No"));
        }
        field(60066; "Invoice no"; Code[10])
        {
        }
        field(60067; "Purchase Order No."; Code[30])
        {
            Enabled = false;
            TableRelation = "Purchase Header"."No." WHERE("Document Type" = FILTER(Order),
                                                           "Buy-from Vendor No." = FIELD("Account No."));
        }
        field(60068; "Amount Percentage"; Decimal)
        {
        }
        field(60069; "From Date"; Date)
        {
        }
        field(60070; "To Date"; Date)
        {
        }
        field(60071; "Validate Posting"; Boolean)
        {
        }
        field(60072; "Apply Entry No"; Integer)
        {

            trigger OnLookup();
            begin
                //code added by sreenivas

                //DIM1.0 Start
                //Code Commnet
                /*
                GL.MARKEDONLY(FALSE);
                
                JLD.RESET;
                JLD.SETRANGE(JLD."Journal Line No.","Line No.");
                JLD.SETRANGE(JLD."Journal Batch Name","Journal Batch Name");
                JLD.SETFILTER(JLD."Table ID",'81');
                JLD.SETFILTER(JLD."Dimension Code",'EMPLOYEE CODES');
                IF JLD.FIND('-') THEN
                BEGIN
                LED.SETRANGE(LED."Dimension Value Code",JLD."Dimension Value Code");
                LED.SETFILTER(LED."Table ID",'17');
                LED.SETFILTER(LED."Dimension Code",'EMPLOYEE CODES');//removed comment sgs
                IF LED.FIND('-') THEN
                REPEAT
                IF GL.GET(LED."Entry No.") THEN
                GL.MARK(TRUE);
                UNTIL LED.NEXT=0;
                END;
                 */
                GL.MarkedOnly(false);
                DimensionSetEntryGRec.Reset;
                DimensionSetEntryGRec.SetRange("Dimension Set ID", "Dimension Set ID");
                DimensionSetEntryGRec.SetRange("Dimension Code", 'EMPLOYEE CODES');
                if DimensionSetEntryGRec.FindFirst then
                    DimValue := DimensionSetEntryGRec."Dimension Value Code";

                DimensionSetEntryGRec.Reset;
                DimensionSetEntryGRec.SetRange("Dimension Code", 'EMPLOYEE CODES');
                DimensionSetEntryGRec.SetRange("Dimension Value Code", DimValue);
                if DimensionSetEntryGRec.FindSet then
                    repeat
                        //GLRec.RESET;
                        GLRec.SetRange("Dimension Set ID", DimensionSetEntryGRec."Dimension Set ID");
                        if GLRec.FindSet then
                            repeat
                                GL.Get(GLRec."Entry No.");
                                GL.Mark(true);
                            until GLRec.Next = 0;
                    until DimensionSetEntryGRec.Next = 0;
                //DIM1.0 End

                GL.MarkedOnly(true);

                GL.SetRange(GL."Posting Date", (20090401D), (20100331D));
                GL.SetFilter(GL."Document No.", 'CPV*|BPV*');
                GL.SetFilter(GL.Amount, '>0');
                if PAGE.RunModal(88888, GL) = ACTION::LookupOK then


                    /*
                    BEGIN

                    IF GL.MARK THEN
                    totamt+=GL.Amount;
                    END;
                    */


                "Apply Entry No" := GL."Entry No.";
                /*
                //"Apply Entry No":=totamt;    //code added after comparsion with 12nov db
                 */

            end;
        }
        field(60073; "DD/FDR No."; Code[20])
        {
            Description = 'Rev01';
        }
        field(60074; "Payment Through"; Option)
        {
            Description = 'Rev01';
            OptionCaption = '" ,Cheque,Cash,DD,FDR,RTGS,FTT,Credit-Card"';
            OptionMembers = " ",Cheque,Cash,DD,FDR,RTGS,FTT,"Credit-Card";
        }
        field(60075; "Tender No"; Code[20])
        {
            TableRelation = "Tender Header"."Tender No.";
        }
        field(60076; "Final Bill Payment"; Boolean)
        {
            Description = 'Added by Pranavi for SD Tracking';
        }
        field(60077; "Currency Amount"; Decimal)
        {
            Description = 'Added by Pranavi for foreign currency tracking';
        }
        field(60078; "Currency Rate"; Decimal)
        {
            Description = 'Added by Pranavi for foreign currency tracking';
        }
        field(60079; "Old Order"; Boolean)
        {
        }
        field(60080; Printed; Boolean)
        {
        }
        field(60081; Vertical; Option)
        {
            Description = 'Added by Vijaya for vertical expenditure';
            OptionCaption = '" ,Smart Signalling,Smart Cities,Smart Building,IOT,other,AMC"';
            OptionMembers = " ","Smart Signalling","Smart Cities","Smart Building",IOT,other,AMC;
        }
    }

    var
        "---B2B--": Integer;
        PH: Record "Purchase Header";
        GL: Record "G/L Entry";
        GL1: Record "G/L Entry";
        EntryArray: array[300] of Integer;
        i: Integer;
        j: Integer;
        totamt: Decimal;
        "-DIM1.0-": Integer;
        DimensionSetEntryGRec: Record "Dimension Set Entry";
        DimValue: Code[20];
        GLRec: Record "G/L Entry";
}

