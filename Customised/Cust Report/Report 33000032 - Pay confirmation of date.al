report 33000032 "Pay confirmation of date"
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
        IF EmpNo = '' THEN ERROR(Text000);
        IF DateOfConfirmation = 0D THEN ERROR(Text001);
        IF (DateOfConfirmation < JoinDate) THEN ERROR(Text002, JoinDate);

        //Posting Checking

        PayEmployeeLocal.RESET;
        PayEmployeeLocal.SETRANGE("No.", EmpNo);
        PayEmployeeLocal.SETRANGE("Salary Posted", TRUE);
        IF PayEmployeeLocal.FIND('-') THEN ERROR(Text005, PayEmployeeLocal.FIELDCAPTION("No."), PayEmployeeLocal."No.");
        ///


        PayPayrollEmployee.RESET;
        PayPayrollEmployee.SETFILTER("No.", EmpNo);
        IF PayPayrollEmployee.FIND('-') THEN BEGIN
            PayPayrollEmployee."Confirmation Date" := DateOfConfirmation;
            PayPayrollEmployee.MODIFY;
            InsertFreshPayElements;
            InsertElements;
        END;
    end;

    var
        TemplateName: Code[10];
        BatchName: Code[10];
        DocumentNo: Code[10];
        PayHead: Record "Pay General Journal Head";
        PayGradeLine: Record "Pay Grade Line";
        DocCode: Code[10];
        TemplateCode: Code[10];
        PayLine2: Record "Pay General Journal Line";
        PayLine: Record "Pay General Journal Line";
        JoinDate: Date;
        EmpNo: Code[10];
        DateOfConfirmation: Date;
        PayPayrollEmployee: Record Employee;
        Text000: Label 'Required Employee No.';
        Text001: Label 'Required Date of Confirmation';
        Text002: Label 'Required date should be greater than Joining Date.';
        Text003: Label 'Employee Does Not Exists.';
        Text004: Label 'Insert Grade in Employee Card for the Employee';
        Text005: TextConst ENU = 'Salary Already Posted For %1 = %2';

    [LineStart(20311)]
    procedure InsertFreshPayElements();
    begin
        PayLine.RESET;
        PayLine.SETFILTER("Employee No", PayPayrollEmployee."No.");
        IF PayLine.FIND('-') THEN BEGIN
            DocCode := PayLine."Document No";
            TemplateCode := PayLine."Pay Journal Batch";
        END;
        PayLine.RESET;
        PayLine.SETFILTER("Pay Journal Batch", TemplateCode);
        PayLine.SETFILTER("Document No", DocCode);
        PayLine.SETFILTER("Employee No", PayPayrollEmployee."No.");
        PayLine.DELETEALL;
    end;

    [LineStart(20324)]
    procedure InsertElements();
    begin
        PayGradeLine.RESET;
        PayLine2.RESET;
        PayHead.RESET;
        IF PayPayrollEmployee."Job Title/Grade" <> '' THEN BEGIN
            PayGradeLine.SETFILTER("Pay Designation", PayPayrollEmployee."Job Title/Grade");
            PayGradeLine.SETFILTER("Probationary Check", '=%1', FALSE);

            IF PayGradeLine.FIND('-') THEN BEGIN
                REPEAT
                    PayLine2.INIT;

                    PayLine2."Employee No" := PayPayrollEmployee."No.";
                    PayLine2."Pay Element Code" := PayGradeLine."Pay Element Code";
                    PayLine2."Pay Journal Template" := TemplateName;
                    PayLine2."Pay Journal Batch" := BatchName;
                    PayLine2."Document No" := DocumentNo;
                    PayLine2."Pay Structure Date" := WORKDATE;
                    PayLine2."Paid Category" := PayGradeLine."Paid Category";
                    PayLine2.Description := PayGradeLine.Description;
                    PayLine2.Type := PayGradeLine.Type;
                    PayLine2.Amount := PayGradeLine.Amount;
                    PayLine2."Effective Date" := WORKDATE;
                    PayLine2.Grade := PayPayrollEmployee."Job Title/Grade";
                    PayLine2."Department Code" := PayPayrollEmployee."Department Code";
                    PayLine2."Location Code" := PayPayrollEmployee."Location Code";
                    PayLine2."Project Code" := PayPayrollEmployee."Project Code";
                    PayLine2."Sorting Order" := PayGradeLine."Sorting Order";
                    PayLine2."Revised Amount" := 0;
                    PayLine2.Arrear := 0;

                    PayLine2.INSERT;
                UNTIL PayGradeLine.NEXT = 0;
                PayHead.SETFILTER("Pay Journal Template", TemplateName);
                PayHead.SETFILTER("Pay Batch", BatchName);
                PayHead.SETFILTER("Document No", DocumentNo);
                IF PayHead.FIND('-') THEN
                    PayHead.RecordCheck := TRUE;
                PayHead.MODIFY;

            END;
        END
        ELSE
            ERROR(Text004);
    end;

    [LineStart(20370)]
    procedure GetTemplateBatchDocument(Template: Code[10]; Batch: Code[10]; DocNo: Code[10]);
    begin
        TemplateName := Template;
        BatchName := Batch;
        DocumentNo := DocNo;
    end;
}

