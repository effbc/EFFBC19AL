report 50056 "Routing Line Movement"
{
    // version B2B 1.0,Eff02,Rev02

    ProcessingOnly = true;

    dataset
    {
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Control1102152001)
                {
                    ShowCaption = false;
                    field(MoveOption; MoveOption)
                    {
                        Caption = 'Select Movement Option';
                    }
                    field(Date; Date)
                    {
                        Caption = 'Date';
                    }
                    field("WorkcenterNo."; "WorkcenterNo.")
                    {
                        Caption = 'Workcenter No.';

                        trigger OnLookup(Text: Text): Boolean;
                        begin

                            IF Date = 0D THEN BEGIN
                                ProdOrderRoutingLine.SETRANGE(Type, ProdOrderRoutingLine.Type::"Work Center");
                                IF ProdOrderRoutingLine.FIND('-') THEN
                                    IF PAGE.RUNMODAL(0, ProdOrderRoutingLine) = ACTION::LookupOK THEN BEGIN
                                        //"Operation No." := ProdOrderRoutingLine."Operation No.";
                                        "WorkcenterNo." := ProdOrderRoutingLine."Work Center No.";
                                    END;
                            END ELSE BEGIN
                                IF Date <> 0D THEN BEGIN
                                    ProdOrderRoutingLine.SETCURRENTKEY(ProdOrderRoutingLine.Type,
                                                                        ProdOrderRoutingLine."No.",
                                                                        ProdOrderRoutingLine."Starting Date");
                                    ProdOrderRoutingLine.SETRANGE(Type, ProdOrderRoutingLine.Type::"Work Center");
                                    ProdOrderRoutingLine.SETRANGE("Starting Date", Date);

                                    IF ProdOrderRoutingLine.FIND('-') THEN
                                        IF PAGE.RUNMODAL(0, ProdOrderRoutingLine) = ACTION::LookupOK THEN BEGIN
                                            //"Operation No." := ProdOrderRoutingLine."Operation No.";
                                            "WorkcenterNo." := ProdOrderRoutingLine."Work Center No.";
                                        END;
                                END;
                            END;
                        end;
                    }
                    field("PorductionOrderNo."; "PorductionOrderNo.")
                    {
                        Caption = 'Prod. Order No.';

                        trigger OnLookup(Text: Text): Boolean;
                        begin

                            "Prod.Order".SETRANGE(Status, "Prod.Order".Status::Released);
                            IF PAGE.RUNMODAL(0, "Prod.Order") = ACTION::LookupOK THEN BEGIN
                                "PorductionOrderNo." := "Prod.Order"."No.";
                            END;
                        end;
                    }
                    field("Prod.OrderLineNo."; "Prod.OrderLineNo.")
                    {
                        Caption = 'Prod. Order Line No.';

                        trigger OnLookup(Text: Text): Boolean;
                        begin

                            IF "PorductionOrderNo." <> '' THEN BEGIN
                                "Prod.OrderLine".SETRANGE(Status, "Prod.Order".Status::Released);
                                "Prod.OrderLine".SETRANGE("Prod. Order No.", "PorductionOrderNo.");
                                IF PAGE.RUNMODAL(0, "Prod.OrderLine") = ACTION::LookupOK THEN BEGIN
                                    "Prod.OrderLineNo." := "Prod.OrderLine"."Line No.";
                                END;
                            END ELSE BEGIN
                                "Prod.OrderLine".SETRANGE(Status, "Prod.Order".Status::Released);
                                "Prod.OrderLine".SETRANGE("Starting Date", Date);
                                IF PAGE.RUNMODAL(0, "Prod.OrderLine") = ACTION::LookupOK THEN BEGIN
                                    "Prod.OrderLineNo." := "Prod.OrderLine"."Line No.";
                                END;
                            END;
                        end;
                    }
                    field("Operation No."; "Operation No.")
                    {
                        Caption = 'Operation No.';

                        trigger OnLookup(Text: Text): Boolean;
                        begin

                            /*
                            IF (Date = 0D) AND ("PorductionOrderNo." = '') AND ("Prod.OrderLineNo." = 0) THEN BEGIN
                              ProdOrderRoutingLine.SETRANGE(Type,ProdOrderRoutingLine.Type ::"Work Center");
                              ProdOrderRoutingLine.SETRANGE("Work Center No.","WorkcenterNo.");
                              IF ProdOrderRoutingLine.FIND('-') THEN
                                IF page.RUNMODAL(0,ProdOrderRoutingLine)  = ACTION::LookupOK THEN BEGIN
                                  "Operation No." := ProdOrderRoutingLine."Operation No.";
                                  "WorkcenterNo." := ProdOrderRoutingLine."Work Center No.";
                                END;
                            END ELSE
                            IF (Date <> 0D) AND ("PorductionOrderNo." <> '') AND ("Prod.OrderLineNo." = 0) THEN BEGIN
                              ProdOrderRoutingLine.SETRANGE("Starting Date",Date);
                              ProdOrderRoutingLine.SETRANGE(Type,ProdOrderRoutingLine.Type ::"Work Center");
                              ProdOrderRoutingLine.SETRANGE("Work Center No.","WorkcenterNo.");
                              ProdOrderRoutingLine.SETRANGE("Prod. Order No.","PorductionOrderNo.");
                              //ProdOrderRoutingLine.SETRANGE("Routing Reference No.","Prod.OrderLineNo.");
                              IF ProdOrderRoutingLine.FIND('-') THEN
                                IF page.RUNMODAL(0,ProdOrderRoutingLine)  = ACTION::LookupOK THEN BEGIN
                                  "Operation No." := ProdOrderRoutingLine."Operation No.";
                                  "WorkcenterNo." := ProdOrderRoutingLine."Work Center No.";
                                END;
                              END
                            ELSE IF (Date <> 0D) AND ("PorductionOrderNo." = '') AND ("Prod.OrderLineNo." = 0) THEN BEGIN
                              ProdOrderRoutingLine.SETRANGE("Starting Date",Date);
                              ProdOrderRoutingLine.SETRANGE(Type,ProdOrderRoutingLine.Type ::"Work Center");
                              ProdOrderRoutingLine.SETRANGE("Work Center No.","WorkcenterNo.");
                              IF ProdOrderRoutingLine.FIND('-') THEN
                                IF page.RUNMODAL(0,ProdOrderRoutingLine)  = ACTION::LookupOK THEN BEGIN
                                  "Operation No." := ProdOrderRoutingLine."Operation No.";
                                  "WorkcenterNo." := ProdOrderRoutingLine."Work Center No.";
                                END;
                            END;
                            */
                            CASE MoveOption OF
                                MoveOption::"Workcenter Wise":
                                    BEGIN
                                        ProdOrderRoutingLine.SETRANGE("Starting Date", Date);
                                        ProdOrderRoutingLine.SETRANGE(Type, ProdOrderRoutingLine.Type::"Work Center");
                                        ProdOrderRoutingLine.SETRANGE("Work Center No.", "WorkcenterNo.");
                                        IF ProdOrderRoutingLine.FIND('-') THEN
                                            IF PAGE.RUNMODAL(0, ProdOrderRoutingLine) = ACTION::LookupOK THEN BEGIN
                                                "Operation No." := ProdOrderRoutingLine."Operation No.";
                                                "WorkcenterNo." := ProdOrderRoutingLine."Work Center No.";
                                            END;
                                    END;
                                MoveOption::"Order Wise":
                                    BEGIN
                                        ProdOrderRoutingLine.SETRANGE("Starting Date", Date);
                                        ProdOrderRoutingLine.SETRANGE(Type, ProdOrderRoutingLine.Type::"Work Center");
                                        ProdOrderRoutingLine.SETRANGE("Work Center No.", "WorkcenterNo.");
                                        ProdOrderRoutingLine.SETRANGE("Prod. Order No.", "PorductionOrderNo.");
                                        IF ProdOrderRoutingLine.FIND('-') THEN
                                            IF PAGE.RUNMODAL(0, ProdOrderRoutingLine) = ACTION::LookupOK THEN BEGIN
                                                "Operation No." := ProdOrderRoutingLine."Operation No.";
                                                "WorkcenterNo." := ProdOrderRoutingLine."Work Center No.";
                                            END;
                                    END;
                                MoveOption::"Order Line Wise":
                                    BEGIN
                                        ProdOrderRoutingLine.SETRANGE("Starting Date", Date);
                                        ProdOrderRoutingLine.SETRANGE(Type, ProdOrderRoutingLine.Type::"Work Center");
                                        ProdOrderRoutingLine.SETRANGE("Work Center No.", "WorkcenterNo.");
                                        ProdOrderRoutingLine.SETRANGE("Prod. Order No.", "PorductionOrderNo.");
                                        ProdOrderRoutingLine.SETRANGE("Routing Reference No.", "Prod.OrderLineNo.");
                                        IF ProdOrderRoutingLine.FIND('-') THEN
                                            IF PAGE.RUNMODAL(0, ProdOrderRoutingLine) = ACTION::LookupOK THEN BEGIN
                                                "Operation No." := ProdOrderRoutingLine."Operation No.";
                                                "WorkcenterNo." := ProdOrderRoutingLine."Work Center No.";
                                            END;
                                    END;
                            END;

                        end;
                    }
                    field(Type; Type)
                    {
                        Caption = 'Type';
                    }
                    field("W/MNo."; "W/MNo.")
                    {
                        Caption = 'W/C or M/C No.';

                        trigger OnLookup(Text: Text): Boolean;
                        begin

                            IF Type = Type::"Machine Center" THEN BEGIN
                                IF PAGE.RUNMODAL(0, MachineCenter) = ACTION::LookupOK THEN BEGIN
                                    "W/MNo." := MachineCenter."No.";
                                END;
                            END ELSE
                                IF Type = Type::"Work Center" THEN BEGIN
                                    IF PAGE.RUNMODAL(0, WorkCenter) = ACTION::LookupOK THEN BEGIN
                                        "W/MNo." := WorkCenter."No.";
                                    END;
                                END;
                        end;
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport();
    begin
        IF Type = Type::" " THEN
            ERROR('You should select the type');
        IF "W/MNo." = '' THEN
            ERROR('You should select the No');
        IF "WorkcenterNo." = "W/MNo." THEN
            ERROR('Work Center No. and No. fields should not be same');

        CASE MoveOption OF
            MoveOption::"Workcenter Wise":
                BEGIN
                    // ProdOrderRoutingLine.SETCURRENTKEY(Status,"Prod. Order No.","Routing Reference No.");
                    ProdOrderRoutingLineRun.SETCURRENTKEY(ProdOrderRoutingLineRun.Status,
                                                          ProdOrderRoutingLineRun."Starting Date",
                                                          ProdOrderRoutingLineRun."Routing Reference No.",
                                                          ProdOrderRoutingLineRun."Operation No.");
                    ProdOrderRoutingLineRun.SETRANGE(Status, ProdOrderRoutingLineRun.Status::Released);
                    ProdOrderRoutingLineRun.SETRANGE("Starting Date", Date);
                    ProdOrderRoutingLineRun.SETRANGE("Operation No.", "Operation No.");
                    ProdOrderRoutingLineRun.SETRANGE(Type, ProdOrderRoutingLineRun.Type::"Work Center");
                    ProdOrderRoutingLineRun.SETRANGE("Work Center No.", "WorkcenterNo.");

                    /*  ProdOrderRoutingLineRun.SETRANGE(Type,ProdOrderRoutingLineRun.Type ::"Work Center");
                      ProdOrderRoutingLineRun.SETRANGE(Status,ProdOrderRoutingLineRun.Status :: Released);
                      ProdOrderRoutingLineRun.SETRANGE("Starting Date",Date);
                      ProdOrderRoutingLineRun.SETRANGE("Work Center No.","WorkcenterNo.");
                      ProdOrderRoutingLineRun.SETRANGE("Operation No.","Operation No."); //(shilpa)  b2b 12-jun-06   */

                    //(shilpa)  b2b 12-jun-06
                    ProdOrderRoutingLineRun.FILTERGROUP(2);

                    IF PAGE.RUNMODAL(60128, ProdOrderRoutingLineRun) = ACTION::LookupOK THEN BEGIN
                        //ProdOrderRoutingLineRun.RESET; //shilpa
                        ProdOrderRoutingLineRun.SETRANGE(Move, TRUE);
                        IF ProdOrderRoutingLineRun.FIND('-') THEN
                            REPEAT
                                //ProdOrderRoutingLineRun.Type := Type;
                                IF Type = Type::"Machine Center" THEN
                                    ProdOrderRoutingLineRun.Type := ProdOrderRoutingLineRun.Type::"Machine Center";
                                IF Type = Type::"Work Center" THEN
                                    ProdOrderRoutingLineRun.Type := ProdOrderRoutingLineRun.Type::"Work Center";
                                ProdOrderRoutingLineRun."No." := "W/MNo.";
                                ProdOrderRoutingLineRun.Move := FALSE;
                                ProdOrderRoutingLineRun.VALIDATE("No.");
                                ProdOrderRoutingLineRun.MODIFY;
                            UNTIL ProdOrderRoutingLineRun.NEXT = 0;
                    END;
                    ProdOrderRoutingLineRun.FILTERGROUP(0);
                END;
            MoveOption::"Order Wise":
                BEGIN
                    ProdOrderRoutingLine.SETCURRENTKEY(Status, "Prod. Order No.", "Routing Reference No.");
                    ProdOrderRoutingLineRun.SETRANGE(Type, ProdOrderRoutingLineRun.Type::"Work Center");
                    ProdOrderRoutingLineRun.SETRANGE(Status, ProdOrderRoutingLineRun.Status::Released);
                    ProdOrderRoutingLineRun.SETRANGE("Starting Date", Date);
                    ProdOrderRoutingLineRun.SETRANGE("Work Center No.", "WorkcenterNo.");
                    ProdOrderRoutingLineRun.SETRANGE("Prod. Order No.", "PorductionOrderNo.");
                    ProdOrderRoutingLineRun.SETRANGE("Operation No.", "Operation No.");  //b2b 12-jun-06
                    ProdOrderRoutingLineRun.FILTERGROUP(2);
                    IF PAGE.RUNMODAL(60128, ProdOrderRoutingLineRun) = ACTION::LookupOK THEN BEGIN
                        //ProdOrderRoutingLineRun.RESET;
                        ProdOrderRoutingLineRun.SETRANGE(Move, TRUE);
                        IF ProdOrderRoutingLineRun.FIND('-') THEN
                            REPEAT
                                //ProdOrderRoutingLineRun.Type := Type;
                                IF Type = Type::"Machine Center" THEN
                                    ProdOrderRoutingLineRun.Type := ProdOrderRoutingLineRun.Type::"Machine Center";
                                IF Type = Type::"Work Center" THEN
                                    ProdOrderRoutingLineRun.Type := ProdOrderRoutingLineRun.Type::"Work Center";
                                ProdOrderRoutingLineRun."No." := "W/MNo.";
                                ProdOrderRoutingLineRun.Move := FALSE;
                                ProdOrderRoutingLineRun.VALIDATE("No.", "W/MNo.");
                                ProdOrderRoutingLineRun.MODIFY;
                            UNTIL ProdOrderRoutingLineRun.NEXT = 0;
                    END;
                    ProdOrderRoutingLineRun.FILTERGROUP(0);
                END;
            MoveOption::"Order Line Wise":
                BEGIN
                    ProdOrderRoutingLine.SETCURRENTKEY(Status, "Prod. Order No.", "Routing Reference No.");
                    ProdOrderRoutingLineRun.SETRANGE(Status, ProdOrderRoutingLineRun.Status::Released);
                    ProdOrderRoutingLineRun.SETRANGE("Prod. Order No.", "PorductionOrderNo.");
                    ProdOrderRoutingLineRun.SETRANGE("Routing Reference No.", "Prod.OrderLineNo.");

                    ProdOrderRoutingLineRun.SETRANGE(Type, ProdOrderRoutingLineRun.Type::"Work Center");
                    ProdOrderRoutingLineRun.SETRANGE("Starting Date", Date);
                    ProdOrderRoutingLineRun.SETRANGE("Work Center No.", "WorkcenterNo.");
                    ProdOrderRoutingLineRun.FILTERGROUP(2);
                    IF PAGE.RUNMODAL(60128, ProdOrderRoutingLineRun) = ACTION::LookupOK THEN BEGIN
                        //ProdOrderRoutingLineRun.RESET;
                        ProdOrderRoutingLineRun.SETRANGE(Move, TRUE);
                        IF ProdOrderRoutingLineRun.FIND('-') THEN
                            REPEAT
                                IF Type = Type::"Machine Center" THEN
                                    ProdOrderRoutingLineRun.Type := ProdOrderRoutingLineRun.Type::"Machine Center";
                                IF Type = Type::"Work Center" THEN
                                    ProdOrderRoutingLineRun.Type := ProdOrderRoutingLineRun.Type::"Work Center";
                                ProdOrderRoutingLineRun."No." := "W/MNo.";
                                ProdOrderRoutingLineRun.Move := FALSE;
                                ProdOrderRoutingLineRun.VALIDATE("No.");
                                ProdOrderRoutingLineRun.MODIFY;
                            UNTIL ProdOrderRoutingLineRun.NEXT = 0;
                    END;
                    ProdOrderRoutingLineRun.FILTERGROUP(0);
                END;
            MoveOption::"Workcenter Line Wise":
                BEGIN
                    // ProdOrderRoutingLineRun.SETCURRENTKEY(Status,"Prod. Order No.","Routing Reference No.","Starting Date");
                    ProdOrderRoutingLineRun.SETCURRENTKEY(ProdOrderRoutingLineRun.Status,
                                                          ProdOrderRoutingLineRun."Starting Date",
                                                          ProdOrderRoutingLineRun."Routing Reference No.",
                                                          ProdOrderRoutingLineRun."Operation No.");
                    ProdOrderRoutingLineRun.SETRANGE(Status, ProdOrderRoutingLineRun.Status::Released);
                    ProdOrderRoutingLineRun.SETRANGE("Starting Date", Date);


                    //  ProdOrderRoutingLineRun.SETRANGE(ProdOrderRoutingLineRun."Prod. Order No.","PorductionOrderNo.");
                    ProdOrderRoutingLineRun.SETRANGE("Routing Reference No.", "Prod.OrderLineNo.");
                    ProdOrderRoutingLineRun.SETRANGE(Type, ProdOrderRoutingLineRun.Type::"Work Center");
                    ProdOrderRoutingLineRun.SETRANGE("Work Center No.", "WorkcenterNo.");

                    ProdOrderRoutingLineRun.FILTERGROUP(2);
                    IF PAGE.RUNMODAL(60128, ProdOrderRoutingLineRun) = ACTION::LookupOK THEN BEGIN
                        //ProdOrderRoutingLineRun.RESET;
                        ProdOrderRoutingLineRun.SETRANGE(Move, TRUE);
                        ProdOrderRoutingLineRun.FILTERGROUP(2);
                        ProdOrderRoutingLineRun.SETCURRENTKEY(Status, "Prod. Order No.", "Routing Reference No.", "Starting Date");

                        IF ProdOrderRoutingLineRun.FIND('-') THEN BEGIN
                            REPEAT
                                IF Type = Type::"Machine Center" THEN
                                    ProdOrderRoutingLineRun.Type := ProdOrderRoutingLineRun.Type::"Machine Center";
                                IF Type = Type::"Work Center" THEN
                                    ProdOrderRoutingLineRun.Type := ProdOrderRoutingLineRun.Type::"Work Center";
                                //ProdOrderRoutingLineRun."No." := "No.";

                                ProdOrderRoutingLineRun.Move := FALSE;
                                ProdOrderRoutingLineRun.VALIDATE("No.", "W/MNo.");
                                ProdOrderRoutingLineRun.MODIFY;
                            UNTIL ProdOrderRoutingLineRun.NEXT = 0;
                        END;
                        ProdOrderRoutingLineRun.FILTERGROUP(0);
                    END;
                END;
        END;
        /*
        MachineCenter.SETRANGE("Work Center No.","Work Center No.");
        IF Page.RUNMODAL(Page::"Machine Center List",MachineCenter) = ACTION::LookupOK THEN BEGIN
          "No." := MachineCenter."No.";
          Type := Type::"Machine Center";
          VALIDATE("No.",MachineCenter."No.");
        END;
        
        CurrForm.UPDATE;
        */

    end;

    var
        ProdOrderRoutingLine: Record "Prod. Order Routing Line";
        Date: Date;
        "WorkcenterNo.": Code[20];
        "Operation No.": Code[20];
        "PorductionOrderNo.": Code[50];
        "Prod.OrderLineNo.": Integer;
        Type: Option " ","Machine Center","Work Center";
        "W/MNo.": Code[20];
        ProdOrderRoutingLineRun: Record "Prod. Order Routing Line";
        MachineCenter: Record "Machine Center";
        WorkCenter: Record "Work Center";
        "Prod.Order": Record "Production Order";
        "Prod.OrderLine": Record "Prod. Order Line";
        MoveOption: Option " ","Workcenter Wise","Order Wise","Order Line Wise","Workcenter Line Wise";
        i: Integer;
}

