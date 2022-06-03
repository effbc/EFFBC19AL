codeunit 80813 "Transfer Led. Entry Desc"
{

    trigger OnRun();
    begin
        Window.OPEN('Table Name#1######################');
        UpdateGLEntry;
        UpdateCustLedgEntry;
        UpdateVendLedgEntry;
        UpdateBankLedgEntry;
        MESSAGE('Finished.');
    end;

    var
        TempGLEntry: Record "Temp GL Entry Desc";
        TempCustLedgEntry: Record "Temp Cust Ledg. Entry Desc";
        TempVendLedgEntry: Record "Temp Vend Ledg. Entry Desc";
        TempBankLedgEntry: Record "Temp Bank Ledg. Entry Desc";
        GLEntry: Record "G/L Entry";
        CustLedgEntry: Record "Cust. Ledger Entry";
        VendLedgEntry: Record "Vendor Ledger Entry";
        BankAccLedgEntry: Record "Bank Account Ledger Entry";
        Window: Dialog;

    [LineStart(41663)]
    procedure UpdateGLEntry();
    begin
        Window.UPDATE(1, 'G/L Entry');
        TempGLEntry.RESET;
        WITH TempGLEntry DO BEGIN
            IF FINDSET THEN
                REPEAT
                    IF GLEntry.GET("Entry No.") THEN BEGIN
                        GLEntry.Description := Description;
                        GLEntry.MODIFY;
                    END;
                UNTIL NEXT = 0;
        END;
    end;

    [LineStart(41676)]
    procedure UpdateCustLedgEntry();
    begin
        Window.UPDATE(1, 'Cust. Ledger Entry');
        TempCustLedgEntry.RESET;
        WITH TempCustLedgEntry DO BEGIN
            IF FINDSET THEN
                REPEAT
                    IF CustLedgEntry.GET("Entry No.") THEN BEGIN
                        CustLedgEntry.Description := Description;
                        CustLedgEntry.MODIFY;
                    END;
                UNTIL NEXT = 0;
        END;
    end;

    [LineStart(41689)]
    procedure UpdateVendLedgEntry();
    begin
        Window.UPDATE(1, 'Vend. Ledg Entry');
        TempVendLedgEntry.RESET;
        WITH TempVendLedgEntry DO BEGIN
            IF FINDSET THEN
                REPEAT
                    IF VendLedgEntry.GET("Entry No.") THEN BEGIN
                        VendLedgEntry.Description := Description;
                        VendLedgEntry.MODIFY;
                    END;
                UNTIL NEXT = 0;
        END;
    end;

    [LineStart(41702)]
    procedure UpdateBankLedgEntry();
    begin
        Window.UPDATE(1, 'Bank A Entry');
        TempBankLedgEntry.RESET;
        WITH TempBankLedgEntry DO BEGIN
            IF FINDSET THEN
                REPEAT
                    IF BankAccLedgEntry.GET("Entry No.") THEN BEGIN
                        BankAccLedgEntry.Description := Description;
                        BankAccLedgEntry.MODIFY;
                    END;
                UNTIL NEXT = 0;
        END;
    end;
}

