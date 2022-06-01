tableextension 70027 SalesCrMemoHeaderExt extends "Sales Cr.Memo Header"
{


    fields
    {


<<<<<<< HEAD

        //Unsupported feature: Change NotBlank on ""Bill-to Customer No."(Field 4)". Please convert manually.


        //Unsupported feature: Change ValidateTableRelation on ""Bill-to City"(Field 9)". Please convert manually.


        //Unsupported feature: Change TestTableRelation on ""Bill-to City"(Field 9)". Please convert manually.


        //Unsupported feature: Change TableRelation on ""Ship-to Code"(Field 12)". Please convert manually.


        //Unsupported feature: Change ValidateTableRelation on ""Ship-to City"(Field 17)". Please convert manually.


        //Unsupported feature: Change TestTableRelation on ""Ship-to City"(Field 17)". Please convert manually.


        //Unsupported feature: Change TableRelation on ""Location Code"(Field 28)". Please convert manually.


        //Unsupported feature: Change TableRelation on ""Shortcut Dimension 1 Code"(Field 29)". Please convert manually.


        //Unsupported feature: Change TableRelation on ""Shortcut Dimension 2 Code"(Field 30)". Please convert manually.


        //Unsupported feature: Change Editable on ""Customer Posting Group"(Field 31)". Please convert manually.


        //Unsupported feature: Change Editable on ""Currency Code"(Field 32)". Please convert manually.


        //Unsupported feature: Change TableRelation on ""Salesperson Code"(Field 43)". Please convert manually.


        //Unsupported feature: Change CalcFormula on "Comment(Field 46)". Please convert manually.


        //Unsupported feature: Change Editable on "Comment(Field 46)". Please convert manually.


        //Unsupported feature: Change Editable on ""No. Printed"(Field 47)". Please convert manually.


        //Unsupported feature: Change OptionString on ""Applies-to Doc. Type"(Field 52)". Please convert manually.


        //Unsupported feature: Change TableRelation on ""Bal. Account No."(Field 55)". Please convert manually.


        //Unsupported feature: Change CalcFormula on "Amount(Field 60)". Please convert manually.


        //Unsupported feature: Change Editable on "Amount(Field 60)". Please convert manually.


        //Unsupported feature: Change CalcFormula on ""Amount Including VAT"(Field 61)". Please convert manually.


        //Unsupported feature: Change Editable on ""Amount Including VAT"(Field 61)". Please convert manually.


        //Unsupported feature: Change Data type on ""Transport Method"(Field 77)". Please convert manually.


        //Unsupported feature: Change TableRelation on ""VAT Country/Region Code"(Field 78)". Please convert manually.


        //Unsupported feature: Change ValidateTableRelation on ""Sell-to City"(Field 83)". Please convert manually.


        //Unsupported feature: Change TestTableRelation on ""Sell-to City"(Field 83)". Please convert manually.


        //Unsupported feature: Change ValidateTableRelation on ""Bill-to Post Code"(Field 85)". Please convert manually.


        //Unsupported feature: Change TestTableRelation on ""Bill-to Post Code"(Field 85)". Please convert manually.


        //Unsupported feature: Change TableRelation on ""Bill-to Country/Region Code"(Field 87)". Please convert manually.


        //Unsupported feature: Change ValidateTableRelation on ""Sell-to Post Code"(Field 88)". Please convert manually.


        //Unsupported feature: Change TestTableRelation on ""Sell-to Post Code"(Field 88)". Please convert manually.


        //Unsupported feature: Change TableRelation on ""Sell-to Country/Region Code"(Field 90)". Please convert manually.


        //Unsupported feature: Change ValidateTableRelation on ""Ship-to Post Code"(Field 91)". Please convert manually.


        //Unsupported feature: Change TestTableRelation on ""Ship-to Post Code"(Field 91)". Please convert manually.


        //Unsupported feature: Change TableRelation on ""Ship-to Country/Region Code"(Field 93)". Please convert manually.


        //Unsupported feature: Change OptionString on ""Bal. Account Type"(Field 94)". Please convert manually.


        //Unsupported feature: Change Editable on ""No. Series"(Field 108)". Please convert manually.


        //Unsupported feature: Change TestTableRelation on ""User ID"(Field 112)". Please convert manually.


        //Unsupported feature: Change Editable on ""Dimension Set ID"(Field 480)". Please convert manually.


        //Unsupported feature: Change OptionString on ""Document Exchange Status"(Field 711)". Please convert manually.


        //Unsupported feature: Change CalcFormula on "Paid(Field 1302)". Please convert manually.


        //Unsupported feature: Change Editable on "Paid(Field 1302)". Please convert manually.


        //Unsupported feature: Change CalcFormula on ""Remaining Amount"(Field 1303)". Please convert manually.


        //Unsupported feature: Change Editable on ""Remaining Amount"(Field 1303)". Please convert manually.


        //Unsupported feature: Change TestTableRelation on ""Cust. Ledger Entry No."(Field 1304)". Please convert manually.


        //Unsupported feature: Change Editable on ""Cust. Ledger Entry No."(Field 1304)". Please convert manually.


        //Unsupported feature: Change CalcFormula on ""Invoice Discount Amount"(Field 1305)". Please convert manually.


        //Unsupported feature: Change Editable on ""Invoice Discount Amount"(Field 1305)". Please convert manually.


        //Unsupported feature: Change Editable on "Cancelled(Field 1310)". Please convert manually.


        //Unsupported feature: Change Editable on "Corrective(Field 1311)". Please convert manually.


        //Unsupported feature: Change AccessByPermission on ""Return Order No."(Field 6601)". Please convert manually.


        //Unsupported feature: CodeModification on ""Applies-to Doc. No."(Field 53).OnLookup". Please convert manually.

        //trigger  No();
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CustLedgEntry.SETCURRENTKEY("Document No.");
        CustLedgEntry.SETRANGE("Document Type","Applies-to Doc. Type");
        CustLedgEntry.SETRANGE("Document No.","Applies-to Doc. No.");
        PAGE.RUN(0,CustLedgEntry);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CustLedgEntry.SetCurrentKey("Document No.");
        CustLedgEntry.SetRange("Document Type","Applies-to Doc. Type");
        CustLedgEntry.SetRange("Document No.","Applies-to Doc. No.");
        PAGE.Run(0,CustLedgEntry);
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
        field(13706; "Excise Bus. Posting Group"; Code[10])
        {
            CaptionML = ENU = 'Excise Bus. Posting Group',
                        ENN = 'Excise Bus. Posting Group';
            DataClassification = CustomerContent;
            TableRelation = "Excise Bus. Posting Group";
        }
        field(13731; "Amount to Customer"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Sales Cr.Memo Line"."Amount To Customer" WHERE("Document No." = FIELD("No.")));
            CaptionML = ENU = 'Amount to Customer',
                        ENN = 'Amount to Customer';
            Editable = false;
            FieldClass = FlowField;
        }
        field(13736; "Bill to Customer State"; Code[10])
        {
            CaptionML = ENU = 'Bill to Customer State',
                        ENN = 'Bill to Customer State';
            DataClassification = CustomerContent;
            TableRelation = State;
        }
        field(13737; "Form Code"; Code[10])
        {
            CaptionML = ENU = 'Form Code',
                        ENN = 'Form Code';
            DataClassification = CustomerContent;
            TableRelation = "State Forms"."Form Code" WHERE(State = FIELD(State),
                                                             "Transit Document" = CONST(false));
        }
        field(13738; "Form No."; Code[20])
        {
            CaptionML = ENU = 'Form No.',
                        ENN = 'Form No.';
            DataClassification = CustomerContent;
        }
        field(13751; "Transit Document"; Boolean)
        {
            CaptionML = ENU = 'Transit Document',
                        ENN = 'Transit Document';
            DataClassification = CustomerContent;
        }
        field(13752; State; Code[10])
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

            trigger OnValidate();
            var
                StrDetails: Record "Structure Details";
                StrOrderDetails: Record "Structure Order Details";
                StrOrderLines: Record "Structure Order Line Details";
                SaleLines: Record "Sales Line";
            begin
            end;
        }
        field(16501; Trading; Boolean)
        {
            CaptionML = ENU = 'Trading',
                        ENN = 'Trading';
            DataClassification = CustomerContent;
        }
        field(16502; "Transaction No. Serv. Tax"; Integer)
        {
            CaptionML = ENU = 'Transaction No. Serv. Tax',
                        ENN = 'Transaction No. Serv. Tax';
            DataClassification = CustomerContent;
        }
        field(16503; "Re-Dispatch"; Boolean)
        {
            CaptionML = ENU = 'Re-Dispatch',
                        ENN = 'Re-Dispatch';
            DataClassification = CustomerContent;
        }
        field(16504; "Return Re-Dispatch Rcpt. No."; Code[20])
        {
            CaptionML = ENU = 'Return Re-Dispatch Rcpt. No.',
                        ENN = 'Return Re-Dispatch Rcpt. No.';
            DataClassification = CustomerContent;
            TableRelation = "Return Receipt Line"."Document No." WHERE("Sell-to Customer No." = FIELD("Sell-to Customer No."));
        }
        field(16508; "Price Inclusive of Taxes"; Boolean)
        {
            CaptionML = ENU = 'Price Inclusive of Taxes',
                        ENN = 'Price Inclusive of Taxes';
            Editable = false;
            FieldClass = FlowField;
        }
        field(16509; "Calc. Inv. Discount (%)"; Boolean)
        {
            CaptionML = ENU = 'Calc. Inv. Discount (%)',
                        ENN = 'Calc. Inv. Discount (%)';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(16513; "Vehicle No."; Code[20])
        {
            CaptionML = ENU = 'Vehicle No.',
                        ENN = 'Vehicle No.';
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
        field(16524; "Sales Return Type"; Option)
        {
            CaptionML = ENU = 'Sales Return Type',
                        ENN = 'Sales Return Type';
            DataClassification = CustomerContent;
            OptionCaptionML = ENU = ' ,Sales Cancellation',
                              ENN = ' ,Sales Cancellation';
            OptionMembers = " ","Sales Cancellation";
        }
        field(16601; "Nature of Supply"; Option)
        {
            CaptionML = ENU = 'Nature of Supply',
                        ENN = 'Nature of Supply';
            DataClassification = CustomerContent;
            OptionCaptionML = ENU = 'B2B,B2C',
                              ENN = 'B2B,B2C';
            OptionMembers = B2B,B2C;
        }
        field(16602; "GST Customer Type"; Option)
        {
            CaptionML = ENU = 'GST Customer Type',
                        ENN = 'GST Customer Type';
            DataClassification = CustomerContent;
            OptionCaptionML = ENU = ' ,Registered,Unregistered,Export,Deemed Export,Exempted,SEZ Development,SEZ Unit',
                              ENN = ' ,Registered,Unregistered,Export,Deemed Export,Exempted,SEZ Development,SEZ Unit';
            OptionMembers = " ",Registered,Unregistered,Export,"Deemed Export",Exempted,"SEZ Development","SEZ Unit";
        }
        field(16603; "GST Without Payment of Duty"; Boolean)
        {
            CaptionML = ENU = 'GST Without Payment of Duty',
                        ENN = 'GST Without Payment of Duty';
            DataClassification = CustomerContent;
        }
        field(16605; "Invoice Type"; Option)
        {
            CaptionML = ENU = 'Invoice Type',
                        ENN = 'Invoice Type';
            DataClassification = CustomerContent;
            Editable = false;
            OptionCaptionML = ENU = ' ,Bill of Supply,Export,Supplementary,Debit Note,Non-GST,Taxable',
                              ENN = ' ,Bill of Supply,Export,Supplementary,Debit Note,Non-GST,Taxable';
            OptionMembers = " ","Bill of Supply",Export,Supplementary,"Debit Note","Non-GST",Taxable;
        }
        field(16606; "Bill Of Export No."; Code[20])
        {
            CaptionML = ENU = 'Bill Of Export No.',
                        ENN = 'Bill Of Export No.';
            DataClassification = CustomerContent;
        }
        field(16607; "Bill Of Export Date"; Date)
        {
            CaptionML = ENU = 'Bill Of Export Date',
                        ENN = 'Bill Of Export Date';
            DataClassification = CustomerContent;
        }
        field(16608; "e-Commerce Customer"; Code[20])
        {
            CaptionML = ENU = 'e-Commerce Customer',
                        ENN = 'e-Commerce Customer';
            DataClassification = CustomerContent;
            TableRelation = Customer WHERE("e-Commerce Operator" = FILTER(true));
        }
        field(16609; "e-Commerce Merchant Id"; Code[30])
        {
            CaptionML = ENU = 'e-Commerce Merchant Id',
                        ENN = 'e-Commerce Merchant Id';
            DataClassification = CustomerContent;
            TableRelation = "e-Commerce Merchant Id"."Merchant Id";
        }
        field(16610; "GST Bill-to State Code"; Code[10])
        {
            CaptionML = ENU = 'GST Bill-to State Code',
                        ENN = 'GST Bill-to State Code';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = State;
        }
        field(16611; "GST Ship-to State Code"; Code[10])
        {
            CaptionML = ENU = 'GST Ship-to State Code',
                        ENN = 'GST Ship-to State Code';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = State;
        }
        field(16612; "Location State Code"; Code[10])
        {
            CaptionML = ENU = 'Location State Code',
                        ENN = 'Location State Code';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = State;
        }
        field(16613; "GST Inv. Rounding Precision"; Decimal)
        {
            CaptionML = ENU = 'GST Inv. Rounding Precision',
                        ENN = 'GST Inv. Rounding Precision';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(16614; "GST Inv. Rounding Type"; Option)
        {
            CaptionML = ENU = 'GST Inv. Rounding Type',
                        ENN = 'GST Inv. Rounding Type';
            DataClassification = CustomerContent;
            Editable = false;
            OptionCaptionML = ENU = 'Nearest,Up,Down',
                              ENN = 'Nearest,Up,Down';
            OptionMembers = Nearest,Up,Down;
        }
        field(16615; "GST Reason Type"; Option)
        {
            CaptionML = ENU = 'GST Reason Type',
                        ENN = 'GST Reason Type';
            DataClassification = CustomerContent;
            OptionCaptionML = ENU = ' ,Sales Return,Post Sale Discount,Deficiency in Service,Correction in Invoice,Change in POS,Finalization of Provisional Assessment,Others',
                              ENN = ' ,Sales Return,Post Sale Discount,Deficiency in Service,Correction in Invoice,Change in POS,Finalization of Provisional Assessment,Others';
            OptionMembers = " ","Sales Return","Post Sale Discount","Deficiency in Service","Correction in Invoice","Change in POS","Finalization of Provisional Assessment",Others;
        }
        field(16616; "Location GST Reg. No."; Code[15])
        {
            CaptionML = ENU = 'Location GST Reg. No.',
                        ENN = 'Location GST Reg. No.';
            DataClassification = CustomerContent;
            TableRelation = "GST Registration Nos.";
        }
        field(16617; "Customer GST Reg. No."; Code[15])
        {
            CaptionML = ENU = 'Customer GST Reg. No.',
                        ENN = 'Customer GST Reg. No.';
            DataClassification = CustomerContent;
        }
        field(16618; "Ship-to GST Reg. No."; Code[15])
        {
            CaptionML = ENU = 'Ship-to GST Reg. No.',
                        ENN = 'Ship-to GST Reg. No.';
            DataClassification = CustomerContent;
        }
        field(16619; "Distance (Km)"; Decimal)
        {
            CaptionML = ENU = 'Distance (Km)',
                        ENN = 'Distance (Km)';
            DataClassification = CustomerContent;
        }
        field(16620; "Vehicle Type"; Option)
        {
            CaptionML = ENU = 'Vehicle Type',
                        ENN = 'Vehicle Type';
            DataClassification = CustomerContent;
            OptionCaptionML = ENU = ' ,Regular,ODC',
                              ENN = ' ,Regular,ODC';
            OptionMembers = " ",Regular,ODC;
        }
        field(16621; "Reference Invoice No."; Code[20])
        {
            CaptionML = ENU = 'Reference Invoice No.',
                        ENN = 'Reference Invoice No.';
            DataClassification = CustomerContent;
        }
        field(16622; "E-Way Bill No."; Text[50])
        {
            CaptionML = ENU = 'E-Way Bill No.',
                        ENN = 'E-Way Bill No.';
            DataClassification = CustomerContent;
        }
        field(16623; "Supply Finish Date"; Option)
        {
            CaptionML = ENU = 'Supply Finish Date',
                        ENN = 'Supply Finish Date';
            DataClassification = CustomerContent;
            OptionCaptionML = ENU = ' ,Before Rate Change,After Rate Change',
                              ENN = ' ,Before Rate Change,After Rate Change';
            OptionMembers = " ","Before Rate Change","After Rate Change";
        }
        field(16624; "Payment Date"; Option)
        {
            CaptionML = ENU = 'Payment Date',
                        ENN = 'Payment Date';
            DataClassification = CustomerContent;
            OptionCaptionML = ENU = ',Before Rate Change,After Rate Change',
                              ENN = ',Before Rate Change,After Rate Change';
            OptionMembers = ,"Before Rate Change","After Rate Change";
        }
        field(16625; "Rate Change Applicable"; Boolean)
        {
            CaptionML = ENU = 'Rate Change Applicable',
                        ENN = 'Rate Change Applicable';
            DataClassification = CustomerContent;
        }
        field(16626; "POS Out Of India"; Boolean)
        {
            CaptionML = ENU = 'POS Out Of India',
                        ENN = 'POS Out Of India';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(16627; "Acknowledgement No."; Text[30])
        {
            CaptionML = ENU = 'Acknowledgement No.',
                        ENN = 'Acknowledgement No.';
            DataClassification = CustomerContent;
        }
        field(16628; "IRN Hash"; Text[64])
        {
            CaptionML = ENU = 'IRN Hash',
                        ENN = 'IRN Hash';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                /*IF ("IRN Hash" <> '') AND (STRLEN("IRN Hash") < 64) THEN
                  ERROR(IRNErr);
                  */

            end;
        }
        field(16629; "QR Code"; BLOB)
        {
            CaptionML = ENU = 'QR Code',
                        ENN = 'QR Code';
            DataClassification = CustomerContent;
            SubType = Bitmap;
        }
        field(16630; "Ship-to Customer"; Code[20])
        {
            CaptionML = ENU = 'Ship-to Customer',
                        ENN = 'Ship-to Customer';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(16631; "Ship-to GST Customer Type"; Option)
        {
            CaptionML = ENU = 'Ship-to GST Customer Type',
                        ENN = 'Ship-to GST Customer Type';
            DataClassification = CustomerContent;
            Editable = false;
            OptionCaptionML = ENU = ' ,Registered,Unregistered,Export,Deemed Export,Exempted,SEZ Development,SEZ Unit',
                              ENN = ' ,Registered,Unregistered,Export,Deemed Export,Exempted,SEZ Development,SEZ Unit';
            OptionMembers = " ",Registered,Unregistered,Export,"Deemed Export",Exempted,"SEZ Development","SEZ Unit";
        }
        field(16632; "Acknowledgement Date"; DateTime)
        {
            CaptionML = ENU = 'Acknowledgement Date',
                        ENN = 'Acknowledgement Date';
            DataClassification = CustomerContent;
        }
        field(16633; IsJSONImported; Boolean)
        {
            CaptionML = ENU = 'IsJSONImported',
                        ENN = 'IsJSONImported';
            DataClassification = CustomerContent;
        }
        field(16634; "E-Inv. Cancelled Date"; DateTime)
        {
            CaptionML = ENU = 'E-Inv. Cancelled Date',
                        ENN = 'E-Inv. Cancelled Date';
            DataClassification = CustomerContent;
        }
        field(16635; "Cancel Reason"; Option)
        {
            CaptionML = ENU = 'Cancel Reason',
                        ENN = 'Cancel Reason';
            DataClassification = CustomerContent;
            OptionCaptionML = ENU = ' ,Duplicate,Data Entry Mistake,Order Canceled,Other',
                              ENN = ' ,Duplicate,Data Entry Mistake,Order Canceled,Other';
            OptionMembers = " ",Duplicate,"Data Entry Mistake","Order Canceled",Other;
        }
=======
>>>>>>> 92e9343b97066cd41289b021406784be0d52ea8b
        field(80020; "Dimension Corrected"; Boolean)
        {
            Description = 'added  by sujani for Dimension issue clearance (B2B Assistance)';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(80021; "OLD Dim Set ID"; Integer)
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
    }


    var
        DuplicateIRNErr: Label 'Duplicate IRN.';
        NoActiveIRNErr: Label 'No active IRN found.';
        GetIRNFailedTxt: Label 'Unable to Get IRN, Please try after some time.';
}

