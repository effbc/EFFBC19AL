tableextension 70026 SalesInvoiceLineExt extends "Sales Invoice Line"
{


    fields
    {



        modify("No.")
        {


            CaptionClass = GetCaptionClass(FieldNo("No."));
        }



        modify("Unit Price")
        {
            CaptionClass = GetCaptionClass(FieldNo("Unit Price"));
        }


        modify("Line Amount")
        {
            CaptionClass = GetCaptionClass(FieldNo("Line Amount"));
        }




        field(50002; "Packet No"; Integer)
        {
            DataClassification = CustomerContent;
            Editable = true;
        }
        field(50100; "Description New"; Text[250])
        {
            DataClassification = CustomerContent;
            Description = 'B2BPG';
        }
        field(50101; "Description New 1"; Text[250])
        {
            DataClassification = CustomerContent;
            Description = 'B2BPG';
        }
        field(50102; "Transfer Method 1"; Code[20])
        {
            DataClassification = CustomerContent;
            Description = 'B2BPG';
        }
        field(60001; "Production BOM No."; Code[20])
        {
            DataClassification = CustomerContent;
            Description = 'B2B';
            TableRelation = "Production BOM Header"."No.";
        }
        field(60002; "Production Bom Version No."; Code[20])
        {
            DataClassification = CustomerContent;
            Description = 'B2B';
            TableRelation = "Production BOM Version"."Version Code" WHERE("Production BOM No." = FIELD("Production BOM No."));
        }
        field(60003; "Estimated Unit Cost"; Decimal)
        {
            CalcFormula = Sum("Design Worksheet Header"."Total Cost" WHERE("Document No." = FIELD("Document No."),
                                                                            "Document Type" = CONST(Order),
                                                                            "Document Line No." = FIELD("Line No.")));
            Description = 'B2B';
            FieldClass = FlowField;
        }
        field(60004; "Estimated Total Unit Cost"; Decimal)
        {
            DataClassification = CustomerContent;
            Description = 'B2B';
        }
        field(60005; "RDSO Unit Charges"; Decimal)
        {
            DataClassification = CustomerContent;
            Description = 'B2B';
        }
        field(60006; "Prod Start Date"; Date)
        {
            DataClassification = CustomerContent;
            Description = 'LD Start Date has been modified as Prod start date due to unavailability of feilds';
        }
        field(60007; "LD Amount"; Decimal)
        {
            DataClassification = CustomerContent;
            Description = 'B2B';
        }
        field(60008; "RDSO Charges Paid By"; Enum "Sales Shipment Enum")
        {
            DataClassification = CustomerContent;
            Description = 'B2B';

        }
        field(60009; "RDSO Inspection Required"; Boolean)
        {
            DataClassification = CustomerContent;
            Description = 'B2B';
        }
        field(60010; "RDSO Inspection By"; Enum "Sales invoice Header Enum6")
        {
            DataClassification = CustomerContent;
            Description = 'B2B';
            //  OptionMembers = Us,Them;
        }
        field(60011; "RDSO Charges"; Decimal)
        {
            DataClassification = CustomerContent;
            Description = 'B2B';
        }
        field(60012; "Schedule Type"; Enum "Sales Shipment Line Enum3")
        {
            DataClassification = CustomerContent;
            Description = 'B2B';
            //OptionCaption = '" ,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z"';
            //OptionMembers = " ",A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z;
        }
        field(60020; "Material Reuired Date"; Date)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(60024; "CL_CNSGN  rcvd Qty"; Integer)
        {
            DataClassification = CustomerContent;
            Description = 'added  by sujani for renucha mam';
        }
        field(60025; "CL_CNSGN  rcvd Date1"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(60090; "Dimension Corrected"; Boolean)
        {
            DataClassification = CustomerContent;
            Description = 'added  by sujani for Dimension issue clearance (B2B Assistance)';
            Editable = false;
        }
        field(60091; "OLD Dim Set ID"; Integer)
        {
            DataClassification = CustomerContent;
            Description = 'added  by sujani for Dimension issue clearance (B2B Assistance)';
            Editable = false;
            TableRelation = "Dimension Set Entry Backup2"."Dimension Set ID" WHERE("Dimension Set ID" = FIELD("OLD Dim Set ID"));

            trigger OnLookup();
            begin
                //ShowDimensionsOLD;
            end;
        }
        field(60100; "Order No.1"; Code[20])
        {
            DataClassification = CustomerContent;
            Description = 'B2B';
        }
        field(60101; "Order Line No.1"; Integer)
        {
            DataClassification = CustomerContent;
            Description = 'B2B';
        }
        field(60102; "Document Date"; Date)
        {
            CalcFormula = Lookup("Sales Invoice Header"."Posting Date" WHERE("No." = FIELD("Document No.")));
            FieldClass = FlowField;
        }
        field(60103; "External Document No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(60110; "Supply Portion"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(60111; "Retention Portion"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(60112; "Type of Item"; Enum "Sales Shipment Line Enum4")
        {
            DataClassification = CustomerContent;
            //OptionMembers = " ","Only Supply","Supply & Inst","Supply & Laying","Only Inst";
        }
        field(60113; "Schedule No"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(60114; "Unitcost(LOA)"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(60118; MainCategory; Enum "Sales invoice Line Enum3")
        {
            DataClassification = CustomerContent;
            Description = 'added by sujani on 2-11-2018 for analysis purpose';
            //OptionMembers = "  ",Sales,"No Issue","R&D","Need to Specify",CS,MKT,LMD;
        }
        field(60119; SubCategory; Enum "Sales invoice Line Enum2")
        {
            DataClassification = CustomerContent;
            Description = 'added by sujani on 2-11-2018 for analysis purpose';
            //OptionMembers = "  ","Yet to Start","Under Inspection","Ready for Inspection","Under Production","Inspection Completed","Ready For Dispatch","BOM Pending","PO Pending","BOI Pending","Docs Pending","RDSO renewal Pending","S/W Pending","Call Letter Pending","Customer side Pending","Installation material pending","Site not ready","R&D Pending","Installation Inprogress",Commisioned,"Completion letter taken","Yet to dispatch";
        }
        field(60120; Reason; Text[100])
        {
            DataClassification = CustomerContent;
            Description = 'added by sujani on 2-11-2018 for analysis purpose';
        }
        field(60121; Remarks; Text[100])
        {
            DataClassification = CustomerContent;
            Description = 'added by sujani on 2-11-2018 for analysis purpose';
        }
        field(60122; ProductGroup; Code[20])
        {
            DataClassification = CustomerContent;
            Description = 'added by sujani on 2-11-2018 for analysis purpose';
        }
        field(60123; Main_CATEGORY; Enum "Sales invoice Line Enum3")
        {
            DataClassification = CustomerContent;
            Description = 'added by Vishnu Priya on 20-11-2018 for analysis purpose';
            //OptionCaption = ',Sales,No Issue,R&D,Need to Specify,CS,MKT';
            // OptionMembers = ,Sales,"No Issue","R&D","Need to Specify",CS,MKT;
        }
        field(60124; "Call Letter Status"; Enum "Sales invoice Line Enum6")
        {
            DataClassification = CustomerContent;
            Description = 'added by sujani on 30-11-2018 for pending orders analysis purpose';
            //OptionMembers = " ",Received,Pending,NA,"Cust.Pending";
        }
        field(60125; "RDSO Number"; Code[15])
        {
            DataClassification = CustomerContent;
            Description = 'added by sujani on 30-11-2018 for pending orders analysis purpose';
        }
        field(60126; Vertical; Enum "Sales invoice Line Enum7")
        {
            DataClassification = CustomerContent;
            Description = 'added by sujani on 30-11-2018 for pending orders analysis purpose';
            //OptionMembers = " ","Smart Signalling","Smart Cities","Smart Building",IOT,other;
        }
        field(60127; "Deviated Dispatch Date"; DateTime)
        {
            DataClassification = CustomerContent;
            Description = 'added by sujani on 30-11-2018 for pending orders analysis purpose';
        }
        field(60128; "Dispatch Date"; DateTime)
        {
            DataClassification = CustomerContent;
            Description = 'added by sujani on 30-11-2018 for pending orders analysis purpose';
        }
        field(60131; "Tentative RDSO Date"; Date)
        {
            DataClassification = CustomerContent;
            Description = 'Added by Vishnu Priya on 14-12-2018';
        }
    }
    keys
    {


    }




}

