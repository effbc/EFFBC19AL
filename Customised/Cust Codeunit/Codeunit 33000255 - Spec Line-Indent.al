codeunit 33000255 "Spec Line-Indent"
{
    // version QC1.0

    TableNo = "Specification Header";

    trigger OnRun();
    begin
        IF NOT AutoIndent THEN
            IF NOT
              CONFIRM(
                STRSUBSTNO(
                  Text000 +
                  Text001 +
                  Text003, "Spec ID"), TRUE)
             THEN
                EXIT;

        SpecLine.SETRANGE("Spec ID", "Spec ID");
        //Hot Fix 1.0
        SpecLine.SETRANGE("Version Code", '');
        //Hot Fix 1.0
        Indent;
    end;

    var
        Text000: Label '"This function updates the indentation of all the characters for specification %1. "';
        Text001: Label '"All characters between a Begin and the matching End are indented by one level. "';
        Text003: Label 'Do you want to indent the characters?';
        Text004: Label 'Indenting characters @1@@@@@@@@@@@@@@@@@@';
        Text005: Label 'End %1 is missing a matching Begin.';
        SpecLine: Record "Specification Line";
        Window: Dialog;
        DimValCode: array[10] of Code[20];
        i: Integer;
        AutoIndent: Boolean;

    (51074)]
    procedure Indent();
    var
        NoOfChars: Integer;
        Progress: Integer;
    begin
        Window.OPEN(Text004);

        NoOfChars := SpecLine.COUNTAPPROX;
        IF NoOfChars = 0 THEN
            NoOfChars := 1;
        WITH SpecLine DO
            IF FINDFIRST THEN
                REPEAT
                    Progress := Progress + 1;
                    Window.UPDATE(1, 10000 * Progress DIV NoOfChars);

                    IF "Character Type" = "Character Type"::"End" THEN BEGIN
                        IF i < 1 THEN
                            ERROR(
                              Text005,
                              "Character Code");
                        i := i - 1;
                    END;

                    Indentation := i;
                    MODIFY;

                    IF "Character Type" = "Character Type"::"Begin" THEN
                        i := i + 1;
                UNTIL NEXT = 0;

        Window.CLOSE;
    end;

    (51103)]
    procedure ChangeStatus();
    begin
        AutoIndent := TRUE;
    end;

    (51106)]
    procedure IndentSpecVersion(SpecVersion: Record "Specification Version");
    begin
        IF NOT AutoIndent THEN
            IF NOT
              CONFIRM(
                STRSUBSTNO(
                  Text000 +
                  Text001 +
                  Text003, SpecVersion."Specification No."), TRUE)
             THEN
                EXIT;

        SpecLine.SETRANGE("Spec ID", SpecVersion."Specification No.");
        SpecLine.SETRANGE("Version Code", SpecVersion."Version Code");
        Indent;
    end;
}

