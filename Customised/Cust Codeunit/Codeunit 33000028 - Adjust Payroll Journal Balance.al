codeunit 33000028 "Adjust Payroll Journal Balance"
{
    // version NEOGYNPAY13.70.00.07,DIM1.0

    // Project : EFFTRONICS
    // *************************************************************************************************************************
    // SIGN Name
    // ************************************************************************************************************************
    // DIM : Resolution of Dimension Issues after Upgarding.
    // ***********************************************************************************************************************
    // Version  sign     Date       USERID    Description
    // *************************************************************************************************************************
    // 1.0      DIM      28-May-13  SAIRAM    New Code has been added for the dimensions updation after upgarding.

    TableNo = "Payroll Journal Line";

    trigger OnRun();
    var
        PayJnlLine: Record "Payroll Journal Line";
        PrevPayJnlLine: Record "Payroll Journal Line";
        CorrectionEntry: Boolean;
        TotalAmountLCY: Decimal;
    begin
        TempCurrTotalBuffer.DELETEALL;
        PayJnlLine.SETRANGE("Pay Journal Template", "Pay Journal Template");
        PayJnlLine.SETRANGE("Pay Journal Batch", "Pay Journal Batch");

        //DIM1.0 Start
        //Code Commented
        /*
        TempJnlLineDim[1].RESET;
        TempJnlLineDim[1].DELETEALL;
        JnlLineDim.SETRANGE("Table ID",DATABASE::"Payroll Journal Line");
        JnlLineDim.SETRANGE("Journal Template Name","Pay Journal Template");
        JnlLineDim.SETRANGE("Journal Batch Name","Pay Journal Batch");
        */
        //DIM1.0 End

        WITH PayJnlLine DO BEGIN
            IF NOT FIND('-') THEN
                EXIT;
            PrevPayJnlLine := PayJnlLine;
            CorrectionEntry := TRUE;
            REPEAT
                //DIM1.0 Start
                //Code Commented
                /*
                JnlLineDim.SETRANGE("Journal Line No.",PayJnlLine."Line No.");
                DimMgt.CopyJnlLineDimToJnlLineDim(JnlLineDim,TempJnlLineDim[1]);
                */
                //DIM1.0 End

                IF ("Posting Date" <> PrevPayJnlLine."Posting Date") OR
                   ("Document No." <> PrevPayJnlLine."Document No.")
                THEN BEGIN
                    IF CheckCurrBalance AND (TotalAmountLCY <> 0) THEN BEGIN
                        PrevPayJnlLine.Correction := CorrectionEntry;
                        InsertCorrectionLines(PayJnlLine, PrevPayJnlLine);
                    END;
                    TotalAmountLCY := 0;
                    TempCurrTotalBuffer.DELETEALL;
                    CorrectionEntry := TRUE;
                    PrevPayJnlLine := PayJnlLine;
                END;
                TotalAmountLCY := TotalAmountLCY + "Amount (LCY)";
                IF "Bal. Account No." = '' THEN BEGIN
                    IF TempCurrTotalBuffer.GET("Currency Code") THEN BEGIN
                        TempCurrTotalBuffer."Total Amount" := TempCurrTotalBuffer."Total Amount" + Amount;
                        TempCurrTotalBuffer."Total Amount (LCY)" := TempCurrTotalBuffer."Total Amount (LCY)" + "Amount (LCY)";
                        TempCurrTotalBuffer.MODIFY;
                    END
                    ELSE BEGIN
                        TempCurrTotalBuffer."Currency Code" := "Currency Code";
                        TempCurrTotalBuffer."Total Amount" := Amount;
                        TempCurrTotalBuffer."Total Amount (LCY)" := "Amount (LCY)";
                        TempCurrTotalBuffer.INSERT;
                    END;
                    CorrectionEntry := CorrectionEntry AND Correction;
                END;

                IF "Document Type" <> PrevPayJnlLine."Document Type" THEN
                    "Document Type" := 0;
                /*
                IF "Business Unit Code" <> PrevPayJnlLine."Business Unit Code" THEN
                  "Business Unit Code" := '';
                */
                IF "Reason Code" <> PrevPayJnlLine."Reason Code" THEN
                    "Reason Code" := '';
                /*
                IF "Recurring Method" <> PrevPayJnlLine."Recurring Method" THEN
                  "Recurring Method" := 0;
                IF "Recurring Frequency" <> PrevPayJnlLine."Recurring Frequency" THEN
                  EVALUATE("Recurring Frequency",'<>');
                */
                IF PayJnlLine."Line No." <> PrevPayJnlLine."Line No." THEN BEGIN
                    //DIM1.0 Start
                    //Commented
                    /*
                    TempJnlLineDim[1].SETRANGE("Journal Line No.","Line No.");
                    IF TempJnlLineDim[1].FIND('-') THEN
                      REPEAT
                        IF NOT TempJnlLineDim[2].GET(TempJnlLineDim[1]."Table ID",TempJnlLineDim[1]."Journal Template Name",
                                                                                  TempJnlLineDim[1]."Journal Batch Name",
                                                                                  PrevPayJnlLine."Line No.",
                                                                                  0,TempJnlLineDim[1]."Dimension Code")
                        THEN
                          TempJnlLineDim[1].DELETE
                        ELSE
                          IF TempJnlLineDim[1]."Dimension Value Code" <> TempJnlLineDim[2]."Dimension Value Code" THEN
                            TempJnlLineDim[1].DELETE;
                      UNTIL TempJnlLineDim[1].NEXT = 0;
                    */
                    //DIM1.0 End
                END;

                PrevPayJnlLine := PayJnlLine;
            UNTIL NEXT = 0;

            CLEAR(PrevPayJnlLine);

            IF CheckCurrBalance AND (TotalAmountLCY <> 0) THEN BEGIN
                Correction := CorrectionEntry;
                InsertCorrectionLines(PrevPayJnlLine, PayJnlLine);
            END;
        END;

    end;

    var
        Text000: Label 'The program cannot find a key between line number %1 and line number %2.';
        Text002: Label 'Rounding correction for %1';
        TempCurrTotalBuffer: Record "Currency Total Buffer" temporary;
        DimMgt: Codeunit DimensionManagement;

    (46331)]
    procedure CheckCurrBalance(): Boolean;
    var
        InBalance: Boolean;
    begin
        InBalance := TRUE;
        IF TempCurrTotalBuffer.FIND('-') THEN
            REPEAT
                InBalance := InBalance AND (TempCurrTotalBuffer."Total Amount" = 0)
            UNTIL (NOT InBalance) OR (TempCurrTotalBuffer.NEXT = 0);
        EXIT(InBalance);
    end;

    (46339)]
    local procedure InsertCorrectionLines(var PayJnlLine2: Record "Payroll Journal Line"; var PrevPayJnlLine2: Record "Payroll Journal Line");
    var
        Currency: Record Currency;
        NewPayJnlLine: Record "Payroll Journal Line";
    begin
        NewPayJnlLine := PrevPayJnlLine2;

        TempCurrTotalBuffer.SETFILTER("Currency Code", '<>%1', '');
        TempCurrTotalBuffer.SETRANGE("Total Amount", 0);

        IF TempCurrTotalBuffer.FIND('-') THEN
            REPEAT
                Currency.GET(TempCurrTotalBuffer."Currency Code");
                Currency.TESTFIELD("Conv. LCY Rndg. Debit Acc.");
                Currency.TESTFIELD("Conv. LCY Rndg. Credit Acc.");

                WITH NewPayJnlLine DO BEGIN
                    INIT;
                    IF PayJnlLine2."Line No." = 0 THEN
                        "Line No." := "Line No." + 10000
                    ELSE
                        IF PayJnlLine2."Line No." >= "Line No." + 2 THEN
                            "Line No." := ("Line No." + PayJnlLine2."Line No.") DIV 2
                        ELSE
                            ERROR(STRSUBSTNO(Text000, PrevPayJnlLine2."Line No.", PayJnlLine2."Line No."));
                    "Document Type" := PrevPayJnlLine2."Document Type";
                    "Account Type" := "Account Type"::"G/L Account";
                    Correction := PrevPayJnlLine2.Correction;

                    IF Correction XOR (TempCurrTotalBuffer."Total Amount (LCY)" <= 0) THEN
                        VALIDATE("Account No.", Currency."Conv. LCY Rndg. Debit Acc.")
                    ELSE
                        VALIDATE("Account No.", Currency."Conv. LCY Rndg. Credit Acc.");

                    "Posting Date" := PrevPayJnlLine2."Posting Date";
                    "Document No." := PrevPayJnlLine2."Document No.";
                    Description := STRSUBSTNO(Text002, TempCurrTotalBuffer."Currency Code");
                    VALIDATE(Amount, -TempCurrTotalBuffer."Total Amount (LCY)");
                    "Source Code" := PrevPayJnlLine2."Source Code";
                    //"Business Unit Code" := PrevPayJnlLine2."Business Unit Code";
                    "Reason Code" := PrevPayJnlLine2."Reason Code";
                    //"Recurring Method" := PrevPayJnlLine2."Recurring Method";
                    //"Recurring Frequency" := PrevPayJnlLine2."Recurring Frequency";
                    //"Posting No. Series" := PrevPayJnlLine2."Posting No. Series";

                    "Dimension Set ID" := PrevPayJnlLine2."Dimension Set ID"; //DIM1.0
                    IF TempCurrTotalBuffer."Total Amount (LCY)" <> 0 THEN BEGIN
                        INSERT;
                        //DIM1.0 Start
                        //Code Commented
                        /*
                        WITH TempJnlLineDim[1] DO
                          BEGIN
                            SETRANGE("Journal Line No.",PrevPayJnlLine2."Line No.");
                            IF FIND('-') THEN
                              REPEAT
                                IF JnlLineDim.GET("Table ID","Journal Template Name",
                                                  "Journal Batch Name",NewPayJnlLine."Line No.",0,"Dimension Code")
                                THEN
                                  JnlLineDim.DELETE;
                                  JnlLineDim := TempJnlLineDim[1];
                                  JnlLineDim."Journal Line No." := NewPayJnlLine."Line No.";
                                  JnlLineDim.INSERT(TRUE);
                              UNTIL NEXT = 0;
                          END;
                        */
                        //DIM1.0 End
                    END;
                END;
            UNTIL TempCurrTotalBuffer.NEXT = 0;

    end;
}

