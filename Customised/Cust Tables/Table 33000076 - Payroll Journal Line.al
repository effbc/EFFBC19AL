table 33000076 "Payroll Journal Line"
{
    DataClassification = CustomerContent;
    // version NEOGYNPAY13.70.00.07,DIM1.0

    // PROJECT : Efftronics
    // *****************************************************************************************************************************
    // SIGN
    // *****************************************************************************************************************************
    // B2B     : B2B Software Technologies
    // *****************************************************************************************************************************
    // VER      SIGN   USERID                 DATE                       DESCRIPTION
    // *****************************************************************************************************************************
    // 1.0       DIM   Sivaramakrishna.A      24-May-13             -> Added New Field 50006 ("Dimension Set ID") it Will assign the Dimension Set ID
    //                                                                 specific Combination of Dimensions
    //                                                                 These combinations are stored in the new Dimension Set Entry
    //                                                              -> Code has been Commented in the ValidateShortcutDimCode() and Added new code for the Each combination
    //                                                                 of Dimensions to get a Dimension Set ID.


    fields
    {
        field(1; "Pay Journal Template"; Code[10])
        {
            TableRelation = "Pay Journal Template";
            DataClassification = CustomerContent;
        }
        field(2; "Pay Journal Batch"; Code[10])
        {
            Caption = 'Pay Journal Batch';
            TableRelation = "Pay Gen. Journal Batch".Name WHERE("Pay Journal Template" = FIELD("Pay Journal Template"));
            DataClassification = CustomerContent;
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(4; "Account Type"; Option)
        {
            OptionCaption = 'Employee,G/L Account,Bank Account';
            OptionMembers = Employee,"G/L Account","Bank Account";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if ("Account Type" in ["Account Type"::Employee]) and
                   ("Bal. Account Type" in ["Bal. Account Type"::Employee])
                then
                    Error(Text000, FieldCaption("Account Type"), FieldCaption("Bal. Account Type"));

                Validate("Account No.", '');

                if "Account Type" in ["Account Type"::Employee, "Account Type"::"Bank Account"] then begin
                    Validate("Pay Posting Type", "Pay Posting Type"::" ");
                    Validate("Pay Bus. Posting Group", '');
                    Validate("Pay Prod. Posting Group", '');
                end
                else
                    if "Bal. Account Type" in ["Bal. Account Type"::"G/L Account", "Account Type"::"Bank Account"] then
                        //VALIDATE("Payment Terms Code",'');

                        UpdateSource;
            end;
        }
        field(5; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = IF ("Account Type" = FILTER("G/L Account")) "G/L Account"."No."
            ELSE
            IF ("Account Type" = FILTER(Employee)) Employee."No.";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if "Account No." = '' then begin
                    UpdateLineBalance;
                    UpdateSource;

                    DimMgrTableType;
                    CreateDim(DimMgt.TypeToTableID1(DimMgrAccountType), "Account No.",
                              DimMgt.TypeToTableID1(DimMgrBalAccountType), "Bal. Account No.");

                    if xRec."Account No." <> '' then begin
                        "Pay Posting Type" := "Pay Posting Type"::" ";
                        "Pay Bus. Posting Group" := '';
                        "Pay Prod. Posting Group" := '';
                    end;
                    exit;
                end;

                case "Account Type" of
                    "Account Type"::"G/L Account":
                        begin
                            GLAcc.Get("Account No.");
                            CheckGLAcc;
                            ReplaceInfo := "Bal. Account No." = '';
                            if not ReplaceInfo then begin
                                PayGenJournalBatch.Get("Pay Journal Template", "Pay Journal Batch");
                                ReplaceInfo := PayGenJournalBatch."Bal. Account No." <> '';
                            end;
                            if ReplaceInfo then begin
                                Description := GLAcc.Name;
                            end;

                            if ("Bal. Account No." = '') or ("Bal. Account Type" in
                                                            ["Bal. Account Type"::"G/L Account", "Bal. Account Type"::"Bank Account"]) then begin
                                "Posting Group" := '';
                                //"Payment Terms Code" := '';
                            end;

                            if "Bal. Account No." = '' then
                                "Currency Code" := '';
                            /*
                            IF NOT PayGenJournalBatch.GET("Pay Journal Template","Pay Journal Batch") OR
                                 PayGenJournalBatch."Copy VAT Setup to Jnl. Lines"
                            THEN
                              BEGIN
                                "Pay Posting Type" := GLAcc."Gen. Posting Type";
                                "Pay Bus. Posting Group" := GLAcc."Gen. Bus. Posting Group";
                                "Pay Prod. Posting Group" := GLAcc."Gen. Prod. Posting Group";
                              END;
                            */
                            if "Posting Date" <> 0D then
                                if "Posting Date" = ClosingDate("Posting Date") then begin
                                    "Pay Posting Type" := 0;
                                    "Pay Bus. Posting Group" := '';
                                    "Pay Prod. Posting Group" := '';
                                end;
                        end;

                    "Account Type"::Employee:
                        begin
                            Employee.Get("Account No.");
                            //Employee.TESTFIELD(Blocked,FALSE);
                            Description := Employee."First Name";
                            "Posting Group" := Employee."Employee Posting Group";
                            ///New Added By Tanmoy
                            "Global Dimension 1 Code" := Employee."Global Dimension 1 Code";
                            "Global Dimension 2 Code" := Employee."Global Dimension 2 Code";

                            //"Payment Terms Code" := Employee."Payment Terms Code";
                            //IF SetCurrencyCode("Bal. Account Type","Bal. Account No.") THEN
                            //Employee.TESTFIELD("Currency Code","Currency Code")
                            //ELSE
                            //"Currency Code" := Employee."Currency Code";

                            "Pay Posting Type" := 0;
                            "Pay Bus. Posting Group" := '';
                            "Pay Prod. Posting Group" := '';
                        end;
                    "Account Type"::"Bank Account":
                        begin
                            BankAcc.Get("Account No.");
                            BankAcc.TestField(Blocked, false);
                            ReplaceInfo := "Bal. Account No." = '';
                            if not ReplaceInfo then begin
                                PayGenJournalBatch.Get("Pay Journal Template", "Pay Journal Batch");
                                ReplaceInfo := PayGenJournalBatch."Bal. Account No." <> '';
                            end;

                            if ReplaceInfo then begin
                                Description := BankAcc.Name;
                            end;
                            if ("Bal. Account No." = '') or ("Bal. Account Type" in
                                                            ["Bal. Account Type"::"G/L Account", "Bal. Account Type"::"Bank Account"]) then begin
                                "Posting Group" := '';
                                //"Payment Terms Code" := '';
                            end;

                            if BankAcc."Currency Code" = '' then begin
                                if "Bal. Account No." = '' then
                                    "Currency Code" := '';
                            end
                            else
                                if SetCurrencyCode("Bal. Account Type", "Bal. Account No.") then
                                    BankAcc.TestField("Currency Code", "Currency Code")
                                else
                                    "Currency Code" := BankAcc."Currency Code";

                            "Pay Posting Type" := 0;
                            "Pay Bus. Posting Group" := '';
                            "Pay Prod. Posting Group" := '';
                        end;
                end;

                Validate("Currency Code");
                //VALIDATE("Payment Terms Code");
                UpdateLineBalance;
                UpdateSource;

                DimMgrTableType;
                CreateDim(DimMgt.TypeToTableID1(DimMgrAccountType), "Account No.",
                          DimMgt.TypeToTableID1(DimMgrBalAccountType), "Bal. Account No.");

            end;
        }
        field(6; Description; Text[200])
        {
            DataClassification = CustomerContent;
        }
        field(7; "Posting Group"; Code[10])
        {
            Caption = 'Posting Group';
            Editable = false;
            TableRelation = IF ("Account Type" = FILTER(Employee)) "Employee Posting Group".Code;
            DataClassification = CustomerContent;
        }
        field(8; "Pay Posting Type"; Option)
        {
            Caption = 'Pay Posting Type';
            OptionCaption = '" ,Posting,Settlement"';
            OptionMembers = " ",Posting,Settlement;
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if "Account Type" in ["Account Type"::Employee, "Account Type"::"Bank Account"] then
                    TestField("Pay Posting Type", "Pay Posting Type"::" ");
                /*
                IF ("Pay Posting Type" = "Pay Posting Type"::Settlement) AND (CurrFieldNo <> 0) THEN
                  ERROR(Text006,"Gen. Posting Type");
                */

            end;
        }
        field(9; "Pay Bus. Posting Group"; Code[10])
        {
            Caption = 'Pay Bus. Posting Group';
            TableRelation = "Pay Business Posting Group";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if "Account Type" in ["Account Type"::Employee, "Account Type"::"Bank Account"] then
                    TestField("Pay Bus. Posting Group", '');
            end;
        }
        field(10; "Pay Prod. Posting Group"; Code[10])
        {
            Caption = 'Pay Prod. Posting Group';
            TableRelation = "Pay Product Posting Group";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if "Account Type" in ["Account Type"::Employee, "Account Type"::"Bank Account"] then
                    TestField("Pay Prod. Posting Group", '');
            end;
        }
        field(11; "Document Type"; Option)
        {
            OptionCaption = '" ,Posting,FullFinal,Reimbursement,Payment"';
            OptionMembers = " ",Posting,FullFinal,Reimbursement,Payment;
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                //VALIDATE("Payment Terms Code");
                if "Account No." <> '' then
                    case "Account Type" of
                        "Account Type"::Employee:
                            begin
                                Employee.Get("Account No.");
                                //Employee.CheckBlockedCustOnJnls(Employee,"Document Type",FALSE);
                            end;
                    end;
                if "Bal. Account No." <> '' then
                    case "Bal. Account Type" of
                        "Account Type"::Employee:
                            begin
                                Employee.Get("Account No.");
                                //Employee.CheckBlockedCustOnJnls(Employee,"Document Type",FALSE);
                            end;
                    end;
            end;
        }
        field(12; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(13; "Document Date"; Date)
        {
            ClosingDates = true;
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                //VALIDATE("Payment Terms Code");
            end;
        }
        field(21; "Bal. Account Type"; Option)
        {
            Caption = 'Bal. Account Type';
            OptionCaption = 'Employee,G/L Account,Bank Account';
            OptionMembers = Employee,"G/L Account","Bank Account";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if ("Account Type" in ["Account Type"::Employee]) and ("Bal. Account Type" in ["Bal. Account Type"::Employee]) then
                    Error(Text000, FieldCaption("Account Type"), FieldCaption("Bal. Account Type"));
                Validate("Bal. Account No.", '');

                if "Bal. Account Type" in ["Bal. Account Type"::Employee, "Bal. Account Type"::"Bank Account"] then begin
                    Validate("Bal. Pay Posting Type", "Bal. Pay Posting Type"::" ");
                    Validate("Bal. Pay Bus. Posting Group", '');
                    Validate("Bal. Pay Prod. Posting Group", '');
                end
                else
                    if "Account Type" in ["Bal. Account Type"::"G/L Account", "Account Type"::"Bank Account"] then
                        //VALIDATE("Payment Terms Code",'');

                        UpdateSource;
                if ("Account Type" in ["Account Type"::"G/L Account", "Account Type"::"Bank Account"]) and
                   ("Bal. Account Type" in ["Bal. Account Type"::"G/L Account", "Bal. Account Type"::"Bank Account"])
                then begin
                    //VALIDATE("Payment Terms Code",'');
                end;
            end;
        }
        field(22; "Bal. Account No."; Code[20])
        {
            Caption = 'Bal. Account No.';
            TableRelation = IF ("Bal. Account Type" = FILTER("G/L Account")) "G/L Account"."No."
            ELSE
            IF ("Bal. Account Type" = FILTER(Employee)) Employee."No.";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if "Bal. Account No." = '' then begin
                    UpdateLineBalance;
                    UpdateSource;

                    DimMgrTableType;
                    CreateDim(DimMgt.TypeToTableID1(DimMgrBalAccountType), "Bal. Account No.",
                               DimMgt.TypeToTableID1(DimMgrAccountType), "Account No.");

                    if xRec."Bal. Account No." <> '' then begin
                        "Bal. Pay Posting Type" := "Bal. Pay Posting Type"::" ";
                        "Bal. Pay Bus. Posting Group" := '';
                        "Bal. Pay Prod. Posting Group" := '';
                    end;
                    exit;
                end;

                case "Bal. Account Type" of
                    "Bal. Account Type"::"G/L Account":
                        begin
                            GLAcc.Get("Bal. Account No.");
                            CheckGLAcc;
                            /*
                            GLSetup.GET;
                            IF GLSetup."PLA Account" = "Bal. Account No." THEN
                              PLA := TRUE;
                            */

                            if "Account No." = '' then begin
                                Description := GLAcc.Name;
                                "Currency Code" := '';
                            end;
                            if ("Account No." = '') or ("Account Type" in ["Account Type"::"G/L Account", "Account Type"::"Bank Account"]) then begin
                                "Posting Group" := '';
                                //"Payment Terms Code" := '';
                            end;

                            if "Posting Date" <> 0D then
                                if "Posting Date" = ClosingDate("Posting Date") then begin
                                    "Bal. Pay Posting Type" := 0;
                                    "Bal. Pay Bus. Posting Group" := '';
                                    "Bal. Posting Group" := '';
                                end;
                        end;

                    "Bal. Account Type"::Employee:
                        begin
                            Employee.Get("Bal. Account No.");
                            //Employee.CheckBlockedCustOnJnls(Employee,"Document Type",FALSE);
                            if "Account No." = '' then begin
                                Description := Employee."First Name";
                            end;

                            "Bal. Posting Group" := Employee."Employee Posting Group";
                            "Global Dimension 1 Code" := Employee."Global Dimension 1 Code";
                            "Global Dimension 2 Code" := Employee."Global Dimension 2 Code";

                            /*
                            "Payment Terms Code" := Cust."Payment Terms Code";
                            IF ("Account No." = '') OR ("Account Type" = "Account Type"::"G/L Account") THEN
                              "Currency Code" := Employee."Currency Code";
                            IF ("Account Type" = "Account Type"::"Bank Account") AND ("Currency Code" = '') THEN
                              "Currency Code" := Employee."Currency Code";
                            */
                            "Bal. Pay Posting Type" := 0;
                            "Bal. Pay Bus. Posting Group" := '';
                            "Bal. Pay Prod. Posting Group" := '';

                            //VALIDATE("Payment Terms Code");
                        end;
                    "Bal. Account Type"::"Bank Account":
                        begin
                            BankAcc.Get("Bal. Account No.");
                            BankAcc.TestField(Blocked, false);
                            if "Account No." = '' then begin
                                Description := BankAcc.Name;
                            end;
                            if ("Account No." = '') or ("Account Type" in
                                                        ["Account Type"::"G/L Account", "Account Type"::"Bank Account"]) then begin
                                "Posting Group" := '';
                                //"Payment Terms Code" := '';
                            end;
                            if BankAcc."Currency Code" = '' then begin
                                if "Account No." = '' then
                                    "Currency Code" := '';
                            end
                            else
                                if SetCurrencyCode("Bal. Account Type", "Bal. Account No.") then
                                    BankAcc.TestField("Currency Code", "Currency Code")
                                else
                                    "Currency Code" := BankAcc."Currency Code";

                            "Bal. Pay Posting Type" := 0;
                            "Bal. Pay Bus. Posting Group" := '';
                            "Bal. Pay Prod. Posting Group" := '';
                        end;
                end;

                Validate("Currency Code");
                UpdateLineBalance;
                UpdateSource;

                DimMgrTableType;
                CreateDim(DimMgt.TypeToTableID1(DimMgrBalAccountType), "Bal. Account No.",
                          DimMgt.TypeToTableID1(DimMgrAccountType), "Account No.");

            end;
        }
        field(23; "Bal. Posting Group"; Code[10])
        {
            Caption = 'Bal. Posting Group';
            Editable = false;
            TableRelation = IF ("Bal. Account Type" = FILTER(Employee)) "Employee Posting Group".Code;
            DataClassification = CustomerContent;
        }
        field(24; "Bal. Pay Posting Type"; Option)
        {
            Caption = 'Bal. Pay Posting Type';
            OptionCaption = '" ,Posting,Settlement"';
            OptionMembers = " ",Posting,Settlement;
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if "Bal. Account Type" in ["Bal. Account Type"::Employee, "Bal. Account Type"::"Bank Account"] then
                    TestField("Bal. Pay Posting Type", "Bal. Pay Posting Type"::" ");
                /*
                IF ("Bal. Gen. Posting Type" = "Gen. Posting Type"::Settlement) AND (CurrFieldNo <> 0) THEN
                  ERROR(Text006,"Bal. Gen. Posting Type");
                */

            end;
        }
        field(25; "Bal. Pay Bus. Posting Group"; Code[10])
        {
            Caption = 'Bal. Pay Bus. Posting Group';
            TableRelation = "Pay Business Posting Group";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if "Bal. Account Type" in ["Bal. Account Type"::Employee, "Bal. Account Type"::"Bank Account"] then
                    TestField("Bal. Pay Bus. Posting Group", '');
            end;
        }
        field(26; "Bal. Pay Prod. Posting Group"; Code[10])
        {
            TableRelation = "Pay Product Posting Group";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if "Bal. Account Type" in ["Bal. Account Type"::Employee, "Bal. Account Type"::"Bank Account"] then
                    TestField("Bal. Pay Prod. Posting Group", '');
            end;
        }
        field(31; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
            end;
        }
        field(32; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                ValidateShortcutDimCode(2, "Global Dimension 2 Code");
            end;
        }
        field(33; Grade; Code[10])
        {
            Caption = 'Grade';
            TableRelation = "Pay Grade";
            DataClassification = CustomerContent;
        }
        field(34; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
            DataClassification = CustomerContent;
        }
        field(35; "Job Title Code"; Code[20])
        {
            Caption = 'Job Title Code';
            DataClassification = CustomerContent;
        }
        field(41; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            ClosingDates = true;
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                Validate("Document Date", "Posting Date");
                Validate("Currency Code");
                "Posting Month" := Date2DMY("Posting Date", 2);
                "Posting Year" := Date2DMY("Posting Date", 3);

                /*
                IF ((Rec."Posting Date" <> xRec."Posting Date") AND (Amount <> 0))  THEN
                  PaymentToleranceMgt.PmtTolGenJnl(Rec);
                */

            end;
        }
        field(42; "Posting Month"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(43; "Posting Year"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(51; "Pay Element Code"; Code[10])
        {
            Caption = 'Pay Element Code';
            NotBlank = true;
            TableRelation = "Pay Elements".Code;
            DataClassification = CustomerContent;
        }
        field(52; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                /*
                IF "Bal. Account Type" = "Bal. Account Type"::"Bank Account" THEN
                  BEGIN
                    IF BankAcc3.GET("Bal. Account No.") AND (BankAcc3."Currency Code" <> '')THEN
                      BankAcc3.TESTFIELD("Currency Code","Currency Code");
                  END;
                IF "Account Type" = "Account Type"::"Bank Account" THEN
                  BEGIN
                    IF BankAcc3.GET("Account No.") AND (BankAcc3."Currency Code" <> '') THEN
                      BankAcc3.TESTFIELD("Currency Code","Currency Code");
                  END;
                IF ("Recurring Method" IN
                    ["Recurring Method"::"B  Balance","Recurring Method"::"RB Reversing Balance"]) AND
                   ("Currency Code" <> '')
                THEN
                  ERROR(
                    Text001,
                    FIELDCAPTION("Currency Code"),FIELDCAPTION("Recurring Method"),"Recurring Method");
                
                IF "Currency Code" <> '' THEN
                  BEGIN
                    GetCurrency;
                    IF ("Currency Code" <> xRec."Currency Code") OR
                       ("Posting Date" <> xRec."Posting Date") OR
                       (CurrFieldNo = FIELDNO("Currency Code")) OR
                       ("Currency Factor" = 0)
                    THEN
                      "Currency Factor" := CurrExchRate.ExchangeRate("Posting Date","Currency Code");
                  END
                ELSE
                  "Currency Factor" := 0;
                VALIDATE("Currency Factor");
                
                IF (("Currency Code" <> xRec."Currency Code") AND (Amount <> 0)) THEN
                  PaymentToleranceMgt.PmtTolGenJnl(Rec);
                */

            end;
        }
        field(53; Amount; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                GetCurrency;
                if "Currency Code" = '' then
                    "Amount (LCY)" := Amount
                else
                    "Amount (LCY)" := Round(CurrExchRate.ExchangeAmtFCYToLCY("Posting Date", "Currency Code", Amount, "Currency Factor"));

                Amount := Round(Amount, Currency."Amount Rounding Precision");

                UpdateLineBalance;
                /*
                IF ((Rec.Amount <> xRec.Amount))  THEN
                  PaymentToleranceMgt.PmtTolGenJnl(Rec);
                */

            end;
        }
        field(54; "Debit Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Debit Amount';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                GetCurrency;
                "Debit Amount" := Round("Debit Amount", Currency."Amount Rounding Precision");
                Correction := "Debit Amount" < 0;
                Amount := "Debit Amount";
                Validate(Amount);
            end;
        }
        field(55; "Credit Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Credit Amount';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                GetCurrency;
                "Credit Amount" := Round("Credit Amount", Currency."Amount Rounding Precision");
                Correction := "Credit Amount" < 0;
                Amount := -"Credit Amount";
                Validate(Amount);
            end;
        }
        field(56; "Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount (LCY)';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if "Currency Code" = '' then begin
                    Amount := "Amount (LCY)";
                    Validate(Amount);
                end
                else begin
                    if CheckFixedCurrency then begin
                        GetCurrency;
                        Amount := Round(CurrExchRate.ExchangeAmtLCYToFCY("Posting Date", "Currency Code", "Amount (LCY)",
                                        "Currency Factor"), Currency."Amount Rounding Precision")
                    end
                    else begin
                        TestField("Amount (LCY)");
                        TestField(Amount);
                        "Currency Factor" := Amount / "Amount (LCY)";
                    end;

                    UpdateLineBalance;
                end;
            end;
        }
        field(57; "Original Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Original Amount';
            DataClassification = CustomerContent;
        }
        field(58; "Original Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Original Amount (LCY)';
            DataClassification = CustomerContent;
        }
        field(59; "Balance (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Balance (LCY)';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(60; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if ("Currency Code" = '') and ("Currency Factor" <> 0) then
                    FieldError("Currency Factor", StrSubstNo(Text002, FieldCaption("Currency Code")));
                Validate(Amount);
            end;
        }
        field(81; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            Editable = false;
            TableRelation = "Source Code";
            DataClassification = CustomerContent;
        }
        field(82; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
            DataClassification = CustomerContent;
        }
        field(83; "Source Type"; Option)
        {
            Caption = 'Source Type';
            OptionCaption = '" ,Employee,Bank Account"';
            OptionMembers = " ",Employee,"Bank Account";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if ("Account Type" <> "Account Type"::"G/L Account") and ("Account No." <> '') or
                   ("Bal. Account Type" <> "Bal. Account Type"::"G/L Account") and ("Bal. Account No." <> '')
                then
                    UpdateSource
                else
                    "Source No." := '';
            end;
        }
        field(84; "Source No."; Code[20])
        {
            Caption = 'Source No.';
            TableRelation = IF ("Source Type" = FILTER(Employee)) Employee;
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if ("Account Type" <> "Account Type"::"G/L Account") and ("Account No." <> '') or
                   ("Bal. Account Type" <> "Bal. Account Type"::"G/L Account") and ("Bal. Account No." <> '')
                then
                    UpdateSource;
            end;
        }
        field(85; "On Hold"; Code[3])
        {
            Caption = 'On Hold';
            DataClassification = CustomerContent;
        }
        field(86; "Applies-to Doc. Type"; Option)
        {
            Caption = 'Applies-to Doc. Type';
            OptionCaption = '" ,Posting,FullFinal,Reimbursement,Payment"';
            OptionMembers = " ",Posting,FullFinal,Reimbursement,Payment;
            DataClassification = CustomerContent;
        }
        field(87; "Applies-to Doc. No."; Code[20])
        {
            Caption = 'Applies-to Doc. No.';
            DataClassification = CustomerContent;

            trigger OnLookup();
            var
                PayrollJnlPostLineLocal: Codeunit "Payroll Jnl.-Post Line";
                PaymentToleranceMgt: Codeunit "Payment Tolerance Management";
            begin
                /*
                IF xRec."Line No." = 0 THEN
                  xRec.Amount := Amount;
                
                IF "Bal. Account Type" IN ["Bal. Account Type"::Employee] THEN
                  BEGIN
                    AccNo := "Bal. Account No.";
                    AccType := "Bal. Account Type";
                    CLEAR(EmployeeLedgerEntry);
                  END
                ELSE
                  BEGIN
                    AccNo := "Account No.";
                    AccType := "Account Type";
                    CLEAR(EmployeeLedgerEntry);
                  END;
                
                xRec."Currency Code" := "Currency Code";
                xRec."Posting Date" := "Posting Date";
                
                CASE AccType OF
                  AccType::Employee:
                    BEGIN
                      EmployeeLedgerEntry.SETCURRENTKEY("Employee No.",Open,Positive,"Due Date");
                      EmployeeLedgerEntry.SETRANGE("Employee No.",AccNo);
                      EmployeeLedgerEntry.SETRANGE(Open,TRUE);
                
                      IF "Applies-to Doc. No." <> '' THEN
                        BEGIN
                          EmployeeLedgerEntry.SETRANGE("Document Type","Applies-to Doc. Type");
                          EmployeeLedgerEntry.SETRANGE("Document No.","Applies-to Doc. No.");
                          IF NOT EmployeeLedgerEntry.FIND('-') THEN
                            BEGIN
                              EmployeeLedgerEntry.SETRANGE("Document Type");
                              EmployeeLedgerEntry.SETRANGE("Document No.");
                            END;
                        END;
                
                      IF "Applies-to ID" <> '' THEN
                        BEGIN
                          EmployeeLedgerEntry.SETRANGE("Applies-to ID","Applies-to ID");
                          IF NOT EmployeeLedgerEntry.FIND('-') THEN
                            EmployeeLedgerEntry.SETRANGE("Applies-to ID");
                        END;
                
                      IF "Applies-to Doc. Type" <> "Applies-to Doc. Type"::" " THEN
                        BEGIN
                          EmployeeLedgerEntry.SETRANGE("Document Type","Applies-to Doc. Type");
                          IF NOT EmployeeLedgerEntry.FIND('-') THEN
                            EmployeeLedgerEntry.SETRANGE("Document Type");
                        END;
                
                      IF  "Applies-to Doc. No." <>''THEN
                        BEGIN
                          EmployeeLedgerEntry.SETRANGE("Document No.","Applies-to Doc. No.");
                          IF NOT EmployeeLedgerEntry.FIND('-') THEN
                            EmployeeLedgerEntry.SETRANGE("Document No.");
                        END;
                
                      IF Amount <> 0 THEN
                        BEGIN
                          EmployeeLedgerEntry.SETRANGE(Positive,Amount < 0);
                          IF EmployeeLedgerEntry.FIND('-') THEN;
                            EmployeeLedgerEntry.SETRANGE(Positive);
                        END;
                
                      ApplyEmpEntries.SetGenJnlLine(Rec,PayrollJournalLine.FIELDNO("Applies-to Doc. No."));
                      ApplyEmpEntries.SETTABLEVIEW(EmployeeLedgerEntry);
                      ApplyEmpEntries.SETRECORD(EmployeeLedgerEntry);
                      ApplyEmpEntries.LOOKUPMODE(TRUE);
                
                      IF ApplyEmpEntries.RUNMODAL = ACTION::LookupOK THEN
                        BEGIN
                          ApplyEmpEntries.GETRECORD(EmployeeLedgerEntry);
                          CLEAR(ApplyEmpEntries);
                          IF "Currency Code" <> EmployeeLedgerEntry."Currency Code" THEN
                            IF Amount = 0 THEN
                              BEGIN
                                FromCurrencyCode := GetShowCurrencyCode("Currency Code");
                                ToCurrencyCode := GetShowCurrencyCode(EmployeeLedgerEntry."Currency Code");
                                IF NOT CONFIRM(Text003 + Text004,TRUE,
                                               FIELDCAPTION("Currency Code"),TABLECAPTION,FromCurrencyCode,ToCurrencyCode)
                                THEN
                                  ERROR(Text005);
                
                                VALIDATE("Currency Code",EmployeeLedgerEntry."Currency Code");
                              END
                            ELSE
                              PayrollJnlApply.CheckAgainstApplnCurrency("Currency Code",EmployeeLedgerEntry."Currency Code",
                                                                     PayrollJournalLine."Account Type"::Employee,TRUE);
                
                            IF Amount = 0 THEN
                              BEGIN
                                EmployeeLedgerEntry.CALCFIELDS("Remaining Amount");
                                {
                                IF PayrollJnlPostLineLocal.CheckCalcPmtDiscGenJnlEmp(Rec,EmployeeLedgerEntry,0,FALSE)  THEN
                                  Amount := -(EmployeeLedgerEntry."Remaining Amount" - EmployeeLedgerEntry."Remaining Pmt. Disc. Possible")
                                ELSE
                                  Amount := -EmployeeLedgerEntry."Remaining Amount";
                                }
                                IF "Bal. Account Type" IN  ["Bal. Account Type"::Employee] THEN
                                  Amount := -Amount;
                
                                VALIDATE(Amount);
                              END;
                
                            "Applies-to Doc. Type" := EmployeeLedgerEntry."Document Type";
                            "Applies-to Doc. No." := EmployeeLedgerEntry."Document No.";
                            "Applies-to ID" := '';
                            "Payment Indicator":=EmployeeLedgerEntry."Payment Indicator";
                        END
                      ELSE
                        CLEAR(ApplyEmpEntries);
                    END;
                END;
                {
                IF (xRec.Amount <> 0) THEN
                  IF NOT PaymentToleranceMgt.PmtTolGenJnl(Rec) THEN
                    EXIT;
                }
                VALIDATE("Applies-to Doc. No.");
                */

            end;

            trigger OnValidate();
            begin
                /*
                IF ("Applies-to Doc. No." = '') AND (xRec."Applies-to Doc. No." <> '') THEN
                  PaymentToleranceMgt.DelPmtTolApllnDocNo(Rec,xRec."Applies-to Doc. No.");
                
                IF (("Applies-to Doc. No." <> xRec."Applies-to Doc. No.") AND (Amount <> 0)) THEN
                  BEGIN
                    IF xRec."Applies-to Doc. No." <> '' THEN
                      PaymentToleranceMgt.DelPmtTolApllnDocNo(Rec,xRec."Applies-to Doc. No.");
                    PaymentToleranceMgt.PmtTolGenJnl(Rec);
                  END;
                */

            end;
        }
        field(88; "Due Date"; Date)
        {
            Caption = 'Due Date';
            DataClassification = CustomerContent;
        }
        field(89; Correction; Boolean)
        {
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                Validate(Amount);
            end;
        }
        field(101; "Paid Category"; Option)
        {
            Caption = 'Paid Category';
            OptionCaption = '" ,Monthly,Yearly,Quarterly"';
            OptionMembers = " ",Monthly,Yearly,Quarterly;
            DataClassification = CustomerContent;
        }
        field(102; Type; Option)
        {
            Caption = 'Type';
            Editable = false;
            OptionMembers = Addition,Deduction,Reimbursement;
            DataClassification = CustomerContent;
        }
        field(103; "Included In Pay Slip"; Boolean)
        {
            Caption = 'Included In Pay Slip';
            DataClassification = CustomerContent;
        }
        field(104; "Arrear Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(105; "Employer Contribition"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(106; "Employer Contribition2"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(107; Salary; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(108; "EPS Salary"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(109; "VPF %"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(110; "VPF Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(111; "Extra PF %"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(112; "Employer PF Contri  Salary"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(113; Arrear; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(114; ArrearCheck; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(121; "Gross Earning"; Decimal)
        {
            CalcFormula = Sum("Pay Employee Pay Details"."Payable Amount" WHERE("Employee No" = FIELD("Account No."),
                                                                                 "Included In Pay Slip" = FIELD("Included In Pay Slip"),
                                                                                 Year = FIELD("Posting Year"),
                                                                                 Month = FIELD("Posting Month"),
                                                                                 Type = CONST(Addition)));
            Caption = 'Gross Earning';
            FieldClass = FlowField;
        }
        field(122; "Gross Deduction"; Decimal)
        {
            CalcFormula = Sum("Pay Employee Pay Details"."Payable Amount" WHERE("Employee No" = FIELD("Account No."),
                                                                                 "Included In Pay Slip" = FIELD("Included In Pay Slip"),
                                                                                 Year = FIELD("Posting Year"),
                                                                                 Month = FIELD("Posting Month"),
                                                                                 Type = CONST(Deduction)));
            Caption = 'Gross Deduction';
            FieldClass = FlowField;
        }
        field(123; Reimbursement; Decimal)
        {
            CalcFormula = Sum("Pay Employee Pay Details"."Payable Amount" WHERE("Employee No" = FIELD("Account No."),
                                                                                 "Included In Pay Slip" = FIELD("Included In Pay Slip"),
                                                                                 Year = FIELD("Posting Year"),
                                                                                 Month = FIELD("Posting Month"),
                                                                                 Type = CONST(Reimbursement)));
            Caption = 'Reimbursement';
            FieldClass = FlowField;
        }
        field(50000; "System-Created Entry"; Boolean)
        {
            Caption = 'System-Created Entry';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50001; "Allow Zero-Amount Posting"; Boolean)
        {
            Caption = 'Allow Zero-Amount Posting';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50002; "Applies-to ID"; Code[20])
        {
            Caption = 'Applies-to ID';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if ("Applies-to ID" <> xRec."Applies-to ID") and (xRec."Applies-to ID" <> '') then
                    ClearEmpApplID;
            end;
        }
        field(50003; "Value Entry No."; Integer)
        {
            Caption = 'Value Entry No.';
            Editable = false;
            TableRelation = "Value Entry";
            DataClassification = CustomerContent;
        }
        field(50004; "Payment Indicator"; Option)
        {
            OptionMembers = " ",Include,Exclude,Reimbursement;
            DataClassification = CustomerContent;
        }
        field(50006; "Dimension Set ID"; Integer)
        {
            CaptionML = ENU = 'Dimension Set ID',
                        ENN = 'Dimension Set ID';
            Description = 'DIM1.0';
            Editable = false;
            TableRelation = "Dimension Set Entry";
            DataClassification = CustomerContent;

            trigger OnLookup();
            begin
                ShowDimensions;
            end;
        }
        field(60090; "Dimension Corrected"; Boolean)
        {
            Description = 'added  by sujani for Dimension issue clearance (B2B Assistance)';
            Editable = false;
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
    }

    keys
    {
        key(Key1; "Pay Journal Template", "Pay Journal Batch", "Document Type", "Document No.", "Line No.")
        {
            SumIndexFields = "Balance (LCY)";
        }
        key(Key2; "Pay Journal Template", "Pay Journal Batch", "Posting Date", "Document No.")
        {
        }
        key(Key3; "Account Type", "Account No.", "Applies-to Doc. Type", "Applies-to Doc. No.")
        {
        }
        key(Key4; "Pay Journal Template", "Pay Journal Batch", "Line No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        //TESTFIELD("Check Printed",FALSE);

        /*
        JnlLineDim.SETRANGE("Table ID",DATABASE::"Gen. Jnl. Allocation");
        JnlLineDim.SETRANGE("Pay Journal Template","Pay Journal Template");
        JnlLineDim.SETRANGE("Journal Batch Name","Pay Journal Batch");
        JnlLineDim.SETRANGE("Journal Line No.","Line No.");
        JnlLineDim.DELETEALL;
        
        GenJnlAlloc.SETRANGE("Pay Journal Template","Pay Journal Template");
        GenJnlAlloc.SETRANGE("Journal Batch Name","Pay Journal Batch");
        GenJnlAlloc.SETRANGE("Journal Line No.","Line No.");
        GenJnlAlloc.DELETEALL;
        */
        //B2b1.0>> Since Function doesn't exist in Nav 2013
        //DimMgt.DeleteJnlLineDim(DATABASE::"Payroll Journal Line","Pay Journal Template","Pay Journal Batch","Line No.",0);
        //B2b1.0<<

        ClearEmpApplID;

    end;

    trigger OnInsert();
    begin
        //Deleted Local Var(JnlLineDimRecordTable356)
        //JnlLineDim.LOCKTABLE;//B2B
        //GenJnlAlloc.LOCKTABLE;
        LockTable;
        PayJournalTemplate.Get("Pay Journal Template");
        PayGenJournalBatch.Get("Pay Journal Template", "Pay Journal Batch");
        //"Check Printed" := FALSE;

        //B2b1.0>> Since Function doesn't exist in Nav 2013
        /*DimMgt.InsertJnlLineDim(DATABASE::"Payroll Journal Line","Pay Journal Template","Pay Journal Batch","Line No.",0,
                                "Global Dimension 1 Code","Global Dimension 2 Code");*///B2B1.0<<

    end;

    trigger OnModify();
    begin
        //TESTFIELD("Check Printed",FALSE);
        if ("Applies-to ID" = '') and (xRec."Applies-to ID" <> '') then
            ClearEmpApplID;
    end;

    trigger OnRename();
    begin
        /*
        TESTFIELD("Check Printed",FALSE);
        */

    end;

    var
        PayJournalTemplate: Record "Pay Journal Template";
        PayGenJournalBatch: Record "Pay Gen. Journal Batch";
        Text000: Label '%1 or %2 must be G/L Account or Bank Account.';
        Text001: Label 'You must not specify %1 when %2 is %3.';
        Text002: Label 'cannot be specified without %1';
        Text003: Label 'The %1 in the %2 will be changed from %3 to %4.\';
        Text004: Label 'Do you wish to continue?';
        Text005: Label 'The update has been interrupted to respect the warning.';
        Text006: Label 'The %1 option can only be used internally in the system.';
        Text007: Label '%1 or %2 must be a Bank Account.';
        Text008: Label '" must be 0 when %1 is %2."';
        Text009: Label 'LCY';
        Text010: Label '%1 must be %2 or %3.';
        Text011: Label '%1 must be negative.';
        Text012: Label '%1 must be positive.';
        Text013: Label 'The %1 must not be more than %2.';
        Text014: Label 'The %1 %2 has a %3 %4.\Do you still want to use %1 %2 in this journal line?';
        txt001: Label 'You are not allowed to select this Nature of Deduction';
        GLAcc: Record "G/L Account";
        PayrollJournalLine: Record "Payroll Journal Line";
        ReplaceInfo: Boolean;
        Employee: Record Employee;
        BankAcc: Record "Bank Account";
        Employee2: Record Employee;
        BankAcc2: Record "Bank Account";
        GenJnlAlloc: Record "Gen. Jnl. Allocation";
        BankAcc3: Record "Bank Account";
        Currency: Record Currency;
        CurrExchRate: Record "Currency Exchange Rate";
        EmployeeLedgerEntry: Record "Employee Ledger Entry";
        AccNo: Code[20];
        AccType: Option Employee,"G/L Account","Bank Account";
        EmpEntrySetApplID: Codeunit "Employee Entry-SetAppl.ID";
        FromCurrencyCode: Code[10];
        ToCurrencyCode: Code[10];
        PayrollJnlApply: Codeunit "Payroll Jnl.-Apply";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        DimMgt: Codeunit DimensionManagement;
        PaymentToleranceMgt: Codeunit "Payment Tolerance Management";
        DimMgrAccountType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset",Employee," ";
        DimMgrBalAccountType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset",Employee," ";

    [LineStart(6817)]
    procedure CreateDim(Type1: Integer; No1: Code[20]; Type2: Integer; No2: Code[20]);
    var
        TableID: array[10] of Integer;
        No: array[10] of Code[20];
    begin
        TableID[1] := Type1;
        No[1] := No1;
        TableID[2] := Type2;
        No[2] := No2;
        "Global Dimension 1 Code" := '';
        "Global Dimension 2 Code" := '';

        //B2b1.0>>
        //DimMgt.GetDefaultDim(TableID,No,"Source Code","Global Dimension 1 Code","Global Dimension 2 Code");
        DimMgt.GetDefaultDimID(TableID, No, "Source Code", "Global Dimension 1 Code", "Global Dimension 2 Code", 0, 0);
        //B2b1.0<<

        if "Line No." <> 0 then
          //B2b1.0>> Function doesn't exist in Nav 2013
          /* DimMgt.UpdateJnlLineDefaultDim( DATABASE::"Payroll Journal Line","Pay Journal Template",
                                          "Pay Journal Batch","Line No.",0,
                                          "Global Dimension 1 Code","Global Dimension 2 Code");*/
          //B2b1.0<<

    end;

    [LineStart(6837)]
    procedure SetUpNewLine(RecLastPayrollJnlLine: Record "Payroll Journal Line"; Balance: Decimal; BottomLine: Boolean);
    begin
        PayJournalTemplate.Get("Pay Journal Template");
        PayGenJournalBatch.Get("Pay Journal Template", "Pay Journal Batch");
        PayrollJournalLine.SetRange("Pay Journal Template", "Pay Journal Template");
        PayrollJournalLine.SetRange("Pay Journal Batch", "Pay Journal Batch");
        if PayrollJournalLine.Find('-') then begin
            Validate("Posting Date", RecLastPayrollJnlLine."Posting Date");
            "Document Date" := RecLastPayrollJnlLine."Posting Date";
            "Document No." := RecLastPayrollJnlLine."Document No.";
            if BottomLine and (Balance - RecLastPayrollJnlLine."Balance (LCY)" = 0) and not RecLastPayrollJnlLine.EmptyLine then
                "Document No." := IncStr("Document No.");
        end
        else begin
            Validate("Posting Date", WorkDate);
            "Document Date" := WorkDate;
            if PayGenJournalBatch."No. Series" <> '' then begin
                Clear(NoSeriesMgt);
                "Document No." := NoSeriesMgt.TryGetNextNo(PayGenJournalBatch."No. Series", "Posting Date");
            end;
        end;

        //"Recurring Method" := RecLastPayrollJnlLine."Recurring Method";
        //"Account Type" := RecLastPayrollJnlLine."Account Type";
        "Account Type" := "Account Type"::Employee;
        "Document Type" := RecLastPayrollJnlLine."Document Type";
        "Source Code" := PayJournalTemplate."Source Code";
        "Reason Code" := PayGenJournalBatch."Reason Code";
        //"Posting No. Series" := PayGenJournalBatch."Posting No. Series";
        "Bal. Account Type" := PayGenJournalBatch."Bal. Account Type";

        if ("Account Type" in ["Account Type"::Employee]) and ("Bal. Account Type" in ["Bal. Account Type"::Employee])
        then
            "Bal. Account Type" := "Bal. Account Type"::"G/L Account";

        Validate("Bal. Account No.", PayGenJournalBatch."Bal. Account No.");
        Description := '';
    end;

    [LineStart(6877)]
    procedure UpdateSource();
    var
        SourceExists1: Boolean;
        SourceExists2: Boolean;
    begin
        SourceExists1 := ("Account Type" <> "Account Type"::"G/L Account") and ("Account No." <> '');
        SourceExists2 := ("Bal. Account Type" <> "Bal. Account Type"::"G/L Account") and ("Bal. Account No." <> '');
        case true of
            SourceExists1 and not SourceExists2:
                begin
                    case "Account Type" of
                        "Account Type"::Employee:
                            "Source Type" := "Source Type"::Employee;
                        "Account Type"::"Bank Account":
                            "Source Type" := "Source Type"::"Bank Account";
                    end;
                    "Source No." := "Account No.";
                end;
            SourceExists2 and not SourceExists1:
                begin
                    case "Bal. Account Type" of
                        "Bal. Account Type"::Employee:
                            "Source Type" := "Source Type"::Employee;
                        "Bal. Account Type"::"Bank Account":
                            "Source Type" := "Source Type"::"Bank Account";
                    end;
                    "Source No." := "Bal. Account No.";
                end;
            else begin
                    "Source Type" := "Source Type"::" ";
                    "Source No." := '';
                end;
        end;
    end;

    [LineStart(6908)]
    local procedure CheckGLAcc();
    begin
        GLAcc.CheckGLAcc;
        if GLAcc."Direct Posting" or ("Pay Journal Template" = '') then ///// OR "System-Created Entry" THEN
            exit;
        if "Posting Date" <> 0D then
            if "Posting Date" = ClosingDate("Posting Date") then
                exit;
        GLAcc.TestField("Direct Posting", true);
    end;

    [LineStart(6917)]
    local procedure SetCurrencyCode(AccType2: Option Employee,"G/L Account","Bank Account"; AccNo2: Code[20]): Boolean;
    begin
        "Currency Code" := '';
        if AccNo2 <> '' then
            case AccType2 of
                AccType2::Employee:
                    ;
                /*
                IF Employee2.GET(AccNo2) THEN
                  "Currency Code" := Employee2."Currency Code";
                */
                AccType2::"Bank Account":
                    if BankAcc2.Get(AccNo2) then
                        "Currency Code" := BankAcc2."Currency Code";
            end;
        exit("Currency Code" <> '');

    end;

    [LineStart(6932)]
    procedure UpdateLineBalance();
    begin
        if ((Amount > 0) and (not Correction)) or
           ((Amount < 0) and Correction) then begin
            "Debit Amount" := Amount;
            "Credit Amount" := 0
        end
        else begin
            "Debit Amount" := 0;
            "Credit Amount" := -Amount;
        end;

        if "Currency Code" = '' then
            "Amount (LCY)" := Amount;

        case true of
            ("Account No." <> '') and ("Bal. Account No." <> ''):
                "Balance (LCY)" := 0;
            "Bal. Account No." <> '':
                "Balance (LCY)" := -"Amount (LCY)";
            else
                "Balance (LCY)" := "Amount (LCY)";
        end;

        //CLEAR(GenJnlAlloc);
        //GenJnlAlloc.UpdateAllocations(Rec);
    end;

    [LineStart(6960)]
    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20]);
    begin

        //DIM1.0>> Function doesn't exist in Nav 2013
        //Code Commented.
        /*
         DimMgt.ValidateDimValueCode(FieldNumber,ShortcutDimCode);
        IF "Line No." <> 0 THEN
          DimMgt.SaveJnlLineDim(DATABASE::"Payroll Journal Line","Pay Journal Template",
                                "Pay Journal Batch","Line No.",0,FieldNumber,ShortcutDimCode)
        ELSE
          DimMgt.SaveTempDim(FieldNumber,ShortcutDimCode);
        
        
        *///DIM1.0<<
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");

    end;

    [LineStart(6976)]
    procedure LookupShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20]);
    begin
        DimMgt.LookupDimValueCode(FieldNumber, ShortcutDimCode);
        //B2b1.0>> Function doesn't exist in Nav 2013
        /*
        IF "Line No." <> 0 THEN
          DimMgt.SaveJnlLineDim(DATABASE::"Payroll Journal Line","Pay Journal Template",
                                "Pay Journal Batch","Line No.",0,FieldNumber,ShortcutDimCode)
        ELSE
          DimMgt.SaveTempDim(FieldNumber,ShortcutDimCode);
        *///B2B1.0<<

    end;

    [LineStart(6987)]
    procedure ShowShortcutDimCode(var ShortcutDimCode: array[8] of Code[20]);
    begin
        //B2b1.0>> Function doesn't exist in Nav 2013
        /*IF "Line No." <> 0 THEN
          DimMgt.ShowJnlLineDim(DATABASE::"Payroll Journal Line","Pay Journal Template",
                                "Pay Journal Batch","Line No.",0,ShortcutDimCode)
        ELSE
          DimMgt.ShowTempDim(ShortcutDimCode);
         *///B2B1.0<<

    end;

    [LineStart(6996)]
    local procedure GetCurrency();
    begin
        /*
        IF "Additional-Currency Posting" = "Additional-Currency Posting"::"Additional-Currency Amount Only" THEN
          BEGIN
            IF GLSetup."Additional Reporting Currency" = '' THEN
              GLSetup.GET;
            CurrencyCode := GLSetup."Additional Reporting Currency";
          END
        ELSE
          CurrencyCode := "Currency Code";
        
        IF CurrencyCode = '' THEN
          BEGIN
            CLEAR(Currency);
            Currency.InitRoundingPrecision
          END
        ELSE
          IF CurrencyCode <> Currency.Code THEN
            BEGIN
              Currency.GET(CurrencyCode);
              Currency.TESTFIELD("Amount Rounding Precision");
            END;
        */

    end;

    [LineStart(7020)]
    procedure CheckFixedCurrency(): Boolean;
    var
        CurrExchRate: Record "Currency Exchange Rate";
    begin
        CurrExchRate.SetRange("Currency Code", "Currency Code");
        CurrExchRate.SetRange("Starting Date", 0D, "Posting Date");

        if not CurrExchRate.Find('+') then
            exit(false);

        if CurrExchRate."Relational Currency Code" = '' then
            exit(
              CurrExchRate."Fix Exchange Rate Amount" =
              CurrExchRate."Fix Exchange Rate Amount"::Both);

        if CurrExchRate."Fix Exchange Rate Amount" <>
          CurrExchRate."Fix Exchange Rate Amount"::Both
        then
            exit(false);

        CurrExchRate.SetRange("Currency Code", CurrExchRate."Relational Currency Code");
        if CurrExchRate.Find('+') then
            exit(
              CurrExchRate."Fix Exchange Rate Amount" =
              CurrExchRate."Fix Exchange Rate Amount"::Both);

        exit(false);
    end;

    [LineStart(7045)]
    procedure EmptyLine(): Boolean;
    begin
        exit(("Account No." = '') and (Amount = 0) and
             (("Bal. Account No." = '') or not "System-Created Entry"));
    end;

    [LineStart(7049)]
    procedure ClearEmpApplID();
    begin
        if Rec."Bal. Account Type" in ["Bal. Account Type"::Employee] then begin
            AccType := Rec."Bal. Account Type";
            AccNo := Rec."Bal. Account No.";
        end
        else begin
            AccType := Rec."Account Type";
            AccNo := Rec."Account No.";
        end;

        case AccType of
            AccType::Employee:
                if Rec."Applies-to ID" <> '' then begin
                    EmployeeLedgerEntry.SetCurrentKey("Employee No.", Open);
                    EmployeeLedgerEntry.SetRange("Employee No.", AccNo);
                    EmployeeLedgerEntry.SetRange(Open, true);
                    EmployeeLedgerEntry.SetRange("Applies-to ID", Rec."Applies-to ID");
                    if EmployeeLedgerEntry.Find('-') then;
                    EmpEntrySetApplID.SetApplId(EmployeeLedgerEntry, '');
                end;
        end;
    end;

    [LineStart(7074)]
    procedure GetShowCurrencyCode(CurrencyCode: Code[10]): Code[10];
    begin
        if CurrencyCode <> '' then
            exit(CurrencyCode)
        else
            exit(Text009);
    end;

    [LineStart(7080)]
    procedure DimMgrTableType();
    begin
        DimMgrAccountType := DimMgrAccountType::" ";
        DimMgrBalAccountType := DimMgrBalAccountType::" ";

        case "Account Type" of
            "Account Type"::"G/L Account":
                DimMgrAccountType := DimMgrAccountType::"G/L Account";
            "Account Type"::Employee:
                DimMgrAccountType := DimMgrAccountType::Employee;
            "Account Type"::"Bank Account":
                DimMgrAccountType := DimMgrAccountType::"Bank Account";
        end;
        case "Bal. Account Type" of
            "Bal. Account Type"::"G/L Account":
                DimMgrBalAccountType := DimMgrBalAccountType::"G/L Account";
            "Bal. Account Type"::Employee:
                DimMgrBalAccountType := DimMgrBalAccountType::Employee;
            "Bal. Account Type"::"Bank Account":
                DimMgrBalAccountType := DimMgrBalAccountType::"Bank Account";
        end;
    end;

    [LineStart(7101)]
    procedure ShowDimensions();
    begin
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet2(
            "Dimension Set ID", StrSubstNo('%1 %2 %3', '', '', "Line No."),
            "Global Dimension 1 Code", "Global Dimension 2 Code");
    end;
}

