report 33000033 "Pay Promotion"
{
    // version NEOGYNPAY13.70.00.06

    ProcessingOnly = true;

    dataset
    {
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

    trigger OnPostReport();
    var
        PayEmployeeLocal: Record Employee;
    begin
        IF Empno = '' THEN ERROR(Text000);
        IF NewGrade = '' THEN ERROR(Text001);
        IF OldGrade = NewGrade THEN ERROR(Text002);

        //Posting Checking

        PayEmployeeLocal.RESET;
        PayEmployeeLocal.SETRANGE("No.", Empno);
        PayEmployeeLocal.SETRANGE("Salary Posted", TRUE);
        IF PayEmployeeLocal.FIND('-') THEN ERROR(Text005, PayEmployeeLocal.FIELDCAPTION("No."), PayEmployeeLocal."No.");
        ///


        IF CONFIRM(Text003) THEN BEGIN
            IF PayPayrollEmployee.GET(Empno) THEN BEGIN
                PayPayrollEmployee."Job Title/Grade" := NewGrade;
                PayPayrollEmployee.MODIFY;
                ModifyingElements;
                PayGeneralJournalLine.SETFILTER("Employee No", Empno);
                PayGeneralJournalLine.DELETEALL;
                MESSAGE(Text004, Empno);
            END
        END;
    end;

    var
        TemplateName: Code[10];
        BatchName: Code[10];
        DocumentNo: Code[10];
        DocNo: Code[10];
        TempNo: Code[10];
        PayHead: Record "Pay General Journal Head";
        ok: Boolean;
        PayGeneralJournalLine: Record "Pay General Journal Line";
        Paygrade: Record "Pay Grade";
        PayPayrollEmployee: Record Employee;
        Empno: Code[10];
        OldGrade: Code[10];
        NewGrade: Code[10];
        Text000: Label 'Required Employee No.';
        Text001: Label 'Enter New Grade';
        Text002: Label 'Grades can not be Identical';
        Text003: Label 'Do You Want to Change Grade ?';
        Text004: Label 'Grade of %1 has been Upgraded';
        Text005: TextConst ENU = 'Salary Already Posted For %1 = %2';

    [LineStart(20402)]
    procedure ModifyingElements();
    var
        Payemployeeelements: Record "Pay Employee Elements";
        PayElement: Record "Pay Elements";
        PayDesignationLine: Record "Pay Grade Line";
    begin
        Payemployeeelements.RESET;
        Payemployeeelements.SETFILTER("Employee No", Empno);
        Payemployeeelements.SETRANGE("Pay Structure Date", PayPayrollEmployee."Latest Pay Revision Date");
        Payemployeeelements.DELETEALL;

        PayDesignationLine.SETFILTER("Pay Designation", PayPayrollEmployee."Job Title/Grade");
        IF PayDesignationLine.FIND('-') THEN BEGIN
            REPEAT
                PayElement.RESET;
                PayElement.SETFILTER(Code, PayDesignationLine."Pay Element Code");
                IF PayElement.FIND('-') THEN
                    IF (PayElement.Marriage = TRUE) OR (PayElement.Dating = TRUE) OR (PayElement.Birthday = TRUE)
                    OR (PayElement."Effective Date" <> 0D) THEN BEGIN
                    END
                    ELSE BEGIN
                        Payemployeeelements.INIT;
                        Payemployeeelements."Employee No" := Empno;
                        Payemployeeelements."Pay Element Code" := PayDesignationLine."Pay Element Code";
                        Payemployeeelements.Description := PayDesignationLine.Description;
                        Payemployeeelements."Pay Structure Date" := PayPayrollEmployee."Latest Pay Revision Date";
                        Payemployeeelements."Paid Category" := PayDesignationLine."Paid Category";
                        Payemployeeelements."Sorting Order" := PayDesignationLine."Sorting Order";
                        Payemployeeelements.Type := PayDesignationLine.Type;
                        Payemployeeelements.Amount := PayDesignationLine.Amount;
                        Payemployeeelements.Grade := PayPayrollEmployee."Job Title/Grade";
                        Payemployeeelements."Effective Date" := PayDesignationLine."Effective Date";
                        Payemployeeelements."Department Code" := PayPayrollEmployee."Department Code";
                        Payemployeeelements."Included In Pay Slip" := PayDesignationLine."Included In Pay Slip";
                        Payemployeeelements.INSERT;
                    END;
            UNTIL PayDesignationLine.NEXT = 0;
        END;
    end;

    [LineStart(20439)]
    procedure GetTemplateBatchDoc(Template: Code[10]; Batch: Code[10]; DocNo: Code[10]);
    begin
        TemplateName := Template;
        BatchName := Batch;
        DocumentNo := DocNo;
    end;
}

