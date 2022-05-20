codeunit 33000023 "Emp. Entry-Edit"
{
    // version NEOGYNPAY13.70.00.07

    Permissions = TableData "Employee Ledger Entry"=imd,
                  TableData "Detailed Employee Ledg. Entry"=m;
    TableNo = "Employee Ledger Entry";

    trigger OnRun();
    var
        RecRef : RecordRef;
        xRecRef : RecordRef;
    begin
        EmpLdgrEntry := Rec;
        EmpLdgrEntry.LOCKTABLE;
        EmpLdgrEntry.FIND;
        xRecRef.GETTABLE(EmpLdgrEntry);
        EmpLdgrEntry."On Hold" := "On Hold";

        IF EmpLdgrEntry.Open THEN
          BEGIN
            EmpLdgrEntry."Due Date" := "Due Date";
            DtldEmpLdgrEntry.SETCURRENTKEY("Employee Ledger Entry No.");
            DtldEmpLdgrEntry.SETRANGE("Employee Ledger Entry No.",EmpLdgrEntry."Entry No.");
            DtldEmpLdgrEntry.MODIFYALL("Initial Entry Due Date","Due Date");
            EmpLdgrEntry."Pmt. Discount Date" := "Pmt. Discount Date";
            EmpLdgrEntry."Applies-to ID" := "Applies-to ID";
            //EmpLdgrEntry.VALIDATE("Remaining Pmt. Disc. Possible","Remaining Pmt. Disc. Possible");
            //EmpLdgrEntry."Pmt. Disc. Tolerance Date" := "Pmt. Disc. Tolerance Date";
            //EmpLdgrEntry.VALIDATE("Max. Payment Tolerance","Max. Payment Tolerance");
          END;
        EmpLdgrEntry.MODIFY;
        Rec := EmpLdgrEntry;
        RecRef.GETTABLE(EmpLdgrEntry);
        //>>B2b1.0
        //ChangeLogMgt.LogModification(RecRef,xRecRef);
        ChangeLogMgt.LogModification(RecRef);
        //B2b1.0<<
    end;

    var
        EmpLdgrEntry : Record "Employee Ledger Entry";
        DtldEmpLdgrEntry : Record "Detailed Employee Ledg. Entry";
        ChangeLogMgt : Codeunit "Change Log Management";
}

