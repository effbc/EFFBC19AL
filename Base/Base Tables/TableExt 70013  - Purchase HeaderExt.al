tableextension 70013 PurhaseheaderExt extends "Purchase Header"
{


    fields
    {
        modify("Document Type")
        {
            OptionCaptionML = ENU = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Enquiry', ENN = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Enquiry';



        }
        modify("Order Date")
        {
            trigger OnBeforeValidate()
            var
                myInt: Integer;
                PurchLine: Record "Purchase Line";
            begin
                PurchLine.SETFILTER(PurchLine."Document No.", "No.");
                IF PurchLine.FindFirst() then
                    REPEAT
                        PurchLine."Order Date" := "Order Date";
                        PurchLine.MODIFY;
                    UNTIL PurchLine.NEXT = 0;

                GLSetup.GET;

                IF NOT (("Order Date" >= GLSetup."Allow Posting From") AND
                       ("Order Date" >= GLSetup."Allow Posting To")) ;
                // ERROR('ORDER DATE IS NOT IN SYSTEM RANGE , ONCE CHECK THE ORDER DATE');
            end;
        }
        modify("Payment Terms Code")
        {
            trigger OnBeforeValidate()
            var
                myInt: Integer;
            begin
                GLSetup.GET;
                IF GLSetup."Active ERP-CF Connection" THEN
                    Cashflow_Modification; // GST
            end;
        }
        modify("Location Code")
        {
            trigger OnBeforeValidate()
            var
                myInt: Integer;
            begin

                //added by mnraju
                IF "Location Code" = 'STR' THEN
                    "Shortcut Dimension 1 Code" := 'PRD-0010'
                ELSE
                    IF "Location Code" = 'R&D STR' THEN
                        "Shortcut Dimension 1 Code" := 'RD-000'
                    ELSE
                        IF "Location Code" = 'CS STR' THEN
                            "Shortcut Dimension 1 Code" := 'CUS-005';

                //added by mnraju

            end;
        }





        modify("No.")
        {
            CaptionML = ENU = 'Purchase Order No', ENN = 'Purchase Order No';
        }
        modify("Pay-to Vendor No.")
        {
            CaptionML = ENU = 'Vendor No.', ENN = 'Vendor No.';

            //Unsupported feature: Change NotBlank on ""Pay-to Vendor No."(Field 4)". Please convert manually.

        }


        modify("Vendor Cr. Memo No.")
        {
            CaptionML = ENU = 'Debit Note No.', ENN = 'Debit Note No.';
        }


        field(50000; "MSPT Date"; Date)
        {

            trigger OnValidate();
            begin
                TestField(Status, Status::Open);

                MSPTOrderDetails.SetRange(Type, MSPTOrderDetails.Type::Purchase);
                MSPTOrderDetails.SetRange("Document Type", "Document Type");
                MSPTOrderDetails.SetRange("Document No.", "No.");
                if MSPTOrderDetails.FindFirst then begin
                    repeat
                        MSPTOrderDetails."Due Date" := CalcDate(MSPTOrderDetails."Calculation Period", Rec."MSPT Date");
                        MSPTOrderDetails.Modify;
                    until MSPTOrderDetails.Next = 0;
                end;
            end;
        }
        field(50001; "MSPT Code"; Code[20])
        {
            Description = 'MSPT1.0';
            TableRelation = "MSPT Header".Code WHERE(Status = CONST(Released));

            trigger OnValidate();
            var
                MSPTHeader: Record "MSPT Header";
                "MSPT Details": Record "MSPT Line";
            begin
                TestField(Status, Status::Open);

                MSPTOrderDetails.SetRange(Type, MSPTOrderDetails.Type::Purchase);
                MSPTOrderDetails.SetRange("Document Type", "Document Type");
                MSPTOrderDetails.SetRange("Document No.", "No.");
                MSPTOrderDetails.DeleteAll;

                MSPTHeader.SetRange(MSPTHeader.Code, "MSPT Code");
                if MSPTHeader.FindFirst then begin
                    "MSPT Details".SetRange("MSPT Details"."MSPT Header Code", "MSPT Code");
                    if "MSPT Details".FindFirst then begin
                        repeat
                            MSPTOrderDetails.Type := MSPTOrderDetails.Type::Purchase;
                            MSPTOrderDetails."Document Type" := "Document Type";
                            MSPTOrderDetails."Document No." := "No.";
                            MSPTOrderDetails."Party Type" := MSPTOrderDetails."Party Type"::Vendor;
                            MSPTOrderDetails."Party No." := "Buy-from Vendor No.";
                            MSPTOrderDetails."MSPT Header Code" := "MSPT Code";
                            //MSPTOrderDetails."Calculation Type" := MSPTHeader.Type;
                            MSPTOrderDetails."MSPT Code" := "MSPT Details".Code;
                            MSPTOrderDetails."MSPT Line No." := "MSPT Details"."Line No.";
                            MSPTOrderDetails.Percentage := "MSPT Details".Percentage;
                            //MSPTOrderDetails.Amount:="MSPT Details".Amount;
                            MSPTOrderDetails.Description := "MSPT Details".Description;
                            MSPTOrderDetails."Calculation Period" := "MSPT Details"."Calculation Period";
                            MSPTOrderDetails.Remarks := "MSPT Details".Remarks;
                            PurchHeader.Get(MSPTOrderDetails."Document Type", MSPTOrderDetails."Document No.");
                            MSPTOrderDetails."Due Date" := CalcDate(MSPTOrderDetails."Calculation Period", "MSPT Date");
                            MSPTOrderDetails.Insert;
                        until "MSPT Details".Next = 0;
                    end;
                end;
            end;
        }
        field(50002; "MSPT Applicable at Line Level"; Boolean)
        {
            Description = 'MSPT1.0';
        }
        field(60001; "Vendor Excise Invoice No."; Code[10])
        {
            Description = 'B2B';
        }
        field(60002; "Vend. Excise Inv. Date"; Date)
        {
            Description = 'B2B';
        }
        field(60003; "Cancel Short Close"; Option)
        {
            Description = 'B2B';
            OptionCaption = '" ,Cancelled,Short Closed"';
            OptionMembers = " ",Cancelled,"Short Closed";
        }
        field(60004; "RFQ No."; Code[10])
        {
            Description = 'B2B';
            TableRelation = "Mech & Wirning Items"."Production Order No.";
        }
        field(60005; Make; Text[50])
        {
            Description = 'B2B';
            Enabled = false;
        }
        field(60006; "Packing Type"; Text[25])
        {
            Description = 'B2B';
        }
        field(60007; Verification; Text[50])
        {
            Description = 'B2B';
            Enabled = false;
        }
        field(60008; "Quotation No."; Code[30])
        {
            Description = 'PH1.0';
        }
        field(60009; "ICN No."; Code[10])
        {
            Description = 'PH1.0';
            Editable = false;
        }
        field(60010; "Release Date Time"; DateTime)
        {
        }
        field(60011; "Tender No"; Code[20])
        {
            TableRelation = "Tender Header"."Tender No.";
        }
        field(60012; "Sale Order No"; Code[30])
        {
            TableRelation = "Sales Header"."No.";
        }
        field(60013; "Bill Received"; Boolean)
        {
        }
        field(60014; "Duplicate For Transporter"; Boolean)
        {
        }
        field(60018; "Quotation Date"; Date)
        {
        }
        field(60019; "Vendor Invoice Date"; Date)
        {
        }
        field(60020; "Purchase Journal"; Boolean)
        {
        }
        field(60021; "Calculate Tax Structure"; Boolean)
        {
        }
        field(60079; "Order (Digits)"; Code[10])
        {
            Enabled = false;
        }
        field(60090; "Buy-from Address 3"; Text[50])
        {
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
        field(60092; "Dimension Corrected"; Boolean)
        {
            Description = 'added  by sujani for Dimension issue clearance (B2B Assistance)';
            Editable = false;
        }
        field(60095; "Actual Invoiced Date"; Date)
        {
        }
        field(60096; "Additional Duty Value"; Decimal)
        {
        }
        field(60097; "Type of Supplier"; Option)
        {
            OptionCaption = '" ,Manufacturer,First Stage Dealer,Importer"';
            OptionMembers = " ",Manufacturer,"First Stage Dealer",Importer;
        }
        field(60098; "Inclusive of All Taxes"; Boolean)
        {
        }
        field(60100; "Vehicle Number"; Text[12])
        {
        }
        field(60101; "Transporter Name"; Text[20])
        {
            TableRelation = "Transport Method";
        }
        field(60102; "C-Form Number"; Code[20])
        {
            Enabled = false;
        }
        field(60103; "C-Form Issue Date"; Date)
        {
            Enabled = false;
        }
        field(60115; "OrderCreated by"; Code[35])
        {
            Description = 'Rev01';
            TableRelation = User."User Name";
        }
        field(60116; "Released By"; Code[35])
        {
            Description = 'Rev01';
            TableRelation = User."User Name";
        }
        field(60117; Mail_Sent; DateTime)
        {
        }
        field(60118; "Way bill"; Code[20])
        {
        }
        field(60119; Mail_count; Decimal)
        {
        }
        field(60120; "Acknowledge Given by"; Text[15])
        {
        }
        field(60121; "Acknowledged Dt"; Date)
        {
        }
        field(60122; "Tarrif Heading No"; Code[35])
        {
        }
        field(60123; QA_Auth_Status; Option)
        {
            OptionMembers = " ","Sent For Auth",Authorized,Rejected;
        }
        field(60124; QA_Auth_Date; Date)
        {
        }
        field(60125; "First Release DateTime"; DateTime)
        {
        }
        field(60126; "First Release By"; Code[35])
        {
        }
        field(60128; "USER ID"; Code[35])
        {
            Editable = false;
            TableRelation = User."User Name";
        }
        field(60129; "Do not Consider GST"; Boolean)
        {
            Description = 'Do not Consider GST in cashflow or not';

            trigger OnValidate();
            begin
                if "Payment Terms Code" <> 'TOTADV' then
                    Error('This is only applicable for TOTAL ADVANCE payment terms');
            end;
        }
        field(70000; "Sales Order Ref No."; Code[20])
        {

            trigger OnLookup();
            var
                PrevDocNo: Code[30];
            begin
                /*
                IF "USER ID" IN['EFFTRONICS\SUSMITHAL','EFFTRONICS\YESU','EFFTRONICS\PADJAMAM','EFFTRONICS\B2BOTS'] THEN BEGIN
                  CLEAR(SalesListArchive);
                  PrevDocNo := '';
                  SalesHeaderArchive.RESET;
                  SalesHeaderArchive.SETCURRENTKEY("Date Archived","Time Archived");
                  //SalesHeaderArchive.ASCENDING(FALSE);
                  SalesHeaderArchive.SETRANGE("Document Type",SalesHeaderArchive."Document Type"::Order);
                  IF SalesHeaderArchive.FINDSET THEN
                    REPEAT
                      IF PrevDocNo <> SalesHeaderArchive."No." THEN BEGIN
                        SalesHeaderArchive.MARK(TRUE);
                        PrevDocNo := SalesHeaderArchive."No.";
                      END;
                    UNTIL SalesHeaderArchive.NEXT = 0;
                  SalesHeaderArchive.MARKEDONLY(TRUE);
                  SalesListArchive.SETRECORD(SalesHeaderArchive);
                  SalesListArchive.SETTABLEVIEW(SalesHeaderArchive);
                  SalesListArchive.LOOKUPMODE(TRUE);
                  IF SalesListArchive.RUNMODAL =ACTION::LookupOK THEN BEGIN
                    SalesListArchive.GETRECORD(SalesHeaderArchive);
                    "Sales Order Ref No." := SalesHeaderArchive."No.";
                  END;
                END;
                */

            end;
        }
    }
    trigger OnAfterInsert()
    var
        myInt: Integer;
    begin
        //B2B-MSPT1.0
        IF "Document Type" = "Document Type"::Order THEN
            "MSPT Date" := "Posting Date"
        ELSE
            IF "Document Type" = "Document Type"::Quote THEN
                "MSPT Date" := "Document Date";
        //B2B-MSPT1.0
        "Bill Received" := TRUE;
        "Packing Type" := 'Standard Packing';
        "Shortcut Dimension 1 Code" := 'PRD-0010';
        "USER ID" := USERID;
    END;



    trigger OnModify()
    var
        myInt: Integer;
    begin
        // Cashflow_Modification;
        "USER ID" := USERID;
    end;

    trigger OnBeforeDelete()
    var
        PurchLine: Record "Purchase Line";
    begin
        /*  {IF NOT (USERID IN['EFFTRONICS\PRANAVI','EFFTRONICS\ANILKUMAR','EFFTRONICS\ANVESH','EFFTRONICS\SPURTHI','EFFTRONICS\VIJAYA']) THEN    //Added by Pranavi on 03-Dec-2015
                 ERROR('You Do Not Have Rights to Delete!');}*/

        // added on 18-SEP-2017 To provide the provision of deleting empty purchase order lines for the Purchase Department
        IF NOT (USERID IN ['EFFTRONICS\SUJANI', 'EFFTRONICS\ANILKUMAR', 'EFFTRONICS\ANVESH', 'EFFTRONICS\SPURTHI', 'EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\B2BOTS'])
        THEN BEGIN
            UserDetails.RESET;
            UserDetails.SETRANGE("User Name", USERID);
            IF UserDetails.FINDSET THEN BEGIN
                IF UserDetails.Dept IN ['CR ROOM', 'F&A'] THEN BEGIN
                    PurchLine.RESET;
                    PurchLine.SETRANGE("Document No.", "No.");
                    IF PurchLine.FINDFIRST
                      THEN
                        ERROR('You Don''t Have Rights to Delete Purchase Order(Empty Line)');
                END ELSE
                    ERROR('You Don''t Have Rights to Delete Purchase Order');
            END
            ELSE
                ERROR('You Don''t Have Rights to Delete Purchase Order');
        END;

        //--------------------------------------------------------------

        //  Cashflow_Modification;
        //EFFUPG Start
        /* {
         IF Status = Status:: Released THEN
           ERROR(Text043,"No.");
         }*/
        //EFFUPG End
    end;


    var
        "--QC--": Integer;
        "---Indent---": Integer;
        PurchHeader1: Record "Purchase Header";
        Selection: Integer;
        IndentHeader: Record "Indent Header";
        IndentLine: Record "Indent Line";
        PurchLine1: Record "Purchase Line";
        PurchLineNo: Integer;
        TaxFormsDetails: Record "Tax Forms Details";
        "---MPST---": Integer;
        MSPTOrderDetails: Record "MSPT Order Details";
        SQLQuery: Text[1000];
        LineSQLQuery: Text[250];
        HeadID: Text[30];
        UpdateWebHead: Text[250];
        WebRecStatus: Text[30];
        OldWebStatus: Text[30];
        "G|l": Record "General Ledger Setup";
        Quotes: Label '''';
        Text50001: Label 'NEW';
        Text50002: Label 'OLD';
        "--Rev01": Integer;
        SQLConnection: Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000514-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Connection";
        RecordSet: Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000535-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Recordset";
        LRecordSet: Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000535-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Recordset";
        Vndr: Record Vendor;
        ArchiveManagement: Codeunit ArchiveManagement;
        UserDetails: Record User;
        SalesHeaderArchive: Record "Sales Header Archive";
        SalesListArchive: Page "Sales List Archive";
}

