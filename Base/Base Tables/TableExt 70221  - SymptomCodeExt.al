tableextension 70221 SymptomCodeExt extends "Symptom Code"
{

    fields
    {

    }
    trigger OnModify()
    begin
        if not (UpperCase(UserId) in ['EFFTRONICS\SRIVALLI', 'SUPER', '10RD010', 'EFFTRONICS\RAMADEVI']) then
            Error('You have no Rights');
    end;

    trigger OnDelete()
    begin
        if not (UpperCase(UserId) in ['EFFTRONICS\SRIVALLI', 'SUPER', '10RD010']) then
            Error('You have no Rights');
    end;
}

