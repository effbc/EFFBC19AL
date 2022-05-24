tableextension 70012 SalesLineExt extends "Sales Line"
{
    // version NAVW19.00.00.51947,NAVIN9.00.00.51947,TFS225680,B2B1.0,DWS1.0,SH1.0

    fields
    {
        modify("Document Type")
        {
            OptionCaptionML = ENU = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Amc', ENN = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Amc';



        }
        modify(Quantity)
        {
            trigger OnBeforeValidate()
            var
                myInt: Integer;
            begin
               /*  {   //commented by pranavi
                                                                rpoQty:=0;
                                                                PrdOrder.RESET;
                                                                PrdOrder.SETFILTER(PrdOrder."Sales Order No.","Document No.");
                                                                PrdOrder.SETFILTER(PrdOrder."Sales Order Line No.",'%1',"Line No.");
                                                                PrdOrder.SETFILTER(PrdOrder."Schedule Line No.",'%1',0);
                                                                IF PrdOrder.FINDSET THEN
                                                                REPEAT
                                                                  rpoQty:=rpoQty+PrdOrder.Quantity;
                                                                UNTIL PrdOrder.NEXT=0;

                                                                IF rpoQty>0 THEN
                                                                BEGIN
                                                                uom.RESET;
                                                                uom.SETFILTER(uom."Item No.","No.");
                                                                uom.SETFILTER(uom.Code,"Unit of Measure");
                                                                IF uom.FINDFIRST THEN
                                                                  rpoQty:=rpoQty DIV uom."Qty. per Unit of Measure";
                                                                //  IF xRec."No."<>"No." THEN
                                                                //    ERROR('Already Production Orders was released for the item '+xRec."No."+' in line no: '+FORMAT("Line No.")+'. Please contact Production Manager for further actions');
                                                                  IF xRec.Quantity>0 THEN
                                                                    IF rpoQty>Quantity THEN
                                                                    BEGIN
                                                                    IF NOT (UPPERCASE(USERID) IN ['EFFTRONICS\ANILKUMAR','EFFTRONICS\PRANAVI']) THEN
                                                                      ERROR('Already Production Orders was released for the quantity  '+FORMAT(rpoQty)+' on line No: '+FORMAT("Line No.")+'. Please contact Production Manager for further actions');
                                                                    END;
                                                                END;
                                                                }*/

            end;

        }
        modify("No.")
        {
            trigger OnBeforeValidate()
            var
                ProductionBOMHeader: Record "Production BOM Header";
                VersionMgt: Codeunit VersionManagement;
                SalesHeaderRDSO: Record "Sales Header";
                PrdOrder: Record "Production Order";
                rpoQty: Integer;
            begin

                /* { //commented by pranavi
                                                             rpoQty := 0;
             PrdOrder.RESET;
             PrdOrder.SETFILTER(PrdOrder."Sales Order No.", "Document No.");
             PrdOrder.SETFILTER(PrdOrder."Sales Order Line No.", '%1', "Line No.");
             PrdOrder.SETFILTER(PrdOrder."Schedule Line No.", '%1', 0);
             IF PrdOrder.FINDSET THEN
                 REPEAT
                     rpoQty := rpoQty + PrdOrder.Quantity;
                 UNTIL PrdOrder.NEXT = 0;

             IF rpoQty > 0 THEN BEGIN

                 IF xRec."No." <> '' THEN BEGIN

                     IF xRec."No." <> "No." THEN
                         ERROR('Already ' + FORMAT(rpoQty) + ' Production Orders was released for the item ' + xRec."No." + ' in line no: ' + FORMAT("Line No.") + '. Please contact Production Manager for further actions');


                     IF rpoQty > Quantity THEN
                         ERROR('Already Production Orders was released for the quantity  ' + FORMAT(rpoQty) + ' on line No: ' + FORMAT("Line No.") + '. Present Quantity ' + FORMAT(Quantity) + '. Please contact Production Manager for further actions');
                 END;
             END;*/


                /* {SalesHeader.RESET;
                  SalesHeader.SETRANGE(SalesHeader."No.","Document No.");
                    IF SalesHeader.FINDFIRST THEN
                     BEGIN
        "Bill-to Customer No.":= SalesHeader."Bill-to Customer No.";
END;
         }*/



                IF xRec."No." <> "No." THEN
                    ERROR('Already ' + FORMAT(rpoQty) + ' Production Orders was released for the item ' + xRec."No." + ' in line no: ' + FORMAT("Line No.") + '. Please contact Production Manager for further actions');


                IF rpoQty > Quantity THEN
                    ERROR('Already Production Orders was released for the quantity  ' + FORMAT(rpoQty) + ' on line No: ' + FORMAT("Line No.") + '. Present Quantity ' + FORMAT(Quantity) + '. Please contact Production Manager for further actions');



                /*{SalesHeader.RESET;
                  SalesHeader.SETRANGE(SalesHeader."No.","Document No.");
                    IF SalesHeader.FINDFIRST THEN
                                              BEGIN
           "Bill-to Customer No.":= SalesHeader."Bill-to Customer No.";
            END;
           }*/

            end;
        }

        field(50002; "Packet No"; Integer)
        {
        }
        field(60001; "Production BOM No."; Code[20])
        {
            Description = 'B2B';
            TableRelation = "Production BOM Header"."No.";

            trigger OnValidate();
            begin
                TestStatusOpen;
            end;
        }
        field(60002; "Production Bom Version No."; Code[20])
        {
            Description = 'B2B';
            TableRelation = "Production BOM Version"."Version Code" WHERE("Production BOM No." = FIELD("Production BOM No."));

            trigger OnValidate();
            begin
                TestStatusOpen;
            end;
        }
        field(60003; "Estimated Unit Cost"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Design Worksheet Header"."Total Cost" WHERE("Document No." = FIELD("Document No."),
                                                                            "Document Type" = CONST(Order),
                                                                            "Document Line No." = FIELD("Line No.")));
            Description = 'B2B';
            FieldClass = FlowField;

            trigger OnValidate();
            begin
                TestStatusOpen;
            end;
        }
        field(60004; "Estimated Total Unit Cost"; Decimal)
        {
            BlankZero = true;
            Description = 'B2B';

            trigger OnValidate();
            begin
                TestStatusOpen;
            end;
        }
        field(60005; "RDSO Unit Charges"; Decimal)
        {
            BlankZero = true;
            Description = 'B2B';

            trigger OnValidate();
            begin
                TestStatusOpen;
            end;
        }
        field(60006; "Prod Start Date"; Date)
        {
            Description = 'B2B';

            trigger OnValidate();
            begin
                //TestStatusOpen;
            end;
        }
        field(60007; "LD Amount"; Decimal)
        {
            BlankZero = true;
            Description = 'B2B';

            trigger OnValidate();
            begin
                TestStatusOpen;
            end;
        }
        field(60008; "RDSO Charges Paid By"; Option)
        {
            Description = 'B2B';
            OptionMembers = " ","By Customer","By Railways";

            trigger OnValidate();
            begin
                TestStatusOpen;
            end;
        }
        field(60009; "RDSO Inspection Required"; Boolean)
        {
            Description = 'B2B';

            trigger OnValidate();
            begin
                TestStatusOpen;
            end;
        }
        field(60010; "RDSO Inspection By"; Option)
        {
            Description = 'B2B';
            OptionMembers = " ","By RDSO"," By Consignee";

            trigger OnValidate();
            begin
                TestStatusOpen;
            end;
        }
        field(60011; "RDSO Charges"; Decimal)
        {
            BlankZero = true;
            Description = 'B2B';

            trigger OnValidate();
            begin
                TestField("RDSO Inspection Required", true);
                TestStatusOpen;
            end;
        }
        field(60012; "Schedule Type"; Option)
        {
            Description = 'B2B';
            OptionCaption = '" ,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z"';
            OptionMembers = " ",A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z;
        }
        field(60013; "Prod. Order Quantity"; Decimal)
        {
            CalcFormula = Sum("Production Order".Quantity WHERE("Sales Order No." = FIELD("Document No."),
                                                                 "Sales Order Line No." = FIELD("Line No."),
                                                                 "Source No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(60014; "Tender No."; Code[20])
        {
        }
        field(60015; "Tender Line No."; Integer)
        {
        }
        field(60016; "Prod. Qty"; Decimal)
        {

            trigger OnValidate();
            begin
                CalcFields("Prod. Order Quantity");
                if "Prod. Order Quantity" + "Prod. Qty" > Quantity then
                    Error(text112);
            end;
        }
        field(60017; "Prod. Due Date"; Date)
        {
        }
        field(60018; "Item Sub Group Code"; Code[20])
        {
            CalcFormula = Lookup(Item."Item Sub Group Code" WHERE("No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(60019; "To Be Shipped Qty"; Decimal)
        {
        }
        field(60020; "Material Reuired Date"; Date)
        {
            Editable = false;
        }
        field(60021; "Dummy Unit Cost"; Decimal)
        {
        }
        field(60022; "Plan Shifting Date"; Date)
        {
        }
        field(60023; "Change to Specified Plan Date"; Boolean)
        {
        }
        field(60024; "CL_CNSGN  rcvd Qty"; Integer)
        {
            Description = 'added  by sujani for renucha mam';
        }
        field(60025; "CL_CNSGN  rcvd Date1"; Date)
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
        field(60110; "Supply Portion"; Decimal)
        {

            trigger OnValidate();
            begin
                // Added by Pranavi on 16-Sep-2016
                if "Retention Portion" + "Supply Portion" > 100 then
                    Error('TOTAL SUPPLY+RETENTION Portion should not be > 100 %!');
            end;
        }
        field(60111; "Retention Portion"; Decimal)
        {

            trigger OnValidate();
            begin
                // Added by Pranavi on 16-Sep-2016
                if "Retention Portion" + "Supply Portion" > 100 then
                    Error('TOTAL SUPPLY+RETENTION Portion should not be > 100 %!');
            end;
        }
        field(60112; "Type of Item"; Option)
        {
            OptionMembers = " ","Only Supply","Supply & Inst","Supply & Laying","Only Inst";
        }
        field(60113; "Schedule No"; Integer)
        {
        }
        field(60114; "Unitcost(LOA)"; Decimal)
        {
        }
        field(60115; "Line Amount(LOA)"; Decimal)
        {
        }
        field(60116; "OutStanding(LOA)"; Decimal)
        {
        }
        field(60117; "BOI Status"; Option)
        {
            OptionCaption = '" ,To be Ordered,To be Received,Received,To be Dispatched,Confirmation Pending,Material Supplied,Cancelled"';
            OptionMembers = " ","To be Ordered","To be Received",Received,"To be Dispatched","Confirmation Pending","Material Supplied",Cancelled;
        }
        field(60118; MainCategory; Option)
        {
            Description = 'added by sujani on 2-11-2018 for analysis purpose';
            OptionMembers = "  ",Sales,"No Issue","R&D","Need to Specify",CS,MKT,LMD,"Temp-Closed";
        }
        field(60119; SubCategory; Option)
        {
            Description = 'added by sujani on 2-11-2018 for analysis purpose';
            OptionMembers = "  ","Yet to Start","Under Inspection","Ready for Inspection","Under Production","Inspection Completed","Ready For Dispatch","BOM Pending","PO Pending","BOI Pending","Docs Pending","RDSO renewal Pending","S/W Pending","Call Letter Pending","Customer side Pending","Installation material pending","Site not ready","R&D Pending","Installation Inprogress",Commisioned,"Completion letter taken","Yet to dispatch",Received,"To Be Received","Under Design","Dispatched on DC";
        }
        field(60120; Reason; Text[100])
        {
            Description = 'added by sujani on 2-11-2018 for analysis purpose';
        }
        field(60121; Remarks; Text[100])
        {
            Description = 'added by sujani on 2-11-2018 for analysis purpose';
        }
        field(60122; ProductGroup; Code[20])
        {
            Description = 'added by sujani on 2-11-2018 for analysis purpose';
            TableRelation = "Item Sub Group".Code;
        }
        field(60123; Main_CATEGORY; Option)
        {
            OptionMembers = "  ",Sales,"No Issue","R&D","Need to Specify",CS,MKT;
        }
        field(60124; "Call Letter Status"; Option)
        {
            Description = 'added by sujani on 30-11-2018 for pending orders analysis purpose';
            OptionMembers = " ",Received,Pending,NA,"Cust.Pending";
        }
        field(60125; "RDSO Number"; Code[15])
        {
            Description = 'added by sujani on 30-11-2018 for pending orders analysis purpose';
        }
        field(60126; Vertical; Option)
        {
            Description = 'added by sujani on 30-11-2018 for pending orders analysis purpose';
            OptionMembers = " ","Smart Signalling","Smart Cities","Smart Building",IOT,other;
        }
        field(60127; "Deviated Dispatch Date"; DateTime)
        {
            Description = 'added by sujani on 30-11-2018 for pending orders analysis purpose';
        }
        field(60128; "Dispatch Date"; DateTime)
        {
            Description = 'added by sujani on 30-11-2018 for pending orders analysis purpose';
        }
        field(60129; "Call Letter Exp Date"; Date)
        {
            Description = 'added by sujani on 07-12-2018 for pending orders analysis purpose';
        }
        field(60130; "Sell-to Customer Name"; Text[50])
        {
            CaptionML = ENU = 'Sell-to Customer Name',
                        ENN = 'Sell-to Customer Name';
        }
        field(60131; "Tentative RDSO Date"; Date)
        {
            Description = 'Added by Vishnu Priya on 14-12-2018';
        }
        field(60132; "Production Confirmed Status"; Boolean)
        {
            Description = 'Added by Vishnu Priya on 26-05-2020 for Sales Process Tracking';
        }
        field(60133; "Dispatch Confirm Date"; Date)
        {
            Description = 'Added by Vishnu Priya on 26-05-2020 for Sales Process Tracking';
        }
        field(60134; "Production Stage"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Added by Vishnu Priya on 04-11-2020 for Sales Process Tracking';
            OptionCaption = '" ,Soldering ,Testing,Product Integration,Call letter Registration,Inspection Completed,Final Testing,QA Completed,Offer to QA,IP QA,Ready For Inspection"';
            OptionMembers = " ","Soldering ",Testing,"Product Integration","Call letter Registration","Inspection Completed","Final Testing","QA Completed","Offer to QA","IP QA","Ready For Inspection";
        }
        field(60135; "Product ready Date Committed"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Added by Vishnu Priya on 04-11-2020 for Sales Process Tracking';
        }
        field(60136; "Product ready Date (Revised)"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Added by Vishnu Priya on 04-11-2020 for Sales Process Tracking';
        }
        field(80000; "VAT Business Posting Group 2"; Code[10])
        {
            TableRelation = "VAT Business Posting Group".Code;
        }
        field(80001; "VAT Product Posting Group 2"; Code[10])
        {
            TableRelation = "VAT Business Posting Group".Code;
        }
        field(80002; "VAT %age 2"; Decimal)
        {
        }
        field(80003; "VAT Base 2"; Decimal)
        {
            Editable = false;
        }
        field(80004; "VAT Amount 2"; Decimal)
        {
        }
        field(80005; "Service Tax % 2"; Decimal)
        {
            BlankZero = true;
            Caption = 'Service Tax %';
        }
        field(80006; "Pending By"; Option)
        {
            OptionMembers = " ","R&D",Sales,LMD,Customer,Purchase,CUS;

            trigger OnValidate();
            begin
                // Added by Pranavi on 20-Feb-2016 for the tracking of pending by removed date
                if (xRec."Pending By" in [1, 2, 3, 4, 5, 6]) and ("Pending By" = 0) then
                    "Pending By Removed Date" := Today()
                else
                    "Pending By Removed Date" := 0D;
                // end by pranavi
            end;
        }
        field(80007; "Pending By Removed Date"; Date)
        {
        }
        field(80008; "Purchase Remarks"; Option)
        {
            OptionCaption = '" ,Sales Configuration Pending,Purchase order placed Mat Exp,Call letters Pending,Purchase Prices under negotiations,Material Received,Material Supplied-Invoice Pending,PO will place before Mfg items Ready,Will supply at site"';
            OptionMembers = " ","Sales Conformation Pending","Purchase order placed Mat Exp","Call letters Pending","Purchase Prices under negotiations","Material Received","Material Supplied-Invoice Pending","PO will place before Mfg items Ready","Will supply at site";
        }
        field(80009; "Planned Dispatch Date"; Date)
        {
            Description = 'Pranavi-for BOI Planning';
        }
        field(33000250; "Spec ID"; Code[20])
        {
            Description = 'QC1.0';
            TableRelation = "Specification Header";
        }
        field(33000251; "Quantity Accepted"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Quality Ledger Entry".Quantity WHERE("Order No." = FIELD("Document No."),
                                                                     "Sales Line No" = FIELD("Line No."),
                                                                     "Entry Type" = FILTER(Accepted)));
            Description = 'QC1.0';
            Editable = false;
            FieldClass = FlowField;
        }
        field(33000252; "Quantity Rework"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Quality Ledger Entry"."Remaining Quantity" WHERE("Order No." = FIELD("Document No."),
                                                                                 "Sales Line No" = FIELD("Line No."),
                                                                                 "Entry Type" = FILTER(Rework)));
            Description = 'QC1.0';
            Editable = false;
            FieldClass = FlowField;
        }
        field(33000253; "QC Enabled"; Boolean)
        {
            Description = 'QC1.0';

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
            BlankZero = true;
            CalcFormula = Sum("Quality Ledger Entry".Quantity WHERE("Order No." = FIELD("Document No."),
                                                                     "Sales Line No" = FIELD("Line No."),
                                                                     "Entry Type" = FILTER(Reject)));
            Description = 'QC1.0';
            Editable = false;
            FieldClass = FlowField;
        }
        field(33000255; "Quality Before Receipt"; Boolean)
        {
            Description = 'QC1.0';

            trigger OnValidate();
            begin
                TestStatusOpen;
                TestField(Type, Type::Item);
                if "Qty. to Ship" <> 0 then
                    FieldError("Qty. to Ship", 'should be 0');
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
            BlankZero = true;
            Description = 'QC1.0';
            MinValue = 0;
        }
        field(33000257; "Qty. Sent To Quality"; Decimal)
        {
            BlankZero = true;
            Description = 'QC1.0';
            Editable = false;
            MinValue = 0;
        }
        field(33000258; "Qty. Sending To Quality(R)"; Decimal)
        {
            BlankZero = true;
            Description = 'QC1.0';
            MinValue = 0;
        }
        field(33000259; "Spec Version"; Code[20])
        {
            Description = 'QC1.0';
            TableRelation = "Specification Version"."Version Code" WHERE("Specification No." = FIELD("Spec ID"));
        }
        field(33000260; "Reg/Non reg Product"; Option)
        {
            DataClassification = CustomerContent;
            Description = 'added by durga for expected orders form';
            OptionMembers = " ",Issue,"No-Issue";
        }
        field(33000261; Priority; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'added by priyanka on 24-02-2022';
            OptionMembers = " ","1","2","3";
        }
        field(33000262; "M Stage"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'added by priyanka on 02-03-2022';
            OptionMembers = " ",Machine,Man,Method,Material;
        }
        field(33000263; "Non Regular Stages"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'added by priyanka on 03-03-2022';
            OptionMembers = " ","Sample PCB Evaluation","Hardware-Temp BOM","Final BOM","Inst BOM",Firmware,Software,"Production DOC","UPG BOM","Design In-Progress","Design to be Start";
        }
        field(33000264; "Responsible Dept"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'added by priyanka on 03-03-2022';
            OptionMembers = " ","R&D",DQA,CS;
        }
    }
    trigger OnInsert()
    var
        myInt: Integer;
        SalesHeader: Record "Sales Header";
    begin

        //B2B-KNR
        SalesHeader.SetRange("Document Type", "Document Type");
        SalesHeader.SetRange("No.", "Document No.");
        if SalesHeader.Find('-') then begin
            //"RDSO Unit Charges" :=
            "RDSO Charges Paid By" := SalesHeader."RDSO Charges Paid By";
            "RDSO Inspection Required" := SalesHeader."RDSO Inspection Required";
            "RDSO Inspection By" := SalesHeader."RDSO Inspection By";
            "Sell-to Customer No." := SalesHeader."Sell-to Customer No.";
            "Bill-to Customer No." := SalesHeader."Bill-to Customer No.";
            //"RDSO Charges"
        end;
        "Location Code" := 'PROD';
        //B2B-KNR
        // added by pranavi on 01-sep-2016 for payment terms
        if "Document Type" = "Document Type"::Order then begin
            SalesHeader.Reset;
            SalesHeader.SetRange(SalesHeader."No.", "Document No.");
            if SalesHeader.FindFirst then
                if SalesHeader."Customer Posting Group" in ['PRIVATE', 'OTHERS'] then
                    if Type = Type::Item then begin
                        "Supply Portion" := 100;
                        "Retention Portion" := 0;
                    end else begin
                        "Supply Portion" := 0;
                        "Retention Portion" := 100;
                    end;
        end;
        // end by pranavi

        // Added by Pranavi on 13-Dec-2016
        if "Document Type" = "Document Type"::Order then begin
            SalesHeader.Reset;
            SalesHeader.SetRange(SalesHeader."Document Type", SalesHeader."Document Type"::Order);
            SalesHeader.SetRange(SalesHeader."No.", "Document No.");
            if SalesHeader.FindFirst then begin
                SO.Reset;
                SO.SetRange(SO."Document Type", SO."Document Type"::Order);
                SO.SetRange(SO."No.", SalesHeader."No.");
                if not SO.FindFirst then begin
                    SO.Init;
                    if CopyStr(SalesHeader."No.", 1, 7) = 'EFF/SAL' then
                        SO."Document Type" := SO."Document Type"::Order
                    else
                        if CopyStr(SalesHeader."No.", 1, 7) = 'EFF/AMC' then
                            SO."Document Type" := SO."Document Type"::Amc;
                    SO."No." := SalesHeader."No.";
                    SO."Sell-to Customer No." := SalesHeader."Sell-to Customer No.";
                    SO."Customer OrderNo." := SalesHeader."Customer OrderNo.";
                    SO."Bill-to Name" := SalesHeader."Bill-to Name";
                    SO."Bill-to Customer No." := SalesHeader."Bill-to Customer No.";
                    SO."Customer Posting Group" := SalesHeader."Customer Posting Group";
                    // Pranavi
                    SO."Security Deposit Amount" := SalesHeader."Security Deposit Amount";
                    SO."SD Status" := SalesHeader."SD Status";
                    SO."Sale Order Total Amount" := SalesHeader."Sale Order Total Amount";
                    SO."EMD Amount" := SalesHeader."EMD Amount";
                    SO."Security Deposit Status" := SalesHeader."Security Deposit Status";
                    SO."SD Requested Date" := SalesHeader."SD Requested Date";
                    SO."SD Required Date" := SalesHeader."SD Required Date";
                    SO."Warranty Period" := SalesHeader."Warranty Period";
                    SO.Product := SalesHeader.Product;
                    SO."Security Deposit" := SalesHeader."Security Deposit";
                    // Pranavi
                    SO.Insert;
                end;
            end;
        end;
        // End--Pranavi

    end;

    trigger OnModify()
    var
        myInt: Integer;
    begin
        //ANIL13/10/09
        SalesHeader.SetRange("Document Type", "Document Type");
        SalesHeader.SetRange("No.", "Document No.");
        if SalesHeader.Find('-') then begin
            "Line Amount(LOA)" := "Unitcost(LOA)" * Quantity;
            "OutStanding(LOA)" := "Unitcost(LOA)" * (Quantity - "Quantity Invoiced");
        end;
        //ANIL13/10/09
        // "OutStanding(LOA)":="Unitcost(LOA)"*(Quantity-"Quantity Invoiced");
    end;

    trigger OnDelete()
    var
        DesignworksheetHeader: Record "Design Worksheet Header";
        Schedule: Record Schedule2;
        PrdOrder: Record "Production Order";
        rpoQty: Integer;
    begin
        testOrderVerification('You do not have permision to delete Item when Order Verified');

        rpoQty := 0;
        PrdOrder.Reset;
        PrdOrder.SetFilter(PrdOrder."Sales Order No.", "Document No.");
        PrdOrder.SetFilter(PrdOrder."Sales Order Line No.", '%1', "Line No.");
        PrdOrder.SetFilter(PrdOrder."Schedule Line No.", '%1', 0);
        if PrdOrder.FindSet then
            repeat
                rpoQty := rpoQty + PrdOrder.Quantity;
            until PrdOrder.Next = 0;
        /*  {
          IF rpoQty > 0 THEN
       ERROR('Already ' + FORMAT(rpoQty) + ' Production Orders was released on line no : ' + FORMAT("Line No.") + '. Please contact Production manager for further actions');
          }*/
        //pranavi



        DesignworksheetHeader.Reset;
        DesignworksheetHeader.SetRange("Document No.", "Document No.");
        if "Document Type" = "Document Type"::Quote then
            DesignworksheetHeader.SetRange("Document Type", DesignworksheetHeader."Document Type"::Quote)
        else
            if "Document Type" = "Document Type"::Order then
                DesignworksheetHeader.SetRange("Document Type", DesignworksheetHeader."Document Type"::Order)
            else
                if "Document Type" = "Document Type"::"Blanket Order" then
                    DesignworksheetHeader.SetRange("Document Type", DesignworksheetHeader."Document Type"::"Blanket Order");
        DesignworksheetHeader.SetRange("Document Line No.", "Line No.");
        DesignworksheetHeader.DeleteAll(true);
        //Cost1.0
        //sh1.0
        /* {Schedule.RESET;
 Schedule.SETRANGE("Document No.", "Document No.");
 IF "Document Type" = "Document Type"::Quote THEN
     Schedule.SETRANGE("Document Type", Schedule."Document Type"::Quote)
 ELSE
     IF "Document Type" = "Document Type"::Order THEN
         Schedule.SETRANGE("Document Type", Schedule."Document Type"::Order)
     ELSE
         IF "Document Type" = "Document Type"::"Blanket Order" THEN
             Schedule.SETRANGE("Document Type", Schedule."Document Type"::"Blanket Order");
 Schedule.SETRANGE("Document Line No.", "Line No.");
 Schedule.DELETEALL(TRUE);} */
        // commente dbny sujani in order to carry fwd the schedule if customer is changed

        //sh1.0

    end;




    var

        uom: Record "Item Unit of Measure";
        ProductionBOMHeader: Record "Production BOM Header";
        VersionMgt: Codeunit VersionManagement;
        SalesHeader: Record "Sales Header";
        PrdOrder: Record "Production Order";
        rpoQty: Integer;

        DesignworksheetHeader: Record "Design Worksheet Header";
        "--Qc--": Integer;
        QualityCtrlSetup: Record "Quality Control Setup";
        QCSetupRead: Boolean;
        text112: Label 'You can''t create more porduction order''s than Qty';
        Schedule: Record Schedule2;
        SO: Record "Sales Invoice-Dummy";
        SkipOrderVerification: Boolean;
}

