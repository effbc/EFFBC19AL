report 50234 "Shortage excel_New"
{
    // version Rev01

    //   xlWorkSheet3.Range('A1').Value := 'Production Order no.';
    //   xlWorkSheet3.Range('B1').Value := 'Production Start Date';
    //   xlWorkSheet3.Range('C1').Value := 'Sale order no';
    //   xlWorkSheet3.Range('D1').Value := 'Bill to Name';
    //   xlWorkSheet3.Range('E1').Value := 'Project Completion Date';
    //   xlWorkSheet3.Range('F1').Value := 'Sales Executive name';
    //   xlWorkSheet3.Range('G1').Value := 'Final Product';
    //   xlWorkSheet3.Range('H1').Value := 'Item Sub Group Code';
    //   xlWorkSheet3.Range('I1').Value := 'Quantity';
    //   xlWorkSheet3.Range('J1').Value := 'No.of Units';
    //   xlWorkSheet3.Range('K1').Value := 'Type';
    //   xlWorkSheet3.Range('L1').Value := 'Shortage';
    DefaultLayout = RDLC;
    RDLCLayout = './Shortage excel_New.rdlc';


    dataset
    {
        dataitem("Production Order"; "Production Order")
        {

            trigger OnAfterGetRecord();
            begin
                Row += 1;
                xlWorkSheet1.Range('A' + FORMAT(Row)).Value := "Production Order"."No.";
                xlWorkSheet1.Range('B' + FORMAT(Row)).Value := "Production Order"."Prod Start date";
                Item.RESET;
                Item.SETFILTER(Item."No.", "Production Order"."Source No.");
                IF Item.FINDFIRST THEN BEGIN
                    xlWorkSheet1.Range('C' + FORMAT(Row)).Value := Item."Item Sub Group Code";
                    xlWorkSheet1.Range('D' + FORMAT(Row)).Value := Item."No.of Units" * "Production Order".Quantity;
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

                xlWorkSheet1 := xlApp.ActiveSheet;
                xlWorkSheet1.Name := 'Production_Plan';
                xlSheetName := xlWorkSheet1.Name;
                xlSheetName := CONVERTSTR(xlSheetName, ' -+', '___');
                xlWorkSheet1.Range('A1').Value := 'Production Order no.';
                xlWorkSheet1.Range('B1').Value := 'Production Start Date';
                xlWorkSheet1.Range('C1').Value := 'Product Type';
                xlWorkSheet1.Range('D1').Value := 'No.of Units';
                xlWorkSheet1.Range('E1').Value := 'Shortage';
                "Production Order".SETFILTER("Production Order"."Prod Start date", '>%1', TODAY);
            end;
        }
        dataitem(ILN; "Item Lot Numbers")
        {
            DataItemTableView = SORTING(Production Order No., Possible Production Plan Date) ORDER(Ascending) WHERE(Shortage = FILTER(> 0), Sales Order No.=FILTER(<>''),Authorisation=FILTER(WAP|WFA));

            trigger OnAfterGetRecord();
            begin
                 /* Item.RESET;
                  Item.SETFILTER(Item."No.",ILN."Item No");
                  IF Item.FINDFIRST THEN
                  BEGIN*/
                  ST.RESET;
                  ST.SETFILTER(ST."Item No.",ILN."Item No");
                  IF ST.FINDFIRST THEN
                    SUM+= ILN.Shortage*ST."Unit Cost"
                  ELSE
                    SUM+= ILN.Shortage*ILN."Unit Cost";
                 // END;

            end;

            trigger OnPostDataItem();
            begin
                  FOR i:= 1 TO 1000 DO
                  BEGIN
                    IF FORMAT(xlWorkSheet1.Range('A' + FORMAT(i)).Value) = '' THEN
                    BEGIN
                      Sheet_row:=i-1;
                      i:=1000;
                    END;
                  END;


                  FOR i:=2 TO Sheet_row DO
                  BEGIN
                  Formula:='=SUMIFS(Shortage_Data!L:L,Shortage_Data!A:A,Production_Plan!A'+FORMAT(i)+')';
                  xlWorkSheet1.Range('E'+FORMAT(i)).Formula:=Formula;
                  END;
                  xlWorkSheet1.Columns.AutoFit ;
            end;

            trigger OnPreDataItem();
            begin
                  xlApp.Worksheets.Add();

                  xlWorkSheet3 := xlApp.ActiveSheet;
                  xlWorkSheet3.Name := 'Shortage_Data';
                  xlSheetName:=xlWorkSheet3.Name;
                  xlSheetName := CONVERTSTR(xlSheetName,' -+','___');
                  xlWorkSheet3.Range('A1').Value := 'Production Order no.';
                  xlWorkSheet3.Range('B1').Value := 'Production Start Date';
                  xlWorkSheet3.Range('C1').Value := 'Sale order no';
                  xlWorkSheet3.Range('D1').Value := 'Bill to Name';
                  xlWorkSheet3.Range('E1').Value := 'Project Completion Date';
                  xlWorkSheet3.Range('F1').Value := 'Sales Executive name';
                  xlWorkSheet3.Range('G1').Value := 'Final Product';
                  xlWorkSheet3.Range('H1').Value := 'Item Sub Group Code';
                  xlWorkSheet3.Range('I1').Value := 'Quantity';
                  xlWorkSheet3.Range('J1').Value := 'No.of Units';
                  xlWorkSheet3.Range('K1').Value := 'Type';
                  xlWorkSheet3.Range('L1').Value := 'Shortage';
                  Row:=1;
                   SUM:=0;
            end;
        }
        dataitem("Item Lot Numbers";"Item Lot Numbers")
        {
            DataItemTableView = SORTING(Item No) ORDER(Ascending) WHERE(Shortage=FILTER(>0),Sales Order No.=FILTER(<>''),Planned Date=FILTER(>01/04/12),Authorisation=FILTER(WAP|WFA));

            trigger OnAfterGetRecord();
            begin
                   IF  ("Item Lot Numbers"."Item No"<>Prev_Item) THEN
                   BEGIN
                     Order_Qty:=0;
                     // CALCULATING "PURCHASE ORDER QUANTITY" BASED ON "MINIMUM ORDER" & "STANDARD PACKING " QUANTITY WHICH IS IN ITEM CARD
                     // FOR MORE INFORMATION PLEASE STUDY "MOQ SCENARIOS DOCUMENT"
                     IF Item.GET(Prev_Item) THEN
                     BEGIN
                       IF (Item."Minimum Order Quantity">0) AND (Item."Standard Packing Quantity"=0) THEN
                       BEGIN
                         IF Item."Minimum Order Quantity">1 THEN
                         BEGIN
                           IF Tot_Shortage<Item."Minimum Order Quantity" THEN
                             Order_Qty:=Item."Minimum Order Quantity"
                           ELSE
                             Order_Qty:=Tot_Shortage;
                         END ELSE
                               Order_Qty:=Tot_Shortage;

                       END ELSE IF (Item."Minimum Order Quantity">0) AND (Item."Standard Packing Quantity"<=Item."Minimum Order Quantity") THEN
                       BEGIN
                         IF Item."Minimum Order Quantity">1 THEN
                         BEGIN
                           IF Tot_Shortage<Item."Minimum Order Quantity" THEN
                              Order_Qty:=Item."Minimum Order Quantity"
                           ELSE
                           BEGIN
                             IF Item."Minimum Order Quantity"=1 THEN
                                Order_Qty:=(Tot_Shortage DIV Item."Standard Packing Quantity" )*Item."Standard Packing Quantity"
                             ELSE
                               Order_Qty:=((Tot_Shortage DIV Item."Standard Packing Quantity" )+1)*Item."Standard Packing Quantity"
                           END;
                         END ELSE
                            Order_Qty:=Tot_Shortage;
                       END ELSE IF (Item."Minimum Order Quantity">0) AND (Item."Standard Packing Quantity">Item."Minimum Order Quantity") THEN
                       BEGIN
                         IF Item."Minimum Order Quantity">1 THEN
                         BEGIN
                           IF Tot_Shortage<Item."Minimum Order Quantity" THEN
                             Order_Qty:=Item."Minimum Order Quantity"
                           ELSE
                             Order_Qty:=((Tot_Shortage DIV Item."Minimum Order Quantity" )+1)*Item."Minimum Order Quantity"
                         END ELSE
                           Order_Qty:=Tot_Shortage;
                       END ELSE IF (Item."Minimum Order Quantity"=0) AND (Item."Standard Packing Quantity">0) THEN
                       BEGIN
                          IF Tot_Shortage<Item."Standard Packing Quantity" THEN
                              Order_Qty:=Item."Standard Packing Quantity"
                          ELSE
                             Order_Qty:=((Tot_Shortage DIV Item."Standard Packing Quantity" )+1)*Item."Standard Packing Quantity"
                       END;
                     END;
                     IF Order_Qty >Tot_Shortage THEN
                     BEGIN
                       i+=1;
                       ST.RESET;
                       ST.SETFILTER(ST."Item No.",Prev_Item);
                        IF ST.FINDFIRST THEN
                          xlWorkSheet3.Range('V' + FORMAT(i)).Value := (Order_Qty-Tot_Shortage)*ST."Unit Cost"
                        ELSE
                          xlWorkSheet3.Range('V' + FORMAT(i)).Value := (Order_Qty-Tot_Shortage)*Item."Avg Unit Cost";

                       MOQ_VALUE+=(Order_Qty-Tot_Shortage)*Item."Avg Unit Cost";
                       xlWorkSheet3.Range('S' + FORMAT(i)).Value := Item.Description;
                       xlWorkSheet3.Range('T' + FORMAT(i)).Value := Tot_Shortage;
                       xlWorkSheet3.Range('U' + FORMAT(i)).Value := Order_Qty;
                      // xlWorkSheet3.Range('V' + FORMAT(i)).Value := (Order_Qty-Tot_Shortage)*Item."Avg Unit Cost";
                     END;

                     Prev_Item:="Item Lot Numbers"."Item No";
                     Tot_Shortage:="Item Lot Numbers".Shortage;
                   END
                   ELSE
                   BEGIN
                     Tot_Shortage+="Item Lot Numbers".Shortage;
                   END;
                   IF (Prev_Item ='') THEN
                   BEGIN
                     Prev_Item:="Item Lot Numbers"."Item No";
                     Tot_Shortage:="Item Lot Numbers".Shortage;
                   END;
            end;

            trigger OnPostDataItem();
            begin
                     Order_Qty:=0;
                     // CALCULATING "PURCHASE ORDER QUANTITY" BASED ON "MINIMUM ORDER" & "STANDARD PACKING " QUANTITY WHICH IS IN ITEM CARD
                     // FOR MORE INFORMATION PLEASE STUDY "MOQ SCENARIOS DOCUMENT"
                     IF Item.GET(Prev_Item) THEN
                     BEGIN
                       IF (Item."Minimum Order Quantity">0) AND (Item."Standard Packing Quantity"=0) THEN
                       BEGIN
                         IF Item."Minimum Order Quantity">1 THEN
                         BEGIN
                           IF Tot_Shortage<Item."Minimum Order Quantity" THEN
                             Order_Qty:=Item."Minimum Order Quantity"
                           ELSE
                             Order_Qty:=Tot_Shortage;
                         END ELSE
                               Order_Qty:=Tot_Shortage;

                       END ELSE IF (Item."Minimum Order Quantity">0) AND (Item."Standard Packing Quantity"<=Item."Minimum Order Quantity") THEN
                       BEGIN
                         IF Item."Minimum Order Quantity">1 THEN
                         BEGIN
                           IF Tot_Shortage<Item."Minimum Order Quantity" THEN
                              Order_Qty:=Item."Minimum Order Quantity"
                           ELSE
                           BEGIN
                             IF Item."Minimum Order Quantity"=1 THEN
                                Order_Qty:=(Tot_Shortage DIV Item."Standard Packing Quantity" )*Item."Standard Packing Quantity"
                             ELSE
                               Order_Qty:=((Tot_Shortage DIV Item."Standard Packing Quantity" )+1)*Item."Standard Packing Quantity"
                           END;
                         END ELSE
                            Order_Qty:=Tot_Shortage;
                       END ELSE IF (Item."Minimum Order Quantity">0) AND (Item."Standard Packing Quantity">Item."Minimum Order Quantity") THEN
                       BEGIN
                         IF Item."Minimum Order Quantity">1 THEN
                         BEGIN
                           IF Tot_Shortage<Item."Minimum Order Quantity" THEN
                             Order_Qty:=Item."Minimum Order Quantity"
                           ELSE
                             Order_Qty:=((Tot_Shortage DIV Item."Minimum Order Quantity" )+1)*Item."Minimum Order Quantity"
                         END ELSE
                           Order_Qty:=Tot_Shortage;
                       END ELSE IF (Item."Minimum Order Quantity"=0) AND (Item."Standard Packing Quantity">0) THEN
                       BEGIN
                          IF Tot_Shortage<Item."Standard Packing Quantity" THEN
                              Order_Qty:=Item."Standard Packing Quantity"
                          ELSE
                             Order_Qty:=((Tot_Shortage DIV Item."Standard Packing Quantity" )+1)*Item."Standard Packing Quantity"
                       END;
                     END;
                     IF Order_Qty >Tot_Shortage THEN
                     BEGIN
                       i+=1;
                       ST.RESET;
                       ST.SETFILTER(ST."Item No.",ILN."Item No");
                        IF ST.FINDFIRST THEN
                          xlWorkSheet3.Range('V' + FORMAT(i)).Value := (Order_Qty-Tot_Shortage)*ST."Unit Cost"
                        ELSE
                          xlWorkSheet3.Range('V' + FORMAT(i)).Value := (Order_Qty-Tot_Shortage)*Item."Avg Unit Cost";

                       MOQ_VALUE+=(Order_Qty-Tot_Shortage)*Item."Avg Unit Cost";
                       xlWorkSheet3.Range('S' + FORMAT(i)).Value := Item.Description;
                       xlWorkSheet3.Range('T' + FORMAT(i)).Value := Tot_Shortage;
                       xlWorkSheet3.Range('U' + FORMAT(i)).Value := Order_Qty;
                      // xlWorkSheet3.Range('V' + FORMAT(i)).Value := (Order_Qty-Tot_Shortage)*Item."Avg Unit Cost";
                     END;
            end;

            trigger OnPreDataItem();
            begin
                  Prev_Item :='';
                
                 /* xlApp.Worksheets.Add();
                
                  xlWorkSheet4 := xlApp.ActiveSheet;
                  xlWorkSheet4.Name := 'Data_MOQ';
                  xlSheetName:=xlWorkSheet4.Name;
                  xlSheetName := CONVERTSTR(xlSheetName,' -+','___');*/
                
                  xlWorkSheet3.Range('S1').Value := 'Item';
                  xlWorkSheet3.Range('T1').Value := 'Shortage';
                  xlWorkSheet3.Range('U1').Value := 'Order Quantity';
                  xlWorkSheet3.Range('V1').Value := 'MOQ';
                  i:=1;
                 MOQ_VALUE:=0;

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

    trigger OnPostReport();
    begin
            xlWorkSheet3.Range('A1').Select;
            xlWorkSheet3.Columns.AutoFit ;
            xlWorkSheet3.Range('L:L').NumberFormat:='_ * #,##0_ ;_ * -#,##0_ ;_ * ""-""??_ ;_ @_ ';

            ExcelBuffer.VALIDATE("Column No.",12 + NoOfColumns);
            //MESSAGE(STRSUBSTNO('%1!A1:%2%3', xlWorkSheet3.Name, ExcelBuffer.xlColID, Row));
            xlPivotCache :=
              xlApp.ActiveWorkbook.PivotCaches.Add(1,STRSUBSTNO('%1!A1:%2%3',
            xlWorkSheet3.Name, ExcelBuffer.xlColID, Row));
            xlWorkSheet3.Select;



            xlPivotCache.CreatePivotTable('','PivotTable1');
            xlWorkSheet2 := xlApp.ActiveSheet();
            xlWorkSheet2.Name := 'Summary';
            xlPivotTable := xlWorkSheet2.PivotTables('PivotTable1');

            xlPivotField := xlPivotTable.PivotFields('Type');
            xlApp.Visible := TRUE;
            xlPivotField.Orientation := 1;
            xlPivotField.Position := 1;
            xlPivotField.Subtotals(1,FALSE);

            xlPivotField := xlPivotTable.PivotFields('Sales Executive name');
            xlApp.Visible := TRUE;
            xlPivotField.Orientation := 1;
            xlPivotField.Position := 2;
            xlPivotField.Subtotals(1,FALSE);


            xlPivotField := xlPivotTable.PivotFields('Bill to Name');
            xlApp.Visible := TRUE;
            xlPivotField.Orientation := 1;
            xlPivotField.Position := 3;
            xlPivotField.Subtotals(1,FALSE);


            xlPivotField := xlPivotTable.PivotFields('Production Start Date');
            xlApp.Visible := TRUE;
            xlPivotField.Orientation := 1;
            xlPivotField.Position := 4;
            xlPivotField.Subtotals(1,FALSE);

            xlPivotField := xlPivotTable.PivotFields('Project Completion Date');
            xlApp.Visible := TRUE;
            xlPivotField.Orientation := 1;
            xlPivotField.Position := 5;
            xlPivotField.Subtotals(1,FALSE);

            xlPivotField := xlPivotTable.PivotFields('Item Sub Group Code');
            xlApp.Visible := TRUE;
            xlPivotField.Orientation := 1;
            xlPivotField.Position := 6;
            xlPivotField.Subtotals(1,FALSE);

            xlPivotField := xlPivotTable.PivotFields('Quantity');
            xlApp.Visible := TRUE;
            xlPivotField.Orientation := 4;
            xlPivotField.Position := 1;
            xlPivotField."Function":=0;
            xlPivotField.Caption:=' Quantity';


            xlPivotField := xlPivotTable.PivotFields('Shortage');
            xlApp.Visible := TRUE;
            xlPivotField.Orientation := 4;
            xlPivotField.Position := 2;
            xlPivotField."Function":=0;
            xlPivotField.Caption:='Shortage Value';

            xlPivotField := xlPivotTable.DataPivotField;
            xlApp.Visible := TRUE;
            xlPivotField.Orientation := 2;
            xlPivotField.Position := 1;

            xlWorkSheet2.Columns.AutoFit ;
            xlWorkSheet2.Range('G:G').NumberFormat:='_ * #,##0_ ;_ * -#,##0_ ;_ * ""-""??_ ;_ @_ ';
            xlWorkSheet2.Range('H:H').NumberFormat:='_ * #,##0_ ;_ * -#,##0_ ;_ * ""-""??_ ;_ @_ ';


        // Pivot table 2
            ExcelBuffer.VALIDATE("Column No.",5 + NoOfColumns);

            xlPivotCache :=
              xlApp.ActiveWorkbook.PivotCaches.Add(1,STRSUBSTNO('%1!A1:%2%3',
            xlWorkSheet1.Name, ExcelBuffer.xlColID, Sheet_row));


            xlPivotCache.CreatePivotTable(xlWorkSheet2.Range('K3:K3'),'PivotTable2');
            xlPivotTable := xlWorkSheet2.PivotTables('PivotTable2');

            xlPivotField := xlPivotTable.PivotFields('Production Start Date');
            xlApp.Visible := TRUE;
            xlPivotField.Orientation := 1;
            xlPivotField.Position := 1;
            xlPivotField.Subtotals(1,FALSE);

            xlPivotField := xlPivotTable.PivotFields('Shortage');
            xlApp.Visible := TRUE;
            xlPivotField.Orientation := 4;
            xlPivotField.Position := 1;
            xlPivotField."Function":=0;
            xlPivotField.Caption:='Shortage Value';

            xlPivotField := xlPivotTable.PivotFields('No.of Units');
            xlApp.Visible := TRUE;
            xlPivotField.Orientation := 4;
            xlPivotField.Position := 2;
            xlPivotField."Function":=0;
            xlPivotField.Caption:='Units Planned';

            xlPivotField := xlPivotTable.DataPivotField;
            xlApp.Visible := TRUE;
            xlPivotField.Orientation := 2;
            xlPivotField.Position := 1;

            xlPivotField := xlPivotTable.PivotFields('Production Start Date');
            xlPivotField.AutoSort(1,'Production Start Date');

        //Pivot table 3
            xlPivotCache.CreatePivotTable(xlWorkSheet2.Range('N3:N3'),'PivotTable3');
            xlPivotTable := xlWorkSheet2.PivotTables('PivotTable3');

            xlPivotField := xlPivotTable.PivotFields('Production Start Date');
            xlApp.Visible := TRUE;
            xlPivotField.Orientation := 1;
            xlPivotField.Position := 1;
            xlPivotField.Subtotals(1,FALSE);

            xlPivotField := xlPivotTable.PivotFields('Product Type');
            xlApp.Visible := TRUE;
            xlPivotField.Orientation := 2;
            xlPivotField.Position := 1;


            xlPivotField := xlPivotTable.PivotFields('No.of Units');
            xlApp.Visible := TRUE;
            xlPivotField.Orientation := 4;
            xlPivotField.Position := 1;
            xlPivotField."Function":=0;

            xlPivotField := xlPivotTable.PivotFields('Production Start Date');
            xlPivotField.AutoSort(1,'Production Start Date');

            xlWorkSheet2.Range('O1:AC1000').NumberFormat:='_ * #,##0_ ;_ * -#,##0_ ;_ * ""-""??_ ;_ @_ ';
            xlWorkSheet2.Columns.AutoFit ;

            xlRange:=xlWorkSheet2.Range('N:N');
            xlRange.Columns().Hidden:=TRUE;

            xlWorkSheet2.Range('L:L').NumberFormat:='_ * #,##0_ ;_ * -#,##0_ ;_ * ""-""??_ ;_ @_ ';

            xlWorkSheet2.Range('J1').Interior.Color := 255;
            xlWorkSheet2.Range('k1').Value := 'Days having Production Plan Less than 8 DL Units';
            xlWorkSheet2.Range('J2').Interior.Color := 15773696;
            xlWorkSheet2.Range('k2').Value := 'Days having Production Plan Greater than 8 DL Units';


        Sheet_row:=0;
        FOR i:= 5 TO 100 DO
        BEGIN
          IF FORMAT(xlWorkSheet2.Range('K' + FORMAT(i)).Value) = 'Grand Total' THEN
          BEGIN
            Sheet_row:=i;
            i:=100;
          END;
        END;

        FOR i:= 5 TO Sheet_row-1 DO
        BEGIN
          cell_value:= xlWorkSheet2.Range('M'+FORMAT(i)).Value;
          IF cell_value > 8 THEN
          BEGIN
            xlWorkSheet2.Range('M'+FORMAT(i)).Font.Bold:=TRUE;
            xlWorkSheet2.Range('M'+FORMAT(i)).Font.Color := -1003520;
            xlWorkSheet2.Range('M'+FORMAT(i)).Font.TintAndShade := -0.249977111117893;
          END
          ELSE IF cell_value < 8 THEN
          BEGIN
            xlWorkSheet2.Range('M'+FORMAT(i)).Font.Bold:=TRUE;
            xlWorkSheet2.Range('M'+FORMAT(i)).Font.Color :=-16776961 ;
            xlWorkSheet2.Range('M'+FORMAT(i)).Font.TintAndShade := -0.249977111117893;
          END;
        END;

         xlWorkSheet2.Range('K'+FORMAT(Sheet_row+3)).Value:='Shortage';
         xlWorkSheet2.Range('K'+FORMAT(Sheet_row+4)).Value:='Excess_MOQ';
         xlWorkSheet2.Range('K'+FORMAT(Sheet_row+5)).Value:='Authorization Value';

         Formula:= '=SUM(L'+FORMAT(Sheet_row+3)+':L'+FORMAT(Sheet_row+4)+')';
         xlWorkSheet2.Range('L'+FORMAT(Sheet_row+3)).Formula:='=SUM(Shortage_Data!L:L)';
         xlWorkSheet2.Range('L'+FORMAT(Sheet_row+4)).Formula:='=SUM(Shortage_Data!V:V)';
         xlWorkSheet2.Range('L'+FORMAT(Sheet_row+5)).Formula:= Formula;

            xlWorkSheet2.Range('K'+FORMAT(Sheet_row+3)+':K'+ FORMAT(Sheet_row+5)).Font.Bold:=TRUE;
            xlWorkSheet2.Range('K'+FORMAT(Sheet_row+3)+':K'+ FORMAT(Sheet_row+5)).Font.Color :=-11489280 ;
            xlWorkSheet2.Range('K'+FORMAT(Sheet_row+3)+':K'+ FORMAT(Sheet_row+5)).Font.TintAndShade := -0.249977111117893;

        //Fname:='\\erpserver\ErpAttachments\Authorisation Material '+FORMAT(TODAY,0,'<Day>-<Month Text,3>-<Year4>')+'.xlsx';
        Fname:='\\erpserver\ErpAttachments\Shortage_Test.xlsx';
        //Fname:='\\oldrecep\SHARE\Sundar\Shortage.xlsx';
        xlWorkBook:=xlApp.ActiveWorkbook;
        IF FILE.EXISTS(Fname) THEN
           ERASE(Fname);
        xlWorkBook.SaveAs(Fname);
        xlWorkBook.Close;
        CLEAR(xlApp);
    end;

    trigger OnPreReport();
    begin
          Row:=1;
          CREATE(xlApp,TRUE,TRUE);
    end;

    var
        Row : Integer;
        Excel1 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024500-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Application";
        Range : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";
        Sheet1 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Worksheet";
        Sheet2 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Worksheet";
        Workbook : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";
        LD : Code[10];
        xlApp : Automation "'{00020813-0000-0000-C000-000000000046}' 1.3:'{00024500-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.3'.Application";
        xlWorkBook : Automation "'{00020813-0000-0000-C000-000000000046}' 1.3:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.3'.Workbook";
        xlWorkSheet : Automation "'{00020813-0000-0000-C000-000000000046}' 1.3:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.3'.Worksheet";
        xlWorkSheet2 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.3:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.3'.Worksheet";
        xlPivotTable : Automation "'{00020813-0000-0000-C000-000000000046}' 1.3:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.3'.PivotTable";
        xlPivotCache : Automation "'{00020813-0000-0000-C000-000000000046}' 1.3:'{0002441C-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.3'.PivotCache";
        xlPivotCaches : Automation "'{00020813-0000-0000-C000-000000000046}' 1.3:'{0002441D-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.3'.PivotCaches";
        xlRange : Automation "'{00020813-0000-0000-C000-000000000046}' 1.3:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.3'.Range";
        xlPivotField : Automation "'{00020813-0000-0000-C000-000000000046}' 1.3:'{00020874-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.3'.PivotField";
        xlWorkSheet3 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.3:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.3'.Worksheet";
        xlSheetName : Text[100];
        ExcelBuffer : Record "Excel Buffer" temporary;
        xlSheetName2 : Text[30];
        NoOfColumns : Integer;
        Fname : Text[150];
        Choice : Option Prod,Pur,PNUC;
        Item : Record Item;
        Order_Qty : Decimal;
        xlWorkSheet1 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.3:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.3'.Worksheet";
        cnt : Integer;
        xlWorkBooks : Automation "'{00020813-0000-0000-C000-000000000046}' 1.3:'{000208DB-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.3'.Workbooks";
        xlSheets : Automation "'{00020813-0000-0000-C000-000000000046}' 1.3:'{000208D7-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.3'.Sheets";
        PO : Record "Production Order";
        SH : Record "Sales Header";
        User : Record User;
        Sheet_row : Integer;
        i : Integer;
        cell_value : Decimal;
        Formula : Text[100];
        "SUM" : Decimal;
        Prev_Item : Code[30];
        Tot_Shortage : Decimal;
        MOQ_VALUE : Decimal;
        ST : Record "Shortage Temp";

    [LineStart(10139)]
    procedure OpenExistingXlsWorkbook(Fname : Text[250];SheetNr : Integer);
    var
        WorksheetAlreadyOpen : Boolean;
        ThisWorkbook : Automation "'{00020813-0000-0000-C000-000000000046}' 1.3:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.3'.Workbook";
    begin
        /*xlWorkBooks := xlApp.Workbooks;
        WorksheetAlreadyOpen := FALSE; // this is a local variable
        IF xlWorkBooks.Count > 0 THEN BEGIN
        ThisWorkbook := xlApp.ActiveWorkbook;
        WorksheetAlreadyOpen := (ThisWorkbook.FullName = Fname);
        END;
        IF NOT WorksheetAlreadyOpen THEN
        xlWorkBooks.Open(Fname);
        xlWorkBook := xlApp.ActiveWorkbook;
        xlSheets := xlWorkBook.Worksheets;
        xlWorkSheet := xlSheets.Item(SheetNr);
          */

    end;

    //event Sheet2(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet2(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet2(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet2();
    //begin
        /*
        */
    //end;

    //event Sheet2();
    //begin
        /*
        */
    //end;

    //event Sheet2();
    //begin
        /*
        */
    //end;

    //event Sheet2(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet2(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet2(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet1(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet1(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet1(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet1();
    //begin
        /*
        */
    //end;

    //event Sheet1();
    //begin
        /*
        */
    //end;

    //event Sheet1();
    //begin
        /*
        */
    //end;

    //event Sheet1(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet1(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet1(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook");
    //begin
        /*
        */
    //end;

    //event Excel1(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Excel1(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Excel1(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Excel1(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH");
    //begin
        /*
        */
    //end;

    //event Excel1(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH");
    //begin
        /*
        */
    //end;

    //event Excel1(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH");
    //begin
        /*
        */
    //end;

    //event Excel1(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook");
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook");
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook");
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";SaveAsUI : Boolean;var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH");
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook");
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook");
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Wn : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020893-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Window");
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Wn : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020893-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Window");
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Wn : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020893-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Window");
    //begin
        /*
        */
    //end;

    //event Excel1(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Excel1(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";SyncEventType : Integer);
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Map : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{0002447B-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.XmlMap";Url : Text[1024];IsRefresh : Boolean;var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Map : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{0002447B-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.XmlMap";IsRefresh : Boolean;Result : Integer);
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Map : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{0002447B-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.XmlMap";Url : Text[1024];var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Map : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{0002447B-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.XmlMap";Url : Text[1024];Result : Integer);
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Description : Text[1024];Sheet : Text[1024];Success : Boolean);
    //begin
        /*
        */
    //end;

    //event Excel1();
    //begin
        /*
        */
    //end;

    //event Workbook();
    //begin
        /*
        */
    //end;

    //event Workbook();
    //begin
        /*
        */
    //end;

    //event Workbook();
    //begin
        /*
        */
    //end;

    //event Workbook(var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Workbook(SaveAsUI : Boolean;var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Workbook(var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Workbook(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH");
    //begin
        /*
        */
    //end;

    //event Workbook();
    //begin
        /*
        */
    //end;

    //event Workbook();
    //begin
        /*
        */
    //end;

    //event Workbook(Wn : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020893-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Window");
    //begin
        /*
        */
    //end;

    //event Workbook(Wn : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020893-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Window");
    //begin
        /*
        */
    //end;

    //event Workbook(Wn : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020893-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Window");
    //begin
        /*
        */
    //end;

    //event Workbook(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Workbook(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Workbook(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Workbook(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH");
    //begin
        /*
        */
    //end;

    //event Workbook(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH");
    //begin
        /*
        */
    //end;

    //event Workbook(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH");
    //begin
        /*
        */
    //end;

    //event Workbook(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Workbook(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Workbook(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Workbook(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Workbook(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Workbook(SyncEventType : Integer);
    //begin
        /*
        */
    //end;

    //event Workbook(Map : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{0002447B-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.XmlMap";Url : Text[1024];IsRefresh : Boolean;var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Workbook(Map : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{0002447B-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.XmlMap";IsRefresh : Boolean;Result : Integer);
    //begin
        /*
        */
    //end;

    //event Workbook(Map : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{0002447B-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.XmlMap";Url : Text[1024];var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Workbook(Map : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{0002447B-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.XmlMap";Url : Text[1024];Result : Integer);
    //begin
        /*
        */
    //end;

    //event Workbook(Description : Text[1024];Sheet : Text[1024];Success : Boolean);
    //begin
        /*
        */
    //end;

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

