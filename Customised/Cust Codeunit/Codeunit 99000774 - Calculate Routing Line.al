codeunit 99000774 "Calculate Routing Line"
{
    // version NAVW19.00.00.48822

    Permissions = TableData "Prod. Order Line" = r,
                  TableData "Work Center" = r,
                  TableData "Calendar Entry" = r,
                  TableData "Machine Center" = r,
                  TableData "Manufacturing Setup" = r,
                  TableData "Production Order" = r,
                  TableData "Prod. Order Routing Line" = im,
                  TableData "Prod. Order Capacity Need" = imd,
                  TableData "Capacity Constrained Resource" = r;

    trigger OnRun();
    begin
    end;

    var
        Text000: TextConst ENU = 'Error when calculating %1. Calendar is not available %2 %3 for %4 %5.', ENN = 'Error when calculating %1. Calendar is not available %2 %3 for %4 %5.';
        Text001: TextConst ENU = 'backward', ENN = 'backward';
        Text002: TextConst ENU = 'before', ENN = 'before';
        Text003: TextConst ENU = 'forward', ENN = 'forward';
        Text004: TextConst ENU = 'after', ENN = 'after';
        Text005: TextConst ENU = 'The sum of setup, move and wait time exceeds the available time in the period.', ENN = 'The sum of setup, move and wait time exceeds the available time in the period.';
        Text006: TextConst ENU = 'fixed schedule', ENN = 'fixed schedule';
        Text007: TextConst ENU = 'Starting time must be before ending time.', ENN = 'Starting time must be before ending time.';
        MfgSetup: Record "Manufacturing Setup";
        Workcenter: Record "Work Center";
        Workcenter2: Record "Work Center";
        MachineCenter: Record "Machine Center";
        ProdOrder: Record "Production Order";
        ProdOrderLine: Record "Prod. Order Line";
        ProdOrderRoutingLine: Record "Prod. Order Routing Line";
        ProdOrderCapNeed: Record "Prod. Order Capacity Need";
        ProdOrderCapNeed2: Record "Prod. Order Capacity Need";
        CalendarEntry: Record "Calendar Entry";
        CalendarMgt: Codeunit CalendarManagement;
        NextCapNeedLineNo: Integer;
        ProdStartingTime: Time;
        ProdEndingTime: Time;
        ProdStartingDate: Date;
        ProdEndingDate: Date;
        MaxLotSize: Decimal;
        TotalLotSize: Decimal;
        ProdOrderQty: Decimal;
        TotalScrap: Decimal;
        LotSize: Decimal;
        RemainNeedQty: Decimal;
        ConCurrCap: Decimal;
        RunStartingDateTime: DateTime;
        RunEndingDateTime: DateTime;
        FirstInBatch: Boolean;
        FirstEntry: Boolean;
        UpdateDates: Boolean;
        WaitTimeOnly: Boolean;
        CurrentWorkCenterNo: Code[20];
        CurrentTimeFactor: Decimal;
        CurrentRounding: Decimal;

    (52856)]
    local procedure TestForError(DirectionTxt: Text[30]; BefAfterTxt: Text[30]; Date: Date);
    begin
        IF RemainNeedQty <> 0 THEN
            ERROR(
              Text000,
              DirectionTxt,
              BefAfterTxt,
              Date,
              ProdOrderRoutingLine.Type,
              ProdOrderRoutingLine."No.");
    end;

    (52866)]
    local procedure CreateCapNeed(NeedDate: Date; StartingTime: Time; EndingTime: Time; NeedQty: Decimal; TimeType: Option "Setup Time","Run Time"; Direction: Option Forward,Backward);
    begin
        ProdOrderCapNeed.INIT;
        ProdOrderCapNeed.Status := ProdOrder.Status;
        ProdOrderCapNeed."Prod. Order No." := ProdOrder."No.";
        ProdOrderCapNeed."Routing No." := ProdOrderRoutingLine."Routing No.";
        ProdOrderCapNeed."Routing Reference No." := ProdOrderRoutingLine."Routing Reference No.";
        ProdOrderCapNeed."Line No." := NextCapNeedLineNo;
        ProdOrderCapNeed.Type := ProdOrderRoutingLine.Type;
        ProdOrderCapNeed."No." := ProdOrderRoutingLine."No.";
        ProdOrderCapNeed."Work Center No." := ProdOrderRoutingLine."Work Center No.";
        ProdOrderCapNeed."Operation No." := ProdOrderRoutingLine."Operation No.";
        ProdOrderCapNeed."Work Center Group Code" := ProdOrderRoutingLine."Work Center Group Code";
        ProdOrderCapNeed.Date := NeedDate;
        ProdOrderCapNeed."Starting Time" := StartingTime;
        ProdOrderCapNeed."Ending Time" := EndingTime;
        ProdOrderCapNeed."Needed Time" := NeedQty;
        ProdOrderCapNeed."Needed Time (ms)" := NeedQty * CalendarMgt.TimeFactor(Workcenter."Unit of Measure Code");
        ProdOrderCapNeed."Concurrent Capacities" := ConCurrCap;
        ProdOrderCapNeed.Efficiency := CalendarEntry.Efficiency;
        ProdOrderCapNeed."Requested Only" := FALSE;
        ProdOrderCapNeed.Active := TRUE;
        IF ProdOrder.Status <> ProdOrder.Status::Simulated THEN BEGIN
            ProdOrderCapNeed."Allocated Time" := NeedQty;
            ProdOrderRoutingLine."Expected Capacity Need" :=
              ProdOrderRoutingLine."Expected Capacity Need" + ProdOrderCapNeed."Needed Time (ms)";
        END;

        ProdOrderCapNeed."Time Type" := TimeType;
        IF TimeType = TimeType::"Run Time" THEN
            ProdOrderCapNeed."Lot Size" := LotSize;

        IF TimeType = TimeType::"Run Time" THEN
            IF RemainNeedQty = 0 THEN BEGIN
                IF FirstInBatch THEN
                    ProdOrderCapNeed."Send-Ahead Type" := ProdOrderCapNeed."Send-Ahead Type"::Both
                ELSE
                    CASE Direction OF
                        Direction::Forward:
                            ProdOrderCapNeed."Send-Ahead Type" := ProdOrderCapNeed."Send-Ahead Type"::Output;
                        Direction::Backward:
                            ProdOrderCapNeed."Send-Ahead Type" := ProdOrderCapNeed."Send-Ahead Type"::Input;
                    END;
            END ELSE
                IF FirstInBatch THEN
                    CASE Direction OF
                        Direction::Forward:
                            ProdOrderCapNeed."Send-Ahead Type" := ProdOrderCapNeed."Send-Ahead Type"::Input;
                        Direction::Backward:
                            ProdOrderCapNeed."Send-Ahead Type" := ProdOrderCapNeed."Send-Ahead Type"::Output;
                    END;

        ProdOrderCapNeed.UpdateDatetime;

        ProdOrderCapNeed.INSERT;

        NextCapNeedLineNo := NextCapNeedLineNo + 1;
    end;

    (52923)]
    local procedure CreateLoadBack(TimeType: Option "Setup Time","Run Time","Wait Time","Move Time","Queue Time"; Write: Boolean);
    var
        OldCalendarEntry: Record "Calendar Entry";
        AvQtyBase: Decimal;
        RelevantEfficiency: Decimal;
        xConCurrCap: Decimal;
        RemainNeedQtyBase: Decimal;
        StartingTime: Time;
        StopLoop: Boolean;
    begin
        xConCurrCap := 1;
        IF (RemainNeedQty = 0) AND ((NOT FirstEntry) OR (NOT Write) OR WaitTimeOnly) THEN
            EXIT;
        IF CalendarEntry.FIND('+') THEN BEGIN
            IF (TimeType = TimeType::"Wait Time") AND (CalendarEntry.Date < ProdEndingDate) THEN BEGIN
                CalendarEntry.Date := ProdEndingDate;
                CreateCalendarEntry(CalendarEntry);
            END;
            GetCurrentWorkCenterTimeFactorAndRounding(CalendarEntry."Work Center No.");
            RemainNeedQtyBase := ROUND(RemainNeedQty * CurrentTimeFactor, CurrentRounding);
            REPEAT
                OldCalendarEntry := CalendarEntry;
                ConCurrCap := ProdOrderRoutingLine."Concurrent Capacities";
                IF (ConCurrCap = 0) OR (CalendarEntry.Capacity < ConCurrCap) THEN
                    ConCurrCap := CalendarEntry.Capacity;
                IF TimeType <> TimeType::"Run Time" THEN
                    RemainNeedQtyBase := ROUND(RemainNeedQtyBase * ConCurrCap / xConCurrCap, CurrentRounding);
                xConCurrCap := ConCurrCap;
                AvQtyBase :=
                  CalcAvailQtyBase(
                    CalendarEntry, ProdEndingDate, ProdEndingTime, TimeType, ConCurrCap, FALSE, CurrentTimeFactor, CurrentRounding);

                IF AvQtyBase > RemainNeedQtyBase THEN
                    AvQtyBase := RemainNeedQtyBase;
                IF TimeType IN [TimeType::"Setup Time", TimeType::"Run Time"] THEN
                    RelevantEfficiency := CalendarEntry.Efficiency
                ELSE
                    RelevantEfficiency := 100;
                StartingTime :=
                  CalendarMgt.CalcTimeSubtract(
                    CalendarEntry."Ending Time",
                    ROUND(AvQtyBase * 100 / RelevantEfficiency / ConCurrCap, 1, '>'));
                RemainNeedQtyBase := RemainNeedQtyBase - AvQtyBase;
                IF Write THEN BEGIN
                    RemainNeedQty := ROUND(RemainNeedQtyBase / CurrentTimeFactor, CurrentRounding);
                    CreateCapNeed(
                      CalendarEntry.Date, StartingTime, CalendarEntry."Ending Time",
                      ROUND(AvQtyBase / CurrentTimeFactor, CurrentRounding), TimeType, 1);
                    FirstInBatch := FALSE;
                    FirstEntry := FALSE;
                END;
                IF UpdateDates AND
                   ((CalendarEntry."Capacity (Effective)" <> 0) OR (TimeType = TimeType::"Wait Time"))
                THEN BEGIN
                    ProdOrderRoutingLine."Ending Time" := CalendarEntry."Ending Time";
                    ProdOrderRoutingLine."Ending Date" := CalendarEntry.Date;
                    UpdateDates := FALSE;
                END;
                ProdEndingTime := StartingTime;
                ProdEndingDate := CalendarEntry.Date;
                ProdOrderRoutingLine."Starting Time" := StartingTime;
                ProdOrderRoutingLine."Starting Date" := CalendarEntry.Date;

                IF (RemainNeedQtyBase = 0) AND ((NOT FirstEntry) OR (NOT Write)) THEN
                    StopLoop := TRUE
                ELSE
                    IF TimeType = TimeType::"Wait Time" THEN BEGIN
                        StopLoop := FALSE;
                        ReturnNextCalendarEntry(CalendarEntry, OldCalendarEntry, 0);
                    END ELSE BEGIN
                        CalendarEntry := OldCalendarEntry;
                        StopLoop := CalendarEntry.NEXT(-1) = 0;
                    END;
            UNTIL StopLoop;
            RemainNeedQty := ROUND(RemainNeedQtyBase / CurrentTimeFactor, CurrentRounding);
        END;
    end;

    (52991)]
    local procedure CreateLoadForward(TimeType: Option "Setup Time","Run Time","Wait Time","Move Time","Queue Time"; Write: Boolean; LoadFactor: Decimal);
    var
        OldCalendarEntry: Record "Calendar Entry";
        AvQtyBase: Decimal;
        RelevantEfficiency: Decimal;
        xConCurrCap: Decimal;
        RemainNeedQtyBase: Decimal;
        EndingTime: Time;
        StopLoop: Boolean;
    begin
        xConCurrCap := 1;
        IF (RemainNeedQty = 0) AND ((NOT FirstEntry) OR (NOT Write) OR WaitTimeOnly) THEN
            EXIT;
        IF CalendarEntry.FIND('-') THEN BEGIN
            IF (TimeType = TimeType::"Wait Time") AND (CalendarEntry.Date > ProdStartingDate) THEN BEGIN
                CalendarEntry.Date := ProdStartingDate;
                CreateCalendarEntry(CalendarEntry);
            END;
            IF CalendarEntry."Capacity (Effective)" = 0 THEN BEGIN
                CalendarEntry."Starting Time" := ProdStartingTime;
                CalendarEntry.Date := ProdStartingDate;
            END;
            IF CalendarEntry."Work Center No." = Workcenter."No." THEN
                GetCurrentWorkCenterTimeFactorAndRounding(Workcenter."No.")
            ELSE
                GetCurrentWorkCenterTimeFactorAndRounding(CalendarEntry."Work Center No.");
            RemainNeedQtyBase := ROUND(RemainNeedQty * CurrentTimeFactor, CurrentRounding);
            REPEAT
                OldCalendarEntry := CalendarEntry;
                ConCurrCap := ProdOrderRoutingLine."Concurrent Capacities";
                IF (ConCurrCap = 0) OR (CalendarEntry.Capacity < ConCurrCap) THEN
                    ConCurrCap := CalendarEntry.Capacity;
                IF TimeType <> TimeType::"Run Time" THEN
                    RemainNeedQtyBase := ROUND(RemainNeedQtyBase * ConCurrCap / xConCurrCap, CurrentRounding);
                xConCurrCap := ConCurrCap;
                AvQtyBase :=
                  CalcAvailQtyBase(
                    CalendarEntry, ProdStartingDate, ProdStartingTime, TimeType, ConCurrCap, TRUE, CurrentTimeFactor, CurrentRounding);

                IF AvQtyBase * LoadFactor > RemainNeedQtyBase THEN
                    AvQtyBase := ROUND(RemainNeedQtyBase / LoadFactor, CurrentRounding);

                IF TimeType IN [TimeType::"Setup Time", TimeType::"Run Time"] THEN
                    RelevantEfficiency := CalendarEntry.Efficiency
                ELSE
                    RelevantEfficiency := 100;
                EndingTime :=
                  CalendarEntry."Starting Time" + ROUND(AvQtyBase * 100 / RelevantEfficiency / ConCurrCap, 1, '>');

                IF AvQtyBase * LoadFactor >= 0 THEN
                    RemainNeedQtyBase := RemainNeedQtyBase - AvQtyBase * LoadFactor;
                IF Write THEN BEGIN
                    RemainNeedQty := ROUND(RemainNeedQtyBase / CurrentTimeFactor, CurrentRounding);
                    CreateCapNeed(
                      CalendarEntry.Date, CalendarEntry."Starting Time", EndingTime,
                      ROUND(AvQtyBase * LoadFactor / CurrentTimeFactor, CurrentRounding), TimeType, 0);
                    FirstInBatch := FALSE;
                    FirstEntry := FALSE;
                END;
                IF UpdateDates AND
                   ((CalendarEntry."Capacity (Effective)" <> 0) OR (TimeType = TimeType::"Wait Time"))
                THEN BEGIN
                    ProdOrderRoutingLine."Starting Time" := CalendarEntry."Starting Time";
                    ProdOrderRoutingLine."Starting Date" := CalendarEntry.Date;
                    UpdateDates := FALSE;
                END;
                IF (EndingTime = 000000T) AND (AvQtyBase <> 0) THEN
                    // Ending Time reached 24:00:00 so we need to move date as well
                    CalendarEntry.Date := CalendarEntry.Date + 1;
                ProdStartingTime := EndingTime;
                ProdStartingDate := CalendarEntry.Date;
                ProdOrderRoutingLine."Ending Time" := EndingTime;
                ProdOrderRoutingLine."Ending Date" := CalendarEntry.Date;

                IF ProdOrderRoutingLine."Schedule Manually" THEN BEGIN
                    IF TimeType = TimeType::"Setup Time" THEN
                        RunStartingDateTime := CREATEDATETIME(ProdStartingDate, ProdStartingTime);
                    IF RemainNeedQtyBase < 0 THEN
                        RemainNeedQtyBase := 0;
                END;

                IF (RemainNeedQtyBase = 0) AND ((NOT FirstEntry) OR (NOT Write)) AND (AvQtyBase * LoadFactor >= 0) THEN
                    StopLoop := TRUE
                ELSE
                    IF TimeType = TimeType::"Wait Time" THEN BEGIN
                        StopLoop := FALSE;
                        ReturnNextCalendarEntry(CalendarEntry, OldCalendarEntry, 1);
                    END ELSE BEGIN
                        CalendarEntry := OldCalendarEntry;
                        StopLoop := CalendarEntry.NEXT = 0;
                    END;
            UNTIL StopLoop;
            RemainNeedQty := ROUND(RemainNeedQtyBase / CurrentTimeFactor, CurrentRounding);
        END;
    end;

    (53077)]
    local procedure AvailableCapacity(CapType: Option "Work Center","Machine Center"; CapNo: Code[20]; StartingDateTime: DateTime; EndingDateTime: DateTime) AvQty: Decimal;
    var
        CalendarEntry2: Record "Calendar Entry";
        ConCurrCapacity: Decimal;
        Overlap: Decimal;
        TotalDuration: Decimal;
    begin
        CalendarEntry2.RESET;
        CalendarEntry2.SETCURRENTKEY("Capacity Type", "No.", "Starting Date-Time", "Ending Date-Time");
        CalendarEntry2.SETRANGE("Capacity Type", CapType);
        CalendarEntry2.SETRANGE("No.", CapNo);
        CalendarEntry2.SETFILTER("Starting Date-Time", '<=%1', EndingDateTime);
        CalendarEntry2.SETFILTER("Ending Date-Time", '>=%1', StartingDateTime);

        IF CalendarEntry2.FIND('-') THEN
            REPEAT
                ConCurrCapacity := ProdOrderRoutingLine."Concurrent Capacities";
                IF (ConCurrCapacity = 0) OR (CalendarEntry2.Capacity < ConCurrCapacity) THEN
                    ConCurrCapacity := CalendarEntry2.Capacity;

                Overlap := 0;
                IF StartingDateTime > CalendarEntry2."Starting Date-Time" THEN
                    Overlap := CalcDuration(CalendarEntry2."Starting Date-Time", StartingDateTime);
                IF EndingDateTime < CalendarEntry2."Ending Date-Time" THEN
                    Overlap := Overlap + CalcDuration(EndingDateTime, CalendarEntry2."Ending Date-Time");

                TotalDuration := CalcDuration(CalendarEntry2."Starting Date-Time", CalendarEntry2."Ending Date-Time");

                AvQty := AvQty +
                  ROUND(
                    ((TotalDuration - Overlap) / TotalDuration) *
                    CalendarEntry2."Capacity (Effective)" / CalendarEntry2.Capacity * ConCurrCapacity,
                    Workcenter."Calendar Rounding Precision");
            UNTIL CalendarEntry2.NEXT = 0;
        EXIT(AvQty);
    end;

    (53107)]
    local procedure LoadCapBack(CapType: Option "Work Center","Machine Center"; CapNo: Code[20]; TimeType: Option "Setup Time","Run Time","Wait Time","Move Time","Queue Time"; Write: Boolean);
    begin
        ProdOrderRoutingLine."Starting Date" := ProdEndingDate;
        ProdOrderRoutingLine."Starting Time" := ProdEndingTime;

        CalendarEntry.RESET;
        CalendarEntry.SETCURRENTKEY("Capacity Type", "No.", "Ending Date-Time", "Starting Date-Time");
        CalendarEntry.SETRANGE("Capacity Type", CapType);
        CalendarEntry.SETRANGE("No.", CapNo);
        CalendarEntry.SETRANGE("Ending Date-Time", 0DT, CREATEDATETIME(ProdEndingDate + 1, ProdEndingTime));
        CalendarEntry.SETRANGE("Starting Date-Time", 0DT, CREATEDATETIME(ProdEndingDate, ProdEndingTime));

        CreateLoadBack(TimeType, Write);

        IF RemainNeedQty = 0 THEN
            EXIT;

        TestForError(Text001, Text002, ProdOrderRoutingLine."Starting Date");
    end;

    (53125)]
    local procedure LoadCapForward(CapType: Option "Work Center","Machine Center"; CapNo: Code[20]; TimeType: Option "Setup Time","Run Time","Wait Time","Move Time","Queue Time"; Write: Boolean);
    var
        TotalAvailCapacity: Decimal;
        LoadFactor: Decimal;
    begin
        ProdOrderRoutingLine."Ending Date" := ProdStartingDate;
        ProdOrderRoutingLine."Ending Time" := ProdStartingTime;

        CalendarEntry.RESET;
        CalendarEntry.SETCURRENTKEY("Capacity Type", "No.", "Starting Date-Time", "Ending Date-Time");
        CalendarEntry.SETRANGE("Capacity Type", CapType);
        CalendarEntry.SETRANGE("No.", CapNo);
        CalendarEntry.SETFILTER("Starting Date-Time", '>=%1', CREATEDATETIME(ProdStartingDate - 1, ProdStartingTime));
        IF TimeType = TimeType::"Wait Time" THEN
            CalendarEntry.SETFILTER("Ending Date-Time", '>=%1', CREATEDATETIME(ProdStartingDate, 000000T))
        ELSE
            CalendarEntry.SETFILTER("Ending Date-Time", '>=%1', CREATEDATETIME(ProdStartingDate, ProdStartingTime));

        IF ProdOrderRoutingLine."Schedule Manually" AND (TimeType = TimeType::"Run Time") THEN BEGIN
            IF (RunEndingDateTime < RunStartingDateTime) OR
               ((RunEndingDateTime = RunStartingDateTime) AND
                (ProdOrderRoutingLine."Run Time" <> 0) AND
                (ProdOrderRoutingLine."Input Quantity" <> 0))
            THEN
                ERROR(Text005);
            TotalAvailCapacity :=
              AvailableCapacity(CapType, CapNo, RunStartingDateTime, RunEndingDateTime);
            IF TotalAvailCapacity = 0 THEN BEGIN
                TestForError(Text006, Text002, DT2DATE(RunEndingDateTime));
                LoadFactor := 0;
            END ELSE
                LoadFactor := ROUND(RemainNeedQty / TotalAvailCapacity, Workcenter."Calendar Rounding Precision", '>');
        END ELSE
            LoadFactor := 1;

        CreateLoadForward(TimeType, Write, LoadFactor);

        IF RemainNeedQty = 0 THEN
            EXIT;

        //TestForError(Text003,Text004,ProdOrderRoutingLine."Ending Date");
    end;

    (53163)]
    local procedure CalcMoveAndWaitBack();
    begin
        UpdateDates := TRUE;

        RemainNeedQty :=
          ROUND(
            ProdOrderRoutingLine."Move Time" *
            CalendarMgt.TimeFactor(ProdOrderRoutingLine."Move Time Unit of Meas. Code") /
            CalendarMgt.TimeFactor(Workcenter."Unit of Measure Code"),
            Workcenter."Calendar Rounding Precision");

        LoadCapBack(ProdOrderRoutingLine.Type, ProdOrderRoutingLine."No.", 3, FALSE);
        RemainNeedQty :=
          ROUND(
            ProdOrderRoutingLine."Wait Time" *
            CalendarMgt.TimeFactor(ProdOrderRoutingLine."Wait Time Unit of Meas. Code") /
            CalendarMgt.TimeFactor(Workcenter."Unit of Measure Code"),
            Workcenter."Calendar Rounding Precision");
        LoadCapBack(ProdOrderRoutingLine.Type, ProdOrderRoutingLine."No.", 2, FALSE);
    end;

    (53182)]
    local procedure GetSendAheadStartingTime(ProdOrderRoutingLine2: Record "Prod. Order Routing Line"; FirstLine: Boolean; var SendAheadLotSize: Decimal; var DeltaTotal: BigInteger): Boolean;
    var
        ProdOrderCapNeed3: Record "Prod. Order Capacity Need";
        ExpectedTime: Decimal;
        ResidualLotSize: Decimal;
        PrevEndingDateTime: DateTime;
    begin
        ProdStartingDate := ProdOrderRoutingLine2."Starting Date";
        ProdStartingTime := ProdOrderRoutingLine2."Starting Time";
        SendAheadLotSize := MaxLotSize;
        IF TotalLotSize = MaxLotSize THEN
            EXIT(TRUE);

        WITH ProdOrderRoutingLine2 DO BEGIN
            IF (ProdOrderRoutingLine."Send-Ahead Quantity" = 0) OR
               (ProdOrderRoutingLine."Send-Ahead Quantity" >= MaxLotSize)
            THEN BEGIN
                TotalLotSize := SendAheadLotSize;
                EXIT(FALSE);
            END;
            SendAheadLotSize := ProdOrderRoutingLine."Send-Ahead Quantity";
            IF MaxLotSize < (TotalLotSize + SendAheadLotSize) THEN BEGIN
                SendAheadLotSize := MaxLotSize - TotalLotSize;
                TotalLotSize := MaxLotSize;
            END ELSE BEGIN
                IF TotalLotSize = 0 THEN BEGIN
                    ResidualLotSize := MaxLotSize - SendAheadLotSize * ROUND(MaxLotSize / SendAheadLotSize, 1, '<');
                    IF ResidualLotSize > 0 THEN
                        SendAheadLotSize := ResidualLotSize;
                END;
                TotalLotSize := TotalLotSize + SendAheadLotSize;
            END;
            Workcenter2.GET("Work Center No.");
            IF "Lot Size" = 0 THEN
                "Lot Size" := 1;
            ExpectedTime :=
              ROUND(
                "Run Time" * SendAheadLotSize / "Lot Size" *
                CalendarMgt.TimeFactor("Run Time Unit of Meas. Code") /
                CalendarMgt.TimeFactor(Workcenter2."Unit of Measure Code"),
                Workcenter2."Calendar Rounding Precision");
            IF FirstLine THEN BEGIN
                ProdOrderCapNeed2.RESET;
                ProdOrderCapNeed2.SETCURRENTKEY(Status, "Prod. Order No.", "Routing Reference No.", "Operation No.", Date, "Starting Time");
                ProdOrderCapNeed2.SETRANGE(Status, Status);
                ProdOrderCapNeed2.SETRANGE("Prod. Order No.", "Prod. Order No.");
                ProdOrderCapNeed2.SETRANGE("Requested Only", FALSE);
                ProdOrderCapNeed2.SETRANGE("Routing No.", "Routing No.");
                ProdOrderCapNeed2.SETRANGE("Routing Reference No.", "Routing Reference No.");
                ProdOrderCapNeed2.SETRANGE("Operation No.", "Operation No.");
                IF NOT ProdOrderCapNeed2.FIND('+') THEN BEGIN
                    ProdStartingDate := "Ending Date";
                    ProdStartingTime := "Ending Time";
                    EXIT(FALSE);
                END;
            END;

            PrevEndingDateTime := CREATEDATETIME(ProdOrderCapNeed2.Date, ProdOrderCapNeed2."Ending Time");

            REPEAT
                IF ExpectedTime <= ProdOrderCapNeed2."Needed Time" THEN BEGIN
                    ProdOrderCapNeed2."Ending Time" :=
                      CalendarMgt.CalcTimeSubtract(
                        ProdOrderCapNeed2."Ending Time",
                        ROUND(
                          ExpectedTime *
                          CalendarMgt.TimeFactor(Workcenter2."Unit of Measure Code") /
                          ProdOrderCapNeed2.Efficiency * 100 /
                          ProdOrderCapNeed2."Concurrent Capacities", 1));
                    ProdOrderCapNeed2."Needed Time" :=
                      ProdOrderCapNeed2."Needed Time" - ExpectedTime;
                    ProdStartingTime := ProdOrderCapNeed2."Ending Time";
                    ProdStartingDate := ProdOrderCapNeed2.Date;
                    IF MaxLotSize = TotalLotSize THEN BEGIN
                        ProdOrderCapNeed3.SETCURRENTKEY(Status, "Prod. Order No.", "Routing Reference No.", "Operation No.", Date, "Starting Time");
                        ProdOrderCapNeed3.COPYFILTERS(ProdOrderCapNeed2);
                        ProdOrderCapNeed3.SETRANGE("Time Type", ProdOrderCapNeed3."Time Type"::Setup);
                        IF ProdOrderCapNeed3.FINDFIRST THEN BEGIN
                            ProdStartingTime := ProdOrderCapNeed3."Starting Time";
                            ProdStartingDate := ProdOrderCapNeed3.Date;
                        END;
                    END;
                    DeltaTotal += PrevEndingDateTime - CREATEDATETIME(ProdStartingDate, ProdStartingTime);
                    EXIT(FALSE);
                END ELSE
                    ExpectedTime := ExpectedTime - ProdOrderCapNeed2."Needed Time";
            UNTIL ProdOrderCapNeed2.NEXT(-1) = 0;
        END;
        EXIT(FALSE);
    end;

    (53266)]
    local procedure CalcRoutingLineBack(CalculateEndDate: Boolean);
    var
        ProdOrderRoutingLine2: Record "Prod. Order Routing Line";
        ProdOrderRoutingLine3: Record "Prod. Order Routing Line";
        ConstrainedCapacity: Record "Capacity Constrained Resource";
        ParentWorkCenter: Record "Capacity Constrained Resource";
        TmpProdOrderRtngLine: Record "Prod. Order Routing Line" temporary;
        TmpProdOrderCapNeed: Record "Prod. Order Capacity Need" temporary;
        SendAheadLotSize: Decimal;
        ParentIsConstrained: Boolean;
        ResourceIsConstrained: Boolean;
        DeltaTotal: BigInteger;
        DeltaLoadedBack: BigInteger;
        PrevEndingDateTime: DateTime;
    begin
        CalendarEntry.SETRANGE(Date, 0D, ProdOrderRoutingLine."Ending Date");

        ProdEndingTime := ProdOrderRoutingLine."Ending Time";
        ProdEndingDate := ProdOrderRoutingLine."Ending Date";
        ProdStartingTime := ProdOrderRoutingLine."Ending Time";
        ProdStartingDate := ProdOrderRoutingLine."Ending Date";

        FirstEntry := TRUE;
        IF (ProdOrderRoutingLine."Next Operation No." <> '') AND
           CalculateEndDate
        THEN BEGIN
            CLEAR(ProdOrderRoutingLine3);

            TmpProdOrderRtngLine.RESET;
            TmpProdOrderRtngLine.DELETEALL;
            TmpProdOrderCapNeed.RESET;
            TmpProdOrderCapNeed.DELETEALL;

            ProdOrderRoutingLine2.SETRANGE(Status, ProdOrderRoutingLine.Status);
            ProdOrderRoutingLine2.SETRANGE("Prod. Order No.", ProdOrderRoutingLine."Prod. Order No.");
            ProdOrderRoutingLine2.SETRANGE("Routing Reference No.", ProdOrderRoutingLine."Routing Reference No.");
            ProdOrderRoutingLine2.SETRANGE("Routing No.", ProdOrderRoutingLine."Routing No.");
            ProdOrderRoutingLine2.SETFILTER("Routing Status", '<>%1', ProdOrderRoutingLine2."Routing Status"::Finished);
            ProdOrderRoutingLine2.SETFILTER("Operation No.", ProdOrderRoutingLine."Next Operation No.");
            IF ProdOrderRoutingLine2.FIND('-') THEN
                REPEAT
                    TotalLotSize := 0;
                    GetSendAheadStartingTime(ProdOrderRoutingLine2, TRUE, SendAheadLotSize, DeltaTotal);

                    TmpProdOrderRtngLine.COPY(ProdOrderRoutingLine2);
                    TmpProdOrderRtngLine.INSERT;
                    TmpProdOrderCapNeed.COPY(ProdOrderCapNeed2);
                    IF TmpProdOrderCapNeed."Operation No." = TmpProdOrderRtngLine."Operation No." THEN
                        TmpProdOrderCapNeed.INSERT;

                    SetMinDateTime(ProdEndingDate, ProdEndingTime, ProdStartingDate, ProdStartingTime);
                    ProdOrderRoutingLine3 := ProdOrderRoutingLine2;
                UNTIL ProdOrderRoutingLine2.NEXT = 0;
            IF ProdOrderRoutingLine3."Prod. Order No." <> '' THEN BEGIN
                Workcenter2.GET(ProdOrderRoutingLine3."Work Center No.");
                ProdOrderRoutingLine3."Critical Path" := TRUE;
                ProdOrderRoutingLine3.UpdateDatetime;
                ProdOrderRoutingLine3.MODIFY;
                IF ProdOrderRoutingLine3.Type = ProdOrderRoutingLine3.Type::"Machine Center" THEN BEGIN
                    MachineCenter.GET(ProdOrderRoutingLine3."No.");
                    Workcenter2."Queue Time" := MachineCenter."Queue Time";
                    Workcenter2."Queue Time Unit of Meas. Code" :=
                      MachineCenter."Queue Time Unit of Meas. Code";
                END;
                UpdateDates := FALSE;
                RemainNeedQty :=
                  ROUND(
                    Workcenter2."Queue Time" *
                    CalendarMgt.TimeFactor(Workcenter2."Queue Time Unit of Meas. Code") /
                    CalendarMgt.TimeFactor(Workcenter2."Unit of Measure Code"),
                    Workcenter2."Calendar Rounding Precision");

                LoadCapBack(ProdOrderRoutingLine2.Type, ProdOrderRoutingLine2."No.", 4, FALSE);
            END ELSE
                ProdOrderRoutingLine3 := ProdOrderRoutingLine2;
        END ELSE BEGIN
            TotalLotSize := MaxLotSize;
            SendAheadLotSize := MaxLotSize;
        END;

        // In case of Parallel Routing and the last operation is finished
        IF ProdEndingDate = CalendarMgt.GetMaxDate THEN BEGIN
            ProdOrderRoutingLine."Ending Date" := ProdOrderLine."Ending Date";
            ProdOrderRoutingLine."Ending Time" := ProdOrderLine."Ending Time";

            ProdEndingTime := ProdOrderRoutingLine."Ending Time";
            ProdEndingDate := ProdOrderRoutingLine."Ending Date";
            ProdStartingTime := ProdOrderRoutingLine."Ending Time";
            ProdStartingDate := ProdOrderRoutingLine."Ending Date";

            TotalLotSize := MaxLotSize;
            SendAheadLotSize := MaxLotSize;
        END;

        UpdateDates := TRUE;

        CalcMoveAndWaitBack;

        IF ProdOrderRoutingLine."Schedule Manually" THEN // Move and wait time has been calculated
            EXIT;

        CLEAR(DeltaTotal);
        CLEAR(DeltaLoadedBack);
        PrevEndingDateTime := CREATEDATETIME(ProdEndingDate, ProdEndingTime);

        REPEAT
            SetMinDateTime(ProdEndingDate, ProdEndingTime, ProdStartingDate, ProdStartingTime);
            DeltaLoadedBack := PrevEndingDateTime - CREATEDATETIME(ProdEndingDate, ProdEndingTime);

            IF DeltaTotal > DeltaLoadedBack THEN BEGIN
                PrevEndingDateTime :=
                  CREATEDATETIME(ProdEndingDate, ProdEndingTime) - (DeltaTotal - DeltaLoadedBack);
                ProdEndingDate := DT2DATE(PrevEndingDateTime);
                ProdEndingTime := DT2TIME(PrevEndingDateTime);
            END;
            PrevEndingDateTime := CREATEDATETIME(ProdEndingDate, ProdEndingTime);

            LotSize := SendAheadLotSize;
            RemainNeedQty :=
              LotSize *
              ProdOrderRoutingLine.RunTimePer;
            RemainNeedQty :=
              ROUND(
                RemainNeedQty *
                CalendarMgt.TimeFactor(ProdOrderRoutingLine."Run Time Unit of Meas. Code") /
                CalendarMgt.TimeFactor(Workcenter."Unit of Measure Code"),
                Workcenter."Calendar Rounding Precision");

            WITH ProdOrderRoutingLine DO BEGIN
                ResourceIsConstrained := ConstrainedCapacity.GET(Type, "No.");
                ParentIsConstrained := ParentWorkCenter.GET(Type::"Work Center", "Work Center No.");
                IF NOT "Schedule Manually" AND
                   (ResourceIsConstrained OR ParentIsConstrained)
                THEN
                    FinitelyLoadCapBack(1, ConstrainedCapacity, ResourceIsConstrained, ParentWorkCenter, ParentIsConstrained)
                ELSE
                    LoadCapBack(Type, "No.", 1, TRUE);
            END;

            ProdEndingDate := ProdOrderRoutingLine."Starting Date";
            ProdEndingTime := ProdOrderRoutingLine."Starting Time";
        UNTIL FindSendAheadStartingTime(TmpProdOrderRtngLine, TmpProdOrderCapNeed, SendAheadLotSize, DeltaTotal);

        ProdEndingDate := ProdOrderRoutingLine."Starting Date";
        ProdEndingTime := ProdOrderRoutingLine."Starting Time";
        RemainNeedQty :=
          ROUND(
            ProdOrderRoutingLine."Setup Time" *
            CalendarMgt.TimeFactor(ProdOrderRoutingLine."Setup Time Unit of Meas. Code") /
            CalendarMgt.TimeFactor(Workcenter."Unit of Measure Code"),
            Workcenter."Calendar Rounding Precision");

        WITH ProdOrderRoutingLine DO BEGIN
            ResourceIsConstrained := ConstrainedCapacity.GET(Type, "No.");
            ParentIsConstrained := ParentWorkCenter.GET(Type::"Work Center", "Work Center No.");
            IF NOT "Schedule Manually" AND
               (ResourceIsConstrained OR ParentIsConstrained)
            THEN
                FinitelyLoadCapBack(0, ConstrainedCapacity, ResourceIsConstrained, ParentWorkCenter, ParentIsConstrained)
            ELSE
                LoadCapBack(Type, "No.", 0, TRUE);

            "Starting Date" := ProdEndingDate;
            "Starting Time" := ProdEndingTime;

            IF "Ending Date" = CalendarMgt.GetMaxDate THEN BEGIN
                "Ending Date" := "Starting Date";
                "Ending Time" := "Starting Time";
            END;

            UpdateDatetime;
            MODIFY;
        END;
    end;

    (53426)]
    local procedure GetSendAheadEndingTime(ProdOrderRoutingLine2: Record "Prod. Order Routing Line"; FirstLine: Boolean; var SendAheadLotSize: Decimal): Boolean;
    var
        ExpectedTime: Decimal;
        SetupTime: Decimal;
        xProdStartingDate: Date;
        xProdStartingTime: Time;
    begin
        ProdEndingTime := ProdOrderRoutingLine2."Ending Time";
        ProdEndingDate := ProdOrderRoutingLine2."Ending Date";
        SendAheadLotSize := MaxLotSize;
        IF TotalLotSize = MaxLotSize THEN
            EXIT(TRUE);

        WITH ProdOrderRoutingLine2 DO BEGIN
            IF ("Send-Ahead Quantity" = 0) OR
               ("Send-Ahead Quantity" >= MaxLotSize)
            THEN BEGIN
                TotalLotSize := SendAheadLotSize;
                EXIT(FALSE);
            END;
            SendAheadLotSize := "Send-Ahead Quantity";
            IF MaxLotSize < (TotalLotSize + SendAheadLotSize) THEN BEGIN
                SendAheadLotSize := MaxLotSize - TotalLotSize;
                TotalLotSize := MaxLotSize;
            END ELSE
                TotalLotSize := TotalLotSize + SendAheadLotSize;

            Workcenter2.GET("Work Center No.");
            IF "Lot Size" = 0 THEN
                "Lot Size" := 1;
            IF FirstLine THEN BEGIN
                ExpectedTime :=
                  ROUND(
                    ("Setup Time" + "Run Time" * SendAheadLotSize / "Lot Size") *
                    CalendarMgt.TimeFactor("Run Time Unit of Meas. Code") /
                    CalendarMgt.TimeFactor(Workcenter2."Unit of Measure Code"),
                    Workcenter2."Calendar Rounding Precision");
                SetupTime := ROUND(
                    "Setup Time" *
                    CalendarMgt.TimeFactor("Setup Time Unit of Meas. Code") /
                    CalendarMgt.TimeFactor(Workcenter2."Unit of Measure Code"),
                    Workcenter2."Calendar Rounding Precision");
            END ELSE
                ExpectedTime :=
                  ROUND(
                    "Run Time" * "Send-Ahead Quantity" / "Lot Size" *
                    CalendarMgt.TimeFactor("Run Time Unit of Meas. Code") /
                    CalendarMgt.TimeFactor(Workcenter2."Unit of Measure Code"),
                    Workcenter2."Calendar Rounding Precision");
            IF FirstLine THEN BEGIN
                ProdOrderCapNeed2.RESET;
                ProdOrderCapNeed2.SETCURRENTKEY(Status, "Prod. Order No.", "Routing Reference No.", "Operation No.", Date, "Starting Time");
                ProdOrderCapNeed2.SETRANGE(Status, Status);
                ProdOrderCapNeed2.SETRANGE("Prod. Order No.", "Prod. Order No.");
                ProdOrderCapNeed2.SETRANGE("Requested Only", FALSE);
                ProdOrderCapNeed2.SETRANGE("Routing No.", "Routing No.");
                ProdOrderCapNeed2.SETRANGE("Routing Reference No.", "Routing Reference No.");
                ProdOrderCapNeed2.SETRANGE("Operation No.", "Operation No.");
                IF NOT ProdOrderCapNeed2.FIND('-') THEN BEGIN
                    ProdEndingTime := "Starting Time";
                    ProdEndingDate := "Starting Date";
                    EXIT(FALSE);
                END;
            END;
            REPEAT
                IF ExpectedTime <= ProdOrderCapNeed2."Needed Time" THEN BEGIN
                    ProdOrderCapNeed2."Starting Time" :=
                      ProdOrderCapNeed2."Starting Time" +
                      ROUND(
                        ((ExpectedTime - SetupTime) *
                         CalendarMgt.TimeFactor(Workcenter2."Unit of Measure Code") /
                         ProdOrderCapNeed2."Concurrent Capacities" +
                         SetupTime * CalendarMgt.TimeFactor(Workcenter2."Unit of Measure Code")) /
                        ProdOrderCapNeed2.Efficiency * 100, 1);
                    ProdOrderCapNeed2."Needed Time" :=
                      ProdOrderCapNeed2."Needed Time" - ExpectedTime;
                    UpdateDates := FALSE;
                    xProdStartingTime := ProdStartingTime;
                    xProdStartingDate := ProdStartingDate;
                    ProdStartingTime := ProdOrderCapNeed2."Starting Time";
                    ProdStartingDate := ProdOrderCapNeed2.Date;
                    RemainNeedQty :=
                      ROUND(
                        "Wait Time" *
                        CalendarMgt.TimeFactor("Wait Time Unit of Meas. Code") /
                        CalendarMgt.TimeFactor(Workcenter2."Unit of Measure Code"),
                        Workcenter2."Calendar Rounding Precision");
                    LoadCapForward(Type, "No.", 2, FALSE);

                    RemainNeedQty :=
                      ROUND(
                        "Move Time" *
                        CalendarMgt.TimeFactor("Move Time Unit of Meas. Code") /
                        CalendarMgt.TimeFactor(Workcenter2."Unit of Measure Code"),
                        Workcenter2."Calendar Rounding Precision");
                    LoadCapForward(Type, "No.", 3, FALSE);

                    ProdEndingTime := ProdStartingTime;
                    ProdEndingDate := ProdStartingDate;
                    ProdStartingTime := xProdStartingTime;
                    ProdStartingDate := xProdStartingDate;
                    EXIT(FALSE);
                END ELSE
                    ExpectedTime := ExpectedTime - ProdOrderCapNeed2."Needed Time";

            UNTIL ProdOrderCapNeed2.NEXT = 0;
        END;
        EXIT(FALSE);
    end;

    (53529)]
    local procedure CalcRoutingLineForward(CalculateStartDate: Boolean);
    var
        ProdOrderRoutingLine2: Record "Prod. Order Routing Line";
        ProdOrderRoutingLine3: Record "Prod. Order Routing Line";
        ConstrainedCapacity: Record "Capacity Constrained Resource";
        ParentWorkCenter: Record "Capacity Constrained Resource";
        TmpProdOrderRtngLine: Record "Prod. Order Routing Line" temporary;
        TmpProdOrderCapNeed: Record "Prod. Order Capacity Need" temporary;
        SendAheadLotSize: Decimal;
        InputQtyDiffTime: Decimal;
        ParentIsConstrained: Boolean;
        ResourceIsConstrained: Boolean;
    begin
        CalendarEntry.SETRANGE(Date, ProdOrderRoutingLine."Starting Date", 12319999D);

        ProdStartingTime := ProdOrderRoutingLine."Starting Time";
        ProdStartingDate := ProdOrderRoutingLine."Starting Date";
        ProdEndingTime := ProdOrderRoutingLine."Starting Time";
        ProdEndingDate := ProdOrderRoutingLine."Starting Date";

        InputQtyDiffTime := 0;

        FirstEntry := TRUE;

        IF (ProdOrderRoutingLine."Previous Operation No." <> '') AND
           CalculateStartDate
        THEN BEGIN
            CLEAR(ProdOrderRoutingLine3);

            TmpProdOrderRtngLine.RESET;
            TmpProdOrderRtngLine.DELETEALL;
            TmpProdOrderCapNeed.RESET;
            TmpProdOrderCapNeed.DELETEALL;

            ProdOrderRoutingLine2.SETRANGE(Status, ProdOrderRoutingLine.Status);
            ProdOrderRoutingLine2.SETRANGE("Prod. Order No.", ProdOrderRoutingLine."Prod. Order No.");
            ProdOrderRoutingLine2.SETRANGE("Routing Reference No.", ProdOrderRoutingLine."Routing Reference No.");
            ProdOrderRoutingLine2.SETRANGE("Routing No.", ProdOrderRoutingLine."Routing No.");
            ProdOrderRoutingLine2.SETFILTER("Routing Status", '<>%1', ProdOrderRoutingLine2."Routing Status"::Finished);
            ProdOrderRoutingLine2.SETFILTER("Operation No.", ProdOrderRoutingLine."Previous Operation No.");
            IF ProdOrderRoutingLine2.FIND('-') THEN
                REPEAT
                    TotalLotSize := 0;
                    GetSendAheadEndingTime(ProdOrderRoutingLine2, TRUE, SendAheadLotSize);

                    TmpProdOrderRtngLine.COPY(ProdOrderRoutingLine2);
                    TmpProdOrderRtngLine.INSERT;
                    TmpProdOrderCapNeed.COPY(ProdOrderCapNeed2);
                    IF TmpProdOrderRtngLine."Operation No." = TmpProdOrderCapNeed."Operation No." THEN
                        TmpProdOrderCapNeed.INSERT;

                    SetMaxDateTime(ProdStartingDate, ProdStartingTime, ProdEndingDate, ProdEndingTime);
                    ProdOrderRoutingLine3 := ProdOrderRoutingLine2;

                    IF (ProdOrderRoutingLine2."Send-Ahead Quantity" > 0) AND
                       (ProdOrderRoutingLine2."Input Quantity" > ProdOrderRoutingLine."Input Quantity")
                    THEN BEGIN
                        Workcenter2.GET(ProdOrderRoutingLine2."Work Center No.");
                        InputQtyDiffTime :=
                          (ProdOrderRoutingLine2."Input Quantity" - ProdOrderRoutingLine."Input Quantity") *
                          ProdOrderRoutingLine2.RunTimePer;
                        InputQtyDiffTime :=
                          ROUND(
                            InputQtyDiffTime *
                            CalendarMgt.TimeFactor(ProdOrderRoutingLine2."Run Time Unit of Meas. Code") /
                            CalendarMgt.TimeFactor(Workcenter2."Unit of Measure Code"),
                            Workcenter2."Calendar Rounding Precision");
                    END;
                UNTIL ProdOrderRoutingLine2.NEXT = 0
            ELSE
                // parallel routing with finished first operation
                IF ProdStartingDate = 0D THEN BEGIN
                    ProdOrderRoutingLine2.GET(ProdOrderRoutingLine.Status,
                      ProdOrderRoutingLine."Prod. Order No.", ProdOrderRoutingLine."Routing Reference No.",
                      ProdOrderRoutingLine."Routing No.", ProdOrderRoutingLine."Operation No.");
                    ProdStartingDate := ProdOrderRoutingLine2."Starting Date";
                    ProdStartingTime := ProdOrderRoutingLine2."Starting Time";
                END;
            IF ProdOrderRoutingLine3."Prod. Order No." <> '' THEN BEGIN
                ProdOrderRoutingLine3."Critical Path" := TRUE;
                ProdOrderRoutingLine3.UpdateDatetime;
                ProdOrderRoutingLine3.MODIFY;
            END;
        END ELSE BEGIN
            TotalLotSize := MaxLotSize;
            SendAheadLotSize := MaxLotSize;
        END;
        RemainNeedQty :=
          ROUND(
            Workcenter."Queue Time" *
            CalendarMgt.TimeFactor(Workcenter."Queue Time Unit of Meas. Code") /
            CalendarMgt.TimeFactor(Workcenter."Unit of Measure Code"),
            Workcenter."Calendar Rounding Precision");
        RemainNeedQty += InputQtyDiffTime;
        LoadCapForward(ProdOrderRoutingLine.Type, ProdOrderRoutingLine."No.", 4, FALSE);
        RemainNeedQty :=
          ROUND(
            ProdOrderRoutingLine."Setup Time" *
            CalendarMgt.TimeFactor(ProdOrderRoutingLine."Setup Time Unit of Meas. Code") /
            CalendarMgt.TimeFactor(Workcenter."Unit of Measure Code"),
            Workcenter."Calendar Rounding Precision");
        UpdateDates := TRUE;

        WITH ProdOrderRoutingLine DO BEGIN
            ResourceIsConstrained := ConstrainedCapacity.GET(Type, "No.");
            ParentIsConstrained := ParentWorkCenter.GET(Type::"Work Center", "Work Center No.");
            IF NOT "Schedule Manually" AND
               (RemainNeedQty > 0) AND (ResourceIsConstrained OR ParentIsConstrained)
            THEN
                FinitelyLoadCapForward(0, ConstrainedCapacity, ResourceIsConstrained, ParentWorkCenter, ParentIsConstrained)
            ELSE
                LoadCapForward(Type, "No.", 0, TRUE);
        END;

        FirstInBatch := TRUE;
        REPEAT
            SetMaxDateTime(ProdStartingDate, ProdStartingTime, ProdEndingDate, ProdEndingTime);

            IF (InputQtyDiffTime > 0) AND (TotalLotSize = MaxLotSize) THEN
                SetMaxDateTime(
                  ProdStartingDate, ProdStartingTime, ProdOrderRoutingLine2."Ending Date", ProdOrderRoutingLine2."Ending Time");

            LotSize := SendAheadLotSize;
            RemainNeedQty := LotSize * ProdOrderRoutingLine.RunTimePer;
            RemainNeedQty :=
              ROUND(
                RemainNeedQty *
                CalendarMgt.TimeFactor(ProdOrderRoutingLine."Run Time Unit of Meas. Code") /
                CalendarMgt.TimeFactor(Workcenter."Unit of Measure Code"),
                Workcenter."Calendar Rounding Precision");

            WITH ProdOrderRoutingLine DO BEGIN
                ResourceIsConstrained := ConstrainedCapacity.GET(Type, "No.");
                ParentIsConstrained := ParentWorkCenter.GET(Type::"Work Center", "Work Center No.");
                IF NOT "Schedule Manually" AND
                   (RemainNeedQty > 0) AND (ResourceIsConstrained OR ParentIsConstrained)
                THEN
                    FinitelyLoadCapForward(1, ConstrainedCapacity, ResourceIsConstrained, ParentWorkCenter, ParentIsConstrained)
                ELSE
                    LoadCapForward(Type, "No.", 1, TRUE);
            END;

            ProdStartingDate := ProdOrderRoutingLine."Ending Date";
            ProdStartingTime := ProdOrderRoutingLine."Ending Time";
        UNTIL FindSendAheadEndingTime(TmpProdOrderRtngLine, TmpProdOrderCapNeed, SendAheadLotSize);

        RemainNeedQty :=
          ROUND(
            ProdOrderRoutingLine."Wait Time" *
            CalendarMgt.TimeFactor(ProdOrderRoutingLine."Wait Time Unit of Meas. Code") /
            CalendarMgt.TimeFactor(Workcenter."Unit of Measure Code"),
            Workcenter."Calendar Rounding Precision");
        LoadCapForward(ProdOrderRoutingLine.Type, ProdOrderRoutingLine."No.", 2, FALSE);
        RemainNeedQty :=
          ROUND(
            ProdOrderRoutingLine."Move Time" *
            CalendarMgt.TimeFactor(ProdOrderRoutingLine."Move Time Unit of Meas. Code") /
            CalendarMgt.TimeFactor(Workcenter."Unit of Measure Code"),
            Workcenter."Calendar Rounding Precision");
        LoadCapForward(ProdOrderRoutingLine.Type, ProdOrderRoutingLine."No.", 3, FALSE);

        WITH ProdOrderRoutingLine DO BEGIN
            IF "Starting Date" = 0D THEN BEGIN
                "Starting Date" := "Ending Date";
                "Starting Time" := "Ending Time";
            END;

            UpdateDatetime;
            MODIFY;
        END;
    end;

    (53688)]
    local procedure CalculateRoutingLineFixed();
    var
        FixedProdOrderRoutingLine: Record "Prod. Order Routing Line";
    begin
        FixedProdOrderRoutingLine := ProdOrderRoutingLine;
        IF FixedProdOrderRoutingLine."Starting Date-Time" > FixedProdOrderRoutingLine."Ending Date-Time" THEN
            ERROR(Text007);

        // Calculate wait and move time, find end of runtime
        CalcRoutingLineBack(TRUE);
        RunEndingDateTime :=
          CREATEDATETIME(ProdOrderRoutingLine."Starting Date", ProdOrderRoutingLine."Starting Time");

        // Find start of runtime
        ProdOrderRoutingLine := FixedProdOrderRoutingLine;
        CalcRoutingLineForward(TRUE);

        ProdOrderRoutingLine."Starting Time" := FixedProdOrderRoutingLine."Starting Time";
        ProdOrderRoutingLine."Starting Date" := FixedProdOrderRoutingLine."Starting Date";
        ProdOrderRoutingLine."Ending Time" := FixedProdOrderRoutingLine."Ending Time";
        ProdOrderRoutingLine."Ending Date" := FixedProdOrderRoutingLine."Ending Date";
        ProdOrderRoutingLine.UpdateDatetime;
        ProdOrderRoutingLine.MODIFY;
    end;

    (53709)]
    procedure CalculateRoutingLine(var ProdOrderRoutingLine2: Record "Prod. Order Routing Line"; Direction: Option Forward,Backward; CalcStartEndDate: Boolean);
    var
        ProdOrderCapNeed: Record "Prod. Order Capacity Need";
        CostCalcMgt: Codeunit "Cost Calculation Management";
        ExpectedOperOutput: Decimal;
        ActualOperOutput: Decimal;
        TotalQtyPerOperation: Decimal;
        TotalCapacityPerOperation: Decimal;
        ConCurrCapacity: Decimal;
    begin
        MfgSetup.GET;

        ProdOrderRoutingLine := ProdOrderRoutingLine2;

        WaitTimeOnly :=
          (ProdOrderRoutingLine."Setup Time" = 0) AND (ProdOrderRoutingLine."Run Time" = 0) AND
          (ProdOrderRoutingLine."Move Time" = 0);

        IF ProdOrderRoutingLine."Ending Time" = 0T THEN
            ProdOrderRoutingLine."Ending Time" := 000000T;

        IF ProdOrderRoutingLine."Starting Time" = 0T THEN
            ProdOrderRoutingLine."Starting Time" := 000000T;

        ProdOrderRoutingLine."Expected Operation Cost Amt." := 0;
        ProdOrderRoutingLine."Expected Capacity Ovhd. Cost" := 0;
        ProdOrderRoutingLine."Expected Capacity Need" := 0;

        ProdOrderCapNeed.RESET;
        ProdOrderCapNeed.SETRANGE(Status, ProdOrderRoutingLine.Status);
        ProdOrderCapNeed.SETRANGE("Prod. Order No.", ProdOrderRoutingLine."Prod. Order No.");
        ProdOrderCapNeed.SETRANGE("Requested Only", FALSE);
        ProdOrderCapNeed.SETRANGE("Routing No.", ProdOrderRoutingLine."Routing No.");
        ProdOrderCapNeed.SETRANGE("Routing Reference No.", ProdOrderRoutingLine."Routing Reference No.");
        ProdOrderCapNeed.SETRANGE("Operation No.", ProdOrderRoutingLine."Operation No.");
        ProdOrderCapNeed.DELETEALL;

        NextCapNeedLineNo := 1;

        ProdOrderRoutingLine.TESTFIELD("Work Center No.");

        CurrentWorkCenterNo := '';
        Workcenter.GET(ProdOrderRoutingLine."Work Center No.");
        IF ProdOrderRoutingLine.Type = ProdOrderRoutingLine.Type::"Machine Center" THEN BEGIN
            MachineCenter.GET(ProdOrderRoutingLine."No.");
            Workcenter."Queue Time" := MachineCenter."Queue Time";
            Workcenter."Queue Time Unit of Meas. Code" := MachineCenter."Queue Time Unit of Meas. Code";
        END;
        IF NOT CalcStartEndDate THEN
            CLEAR(Workcenter."Queue Time");
        ProdOrder.GET(ProdOrderRoutingLine.Status, ProdOrderRoutingLine."Prod. Order No.");

        ProdOrderQty := 0;
        TotalScrap := 0;
        TotalLotSize := 0;
        ProdOrderLine.SETRANGE(Status, ProdOrderRoutingLine.Status);
        ProdOrderLine.SETRANGE("Prod. Order No.", ProdOrderRoutingLine."Prod. Order No.");
        ProdOrderLine.SETRANGE("Routing Reference No.", ProdOrderRoutingLine."Routing Reference No.");
        ProdOrderLine.SETRANGE("Routing No.", ProdOrderRoutingLine."Routing No.");
        IF ProdOrderLine.FIND('-') THEN BEGIN
            ExpectedOperOutput := 0;
            REPEAT
                ExpectedOperOutput := ExpectedOperOutput + ProdOrderLine."Quantity (Base)";
                TotalScrap := TotalScrap + ProdOrderLine."Scrap %";
            UNTIL ProdOrderLine.NEXT = 0;
            ActualOperOutput := CostCalcMgt.CalcActOutputQtyBase(ProdOrderLine, ProdOrderRoutingLine);
            ProdOrderQty := ExpectedOperOutput - ActualOperOutput;
            IF ProdOrderQty < 0 THEN
                ProdOrderQty := 0;
        END;

        MaxLotSize :=
          ProdOrderQty *
          (1 + ProdOrderRoutingLine."Scrap Factor % (Accumulated)") *
          (1 + TotalScrap / 100) +
          ProdOrderRoutingLine."Fixed Scrap Qty. (Accum.)";

        ProdOrderRoutingLine."Input Quantity" := MaxLotSize;

        IF ActualOperOutput > 0 THEN BEGIN
            TotalQtyPerOperation :=
              ExpectedOperOutput *
              (1 + ProdOrderRoutingLine."Scrap Factor % (Accumulated)") *
              (1 + TotalScrap / 100) +
              ProdOrderRoutingLine."Fixed Scrap Qty. (Accum.)";
        END ELSE
            TotalQtyPerOperation := MaxLotSize;

        TotalCapacityPerOperation :=
          ROUND(
            TotalQtyPerOperation *
            ProdOrderRoutingLine.RunTimePer *
            CalendarMgt.QtyperTimeUnitofMeasure(ProdOrderRoutingLine."Work Center No.", ProdOrderRoutingLine."Run Time Unit of Meas. Code"),
            0.00001);
        IF MfgSetup."Cost Incl. Setup" THEN BEGIN
            ConCurrCapacity := ProdOrderRoutingLine."Concurrent Capacities";
            IF ConCurrCapacity = 0 THEN
                ConCurrCapacity := 1;
            TotalCapacityPerOperation :=
              TotalCapacityPerOperation +
              ROUND(
                ConCurrCapacity * ProdOrderRoutingLine."Setup Time" *
                CalendarMgt.QtyperTimeUnitofMeasure(
                  ProdOrderRoutingLine."Work Center No.", ProdOrderRoutingLine."Setup Time Unit of Meas. Code"),
                0.00001);
        END;
        CalcExpectedCost(ProdOrderRoutingLine, TotalQtyPerOperation, TotalCapacityPerOperation);

        IF ProdOrderRoutingLine."Schedule Manually" THEN
            CalculateRoutingLineFixed
        ELSE BEGIN
            IF Direction = Direction::Backward THEN
                CalcRoutingLineBack(CalcStartEndDate)
            ELSE
                CalcRoutingLineForward(CalcStartEndDate);
        END;

        ProdOrderRoutingLine2 := ProdOrderRoutingLine;
    end;

    (53819)]
    local procedure FinitelyLoadCapBack(TimeType: Option "Setup Time","Run Time"; ConstrainedCapacity: Record "Capacity Constrained Resource"; ResourceIsConstrained: Boolean; ParentWorkCenter: Record "Capacity Constrained Resource"; ParentIsConstrained: Boolean);
    var
        LastProdOrderCapNeed: Record "Prod. Order Capacity Need";
        AvailTime: Decimal;
        ProdEndingDateTime: DateTime;
        ProdEndingDateTimeAddOneDay: DateTime;
        SetupTime: Decimal;
        TimetoProgram: Decimal;
        AvailCap: Decimal;
        DampTime: Decimal;
        xConCurrCap: Decimal;
        EndTime: Time;
        StartTime: Time;
    begin
        IF (RemainNeedQty = 0) AND WaitTimeOnly THEN
            EXIT;
        EndTime := ProdEndingTime;
        ProdEndingDateTime := CREATEDATETIME(ProdEndingDate, ProdEndingTime);
        ProdEndingDateTimeAddOneDay := CREATEDATETIME(ProdEndingDate + 1, ProdEndingTime);
        ConCurrCap := ProdOrderRoutingLine."Concurrent Capacities";
        xConCurrCap := 1;

        LastProdOrderCapNeed.SETCURRENTKEY(Type, "No.", "Ending Date-Time", "Starting Date-Time");
        LastProdOrderCapNeed.SETFILTER(Status, '<> %1', LastProdOrderCapNeed.Status::Simulated);
        LastProdOrderCapNeed.SETRANGE(Type, ProdOrderRoutingLine.Type);
        LastProdOrderCapNeed.SETRANGE("No.", ProdOrderRoutingLine."No.");
        LastProdOrderCapNeed.SETFILTER("Allocated Time", '> 0');

        CalendarEntry.RESET;
        CalendarEntry.SETCURRENTKEY("Capacity Type", "No.", "Starting Date-Time", "Ending Date-Time");
        CalendarEntry.SETRANGE("Capacity Type", ProdOrderRoutingLine.Type);
        CalendarEntry.SETRANGE("No.", ProdOrderRoutingLine."No.");
        CalendarEntry.SETFILTER("Starting Date-Time", '<= %1', ProdEndingDateTime);
        CalendarEntry.SETFILTER("Ending Date-Time", '<= %1', ProdEndingDateTimeAddOneDay);

        IF CalendarEntry.FIND('+') THEN
            REPEAT
                IF (EndTime > CalendarEntry."Ending Time") OR (EndTime < CalendarEntry."Starting Time") OR
                   (ProdEndingDate <> CalendarEntry.Date)
                THEN
                    EndTime := CalendarEntry."Ending Time";
                StartTime := EndTime;

                IF (ConCurrCap = 0) OR (CalendarEntry.Capacity < ConCurrCap) THEN
                    ConCurrCap := CalendarEntry.Capacity;
                IF TimeType <> TimeType::"Run Time" THEN
                    RemainNeedQty := RemainNeedQty * ConCurrCap / xConCurrCap;
                xConCurrCap := ConCurrCap;

                CalculateDailyLoad(AvailCap, DampTime, ConstrainedCapacity, ResourceIsConstrained, ParentWorkCenter, ParentIsConstrained);
                SetupTime := 0;
                IF TimeType = TimeType::"Run Time" THEN BEGIN
                    SetupTime :=
                      ROUND(
                        ProdOrderRoutingLine."Setup Time" *
                        CalendarMgt.TimeFactor(ProdOrderRoutingLine."Setup Time Unit of Meas. Code") /
                        CalendarMgt.TimeFactor(Workcenter."Unit of Measure Code"),
                        Workcenter."Calendar Rounding Precision");
                    SetupTime := SetupTime * ConCurrCap;
                END;
                IF RemainNeedQty + SetupTime <= AvailCap + DampTime THEN
                    AvailCap := AvailCap + DampTime;
                AvailCap :=
                  ROUND(AvailCap *
                    CalendarMgt.TimeFactor(Workcenter."Unit of Measure Code") *
                    100 / CalendarEntry.Efficiency / ConCurrCap, 1, '>');

                IF AvailCap > 0 THEN BEGIN
                    ProdEndingDateTime := CREATEDATETIME(CalendarEntry.Date, EndTime);
                    LastProdOrderCapNeed.SETFILTER(
                      "Ending Date-Time", '>= %1 & < %2', CalendarEntry."Starting Date-Time", ProdEndingDateTimeAddOneDay);
                    LastProdOrderCapNeed.SETFILTER(
                      "Starting Date-Time", '>= %1 & < %2', CalendarEntry."Starting Date-Time", ProdEndingDateTime);
                    IF LastProdOrderCapNeed.FIND('+') THEN
                        REPEAT
                            IF LastProdOrderCapNeed."Ending Time" < EndTime THEN BEGIN
                                AvailTime := Min(CalendarMgt.CalcTimeDelta(EndTime, LastProdOrderCapNeed."Ending Time"), AvailCap);
                                IF AvailTime > 0 THEN BEGIN
                                    UpdateTimesBack(AvailTime, AvailCap, TimetoProgram, StartTime, EndTime);
                                    CreateCapNeed(CalendarEntry.Date, StartTime, EndTime, TimetoProgram, TimeType, 1);
                                    IF FirstInBatch AND FirstEntry THEN BEGIN
                                        FirstInBatch := FALSE;
                                        FirstEntry := FALSE
                                    END;
                                    IF UpdateDates THEN BEGIN
                                        ProdOrderRoutingLine."Ending Time" := EndTime;
                                        ProdOrderRoutingLine."Ending Date" := CalendarEntry.Date;
                                        UpdateDates := FALSE
                                    END;
                                    EndTime := StartTime;
                                END;
                            END;
                            IF LastProdOrderCapNeed."Starting Time" < EndTime THEN
                                EndTime := LastProdOrderCapNeed."Starting Time";
                        UNTIL (LastProdOrderCapNeed.NEXT(-1) = 0) OR (RemainNeedQty = 0) OR (AvailCap = 0);

                    IF (AvailCap > 0) AND (RemainNeedQty > 0) THEN BEGIN
                        AvailTime := Min(CalendarMgt.CalcTimeDelta(EndTime, CalendarEntry."Starting Time"), AvailCap);
                        IF AvailTime > 0 THEN BEGIN
                            UpdateTimesBack(AvailTime, AvailCap, TimetoProgram, StartTime, EndTime);
                            IF StartTime < CalendarEntry."Starting Time" THEN
                                StartTime := CalendarEntry."Starting Time";
                            IF TimetoProgram <> 0 THEN
                                CreateCapNeed(CalendarEntry.Date, StartTime, EndTime, TimetoProgram, TimeType, 1);
                            IF FirstInBatch AND FirstEntry THEN BEGIN
                                FirstInBatch := FALSE;
                                FirstEntry := FALSE
                            END;
                            IF UpdateDates THEN BEGIN
                                ProdOrderRoutingLine."Ending Time" := EndTime;
                                ProdOrderRoutingLine."Ending Date" := CalendarEntry.Date;
                                UpdateDates := FALSE
                            END;
                            EndTime := StartTime;
                        END;
                    END;
                END;
                IF RemainNeedQty > 0 THEN BEGIN
                    IF CalendarEntry.NEXT(-1) = 0 THEN BEGIN
                        TestForError(Text001, Text002, CalendarEntry.Date);
                        EXIT;
                    END;
                    EndTime := CalendarEntry."Ending Time";
                END ELSE BEGIN
                    ProdEndingTime := StartTime;
                    ProdEndingDate := CalendarEntry.Date;
                    ProdOrderRoutingLine."Starting Time" := StartTime;
                    ProdOrderRoutingLine."Starting Date" := CalendarEntry.Date;
                    EXIT;
                END;
            UNTIL FALSE;
    end;

    (53938)]
    local procedure FinitelyLoadCapForward(TimeType: Option "Setup Time","Run Time"; ConstrainedCapacity: Record "Capacity Constrained Resource"; ResourceIsConstrained: Boolean; ParentWorkCenter: Record "Capacity Constrained Resource"; ParentIsConstrained: Boolean);
    var
        NextProdOrderCapNeed: Record "Prod. Order Capacity Need";
        AvailTime: Decimal;
        ProdStartingDateTime: DateTime;
        ProdStartingDateTimeSubOneDay: DateTime;
        RunTime: Decimal;
        TimetoProgram: Decimal;
        AvailCap: Decimal;
        DampTime: Decimal;
        xConCurrCap: Decimal;
        EndTime: Time;
        StartTime: Time;
    begin
        IF (RemainNeedQty = 0) AND WaitTimeOnly THEN
            EXIT;
        StartTime := ProdStartingTime;
        ProdStartingDateTime := CREATEDATETIME(ProdStartingDate, ProdStartingTime);
        ProdStartingDateTimeSubOneDay := CREATEDATETIME(ProdStartingDate - 1, ProdStartingTime);
        ConCurrCap := ProdOrderRoutingLine."Concurrent Capacities";
        xConCurrCap := 1;

        NextProdOrderCapNeed.SETCURRENTKEY(Type, "No.", "Starting Date-Time", "Ending Date-Time");
        NextProdOrderCapNeed.SETFILTER(Status, '<> %1', NextProdOrderCapNeed.Status::Simulated);
        NextProdOrderCapNeed.SETRANGE(Type, ProdOrderRoutingLine.Type);
        NextProdOrderCapNeed.SETRANGE("No.", ProdOrderRoutingLine."No.");
        NextProdOrderCapNeed.SETFILTER("Allocated Time", '> 0');

        CalendarEntry.RESET;
        CalendarEntry.SETCURRENTKEY("Capacity Type", "No.", "Starting Date-Time", "Ending Date-Time");
        CalendarEntry.SETRANGE("Capacity Type", ProdOrderRoutingLine.Type);
        CalendarEntry.SETRANGE("No.", ProdOrderRoutingLine."No.");
        CalendarEntry.SETFILTER("Starting Date-Time", '>= %1', ProdStartingDateTimeSubOneDay);
        CalendarEntry.SETFILTER("Ending Date-Time", '>= %1', ProdStartingDateTime);

        IF CalendarEntry.FIND('-') THEN
            REPEAT
                IF (StartTime < CalendarEntry."Starting Time") OR (StartTime > CalendarEntry."Ending Time") OR
                   (ProdStartingDate <> CalendarEntry.Date)
                THEN
                    StartTime := CalendarEntry."Starting Time";
                EndTime := StartTime;

                IF (ConCurrCap = 0) OR (CalendarEntry.Capacity < ConCurrCap) THEN
                    ConCurrCap := CalendarEntry.Capacity;
                IF TimeType <> TimeType::"Run Time" THEN
                    RemainNeedQty := RemainNeedQty * ConCurrCap / xConCurrCap;
                xConCurrCap := ConCurrCap;

                CalculateDailyLoad(AvailCap, DampTime, ConstrainedCapacity, ResourceIsConstrained, ParentWorkCenter, ParentIsConstrained);
                RunTime := 0;
                IF TimeType = TimeType::"Setup Time" THEN BEGIN
                    RunTime := LotSize * ProdOrderRoutingLine.RunTimePer;
                    RunTime :=
                      ROUND(RunTime *
                        CalendarMgt.TimeFactor(ProdOrderRoutingLine."Run Time Unit of Meas. Code") /
                        CalendarMgt.TimeFactor(Workcenter."Unit of Measure Code"),
                        Workcenter."Calendar Rounding Precision");
                END;
                IF RemainNeedQty + RunTime <= AvailCap + DampTime THEN
                    AvailCap := AvailCap + DampTime;
                AvailCap :=
                  ROUND(AvailCap *
                    CalendarMgt.TimeFactor(Workcenter."Unit of Measure Code") *
                    100 / CalendarEntry.Efficiency / ConCurrCap, 1, '>');

                IF AvailCap > 0 THEN BEGIN
                    ProdStartingDateTime := CREATEDATETIME(CalendarEntry.Date, StartTime);
                    NextProdOrderCapNeed.SETFILTER(
                      "Ending Date-Time", '> %1 & <= %2', ProdStartingDateTime, CalendarEntry."Ending Date-Time");
                    NextProdOrderCapNeed.SETFILTER(
                      "Starting Date-Time", '> %1 & <= %2', ProdStartingDateTimeSubOneDay, CalendarEntry."Ending Date-Time");
                    IF NextProdOrderCapNeed.FIND('-') THEN
                        REPEAT
                            IF NextProdOrderCapNeed."Starting Time" > StartTime THEN BEGIN
                                AvailTime := Min(CalendarMgt.CalcTimeDelta(NextProdOrderCapNeed."Starting Time", StartTime), AvailCap);
                                IF AvailTime > 0 THEN BEGIN
                                    UpdateTimesForward(AvailTime, AvailCap, TimetoProgram, StartTime, EndTime);
                                    CreateCapNeed(CalendarEntry.Date, StartTime, EndTime, TimetoProgram, TimeType, 0);
                                    IF FirstInBatch AND FirstEntry THEN BEGIN
                                        FirstInBatch := FALSE;
                                        FirstEntry := FALSE
                                    END;
                                    IF UpdateDates THEN BEGIN
                                        ProdOrderRoutingLine."Starting Time" := StartTime;
                                        ProdOrderRoutingLine."Starting Date" := CalendarEntry.Date;
                                        UpdateDates := FALSE
                                    END;
                                    StartTime := EndTime;
                                END;
                            END;
                            IF NextProdOrderCapNeed."Ending Time" > StartTime THEN
                                StartTime := NextProdOrderCapNeed."Ending Time"
                        UNTIL (NextProdOrderCapNeed.NEXT = 0) OR (RemainNeedQty = 0) OR (AvailCap = 0);

                    IF (AvailCap > 0) AND (RemainNeedQty > 0) THEN BEGIN
                        AvailTime := Min(CalendarMgt.CalcTimeDelta(CalendarEntry."Ending Time", StartTime), AvailCap);
                        IF AvailTime > 0 THEN BEGIN
                            UpdateTimesForward(AvailTime, AvailCap, TimetoProgram, StartTime, EndTime);
                            IF EndTime > CalendarEntry."Ending Time" THEN
                                EndTime := CalendarEntry."Ending Time";
                            IF TimetoProgram <> 0 THEN
                                CreateCapNeed(CalendarEntry.Date, StartTime, EndTime, TimetoProgram, TimeType, 0);
                            IF FirstInBatch AND FirstEntry THEN BEGIN
                                FirstInBatch := FALSE;
                                FirstEntry := FALSE
                            END;
                            IF UpdateDates THEN BEGIN
                                ProdOrderRoutingLine."Starting Time" := StartTime;
                                ProdOrderRoutingLine."Starting Date" := CalendarEntry.Date;
                                UpdateDates := FALSE
                            END;
                            StartTime := EndTime;
                        END;
                    END;
                END;
                IF RemainNeedQty > 0 THEN BEGIN
                    IF CalendarEntry.NEXT = 0 THEN BEGIN
                        TestForError(Text003, Text004, CalendarEntry.Date);
                        EXIT;
                    END;
                    StartTime := CalendarEntry."Starting Time";
                END ELSE BEGIN
                    ProdStartingTime := EndTime;
                    ProdStartingDate := CalendarEntry.Date;
                    ProdOrderRoutingLine."Ending Time" := EndTime;
                    ProdOrderRoutingLine."Ending Date" := CalendarEntry.Date;
                    EXIT;
                END;
            UNTIL FALSE;
    end;

    (54056)]
    local procedure CalculateDailyLoad(var AvailCap: Decimal; var DampTime: Decimal; ConstrainedCapacity: Record "Capacity Constrained Resource"; IsResourceConstrained: Boolean; ParentWorkCenter: Record "Capacity Constrained Resource"; IsParentConstrained: Boolean);
    var
        CurrentLoadBase: Decimal;
        AvailCapWorkCenter: Decimal;
        DampTimeWorkCenter: Decimal;
        CapEffectiveBase: Decimal;
    begin
        GetCurrentWorkCenterTimeFactorAndRounding(Workcenter."No.");
        IF (CalendarEntry."Capacity Type" = CalendarEntry."Capacity Type"::"Work Center") OR
           ((CalendarEntry."Capacity Type" = CalendarEntry."Capacity Type"::"Machine Center") AND
            (IsResourceConstrained XOR IsParentConstrained))
        THEN BEGIN
            WITH ConstrainedCapacity DO BEGIN
                IF IsParentConstrained THEN BEGIN
                    ConstrainedCapacity := ParentWorkCenter;
                    CalcCapConResWorkCenterLoadBase(ConstrainedCapacity, CalendarEntry.Date, CapEffectiveBase, CurrentLoadBase)
                END ELSE
                    CalcCapConResProdOrderNeedBase(ConstrainedCapacity, CalendarEntry.Date, CapEffectiveBase, CurrentLoadBase);
                CalcAvailCapBaseAndDampTime(
                  ConstrainedCapacity, AvailCap, DampTime, CapEffectiveBase, CurrentLoadBase, CurrentTimeFactor, CurrentRounding);
            END;
        END ELSE BEGIN
            CalcCapConResProdOrderNeedBase(ConstrainedCapacity, CalendarEntry.Date, CapEffectiveBase, CurrentLoadBase);
            CalcAvailCapBaseAndDampTime(
              ConstrainedCapacity, AvailCap, DampTime, CapEffectiveBase, CurrentLoadBase, CurrentTimeFactor, CurrentRounding);

            CalcCapConResWorkCenterLoadBase(ParentWorkCenter, CalendarEntry.Date, CapEffectiveBase, CurrentLoadBase);
            CalcAvailCapBaseAndDampTime(
              ParentWorkCenter, AvailCapWorkCenter, DampTimeWorkCenter, CapEffectiveBase, CurrentLoadBase, CurrentTimeFactor, CurrentRounding);

            IF AvailCap + DampTime > AvailCapWorkCenter + DampTimeWorkCenter THEN
                DampTime := DampTimeWorkCenter
            ELSE
                IF AvailCap + DampTime = AvailCapWorkCenter + DampTimeWorkCenter THEN
                    DampTime := Max(DampTime, DampTimeWorkCenter);
            AvailCap := ROUND(Min(AvailCap, AvailCapWorkCenter), 1);
        END;
    end;

    (54088)]
    local procedure UpdateTimesBack(var AvailTime: Decimal; var AvailCap: Decimal; var TimetoProgram: Decimal; var StartTime: Time; EndTime: Time);
    var
        RoundedTimetoProgram: Decimal;
    begin
        AvailTime :=
          ROUND(AvailTime / CalendarMgt.TimeFactor(Workcenter."Unit of Measure Code") *
            CalendarEntry.Efficiency / 100 * ConCurrCap, Workcenter."Calendar Rounding Precision");
        TimetoProgram := Min(RemainNeedQty, AvailTime);
        RoundedTimetoProgram :=
          ROUND(TimetoProgram *
            CalendarMgt.TimeFactor(Workcenter."Unit of Measure Code") *
            100 / CalendarEntry.Efficiency / ConCurrCap, 1, '>');
        StartTime := CalendarMgt.CalcTimeSubtract(EndTime, RoundedTimetoProgram);
        RemainNeedQty := RemainNeedQty - TimetoProgram;
        IF ProdOrderRoutingLine.Status <> ProdOrderRoutingLine.Status::Simulated THEN
            AvailCap := AvailCap - RoundedTimetoProgram;
    end;

    (54102)]
    local procedure UpdateTimesForward(var AvailTime: Decimal; var AvailCap: Decimal; var TimetoProgram: Decimal; StartTime: Time; var EndTime: Time);
    var
        RoundedTimetoProgram: Decimal;
    begin
        AvailTime :=
          ROUND(AvailTime / CalendarMgt.TimeFactor(Workcenter."Unit of Measure Code") *
            CalendarEntry.Efficiency / 100 * ConCurrCap, Workcenter."Calendar Rounding Precision");
        TimetoProgram := Min(RemainNeedQty, AvailTime);
        RoundedTimetoProgram :=
          ROUND(TimetoProgram *
            CalendarMgt.TimeFactor(Workcenter."Unit of Measure Code") *
            100 / CalendarEntry.Efficiency / ConCurrCap, 1, '>');
        EndTime := StartTime + RoundedTimetoProgram;
        RemainNeedQty := RemainNeedQty - TimetoProgram;
        IF ProdOrderRoutingLine.Status <> ProdOrderRoutingLine.Status::Simulated THEN
            AvailCap := AvailCap - RoundedTimetoProgram;
    end;

    (54116)]
    local procedure "Min"(Number1: Decimal; Number2: Decimal): Decimal;
    begin
        IF Number1 <= Number2 THEN
            EXIT(Number1);

        EXIT(Number2);
    end;

    (54122)]
    local procedure "Max"(Number1: Decimal; Number2: Decimal): Decimal;
    begin
        IF Number1 >= Number2 THEN
            EXIT(Number1);

        EXIT(Number2);
    end;

    (54128)]
    local procedure CalcExpectedCost(var ProdOrderRoutingLine: Record "Prod. Order Routing Line"; TotalQtyPerOperation: Decimal; TotalCapacityPerOperation: Decimal);
    begin
        IF ProdOrderRoutingLine."Unit Cost Calculation" = ProdOrderRoutingLine."Unit Cost Calculation"::Time THEN BEGIN
            ProdOrderRoutingLine."Expected Operation Cost Amt." :=
              TotalCapacityPerOperation * ProdOrderRoutingLine."Unit Cost per";
            ProdOrderRoutingLine."Expected Capacity Ovhd. Cost" :=
              TotalCapacityPerOperation *
              (ProdOrderRoutingLine."Direct Unit Cost" *
               ProdOrderRoutingLine."Indirect Cost %" / 100 + ProdOrderRoutingLine."Overhead Rate");
        END ELSE BEGIN
            ProdOrderRoutingLine."Expected Operation Cost Amt." :=
              TotalQtyPerOperation * ProdOrderRoutingLine."Unit Cost per";
            ProdOrderRoutingLine."Expected Capacity Ovhd. Cost" :=
              TotalQtyPerOperation *
              (ProdOrderRoutingLine."Direct Unit Cost" *
               ProdOrderRoutingLine."Indirect Cost %" / 100 + ProdOrderRoutingLine."Overhead Rate");
        END;
    end;

    (54145)]
    local procedure CalcDuration(DateTime1: DateTime; DateTime2: DateTime) TotalDuration: Decimal;
    begin
        TotalDuration :=
          ROUND(
            (DT2DATE(DateTime2) - DT2DATE(DateTime1)) * (86400000 / CalendarMgt.TimeFactor(Workcenter."Unit of Measure Code")) +
            (DT2TIME(DateTime2) - DT2TIME(DateTime1)) / CalendarMgt.TimeFactor(Workcenter."Unit of Measure Code"),
            Workcenter."Calendar Rounding Precision");
        EXIT(TotalDuration);
    end;

    (54153)]
    local procedure FindSendAheadEndingTime(var TmpProdOrderRtngLine: Record "Prod. Order Routing Line"; var TmpProdOrderCapNeed: Record "Prod. Order Capacity Need"; var SendAheadLotSize: Decimal): Boolean;
    var
        Result: Boolean;
        xTotalLotSize: Decimal;
        xSendAheadLotSize: Decimal;
        FirstLine: Boolean;
    begin
        xTotalLotSize := TotalLotSize;
        xSendAheadLotSize := SendAheadLotSize;
        IF TmpProdOrderRtngLine.FINDSET THEN BEGIN
            REPEAT
                FirstLine := TRUE;
                TotalLotSize := xTotalLotSize;
                SendAheadLotSize := xSendAheadLotSize;
                TmpProdOrderCapNeed.RESET;
                TmpProdOrderCapNeed.SETCURRENTKEY(Status, "Prod. Order No.", "Routing Reference No.", "Operation No.", Date, "Starting Time");
                TmpProdOrderCapNeed.SETRANGE(Status, TmpProdOrderRtngLine.Status);
                TmpProdOrderCapNeed.SETRANGE("Prod. Order No.", TmpProdOrderRtngLine."Prod. Order No.");
                TmpProdOrderCapNeed.SETRANGE("Requested Only", FALSE);
                TmpProdOrderCapNeed.SETRANGE("Routing No.", TmpProdOrderRtngLine."Routing No.");
                TmpProdOrderCapNeed.SETRANGE("Routing Reference No.", TmpProdOrderRtngLine."Routing Reference No.");
                TmpProdOrderCapNeed.SETRANGE("Operation No.", TmpProdOrderRtngLine."Operation No.");
                IF TmpProdOrderCapNeed.FINDFIRST THEN BEGIN
                    ProdOrderCapNeed2.COPY(TmpProdOrderCapNeed);
                    TmpProdOrderCapNeed.DELETE;
                    FirstLine := FALSE;
                END;

                Result := Result OR GetSendAheadEndingTime(TmpProdOrderRtngLine, FirstLine, SendAheadLotSize);
                TmpProdOrderCapNeed := ProdOrderCapNeed2;
                IF TmpProdOrderRtngLine."Operation No." = TmpProdOrderCapNeed."Operation No." THEN
                    TmpProdOrderCapNeed.INSERT;

                SetMaxDateTime(ProdStartingDate, ProdStartingTime, ProdEndingDate, ProdEndingTime);
            UNTIL TmpProdOrderRtngLine.NEXT = 0;
        END ELSE
            Result := GetSendAheadEndingTime(TmpProdOrderRtngLine, FALSE, SendAheadLotSize);

        EXIT(Result);
    end;

    (54187)]
    local procedure FindSendAheadStartingTime(var TmpProdOrderRtngLine: Record "Prod. Order Routing Line"; var TmpProdOrderCapNeed: Record "Prod. Order Capacity Need"; var SendAheadLotSize: Decimal; var DeltaTotal: BigInteger): Boolean;
    var
        Result: Boolean;
        xTotalLotSize: Decimal;
        xSendAheadLotSize: Decimal;
        FirstLine: Boolean;
    begin
        CLEAR(DeltaTotal);
        xTotalLotSize := TotalLotSize;
        xSendAheadLotSize := SendAheadLotSize;
        IF TmpProdOrderRtngLine.FINDSET THEN BEGIN
            REPEAT
                FirstLine := TRUE;
                TotalLotSize := xTotalLotSize;
                SendAheadLotSize := xSendAheadLotSize;
                TmpProdOrderCapNeed.RESET;
                TmpProdOrderCapNeed.SETCURRENTKEY(Status, "Prod. Order No.", "Routing Reference No.", "Operation No.", Date, "Starting Time");
                TmpProdOrderCapNeed.SETRANGE(Status, TmpProdOrderRtngLine.Status);
                TmpProdOrderCapNeed.SETRANGE("Prod. Order No.", TmpProdOrderRtngLine."Prod. Order No.");
                TmpProdOrderCapNeed.SETRANGE("Requested Only", FALSE);
                TmpProdOrderCapNeed.SETRANGE("Routing No.", TmpProdOrderRtngLine."Routing No.");
                TmpProdOrderCapNeed.SETRANGE("Routing Reference No.", TmpProdOrderRtngLine."Routing Reference No.");
                TmpProdOrderCapNeed.SETRANGE("Operation No.", TmpProdOrderRtngLine."Operation No.");
                IF TmpProdOrderCapNeed.FINDFIRST THEN BEGIN
                    ProdOrderCapNeed2.COPY(TmpProdOrderCapNeed);
                    TmpProdOrderCapNeed.DELETE;
                    FirstLine := FALSE;
                END;

                Result := Result OR GetSendAheadStartingTime(TmpProdOrderRtngLine, FirstLine, SendAheadLotSize, DeltaTotal);
                TmpProdOrderCapNeed := ProdOrderCapNeed2;
                IF TmpProdOrderRtngLine."Operation No." = TmpProdOrderCapNeed."Operation No." THEN
                    TmpProdOrderCapNeed.INSERT;

                SetMinDateTime(ProdEndingDate, ProdEndingTime, ProdStartingDate, ProdStartingTime);
            UNTIL TmpProdOrderRtngLine.NEXT = 0;
        END ELSE
            Result := GetSendAheadStartingTime(TmpProdOrderRtngLine, FALSE, SendAheadLotSize, DeltaTotal);

        EXIT(Result);
    end;

    (54222)]
    procedure ReturnNextCalendarEntry(var CalendarEntry2: Record "Calendar Entry"; OldCalendarEntry: Record "Calendar Entry"; Direction: Option Backward,Forward);
    begin
        CalendarEntry2 := OldCalendarEntry;
        CalendarEntry2.SETRANGE(Date, CalendarEntry2.Date);

        IF Direction = Direction::Backward THEN BEGIN
            CalendarEntry2.FIND('-');           // rewind within the same day
            CalendarEntry2.SETRANGE(Date);
            IF CalendarEntry2.NEXT(-1) = 0 THEN
                TestForError(Text001, Text002, CalendarEntry2.Date);

            IF (CalendarEntry2.Date + 1) < OldCalendarEntry.Date THEN BEGIN
                CalendarEntry2.Date := OldCalendarEntry.Date - 1;
                CreateCalendarEntry(CalendarEntry2);
            END;
        END ELSE BEGIN
            CalendarEntry2.FIND('+');            // rewind within the same day
            CalendarEntry2.SETRANGE(Date);
            IF CalendarEntry2.NEXT = 0 THEN
                TestForError(Text003, Text004, CalendarEntry2.Date);

            IF OldCalendarEntry.Date < (CalendarEntry2.Date - 1) THEN BEGIN
                CalendarEntry2.Date := OldCalendarEntry.Date + 1;
                CreateCalendarEntry(CalendarEntry2);
            END;
        END;
    end;

    (54248)]
    local procedure CreateCalendarEntry(var CalendarEntry2: Record "Calendar Entry");
    begin
        WITH CalendarEntry2 DO BEGIN
            "Ending Time" := 000000T;
            "Starting Time" := 000000T;
            Efficiency := 100;
            "Absence Capacity" := 0;
            "Capacity (Total)" := 0;
            "Capacity (Effective)" := "Capacity (Total)";
            "Starting Date-Time" := CREATEDATETIME(Date, "Starting Time");
            "Ending Date-Time" := "Starting Date-Time" + 86400000;
            IF NOT GET("Capacity Type", "No.", Date, "Starting Time", "Ending Time", "Work Shift Code") THEN
                INSERT;
        END;
    end;

    (54262)]
    local procedure GetCurrentWorkCenterTimeFactorAndRounding(WorkCenterNo: Code[20]);
    var
        WorkCenter: Record "Work Center";
    begin
        IF CurrentWorkCenterNo = WorkCenterNo THEN
            EXIT;

        WorkCenter.GET(WorkCenterNo);
        CurrentTimeFactor := CalendarMgt.TimeFactor(WorkCenter."Unit of Measure Code");
        CurrentRounding := WorkCenter."Calendar Rounding Precision";
    end;

    (54270)]
    local procedure CalcCapConResWorkCenterLoadBase(CapacityConstrainedResource: Record "Capacity Constrained Resource"; DateFilter: Date; var CapEffectiveBase: Decimal; var LoadBase: Decimal);
    begin
        CapEffectiveBase := 0;
        LoadBase := 0;

        WITH CapacityConstrainedResource DO BEGIN
            SETRANGE("Date Filter", DateFilter);
            CALCFIELDS("Capacity (Effective)", "Work Center Load Qty.");
            IF "Capacity (Effective)" <> 0 THEN BEGIN
                CapEffectiveBase := ROUND("Capacity (Effective)" * CurrentTimeFactor, CurrentRounding);
                LoadBase := ROUND("Work Center Load Qty." * CurrentTimeFactor, CurrentRounding);
            END;
        END;
    end;

    (54283)]
    local procedure CalcCapConResProdOrderNeedBase(CapacityConstrainedResource: Record "Capacity Constrained Resource"; DateFilter: Date; var CapEffectiveBase: Decimal; var LoadBase: Decimal);
    begin
        CapEffectiveBase := 0;
        LoadBase := 0;

        WITH CapacityConstrainedResource DO BEGIN
            SETRANGE("Date Filter", DateFilter);
            CALCFIELDS("Capacity (Effective)", "Prod. Order Need Qty.");
            IF "Capacity (Effective)" <> 0 THEN BEGIN
                CapEffectiveBase := ROUND("Capacity (Effective)" * CurrentTimeFactor, CurrentRounding);
                LoadBase := ROUND("Prod. Order Need Qty." * CurrentTimeFactor, CurrentRounding);
            END;
        END;
    end;

    (54296)]
    procedure CalcAvailCapBaseAndDampTime(CapacityConstrainedResource: Record "Capacity Constrained Resource"; var AvailCap: Decimal; var DampTime: Decimal; CapEffectiveBase: Decimal; LoadBase: Decimal; TimeFactor: Decimal; Rounding: Decimal);
    var
        AvailCapBase: Decimal;
        AvailCapBaseMax: Decimal;
        LoadPct: Decimal;
        DampenerPct: Decimal;
        CriticalLoadPct: Decimal;
    begin
        AvailCap := 0;
        DampTime := 0;

        IF CapEffectiveBase = 0 THEN
            EXIT;

        CriticalLoadPct := CapacityConstrainedResource."Critical Load %";
        AvailCapBaseMax := ROUND(CapEffectiveBase * CriticalLoadPct / 100, Rounding);
        AvailCapBase := Max(0, AvailCapBaseMax - LoadBase);
        AvailCap := ROUND(AvailCapBase / TimeFactor, Rounding);

        LoadPct := ROUND(LoadBase / CapEffectiveBase * 100, Rounding);
        DampenerPct := CapacityConstrainedResource."Dampener (% of Total Capacity)";
        DampTime :=
          ROUND(CapEffectiveBase / TimeFactor * Min(DampenerPct, CriticalLoadPct + DampenerPct - LoadPct) / 100, Rounding);
        DampTime := ROUND(Max(0, DampTime), 1);
    end;

    (54314)]
    procedure CalcAvailQtyBase(var CalendarEntry: Record "Calendar Entry"; ProdStartDate: Date; ProdStartTime: Time; TimeType: Option "Setup Time","Run Time","Wait Time","Move Time","Queue Time"; ConCurrCap: Decimal; IsForward: Boolean; TimeFactor: Decimal; Rounding: Decimal) AvQtyBase: Decimal;
    var
        CalendarStartTime: Time;
        CalendarEndTime: Time;
        CalcFactor: Integer;
        ModifyCalendar: Boolean;
    begin
        IF IsForward THEN BEGIN
            CalendarStartTime := CalendarEntry."Starting Time";
            CalendarEndTime := CalendarEntry."Ending Time";
            CalcFactor := -1
        END ELSE BEGIN
            CalendarStartTime := CalendarEntry."Ending Time";
            CalendarEndTime := CalendarEntry."Starting Time";
            CalcFactor := 1;
        END;
        ModifyCalendar := FALSE;

        IF (((CalendarStartTime < ProdStartTime) AND IsForward) OR
            ((CalendarStartTime > ProdStartTime) AND NOT IsForward)) AND
           (CalendarEntry.Date = ProdStartDate)
        THEN BEGIN
            CASE TimeType OF
                TimeType::"Setup Time",
              TimeType::"Run Time":
                    AvQtyBase :=
                      ROUND(
                        ABS(CalendarEndTime - ProdStartTime) *
                        CalendarEntry.Efficiency / 100 * ConCurrCap, Rounding);
                TimeType::"Move Time",
              TimeType::"Queue Time":
                    AvQtyBase :=
                      ROUND(
                        ABS(CalendarEndTime - ProdStartTime) *
                        ConCurrCap, Rounding);
                TimeType::"Wait Time":
                    BEGIN
                        AvQtyBase := CalcAvailQtyBaseForWaitTime(ProdStartTime, ProdStartDate, CalendarEntry.Date, CalcFactor, IsForward);
                        AvQtyBase := ROUND(AvQtyBase * ConCurrCap, Rounding);
                    END;
            END;
            ModifyCalendar := TRUE;
        END ELSE
            IF (CalendarEntry.Capacity = CalendarEntry."Absence Capacity") AND
               (TimeType <> TimeType::"Wait Time")
            THEN
                AvQtyBase := 0
            ELSE
                CASE TimeType OF
                    TimeType::"Setup Time",
                  TimeType::"Run Time":
                        AvQtyBase :=
                          ROUND(
                            TimeFactor * CalendarEntry."Capacity (Effective)" /
                            (CalendarEntry.Capacity - CalendarEntry."Absence Capacity") * ConCurrCap,
                            Rounding);
                    TimeType::"Move Time",
                  TimeType::"Queue Time":
                        AvQtyBase :=
                          ROUND(
                            TimeFactor * CalendarEntry."Capacity (Total)" /
                            (CalendarEntry.Capacity - CalendarEntry."Absence Capacity") * ConCurrCap,
                            Rounding);
                    TimeType::"Wait Time":
                        BEGIN
                            AvQtyBase := CalcAvailQtyBaseForWaitTime(ProdStartTime, ProdStartDate, CalendarEntry.Date, CalcFactor, IsForward);
                            AvQtyBase := ROUND(AvQtyBase * ConCurrCap, Rounding);
                            ModifyCalendar := TRUE;
                        END;
                END;

        IF ModifyCalendar THEN
            IF IsForward THEN
                CalendarEntry."Starting Time" := ProdStartTime
            ELSE
                CalendarEntry."Ending Time" := ProdStartTime;
    end;

    (54385)]
    local procedure CalcAvailQtyBaseForWaitTime(ProdStartTime: Time; ProdStartDate: Date; CalendarEntryDate: Date; CalcFactor: Integer; IsForward: Boolean): Decimal;
    begin
        IF (ProdStartTime = 000000T) AND ((CalendarEntryDate <> ProdStartDate) OR IsForward) THEN
            EXIT(86400000);
        EXIT((86400000 + (ProdStartTime - 000000T) * CalcFactor) MOD 86400000);
    end;

    (54390)]
    local procedure SetMaxDateTime(var ResultingDate: Date; var ResultingTime: Time; DateToCompare: Date; TimeToCompare: Time);
    begin
        IF ((ResultingDate = DateToCompare) AND (ResultingTime >= TimeToCompare)) OR
           (ResultingDate > DateToCompare)
        THEN
            EXIT;
        ResultingDate := DateToCompare;
        ResultingTime := TimeToCompare;
    end;

    (54398)]
    local procedure SetMinDateTime(var ResultingDate: Date; var ResultingTime: Time; DateToCompare: Date; TimeToCompare: Time);
    begin
        IF ((ResultingDate = DateToCompare) AND (ResultingTime <= TimeToCompare)) OR
           (ResultingDate < DateToCompare)
        THEN
            EXIT;
        ResultingDate := DateToCompare;
        ResultingTime := TimeToCompare
    end;
}

