page 99000813 "Planned Production Order"
{
    // version NAVW19.00.00.45778,Rev01

    CaptionML = ENU = 'Planned Production Order',
                ENN = 'Planned Production Order';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Production Order";
    SourceTableView = WHERE(Status = CONST(Planned));

    layout
    {
        area(content)
        {
            group(General)
            {
                CaptionML = ENU = 'General',
                            ENN = 'General';
                field("No."; "No.")
                {
                    Importance = Promoted;
                    Lookup = false;

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field(Description; Description)
                {
                    Importance = Promoted;
                }
                field("Description 2"; "Description 2")
                {
                }
                field("Source Type"; "Source Type")
                {

                    trigger OnValidate();
                    begin
                        IF xRec."Source Type" <> "Source Type" THEN
                            "Source No." := '';
                    end;
                }
                field("Source No."; "Source No.")
                {
                }
                field("Search Description"; "Search Description")
                {
                }
                field(Quantity; Quantity)
                {
                    Importance = Promoted;
                }
                field("Due Date"; "Due Date")
                {
                }
                field("Assigned User ID"; "Assigned User ID")
                {
                }
                field("Last Date Modified"; "Last Date Modified")
                {
                }
            }
            part(ProdOrderLines; "Planned Prod. Order Lines")
            {
                SubPageLink = Prod. Order No.=FIELD(No.);
            }
            group(Schedule)
            {
                CaptionML = ENU = 'Schedule',
                            ENN = 'Schedule';
                field("Starting Time"; "Starting Time")
                {
                    Importance = Promoted;
                }
                field("Starting Date"; "Starting Date")
                {
                    Importance = Promoted;
                }
                field("Ending Time"; "Ending Time")
                {
                    Importance = Promoted;
                }
                field("Ending Date"; "Ending Date")
                {
                    Importance = Promoted;
                }
                field("Component Time"; "Component Time")
                {
                    Caption = 'Component Time';
                }
                field("Component Date"; "Component Date")
                {
                    Caption = 'Component Date';
                }
            }
            group(Posting)
            {
                CaptionML = ENU = 'Posting',
                            ENN = 'Posting';
                field("Inventory Posting Group"; "Inventory Posting Group")
                {
                    Importance = Promoted;
                }
                field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
                {
                }
                field("Gen. Bus. Posting Group"; "Gen. Bus. Posting Group")
                {
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {

                    trigger OnValidate();
                    begin
                        ShortcutDimension1CodeOnAfterV;
                    end;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {

                    trigger OnValidate();
                    begin
                        ShortcutDimension2CodeOnAfterV;
                    end;
                }
                field("Location Code"; "Location Code")
                {
                    Importance = Promoted;
                }
                field("Bin Code"; "Bin Code")
                {
                    Importance = Promoted;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("O&rder")
            {
                CaptionML = ENU = 'O&rder',
                            ENN = 'O&rder';
                Image = "Order";
                action("Co&mments")
                {
                    CaptionML = ENU = 'Co&mments',
                                ENN = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Prod. Order Comment Sheet";
                    RunPageLink = Status = FIELD(Status), Prod. Order No.=FIELD(No.);
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension=R;
                    CaptionML = ENU='Dimensions',
                                ENN='Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        ShowDocDim;
                        CurrPage.SAVERECORD;
                    end;
                }
                separator(Action53)
                {
                }
                action(Statistics)
                {
                    CaptionML = ENU='Statistics',
                                ENN='Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Production Order Statistics";
                                    RunPageLink = Status=FIELD(Status),No.=FIELD(No.),Date Filter=FIELD(Date Filter);
                    ShortCutKey = 'F7';
                }
                separator(Action65)
                {
                }
                action("Plannin&g")
                {
                    CaptionML = ENU='Plannin&g',
                                ENN='Plannin&g';
                    Image = Planning;

                    trigger OnAction();
                    var
                        OrderPlanning : Page "Order Planning";
                    begin
                        OrderPlanning.SetProdOrder(Rec);
                        OrderPlanning.RUNMODAL;
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            ENN='F&unctions';
                Image = "Action";
                action("Re&fresh Production Order")
                {
                    CaptionML = ENU='Re&fresh Production Order',
                                ENN='Re&fresh Production Order';
                    Ellipsis = true;
                    Image = Refresh;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        ProdOrder : Record "Production Order";
                    begin
                        ProdOrder.SETRANGE(Status,Status);
                        ProdOrder.SETRANGE("No.","No.");
                        REPORT.RUNMODAL(REPORT::"Refresh Production Order",TRUE,TRUE,ProdOrder);
                    end;
                }
                action("Re&plan")
                {
                    CaptionML = ENU='Re&plan',
                                ENN='Re&plan';
                    Ellipsis = true;
                    Image = Replan;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        ProdOrder : Record "Production Order";
                    begin
                        ProdOrder.SETRANGE(Status,Status);
                        ProdOrder.SETRANGE("No.","No.");
                        REPORT.RUNMODAL(REPORT::"Replan Production Order",TRUE,TRUE,ProdOrder);
                    end;
                }
                separator(Action59)
                {
                }
                action("Change &Status")
                {
                    CaptionML = ENU='Change &Status',
                                ENN='Change &Status';
                    Ellipsis = true;
                    Image = ChangeStatus;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        ProdOrderStatusMgt : Codeunit "Prod. Order Status Management";
                    begin
                        CurrPage.UPDATE;
                        ProdOrderStatusMgt.RUN(Rec);
                    end;
                }
                action("&Update Unit Cost")
                {
                    CaptionML = ENU='&Update Unit Cost',
                                ENN='&Update Unit Cost';
                    Ellipsis = true;
                    Image = UpdateUnitCost;

                    trigger OnAction();
                    var
                        ProdOrder : Record "Production Order";
                    begin
                        ProdOrder.SETRANGE(Status,Status);
                        ProdOrder.SETRANGE("No.","No.");

                        REPORT.RUNMODAL(REPORT::"Update Unit Cost",TRUE,TRUE,ProdOrder);
                    end;
                }
                separator(Action62)
                {
                }
                action("C&opy Prod. Order Document")
                {
                    CaptionML = ENU='C&opy Prod. Order Document',
                                ENN='C&opy Prod. Order Document';
                    Ellipsis = true;
                    Image = CopyDocument;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        CopyProdOrderDoc.SetProdOrder(Rec);
                        CopyProdOrderDoc.RUNMODAL;
                        CLEAR(CopyProdOrderDoc);
                    end;
                }
                separator(Action1000000004)
                {
                }
                action("Update &Components Date")
                {
                    Caption = 'Update &Components Date';

                    trigger OnAction();
                    begin
                        //KPK>>
                        IF ("Component Date" = 0D) OR (FORMAT("Component Time") = '') THEN
                          ERROR(Text001);

                        ProdOrderLine.SETRANGE(Status,Status);
                        ProdOrderLine.SETRANGE("Prod. Order No.","No.");
                        IF ProdOrderLine.FINDFIRST THEN BEGIN
                          ProdOrderLine.NEXT(1);
                          REPEAT
                            "Component DateTime" := CREATEDATETIME("Component Date","Component Time");
                            ProdOrderLine.VALIDATE("Starting Date-Time","Component DateTime");
                            ProdOrderLine.MODIFY;
                          UNTIL ProdOrderLine.NEXT = 0;

                        ProdOrderLine2.SETRANGE(Status,Status);
                        ProdOrderLine2.SETRANGE("Prod. Order No.","No.");
                        IF ProdOrderLine2.FINDFIRST THEN BEGIN
                          ProdOrderLine2.NEXT(1);
                          TempDateTime := CREATEDATETIME(ProdOrderLine2."Ending Date",ProdOrderLine2."Ending Time");
                          ProdOrderLine2.NEXT(-1);
                          ProdOrderLine2.VALIDATE("Starting Date-Time",TempDateTime);
                          ProdOrderLine2.MODIFY;
                        END;
                        END;


                        ProdOrderLine3.SETRANGE(Status,Status);
                        ProdOrderLine3.SETRANGE("Prod. Order No.","No.");
                        ProdOrderLine3.SETFILTER(Quantity,'>1');
                        IF ProdOrderLine3.FINDSET THEN BEGIN
                          REPEAT
                           ProdOrderRoutingLine.SETRANGE(Status,ProdOrderLine3.Status);
                           ProdOrderRoutingLine.SETRANGE("Prod. Order No.",ProdOrderLine3."Prod. Order No.");
                           ProdOrderRoutingLine.SETRANGE("Routing Reference No.",ProdOrderLine3."Line No.");
                           //ProdOrderRoutingLine.SETFILTER("Input Quantity",'>1');
                           IF ProdOrderRoutingLine.FINDSET THEN BEGIN
                             REPEAT
                               IF ProdOrderRoutingLine."Run Time" <> 0  THEN
                                 RunTime += ProdOrderRoutingLine."Run Time"
                               ELSE IF (ProdOrderRoutingLine."Run Time" = 0) AND (ProdOrderRoutingLine."Setup Time" <> 0) THEN BEGIN
                                ProdOrderRoutingLine.VALIDATE("Setup Time",ProdOrderRoutingLine."Setup Time" - ((RunTime)*
                                                                                                                (ProdOrderRoutingLine."Input Quantity"-1))
                        );
                                ProdOrderRoutingLine.MODIFY;
                                RunTime := 0;
                               END;
                            UNTIL ProdOrderRoutingLine.NEXT = 0;
                          END;
                        UNTIL ProdOrderLine3.NEXT = 0;
                        END;
                        //KPK<<
                    end;
                }
            }
        }
        area(reporting)
        {
            action("Subcontractor - Dispatch List")
            {
                CaptionML = ENU='Subcontractor - Dispatch List',
                            ENN='Subcontractor - Dispatch List';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Subcontractor - Dispatch List";
            }
        }
    }

    var
        CopyProdOrderDoc : Report "Copy Production Order Document";
                               "Component Date" : Date;
                               "Component Time" : Time;
                               ProdOrderLine : Record "Prod. Order Line";
                               ProdOrderLine2 : Record "Prod. Order Line";
                               ProdOrderLine3 : Record "Prod. Order Line";
                               TempDateTime : DateTime;
                               "Component DateTime" : DateTime;
                               Text001 : Label 'Component Date or Component Time should not be blank.';
        ProdOrderRoutingLine : Record "Prod. Order Routing Line";
        ProdOrderRoutingLine2 : Record "Prod. Order Routing Line";
        RunTime : Decimal;
        SetupTime : Decimal;

    (24080)]
    local procedure ShortcutDimension1CodeOnAfterV();
    begin
        CurrPage.ProdOrderLines.PAGE.UpdateForm(TRUE);
    end;

    (24083)]
    local procedure ShortcutDimension2CodeOnAfterV();
    begin
        CurrPage.ProdOrderLines.PAGE.UpdateForm(TRUE);
    end;
}

