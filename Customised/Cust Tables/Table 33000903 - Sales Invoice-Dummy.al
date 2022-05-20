table 33000903 "Sales Invoice-Dummy"
{
    // version DIM1.0,Rev01

    // PROJECT : Efftronics
    // *****************************************************************************************************************************
    // SIGN
    // *****************************************************************************************************************************
    // B2B     : B2B Software Technologies
    // *****************************************************************************************************************************
    // VER      SIGN   USERID                 DATE                       DESCRIPTION
    // *****************************************************************************************************************************
    // 1.0       DIM   Jagadish      24-May-13                      -> Delete the Local variable (TempDocDimRecordTable357)


    fields
    {
        field(1;"Document Type";Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Amc,Tender';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Amc,Tender;
        }
        field(2;"Sell-to Customer No.";Code[20])
        {
            Caption = 'Sell-to Customer No.';
            TableRelation = Customer;

            trigger OnValidate();
            var
                Opp : Record Opportunity;
            begin
            end;
        }
        field(3;"No.";Code[30])
        {
            Caption = 'No.';
        }
        field(4;"Bill-to Customer No.";Code[20])
        {
            Caption = 'Bill-to Customer No.';
            NotBlank = true;
            TableRelation = Customer;

            trigger OnValidate();
            begin
                //Deleted Local var(TempDocDimRecordTable357) DIM
            end;
        }
        field(5;"Bill-to Name";Text[50])
        {
            Caption = 'Bill-to Name';
        }
        field(6;"Bill-to Name 2";Text[50])
        {
            Caption = 'Bill-to Name 2';
        }
        field(7;"Bill-to Address";Text[50])
        {
            Caption = 'Bill-to Address';
        }
        field(8;"Bill-to Address 2";Text[50])
        {
            Caption = 'Bill-to Address 2';
        }
        field(9;"Bill-to City";Text[30])
        {
            Caption = 'Bill-to City';
        }
        field(10;"Bill-to Contact";Text[50])
        {
            Caption = 'Bill-to Contact';
        }
        field(11;"Your Reference";Text[30])
        {
            Caption = 'Your Reference';
        }
        field(12;"Ship-to Code";Code[10])
        {
            Caption = 'Ship-to Code';
            TableRelation = "Ship-to Address".Code WHERE ("Customer No."=FIELD("Sell-to Customer No."));
        }
        field(13;"Ship-to Name";Text[50])
        {
            Caption = 'Ship-to Name';
        }
        field(14;"Ship-to Name 2";Text[50])
        {
            Caption = 'Ship-to Name 2';
        }
        field(15;"Ship-to Address";Text[50])
        {
            Caption = 'Ship-to Address';
        }
        field(16;"Ship-to Address 2";Text[50])
        {
            Caption = 'Ship-to Address 2';
        }
        field(17;"Ship-to City";Text[30])
        {
            Caption = 'Ship-to City';
        }
        field(18;"Ship-to Contact";Text[50])
        {
            Caption = 'Ship-to Contact';
        }
        field(19;"Order Date";Date)
        {
            Caption = 'Order Date';
        }
        field(20;"Posting Date";Date)
        {
            Caption = 'Posting Date';
        }
        field(21;"Shipment Date";Date)
        {
            Caption = 'Shipment Date';
        }
        field(22;"Posting Description";Text[50])
        {
            Caption = 'Posting Description';
        }
        field(23;"Payment Terms Code";Code[10])
        {
            Caption = 'Payment Terms Code';
            TableRelation = "Payment Terms" WHERE (Sales=CONST(true));
        }
        field(24;"Due Date";Date)
        {
            Caption = 'Due Date';
        }
        field(25;"Payment Discount %";Decimal)
        {
            Caption = 'Payment Discount %';
            DecimalPlaces = 0:5;
        }
        field(26;"Pmt. Discount Date";Date)
        {
            Caption = 'Pmt. Discount Date';
        }
        field(27;"Shipment Method Code";Code[10])
        {
            Caption = 'Shipment Method Code';
            TableRelation = "Shipment Method";
        }
        field(28;"Location Code";Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location WHERE ("Use As In-Transit"=CONST(false));
        }
        field(29;"Shortcut Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No."=CONST(1));
        }
        field(30;"Shortcut Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No."=CONST(2));
        }
        field(31;"Customer Posting Group";Code[10])
        {
            Caption = 'Customer Posting Group';
            Editable = true;
            TableRelation = "Customer Posting Group";
        }
        field(32;"Currency Code";Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(33;"Currency Factor";Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0:15;
            Editable = false;
            MinValue = 0;
        }
        field(34;"Customer Price Group";Code[10])
        {
            Caption = 'Customer Price Group';
            TableRelation = "Customer Price Group";
        }
        field(35;"Prices Including VAT";Boolean)
        {
            Caption = 'Prices Including VAT';

            trigger OnValidate();
            var
                SalesLine : Record "Sales Line";
                Currency : Record Currency;
                JobPostLine : Codeunit "Job Post-Line";
                RecalculatePrice : Boolean;
            begin
            end;
        }
        field(37;"Invoice Disc. Code";Code[20])
        {
            Caption = 'Invoice Disc. Code';
        }
        field(40;"Customer Disc. Group";Code[10])
        {
            Caption = 'Customer Disc. Group';
            TableRelation = "Customer Discount Group";
        }
        field(41;"Language Code";Code[10])
        {
            Caption = 'Language Code';
            TableRelation = Language;
        }
        field(43;"Salesperson Code";Code[10])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";

            trigger OnValidate();
            var
                ApprovalEntry : Record "Approval Entry";
            begin
                //Deleted local Var(TempDocDimRecordTable357) DIM
            end;
        }
        field(45;"Order Class";Code[10])
        {
            Caption = 'Order Class';
        }
        field(46;Comment;Boolean)
        {
            CalcFormula = Exist("Sales Comment Line" WHERE ("Document Type"=FIELD("Document Type"),
                                                            "No."=FIELD("No."),
                                                            "Document Line No."=CONST(0)));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(47;"No. Printed";Integer)
        {
            Caption = 'No. Printed';
            Editable = false;
        }
        field(51;"On Hold";Code[3])
        {
            Caption = 'On Hold';
        }
        field(52;"Applies-to Doc. Type";Option)
        {
            Caption = 'Applies-to Doc. Type';
            OptionCaption = '" ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund"';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(53;"Applies-to Doc. No.";Code[20])
        {
            Caption = 'Applies-to Doc. No.';

            trigger OnLookup();
            var
                ServTaxEntry : Record "Service Tax Entry";
            begin
            end;

            trigger OnValidate();
            var
                CustLedgEntry : Record "Cust. Ledger Entry";
                ServTaxEntry : Record "Service Tax Entry";
            begin
            end;
        }
        field(55;"Bal. Account No.";Code[20])
        {
            Caption = 'Bal. Account No.';
            TableRelation = IF ("Bal. Account Type"=CONST("G/L Account")) "G/L Account"
                            ELSE IF ("Bal. Account Type"=CONST("Bank Account")) "Bank Account";
        }
        field(57;Ship;Boolean)
        {
            Caption = 'Ship';
            Editable = false;
        }
        field(58;Invoice;Boolean)
        {
            Caption = 'Invoice';
        }
        field(60;Amount;Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Sales Line".Amount WHERE ("Document Type"=FIELD("Document Type"),
                                                         "Document No."=FIELD("No.")));
            Caption = 'Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(61;"Amount Including VAT";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Sales Line"."Amount Including VAT" WHERE ("Document Type"=FIELD("Document Type"),
                                                                         "Document No."=FIELD("No.")));
            Caption = 'Amount Including VAT';
            Editable = false;
            FieldClass = FlowField;
        }
        field(62;"Shipping No.";Code[20])
        {
            Caption = 'Shipping No.';
        }
        field(63;"Posting No.";Code[20])
        {
            Caption = 'Posting No.';
        }
        field(64;"Last Shipping No.";Code[20])
        {
            Caption = 'Last Shipping No.';
            Editable = false;
            TableRelation = "Sales Shipment Header";
        }
        field(65;"Last Posting No.";Code[20])
        {
            Caption = 'Last Posting No.';
            Editable = false;
            TableRelation = "Sales Invoice Header";
        }
        field(66;"Prepayment No.";Code[20])
        {
            Caption = 'Prepayment No.';
        }
        field(67;"Last Prepayment No.";Code[20])
        {
            Caption = 'Last Prepayment No.';
            TableRelation = "Sales Invoice Header";
        }
        field(68;"Prepmt. Cr. Memo No.";Code[20])
        {
            Caption = 'Prepmt. Cr. Memo No.';
        }
        field(69;"Last Prepmt. Cr. Memo No.";Code[20])
        {
            Caption = 'Last Prepmt. Cr. Memo No.';
            TableRelation = "Sales Cr.Memo Header";
        }
        field(70;"VAT Registration No.";Text[20])
        {
            Caption = 'VAT Registration No.';
        }
        field(71;"Combine Shipments";Boolean)
        {
            Caption = 'Combine Shipments';
        }
        field(73;"Reason Code";Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(74;"Gen. Bus. Posting Group";Code[10])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(75;"EU 3-Party Trade";Boolean)
        {
            Caption = 'EU 3-Party Trade';
        }
        field(76;"Transaction Type";Code[10])
        {
            Caption = 'Transaction Type';
            TableRelation = "Transaction Type";
        }
        field(77;"Transport Method";Code[20])
        {
            Caption = 'Transport Method';
            TableRelation = "Transport Method";
        }
        field(78;"VAT Country/Region Code";Code[10])
        {
            Caption = 'VAT Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(79;"Sell-to Customer Name";Text[50])
        {
            Caption = 'Sell-to Customer Name';
        }
        field(80;"Sell-to Customer Name 2";Text[50])
        {
            Caption = 'Sell-to Customer Name 2';
        }
        field(81;"Sell-to Address";Text[50])
        {
            Caption = 'Sell-to Address';
        }
        field(82;"Sell-to Address 2";Text[50])
        {
            Caption = 'Sell-to Address 2';
        }
        field(83;"Sell-to City";Text[30])
        {
            Caption = 'Sell-to City';
        }
        field(84;"Sell-to Contact";Text[50])
        {
            Caption = 'Sell-to Contact';
        }
        field(85;"Bill-to Post Code";Code[20])
        {
            Caption = 'Bill-to Post Code';
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(86;"Bill-to County";Text[30])
        {
            Caption = 'Bill-to County';
        }
        field(87;"Bill-to Country/Region Code";Code[10])
        {
            Caption = 'Bill-to Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(88;"Sell-to Post Code";Code[20])
        {
            Caption = 'Sell-to Post Code';
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(89;"Sell-to County";Text[30])
        {
            Caption = 'Sell-to County';
        }
        field(90;"Sell-to Country/Region Code";Code[10])
        {
            Caption = 'Sell-to Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(91;"Ship-to Post Code";Code[20])
        {
            Caption = 'Ship-to Post Code';
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(92;"Ship-to County";Text[30])
        {
            Caption = 'Ship-to County';
        }
        field(93;"Ship-to Country/Region Code";Code[10])
        {
            Caption = 'Ship-to Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(94;"Bal. Account Type";Option)
        {
            Caption = 'Bal. Account Type';
            OptionCaption = 'G/L Account,Bank Account';
            OptionMembers = "G/L Account","Bank Account";
        }
        field(97;"Exit Point";Code[10])
        {
            Caption = 'Exit Point';
            TableRelation = "Entry/Exit Point";
        }
        field(98;Correction;Boolean)
        {
            Caption = 'Correction';
        }
        field(99;"Document Date";Date)
        {
            Caption = 'Document Date';
        }
        field(100;"External Document No.";Code[20])
        {
            Caption = 'External Document No.';
        }
        field(101;"Area";Code[10])
        {
            Caption = 'Area';
            TableRelation = Area;
        }
        field(102;"Transaction Specification";Code[10])
        {
            Caption = 'Transaction Specification';
            TableRelation = "Transaction Specification";
        }
        field(104;"Payment Method Code";Code[10])
        {
            Caption = 'Payment Method Code';
            TableRelation = "Payment Method";
        }
        field(105;"Shipping Agent Code";Code[10])
        {
            Caption = 'Shipping Agent Code';
            TableRelation = "Shipping Agent";
        }
        field(106;"Package Tracking No.";Text[30])
        {
            Caption = 'Package Tracking No.';
        }
        field(107;"No. Series";Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(108;"Posting No. Series";Code[10])
        {
            Caption = 'Posting No. Series';
            TableRelation = "No. Series";
        }
        field(109;"Shipping No. Series";Code[10])
        {
            Caption = 'Shipping No. Series';
            TableRelation = "No. Series";
        }
        field(114;"Tax Area Code";Code[20])
        {
            Caption = 'Tax Area Code';
            TableRelation = "Tax Area";
        }
        field(115;"Tax Liable";Boolean)
        {
            Caption = 'Tax Liable';
        }
        field(116;"VAT Bus. Posting Group";Code[10])
        {
            Caption = 'VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";
        }
        field(117;Reserve;Option)
        {
            Caption = 'Reserve';
            OptionCaption = 'Never,Optional,Always';
            OptionMembers = Never,Optional,Always;
        }
        field(118;"Applies-to ID";Code[20])
        {
            Caption = 'Applies-to ID';

            trigger OnValidate();
            var
                TempCustLedgEntry : Record "Cust. Ledger Entry";
            begin
            end;
        }
        field(119;"VAT Base Discount %";Decimal)
        {
            Caption = 'VAT Base Discount %';
            DecimalPlaces = 0:5;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate();
            var
                ChangeLogMgt : Codeunit "Change Log Management";
                RecRef : RecordRef;
                xRecRef : RecordRef;
            begin
            end;
        }
        field(120;Status;Option)
        {
            Caption = 'Status';
            Editable = false;
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment";
        }
        field(121;"Invoice Discount Calculation";Option)
        {
            Caption = 'Invoice Discount Calculation';
            Editable = false;
            OptionCaption = 'None,%,Amount';
            OptionMembers = "None","%",Amount;
        }
        field(122;"Invoice Discount Value";Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Invoice Discount Value';
            Editable = false;
        }
        field(123;"Send IC Document";Boolean)
        {
            Caption = 'Send IC Document';
        }
        field(124;"IC Status";Option)
        {
            Caption = 'IC Status';
            OptionCaption = 'New,Pending,Sent';
            OptionMembers = New,Pending,Sent;
        }
        field(125;"Sell-to IC Partner Code";Code[20])
        {
            Caption = 'Sell-to IC Partner Code';
            Editable = false;
            TableRelation = "IC Partner";
        }
        field(126;"Bill-to IC Partner Code";Code[20])
        {
            Caption = 'Bill-to IC Partner Code';
            Editable = false;
            TableRelation = "IC Partner";
        }
        field(129;"IC Direction";Option)
        {
            Caption = 'IC Direction';
            OptionCaption = 'Outgoing,Incoming';
            OptionMembers = Outgoing,Incoming;
        }
        field(130;"Prepayment %";Decimal)
        {
            Caption = 'Prepayment %';
            DecimalPlaces = 0:5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(131;"Prepayment No. Series";Code[10])
        {
            Caption = 'Prepayment No. Series';
            TableRelation = "No. Series";
        }
        field(132;"Compress Prepayment";Boolean)
        {
            Caption = 'Compress Prepayment';
            InitValue = true;
        }
        field(133;"Prepayment Due Date";Date)
        {
            Caption = 'Prepayment Due Date';
        }
        field(134;"Prepmt. Cr. Memo No. Series";Code[10])
        {
            Caption = 'Prepmt. Cr. Memo No. Series';
            TableRelation = "No. Series";
        }
        field(135;"Prepmt. Posting Description";Text[50])
        {
            Caption = 'Prepmt. Posting Description';
        }
        field(138;"Prepmt. Pmt. Discount Date";Date)
        {
            Caption = 'Prepmt. Pmt. Discount Date';
        }
        field(139;"Prepmt. Payment Terms Code";Code[10])
        {
            Caption = 'Prepmt. Payment Terms Code';
            TableRelation = "Payment Terms";

            trigger OnValidate();
            var
                PaymentTerms : Record "Payment Terms";
            begin
            end;
        }
        field(140;"Prepmt. Payment Discount %";Decimal)
        {
            Caption = 'Prepmt. Payment Discount %';
            DecimalPlaces = 0:5;
        }
        field(151;"Quote No.";Code[20])
        {
            Caption = 'Quote No.';
            Editable = false;
        }
        field(5043;"No. of Archived Versions";Integer)
        {
            CalcFormula = Max("Sales Header Archive"."Version No." WHERE ("Document Type"=FIELD("Document Type"),
                                                                          "No."=FIELD("No."),
                                                                          "Doc. No. Occurrence"=FIELD("Doc. No. Occurrence")));
            Caption = 'No. of Archived Versions';
            Editable = true;
            FieldClass = FlowField;
        }
        field(5048;"Doc. No. Occurrence";Integer)
        {
            Caption = 'Doc. No. Occurrence';
        }
        field(5050;"Campaign No.";Code[20])
        {
            Caption = 'Campaign No.';
            TableRelation = Campaign;

            trigger OnValidate();
            var
                ChangeLogMgt : Codeunit "Change Log Management";
                RecRef : RecordRef;
                xRecRef : RecordRef;
            begin
                //Deleted Local var(TempDocDimRecordTable357) DIM
            end;
        }
        field(5051;"Sell-to Customer Template Code";Code[10])
        {
            Caption = 'Sell-to Customer Template Code';
            TableRelation = "Customer Template";

            trigger OnValidate();
            var
                SellToCustTemplate : Record "Customer Template";
            begin
            end;
        }
        field(5052;"Sell-to Contact No.";Code[20])
        {
            Caption = 'Sell-to Contact No.';
            TableRelation = Contact;

            trigger OnLookup();
            var
                Cont : Record Contact;
                ContBusinessRelation : Record "Contact Business Relation";
            begin
            end;

            trigger OnValidate();
            var
                ContBusinessRelation : Record "Contact Business Relation";
                Cont : Record Contact;
                Opportunity : Record Opportunity;
                ChangeLogMgt : Codeunit "Change Log Management";
                RecRef : RecordRef;
                xRecRef : RecordRef;
            begin
            end;
        }
        field(5053;"Bill-to Contact No.";Code[20])
        {
            Caption = 'Bill-to Contact No.';
            TableRelation = Contact;

            trigger OnLookup();
            var
                Cont : Record Contact;
                ContBusinessRelation : Record "Contact Business Relation";
            begin
            end;

            trigger OnValidate();
            var
                ContBusinessRelation : Record "Contact Business Relation";
                Cont : Record Contact;
            begin
            end;
        }
        field(5054;"Bill-to Customer Template Code";Code[10])
        {
            Caption = 'Bill-to Customer Template Code';
            TableRelation = "Customer Template";

            trigger OnValidate();
            var
                BillToCustTemplate : Record "Customer Template";
            begin
                //Deleted Local var(TempDocDimRecordTable357) DIM
            end;
        }
        field(5055;"Opportunity No.";Code[20])
        {
            Caption = 'Opportunity No.';

            trigger OnValidate();
            var
                Opportunity : Record Opportunity;
                SalesHeader : Record "Sales Header";
            begin
            end;
        }
        field(5700;"Responsibility Center";Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";
        }
        field(5750;"Shipping Advice";Option)
        {
            Caption = 'Shipping Advice';
            OptionCaption = 'Partial,Complete';
            OptionMembers = Partial,Complete;
        }
        field(5752;"Completely Shipped";Boolean)
        {
            CalcFormula = Min("Sales Line"."Completely Shipped" WHERE ("Document Type"=FIELD("Document Type"),
                                                                       "Document No."=FIELD("No."),
                                                                       Type=FILTER(<>" "),
                                                                       "Location Code"=FIELD("Location Filter")));
            Caption = 'Completely Shipped';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5753;"Posting from Whse. Ref.";Integer)
        {
            Caption = 'Posting from Whse. Ref.';
        }
        field(5754;"Location Filter";Code[10])
        {
            Caption = 'Location Filter';
            FieldClass = FlowFilter;
            TableRelation = Location;
        }
        field(5790;"Requested Delivery Date";Date)
        {
            Caption = 'Requested Delivery Date';
        }
        field(5791;"Promised Delivery Date";Date)
        {
            Caption = 'Promised Delivery Date';
        }
        field(5792;"Shipping Time";DateFormula)
        {
            Caption = 'Shipping Time';
        }
        field(5793;"Outbound Whse. Handling Time";DateFormula)
        {
            Caption = 'Outbound Whse. Handling Time';
        }
        field(5794;"Shipping Agent Service Code";Code[10])
        {
            Caption = 'Shipping Agent Service Code';
            TableRelation = "Shipping Agent Services".Code WHERE ("Shipping Agent Code"=FIELD("Shipping Agent Code"));
        }
        field(5795;"Late Order Shipping";Boolean)
        {
            CalcFormula = Exist("Sales Line" WHERE ("Document Type"=FIELD("Document Type"),
                                                    "Sell-to Customer No."=FIELD("Sell-to Customer No."),
                                                    "Document No."=FIELD("No."),
                                                    "Shipment Date"=FIELD("Date Filter"),
                                                    "Outstanding Quantity"=FILTER(<>0)));
            Caption = 'Late Order Shipping';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5796;"Date Filter";Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(5800;Receive;Boolean)
        {
            Caption = 'Receive';
        }
        field(5801;"Return Receipt No.";Code[20])
        {
            Caption = 'Return Receipt No.';
        }
        field(5802;"Return Receipt No. Series";Code[10])
        {
            Caption = 'Return Receipt No. Series';
            TableRelation = "No. Series";
        }
        field(5803;"Last Return Receipt No.";Code[20])
        {
            Caption = 'Last Return Receipt No.';
            Editable = false;
            TableRelation = "Return Receipt Header";
        }
        field(7001;"Allow Line Disc.";Boolean)
        {
            Caption = 'Allow Line Disc.';
        }
        field(7200;"Get Shipment Used";Boolean)
        {
            Caption = 'Get Shipment Used';
            Editable = false;
        }
        field(8725;Signature;BLOB)
        {
            Caption = 'Signature';
            SubType = Bitmap;
        }
        field(9000;"Assigned User ID";Code[50])
        {
            Caption = 'Assigned User ID';
            Description = 'Rev01';
            TableRelation = "User Setup";
        }
        field(13701;"Assessee Code";Code[10])
        {
            Caption = 'Assessee Code';
            TableRelation = "Assessee Code";
        }
        field(13706;"Excise Bus. Posting Group";Code[10])
        {
            Caption = 'Excise Bus. Posting Group';
            TableRelation = "Excise Bus. Posting Group";
        }
        field(13731;"Amount to Customer";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Sales Line"."Amount To Customer" WHERE ("Document Type"=FIELD("Document Type"),
                                                                       "Document No."=FIELD("No.")));
            Caption = 'Amount to Customer';
            Editable = false;
            FieldClass = FlowField;
        }
        field(13736;"Bill to Customer State";Code[10])
        {
            Caption = 'Bill to Customer State';
            TableRelation = State;
        }
        field(13737;"Form Code";Code[10])
        {
            Caption = 'Form Code';
            TableRelation = "State Forms"."Form Code" WHERE (State=FIELD(State),
                                                             "Transit Document"=CONST(false));
        }
        field(13738;"Form No.";Code[10])
        {
            Caption = 'Form No.';
            Editable = false;
        }
        field(13751;"Transit Document";Boolean)
        {
            Caption = 'Transit Document';
        }
        field(13752;State;Code[10])
        {
            Caption = 'State';
            TableRelation = State;
        }
        field(13753;"LC No.";Code[20])
        {
            Caption = 'LC No.';
            TableRelation = "LC Detail"."No." WHERE ("Transaction Type"=CONST(Sale),
                                                     "Issued To/Received From"=FIELD("Bill-to Customer No."),
                                                     Closed=CONST(false),
                                                     Released=CONST(true));

            trigger OnValidate();
            var
                LCDetail : Record "LC Detail";
                Text13700 : Label 'The LC which you have selected is Foreign type you cannot utilise for this order.';
            begin
            end;
        }
        field(13790;Structure;Code[10])
        {
            Caption = 'Structure';
            TableRelation = "Structure Header";

            trigger OnValidate();
            var
                StrDetails : Record "Structure Details";
                StrOrderDetails : Record "Structure Order Details";
                StrOrderLines : Record "Structure Order Line Details";
                SaleLines : Record "Sales Line";
            begin
            end;
        }
        field(16410;"Free Supply";Boolean)
        {
            Caption = 'Free Supply';
        }
        field(16411;"Export or Deemed Export";Boolean)
        {
            Caption = 'Export or Deemed Export';
            Editable = false;
        }
        field(16412;"VAT Exempted";Boolean)
        {
            Caption = 'VAT Exempted';
            Editable = false;
        }
        field(16501;Trading;Boolean)
        {
            Caption = 'Trading';
        }
        field(16502;"Transaction No. Serv. Tax";Integer)
        {
            Caption = 'Transaction No. Serv. Tax';
        }
        field(16503;"Re-Dispatch";Boolean)
        {
            Caption = 'Re-Dispatch';
        }
        field(16504;"Return Re-Dispatch Rcpt. No.";Code[20])
        {
            Caption = 'Return Re-Dispatch Rcpt. No.';

            trigger OnLookup();
            var
                ReturnRcptLine : Record "Return Receipt Line";
            begin
            end;

            trigger OnValidate();
            var
                ReturnRcptLine : Record "Return Receipt Line";
                LineNo : Integer;
            begin
            end;
        }
        field(16505;"TDS Certificate Receivable";Boolean)
        {
            Caption = 'TDS Certificate Receivable';
        }
        field(16508;"Price Inclusive of Taxes";Boolean)
        {
            CalcFormula = Exist("Sales Line" WHERE ("Document Type"=FIELD("Document Type"),
                                                    "Document No."=FIELD("No."),
                                                    Type=FILTER(Item),
                                                    "Price Inclusive of Tax"=FILTER(true)));
            Caption = 'Price Inclusive of Taxes';
            Editable = false;
            FieldClass = FlowField;
        }
        field(16509;"Calc. Inv. Discount (%)";Boolean)
        {
            Caption = 'Calc. Inv. Discount (%)';

            trigger OnValidate();
            var
                SalesLine2 : Record "Sales Line";
            begin
            end;
        }
        field(16510;"Time of Removal";Time)
        {
            Caption = 'Time of Removal';
        }
        field(16511;"LR/RR No.";Code[20])
        {
            Caption = 'LR/RR No.';
        }
        field(16512;"LR/RR Date";Date)
        {
            Caption = 'LR/RR Date';
        }
        field(16513;"Vehicle No.";Code[20])
        {
            Caption = 'Vehicle No.';
        }
        field(16514;"Mode of Transport";Text[15])
        {
            Caption = 'Mode of Transport';
        }
        field(16515;"ST Pure Agent";Boolean)
        {
            Caption = 'ST Pure Agent';
        }
        field(16516;"Nature of Services";Option)
        {
            Caption = 'Nature of Services';
            OptionCaption = '" ,Exempted,Export"';
            OptionMembers = " ",Exempted,Export;
        }
        field(16522;"Service Tax Rounding Precision";Decimal)
        {
            Caption = 'Service Tax Rounding Precision';
        }
        field(16523;"Service Tax Rounding Type";Option)
        {
            Caption = 'Service Tax Rounding Type';
            OptionCaption = 'Nearest,Up,Down';
            OptionMembers = Nearest,Up,Down;
        }
        field(16524;"Sale Return Type";Option)
        {
            Caption = 'Sale Return Type';
            OptionCaption = '" ,Sales Cancellation"';
            OptionMembers = " ","Sales Cancellation";
        }
        field(50000;"MSPT Date";Date)
        {
            Description = 'MSPT1.0';
        }
        field(50001;"MSPT Code";Code[20])
        {
            Description = 'MSPT1.0';
            TableRelation = "MSPT Header".Code WHERE (Status=CONST(Released));
        }
        field(50002;"MSPT Applicable at Line Level";Boolean)
        {
            Description = 'MSPT1.0';
        }
        field(50003;WayBillNo;Text[30])
        {
        }
        field(50004;"posting time";Time)
        {
        }
        field(50005;userid1;Code[50])
        {
            Description = 'Rev01';
            TableRelation = User."User Name";
        }
        field(50006;"Work Order Number";Text[30])
        {
        }
        field(60001;"RDSO Charges Paid By";Option)
        {
            Description = 'B2B';
            OptionMembers = " ","By Customer","By Railways";
        }
        field(60002;"CA Number";Code[20])
        {
            Description = 'B2B';
        }
        field(60003;"CA Date";Date)
        {
            Description = 'B2B';
        }
        field(60004;"Type of Enquiry";Option)
        {
            Description = 'B2B';
            OptionMembers = Direct,Indirect;
        }
        field(60005;"Type of Product";Option)
        {
            Description = 'B2B';
            OptionMembers = Standard,Customized;
        }
        field(60006;"Document Position";Option)
        {
            Description = 'B2B';
            Editable = false;
            OptionMembers = Sales,Design,CRM;
        }
        field(60007;"Cancel Short Close";Option)
        {
            Description = 'B2B';
            OptionCaption = '" ,Cancelled,Short Closed"';
            OptionMembers = " ",Cancelled,"Short Closed";
        }
        field(60008;"RDSO Inspection Required";Boolean)
        {
            Description = 'B2B';
        }
        field(60009;"RDSO Inspection By";Option)
        {
            Description = 'B2B';
            OptionMembers = " ","By RDSO","By Consignee";
        }
        field(60010;"BG Required";Boolean)
        {
            Description = 'B2B';
        }
        field(60011;"BG No.";Code[20])
        {
            Description = 'B2B';
        }
        field(60012;Territory;Code[20])
        {
            Description = 'B2B';
            TableRelation = Territory;
        }
        field(60013;"Security Status";Code[20])
        {
            Description = 'B2B';
        }
        field(60014;"LD Amount";Decimal)
        {
            BlankZero = true;
            Description = 'B2B';
        }
        field(60015;"RDSO Charges";Decimal)
        {
            BlankZero = true;
            Description = 'B2B';
        }
        field(60016;"Customer OrderNo.";Code[65])
        {
            Description = 'B2B';
        }
        field(60017;"Customer Order Date";Date)
        {
            Description = 'B2B';
        }
        field(60018;"Security Deposit";Option)
        {
            Description = 'B2B';
            OptionCaption = '" ,BG,FDR,DD,Running Bills"';
            OptionMembers = " ",BG,FDR,DD,"Running Bills";
        }
        field(60019;"RDSO Call Letter";Option)
        {
            Description = 'B2B';
            OptionCaption = '" ,Customer,RDSO"';
            OptionMembers = " ",Customer,RDSO;
        }
        field(60020;"Enquiry Status";Option)
        {
            Description = 'B2B';
            OptionCaption = '" ,Open,Closed,Order Received"';
            OptionMembers = " ",Open,Closed,"Order Received";
        }
        field(60021;"Project Completion Date";Date)
        {
            Description = 'B2B';
        }
        field(60022;"Extended Date";Date)
        {
            Description = 'B2B';
        }
        field(60023;"Bktord Des Approval";Boolean)
        {
        }
        field(60024;"SalOrd Des Approval";Boolean)
        {
        }
        field(60030;"Type of Customer";Option)
        {
            Description = 'B2B';
            OptionCaption = 'Existing,New';
            OptionMembers = Existing,New;
        }
        field(60031;"Nature of Enquiry";Option)
        {
            Description = 'B2B';
            OptionCaption = 'Single,Multiple';
            OptionMembers = Single,Multiple;
        }
        field(60032;Product;Code[10])
        {
            Description = 'B2B';
            TableRelation = "Service Item Group";
        }
        field(60033;"Quote Value";Decimal)
        {
            CalcFormula = Sum("Sales Line"."Line Amount" WHERE ("Document Type"=CONST(Quote),
                                                                "Document No."=FIELD("No.")));
            Description = 'B2B';
            FieldClass = FlowField;
        }
        field(60034;"Installation Amount";Decimal)
        {
            CalcFormula = Sum("Sales Line"."Line Amount(LOA)" WHERE ("Document No."=FIELD("No."),
                                                                     "No."=FILTER('47300')));
            Description = 'B2B';
            FieldClass = FlowField;
        }
        field(60035;"Bought out Items Amount";Decimal)
        {
            CalcFormula = Sum("Sales Line"."Line Amount(LOA)" WHERE ("Document No."=FIELD("No."),
                                                                     "Gen. Prod. Posting Group"=FILTER('BOI'|'RAW-MAT')));
            Description = 'B2B';
            FieldClass = FlowField;
        }
        field(60036;"Software Amount";Decimal)
        {
            CalcFormula = Sum("Sales Line"."Line Amount(LOA)" WHERE ("Document No."=FIELD("No."),
                                                                     "No."=FILTER('46400'|'18100'|'47505')));
            Description = 'B2B';
            FieldClass = FlowField;
        }
        field(60037;"Total Order Amount";Decimal)
        {
            CalcFormula = Sum("Sales Line"."Line Amount" WHERE ("Document No."=FIELD("No.")));
            Description = 'B2B';
            FieldClass = FlowField;
        }
        field(60038;"Total Order Amount(With Taxes)";Decimal)
        {
            CalcFormula = Sum("Sales Line"."Amount Including Tax" WHERE ("Document No."=FIELD("No.")));
            Description = 'EFF';
            FieldClass = FlowField;
        }
        field(60041;"Security Deposit Amount";Decimal)
        {
            Description = 'B2B';
        }
        field(60042;"Deposit Payment Due Date";Date)
        {
            Description = 'B2B';
        }
        field(60043;"Deposit Payment Date";Date)
        {
            Description = 'B2B';
        }
        field(60044;"Security Deposit Status";Code[20])
        {
            Description = 'B2B';
        }
        field(60045;"SD Requested Date";Date)
        {
            Description = 'B2B';
        }
        field(60046;"SD Required Date";Date)
        {
            Description = 'B2B';
        }
        field(60047;"SecurityDeposit Exp. Rcpt Date";Date)
        {
            Description = 'B2B';
        }
        field(60050;"Tender No.";Code[20])
        {
            Description = 'B2B';
            TableRelation = "Tender Header";
        }
        field(60053;"Final Bill Date";Date)
        {
            Description = 'B2B';
        }
        field(60054;"Warranty Period";DateFormula)
        {
            Description = 'B2B';
        }
        field(60055;"SD Status";Option)
        {
            Description = 'B2B';
            OptionCaption = 'Not Received,Received,NA';
            OptionMembers = "Not Received",Received,NA;
        }
        field(60056;"Released to Sales User ID";Code[50])
        {
            Description = 'Rev01';
            Editable = false;
            TableRelation = User."User Name";
        }
        field(60057;"Released to Sales Date";Date)
        {
            Editable = false;
        }
        field(60058;"Released to Design User ID";Code[50])
        {
            Description = 'Rev01';
            Editable = false;
            TableRelation = User."User Name";
        }
        field(60059;"Released to Design Date";Date)
        {
            Editable = false;
        }
        field(60061;"Sale Order Total Amount";Decimal)
        {
        }
        field(60063;"Order Status";Option)
        {
            OptionMembers = ,Dispatched,Inprogress,"Ready For Dispatch","Ready For RDSO","RDSO Inspected","Yet to Start","Order Pending",Completed,Cancel;
        }
        field(60064;Inspection;Code[50])
        {
        }
        field(60065;CallLetterExpireDate;Date)
        {
        }
        field(60066;CallLetterRecivedDate;Date)
        {
        }
        field(60068;Installation;Option)
        {
            OptionMembers = " ",RlyInstallation,EffInstallation,"RLY&EFF";
        }
        field(60069;"Inst.Status";Option)
        {
            OptionMembers = ," Raliway Pending","Railway Inprogress",Inprogress,Planned,"To Be Planned",Completed," ";
        }
        field(60073;Remarks;Text[100])
        {
        }
        field(60074;"Call letters Status";Option)
        {
            OptionMembers = " ",Received,Pending,NA;
        }
        field(60075;"Call Letter Exp.Date";Date)
        {
        }
        field(60076;"BG Status";Option)
        {
            OptionMembers = " ",Submitted,Pending,NA;
        }
        field(60077;"Inst.Start Date";Date)
        {
        }
        field(60078;"Exp.Payment";Decimal)
        {
        }
        field(60081;"Assured Date";Date)
        {
        }
        field(60087;"Station Names";Text[50])
        {
        }
        field(60088;"Shortage Calculation";Boolean)
        {
        }
        field(60089;"Sale Order No.";Code[20])
        {
            TableRelation = "Sales Header"."No." WHERE ("Document Type"=CONST(Order));
        }
        field(60090;"RDSO Inspection Req";Option)
        {
            OptionMembers = " ",YES,NA;
        }
        field(60095;"Order Assurance";Boolean)
        {
        }
        field(60096;"Expected Order Month";Option)
        {
            OptionMembers = "  ",APR,MAY,JUN,JUL,AUG,SEP,OCT,NOV,DEC,JAN,FEB,MAR,"     ";
        }
        field(60097;"Sale Order Created";Boolean)
        {
        }
        field(60098;"Purchase Value";Decimal)
        {
            CalcFormula = Sum("Item Lot Numbers".Total WHERE ("Sales Order No."=FIELD("No.")));
            FieldClass = FlowField;
        }
        field(60099;"Request for Authorisation";Boolean)
        {
        }
        field(60116;"Order Completion Period";Integer)
        {
            MaxValue = 360;
            MinValue = 1;
        }
        field(60117;"Expecting Week";Date)
        {
        }
        field(60119;"Total Order(LOA)Value";Decimal)
        {
            CalcFormula = Sum("Sales Line"."Line Amount(LOA)" WHERE ("Document No."=FIELD("No.")));
            FieldClass = FlowField;
        }
        field(60120;"Pending(LOA)Value";Decimal)
        {
            CalcFormula = Sum("Sales Line"."OutStanding(LOA)" WHERE ("Document No."=FIELD("No."),
                                                                     "Document Type"=FILTER(Order)));
            FieldClass = FlowField;
        }
        field(60121;"Blanket Order No";Text[30])
        {
        }
        field(80000;"Order Released Date";Date)
        {
            Caption = 'Order Released Date';
        }
        field(99008500;"Date Received";Date)
        {
            Caption = 'Date Received';
        }
        field(99008501;"Time Received";Time)
        {
            Caption = 'Time Received';
        }
        field(99008502;"BizTalk Request for Sales Qte.";Boolean)
        {
            Caption = 'BizTalk Request for Sales Qte.';
        }
        field(99008503;"BizTalk Sales Order";Boolean)
        {
            Caption = 'BizTalk Sales Order';
        }
        field(99008509;"Date Sent";Date)
        {
            Caption = 'Date Sent';
        }
        field(99008510;"Time Sent";Time)
        {
            Caption = 'Time Sent';
        }
        field(99008513;"BizTalk Sales Quote";Boolean)
        {
            Caption = 'BizTalk Sales Quote';
        }
        field(99008514;"BizTalk Sales Order Cnfmn.";Boolean)
        {
            Caption = 'BizTalk Sales Order Cnfmn.';
        }
        field(99008518;"Customer Quote No.";Code[30])
        {
            Caption = 'Customer Quote No.';
        }
        field(99008519;"Customer Order No.";Code[50])
        {
            Caption = 'Customer Order No.';
        }
        field(99008521;"BizTalk Document Sent";Boolean)
        {
            Caption = 'BizTalk Document Sent';
        }
        field(99008522;"EMD Amount";Decimal)
        {
        }
        field(99008523;"EMD Status";Option)
        {
            OptionCaption = 'Due,Received';
            OptionMembers = Due,Received;
        }
        field(99008524;SecDepStatus;Option)
        {
            Description = 'Added by Pranavi for sd tracking';
            OptionCaption = 'Running,Warranty,Due,Received';
            OptionMembers = Running,Warranty,Due,Received;
        }
        field(99008525;"Final Railway Bill Date";Date)
        {
            Description = 'Added by Pranavi for sd status tracking';
        }
    }

    keys
    {
        key(Key1;"Document Type","No.")
        {
        }
    }

    fieldgroups
    {
    }
}

