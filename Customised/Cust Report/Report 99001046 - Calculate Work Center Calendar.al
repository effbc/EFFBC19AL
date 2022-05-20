report 99001046 "Calculate Work Center Calendar"
{
    // version NAVW17.00

    CaptionML = ENU='Calculate Work Center Calendar',
                ENN='Calculate Work Center Calendar';
    ProcessingOnly = true;

    dataset
    {
        dataitem("Work Center";"Work Center")
        {
            DataItemTableView = SORTING(No.);
            RequestFilterFields = "No.";

            trigger OnAfterGetRecord();
            begin
                Window.UPDATE(1,"No.");

                TESTFIELD(Efficiency);

                Calendar.RESET;
                Calendar.SETRANGE("Capacity Type",Calendar."Capacity Type"::"Work Center");
                Calendar.SETRANGE("No.","No.");
                Calendar.SETRANGE(Date,StartingDate,EndingDate);
                Calendar.DELETEALL;

                IF "Consolidated Calendar" THEN BEGIN
                  Calendar.SETRANGE("No.");
                  Calendar.SETCURRENTKEY("Work Center No.",Date);
                  Calendar.SETRANGE("Work Center No.","No.");
                  Calendar.SETRANGE("Capacity Type",Calendar."Capacity Type"::"Machine Center");
                  IF Calendar.FIND('-') THEN
                    REPEAT
                      TempCalendar.INIT;
                      TempCalendar."Capacity Type" := Calendar."Capacity Type"::"Work Center";
                      TempCalendar."No." := "No.";
                      TempCalendar."Work Center No." := "No.";
                      TempCalendar.Date := Calendar.Date;
                      TempCalendar."Starting Time" := Calendar."Starting Time";
                      IF TempCalendar.INSERT THEN;
                      TempCalendar."Starting Time" := Calendar."Ending Time";
                      IF TempCalendar.INSERT THEN;
                    UNTIL Calendar.NEXT = 0;

                  Calendar.RESET;
                  Calendar.SETCURRENTKEY("Work Center No.",Date);
                  Calendar.SETRANGE("Capacity Type",Calendar."Capacity Type"::"Machine Center");
                  Calendar.SETRANGE("Work Center No.","No.");
                  TempCalendar.SETRANGE("Work Center No.","No.");
                  IF TempCalendar.FIND('-') THEN
                    REPEAT
                      CLEAR(LastTime);
                      TempCalendar.SETRANGE(Date,TempCalendar.Date);
                      Calendar.SETRANGE(Date,TempCalendar.Date);
                      IF TempCalendar.FIND('-') THEN
                        REPEAT
                          IF LastTime = 0T THEN
                            LastTime := TempCalendar."Starting Time"
                          ELSE BEGIN
                            Calendar.SETFILTER("Starting Time",'<=%1',LastTime);
                            Calendar.SETFILTER("Ending Time",'>%1',LastTime);
                            IF Calendar.FIND('-') THEN BEGIN
                              Calendar2 := TempCalendar;
                              Calendar2."Work Shift Code" := '';
                              Calendar2."Starting Time" := LastTime;
                              Calendar2.VALIDATE("Ending Time",TempCalendar."Starting Time");
                              Calendar2.VALIDATE("No.");
                              Calendar2.Capacity := 0;
                              REPEAT
                                Calendar2.Capacity := Calendar2.Capacity + (Calendar.Capacity - Calendar."Absence Capacity") *
                                  Calendar.Efficiency / 100;
                              UNTIL Calendar.NEXT = 0;
                              IF Calendar2.Capacity <> 0 THEN BEGIN
                                Calendar2.VALIDATE(Capacity);
                                Calendar2.INSERT;
                              END;
                            END;
                            LastTime := TempCalendar."Starting Time";
                          END;
                        UNTIL TempCalendar.NEXT = 0;
                      TempCalendar.SETRANGE(Date);
                    UNTIL TempCalendar.NEXT = 0;
                END ELSE BEGIN
                  TESTFIELD(Capacity);
                  TESTFIELD("Unit of Measure Code");

                  CalendarMgt.CalculateSchedule(
                    0,
                    "No.",
                    "No.",
                    StartingDate,
                    EndingDate);
                END;
            end;

            trigger OnPreDataItem();
            begin
                IF StartingDate = 0D THEN
                  ERROR(Text004);

                IF EndingDate = 0D THEN
                  ERROR(Text005);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    CaptionML = ENU='Options',
                                ENN='Options';
                    field(StartingDate;StartingDate)
                    {
                        CaptionML = ENU='Starting Date',
                                    ENN='Starting Date';
                    }
                    field(EndingDate;EndingDate)
                    {
                        CaptionML = ENU='Ending Date',
                                    ENN='Ending Date';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit();
        begin
            IF StartingDate = 0D THEN
              StartingDate := DMY2DATE(1,1,DATE2DMY(WORKDATE,3));
            IF EndingDate = 0D THEN
              EndingDate := DMY2DATE(31,12,DATE2DMY(WORKDATE,3));
        end;
    }

    labels
    {
    }

    trigger OnPreReport();
    begin
        Window.OPEN(
          Text000 +
          Text001);
    end;

    var
        Text000 : TextConst ENU='Calculating Work Centers...\\',ENN='Calculating Work Centers...\\';
        Text001 : TextConst ENU='No.            #1##########',ENN='No.            #1##########';
        Text004 : TextConst ENU='You must fill in the starting date field.',ENN='You must fill in the starting date field.';
        Text005 : TextConst ENU='You must fill in the ending date field.',ENN='You must fill in the ending date field.';
        Calendar : Record "Calendar Entry";
        Calendar2 : Record "Calendar Entry";
        TempCalendar : Record "Calendar Entry" temporary;
        CalendarMgt : Codeunit CalendarManagement;
        Window : Dialog;
        StartingDate : Date;
        EndingDate : Date;
        LastTime : Time;

    [LineStart(23137)]
    procedure InitializeRequest(NewStartingDate : Date;NewEndingDate : Date);
    begin
        StartingDate := NewStartingDate;
        EndingDate := NewEndingDate;
    end;
}

