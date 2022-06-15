pageextension 70196 SalesQuoteSubformExt extends "Sales Quote Subform"
{
    layout
    {
        /* modify(Control1)
        {
            ShowCaption = false;
        }
        modify(Control53)
        {
            ShowCaption = false;
        }
        modify(Control49)
        {
            ShowCaption = false;
        }
        modify(Control35)
        {
            ShowCaption = false;
        }
        modify(RefreshTotals)
        {
            ShowCaption = false;
        }
 */
        modify("No.")
        {
            trigger OnAfterValidate()
            begin
                //B2BQTO >>
                IF Type = Type::Item THEN BEGIN
                    Attachments.RESET;
                    Attachments.SETRANGE("Table ID", 27);
                    Attachments.SETRANGE("Attachment Status", TRUE);
                    Attachments.SETRANGE("Document No.", "No.");
                    Attachments.SETRANGE(Description, 'QUOTE SPECIFICATION');
                    IF Attachments.FINDFIRST THEN BEGIN
                        Attachments2.INIT;
                        Attachments2."Table ID" := 36;
                        Attachments2."Document No." := "Document No.";
                        Attachments2."Document Type" := Attachments2."Document Type"::Quote;
                        Attachments2.Description := Attachments.Description + FORMAT(Rec."Line No.");
                        Attachments2."Storage File Name" := Attachments."Storage File Name";
                        Attachments2."Attachment Status" := TRUE;
                        Attachments2.INSERT(TRUE);
                    END
                END;
                //B2BQTO <<
                //MESSAGE('Hi'+(FORMAT(Rec."Line No.")));
            end;
        }
        modify("Unit Price")
        {
            trigger OnAfterValidate()
            begin
                item.SETRANGE(item."No.", "No.");
                IF item.FINDFIRST THEN BEGIN
                    IF ("Unit Price" < item."Avg Unit Cost") THEN
                        ERROR('Unit Price must be greater than item unit Cost');
                END;
            end;
        }
        addafter(Nonstock)
        {
            field("Schedule Type"; "Schedule Type")
            {
                ApplicationArea = All;
            }
            field(Amount; Amount)
            {
                ApplicationArea = All;
            }
        }
        addafter("Unit of Measure")
        {
            field("Unitcost(LOA)"; "Unitcost(LOA)")
            {
                ApplicationArea = All;
            }
        }
        addafter("Line Amount")
        {
            field("Line Amount(LOA)"; "Line Amount(LOA)")
            {
                ApplicationArea = All;
            }
        }
        addafter(LineDiscExists)
        {
            field("OutStanding(LOA)"; "OutStanding(LOA)")
            {
                ApplicationArea = All;
            }
        }
        addafter("Appl.-to Item Entry")
        {
            field("GST %"; "GST %")
            {
                ApplicationArea = All;
            }
        }
        addbefore("Shortcut Dimension 1 Code")
        {
            field("Amount To Customer"; "Amount To Customer")
            {
                ApplicationArea = All;
            }
        }
        addafter(ShortcutDimCode6)
        {
            field("Estimated Unit Cost"; "Estimated Unit Cost")
            {
                ApplicationArea = All;
            }
            field("Estimated Total Unit Cost"; "Estimated Total Unit Cost")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter("Roll Up &Cost")
        {
            action("Sc&hedule")
            {
                Caption = 'Sc&hedule';
                ApplicationArea = All;

                trigger OnAction();
                begin
                    Show_schedules;
                end;
            }
        }
    }


    var
        item: Record Item;
        Schedule: Record Schedule2;
        SalesLine: Record "Sales Line";
        EvaluedValue: Decimal;
        Attachments: Record Attachments;
        Attachments2: Record Attachments;
        SalesHeader: Record "Sales Header";


<<<<<<< HEAD
=======
    (7650)]
>>>>>>> 2cc8f1fea3184cdf038a92c8ef5fefc00ee958f1
    procedure "---B2B---"();
    begin
    end;

<<<<<<< HEAD

=======
    (7653)]
>>>>>>> 2cc8f1fea3184cdf038a92c8ef5fefc00ee958f1
    procedure CustAttachments();
    var
        CustAttach: Record Attachments;
    begin
        CustAttach.RESET;
        CustAttach.SETRANGE("Table ID", DATABASE::"Sales Header");
        CustAttach.SETRANGE("Document No.", Rec."Document No.");
        CustAttach.SETRANGE("Document Type", "Document Type"::Quote);

        PAGE.RUN(PAGE::"ESPL Attachments", CustAttach);
    end;

<<<<<<< HEAD

=======
    (7661)]
>>>>>>> 2cc8f1fea3184cdf038a92c8ef5fefc00ee958f1
    procedure ShowSalesOrderWorkSheet();
    var
        DesignWorksheetHeader: Record "Design Worksheet Header";
        DesignWorksheetLine: Record "Design Worksheet Line";
        Item: Record Item;
        ItemDesignWorksheetHeader: Record "Item Design Worksheet Header";
        ItemDesignWorksheetLine: Record "Item Design Worksheet Line";
    begin
        /*
        //TESTFIELD("Document Type");
        TESTFIELD("Document No.");
        TESTFIELD("Line No.");
        
        CLEAR(DesignWorksheetHeader);
        DesignWorksheetHeader.SETRANGE("Document Type",DesignWorksheetHeader."Document Type"::Quote);
        DesignWorksheetHeader.SETRANGE("Document No.","Document No.");
        DesignWorksheetHeader.SETRANGE("Document Line No.","Line No.");
        DesignWorksheetHeader.FILTERGROUP(2);
        IF DesignWorksheetHeader.FINDFIRST THEN
          Page.RUNMODAL(60122,DesignWorksheetHeader);
        DesignWorksheetHeader.FILTERGROUP(0);
        */
        //TESTFIELD("Document Type");
        TESTFIELD("Document No.");
        TESTFIELD("Line No.");
        ItemDesignWorksheetHeader.RESET;
        IF ItemDesignWorksheetHeader.GET("No.") THEN BEGIN
            DesignWorksheetHeader.INIT;
            DesignWorksheetHeader.TRANSFERFIELDS(ItemDesignWorksheetHeader);
            DesignWorksheetHeader."Document No." := "Document No.";
            DesignWorksheetHeader."Document Line No." := "Line No.";
            DesignWorksheetHeader."Document Type" := DesignWorksheetHeader."Document Type"::Quote;
            IF DesignWorksheetHeader.INSERT THEN;
            ItemDesignWorksheetLine.RESET;
            ItemDesignWorksheetLine.SETRANGE(ItemDesignWorksheetLine."Item No", ItemDesignWorksheetHeader."Item No.");
            IF ItemDesignWorksheetLine.FINDSET THEN
                REPEAT
                    DesignWorksheetLine.INIT;
                    DesignWorksheetLine.TRANSFERFIELDS(ItemDesignWorksheetLine);
                    DesignWorksheetLine."Document No." := "Document No.";
                    DesignWorksheetLine."Document Line No." := "Line No.";
                    DesignWorksheetLine."Document Type" := DesignWorksheetLine."Document Type"::Quote;
                    IF DesignWorksheetLine.INSERT THEN;
                UNTIL ItemDesignWorksheetLine.NEXT = 0;
        END;
        COMMIT;

        CLEAR(DesignWorksheetHeader);
        DesignWorksheetHeader.SETRANGE("Document Type", DesignWorksheetHeader."Document Type"::Quote);
        DesignWorksheetHeader.SETRANGE("Document No.", "Document No.");
        DesignWorksheetHeader.SETRANGE("Document Line No.", "Line No.");
        DesignWorksheetHeader.FILTERGROUP(2);
        IF DesignWorksheetHeader.FINDFIRST THEN
            PAGE.RUNMODAL(60122, DesignWorksheetHeader);
        DesignWorksheetHeader.FILTERGROUP(0);

    end;

<<<<<<< HEAD

=======
    (7710)]
>>>>>>> 2cc8f1fea3184cdf038a92c8ef5fefc00ee958f1
    procedure ShowSchedule2();
    var
        Schedule: Record Schedule2;
    begin
        Schedule.SETRANGE("Document Type", Schedule."Document Type"::Quote);
        Schedule.SETRANGE("Document No.", "Document No.");
        Schedule.SETRANGE("Document Line No.", "Line No.");
        PAGE.RUNMODAL(60125, Schedule);
    end;

<<<<<<< HEAD

=======
    (7716)]
>>>>>>> 2cc8f1fea3184cdf038a92c8ef5fefc00ee958f1
    procedure ShowSchedule();
    var
        Schedule: Record Schedule2;
        SalesLine: Record "Sales Line";
    begin
        /*
        Schedule.SETRANGE("Document Type",Schedule."Document Type" :: Quote);
        Schedule.SETRANGE("Document No.","Document No.");
        Schedule.SETRANGE("Document Line No.","Line No.");
        Page.RUNMODAL(60125,Schedule);
        */
        IF Type = Type::Item THEN BEGIN
            IF ("Tender No." <> '') AND ("Tender Line No." <> 0) THEN BEGIN
                Schedule.RESET;
                Schedule.SETRANGE("Document Type", Schedule."Document Type"::Quote);
                Schedule.SETRANGE("Document No.", "Document No.");
                Schedule.SETRANGE("Document Line No.", "Line No.");
                //Schedule.SETRANGE("Item No.","No.");
                //Schedule.SETRANGE(Quantity,Quantity);
                Schedule.FILTERGROUP(2);
                IF Schedule.FINDFIRST THEN BEGIN
                    PAGE.RUN(60125, Schedule);
                    Schedule.FILTERGROUP(0);
                END ELSE BEGIN
                    SalesLine.RESET;
                    SalesLine.SETRANGE("Document No.", "Document No.");
                    SalesLine.SETRANGE("Line No.", "Line No.");
                    IF SalesLine.FINDSET THEN
                        REPEAT
                            Schedule.INIT;
                            Schedule."Document Type" := Schedule."Document Type"::Quote;
                            Schedule."Document No." := SalesLine."Document No.";
                            Schedule."Document Line No." := SalesLine."Line No.";
                            Schedule."Line No." := SalesLine."Line No.";
                            Schedule.Type := Schedule.Type::Item;
                            Schedule.VALIDATE("No.", SalesLine."No.");
                            Schedule.Quantity := SalesLine.Quantity;
                            Schedule."Estimated Total Unit Price" := Schedule."Estimated Unit Price" * Quantity;
                            //salesLine.CALCFIELDS("Estimated Unit Cost");
                            IF Schedule.INSERT THEN;
                        UNTIL SalesLine.NEXT = 0;
                    COMMIT;
                    Schedule.RESET;
                    Schedule.SETRANGE("Document Type", Schedule."Document Type"::Quote);
                    Schedule.SETRANGE("Document No.", "Document No.");
                    Schedule.SETRANGE("Document Line No.", "Line No.");
                    Schedule.FILTERGROUP(2);
                    PAGE.RUN(60125, Schedule);
                    Schedule.FILTERGROUP(0);
                END
            END ELSE BEGIN
                SalesLine.RESET;
                SalesLine.SETRANGE("Document No.", "Document No.");
                SalesLine.SETRANGE("Line No.", "Line No.");
                IF SalesLine.FINDSET THEN
                    REPEAT
                        Schedule.INIT;
                        Schedule."Document Type" := Schedule."Document Type"::Quote;
                        Schedule."Document No." := SalesLine."Document No.";
                        Schedule."Document Line No." := SalesLine."Line No.";
                        Schedule."Line No." := SalesLine."Line No.";
                        Schedule.Type := Schedule.Type::Item;
                        Schedule.VALIDATE("No.", SalesLine."No.");
                        Schedule.Quantity := SalesLine.Quantity;
                        //salesLine.CALCFIELDS("Estimated Unit Cost");
                        IF Schedule.INSERT THEN;
                    UNTIL SalesLine.NEXT = 0;
                COMMIT;
                Schedule.RESET;
                Schedule.SETRANGE("Document Type", Schedule."Document Type"::Quote);
                Schedule.SETRANGE("Document No.", "Document No.");
                Schedule.SETRANGE("Document Line No.", "Line No.");
                Schedule.FILTERGROUP(2);
                PAGE.RUN(60125, Schedule);
                Schedule.FILTERGROUP(0);
            END
        END ELSE
            IF Type = Type::"G/L Account" THEN BEGIN
                Schedule.RESET;
                Schedule.SETRANGE("Document Type", Schedule."Document Type"::Quote);
                Schedule.SETRANGE("Document No.", "Document No.");
                Schedule.SETRANGE("Document Line No.", "Line No.");
                Schedule.FILTERGROUP(2);
                PAGE.RUN(60125, Schedule);
                Schedule.FILTERGROUP(0);

            END;

    end;

<<<<<<< HEAD

=======
    (7799)]
>>>>>>> 2cc8f1fea3184cdf038a92c8ef5fefc00ee958f1
    local procedure Show_schedules();
    begin
        IF Type = Type::Item THEN BEGIN
            IF (("Tender No." <> '') AND ("Tender Line No." <> 0)) THEN BEGIN
                Schedule.RESET;
                Schedule.SETRANGE("Document Type", Schedule."Document Type"::Order);
                Schedule.SETRANGE("Document No.", "Document No.");
                Schedule.SETRANGE("Document Line No.", "Line No.");
                //Schedule.SETRANGE("Item No.","No.");
                //Schedule.SETRANGE(Quantity,Quantity);
                Schedule.FILTERGROUP(2);
                IF Schedule.FINDFIRST THEN BEGIN
                    PAGE.RUN(60125, Schedule);
                    Schedule.FILTERGROUP(0);
                END ELSE BEGIN
                    SalesLine.RESET;
                    SalesLine.SETRANGE("Document No.", "Document No.");
                    SalesLine.SETRANGE("Line No.", "Line No.");
                    IF SalesLine.FINDSET THEN
                        REPEAT
                            Schedule.INIT;
                            Schedule."Document Type" := Schedule."Document Type"::Order;
                            Schedule."Document No." := SalesLine."Document No.";
                            Schedule."Document Line No." := SalesLine."Line No.";
                            Schedule."Line No." := SalesLine."Line No.";
                            //Schedule."Line No.":=10000;     // Pranavi
                            Schedule.Type := Schedule.Type::Item;
                            Schedule.VALIDATE("No.", SalesLine."No.");
                            Schedule."Qty. Per" := 1;
                            Schedule.Quantity := SalesLine.Quantity;
                            Schedule.VALIDATE(Quantity);
                            Schedule."Unit of Measure Code" := SalesLine."Unit of Measure Code";
                            Schedule.VALIDATE("Unit of Measure Code");
                            Schedule."Location Code" := SalesLine."Location Code";
                            //salesLine.CALCFIELDS("Estimated Unit Cost");
                            IF Schedule.INSERT THEN;
                        UNTIL SalesLine.NEXT = 0;
                    COMMIT;
                    Schedule.RESET;
                    Schedule.SETRANGE("Document Type", Schedule."Document Type"::Order);
                    Schedule.SETRANGE("Document No.", "Document No.");
                    Schedule.SETRANGE("Document Line No.", "Line No.");
                    Schedule.FILTERGROUP(2);
                    PAGE.RUN(60125, Schedule);
                    Schedule.FILTERGROUP(0);
                END
            END ELSE
                IF (("Blanket Order No." <> '') AND ("Blanket Order Line No." <> 0)) THEN BEGIN
                    Schedule.RESET;
                    Schedule.SETRANGE("Document Type", Schedule."Document Type"::Order);
                    Schedule.SETRANGE("Document No.", "Document No.");
                    Schedule.SETRANGE("Document Line No.", "Line No.");
                    Schedule.FILTERGROUP(2);
                    PAGE.RUN(60125, Schedule);
                    Schedule.FILTERGROUP(0);
                END ELSE BEGIN
                    SalesLine.RESET;
                    SalesLine.SETRANGE("Document No.", "Document No.");
                    SalesLine.SETRANGE("Line No.", "Line No.");
                    IF SalesLine.FINDSET THEN
                        REPEAT
                            Schedule.INIT;
                            Schedule."Document Type" := Schedule."Document Type"::Order;
                            Schedule."Document No." := SalesLine."Document No.";
                            Schedule."Document Line No." := SalesLine."Line No.";
                            Schedule."Line No." := SalesLine."Line No.";
                            //Schedule."Line No.":=10000;  // Pranavi
                            Schedule.Type := Schedule.Type::Item;
                            Schedule.VALIDATE("No.", SalesLine."No.");
                            Schedule."Qty. Per" := 1;
                            Schedule.Quantity := SalesLine.Quantity;
                            Schedule.VALIDATE(Quantity);
                            Schedule."Unit of Measure Code" := SalesLine."Unit of Measure Code";
                            Schedule.VALIDATE("Unit of Measure Code");
                            Schedule."Location Code" := SalesLine."Location Code";
                            Schedule."Estimated Total Unit Price" := Schedule."Estimated Unit Price" * Quantity;
                            //salesLine.CALCFIELDS("Estimated Unit Cost");
                            IF Schedule.INSERT THEN;
                        UNTIL SalesLine.NEXT = 0;
                    COMMIT;
                    Schedule.RESET;
                    Schedule.SETRANGE("Document Type", Schedule."Document Type"::Order);
                    Schedule.SETRANGE("Document No.", "Document No.");
                    Schedule.SETRANGE("Document Line No.", "Line No.");
                    Schedule.FILTERGROUP(2);
                    PAGE.RUN(60125, Schedule);
                    Schedule.FILTERGROUP(0);
                END
        END ELSE
            IF Type = Type::"G/L Account" THEN BEGIN
                Schedule.RESET;
                Schedule.SETRANGE("Document Type", Schedule."Document Type"::Order);
                Schedule.SETRANGE("Document No.", "Document No.");
                Schedule.SETRANGE("Document Line No.", "Line No.");
                Schedule.FILTERGROUP(2);
                PAGE.RUN(60125, Schedule);
                Schedule.FILTERGROUP(0);
            END;
    end;

<<<<<<< HEAD

=======
    (7895)]
>>>>>>> 2cc8f1fea3184cdf038a92c8ef5fefc00ee958f1
    local procedure QuotevalueCalulcation() TTLAMT: Decimal;
    begin
        TTLAMT := 0;
        SalesLine.RESET;
        SalesLine.SETFILTER("Document No.", Rec."Document No.");
        IF SalesLine.FINDSET THEN
            REPEAT
            BEGIN
                TTLAMT += SalesLine."Amount To Customer";
            END
            UNTIL SalesLine.NEXT = 0;
        SalesHeader.RESET;
        SalesHeader.SETRANGE("No.", Rec."Document No.");
        IF SalesHeader.FINDFIRST THEN;
    end;

}

