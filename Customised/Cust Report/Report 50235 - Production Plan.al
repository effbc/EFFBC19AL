report 50235 "Production Plan"
{
    //   xlWorkSheet3.Range('A1').Value := 'Production Order no.';
    //   xlWorkSheet3.Range('B1').Value := 'Production Start Date';
    //   xlWorkSheet3.Range('C1').Value := 'Product Type';
    //   xlWorkSheet3.Range('D1').Value := 'No.of Units';
    DefaultLayout = RDLC;
    RDLCLayout = './Production Plan.rdlc';


    dataset
    {
        dataitem("Production Order"; "Production Order")
        {

            trigger OnAfterGetRecord();
            begin
                Row += 1;
                xlWorkSheet3.Range('A' + FORMAT(Row)).Value := "Production Order"."No.";
                xlWorkSheet3.Range('B' + FORMAT(Row)).Value := "Production Order"."Prod Start date";
                Item.RESET;
                Item.SETFILTER(Item."No.", "Production Order"."Source No.");
                IF Item.FINDFIRST THEN BEGIN
                    xlWorkSheet3.Range('C' + FORMAT(Row)).Value := Item."Item Sub Group Code";
                    xlWorkSheet3.Range('D' + FORMAT(Row)).Value := Item."No.of Units" * "Production Order".Quantity;
                END;
            end;

            trigger OnPreDataItem();
            begin
                CLEAR(xlApp);
                CLEAR(xlRange);
                CLEAR(xlWorkBooks);
                CLEAR(xlWorkBook);
                CLEAR(xlRange);
                CLEAR(xlSheets);
                CLEAR(xlWorkSheet);

                CREATE(xlApp, TRUE, TRUE);
                xlApp.SheetsInNewWorkbook := 1;
                xlApp.Workbooks.Add();

                xlWorkSheet3 := xlApp.ActiveSheet;
                xlWorkSheet3.Name := 'Production Plan';
                xlSheetName := xlWorkSheet3.Name;
                xlSheetName := CONVERTSTR(xlSheetName, ' -+', '___');
                xlWorkSheet3.Range('A1').Value := 'Production Order no.';
                xlWorkSheet3.Range('B1').Value := 'Production Start Date';
                xlWorkSheet3.Range('C1').Value := 'Product Type';
                xlWorkSheet3.Range('D1').Value := 'No.of Units';
                "Production Order".SETFILTER("Production Order"."Prod Start date", '>%1', TODAY);
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

    trigger OnInitReport();
    begin
        //test
    end;

    trigger OnPostReport();
    begin
        xlWorkSheet3.Range('A1').Select;
        xlWorkSheet3.Columns.AutoFit;


        ExcelBuffer.VALIDATE("Column No.", 4 + NoOfColumns);
        //MESSAGE(STRSUBSTNO('%1!A1:%2%3', xlWorkSheet3.Name, ExcelBuffer.xlColID, Row));
        xlPivotCache :=
          xlApp.ActiveWorkbook.PivotCaches.Add(1, STRSUBSTNO('%1!A1:%2%3',
        xlWorkSheet3.Name, ExcelBuffer.xlColID, Row));
        xlWorkSheet3.Select;



        xlPivotCache.CreatePivotTable('', 'PivotTable1');
        xlWorkSheet2 := xlApp.ActiveSheet();
        xlWorkSheet2.Name := 'Summary';
        xlPivotTable := xlWorkSheet2.PivotTables('PivotTable1');

        xlPivotField := xlPivotTable.PivotFields('Production Start Date');
        xlApp.Visible := TRUE;
        xlPivotField.Orientation := 1;
        xlPivotField.Position := 1;
        xlPivotField.Subtotals(1, FALSE);

        xlPivotField := xlPivotTable.PivotFields('Product Type');
        xlApp.Visible := TRUE;
        xlPivotField.Orientation := 2;
        xlPivotField.Position := 1;
        xlPivotField.Subtotals(1, FALSE);


        xlPivotField := xlPivotTable.PivotFields('No.of Units');
        xlApp.Visible := TRUE;
        xlPivotField.Orientation := 4;
        xlPivotField.Position := 1;
        xlPivotField."Function" := 0;

        xlWorkSheet2.Columns.AutoFit;

        FOR i := 5 TO 100 DO BEGIN
            IF FORMAT(xlWorkSheet2.Range('A' + FORMAT(i)).Value) = 'Grand Total' THEN BEGIN
                Sheet_row := i;
                i := 100;
            END;
        END;

        FOR j := 'A' TO 'Z' DO BEGIN
            IF FORMAT(xlWorkSheet2.Range(FORMAT(j) + FORMAT(Sheet_row)).Value) = '' THEN BEGIN
                Sheet_Column := j - 1;
                j := 'Z';
            END;
        END;

        FOR i := 5 TO Sheet_row - 1 DO BEGIN
            cell_value := xlWorkSheet2.Range(FORMAT(Sheet_Column) + FORMAT(i)).Value;
            IF cell_value > 8 THEN BEGIN
                xlWorkSheet2.Range(FORMAT(Sheet_Column) + FORMAT(i)).Font.Bold := TRUE;
                xlWorkSheet2.Range(FORMAT(Sheet_Column) + FORMAT(i)).Font.Color := -16776961;
                xlWorkSheet2.Range(FORMAT(Sheet_Column) + FORMAT(i)).Font.TintAndShade := -0.249977111117893;
            END
            ELSE
                IF cell_value < 8 THEN BEGIN
                    xlWorkSheet2.Range(FORMAT(Sheet_Column) + FORMAT(i)).Font.Bold := TRUE;
                    xlWorkSheet2.Range(FORMAT(Sheet_Column) + FORMAT(i)).Font.Color := -1003520;
                    xlWorkSheet2.Range(FORMAT(Sheet_Column) + FORMAT(i)).Font.TintAndShade := -0.249977111117893;
                END;
        END;
        xlWorkSheet2.Range(FORMAT(FORMAT(Sheet_Column) + '5:' + FORMAT(Sheet_Column) + FORMAT(Sheet_row))).Select;
        Fname := '\\oldrecep\SHARE\Sundar\Production plan.xlsx';
        xlWorkBook := xlApp.ActiveWorkbook;
        IF FILE.EXISTS(Fname) THEN
            ERASE(Fname);
        xlWorkBook.SaveAs(Fname);
        CLEAR(xlApp);
    end;

    trigger OnPreReport();
    begin
        Row := 1;
        CREATE(xlApp, TRUE, TRUE);
    end;

    var
        Row: Integer;
        xlApp: Automation "'{00020813-0000-0000-C000-000000000046}' 1.3:'{00024500-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.3'.Application";
        xlWorkBook: Automation "'{00020813-0000-0000-C000-000000000046}' 1.3:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.3'.Workbook";
        xlWorkSheet: Automation "'{00020813-0000-0000-C000-000000000046}' 1.3:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.3'.Worksheet";
        xlWorkSheet2: Automation "'{00020813-0000-0000-C000-000000000046}' 1.3:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.3'.Worksheet";
        xlPivotTable: Automation "'{00020813-0000-0000-C000-000000000046}' 1.3:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.3'.PivotTable";
        xlPivotCache: Automation "'{00020813-0000-0000-C000-000000000046}' 1.3:'{0002441C-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.3'.PivotCache";
        xlPivotCaches: Automation "'{00020813-0000-0000-C000-000000000046}' 1.3:'{0002441D-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.3'.PivotCaches";
        xlRange: Automation "'{00020813-0000-0000-C000-000000000046}' 1.3:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.3'.Range";
        xlPivotField: Automation "'{00020813-0000-0000-C000-000000000046}' 1.3:'{00020874-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.3'.PivotField";
        xlWorkSheet3: Automation "'{00020813-0000-0000-C000-000000000046}' 1.3:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.3'.Worksheet";
        xlSheetName: Text[100];
        ExcelBuffer: Record "Excel Buffer" temporary;
        NoOfColumns: Integer;
        Fname: Text[50];
        Item: Record Item;
        xlWorkSheet1: Automation "'{00020813-0000-0000-C000-000000000046}' 1.3:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.3'.Worksheet";
        xlWorkBooks: Automation "'{00020813-0000-0000-C000-000000000046}' 1.3:'{000208DB-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.3'.Workbooks";
        xlSheets: Automation "'{00020813-0000-0000-C000-000000000046}' 1.3:'{000208D7-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.3'.Sheets";
        Sheet_row: Integer;
        Sheet_Column: Char;
        i: Integer;
        cell_value: Decimal;
        j: Char;

    [LineStart(10590)]
    procedure OpenExistingXlsWorkbook(Fname: Text[250]; SheetNr: Integer);
    var
        WorksheetAlreadyOpen: Boolean;
        ThisWorkbook: Automation "'{00020813-0000-0000-C000-000000000046}' 1.3:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.3'.Workbook";
    begin
    end;

    //event xlWorkSheet3(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
    /*
    */
    //end;

    //event xlWorkSheet3(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event xlWorkSheet3(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event xlWorkSheet3();
    //begin
    /*
    */
    //end;

    //event xlWorkSheet3();
    //begin
    /*
    */
    //end;

    //event xlWorkSheet3();
    //begin
    /*
    */
    //end;

    //event xlWorkSheet3(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
    /*
    */
    //end;

    //event xlWorkSheet3(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
    /*
    */
    //end;

    //event xlWorkSheet3(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
    /*
    */
    //end;

    //event xlWorkSheet2(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
    /*
    */
    //end;

    //event xlWorkSheet2(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event xlWorkSheet2(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event xlWorkSheet2();
    //begin
    /*
    */
    //end;

    //event xlWorkSheet2();
    //begin
    /*
    */
    //end;

    //event xlWorkSheet2();
    //begin
    /*
    */
    //end;

    //event xlWorkSheet2(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
    /*
    */
    //end;

    //event xlWorkSheet2(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
    /*
    */
    //end;

    //event xlWorkSheet2(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
    /*
    */
    //end;

    //event xlWorkSheet(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
    /*
    */
    //end;

    //event xlWorkSheet(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event xlWorkSheet(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event xlWorkSheet();
    //begin
    /*
    */
    //end;

    //event xlWorkSheet();
    //begin
    /*
    */
    //end;

    //event xlWorkSheet();
    //begin
    /*
    */
    //end;

    //event xlWorkSheet(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
    /*
    */
    //end;

    //event xlWorkSheet(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
    /*
    */
    //end;

    //event xlWorkSheet(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
    /*
    */
    //end;

    //event xlWorkBook();
    //begin
    /*
    */
    //end;

    //event xlWorkBook();
    //begin
    /*
    */
    //end;

    //event xlWorkBook();
    //begin
    /*
    */
    //end;

    //event xlWorkBook(var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event xlWorkBook(SaveAsUI : Boolean;var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event xlWorkBook(var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event xlWorkBook(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH");
    //begin
    /*
    */
    //end;

    //event xlWorkBook();
    //begin
    /*
    */
    //end;

    //event xlWorkBook();
    //begin
    /*
    */
    //end;

    //event xlWorkBook(Wn : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020893-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Window");
    //begin
    /*
    */
    //end;

    //event xlWorkBook(Wn : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020893-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Window");
    //begin
    /*
    */
    //end;

    //event xlWorkBook(Wn : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020893-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Window");
    //begin
    /*
    */
    //end;

    //event xlWorkBook(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
    /*
    */
    //end;

    //event xlWorkBook(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event xlWorkBook(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event xlWorkBook(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH");
    //begin
    /*
    */
    //end;

    //event xlWorkBook(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH");
    //begin
    /*
    */
    //end;

    //event xlWorkBook(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH");
    //begin
    /*
    */
    //end;

    //event xlWorkBook(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
    /*
    */
    //end;

    //event xlWorkBook(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
    /*
    */
    //end;

    //event xlWorkBook(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
    /*
    */
    //end;

    //event xlWorkBook(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
    /*
    */
    //end;

    //event xlWorkBook(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
    /*
    */
    //end;

    //event xlWorkBook(SyncEventType : Integer);
    //begin
    /*
    */
    //end;

    //event xlWorkBook(Map : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{0002447B-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.XmlMap";Url : Text[1024];IsRefresh : Boolean;var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event xlWorkBook(Map : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{0002447B-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.XmlMap";IsRefresh : Boolean;Result : Integer);
    //begin
    /*
    */
    //end;

    //event xlWorkBook(Map : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{0002447B-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.XmlMap";Url : Text[1024];var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event xlWorkBook(Map : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{0002447B-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.XmlMap";Url : Text[1024];Result : Integer);
    //begin
    /*
    */
    //end;

    //event xlWorkBook(Description : Text[1024];Sheet : Text[1024];Success : Boolean);
    //begin
    /*
    */
    //end;

    //event xlApp(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook");
    //begin
    /*
    */
    //end;

    //event xlApp(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
    /*
    */
    //end;

    //event xlApp(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event xlApp(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event xlApp(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH");
    //begin
    /*
    */
    //end;

    //event xlApp(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH");
    //begin
    /*
    */
    //end;

    //event xlApp(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH");
    //begin
    /*
    */
    //end;

    //event xlApp(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
    /*
    */
    //end;

    //event xlApp(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook");
    //begin
    /*
    */
    //end;

    //event xlApp(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook");
    //begin
    /*
    */
    //end;

    //event xlApp(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook");
    //begin
    /*
    */
    //end;

    //event xlApp(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event xlApp(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";SaveAsUI : Boolean;var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event xlApp(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event xlApp(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH");
    //begin
    /*
    */
    //end;

    //event xlApp(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook");
    //begin
    /*
    */
    //end;

    //event xlApp(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook");
    //begin
    /*
    */
    //end;

    //event xlApp(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Wn : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020893-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Window");
    //begin
    /*
    */
    //end;

    //event xlApp(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Wn : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020893-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Window");
    //begin
    /*
    */
    //end;

    //event xlApp(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Wn : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020893-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Window");
    //begin
    /*
    */
    //end;

    //event xlApp(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
    /*
    */
    //end;

    //event xlApp(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
    /*
    */
    //end;

    //event xlApp(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
    /*
    */
    //end;

    //event xlApp(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
    /*
    */
    //end;

    //event xlApp(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";SyncEventType : Integer);
    //begin
    /*
    */
    //end;

    //event xlApp(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Map : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{0002447B-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.XmlMap";Url : Text[1024];IsRefresh : Boolean;var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event xlApp(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Map : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{0002447B-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.XmlMap";IsRefresh : Boolean;Result : Integer);
    //begin
    /*
    */
    //end;

    //event xlApp(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Map : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{0002447B-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.XmlMap";Url : Text[1024];var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event xlApp(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Map : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{0002447B-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.XmlMap";Url : Text[1024];Result : Integer);
    //begin
    /*
    */
    //end;

    //event xlApp(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Description : Text[1024];Sheet : Text[1024];Success : Boolean);
    //begin
    /*
    */
    //end;

    //event xlApp();
    //begin
    /*
    */
    //end;

    //event xlWorkSheet1(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
    /*
    */
    //end;

    //event xlWorkSheet1(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event xlWorkSheet1(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event xlWorkSheet1();
    //begin
    /*
    */
    //end;

    //event xlWorkSheet1();
    //begin
    /*
    */
    //end;

    //event xlWorkSheet1();
    //begin
    /*
    */
    //end;

    //event xlWorkSheet1(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
    /*
    */
    //end;

    //event xlWorkSheet1(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
    /*
    */
    //end;

    //event xlWorkSheet1(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
    /*
    */
    //end;
}

