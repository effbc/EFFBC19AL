tableextension 70014 PurchaselineExt extends "Purchase Line"
{
    // version NAVW19.00.00.51947,NAVIN9.00.00.51947,TFS225680,QC1.0,QCB2B1.2,POAU,PO1.0,Rev01,SQL,TDS-REGEF-194Q

    fields
    {
        modify("Document Type")
        {
            OptionCaptionML = ENU = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Enquiry', ENN = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Enquiry';

            //Unsupported feature: Change OptionString on ""Document Type"(Field 1)". Please convert manually.

        }
        modify("Buy-from Vendor No.")
        {
            CaptionML = ENU = 'Vendor No.', ENN = 'Vendor No.';

            //Unsupported feature: Change Editable on ""Buy-from Vendor No."(Field 2)". Please convert manually.

        }
        modify("Document No.")
        {

            //Unsupported feature: Change TableRelation on ""Document No."(Field 3)". Please convert manually.

            CaptionML = ENU = 'Purchase Order No.', ENN = 'Purchase Order No.';
        }

        //Unsupported feature: Change OptionString on "Type(Field 5)". Please convert manually.

        modify("No.")
        {

            //Unsupported feature: Change TableRelation on ""No."(Field 6)". Please convert manually.


            //Unsupported feature: Change ValidateTableRelation on ""No."(Field 6)". Please convert manually.

            CaptionML = ENU = 'Item No.', ENN = 'Item No.';
            CaptionClass = GetCaptionClass(FieldNo("No."));
        }



        modify("Line Amount")
        {
            CaptionClass = GetCaptionClass(FieldNo("Line Amount"));
        }


        modify("Prepmt. Line Amount")
        {
            CaptionClass = GetCaptionClass(FieldNo("Prepmt. Line Amount"));
        }
        modify("Prepmt. Amt. Inv.")
        {

            //Unsupported feature: Change Editable on ""Prepmt. Amt. Inv."(Field 111)". Please convert manually.

            CaptionClass = GetCaptionClass(FieldNo("Prepmt. Amt. Inv."));
        }



        modify("Prepmt Amt to Deduct")
        {
            CaptionClass = GetCaptionClass(FieldNo("Prepmt Amt to Deduct"));
        }
        modify("Prepmt Amt Deducted")
        {

            //Unsupported feature: Change Editable on ""Prepmt Amt Deducted"(Field 122)". Please convert manually.

            CaptionClass = GetCaptionClass(FieldNo("Prepmt Amt Deducted"));
        }


        field(60001; "Indent No."; Code[20])
        {
            Description = 'B2B';
            Editable = true;
            TableRelation = IF (Type = FILTER(<> " ")) "Indent Line" WHERE("Indent Status" = FILTER(Indent | Enquiry | Offer | Order));
        }
        field(60002; "Indent Line No."; Integer)
        {
            Description = 'B2B';
            Editable = true;
        }
        field(60003; Remarks; Text[80])
        {
            Description = 'B2B';
        }
        field(60004; "ICN No."; Code[20])
        {
            Description = 'POAU';
        }
        field(60005; "Document Date"; Date)
        {
            CalcFormula = Lookup("Purchase Header"."Order Date" WHERE("No." = FIELD("Document No.")));
            FieldClass = FlowField;
        }
        field(60006; "Deviated Receipt Date"; Date)
        {

            trigger OnValidate();
            begin
                if not (UpperCase(UserId) in ['EFFTRONICS\PADMASRI', 'EFFTRONICS\CHOWDARY', 'EFFTRONICS\BRAHMAIAH', 'EFFTRONICS\PARDHU', 'SUPER', 'EFFTRONICS\ANANDA', 'EFFTRONICS\PKOTESWARARAO', 'EFFTRONICS\GRAVI',
                                               'EFFTRONICS\RENUKACH', 'EFFTRONICS\RAVIKIRAN', 'EFFTRONICS\ANVESH', 'EFFTRONICS\SPURTHI', 'EFFTRONICS\NSUDHEER', 'EFFTRONICS\RATNA',
                                               'EFFTRONICS\19TE308', 'EFFTRONICS\LAKSHMIKANTH', 'EFFTRONICS\TPRIYANKA']) then
                    Error('YOU DONT HAVE SUFFICIENT RIGHTS');
            end;
        }
        field(60010; Period; Integer)
        {
        }
        field(60011; "Vendor Name"; Text[50])
        {
            CalcFormula = Lookup(Vendor.Name WHERE("No." = FIELD("Buy-from Vendor No.")));
            FieldClass = FlowField;
        }
        field(60012; "Deviated By"; Option)
        {
            OptionMembers = Vendor,Organisation;
        }
        field(60013; Sample; Boolean)
        {
        }
        field(60014; Make; Code[30])
        {
        }
        field(60015; "Account No."; Code[10])
        {
        }
        field(60016; "Purchase Orders"; Integer)
        {
            CalcFormula = Count("Purchase Line" WHERE(Type = CONST(Item),
                                                       "No." = FILTER(<> ''),
                                                       "No." = FIELD("No."),
                                                       "Document Type" = CONST(Order)));
            FieldClass = FlowField;
        }
        field(60017; "Customs Duty Value"; Decimal)
        {
        }
        field(60018; "Customs Duty Paid to"; Code[10])
        {
            TableRelation = Vendor WHERE(Blocked = CONST(" "));
        }
        field(60019; "Customs To be Paid on"; Date)
        {
        }
        field(60090; "Dimension Corrected"; Boolean)
        {
            Description = 'added  by sujani for Dimension issue clearance (B2B Assistance)';
            Editable = false;
        }
        field(60091; "OLD Dim Set ID"; Integer)
        {
            Description = 'added  by sujani for Dimension issue clearance (B2B Assistance)';
            Editable = false;
            TableRelation = "Dimension Set Entry Backup2"."Dimension Set ID" WHERE("Dimension Set ID" = FIELD("OLD Dim Set ID"));

            trigger OnLookup();
            begin
                //ShowDimensionsOLD;
            end;
        }
        field(60093; "AMC Order"; Boolean)
        {
        }
        field(60094; "Frieght Charges"; Decimal)
        {

            trigger OnValidate();
            begin
                STRUCTURE_ORDER_DETAILS.SetRange(STRUCTURE_ORDER_DETAILS."Document No.", "Document No.");
                STRUCTURE_ORDER_DETAILS.SetRange(STRUCTURE_ORDER_DETAILS."Tax/Charge Group", 'FREIGHT');
                STRUCTURE_ORDER_DETAILS.SetFilter(STRUCTURE_ORDER_DETAILS."Calculation Value", '>%1', 0);
                if STRUCTURE_ORDER_DETAILS.FindFirst then
                    Error(' PLEASE REMOVE THE FRIEGHT CHARGES IN STRUTURE DETAILS');
            end;
        }
        field(60095; "Purchase_Order No."; Code[20])
        {
        }
        field(60096; "No. Of Deviations"; Integer)
        {
            CalcFormula = Count("Excepted Rcpt.Date Tracking" WHERE("Document Type" = FIELD("Document Type"),
                                                                     "Document No." = FIELD("Document No."),
                                                                     "Document Line No." = FIELD("Line No.")));
            FieldClass = FlowField;
        }
        field(60097; "Taxes Value"; Decimal)
        {
            CalcFormula = Sum("Structure Order Line Details"."Amount (LCY)" WHERE(Type = CONST(Purchase),
                                                                                   "Document Type" = CONST(Order),
                                                                                   "Document No." = FIELD("Document No."),
                                                                                   "Line No." = FIELD("Line No.")));
            FieldClass = FlowField;
        }
        field(60099; "Material Received at Site"; Boolean)
        {
        }
        field(70000; "VAT %age 2"; Decimal)
        {
        }
        field(70001; "VAT Base 2"; Decimal)
        {
            Editable = false;
        }
        field(70002; "VAT Amount 2"; Decimal)
        {
        }
        field(70003; "Vendor Commitment Date"; Date)
        {
        }
        field(70004; Package; Code[20])
        {
        }
        field(70005; "Part Number"; Code[30])
        {
        }
        field(70006; MailSent; Date)
        {
        }
        field(70007; "Courier Agency"; Option)
        {
            OptionMembers = " ",DHL,DTDC,FEDEX,UPS,TNT,"GATI-KWE",VRL,Komitla,BlueDart,"First-Flight",SreeMarutiCourier,Trackon,Sindu,SafExpress,Kesineni,SRMT,SriNandan,MoringStar,Kaveri,Spoton,TCIXPS,Tirupati,Jabbar,SreeKaleswari,ByVehicle,"Professional-Couriers",PatelRoadWays;

            trigger OnValidate();
            begin

                "Courier Agency Name" := Format("Courier Agency");  // Added by Pranavi on 23-may-2016
            end;
        }
        field(70008; "Docket No"; Text[30])
        {

            trigger OnValidate();
            begin
                if "Docket No" = '' then begin
                    "Tracking Status Last Updated" := 0DT;
                    "Tracking Status" := '';
                    "Tracking URL" := '';
                    "Courier Dispatch Started On" := '';
                end;
            end;
        }
        field(70009; "Tracking Status"; Text[250])
        {
        }
        field(70010; "Tracking Status Last Updated"; DateTime)
        {
        }
        field(70011; "Tracking URL"; Text[250])
        {
            ExtendedDatatype = URL;
        }
        field(70012; "Courier Agency Name"; Text[80])
        {
        }
        field(70013; "Courier Dispatch Started On"; Text[30])
        {
        }
        field(70014; "PCB Mode"; Option)
        {
            OptionCaption = 'Normal,Fast,Super Fast';
            OptionMembers = Normal,Fast,"Super Fast";

            trigger OnValidate();
            begin
                //PCB_Cost_Calc;
            end;
        }
        field(70015; Itemremarks; Option)
        {
            OptionCaption = ', ,Sampling for NewVendor,Onhold as Stock Available';
            OptionMembers = ," ","Sampling for NewVendor","Onhold as Stock Available";
        }
        field(70016; "Stock At Stores"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry"."Remaining Quantity" WHERE("Item No." = FIELD("No."),
                                                                              Open = CONST(true),
                                                                              "Remaining Quantity" = FILTER(> 0),
                                                                              "Location Code" = CONST('STR')));
            Editable = false;
            FieldClass = FlowField;

            trigger OnLookup();
            begin
                ItemLedgEntry.Reset;
                ItemLedgEntry.SetCurrentKey("Item No.", "Variant Code", Open, Positive, "Location Code", "Posting Date",
                "Expiration Date", "Lot No.", "Serial No.");

                ItemLedgEntry.SetRange("Item No.", "No.");
                ItemLedgEntry.SetRange(Open, true);
                ItemLedgEntry.SetRange("Location Code", 'STR');
                ItemLedgEntry.SetFilter(ItemLedgEntry."Remaining Quantity", '>%1', 0);
                if ItemLedgEntry.FindSet then
                    repeat
                        if not (QualityItemLedgEntry.Get(ItemLedgEntry."Entry No.")) then
                            ItemLedgEntry.Mark(true);
                    until ItemLedgEntry.Next = 0;
                ItemLedgEntry.MarkedOnly;
                PAGE.RunModal(0, ItemLedgEntry);
            end;
        }
        field(70017; "Stock At CS Stores"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry"."Remaining Quantity" WHERE("Item No." = FIELD("No."),
                                                                              Open = CONST(true),
                                                                              "Remaining Quantity" = FILTER(> 0),
                                                                              "Location Code" = CONST('CS STR')));
            Editable = false;
            FieldClass = FlowField;

            trigger OnLookup();
            begin
                ItemLedgEntry.Reset;
                ItemLedgEntry.SetCurrentKey("Item No.", "Variant Code", Open, Positive, "Location Code", "Posting Date",
                "Expiration Date", "Lot No.", "Serial No.");

                ItemLedgEntry.SetRange("Item No.", "No.");
                ItemLedgEntry.SetRange(Open, true);
                ItemLedgEntry.SetRange("Location Code", 'CS STR');
                ItemLedgEntry.SetFilter(ItemLedgEntry."Remaining Quantity", '>%1', 0);
                if ItemLedgEntry.FindSet then
                    repeat
                        if not (QualityItemLedgEntry.Get(ItemLedgEntry."Entry No.")) then
                            ItemLedgEntry.Mark(true);
                    until ItemLedgEntry.Next = 0;
                ItemLedgEntry.MarkedOnly;
                PAGE.RunModal(0, ItemLedgEntry);
            end;
        }
        field(70018; "Stock At RD Stores"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry"."Remaining Quantity" WHERE("Item No." = FIELD("No."),
                                                                              Open = CONST(true),
                                                                              "Remaining Quantity" = FILTER(> 0),
                                                                              "Location Code" = CONST('R&D STR')));
            Editable = false;
            FieldClass = FlowField;

            trigger OnLookup();
            begin
                ItemLedgEntry.Reset;
                ItemLedgEntry.SetCurrentKey("Item No.", "Variant Code", Open, Positive, "Location Code", "Posting Date",
                "Expiration Date", "Lot No.", "Serial No.");

                ItemLedgEntry.SetRange("Item No.", "No.");
                ItemLedgEntry.SetRange(Open, true);
                ItemLedgEntry.SetRange("Location Code", 'R&D STR');
                ItemLedgEntry.SetFilter(ItemLedgEntry."Remaining Quantity", '>%1', 0);
                if ItemLedgEntry.FindSet then
                    repeat
                        if not (QualityItemLedgEntry.Get(ItemLedgEntry."Entry No.")) then
                            ItemLedgEntry.Mark(true);
                    until ItemLedgEntry.Next = 0;
                ItemLedgEntry.MarkedOnly;
                PAGE.RunModal(0, ItemLedgEntry);
            end;
        }
        field(70019; "Stock At MCH Stores"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry"."Remaining Quantity" WHERE("Item No." = FIELD("No."),
                                                                              Open = CONST(true),
                                                                              "Remaining Quantity" = FILTER(> 0),
                                                                              "Location Code" = CONST('MCH')));
            Editable = false;
            FieldClass = FlowField;

            trigger OnLookup();
            begin
                ItemLedgEntry.Reset;
                ItemLedgEntry.SetCurrentKey("Item No.", "Variant Code", Open, Positive, "Location Code", "Posting Date",
                "Expiration Date", "Lot No.", "Serial No.");

                ItemLedgEntry.SetRange("Item No.", "No.");
                ItemLedgEntry.SetRange(Open, true);
                ItemLedgEntry.SetRange("Location Code", 'MCH');
                ItemLedgEntry.SetFilter(ItemLedgEntry."Remaining Quantity", '>%1', 0);
                if ItemLedgEntry.FindSet then
                    repeat
                        if not (QualityItemLedgEntry.Get(ItemLedgEntry."Entry No.")) then
                            ItemLedgEntry.Mark(true);
                    until ItemLedgEntry.Next = 0;
                ItemLedgEntry.MarkedOnly;
                PAGE.RunModal(0, ItemLedgEntry);
            end;
        }
        field(70020; "Vendor Mat. Dispatch Date"; Date)
        {

            trigger OnValidate();
            begin
                //>>Added by Pranavi on 07-Mar-2017 For updating Vendor Mat. Disp Date
                if "Mat. Dispatched" then
                    Error('You cannot change the Vendor Mat. Dispatch date when material is dispatched!');

                if "Vendor Mat. Dispatch Date" <> 0D then begin
                    if Vendor.Get("Buy-from Vendor No.") then begin
                        "Deviated Receipt Date" := CalcDate('+' + Format(Vendor."Transportation Days") + 'D', "Vendor Mat. Dispatch Date");
                    end else
                        "Deviated Receipt Date" := "Vendor Mat. Dispatch Date";
                end;
                //<<Added by Pranavi on 07-Mar-2017 For updating Vendor Mat. Disp Date
            end;
        }
        field(70021; "Mat. Dispatched"; Boolean)
        {
        }
        field(70022; "Order Confimed"; Boolean)
        {

            trigger OnValidate();
            begin
                if (not (UserId in ['EFFTRONICS\VIJAYA', 'EFFTRONICS\SUJANI', 'EFFTRONICS\RENUKACH'])) and (xRec."Order Confimed" = true) then begin
                    Error('You do not have rights to change status for already confirmed item');
                end;
            end;
        }
        field(70023; "Scheduled Date"; Date)
        {

            trigger OnValidate();
            begin
                if (not (UserId in ['EFFTRONICS\VIJAYA', 'EFFTRONICS\SUJANI', 'EFFTRONICS\RENUKACH'])) and (xRec."Scheduled Date" <> 0D) then begin
                    Error('You do not have rights to change Scheduled Date for already confirmed item');
                end;
            end;
        }
        field(70024; Earliest_Mat_Req_Date; Date)
        {
        }
        field(70025; "Requested Rcpt Date"; Date)
        {
        }
        field(70026; gst_group_code_reverse_charge; Boolean)
        {
            CalcFormula = Lookup("GST Group"."Reverse Charge" WHERE(Code = FIELD("GST Group Code")));
            FieldClass = FlowField;
        }
        field(33000250; "Spec ID"; Code[20])
        {
            TableRelation = "Specification Header";
        }
        field(33000251; "Quantity Accepted"; Decimal)
        {
            CalcFormula = Sum("Quality Ledger Entry".Quantity WHERE("Order No." = FIELD("Document No."),
                                                                     "Order Line No." = FIELD("Line No."),
                                                                     "Entry Type" = FILTER(Accepted)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(33000252; "Quantity Rework"; Decimal)
        {
            CalcFormula = Sum("Quality Ledger Entry"."Remaining Quantity" WHERE("Order No." = FIELD("Document No."),
                                                                                 "Order Line No." = FIELD("Line No."),
                                                                                 "Entry Type" = FILTER(Rework),
                                                                                 Open = CONST(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(33000253; "QC Enabled"; Boolean)
        {

            trigger OnValidate();
            begin
                TestStatusOpen;
                TestField(Type, Type::Item);
                if "QC Enabled" then
                    TestField("Spec ID");
                if not "QC Enabled" then
                    if "Quality Before Receipt" then
                        Validate("Quality Before Receipt", false);
            end;
        }
        field(33000254; "Quantity Rejected"; Decimal)
        {
            CalcFormula = Sum("Quality Ledger Entry".Quantity WHERE("Order No." = FIELD("Document No."),
                                                                     "Order Line No." = FIELD("Line No."),
                                                                     "Entry Type" = FILTER(Reject)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(33000255; "Quality Before Receipt"; Boolean)
        {

            trigger OnValidate();
            begin
                TestStatusOpen;
                TestField(Type, Type::Item);
                if "Quantity Received" <> 0 then
                    FieldError("Quantity Received", 'should be 0');
                if "Qty. Sent To Quality" <> 0 then
                    FieldError("Qty. Sent To Quality", 'should be 0');
                "Qty. Sending To Quality" := 0;
                if "Quality Before Receipt" then begin
                    GetQCSetup;
                    QualityCtrlSetup.TestField("Quality Before Receipt", true);
                    TestField("QC Enabled", true);
                end;
            end;
        }
        field(33000256; "Qty. Sending To Quality"; Decimal)
        {
            MinValue = 0;
        }
        field(33000257; "Qty. Sent To Quality"; Decimal)
        {
            Editable = false;
            MinValue = 0;
        }
        field(33000258; "Qty. Sending To Quality(R)"; Decimal)
        {
            MinValue = 0;
        }
        field(33000259; "Spec Version"; Code[20])
        {
            TableRelation = "Specification Version"."Version Code" WHERE("Specification No." = FIELD("Spec ID"));
        }
        field(33000260; "Sample Lot Inspection"; Boolean)
        {
        }
        field(99000760; "Qty on Prod order Components"; Decimal)
        {
            CalcFormula = Sum("Prod. Order Component"."Remaining Qty. (Base)" WHERE(Status = FILTER(Planned .. Released),
                                                                                     "Item No." = FIELD("No."),
                                                                                     "Production Plan Date" = FILTER(> 20190608D)));
            Description = 'added by vishnu for to be received purchase items';
            Editable = false;
            FieldClass = FlowField;
        }
        field(99000761; "Date Filter"; Date)
        {
            CaptionML = ENU = 'Date Filter',
                        ENN = 'Date Filter';
            FieldClass = FlowFilter;
        }
        modify("No.")
        {
            trigger OnBeforeValidate()
            var
                myInt: Integer;
            begin
                // ----------------------- Old Code ------------------------- Commented by Vishnu Priya on 30-06-2020

                /*{IF "No." <> '' THEN BEGIN
                      IRH.RESET;
                      IRH.SETFILTER(IRH.Flag, '%1', TRUE);
                      IRH.SETFILTER(IRH."Item No.", "No.");
                      IRH.SETFILTER(IRH.Status, '%1', TRUE);
                      IF IRH.FINDFIRST THEN BEGIN
                          ERROR('Please Clear Rejection Flag From QC Department for Item No: %1', "No.");
                      END;
                  END;
                   }*/   // ----------------------- Old Code ----------------------------Commented by Vishnu Priya on 30-06-2020

                // ----------------------- New Code -------------------------Written By Vishnu Priya on 30-06-2020
                if "No." <> '' then begin
                    IRH.Reset;
                    IRH.SetCurrentKey(Flag, "Item No.", "Vendor No.");
                    IRH.SetFilter(Flag, '%1', true);
                    IRH.SetFilter("Item No.", "No.");
                    IRH.SetFilter("Vendor No.", "Buy-from Vendor No.");
                    IRH.SetFilter(Status, '%1', true);
                    if IRH.FindFirst then Error('QC Flag defined for this Item - ' + "No." + ' to Purchase from the ' + Rec."Buy-from Vendor No." + ' Vendor!');
                end;
                // ----------------------- New Code -------------------------Written By Vishnu Priya on 30-06-2020
            end;
        }




    }
    trigger OnBeforeModify()
    var
        myInt: Integer;
    begin
        //Cashflow_Modification; comentted by vijaya on 02-07-2018 for need to editable for item to be recieved status
        if ("Document Type" = "Document Type"::"Blanket Order") and
           ((Type <> xRec.Type) or ("No." <> xRec."No."))
        then begin
            PurchLine2.Reset;
            PurchLine2.SetCurrentKey("Document Type", "Blanket Order No.", "Blanket Order Line No.");
            PurchLine2.SetRange("Blanket Order No.", "Document No.");
            PurchLine2.SetRange("Blanket Order Line No.", "Line No.");
            if PurchLine2.FindSet then
                repeat
                    PurchLine2.TestField(Type, Type);
                    PurchLine2.TestField("No.", "No.");
                until PurchLine2.Next = 0;
        end;
    end;

    trigger OnBeforeDelete()
    var
        myInt: Integer;
    begin
        // added by vishnu Priya on 31-10-2020
        if Rec."Quantity Received" > 0 then
            Error('Inwards done for this line. So you can''t delete this');

        // added by vishnu Priya on 31-10-2020
        Cashflow_Modification;
        if not StatusCheckSuspended and (PurchHeader.Status = PurchHeader.Status::Released) and
           (Type in [Type::"G/L Account", Type::"Charge (Item)"])
        then
            Validate(Quantity, 0);


    end;


    var
        "--QC": Integer;
        QualityCtrlSetup: Record "Quality Control Setup";
        QCSetupRead: Boolean;
        GPS: Record "General Posting Setup";
        "Packing Value": Decimal;
        Insurence_Value: Decimal;
        SQLConnection: Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000514-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Connection";
        RecordSet: Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000535-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Recordset";
        SQLQuery: Text[1000];
        LRecordSet: Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000535-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Recordset";
        LineSQLQuery: Text[250];
        HeadID: Text[30];
        UpdateWebHead: Text[250];
        WebRecStatus: Text[30];
        OldWebStatus: Text[30];
        RCNT: Integer;
        Quotes: Label '''';
        Text50001: Label 'NEW';
        Text50002: Label 'OLD';
        STRUCTURE_ORDER_DETAILS: Record "Structure Order Details";
        Vendor: Record Vendor;
        PCB: Record "PCB Vendors";
        Text50003: Label 'Do you Want to insert the record with itemno %1,vendor %2 and  area %3 in PCB Cost Details table';
        Text50004: Label 'Do you Want to insert the record with itemno %1,vendor %2 and  Quantity %3 in PCB Cost Details table';
        IRH: Record "Inspection Receipt Header";
        PCB_Cost: Decimal;
        PCB_Last_Quote_Date: Date;
        ItemLedgEntry: Record "Item Ledger Entry";
        QualityItemLedgEntry: Record "Quality Item Ledger Entry";
        NODHeader: Record "NOD/NOC Header";
        PANErr: Label 'PAN No must be updated on Customer/Vendor/Party Master %1, currently its blank.';
}

