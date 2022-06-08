report 50122 "updating of receipt date"
{
    DefaultLayout = RDLC;
    RDLCLayout = './updating of receipt date.rdlc';

    dataset
    {
        dataitem("Purchase Line"; "Purchase Line")
        {
            column(Purchase_Line_Period; Period)
            {
            }
            column(Purchase_Line_Document_Type; "Document Type")
            {
            }
            column(Purchase_Line_Document_No_; "Document No.")
            {
            }
            column(Purchase_Line_Line_No_; "Line No.")
            {
            }

            trigger OnPreDataItem();
            begin
                //"Purchase Line".MODIFY;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        periodNo1: Integer;
        periodDay: Integer;
        periodMonth: Integer;
        periodYear: Integer;
        acctYearMonth: Integer;
        MonthDays: Integer;
        cDay1: Integer;
        cDay2: Integer;
        cDay3: Integer;
        cDay4: Integer;
        cDay5: Integer;

    (7152)]
    procedure Getperiod(var perioddate: Date) periodnumber: Integer;
    var
        periodNo1: Integer;
        periodDay: Integer;
        periodMonth: Integer;
        periodYear: Integer;
        acctYearMonth: Integer;
        MonthDays: Integer;
        cDay1: Integer;
        cDay2: Integer;
        cDay3: Integer;
        cDay4: Integer;
        cDay5: Integer;
    begin
        periodDay := DATE2DMY(perioddate, 1);
        periodMonth := DATE2DMY(perioddate, 2);
        periodYear := DATE2DMY(perioddate, 3);
        MonthDays := DATE2DMY(CALCDATE('CM', perioddate), 1);
        cDay1 := 1;
        cDay2 := 8;
        cDay3 := 16;
        cDay4 := 23;
        cDay5 := 24;
        IF periodDay < cDay2 THEN
            periodNo1 := 1
        ELSE
            IF (periodDay >= cDay2) AND (periodDay < cDay3) THEN BEGIN
                periodNo1 := 2
            END ELSE BEGIN
                IF MonthDays = 31 THEN BEGIN
                    IF (periodDay >= cDay3) AND (periodDay < cDay5) THEN
                        periodNo1 := 3
                    ELSE
                        periodNo1 := 4;
                END ELSE BEGIN
                    IF (periodDay >= cDay3) AND (periodDay < cDay4) THEN
                        periodNo1 := 3
                    ELSE
                        periodNo1 := 4;
                END;
            END;
        IF periodMonth < 4 THEN
            acctYearMonth := periodMonth + 9
        ELSE
            acctYearMonth := periodMonth - 3;
        periodnumber := (acctYearMonth * 4) - 4 + periodNo1;
    end;
}

