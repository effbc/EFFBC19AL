report 50022 "Site Stock Updation(excel)"
{
    // version NAVW17.00

    CaptionML = ENU = 'Import Cost Budget from Excel',
                ENN = 'Import Cost Budget from Excel';
    ProcessingOnly = true;

    dataset
    {
        dataitem("Cost Budget Buffer"; "Cost Budget Buffer")
        {
            DataItemTableView = SORTING(Cost Type No., Cost Center Code, Cost Object Code, Date);

            trigger OnAfterGetRecord();
            begin
                RecNo := RecNo + 1;
                IF RecNo = 1 THEN BEGIN
                    Window.OPEN(
                      Text028 +
                      '@1@@@@@@@@@@@@@@@@@@@@@@@@@\');
                    TotalRecNo := COUNT;
                    Window.UPDATE(1, 0);
                END;
                IF ImportOption = ImportOption::"Replace entries" THEN BEGIN
                    CostBudgetEntry.SETRANGE("Cost Type No.", "Cost Type No.");
                    CostBudgetEntry.SETRANGE(Date, Date);
                    CostBudgetEntry.SETFILTER("Entry No.", '<=%1', LastEntryNoBeforeImport);
                    IF NOT CostBudgetEntry.ISEMPTY THEN
                        CostBudgetEntry.DELETEALL(TRUE);
                END;

                IF Amount = 0 THEN
                    CurrReport.SKIP;
                IF NOT IsLineTypeCostType("Cost Type No.") THEN
                    CurrReport.SKIP;
                CostBudgetEntry.INIT;
                CostBudgetEntry."Entry No." := EntryNo;
                CostBudgetEntry."Budget Name" := ToCostBudgetName;
                CostBudgetEntry."Cost Type No." := "Cost Type No.";
                CostBudgetEntry.Date := Date;
                CostBudgetEntry.Amount := ROUND(Amount);
                CostBudgetEntry.Description := Description;
                CostBudgetEntry."Cost Center Code" := "Cost Center Code";
                CostBudgetEntry."Cost Object Code" := "Cost Object Code";
                CostBudgetEntry.INSERT(TRUE);
                EntryNo := EntryNo + 1;
                Window.UPDATE(1, ROUND(RecNo / TotalRecNo * 10000, 1));
            end;

            trigger OnPostDataItem();
            begin
                IF RecNo > 0 THEN
                    MESSAGE(Text004, CostBudgetEntry.TABLECAPTION, RecNo);
            end;

            trigger OnPreDataItem();
            begin
                RecNo := 0;

                IF NOT CostBudgetName.GET(ToCostBudgetName) THEN BEGIN
                    IF NOT CONFIRM(Text001, FALSE, CostBudgetName.TABLECAPTION, ToCostBudgetName) THEN
                        CurrReport.BREAK;
                    CostBudgetName.Name := ToCostBudgetName;
                    CostBudgetName.INSERT;
                END ELSE BEGIN
                    IF NOT CONFIRM(Text003, FALSE, LOWERCASE(FORMAT(SELECTSTR(ImportOption + 1, Text027))), ToCostBudgetName) THEN
                        CurrReport.BREAK;
                END;

                IF CostBudgetEntry3.FINDLAST THEN
                    EntryNo := CostBudgetEntry3."Entry No." + 1
                ELSE
                    EntryNo := 1;
                LastEntryNoBeforeImport := CostBudgetEntry3."Entry No.";
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
                    CaptionML = ENU = 'Options',
                                ENN = 'Options';
                    group("Import from")
                    {
                        CaptionML = ENU = 'Import from',
                                    ENN = 'Import from';
                        field(FileName; FileName)
                        {
                            CaptionML = ENU = 'Workbook File Name',
                                        ENN = 'Workbook File Name';
                            Editable = false;

                            trigger OnAssistEdit();
                            begin
                                RequestFile;
                                SheetName := ExcelBuffer.SelectSheetsName(ServerFileName);
                            end;

                            trigger OnValidate();
                            begin
                                FileNameOnAfterValidate;
                            end;
                        }
                        field(SheetName; SheetName)
                        {
                            CaptionML = ENU = 'Worksheet Name',
                                        ENN = 'Worksheet Name';
                            Editable = false;

                            trigger OnAssistEdit();
                            begin
                                IF ServerFileName = '' THEN
                                    RequestFile;

                                SheetName := ExcelBuffer.SelectSheetsName(ServerFileName);
                            end;
                        }
                    }
                    group("Import to")
                    {
                        CaptionML = ENU = 'Import to',
                                    ENN = 'Import to';
                        field(ToCostBudgetName; ToCostBudgetName)
                        {
                            CaptionML = ENU = 'Budget Name',
                                        ENN = 'Budget Name';
                            TableRelation = "Cost Budget Name";
                        }
                        field(ImportOption; ImportOption)
                        {
                            CaptionML = ENU = 'Option',
                                        ENN = 'Option';
                            OptionCaptionML = ENU = 'Replace entries,Add entries',
                                              ENN = 'Replace entries,Add entries';
                        }
                        field(Description; Description)
                        {
                            CaptionML = ENU = 'Description',
                                        ENN = 'Description';
                        }
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage();
        begin
            FileName := '';
            SheetName := '';
        end;

        trigger OnQueryClosePage(CloseAction: Action): Boolean;
        begin
            IF CloseAction = ACTION::OK THEN
                ValidateServerFileName;
        end;
    }

    labels
    {
    }

    trigger OnPostReport();
    begin
        ExcelBuffer.DELETEALL;
        "Cost Budget Buffer".DELETEALL;
    end;

    trigger OnPreReport();
    begin
        IF ToCostBudgetName = '' THEN
            ERROR(STRSUBSTNO(Text000));

        IF CostType.FIND('-') THEN BEGIN
            REPEAT
                TempCostType.INIT;
                TempCostType := CostType;
                TempCostType.INSERT;
            UNTIL CostType.NEXT = 0;
        END;

        ExcelBuffer.LOCKTABLE;
        "Cost Budget Buffer".LOCKTABLE;
        CostBudgetEntry.SETRANGE("Budget Name", ToCostBudgetName);
        IF NOT CostBudgetName.GET(ToCostBudgetName) THEN
            CLEAR(CostBudgetName);

        CostAccSetup.GET;

        ExcelBuffer.OpenBook(ServerFileName, SheetName);
        ExcelBuffer.ReadSheet;

        AnalyzeData;
    end;

    var
        ExcelBuffer: Record "Excel Buffer";
        CostBudgetEntry: Record "Cost Budget Entry";
        CostAccSetup: Record "Cost Accounting Setup";
        CostType: Record "Cost Type";
        TempCostType: Record "Cost Type" temporary;
        CostBudgetName: Record "Cost Budget Name";
        CostBudgetEntry3: Record "Cost Budget Entry";
        FileMgt: Codeunit "File Management";
        Window: Dialog;
        FileName: Text;
        ServerFileName: Text;
        SheetName: Text[250];
        ToCostBudgetName: Code[10];
        EntryNo: Integer;
        LastEntryNoBeforeImport: Integer;
        TotalRecNo: Integer;
        RecNo: Integer;
        Description: Text[50];
        ImportOption: Option "Replace entries","Add entries";
        Text000: TextConst ENU = 'You must specify a budget name to which to import.', ENN = 'You must specify a budget name to which to import.';
        Text001: TextConst ENU = 'Do you want to create %1 with the name %2?', ENN = 'Do you want to create %1 with the name %2?';
        Text003: TextConst ENU = 'Are you sure that you want to %1 for the budget name %2?', ENN = 'Are you sure that you want to %1 for the budget name %2?';
        Text004: TextConst ENU = '%1 table has been successfully updated with %2 entries.', ENN = '%1 table has been successfully updated with %2 entries.';
        Text006: TextConst ENU = 'Import Excel File', ENN = 'Import Excel File';
        Text007: TextConst ENU = 'Analyzing Data...\\', ENN = 'Analyzing Data...\\';
        Text009: TextConst ENU = 'Cost Type No', ENN = 'Cost Type No';
        Text011: TextConst ENU = 'The text %1 can only be specified once in the Excel worksheet.', ENN = 'The text %1 can only be specified once in the Excel worksheet.';
        Text014: TextConst ENU = 'Date', ENN = 'Date';
        Text017: TextConst ENU = 'Cost Center Code', ENN = 'Cost Center Code';
        Text018: TextConst ENU = 'Cost Object Code', ENN = 'Cost Object Code';
        Text019: TextConst ENU = 'You cannot import %1 value, which is not available in the %2 table.', ENN = 'You cannot import %1 value, which is not available in the %2 table.';
        Text023: TextConst ENU = 'You cannot import the same information more than once.', ENN = 'You cannot import the same information more than once.';
        Text025: TextConst ENU = 'Cost Types have not been found in the Excel worksheet.', ENN = 'Cost Types have not been found in the Excel worksheet.';
        Text026: TextConst ENU = 'Dates have not been recognized in the Excel worksheet.', ENN = 'Dates have not been recognized in the Excel worksheet.';
        Text027: TextConst ENU = 'Replace entries,Add entries', ENN = 'Replace entries,Add entries';
        Text028: TextConst ENU = 'Importing from Excel worksheet', ENN = 'Importing from Excel worksheet';
        Text029: TextConst ENU = 'You must enter a file name.', ENN = 'You must enter a file name.';

    (634)]
    local procedure AnalyzeData();
    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        CostBudgetBuffer: Record "Cost Budget Buffer";
        CostBudgetBuffer2: Record "Cost Budget Buffer";
        CostCenter: Record "Cost Center";
        CostObject: Record "Cost Object";
        HeaderRowNo: Integer;
        TestDateTime: DateTime;
        OldRowNo: Integer;
    begin
        Window.OPEN(
          Text007 +
          '@1@@@@@@@@@@@@@@@@@@@@@@@@@\');
        Window.UPDATE(1, 0);
        TotalRecNo := ExcelBuffer.COUNT;
        RecNo := 0;
        CostBudgetBuffer2.INIT;
        CostBudgetBuffer.DELETEALL;

        IF ExcelBuffer.FIND('-') THEN BEGIN
            REPEAT
                RecNo := RecNo + 1;
                Window.UPDATE(1, ROUND(RecNo / TotalRecNo * 10000, 1));
                CASE TRUE OF
                    STRPOS(UPPERCASE(ExcelBuffer."Cell Value as Text"), UPPERCASE(Text009)) <> 0:
                        BEGIN
                            IF HeaderRowNo = 0 THEN BEGIN
                                HeaderRowNo := ExcelBuffer."Row No.";
                                InsertTempExcelBuffer(ExcelBuffer, TempExcelBuffer, Text009);
                            END ELSE
                                ERROR(Text011, Text009);
                        END;
                    STRPOS(UPPERCASE(ExcelBuffer."Cell Value as Text"), UPPERCASE(Text017)) <> 0:
                        BEGIN
                            IF HeaderRowNo = ExcelBuffer."Row No." THEN
                                InsertTempExcelBuffer(ExcelBuffer, TempExcelBuffer, Text017)
                            ELSE
                                IF (HeaderRowNo < ExcelBuffer."Row No.") AND (HeaderRowNo <> 0) THEN
                                    ERROR(Text011, Text017);
                        END;
                    STRPOS(UPPERCASE(ExcelBuffer."Cell Value as Text"), UPPERCASE(Text018)) <> 0:
                        BEGIN
                            IF HeaderRowNo = ExcelBuffer."Row No." THEN
                                InsertTempExcelBuffer(ExcelBuffer, TempExcelBuffer, Text018)
                            ELSE
                                IF (HeaderRowNo < ExcelBuffer."Row No.") AND (HeaderRowNo <> 0) THEN
                                    ERROR(Text011, Text018);
                        END;
                    ExcelBuffer."Row No." = HeaderRowNo:
                        BEGIN
                            TempExcelBuffer := ExcelBuffer;
                            IF EVALUATE(TestDateTime, TempExcelBuffer."Cell Value as Text") THEN BEGIN
                                TempExcelBuffer."Cell Value as Text" := FORMAT(DT2DATE(TestDateTime));
                                TempExcelBuffer.Comment := Text014;
                                TempExcelBuffer.INSERT;
                            END;
                        END;
                    (ExcelBuffer."Row No." > HeaderRowNo) AND (HeaderRowNo > 0):
                        BEGIN
                            IF ExcelBuffer."Row No." <> OldRowNo THEN BEGIN
                                OldRowNo := ExcelBuffer."Row No.";
                                CLEAR(CostBudgetBuffer2);
                            END;
                            TempExcelBuffer.SETRANGE("Column No.", ExcelBuffer."Column No.");
                            IF TempExcelBuffer.FIND('-') THEN
                                CASE TempExcelBuffer.Comment OF
                                    Text009:
                                        BEGIN
                                            TempCostType.SETRANGE(
                                              "No.",
                                              COPYSTR(
                                                ExcelBuffer."Cell Value as Text",
                                                1, MAXSTRLEN(CostBudgetBuffer2."Cost Type No.")));
                                            IF TempCostType.FINDFIRST THEN
                                                CostBudgetBuffer2."Cost Type No." :=
                                                  COPYSTR(
                                                    ExcelBuffer."Cell Value as Text",
                                                    1, MAXSTRLEN(CostBudgetBuffer2."Cost Type No."))
                                            ELSE
                                                CostBudgetBuffer2."Cost Type No." := '';
                                        END;
                                    Text017:
                                        BEGIN
                                            IF CostCenter.GET(COPYSTR(
                                                   ExcelBuffer."Cell Value as Text", 1, MAXSTRLEN(CostBudgetBuffer2."Cost Center Code")))
                                            THEN
                                                CostBudgetBuffer2."Cost Center Code" := CostCenter.Code
                                            ELSE
                                                ERROR(Text019, CostBudgetBuffer2.FIELDCAPTION("Cost Center Code"), CostCenter.TABLECAPTION);
                                        END;
                                    Text018:
                                        BEGIN
                                            IF CostObject.GET(COPYSTR(
                                                   ExcelBuffer."Cell Value as Text", 1, MAXSTRLEN(CostBudgetBuffer2."Cost Object Code")))
                                            THEN
                                                CostBudgetBuffer2."Cost Object Code" := CostObject.Code
                                            ELSE
                                                ERROR(Text019, CostBudgetBuffer2.FIELDCAPTION("Cost Object Code"), CostObject.TABLECAPTION);
                                        END;
                                    Text014:
                                        IF CostBudgetBuffer2."Cost Type No." <> '' THEN BEGIN
                                            CostBudgetBuffer := CostBudgetBuffer2;
                                            EVALUATE(CostBudgetBuffer.Date, TempExcelBuffer."Cell Value as Text");
                                            EVALUATE(CostBudgetBuffer.Amount, ExcelBuffer."Cell Value as Text");
                                            IF NOT CostBudgetBuffer.FIND('=') THEN
                                                CostBudgetBuffer.INSERT
                                            ELSE
                                                ERROR(Text023);
                                        END;
                                END;
                        END;
                END;
            UNTIL ExcelBuffer.NEXT = 0;
        END;

        Window.CLOSE;
        TempExcelBuffer.RESET;
        TempExcelBuffer.SETRANGE(Comment, Text009);
        IF NOT TempExcelBuffer.FINDFIRST THEN
            ERROR(Text025);
        TempExcelBuffer.SETRANGE(Comment, Text014);
        IF NOT TempExcelBuffer.FINDFIRST THEN
            ERROR(Text026);
    end;

    (749)]
    procedure SetGLBudgetName(NewToCostBudgetName: Code[10]);
    begin
        ToCostBudgetName := NewToCostBudgetName;
    end;

    (752)]
    procedure RequestFile();
    begin
        IF FileName <> '' THEN
            ServerFileName := FileMgt.UploadFile(Text006, FileName)
        ELSE
            ServerFileName := FileMgt.UploadFile(Text006, '.xlsx');

        ValidateServerFileName;
        FileName := FileMgt.GetFileName(ServerFileName);
    end;

    (761)]
    procedure IsLineTypeCostType(CostTypeNo: Code[20]): Boolean;
    var
        CostType: Record "Cost Type";
    begin
        IF NOT CostType.GET(CostTypeNo) THEN
            EXIT(FALSE);
        EXIT(CostType.Type = CostType.Type::"Cost Type");
    end;

    (766)]
    local procedure FileNameOnAfterValidate();
    begin
        RequestFile;
    end;

    (769)]
    procedure InsertTempExcelBuffer(var ExcelBuffer: Record "Excel Buffer"; var TempExcelBuffer: Record "Excel Buffer" temporary; Text: Text[250]);
    begin
        TempExcelBuffer := ExcelBuffer;
        TempExcelBuffer.Comment := Text;
        TempExcelBuffer.INSERT;
    end;

    (774)]
    local procedure ValidateServerFileName();
    begin
        IF ServerFileName = '' THEN BEGIN
            FileName := '';
            SheetName := '';
            ERROR(Text029);
        END;
    end;
}

