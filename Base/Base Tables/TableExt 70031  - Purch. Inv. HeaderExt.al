tableextension 70031 PurchInvHeaderExt extends "Purch. Inv. Header"
{


    fields
    {



<<<<<<< HEAD
        //Unsupported feature: Change NotBlank on ""Pay-to Vendor No."(Field 4)". Please convert manually.


        //Unsupported feature: Change ValidateTableRelation on ""Pay-to City"(Field 9)". Please convert manually.


        //Unsupported feature: Change TestTableRelation on ""Pay-to City"(Field 9)". Please convert manually.


        //Unsupported feature: Change TableRelation on ""Ship-to Code"(Field 12)". Please convert manually.


        //Unsupported feature: Change ValidateTableRelation on ""Ship-to City"(Field 17)". Please convert manually.


        //Unsupported feature: Change TestTableRelation on ""Ship-to City"(Field 17)". Please convert manually.


        //Unsupported feature: Change TableRelation on ""Location Code"(Field 28)". Please convert manually.


        //Unsupported feature: Change TableRelation on ""Shortcut Dimension 1 Code"(Field 29)". Please convert manually.


        //Unsupported feature: Change TableRelation on ""Shortcut Dimension 2 Code"(Field 30)". Please convert manually.


        //Unsupported feature: Change Editable on ""Vendor Posting Group"(Field 31)". Please convert manually.


        //Unsupported feature: Change Editable on ""Currency Code"(Field 32)". Please convert manually.


        //Unsupported feature: Change TableRelation on ""Purchaser Code"(Field 43)". Please convert manually.


        //Unsupported feature: Change AccessByPermission on ""Order No."(Field 44)". Please convert manually.


        //Unsupported feature: Change CalcFormula on "Comment(Field 46)". Please convert manually.


        //Unsupported feature: Change Editable on "Comment(Field 46)". Please convert manually.


        //Unsupported feature: Change Editable on ""No. Printed"(Field 47)". Please convert manually.


        //Unsupported feature: Change OptionString on ""Applies-to Doc. Type"(Field 52)". Please convert manually.


        //Unsupported feature: Change TableRelation on ""Bal. Account No."(Field 55)". Please convert manually.


        //Unsupported feature: Change CalcFormula on "Amount(Field 60)". Please convert manually.


        //Unsupported feature: Change Editable on "Amount(Field 60)". Please convert manually.


        //Unsupported feature: Change CalcFormula on ""Amount Including VAT"(Field 61)". Please convert manually.


        //Unsupported feature: Change Editable on ""Amount Including VAT"(Field 61)". Please convert manually.


        //Unsupported feature: Change TableRelation on ""VAT Country/Region Code"(Field 78)". Please convert manually.


        //Unsupported feature: Change ValidateTableRelation on ""Buy-from City"(Field 83)". Please convert manually.


        //Unsupported feature: Change TestTableRelation on ""Buy-from City"(Field 83)". Please convert manually.


        //Unsupported feature: Change ValidateTableRelation on ""Pay-to Post Code"(Field 85)". Please convert manually.


        //Unsupported feature: Change TestTableRelation on ""Pay-to Post Code"(Field 85)". Please convert manually.


        //Unsupported feature: Change TableRelation on ""Pay-to Country/Region Code"(Field 87)". Please convert manually.


        //Unsupported feature: Change ValidateTableRelation on ""Buy-from Post Code"(Field 88)". Please convert manually.


        //Unsupported feature: Change TestTableRelation on ""Buy-from Post Code"(Field 88)". Please convert manually.


        //Unsupported feature: Change TableRelation on ""Buy-from Country/Region Code"(Field 90)". Please convert manually.


        //Unsupported feature: Change ValidateTableRelation on ""Ship-to Post Code"(Field 91)". Please convert manually.


        //Unsupported feature: Change TestTableRelation on ""Ship-to Post Code"(Field 91)". Please convert manually.


        //Unsupported feature: Change TableRelation on ""Ship-to Country/Region Code"(Field 93)". Please convert manually.


        //Unsupported feature: Change OptionString on ""Bal. Account Type"(Field 94)". Please convert manually.


        //Unsupported feature: Change TableRelation on ""Order Address Code"(Field 95)". Please convert manually.


        //Unsupported feature: Change Editable on ""No. Series"(Field 108)". Please convert manually.


        //Unsupported feature: Change TestTableRelation on ""User ID"(Field 112)". Please convert manually.


        //Unsupported feature: Change Editable on ""Quote No."(Field 151)". Please convert manually.


        //Unsupported feature: Change Numeric on ""Payment Reference"(Field 171)". Please convert manually.


        //Unsupported feature: Change Editable on ""Dimension Set ID"(Field 480)". Please convert manually.


        //Unsupported feature: Change CalcFormula on "Closed(Field 1302)". Please convert manually.


        //Unsupported feature: Change Editable on "Closed(Field 1302)". Please convert manually.


        //Unsupported feature: Change CalcFormula on ""Remaining Amount"(Field 1303)". Please convert manually.


        //Unsupported feature: Change Editable on ""Remaining Amount"(Field 1303)". Please convert manually.


        //Unsupported feature: Change TestTableRelation on ""Vendor Ledger Entry No."(Field 1304)". Please convert manually.


        //Unsupported feature: Change Editable on ""Vendor Ledger Entry No."(Field 1304)". Please convert manually.


        //Unsupported feature: Change CalcFormula on ""Invoice Discount Amount"(Field 1305)". Please convert manually.


        //Unsupported feature: Change Editable on ""Invoice Discount Amount"(Field 1305)". Please convert manually.


        //Unsupported feature: Change Editable on "Cancelled(Field 1310)". Please convert manually.


        //Unsupported feature: Change Editable on "Corrective(Field 1311)". Please convert manually.


        //Unsupported feature: CodeModification on ""Applies-to Doc. No."(Field 53).OnLookup". Please convert manually.

        //trigger  No();
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        VendLedgEntry.SETCURRENTKEY("Document No.");
        VendLedgEntry.SETRANGE("Document Type","Applies-to Doc. Type");
        VendLedgEntry.SETRANGE("Document No.","Applies-to Doc. No.");
        PAGE.RUN(0,VendLedgEntry);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        VendLedgEntry.SetCurrentKey("Document No.");
        VendLedgEntry.SetRange("Document Type","Applies-to Doc. Type");
        VendLedgEntry.SetRange("Document No.","Applies-to Doc. No.");
        PAGE.Run(0,VendLedgEntry);
        */
        //end;

        //Unsupported feature: PropertyDeletion on "Cancelled(Field 1310)". Please convert manually.


        //Unsupported feature: PropertyDeletion on "Corrective(Field 1311)". Please convert manually.

        field(13701; "Assessee Code"; Code[10])
        {
            CaptionML = ENU = 'Assessee Code',
                        ENN = 'Assessee Code';
            DataClassification = CustomerContent;
            TableRelation = "Assessee Code";
        }
        field(13712; "Excise Bus. Posting Group"; Code[10])
        {
            CaptionML = ENU = 'Excise Bus. Posting Group',
                        ENN = 'Excise Bus. Posting Group';
            DataClassification = CustomerContent;
            TableRelation = "Excise Bus. Posting Group";
        }
        field(13716; "Amount to Vendor"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Purch. Inv. Line".Amount WHERE("Document No." = FIELD("No.")));
            CaptionML = ENU = 'Amount to Vendor',
                        ENN = 'Amount to Vendor';
            Editable = false;
            FieldClass = FlowField;
        }
        field(13723; "Form Code"; Code[10])
        {
            CaptionML = ENU = 'Form Code',
                        ENN = 'Form Code';
            DataClassification = CustomerContent;
            TableRelation = IF ("C Form" = CONST(false)) "State Forms"."Form Code" WHERE(State = FIELD(State),
                                                                                        "Transit Document" = CONST(false))
            ELSE
            IF ("C Form" = CONST(true)) "Form Codes".Code WHERE("C Form" = CONST(true));

            trigger OnLookup();
            begin
                /*IF "C Form" THEN
                  FormCodes.LookupFormCodes("Form Code")
                ELSE
                  StateForms.LookupStateForm(State,"Form Code")
                  */

            end;
        }
        field(13724; "Form No."; Code[10])
        {
            CaptionML = ENU = 'Form No.',
                        ENN = 'Form No.';
            DataClassification = CustomerContent;
            TableRelation = IF ("C Form" = CONST(false)) "Tax Forms Details"."Form No." WHERE("Form Code" = FIELD("Form Code"),
                                                                                             Issued = CONST(false),
                                                                                             State = FIELD(State))
            ELSE
            IF ("C Form" = CONST(true)) "Tax Forms Details"."Form No." WHERE("Form Code" = FIELD("Form Code"),
                                                                                                                                                                  Issued = CONST(false));
        }
        field(13759; "Transit Document"; Boolean)
        {
            CaptionML = ENU = 'Transit Document',
                        ENN = 'Transit Document';
            DataClassification = CustomerContent;
        }
        field(13760; "LC No."; Code[20])
        {
            CaptionML = ENU = 'LC No.',
                        ENN = 'LC No.';
            DataClassification = CustomerContent;
            TableRelation = "LC Detail"."No." WHERE("Transaction Type" = CONST(Purchase),
                                                     "Issued To/Received From" = FIELD("Buy-from Vendor No."),
                                                     Closed = CONST(false),
                                                     Released = CONST(true));
        }
        field(13761; State; Code[10])
        {
            CaptionML = ENU = 'State',
                        ENN = 'State';
            DataClassification = CustomerContent;
            TableRelation = State;
        }
        field(13790; Structure; Code[10])
        {
            CaptionML = ENU = 'Structure',
                        ENN = 'Structure';
            DataClassification = CustomerContent;
            TableRelation = "Structure Header";
        }
        field(16375; "Vendor Shipment Date"; Date)
        {
            CaptionML = ENU = 'Vendor Shipment Date',
                        ENN = 'Vendor Shipment Date';
            DataClassification = CustomerContent;
        }
        field(16376; "C Form"; Boolean)
        {
            CaptionML = ENU = 'C Form',
                        ENN = 'C Form';
            DataClassification = CustomerContent;
        }
        field(16377; "Consignment Note No."; Code[20])
        {
            CaptionML = ENU = 'Consignment Note No.',
                        ENN = 'Consignment Note No.';
            DataClassification = CustomerContent;
        }
        field(16378; "Declaration Form (GTA)"; Boolean)
        {
            CaptionML = ENU = 'Declaration Form (GTA)',
                        ENN = 'Declaration Form (GTA)';
            DataClassification = CustomerContent;
        }
        field(16379; "Service Type (Rev. Chrg.)"; Option)
        {
            CaptionML = ENU = 'Service Type (Rev. Chrg.)',
                        ENN = 'Service Type (Rev. Chrg.)';
            DataClassification = CustomerContent;
            OptionCaptionML = ENU = ' ,Inward,Outward Stock Transfer,Outward Input Service,Outward',
                              ENN = ' ,Inward,Outward Stock Transfer,Outward Input Service,Outward';
            OptionMembers = " ",Inward,"Outward Stock Transfer","Outward Input Service",Outward;
        }
        field(16500; "Manufacturer E.C.C. No."; Code[20])
        {
            CaptionML = ENU = 'Manufacturer E.C.C. No.',
                        ENN = 'Manufacturer E.C.C. No.';
            DataClassification = CustomerContent;
        }
        field(16501; "Manufacturer Name"; Text[30])
        {
            CaptionML = ENU = 'Manufacturer Name',
                        ENN = 'Manufacturer Name';
            DataClassification = CustomerContent;
        }
        field(16502; "Manufacturer Address"; Text[30])
        {
            CaptionML = ENU = 'Manufacturer Address',
                        ENN = 'Manufacturer Address';
            DataClassification = CustomerContent;
        }
        field(16503; Trading; Boolean)
        {
            CaptionML = ENU = 'Trading',
                        ENN = 'Trading';
            DataClassification = CustomerContent;
        }
        field(16504; "Transaction No. Serv. Tax"; Integer)
        {
            CaptionML = ENU = 'Transaction No. Serv. Tax',
                        ENN = 'Transaction No. Serv. Tax';
            DataClassification = CustomerContent;
        }
        field(16522; "Service Tax Rounding Precision"; Decimal)
        {
            CaptionML = ENU = 'Service Tax Rounding Precision',
                        ENN = 'Service Tax Rounding Precision';
            DataClassification = CustomerContent;
        }
        field(16523; "Service Tax Rounding Type"; Option)
        {
            CaptionML = ENU = 'Service Tax Rounding Type',
                        ENN = 'Service Tax Rounding Type';
            DataClassification = CustomerContent;
            OptionCaptionML = ENU = 'Nearest,Up,Down',
                              ENN = 'Nearest,Up,Down';
            OptionMembers = Nearest,Up,Down;
        }
        field(16524; PoT; Boolean)
        {
            CaptionML = ENU = 'PoT',
                        ENN = 'PoT';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(16601; "Nature of Supply"; Option)
        {
            CaptionML = ENU = 'Nature of Supply',
                        ENN = 'Nature of Supply';
            DataClassification = CustomerContent;
            Editable = false;
            OptionCaptionML = ENU = 'B2B,B2C',
                              ENN = 'B2B,B2C';
            OptionMembers = B2B,B2C;
        }
        field(16602; "Bill of Entry No."; Text[20])
        {
            CaptionML = ENU = 'Bill of Entry No.',
                        ENN = 'Bill of Entry No.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(16603; "Bill of Entry Date"; Date)
        {
            CaptionML = ENU = 'Bill of Entry Date',
                        ENN = 'Bill of Entry Date';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(16604; "Bill of Entry Value"; Decimal)
        {
            CaptionML = ENU = 'Bill of Entry Value',
                        ENN = 'Bill of Entry Value';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(16609; "GST Vendor Type"; Option)
        {
            CaptionML = ENU = 'GST Vendor Type',
                        ENN = 'GST Vendor Type';
            DataClassification = CustomerContent;
            Editable = false;
            OptionCaptionML = ENU = ' ,Registered,Composite,Unregistered,Import,Exempted,SEZ',
                              ENN = ' ,Registered,Composite,Unregistered,Import,Exempted,SEZ';
            OptionMembers = " ",Registered,Composite,Unregistered,Import,Exempted,SEZ;
        }
        field(16610; "Associated Enterprises"; Boolean)
        {
            CaptionML = ENU = 'Associated Enterprises',
                        ENN = 'Associated Enterprises';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(16611; "Invoice Type"; Option)
        {
            CaptionML = ENU = 'Invoice Type',
                        ENN = 'Invoice Type';
            DataClassification = CustomerContent;
            Editable = false;
            OptionCaptionML = ENU = ' ,Self Invoice,Debit Note,Supplementary,Non-GST',
                              ENN = ' ,Self Invoice,Debit Note,Supplementary,Non-GST';
            OptionMembers = " ","Self Invoice","Debit Note",Supplementary,"Non-GST";
        }
        field(16612; "GST Inv. Rounding Precision"; Decimal)
        {
            CaptionML = ENU = 'GST Inv. Rounding Precision',
                        ENN = 'GST Inv. Rounding Precision';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(16613; "GST Inv. Rounding Type"; Option)
        {
            CaptionML = ENU = 'GST Inv. Rounding Type',
                        ENN = 'GST Inv. Rounding Type';
            DataClassification = CustomerContent;
            Editable = false;
            OptionCaptionML = ENU = 'Nearest,Up,Down',
                              ENN = 'Nearest,Up,Down';
            OptionMembers = Nearest,Up,Down;
        }
        field(16623; "Supply Finish Date"; Option)
        {
            CaptionML = ENU = 'Supply Finish Date',
                        ENN = 'Supply Finish Date';
            DataClassification = CustomerContent;
            Editable = false;
            OptionCaptionML = ENU = ' ,Before Rate Change,After Rate Change',
                              ENN = ' ,Before Rate Change,After Rate Change';
            OptionMembers = " ","Before Rate Change","After Rate Change";
        }
        field(16624; "Payment Date"; Option)
        {
            CaptionML = ENU = 'Payment Date',
                        ENN = 'Payment Date';
            DataClassification = CustomerContent;
            Editable = false;
            OptionCaptionML = ENU = ' ,Before Rate Change,After Rate Change',
                              ENN = ' ,Before Rate Change,After Rate Change';
            OptionMembers = " ","Before Rate Change","After Rate Change";
        }
        field(16625; "Rate Change Applicable"; Boolean)
        {
            CaptionML = ENU = 'Rate Change Applicable',
                        ENN = 'Rate Change Applicable';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(16626; "GST Reason Type"; Option)
        {
            CaptionML = ENU = 'GST Reason Type',
                        ENN = 'GST Reason Type';
            DataClassification = CustomerContent;
            OptionCaptionML = ENU = ' ,Sales Return,Post Sale Discount,Deficiency in Service,Correction in Invoice,Change in POS,Finalization of Provisional Assessment,Others',
                              ENN = ' ,Sales Return,Post Sale Discount,Deficiency in Service,Correction in Invoice,Change in POS,Finalization of Provisional Assessment,Others';
            OptionMembers = " ","Sales Return","Post Sale Discount","Deficiency in Service","Correction in Invoice","Change in POS","Finalization of Provisional Assessment",Others;
        }
        field(16627; "GST Input Service Distribution"; Boolean)
        {
            CaptionML = ENU = 'GST Input Service Distribution',
                        ENN = 'GST Input Service Distribution';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(16628; "RCM Exempt"; Boolean)
        {
            CaptionML = ENU = 'RCM Exempt',
                        ENN = 'RCM Exempt';
            DataClassification = CustomerContent;
        }
        field(16629; "GST Order Address State"; Code[10])
        {
            CaptionML = ENU = 'GST Order Address State',
                        ENN = 'GST Order Address State';
            DataClassification = CustomerContent;
        }
        field(16630; "Vendor GST Reg. No."; Code[15])
        {
            CaptionML = ENU = 'Vendor GST Reg. No.',
                        ENN = 'Vendor GST Reg. No.';
            DataClassification = CustomerContent;
        }
        field(16631; "Location State Code"; Code[10])
        {
            CaptionML = ENU = 'Location State Code',
                        ENN = 'Location State Code';
            DataClassification = CustomerContent;
            TableRelation = State;
        }
        field(16632; "Location GST Reg. No."; Code[15])
        {
            CaptionML = ENU = 'Location GST Reg. No.',
                        ENN = 'Location GST Reg. No.';
            DataClassification = CustomerContent;
            TableRelation = "GST Registration Nos.";
        }
        field(16633; "Order Address GST Reg. No."; Code[15])
        {
            CaptionML = ENU = 'Order Address GST Reg. No.',
                        ENN = 'Order Address GST Reg. No.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(16634; "Bill to-Location(POS)"; Code[10])
        {
            CaptionML = ENU = 'Bill to-Location(POS)',
                        ENN = 'Bill to-Location(POS)';
            DataClassification = CustomerContent;
        }
        field(16635; "Vehicle No."; Code[20])
        {
            CaptionML = ENU = 'Vehicle No.',
                        ENN = 'Vehicle No.';
            DataClassification = CustomerContent;
        }
        field(16636; "Shipping Agent Code"; Code[10])
        {
            CaptionML = ENU = 'Shipping Agent Code',
                        ENN = 'Shipping Agent Code';
            DataClassification = CustomerContent;
            TableRelation = "Shipping Agent";
        }
        field(16637; "Shipping Agent Service Code"; Code[10])
        {
            CaptionML = ENU = 'Shipping Agent Service Code',
                        ENN = 'Shipping Agent Service Code';
            DataClassification = CustomerContent;
            TableRelation = "Shipping Agent Services";
        }
        field(16638; "Distance (Km)"; Decimal)
        {
            CaptionML = ENU = 'Distance (Km)',
                        ENN = 'Distance (Km)';
            DataClassification = CustomerContent;
        }
        field(16639; "Vehicle Type"; Option)
        {
            CaptionML = ENU = 'Vehicle Type',
                        ENN = 'Vehicle Type';
            DataClassification = CustomerContent;
            OptionCaptionML = ENU = ' ,Regular,ODC',
                              ENN = ' ,Regular,ODC';
            OptionMembers = " ",Regular,ODC;
        }
        field(16640; "Reference Invoice No."; Code[20])
        {
            CaptionML = ENU = 'Reference Invoice No.',
                        ENN = 'Reference Invoice No.';
            DataClassification = CustomerContent;
        }
        field(16641; "Without Bill Of Entry"; Boolean)
        {
            CaptionML = ENU = 'Without Bill Of Entry',
                        ENN = 'Without Bill Of Entry';
            DataClassification = CustomerContent;
        }
        field(16642; "E-Way Bill No."; Text[50])
        {
            CaptionML = ENU = 'E-Way Bill No.',
                        ENN = 'E-Way Bill No.';
            DataClassification = CustomerContent;
        }
        field(16643; "POS as Vendor State"; Boolean)
        {
            CaptionML = ENU = 'POS as Vendor State',
                        ENN = 'POS as Vendor State';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(16644; "POS Out Of India"; Boolean)
        {
            CaptionML = ENU = 'POS Out Of India',
                        ENN = 'POS Out Of India';
            DataClassification = CustomerContent;
            Editable = false;
        }
=======
>>>>>>> 92e9343b97066cd41289b021406784be0d52ea8b
        field(50000; "MSPT Date"; Date)
        {
            Description = 'MSPT1.0';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50001; "MSPT Code"; Code[20])
        {
            Description = 'MSPT1.0';
            Editable = false;
            TableRelation = "MSPT Header".Code WHERE(Status = CONST(Released));
            DataClassification = CustomerContent;

            trigger OnValidate();
            var
                MSPTHeader: Record "MSPT Header";
                "MSPT Details": Record "MSPT Line";
            begin
            end;
        }
        field(50002; "MSPT Applicable at Line Level"; Boolean)
        {
            Description = 'MSPT1.0';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(60001; "Vendor Excise Invoice No."; Code[30])
        {
            Description = 'B2B';
            Editable = true;
            DataClassification = CustomerContent;
        }
        field(60002; "Vend. Excise Inv. Date"; Date)
        {
            Description = 'B2B';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(60003; "Cancel Short Close"; Option)
        {
            Description = 'B2B';
            OptionCaption = '" ,Cancelled,Short Closed"';
            OptionMembers = " ",Cancelled,"Short Closed";
            DataClassification = CustomerContent;
        }
        field(60004; "RFQ No."; Code[20])
        {
            Description = 'B2B';
            TableRelation = "Service Invoice Line Archive"."Document No.";
            DataClassification = CustomerContent;
        }
        field(60005; Make; Text[50])
        {
            Description = 'B2B';
            DataClassification = CustomerContent;
        }
        field(60006; "Packint Type"; Text[50])
        {
            Description = 'B2B';
            DataClassification = CustomerContent;
        }
        field(60007; Verification; Text[50])
        {
            Description = 'B2B';
            DataClassification = CustomerContent;
        }
        field(60008; "Invoiced Amount"; Decimal)
        {
            CalcFormula = Sum("Purch. Inv. Line".Amount WHERE("Document No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(60019; "Vendor Invoice Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(60079; "Order (Digits)"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(60091; "OLD Dim Set ID"; Integer)
        {
            Description = 'added  by sujani for Dimension issue clearance (B2B Assistance)';
            Editable = false;
            TableRelation = "Dimension Set Entry Backup2"."Dimension Set ID" WHERE("Dimension Set ID" = FIELD("OLD Dim Set ID"));
            DataClassification = CustomerContent;

            trigger OnLookup();
            begin
                //ShowDimensionsOLD;
            end;
        }
        field(60092; "Dimension Corrected"; Boolean)
        {
            Description = 'added  by sujani for Dimension issue clearance (B2B Assistance)';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(60095; "Actual Invoiced Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(60096; "Additional Duty Value"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(60097; "Type of Supplier"; Option)
        {
            OptionCaption = '" ,Manufacturer,First Stage Dealer,Second Stage Dealer,Importer,Trader,Authorized distributor"';
            OptionMembers = " ",Manufacturer,"First Stage Dealer","Second Stage Dealer",Importer,Trader,"Authorized distributor";
            DataClassification = CustomerContent;
        }
        field(60098; "Excise Not to Consider"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(60099; "C Status"; Enum "Purch Line Enum8")
        {
<<<<<<< HEAD
            OptionMembers = " ",ToBeSent,Sent;
            DataClassification = CustomerContent;
=======
            //OptionMembers = " ",ToBeSent,Sent;
>>>>>>> 92e9343b97066cd41289b021406784be0d52ea8b
        }
        field(60100; "Vehicle Number"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(60101; "Transporter Name"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(60102; "C-Form Number"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(60103; "C-Form Issue Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(60104; "Excise Claimed Date"; Date)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(60105; ExciseRemarks; Enum "Purch Line Enum4")
        {
<<<<<<< HEAD
            OptionMembers = " "," Claimed","Bill Not rcvd"," Need To Claim"," Not Known"," Need Not Claim";
            DataClassification = CustomerContent;
=======
            // OptionMembers = " "," Claimed","Bill Not rcvd"," Need To Claim"," Not Known"," Need Not Claim";
>>>>>>> 92e9343b97066cd41289b021406784be0d52ea8b
        }
        field(60122; "Tarrif Heading No"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(60127; RCM_Paid_Date; Date)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(70001; "% of input for Claimed Month"; Enum "Purch Line Enum7")
        {
            Description = 'added by vishnu Priya for the GST Claiming  Purpose';
<<<<<<< HEAD
            OptionCaption = '" ,20,10,5"';
            OptionMembers = " ","20","10","5";
            DataClassification = CustomerContent;
        }
    }
    keys
    {
=======
>>>>>>> 92e9343b97066cd41289b021406784be0d52ea8b

        }
    }


    var
        USER: Record User;
        Body: Text[250];
        Mail_From: Text[250];
        Mail_To: Text[250];
        Mail: Codeunit Mail;
        Subject: Text[250];
}

