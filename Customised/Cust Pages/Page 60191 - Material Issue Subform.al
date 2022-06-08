page 60191 "Material Issue Subform"
{
    // version MI1.0,Rev01

    AutoSplitKey = true;
    PageType = ListPart;
    SaveValues = true;
    SourceTable = "Material Issues Line";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Item No."; "Item No.")
                {
                    StyleExpr = ColorCode;

                    trigger OnValidate();
                    begin
                        MaterialIssuesHeader.SETRANGE("No.", "Document No.");
                        IF MaterialIssuesHeader.FINDFIRST THEN BEGIN
                            "Prod. Order No." := MaterialIssuesHeader."Prod. Order No.";
                            "Prod. Order Line No." := MaterialIssuesHeader."Prod. Order Line No.";
                            "Reason Code" := MaterialIssuesHeader."Reason Code";
                            /*IF MaterialIssuesHeader."Transfer-to Code"='SITE' THEN
                            BEGIN
                              ItemFilter:='';
                              ItemGRec.RESET;
                              IF ItemGRec.GET("Item No.") THEN
                                IGCFilter:=ItemGRec."CS IGC";
                              IF IGCFilter <>'' THEN
                              BEGIN
                                ItemGRec.RESET;
                                ItemGRec.SETRANGE(ItemGRec."CS IGC",IGCFilter);
                                IF ItemGRec.FINDFIRST THEN
                                REPEAT
                                  ItemFilter+=ItemGRec."No."+'|';
                                UNTIL ItemGRec.NEXT=0;
                                ItemFilter:=COPYSTR(ItemFilter,1,STRLEN(ItemFilter)-1);
                              END;
                              IF ItemFilter='' THEN
                                ItemFilter:="Item No.";
                              DivisionGRec.RESET;
                              DivisionGRec.SETFILTER(DivisionGRec."Division Code",MaterialIssuesHeader."Shortcut Dimension 2 Code");
                              IF DivisionGRec.FINDFIRST THEN
                                ManagerFilter:=DivisionGRec."Project Manager";

                              DivisionGRec.RESET;
                              DivisionGRec.SETFILTER(DivisionGRec."Project Manager",ManagerFilter);
                              IF DivisionGRec.FINDFIRST THEN
                              REPEAT
                                DivFilter+=DivisionGRec."Division Code"+'|';
                              UNTIL DivisionGRec.NEXT=0;
                                DivFilter:=COPYSTR(DivFilter,1,STRLEN(DivFilter)-1);

                              ItemLedgerEntryGRec.RESET;
                              ItemLedgerEntryGRec.SETFILTER(ItemLedgerEntryGRec."Item No.",ItemFilter);
                              ItemLedgerEntryGRec.SETFILTER(ItemLedgerEntryGRec."Location Code",'SITE');
                              ItemLedgerEntryGRec.SETFILTER(ItemLedgerEntryGRec."Global Dimension 2 Code",MaterialIssuesHeader."Shortcut Dimension 2 Code");
                              ItemLedgerEntryGRec.SETFILTER(ItemLedgerEntryGRec."Remaining Quantity",'>%1',0);
                              IF ItemLedgerEntryGRec.FINDSET THEN
                                StockAtSite:=ItemLedgerEntryGRec.COUNT;
                              ItemLedgerEntryGRec.SETFILTER(ItemLedgerEntryGRec."Global Dimension 2 Code",DivFilter);
                              IF ItemLedgerEntryGRec.FINDSET THEN
                                StockAtManager:=ItemLedgerEntryGRec.COUNT;
                            END;*/
                        END;
                        /* MatIssuesLine.SETCURRENTKEY(Item No.,Prod. Order No.);
                         MatIssuesLine.SETRANGE(MatIssuesLine."Item No.","Item No.");
                         MatIssuesLine.SETRANGE(MatIssuesLine."Prod. Order No.","Prod. Order No.");
                         IF MatIssuesLine.COUNT>0 THEN
                         ERROR('Not possible to draw item on this project code');
                          postedmaterialissuesline.SETRANGE(postedmaterialissuesline."Item No.","Item No.");
                         postedmaterialissuesline.SETFILTER(postedmaterialissuesline."Prod. Order No.","Prod. Order No.");
                        IF  postedmaterialissuesline.COUNT >0 THEN
                          ERROR('Posted material issue present for this item');  */
                        /*
                        // Added by Pranavi on 29-11-2016 for restricting items selection in sta code
                          MaterialIssuesHeader.RESET;
                          MaterialIssuesHeader.SETRANGE(MaterialIssuesHeader."No.","Document No.");
                          IF MaterialIssuesHeader.FINDFIRST THEN
                          BEGIN
                            IF MaterialIssuesHeader."Prod. Order No." IN ['EFF14STA01','EFF08STA01'] THEN
                            BEGIN
                              ItemGRec.RESET;
                              ItemGRec.SETRANGE(ItemGRec."No.","Item No.");
                              IF ItemGRec.FINDFIRST THEN
                              BEGIN
                                IF ItemGRec."Product Group Code" <> 'STATIONARY' THEN
                                  ERROR('You cannot select other than stationary items in the project code: '+MaterialIssuesHeader."Prod. Order No.");
                              END;
                            END;
                          END;
                        // End--Pranavi
                        */

                    end;
                }
                field("Line No."; "Line No.")
                {
                    StyleExpr = ColorCode;
                }
                field(Description; Description)
                {
                    Editable = false;
                    StyleExpr = ColorCode;
                }
                field("MBB Packet Open DateTime"; "MBB Packet Open DateTime")
                {
                }
                field("MBB Packet Close DateTime"; "MBB Packet Close DateTime")
                {
                }
                field("BOM Quantity"; "BOM Quantity")
                {
                }
                field("Description 2"; "Description 2")
                {
                    Editable = false;
                }
                field("Non-Returnable"; "Non-Returnable")
                {
                }
                field(Quantity; Quantity)
                {
                }
                field("Unit Cost"; "Unit Cost")
                {
                }
                field("Qty. to Receive"; "Qty. to Receive")
                {
                }
                field("Quantity Received"; "Quantity Received")
                {

                    trigger OnDrillDown();
                    var
                        "PostedMat.RcptLine": Record "Posted Material Issues Line";
                    begin
                        TESTFIELD("Document No.");
                        TESTFIELD("Item No.");
                        "PostedMat.RcptLine".SETRANGE("Material Issue No.", "Document No.");
                        "PostedMat.RcptLine".SETRANGE("PostedMat.RcptLine"."Material Issue Line No.");
                        PAGE.RUNMODAL(0, "PostedMat.RcptLine");
                    end;
                }
                field("Quantity (Base)"; "Quantity (Base)")
                {
                }
                field("Outstanding Qty. (Base)"; "Outstanding Qty. (Base)")
                {
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                }
                field(Inventory; Inventory)
                {
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                }
                field(Remarks; Remarks)
                {
                }
                field(Station; Station)
                {
                    Editable = true;
                    Enabled = true;
                }
                field("Prod. Order No."; "Prod. Order No.")
                {
                    Editable = false;
                }
                field("Station Name"; "Station Name")
                {
                    Editable = false;
                }
                field("Target Date"; "Target Date")
                {
                }
                field(Rejected; Rejected)
                {
                }
                field("Prod. Order Line No."; "Prod. Order Line No.")
                {
                    Editable = false;
                }
                field("Prod. Order Comp. Line No."; "Prod. Order Comp. Line No.")
                {
                    Editable = false;
                }
                field("Monitor Problem"; "Monitor Problem")
                {
                }
                field("Reason Code"; "Reason Code")
                {
                }
                field("Stock at Site"; StockAtSite)
                {
                }
                field(StockAtManager; StockAtManager)
                {
                    Caption = 'Stock at Manager';
                }
                field("Outstanding Quantity"; "Outstanding Quantity")
                {
                }
                field("Operation No."; "Operation No.")
                {
                }
                field(Dept; Dept)
                {
                }
                field("Material Requisition Date"; "Material Requisition Date")
                {
                }
            }
            field("COUNT"; COUNT)
            {
            }
            field(MSLColor; MSLColor)
            {
                Style = StrongAccent;
                StyleExpr = TRUE;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                group("Item Availability by")
                {
                    Caption = 'Item Availability by';
                    action(Period)
                    {
                        Caption = 'Period';

                        trigger OnAction();
                        begin
                            //This functionality was copied from page #60140. Unsupported part was commented. Please check it.
                            /*CurrPage.MaterialIssueLine.FORM.*/
                            _ItemAvailability(0);

                        end;
                    }
                    action(Variant)
                    {
                        Caption = 'Variant';

                        trigger OnAction();
                        begin
                            //This functionality was copied from page #60140. Unsupported part was commented. Please check it.
                            /*CurrPage.MaterialIssueLine.FORM.*/
                            _ItemAvailability(1);

                        end;
                    }
                    action(Location)
                    {
                        Caption = 'Location';

                        trigger OnAction();
                        begin
                            //This functionality was copied from page #60140. Unsupported part was commented. Please check it.
                            /*CurrPage.MaterialIssueLine.FORM.*/
                            _ItemAvailability(2);

                        end;
                    }
                }
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #60140. Unsupported part was commented. Please check it.
                        /*CurrPage.MaterialIssueLine.FORM.*/
                        _ShowDimensions;

                    end;
                }
                action("Item &Tracking Lines")
                {
                    Caption = 'Item &Tracking Lines';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #60140. Unsupported part was commented. Please check it.
                        /*CurrPage.MaterialIssueLine.FORM.*/
                        OpenItemTrackingLinesPage;

                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        /*MaterialIssuesHeader.SETRANGE("No.","Document No.");
        IF MaterialIssuesHeader.FINDFIRST THEN
        BEGIN
          IF MaterialIssuesHeader."Transfer-to Code"='SITE' THEN
          BEGIN
            ItemFilter:='';
            ItemGRec.RESET;
            IF ItemGRec.GET("Item No.") AND ("Item No."<>'') THEN
              IGCFilter:=ItemGRec."CS IGC";
            IF IGCFilter <>'' THEN
            BEGIN
              ItemGRec.RESET;
              ItemGRec.SETFILTER(ItemGRec."CS IGC",IGCFilter);
              IF ItemGRec.FINDFIRST THEN
              REPEAT
                ItemFilter+=ItemGRec."No."+'|';
              UNTIL ItemGRec.NEXT=0;
              ItemFilter:=COPYSTR(ItemFilter,1,STRLEN(ItemFilter)-1);
            END;
            IF ItemFilter='' THEN
              ItemFilter:="Item No.";
        
            DivisionGRec.RESET;
            DivisionGRec.SETFILTER(DivisionGRec."Division Code",MaterialIssuesHeader."Shortcut Dimension 2 Code");
            IF DivisionGRec.FINDFIRST THEN
              ManagerFilter:=DivisionGRec."Project Manager";
        
            DivisionGRec.RESET;
            DivisionGRec.SETFILTER(DivisionGRec."Project Manager",ManagerFilter);
            IF DivisionGRec.FINDFIRST THEN
            REPEAT
              DivFilter+=DivisionGRec."Division Code"+'|';
            UNTIL DivisionGRec.NEXT=0;
              DivFilter:=COPYSTR(DivFilter,1,STRLEN(DivFilter)-1);
        
            ItemLedgerEntryGRec.RESET;
            ItemLedgerEntryGRec.SETFILTER(ItemLedgerEntryGRec."Item No.",ItemFilter);
            ItemLedgerEntryGRec.SETFILTER(ItemLedgerEntryGRec."Location Code",'SITE');
            ItemLedgerEntryGRec.SETFILTER(ItemLedgerEntryGRec."Global Dimension 2 Code",MaterialIssuesHeader."Shortcut Dimension 2 Code");
            ItemLedgerEntryGRec.SETFILTER(ItemLedgerEntryGRec."Remaining Quantity",'>%1',0);
            IF ItemLedgerEntryGRec.FINDSET THEN
              StockAtSite:=ItemLedgerEntryGRec.COUNT;
            ItemLedgerEntryGRec.SETFILTER(ItemLedgerEntryGRec."Global Dimension 2 Code",DivFilter);
            IF ItemLedgerEntryGRec.FINDSET THEN
              StockAtManager:=ItemLedgerEntryGRec.COUNT;
          END;
        END;
        */
        ColorCode := '';
        IF ItemGRec.GET("Item No.") AND (ItemGRec.MSL <> 0) AND NOT (ItemGRec."Floor Life at 25 C 40% RH" IN ['INFINITE']) THEN
            ColorCode := 'StrongAccent';

    end;

    var
        MatIssuesLine: Record "Material Issues Line";
        TrackingSpecification: Record "Mat.Issue Track. Specification";
        MaterialIssuesHeader: Record "Material Issues Header";
        postedmaterialissuesline: Record "Posted Material Issues Line";
        Mail_From: Text[1000];
        Mail_to: Text[1000];
        Mail_Subject: Text[1000];
        Body: Text[500];
        SMTP_MAIL: Codeunit "SMTP Mail";
        User: Record User;
        Subject: Text[500];
        StockAtSite: Decimal;
        ItemLedgerEntryGRec: Record "Item Ledger Entry";
        ItemGRec: Record Item;
        ItemFilter: Code[1000];
        IGCFilter: Code[1000];
        StockAtManager: Decimal;
        DivisionGRec: Record Division;
        ManagerFilter: Code[250];
        DivFilter: Code[250];
        StationGRec: Record Station;
        ColorCode: Code[30];
        MSLColor: Label 'MSL Component';

    (15567)]
    procedure _ItemAvailability(AvailabilityType: Option Date,Variant,Location);
    begin
        ItemAvailability(AvailabilityType);
    end;

    (15570)]
    procedure ItemAvailability(AvailabilityType: Option Date,Variant,Location);
    begin
        ItemAvailability(AvailabilityType);
    end;

    (15573)]
    procedure _ShowDimensions();
    begin
        Rec.ShowDimensions;
    end;

    (15576)]
    procedure ShowDimensions();
    begin
        Rec.ShowDimensions;
    end;

    (15579)]
    procedure OpenItemTrackingLinesPage();
    var
        Item: Record Item;
        Text001: TextConst ENU = 'You must specify Item Tracking Code in Item No. =''%1''.';
    begin
        Item.GET("Item No.");  //Rev01 Changed Function Name
        IF Item."Item Tracking Code" <> '' THEN BEGIN
            TrackingSpecification.SETRANGE("Order No.", "Document No.");
            TrackingSpecification.SETRANGE("Order Line No.", "Line No.");
            TrackingSpecification.SETRANGE("Item No.", "Item No.");
            TrackingSpecification.SETRANGE("Location Code", "Transfer-from Code");
            PAGE.RUN(PAGE::"Mat.Issues Track.Specification", TrackingSpecification);
        END ELSE
            MESSAGE(Text001, "Item No.");
    end;

    (15589)]
    local procedure RemarksOnInputChange(var Text: Text[1024]);
    begin
        TESTFIELD(Status, Status::Open);
    end;
}

