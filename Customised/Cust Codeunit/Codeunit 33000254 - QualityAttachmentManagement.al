codeunit 33000254 QualityAttachmentManagement
{
    // version QC1.0


    trigger OnRun();
    begin
    end;

    var
        Text002: Label 'The attachment is empty.';
        Text003: Label 'Attachment is already in use on this machine.';
        Text004: Label 'When you have saved your document, click Yes to import the document.';
        Text005: Label 'Export Attachment';
        Text006: Label 'Import Attachment';
        Text007: Label 'All Files (*.*)|*.*';
        Text008: Label 'Error during copying file.';
        Text009: Label 'Do you want to remove %1?';
        Text010: Label 'External file could not be removed.';
        Text012: Label '\Doc';
        Text013: Label 'Only Microsoft Word documents can be printed.';
        Text014: Label 'Only Microsoft Word documents can be faxed.';
        VendorItemApproval: Record "Vendor Item Quality Approval";

    [LineStart(50972)]
    procedure SetVendorItemApproval(VendorItemApproval2: Record "Vendor Item Quality Approval");
    begin
        VendorItemApproval := VendorItemApproval2;
    end;

    [LineStart(50975)]
    procedure ImportAttchment(): Boolean;
    var
        AttachmentManagement: Codeunit AttachmentManagement;
        FileName: Text[260];
    begin
        //Deleted Local VAR(CommonDialogMgtCodeunitCodeunit412)

        //FileName := CommonDialogMgt.OpenFile(Text006,'',4,Text007,0);//B2B
        IF FileName <> '' THEN BEGIN
            VendorItemApproval.Attachment.IMPORT(FileName);
            //  VendorItemApproval."File Extension" := UPPERCASE(AttachmentManagement.FileExtension(FileName));//B2B
            VendorItemApproval.MODIFY;
            EXIT(TRUE)
        END ELSE
            EXIT(FALSE);
    end;

    [LineStart(50987)]
    procedure ExportAttachment(ExportToFile: Text[260]): Boolean;
    var
        FileName: Text[260];
        FileFilter: Text[260];
    begin
        //Deleted Local VAR(CommonDialogMgtCodeunitCodeunit412)
        VendorItemApproval.CALCFIELDS(Attachment);
        IF VendorItemApproval.Attachment.HASVALUE THEN BEGIN
            IF ExportToFile = '' THEN BEGIN
                FileFilter := UPPERCASE(VendorItemApproval."File Extension") + ' ';
                FileFilter := FileFilter + '(*.' + VendorItemApproval."File Extension" + ')|*.' + VendorItemApproval."File Extension";
                //    FileName := CommonDialogMgt.OpenFile(Text005,'',4,FileFilter,1);
            END ELSE
                FileName := ExportToFile;

            IF FileName <> '' THEN BEGIN
                VendorItemApproval.Attachment.EXPORT(FileName);
                EXIT(TRUE);
            END ELSE
                EXIT(FALSE)
        END ELSE
            EXIT(FALSE)
    end;

    [LineStart(51006)]
    procedure OpenAttachment();
    var
        WordManagement: Codeunit WordManagement;
        AttachmentManagement: Codeunit AttachmentManagement;
        FileName: Text[260];
    begin
        VendorItemApproval.CALCFIELDS(Attachment);
        IF NOT VendorItemApproval.Attachment.HASVALUE THEN
            ERROR(Text002);
        FileName := ConstFilename;
        IF EXISTS(FileName) THEN
            IF NOT DeleteFile(FileName) THEN
                ERROR(Text003);
        ExportAttachment(FileName);
        HYPERLINK(FileName);

        DeleteFile(FileName);
    end;

    [LineStart(51019)]
    procedure ConstFilename() FileName: Text[260];
    var
        I: Integer;
        DocNo: Text[30];
    begin
        REPEAT
            IF I <> 0 THEN
                DocNo := FORMAT(I);
            FileName := ENVIRON('TEMP') + Text012 + DocNo + '.' + VendorItemApproval."File Extension";
            IF NOT EXISTS(FileName) THEN
                EXIT;
            I := I + 1;
        UNTIL I = 999;
        MESSAGE('%1', FileName);
    end;

    [LineStart(51030)]
    procedure DeleteFile(FileName: Text[260]): Boolean;
    var
        I: Integer;
    begin
        IF FileName = '' THEN
            EXIT(FALSE);

        IF NOT EXISTS(FileName) THEN
            EXIT(TRUE);

        REPEAT
            SLEEP(250);
            I := I + 1;
        UNTIL ERASE(FileName) OR (I = 25);
        EXIT(NOT EXISTS(FileName));
    end;

    [LineStart(51043)]
    procedure RemoveAttachment(Prompt: Boolean) DeleteOK: Boolean;
    var
        DeleteYesNo: Boolean;
    begin
        DeleteOK := FALSE;
        DeleteYesNo := TRUE;
        IF Prompt THEN
            IF NOT CONFIRM(
              Text009, FALSE, VendorItemApproval.FIELDCAPTION(Attachment))
            THEN
                DeleteYesNo := FALSE;
        IF DeleteYesNo THEN BEGIN
            CLEAR(VendorItemApproval.Attachment);
            VendorItemApproval."File Extension" := '';
            DeleteOK := TRUE;
        END;
    end;
}

