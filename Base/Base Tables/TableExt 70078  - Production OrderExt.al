tableextension 70078 ProductionOrderExt extends "Production Order"
{
    fields
    {
        modify("No.")
        {
            CaptionML = ENU = 'Production Order No.', ENN = 'Production Order No.';
        }

        
        field(60001; "Sales Order No."; Code[20])
        {
            TableRelation = "Sales Header"."No." WHERE("Document Type" = FILTER(Order | "Blanket Order"));

            trigger OnValidate();
            begin
                /*ProdOrderLine.RESET;
                ProdOrderLine.SETFILTER(ProdOrderLine."Prod. Order No.","No.");
                IF ProdOrderLine.FINDSET THEN
                BEGIN
                  ProdOrderLine.DELETEALL;
                END;
                "Sales Order Line No.":=0;
                "Schedule Line No.":=0;
                "Source No.":='';
                 */

            end;
        }
        field(60002; "Sales Order Line No."; Integer)
        {
            TableRelation = "Sales Line"."Line No." WHERE("Document No." = FIELD("Sales Order No."));

            trigger OnValidate();
            begin
                /*ProdOrderLine.RESET;
                ProdOrderLine.SETFILTER(ProdOrderLine."Prod. Order No.","No.");
                IF ProdOrderLine.FINDSET THEN
                BEGIN
                  ProdOrderLine.DELETEALL;
                END;
                "Schedule Line No.":=0;
                "Source No.":='';
                 */


                /*SalesLine.SETRANGE("Document No.","Sales Order No.");
                SalesLine.SETRANGE("Line No.","Sales Order Line No.");
                IF SalesLine.FIND('-') THEN BEGIN
                  "Source Type" := "Source Type" :: Item;
                  VALIDATE("Source No.",SalesLine."No.");
                END;*/
                SalesLine.SetRange("Document No.", "Sales Order No.");
                SalesLine.SetRange("Line No.", "Sales Order Line No.");
                if SalesLine.Find('-') then begin
                    Quantity := SalesLine.Quantity;// ADDED BY SUJANI ON 13-02-2018
                    if "Schedule Line No." = 0 then begin
                        "Source Type" := "Source Type"::Item;
                        Validate("Source No.", SalesLine."No.");
                    end
                    else begin
                        Schedule.Reset;
                        Schedule.SetFilter(Schedule."Document Type", '%1', SalesLine."Document Type");
                        Schedule.SetFilter(Schedule."Document No.", "Sales Order No.");
                        Schedule.SetFilter(Schedule."Document Line No.", '%1', "Sales Order Line No.");
                        Schedule.SetFilter(Schedule."Line No.", '%1', "Schedule Line No.");
                        if Schedule.Find('-') then begin
                            "Source Type" := "Source Type"::Item;
                            Validate("Source No.", Schedule."No.");
                        end;
                    end;
                end;

            end;
        }
        field(60005; "Item Sub Group Code"; Code[20])
        {
            Description = 'B2B';

            trigger OnValidate();
            var
                ItemSubSubGroup: Record "Item Sub Sub Group";
            begin
            end;
        }
        field(60006; "Product Group Code"; Code[10])
        {
            Caption = 'Product Group Code';
            Description = 'B2B-Modified Added code in Onvalidate Trigger';

            trigger OnValidate();
            var
                ItemSubGroup: Record "Item Sub Group";
            begin
            end;
        }
        field(60007; "Planned Dispatch Date"; Date)
        {

            trigger OnValidate();
            begin
                if UserId in ['EFFTRONICS\ANILKUMAR', 'EFFTRONICS\VSNGEETHA', 'EFFTRONICS\ANVESH', 'EFFTRONICS\GRAVI', 'EFFTRONICS\PKOTESWARARAO', 'EFFTRONICS\GRAVI', 'EFFTRONICS\VANIDEVI'] then begin
                    if Format("Prod Start date") = '' then
                        Error('Please fill production start date');

                    if "Prod Start date" >= "Planned Dispatch Date" then
                        Error('Dispatch date must be less the or equal the start date');
                end;
            end;
        }
        field(60008; Week; Integer)
        {
        }
        field(60009; Customer; Text[50])
        {
            CalcFormula = Lookup("Sales Header"."Sell-to Customer Name" WHERE("No." = FIELD("Sales Order No.")));
            FieldClass = FlowField;
        }
        field(60010; "Shortage Verified"; Boolean)
        {
        }
        field(60011; "Shortage Items"; Integer)
        {
            CalcFormula = Count("Production Order Shortage Item" WHERE("Production Order" = FIELD("No.")));
            FieldClass = FlowField;
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
        field(60100; "Schedule Line No."; Integer)
        {
            TableRelation = Schedule2."Line No." WHERE("Document No." = FIELD("Sales Order No."),
                                                        "Document Line No." = FIELD("Sales Order Line No."),
                                                        "Document Type" = FILTER(Order | "Blanket Order"));

            trigger OnValidate();
            begin
                /*
                ProdOrderLine.RESET;
                ProdOrderLine.SETFILTER(ProdOrderLine."Prod. Order No.","No.");
                IF ProdOrderLine.FINDSET THEN
                BEGIN
                  ProdOrderLine.DELETEALL;
                END;
                "Source No.":='';
                 */


                SalesLine.SetRange("Document No.", "Sales Order No.");
                SalesLine.SetRange("Line No.", "Sales Order Line No.");
                if SalesLine.Find('-') then begin
                    Quantity := SalesLine.Quantity;// ADDED BY SUJANI ON 13-02-2018
                    if "Schedule Line No." = 0 then begin
                        "Source Type" := "Source Type"::Item;
                        Validate("Source No.", SalesLine."No.");
                    end
                    else begin
                        SalesDocType := Format(SalesLine."Document Type");
                        Schedule.Reset;
                        Schedule.SetFilter(Schedule."Document Type", SalesDocType);
                        Schedule.SetFilter(Schedule."Document No.", "Sales Order No.");
                        Schedule.SetFilter(Schedule."Document Line No.", '%1', "Sales Order Line No.");
                        Schedule.SetFilter(Schedule."Line No.", '%1', "Schedule Line No.");
                        if Schedule.FindFirst then begin
                            // Added by Pranavi on 20-Feb-2016 for not allowing to select default schedule line no.
                            if Schedule."Line No." = Schedule."Document Line No." then begin
                                SLt.Reset;
                                SLt.SetRange(SLt."Document No.", Schedule."Document No.");
                                SLt.SetRange(SLt."Line No.", Schedule."Document Line No.");
                                if SLt.FindFirst then begin
                                    if Schedule."No." = SLt."No." then
                                        Error('You cannot select this schedule line no.!\As it is default Line!');
                                end;
                            end;
                            // End by Pranavi
                            "Source Type" := "Source Type"::Item;
                            Validate("Source No.", Schedule."No.");
                        end;
                    end;
                end;

            end;
        }
        field(60101; "Service Order No."; Code[20])
        {
            Description = 'B2B EFF';
            TableRelation = "Service Header"."No." WHERE("Document Type" = CONST(Order));
        }
        field(60102; "Change Status"; Boolean)
        {
        }
        field(60103; RefreshProdTime; DateTime)
        {
        }
        field(60104; Refreshdate; Date)
        {
        }
        field(60105; StatusTemp; Boolean)
        {
        }
        field(60106; "Production Order Status"; Option)
        {
            OptionMembers = "Yet to Start","Under Production",Soldering,Integration,"Ready for Inspection","Call Letter Registered","Inspection Completed","Final Testing","Ready for Dispatch","Convertion- Need to close";
        }
        field(60107; "Work.MesurInUnits(ASM)"; Integer)
        {
        }
        field(60108; "Work.MesurInUnits(TST)"; Integer)
        {
        }
        field(60109; "Work.MesurInUnits(SHF)"; Integer)
        {
        }
        field(60110; "Total Unts"; Integer)
        {
        }
        field(60111; Remarks; Text[100])
        {
            Description = 'added by sujani 29-11-18 to update the sale order  deviation remarks';
        }
        field(60112; Itm_card_No_of_Units; Decimal)
        {
        }
        field(60113; Itm_Card_ttl_units; Decimal)
        {
        }
        field(60114; "Sell-to Customer Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Added by Suvarchala devi for tracking customer name in RPOs';
        }
        field(60115; "Benchmarks(in Min)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Added by Suvarchala devi for Item Benchmarks';
        }
        field(60116; "Total Time"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Added by Suvarchala devi for Item Benchmarks';
        }
        field(90080; "User Id"; Code[50])
        {
            Editable = false;
        }
        field(90081; "Prod Start date"; Date)
        {

            trigger OnValidate();
            begin
                if UpperCase(UserId) <> '06PD012' then begin

                    if "Planned Dispatch Date" <> 0D then
                        if "Prod Start date" >= "Planned Dispatch Date" then
                            Error('Dispatch date is lessthe or equal the start date');
                    "Shortage Verified" := false;

                    //TESTFIELD("Product Group Code");
                    TestField("Sales Order No.");
                    //IF ("Prod Start date">0D) AND ("Prod Start date">=Product_Wise_Issues.PLAN_DATE) THEN
                    begin

                        if "Product Group Code" = 'FPRODUCT' then begin
                            Material_Issues_Header.Reset;
                            Material_Issues_Header.SetCurrentKey("Prod. Order No.", "Prod. Order Line No.");
                            Material_Issues_Header.SetRange("Prod. Order No.", "No.");
                            if Material_Issues_Header.FindFirst then
                                Error('Converted Production Order (Final Product) will not allow to plan');
                            Posted_Material_Issues_Header.SetCurrentKey("Prod. Order No.", "Prod. Order Line No.");
                            Posted_Material_Issues_Header.SetRange("Prod. Order No.", "No.");
                            if Posted_Material_Issues_Header.FindFirst then
                                Error('Converted Production Order (Final Product) will not allow to plan');
                        end;
                        /* IF (Planned_Units("Prod Start date")>10) AND (Planned_Units("Prod Start date")<12) THEN
                           MESSAGE('YOU ARE EXCEEDING THE 10 UNITS PLAN ON '+FORMAT("Prod Start date"))
                         ELSE IF (Planned_Units("Prod Start date")>14) THEN
                           ERROR('YOU ARE EXCEEDING THE 14 UNITS PLAN ON '+FORMAT("Prod Start date"));*///day wise production coutrol removed by anil

                        "Suppose to Plan" := false;
                        "Virtual Production Start Date" := "Prod Start date";
                    end;

                    /*  IF (Planned_Units("Prod Start date")>14) AND (Planned_Units("Prod Start date")<12) THEN
                        MESSAGE('YOU ARE EXCEEDING THE 14 UNITS PLAN ON '+FORMAT("Prod Start date"))
                      ELSE IF (Planned_Units("Prod Start date")>16) THEN
                        ERROR('YOU ARE EXCEEDING THE 16 UNITS PLAN ON '+FORMAT("Prod Start date"));*/
                end;

                //added for material requisition date updation
                "Prod. Order Component".Reset;
                ITEM.Reset;
                if UserId in ['EFFTRONICS\ANILKUMAR', 'EFFTRONICS\VSNGEETHA', 'EFFTRONICS\ANVESH', 'EFFTRONICS\GRAVI', 'EFFTRONICS\PKOTESWARARAO', 'EFFTRONICS\RENUKACH', 'EFFTRONICS\SUVARCHALADEVI', 'EFFTRONICS\GRAVI', 'EFFTRONICS\VANIDEVI', 'EFFTRONICS\DURGAMAHESWARI'] then begin
                    if ITEM.Get("Source No.") then
                        ITEM.TestField(ITEM."No.of Units");
                    if "Prod Start date" >= 0D then begin

                        /*
                         IF (Planned_Units("Prod Start date")>10) AND (Planned_Units("Prod Start date")<12) THEN
                           MESSAGE('YOU ARE EXCEEDING THE 10 UNITS PLAN ON '+FORMAT("Prod Start date"))
                         ELSE IF (Planned_Units("Prod Start date")>16) THEN
                           ERROR('YOU ARE EXCEEDING THE 16 UNITS PLAN ON '+FORMAT("Prod Start date"));
                        */
                        //   MESSAGE('HI');
                        /*IF "Prod Start date" <> CalMngmt.CalcDateBOC('+0D',"Prod Start date",3,'PROD','',3,'PROD','',FALSE) THEN  //pranavi for not allowng to select non working day on 26-10-2015
                          ERROR('You Can not select start date as '+FORMAT("Prod Start date")+' is non working day!');*/// COMMENTED FOR fINANCIAL YEAR PRODUCTION PURPOSE ON 10-02-2018
                        "Prod. Order Component".SetRange("Prod. Order Component"."Prod. Order No.", "No.");
                        if "Prod. Order Component".FindSet then begin
                            repeat
                                //    MESSAGE('HI1');
                                "Prod. Order Component"."Production Plan Date" := "Prod Start date";
                                if "Prod. Order Component"."Material Required Day" = 0 then
                                    "Prod. Order Component"."Material Requisition Date" := 0D
                                else
                                    if "Prod. Order Component"."Material Required Day" = 1 then
                                        "Prod. Order Component"."Material Requisition Date" := "Prod. Order Component"."Production Plan Date"
                                    else begin
                                        //"Prod. Order Component"."Material Requisition Date" := CALCDATE(FORMAT("Prod. Order Component"."Material Required Day" - 1) +'D',"Prod. Order Component"."Production Plan Date");
                                        "Prod. Order Component"."Material Requisition Date" := CalMngmt.CalcDateBOC('+' + Format("Prod. Order Component"."Material Required Day" - 1) + 'D', "Prod. Order Component"."Production Plan Date", 3, 'PROD', '', 3, 'PROD', '', false);  //pranavi
                                    end;
                                "Prod. Order Component".Modify;
                            until "Prod. Order Component".Next = 0;
                        end else
                            Error('PLEASE REFRESH THE PRODUCTION ORDER PROPERLY');
                    end
                    //coded by anil
                    else begin
                        //     MESSAGE('HI');
                        "Prod. Order Component".SetRange("Prod. Order Component"."Prod. Order No.", "No.");
                        if "Prod. Order Component".FindSet then
                            repeat
                                "Prod. Order Component"."Production Plan Date" := "Prod Start date";
                                "Prod. Order Component"."Material Requisition Date" := 0D;
                                "Prod. Order Component".Modify;
                            until "Prod. Order Component".Next = 0;
                    end;

                end
                else
                    Error('You Dont have rights to perform this operation');

            end;
        }
        field(90082; "Plan Shifting Date"; Date)
        {
        }
        field(90083; "Change To Specified Plan Date"; Boolean)
        {
        }
        field(90085; "No. Of Shortage Items"; Integer)
        {
            CalcFormula = Count("Item Lot Numbers" WHERE("Production Order No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(90086; "Virtual Production Start Date"; Date)
        {
        }
        field(90087; "Suppose to Plan"; Boolean)
        {

            trigger OnValidate();
            begin
                /*
                  GL.GET;
                  IF GL."Production_ Shortage_Status"= GL."Production_ Shortage_Status"::Applied THEN
                     ERROR('YOU ALLREADY ASKED PERMISSION TO MANAGEMENT. CHANGES ALLOWED ONLY AFTER APPROVAL');
                
                  IF GL."Production_ Shortage_Status"= GL."Production_ Shortage_Status"::Accepted THEN
                     ERROR('PERMISSION WAS AUTHORIZED BY MANAGEMENT. AFTER AUTO POSTINGS ONLY MODIFICATIONS WILL BE ALLOWED');
                */

            end;
        }
        field(90088; "Authorization Status"; Boolean)
        {
        }
        field(90089; "RDSO No"; Integer)
        {
        }
    }
    keys
    {

        

        key(Key1; Status, "No.")
        {
        }
        key(Key2; "No.", Status)
        {
        }
        key(Key3; "Search Description")
        {
        }
        key(Key4; "Low-Level Code", "Replan Ref. No.", "Replan Ref. Status")
        {
        }
        key(Key5; "Source Type", "Source No.")
        {
            Enabled = false;
        }
        key(Key6; "Source No.")
        {
        }
        key(Key7; "Starting Date")
        {
        }
        key(Key8; "Prod Start date")
        {
        }
        key(Key9; "Sales Order No.", "Item Sub Group Code")
        {
        }
        key(Key10; "No.")
        {
            Enabled = false;
        }
        key(Key11; "Sales Order No.", "Source No.", "Prod Start date")
        {
        }
        key(Key12; Week, "Sales Order No.", "Source No.")
        {
        }
        key(Key13; Status, "Prod Start date", "No.")
        {
        }
    }

    trigger OnAfterModify()
    begin

    end;


    
    var
        SalesLine: Record "Sales Line";
        ProdOrderQty: Decimal;
        Text091: Label 'Number of Production Orders against Sales Order Exceeded';
        "--SH1.0--": Integer;
        Schedule: Record Schedule2;
        "Prod. Order Component": Record "Prod. Order Component";

    var
        Product_Wise_Issues: Page Areas;
        Material_Issues_Header: Record "Material Issues Header";
        Posted_Material_Issues_Header: Record "Posted Material Issues Header";
        SALES_HEADER: Record "Sales Header";
        ITEM_LEAD_TIME: Integer;
        ITEM: Record Item;
        ITEM_LEAD_TEMP: Text[30];

    var
        GL: Record "General Ledger Setup";
        CalMngmt: Codeunit "Calendar Management";
        SalesDocType: Text;
        SLt: Record "Sales Line";
        ReservGRec: Record "Reservation Entry";
        Items: Record Item;
}

