report 80019 "Material Availability (OLD)3"
{
    // version NAVW17.00.ESPL 1.0,Rev01

    DefaultLayout = RDLC;
    RDLCLayout = './Material Availability (OLD)3.rdlc';

    dataset
    {
        dataitem("<Integer1>";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(Integer1_Int1Body3;Int1Body3)
            {
            }
            column(BOM_1_;BOM[1])
            {
            }
            column(QTY_1_;QTY[1])
            {
            }
            column(BOM_DUM_1___No__;BOM_DUM[1]."No.")
            {
            }
            column(BOM_DUM_1__Description;BOM_DUM[1].Description)
            {
            }
            column(BOM_DUM_1___Budget_Quantity_;BOM_DUM[1]."Budget Quantity")
            {
            }
            column(Stock_AT_Stores_;"Stock AT Stores")
            {
            }
            column(Shortage_ByConsidering_Previou;Shortage_ByConsidering_Previou)
            {
            }
            column(BOM_DUM_1___Standard_Cost_;BOM_DUM[1]."Standard Cost")
            {
            }
            column(BOM_DUM_1___Unit_Cost_;BOM_DUM[1]."Unit Cost")
            {
            }
            column(BOM_DUM_1___Budget_Quantity___Stock_AT_Stores_;BOM_DUM[1]."Budget Quantity"-"Stock AT Stores")
            {
            }
            column(Required_ProductCaption;Required_ProductCaptionLbl)
            {
            }
            column(Requirerd_QuantityCaption;Requirerd_QuantityCaptionLbl)
            {
            }
            column(No_Caption;No_CaptionLbl)
            {
            }
            column(DescriptionCaption_Control1102154283;DescriptionCaption_Control1102154283Lbl)
            {
            }
            column(Required_QTYCaption_Control1102154284;Required_QTYCaption_Control1102154284Lbl)
            {
            }
            column(Qty_At_StoresCaption_Control1102154286;Qty_At_StoresCaption_Control1102154286Lbl)
            {
            }
            column(Overall_ShortageCaption;Overall_ShortageCaptionLbl)
            {
            }
            column(Qty__On_Purchase_OrderCaption_Control1102154288;Qty__On_Purchase_OrderCaption_Control1102154288Lbl)
            {
            }
            column(Qty__Under_InspectionCaption_Control1102154289;Qty__Under_InspectionCaption_Control1102154289Lbl)
            {
            }
            column(ShortageCaption;ShortageCaptionLbl)
            {
            }
            column(Integer1__Number;Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "Breaka" THEN
                CurrReport.BREAK ;


                IF BOM_DUM[1].NEXT=0 THEN
                "Breaka":=TRUE;

                //Rev01
                //<Integer1>, Header (2) - OnPreSection()
                Sheet1.Range('c1').Value :='Shortage material ';
                Sheet1.Range('A2').Value := 'Item No.';
                Sheet1.Range('b2').Value := 'Description';
                Sheet1.Range('c2').Value := 'Required Quantity';
                Sheet1.Range('d2').Value := 'Quantity At Stores';
                Sheet1.Range('e2').Value := 'Quantity At Machine Location';
                Sheet1.Range('f2').Value:='UOM';
                Sheet1.Range('g2').Value := 'Shortage';
                Sheet1.Range('h2').Value := 'Overall Shortage';
                Sheet1.Range('i2').Value := 'Qty. On Purchase Order';
                Sheet1.Range('j2').Value := 'Qty. Under Inspection';
                 Row:=2;
                //<Integer1>, Header (2) - OnPreSection()

                //<Integer1>, Body (3) - OnPreSection()
                "Stock AT Stores":=0;
                Shortage_ByConsidering_Previou:=0;

                IF Dum.GET(BOM_DUM[PROD_NO]."No.") THEN BEGIN
                  "Stock AT Stores":=Dum."Maximum Inventory";
                  Shortage_ByConsidering_Previou:=Dum."Reorder Quantity";
                END;

                Int1Body3 := CurrReport.SHOWOUTPUT(BOM_DUM[PROD_NO]."Reorder Quantity">0); //Rev01
                //ERROR('%1',Int1Body3);    swathi
                IF BOM_DUM[PROD_NO]."Reorder Quantity">0 THEN BEGIN
                  Row+=1;
                  Sheet1.Range('a'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO]."No." ;
                  Sheet1.Range('b'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO].Description ;
                  Sheet1.Range('c'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO]."Budget Quantity" ;
                  Sheet1.Range('d'+FORMAT(Row)).Value :=FORMAT("Stock AT Stores") ;
                  Sheet1.Range('f'+FORMAT(Row)).Value :=FORMAT( BOM_DUM[PROD_NO]."Base Unit of Measure") ;
                  Sheet1.Range('e'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Stock at Stores") ;
                  IF Shortage_ByConsidering_Previou=(BOM_DUM[PROD_NO]."Budget Quantity"-"Stock AT Stores" ) THEN
                    Sheet1.Range('g'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Budget Quantity"-"Stock AT Stores")
                  ELSE
                  Sheet1.Range('g'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Budget Quantity");
                  Sheet1.Range('h'+FORMAT(Row)).Value :=FORMAT(Shortage_ByConsidering_Previou);
                  Sheet1.Range('i'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Standard Cost");
                  Sheet1.Range('j'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Unit Cost");
                END;
                //<Integer1>, Body (3) - OnPreSection()
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[1]='' THEN
                CurrReport.BREAK;
                
                PROD_QTY:= QTY[1];
                PROD_NO:=1;
                
                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                //IF ISCLEAR(Excel1) THEN
                 // CREATE(Excel1,TRUE,TRUE);
                  Excel1.Workbooks.Add();
                  Sheet1:= Excel1.ActiveSheet;
                  Sheet1.Name :=CONVERTSTR(BOM[1],'/',' ');
                
                END;
                
                
                PBMV.SETRANGE(PBMV."Production BOM No.",BOM[PROD_NO]);
                PBMV.SETRANGE(PBMV.Status,PBMV.Status::Certified);
                IF PBMV.FIND('+') THEN
                BEGIN
                
                 Version1:=PBMV."Version Code";
                
                END;
                //Version1:='CRM09UPG02';
                pbml.SETRANGE(pbml."Production BOM No.",BOM[PROD_NO]);
                pbml.SETRANGE(pbml."Version Code",Version1);
                IF pbml.FIND('-') THEN
                REPEAT
                  Desc1:=pbml.Description;
                  PBMH.RESET;
                  IF PBMH.GET(pbml."No.") THEN
                  Version2:=PBMH."Version Nos.";
                
                  PBML2.SETRANGE(PBML2."Production BOM No.",pbml."No.");
                  PBML2.SETRANGE(PBML2."Version Code",Version2);
                  IF PBML2.FIND('-') THEN
                  BEGIN
                    REPEAT
                
                      Desc2:=PBML2.Description;
                      PBMH.RESET;
                      IF PBMH.GET(PBML2."No.") THEN
                      Version3:=PBMH."Version Nos.";
                
                      PBML3.SETRANGE(PBML3."Production BOM No.",PBML2."No.");
                      PBML3.SETRANGE(PBML3."Version Code",Version3);
                      IF PBML3.FIND('-') THEN
                      BEGIN
                        REPEAT
                          Desc3:=PBML3.Description;
                          Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                
                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);
                
                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);
                
                      END;
                  UNTIL  PBML2.NEXT=0;
                  END ELSE
                  BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);
                
                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);
                
                  END;
                UNTIL  pbml.NEXT=0;
                Caliculate_Product_Shortage(PROD_NO);
                /*
                BOUT.SETRANGE(BOUT.Code,BOM[1]);
                IF BOUT.FIND('-') THEN
                REPEAT
                    Overall_Requirement(BOUT."Item No",PROD_QTY,BOUT.QTY,1,1);
                    Product_Requirement(1,BOUT."Item No",PROD_QTY,BOUT.QTY,1,1);
                UNTIL BOUT.NEXT=0;
                */
                
                
                
                "Breaka":=FALSE;
                BOM_DUM[1].SETCURRENTKEY(BOM_DUM[1]."Avg Unit Cost");
                BOM_DUM[1].SETFILTER(BOM_DUM[1]."Budget Quantity",'>%1',0);
                BOM_DUM[1].SETFILTER(BOM_DUM[1]."Product Group Code",'<>%1','CPCB');
                IF BOM_DUM[1].FIND('-') THEN

            end;
        }
        dataitem("<Integer2>";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(Integer2_Int2Body3;Int2Body3)
            {
            }
            column(QTY_2_;QTY[2])
            {
            }
            column(BOM_2_;BOM[2])
            {
            }
            column(BOM_DUM_2__Description;BOM_DUM[2].Description)
            {
            }
            column(BOM_DUM_2___No__;BOM_DUM[2]."No.")
            {
            }
            column(BOM_DUM_2___Budget_Quantity_;BOM_DUM[2]."Budget Quantity")
            {
            }
            column(Quantity_At_Stores__Control1102154042;"Quantity At Stores")
            {
            }
            column(Shortage_ByConsidering_Previou_Control1102154043;Shortage_ByConsidering_Previou)
            {
            }
            column(BOM_DUM_2___Standard_Cost_;BOM_DUM[2]."Standard Cost")
            {
            }
            column(BOM_DUM_2___Unit_Cost_;BOM_DUM[2]."Unit Cost")
            {
            }
            column(BOM_DUM_14___Budget_Quantity___Stock_AT_Stores_;BOM_DUM[14]."Budget Quantity"-"Stock AT Stores")
            {
            }
            column(BOM_DUM_2___Budget_Quantity___Quantity_At_Stores_;BOM_DUM[2]."Budget Quantity"-"Quantity At Stores")
            {
            }
            column(Required_ProductCaption_Control1102154036;Required_ProductCaption_Control1102154036Lbl)
            {
            }
            column(Requirerd_QuantityCaption_Control1102154038;Requirerd_QuantityCaption_Control1102154038Lbl)
            {
            }
            column(No_Caption_Control1102154152;No_Caption_Control1102154152Lbl)
            {
            }
            column(DescriptionCaption_Control1102154153;DescriptionCaption_Control1102154153Lbl)
            {
            }
            column(Required_QTYCaption_Control1102154154;Required_QTYCaption_Control1102154154Lbl)
            {
            }
            column(Qty_At_StoresCaption_Control1102154156;Qty_At_StoresCaption_Control1102154156Lbl)
            {
            }
            column(Overall_ShortageCaption_Control1102154157;Overall_ShortageCaption_Control1102154157Lbl)
            {
            }
            column(Qty__On_Purchase_OrderCaption_Control1102154158;Qty__On_Purchase_OrderCaption_Control1102154158Lbl)
            {
            }
            column(Qty__Under_InspectionCaption_Control1102154159;Qty__Under_InspectionCaption_Control1102154159Lbl)
            {
            }
            column(ShortageCaption_Control1102154160;ShortageCaption_Control1102154160Lbl)
            {
            }
            column(Integer2__Number;Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "Breaka" THEN
                CurrReport.BREAK ;

                IF BOM_DUM[2].NEXT=0 THEN
                "Breaka":=TRUE;

                //Rev01

                //<Integer2>, Header (1) - OnPreSection()
                  Row:=0;
                //<Integer2>, Header (1) - OnPreSection()

                //<Integer2>, Header (2) - OnPreSection()

                Sheet2.Range('c1').Value :='Shortage material ';
                Sheet2.Range('A2').Value := 'Item No.';
                Sheet2.Range('b2').Value := 'Description';
                Sheet2.Range('c2').Value := 'Required Quantity';
                Sheet2.Range('d2').Value := 'Quantity At Stores';
                Sheet2.Range('e2').Value := 'Shortage';
                Sheet2.Range('f2').Value := 'Overall Shortage';
                Sheet2.Range('g2').Value := 'Qty. On Purchase Order';
                Sheet2.Range('h2').Value := 'Qty. Under Inspection';
                 Row:=2;
                //<Integer2>, Header (2) - OnPreSection()

                //<Integer2>, Body (3) - OnPreSection()
                "Stock AT Stores":=0;
                Shortage_ByConsidering_Previou:=0;

                IF Dum.GET(BOM_DUM[2]."No.") THEN BEGIN
                 "Quantity At Stores":=Dum."Maximum Inventory";
                  Shortage_ByConsidering_Previou:=Dum."Reorder Quantity";
                END;

                Int2Body3 := CurrReport.SHOWOUTPUT(BOM_DUM[PROD_NO]."Reorder Quantity">0); //Rev01
                IF BOM_DUM[PROD_NO]."Reorder Quantity">0 THEN BEGIN
                  Row+=1;
                  Sheet2.Range('a'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO]."No." ;
                  Sheet2.Range('b'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO].Description ;
                  Sheet2.Range('c'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO]."Budget Quantity" ;
                  Sheet2.Range('d'+FORMAT(Row)).Value :=FORMAT("Stock AT Stores") ;
                  IF Shortage_ByConsidering_Previou=(BOM_DUM[PROD_NO]."Budget Quantity"-"Stock AT Stores" ) THEN
                    Sheet2.Range('e'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Budget Quantity"-"Stock AT Stores")
                  ELSE
                    Sheet2.Range('e'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Budget Quantity");
                    Sheet2.Range('f'+FORMAT(Row)).Value :=FORMAT(Shortage_ByConsidering_Previou);
                    Sheet2.Range('g'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Standard Cost");
                    Sheet2.Range('h'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Unit Cost");
                END;

                //<Integer2>, Body (3) - OnPreSection()
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[2]='' THEN
                CurrReport.BREAK;
                
                TempExcelBuffer.DELETEALL;
                PROD_QTY:= QTY[2];
                PROD_NO:=2;
                
                CLEAR(BOM_DUM[PROD_NO]);
                BOM_DUM[PROD_NO].DELETEALL;
                
                
                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                //IF ISCLEAR(Excel1) THEN
                 // CREATE(Excel1,TRUE,TRUE);
                
                  Excel1.Worksheets.Add;
                  Sheet2 := Excel1.ActiveSheet;
                
                  Sheet2.Name :=CONVERTSTR(BOM[2],'/',' ');
                END;
                
                
                CLEAR(BOM_DUM[PROD_NO]);
                BOM_DUM[PROD_NO].DELETEALL;
                
                IF PBMH.GET(BOM[PROD_NO]) THEN
                Version1:=PBMH."Version Nos.";
                pbml.SETRANGE(pbml."Production BOM No.",BOM[PROD_NO]);
                pbml.SETRANGE(pbml."Version Code",Version1);
                IF pbml.FIND('-') THEN
                REPEAT
                  Desc1:=pbml.Description;
                  PBMH.RESET;
                  IF PBMH.GET(pbml."No.") THEN
                  Version2:=PBMH."Version Nos.";
                
                  PBML2.SETRANGE(PBML2."Production BOM No.",pbml."No.");
                  PBML2.SETRANGE(PBML2."Version Code",Version2);
                  IF PBML2.FIND('-') THEN
                  BEGIN
                    REPEAT
                
                      Desc2:=PBML2.Description;
                      PBMH.RESET;
                      IF PBMH.GET(PBML2."No.") THEN
                      Version3:=PBMH."Version Nos.";
                
                      PBML3.SETRANGE(PBML3."Production BOM No.",PBML2."No.");
                      PBML3.SETRANGE(PBML3."Version Code",Version3);
                      IF PBML3.FIND('-') THEN
                      BEGIN
                        REPEAT
                          Desc3:=PBML3.Description;
                          Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(2,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                
                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);
                
                        Product_Requirement(2,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);
                
                      END;
                  UNTIL  PBML2.NEXT=0;
                  END ELSE
                  BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);
                
                    Product_Requirement(2,pbml."No.",PROD_QTY,pbml.Quantity,1,1);
                
                  END;
                UNTIL  pbml.NEXT=0;
                Caliculate_Product_Shortage(2);
                 /*
                BOUT.SETRANGE(BOUT.Code,BOM[2]);
                IF BOUT.FIND('-') THEN
                BEGIN
                    Overall_Requirement(BOUT."Item No",PROD_QTY,BOUT.QTY,1,1);
                    Product_Requirement(2,BOUT."Item No",PROD_QTY,BOUT.QTY,1,1);
                END;
                  */
                
                
                
                
                "Breaka":=FALSE;
                BOM_DUM[2].SETFILTER(BOM_DUM[2]."Budget Quantity",'>%1',0);
                BOM_DUM[2].SETFILTER(BOM_DUM[2]."Product Group Code",'<>%1','CPCB');
                IF BOM_DUM[2].FIND('-') THEN

            end;
        }
        dataitem("<Integer3>";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(Integer3_Int3Body3;Int3Body3)
            {
            }
            column(QTY_3_;QTY[3])
            {
            }
            column(BOM_3_;BOM[3])
            {
            }
            column(BOM_DUM_3___Budget_Quantity_;BOM_DUM[3]."Budget Quantity")
            {
            }
            column(BOM_DUM_3__Description;BOM_DUM[3].Description)
            {
            }
            column(BOM_DUM_3___No__;BOM_DUM[3]."No.")
            {
            }
            column(Quantity_At_Stores__Control1102154054;"Quantity At Stores")
            {
            }
            column(Shortage_ByConsidering_Previou_Control1102154055;Shortage_ByConsidering_Previou)
            {
            }
            column(BOM_DUM_3___Standard_Cost_;BOM_DUM[3]."Standard Cost")
            {
            }
            column(BOM_DUM_3___Unit_Cost_;BOM_DUM[3]."Unit Cost")
            {
            }
            column(BOM_DUM_3___Budget_Quantity___Quantity_At_Stores_;BOM_DUM[3]."Budget Quantity"-"Quantity At Stores")
            {
            }
            column(Required_ProductCaption_Control1102154048;Required_ProductCaption_Control1102154048Lbl)
            {
            }
            column(Requirerd_QuantityCaption_Control1102154050;Requirerd_QuantityCaption_Control1102154050Lbl)
            {
            }
            column(No_Caption_Control1102154161;No_Caption_Control1102154161Lbl)
            {
            }
            column(DescriptionCaption_Control1102154162;DescriptionCaption_Control1102154162Lbl)
            {
            }
            column(Required_QTYCaption_Control1102154163;Required_QTYCaption_Control1102154163Lbl)
            {
            }
            column(Qty_At_StoresCaption_Control1102154165;Qty_At_StoresCaption_Control1102154165Lbl)
            {
            }
            column(Overall_ShortageCaption_Control1102154166;Overall_ShortageCaption_Control1102154166Lbl)
            {
            }
            column(Qty__On_Purchase_OrderCaption_Control1102154167;Qty__On_Purchase_OrderCaption_Control1102154167Lbl)
            {
            }
            column(Qty__Under_InspectionCaption_Control1102154168;Qty__Under_InspectionCaption_Control1102154168Lbl)
            {
            }
            column(ShortageCaption_Control1102154169;ShortageCaption_Control1102154169Lbl)
            {
            }
            column(Integer3__Number;Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "Breaka" THEN
                CurrReport.BREAK ;

                IF BOM_DUM[3].NEXT=0 THEN
                "Breaka":=TRUE;

                //Rev01

                //<Integer3>, Header (2) - OnPreSection()
                Sheet3.Range('c1').Value :='Shortage material ';
                Sheet3.Range('A2').Value := 'Item No.';
                Sheet3.Range('b2').Value := 'Description';
                Sheet3.Range('c2').Value := 'Required Quantity';
                Sheet3.Range('d2').Value := 'Quantity At Stores';
                Sheet3.Range('e2').Value := 'Shortage';
                Sheet3.Range('f2').Value := 'Overall Shortage';
                Sheet3.Range('g2').Value := 'Qty. On Purchase Order';
                Sheet3.Range('h2').Value := 'Qty. Under Inspection';
                 Row:=2;
                //<Integer3>, Header (2) - OnPreSection()


                //<Integer3>, Body (3) - OnPreSection()
                "Stock AT Stores":=0;
                Shortage_ByConsidering_Previou:=0;

                IF Dum.GET(BOM_DUM[3]."No.") THEN BEGIN
                  "Stock AT Stores":=Dum."Maximum Inventory";
                  Shortage_ByConsidering_Previou:=Dum."Reorder Quantity";
                END;

                Int3Body3 := CurrReport.SHOWOUTPUT(BOM_DUM[PROD_NO]."Reorder Quantity">0); //Rev01

                IF BOM_DUM[PROD_NO]."Reorder Quantity">0 THEN BEGIN
                  Row+=1;
                  Sheet3.Range('a'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO]."No." ;
                  Sheet3.Range('b'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO].Description ;
                  Sheet3.Range('c'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO]."Budget Quantity" ;
                  Sheet3.Range('d'+FORMAT(Row)).Value :=FORMAT("Stock AT Stores") ;
                  IF Shortage_ByConsidering_Previou=(BOM_DUM[PROD_NO]."Budget Quantity"-"Stock AT Stores" ) THEN
                   Sheet3.Range('e'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Budget Quantity"-"Stock AT Stores")
                  ELSE
                   Sheet3.Range('e'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Budget Quantity");
                   Sheet3.Range('f'+FORMAT(Row)).Value :=FORMAT(Shortage_ByConsidering_Previou);
                   Sheet3.Range('g'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Standard Cost");
                   Sheet3.Range('h'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Unit Cost");
                END;
                //<Integer3>, Body (3) - OnPreSection()
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[3]='' THEN
                CurrReport.BREAK;
                
                PROD_QTY:= QTY[3];
                PROD_NO:=3;
                
                CLEAR(BOM_DUM[PROD_NO]);
                BOM_DUM[PROD_NO].DELETEALL;
                
                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                //IF ISCLEAR(Excel1) THEN
                //  CREATE(Excel1,TRUE,TRUE);
                
                  Excel1.Worksheets.Add;
                  Sheet3 := Excel1.ActiveSheet;
                
                  Sheet3.Name :=CONVERTSTR(BOM[3],'/',' ');
                END;
                
                
                IF PBMH.GET(BOM[PROD_NO]) THEN
                Version1:=PBMH."Version Nos.";
                pbml.SETRANGE(pbml."Production BOM No.",BOM[PROD_NO]);
                pbml.SETRANGE(pbml."Version Code",Version1);
                IF pbml.FIND('-') THEN
                REPEAT
                  Desc1:=pbml.Description;
                  PBMH.RESET;
                  IF PBMH.GET(pbml."No.") THEN
                  Version2:=PBMH."Version Nos.";
                
                  PBML2.SETRANGE(PBML2."Production BOM No.",pbml."No.");
                  PBML2.SETRANGE(PBML2."Version Code",Version2);
                  IF PBML2.FIND('-') THEN
                  BEGIN
                    REPEAT
                
                      Desc2:=PBML2.Description;
                      PBMH.RESET;
                      IF PBMH.GET(PBML2."No.") THEN
                      Version3:=PBMH."Version Nos.";
                
                      PBML3.SETRANGE(PBML3."Production BOM No.",PBML2."No.");
                      PBML3.SETRANGE(PBML3."Version Code",Version3);
                      IF PBML3.FIND('-') THEN
                      BEGIN
                        REPEAT
                          Desc3:=PBML3.Description;
                          Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                
                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);
                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);
                
                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);
                
                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);
                
                  END;
                UNTIL  pbml.NEXT=0;
                Caliculate_Product_Shortage(PROD_NO);
                /*
                BOUT.SETRANGE(BOUT.Code,BOM[PROD_NO]);
                IF BOUT.FIND('-') THEN
                BEGIN
                    Overall_Requirement(BOUT."Item No",PROD_QTY,BOUT.QTY,1,1);
                    Product_Requirement(PROD_NO,BOUT."Item No",PROD_QTY,BOUT.QTY,1,1);
                END;
                */
                
                "Breaka":=FALSE;
                BOM_DUM[3].SETFILTER(BOM_DUM[3]."Budget Quantity",'>%1',0);
                BOM_DUM[3].SETFILTER(BOM_DUM[3]."Product Group Code",'<>%1','CPCB');
                IF BOM_DUM[3].FIND('-') THEN

            end;
        }
        dataitem("<Integer4>";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(Integer4_Int4Body3;Int4Body3)
            {
            }
            column(QTY_4_;QTY[4])
            {
            }
            column(BOM_4_;BOM[4])
            {
            }
            column(BOM_DUM_4__Description;BOM_DUM[4].Description)
            {
            }
            column(BOM_DUM_4___Budget_Quantity_;BOM_DUM[4]."Budget Quantity")
            {
            }
            column(BOM_DUM_4___No__;BOM_DUM[4]."No.")
            {
            }
            column(Quantity_At_Stores__Control1102154066;"Quantity At Stores")
            {
            }
            column(Shortage_ByConsidering_Previou_Control1102154067;Shortage_ByConsidering_Previou)
            {
            }
            column(BOM_DUM_4___Standard_Cost_;BOM_DUM[4]."Standard Cost")
            {
            }
            column(BOM_DUM_4___Unit_Cost_;BOM_DUM[4]."Unit Cost")
            {
            }
            column(BOM_DUM_4___Budget_Quantity___Quantity_At_Stores_;BOM_DUM[4]."Budget Quantity"-"Quantity At Stores")
            {
            }
            column(Required_ProductCaption_Control1102154060;Required_ProductCaption_Control1102154060Lbl)
            {
            }
            column(Requirerd_QuantityCaption_Control1102154062;Requirerd_QuantityCaption_Control1102154062Lbl)
            {
            }
            column(No_Caption_Control1102154170;No_Caption_Control1102154170Lbl)
            {
            }
            column(DescriptionCaption_Control1102154171;DescriptionCaption_Control1102154171Lbl)
            {
            }
            column(Required_QTYCaption_Control1102154172;Required_QTYCaption_Control1102154172Lbl)
            {
            }
            column(Qty_At_StoresCaption_Control1102154174;Qty_At_StoresCaption_Control1102154174Lbl)
            {
            }
            column(Overall_ShortageCaption_Control1102154175;Overall_ShortageCaption_Control1102154175Lbl)
            {
            }
            column(Qty__On_Purchase_OrderCaption_Control1102154176;Qty__On_Purchase_OrderCaption_Control1102154176Lbl)
            {
            }
            column(Qty__Under_InspectionCaption_Control1102154177;Qty__Under_InspectionCaption_Control1102154177Lbl)
            {
            }
            column(ShortageCaption_Control1102154178;ShortageCaption_Control1102154178Lbl)
            {
            }
            column(Integer4__Number;Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "Breaka" THEN
                CurrReport.BREAK ;

                IF BOM_DUM[4].NEXT=0 THEN
                "Breaka":=TRUE;

                //Rev01

                //<Integer4>, Header (2) - OnPreSection()
                  Sheet4.Range('c1').Value :='Shortage material ';
                  Sheet4.Range('A2').Value := 'Item No.';
                  Sheet4.Range('b2').Value := 'Description';
                  Sheet4.Range('c2').Value := 'Required Quantity';
                  Sheet4.Range('d2').Value := 'Quantity At Stores';
                  Sheet4.Range('e2').Value := 'Shortage';
                  Sheet4.Range('f2').Value := 'Overall Shortage';
                  Sheet4.Range('g2').Value := 'Qty. On Purchase Order';
                  Sheet4.Range('h2').Value := 'Qty. Under Inspection';
                   Row:=2;

                //<Integer4>, Header (2) - OnPreSection()

                //<Integer4>, Body (3) - OnPreSection()
                 "Stock AT Stores":=0;
                Shortage_ByConsidering_Previou:=0;

                IF Dum.GET(BOM_DUM[4]."No.") THEN BEGIN
                  "Quantity At Stores":=Dum."Maximum Inventory";
                  Shortage_ByConsidering_Previou:=Dum."Reorder Quantity";
                END;

                Int4Body3 := CurrReport.SHOWOUTPUT(BOM_DUM[PROD_NO]."Reorder Quantity">0); //Rev01
                IF BOM_DUM[PROD_NO]."Reorder Quantity">0 THEN BEGIN
                  Row+=1;
                  Sheet4.Range('a'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO]."No." ;
                  Sheet4.Range('b'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO].Description ;
                  Sheet4.Range('c'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO]."Budget Quantity" ;
                  Sheet4.Range('d'+FORMAT(Row)).Value :=FORMAT("Stock AT Stores") ;
                  IF Shortage_ByConsidering_Previou=(BOM_DUM[PROD_NO]."Budget Quantity"-"Stock AT Stores" ) THEN
                   Sheet4.Range('e'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Budget Quantity"-"Stock AT Stores")
                  ELSE
                   Sheet4.Range('e'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Budget Quantity");
                   Sheet4.Range('f'+FORMAT(Row)).Value :=FORMAT(Shortage_ByConsidering_Previou);
                   Sheet4.Range('g'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Standard Cost");
                   Sheet4.Range('h'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Unit Cost");
                END;
                //<Integer4>, Body (3) - OnPreSection()
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[4]='' THEN
                CurrReport.BREAK;
                PROD_QTY:= QTY[4];
                PROD_NO:=4;
                
                CLEAR(BOM_DUM[PROD_NO]);
                BOM_DUM[PROD_NO].DELETEALL;
                
                
                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                  Excel1.Worksheets.Add;
                  Sheet4 := Excel1.ActiveSheet;
                
                  Sheet4.Name :=CONVERTSTR(BOM[4],'/',' ');
                END;
                
                IF PBMH.GET(BOM[PROD_NO]) THEN
                Version1:=PBMH."Version Nos.";
                pbml.SETRANGE(pbml."Production BOM No.",BOM[PROD_NO]);
                pbml.SETRANGE(pbml."Version Code",Version1);
                IF pbml.FIND('-') THEN
                REPEAT
                  Desc1:=pbml.Description;
                  PBMH.RESET;
                  IF PBMH.GET(pbml."No.") THEN
                  Version2:=PBMH."Version Nos.";
                
                  PBML2.SETRANGE(PBML2."Production BOM No.",pbml."No.");
                  PBML2.SETRANGE(PBML2."Version Code",Version2);
                  IF PBML2.FIND('-') THEN
                  BEGIN
                    REPEAT
                
                      Desc2:=PBML2.Description;
                      PBMH.RESET;
                      IF PBMH.GET(PBML2."No.") THEN
                      Version3:=PBMH."Version Nos.";
                
                      PBML3.SETRANGE(PBML3."Production BOM No.",PBML2."No.");
                      PBML3.SETRANGE(PBML3."Version Code",Version3);
                      IF PBML3.FIND('-') THEN
                      BEGIN
                        REPEAT
                          Desc3:=PBML3.Description;
                          Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                
                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);
                
                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);
                
                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);
                
                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);
                
                  END;
                UNTIL  pbml.NEXT=0;
                Caliculate_Product_Shortage(PROD_NO);
                /*
                BOUT.SETRANGE(BOUT.Code,BOM[PROD_NO]);
                IF BOUT.FIND('-') THEN
                BEGIN
                    Overall_Requirement(BOUT."Item No",PROD_QTY,BOUT.QTY,1,1);
                    Product_Requirement(PROD_NO,BOUT."Item No",PROD_QTY,BOUT.QTY,1,1);
                END;
                */
                
                
                "Breaka":=FALSE;
                BOM_DUM[4].SETFILTER(BOM_DUM[4]."Budget Quantity",'>%1',0);
                BOM_DUM[4].SETFILTER(BOM_DUM[4]."Product Group Code",'<>%1','CPCB');
                IF BOM_DUM[4].FIND('-') THEN

            end;
        }
        dataitem("<Integer5>";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(Integer5_Int5Body3;Int5Body3)
            {
            }
            column(QTY_5_;QTY[5])
            {
            }
            column(BOM_5_;BOM[5])
            {
            }
            column(BOM_DUM_5___No__;BOM_DUM[5]."No.")
            {
            }
            column(BOM_DUM_5__Description;BOM_DUM[5].Description)
            {
            }
            column(BOM_DUM_5___Budget_Quantity_;BOM_DUM[5]."Budget Quantity")
            {
            }
            column(Quantity_At_Stores__Control1102154078;"Quantity At Stores")
            {
            }
            column(Shortage_ByConsidering_Previou_Control1102154079;Shortage_ByConsidering_Previou)
            {
            }
            column(BOM_DUM_5___Standard_Cost_;BOM_DUM[5]."Standard Cost")
            {
            }
            column(BOM_DUM_5___Unit_Cost_;BOM_DUM[5]."Unit Cost")
            {
            }
            column(BOM_DUM_5___Budget_Quantity___Quantity_At_Stores_;BOM_DUM[5]."Budget Quantity"-"Quantity At Stores")
            {
            }
            column(Required_ProductCaption_Control1102154072;Required_ProductCaption_Control1102154072Lbl)
            {
            }
            column(Requirerd_QuantityCaption_Control1102154074;Requirerd_QuantityCaption_Control1102154074Lbl)
            {
            }
            column(No_Caption_Control1102154179;No_Caption_Control1102154179Lbl)
            {
            }
            column(DescriptionCaption_Control1102154180;DescriptionCaption_Control1102154180Lbl)
            {
            }
            column(Required_QTYCaption_Control1102154181;Required_QTYCaption_Control1102154181Lbl)
            {
            }
            column(Qty_At_StoresCaption_Control1102154183;Qty_At_StoresCaption_Control1102154183Lbl)
            {
            }
            column(Overall_ShortageCaption_Control1102154184;Overall_ShortageCaption_Control1102154184Lbl)
            {
            }
            column(Qty__On_Purchase_OrderCaption_Control1102154185;Qty__On_Purchase_OrderCaption_Control1102154185Lbl)
            {
            }
            column(Qty__Under_InspectionCaption_Control1102154186;Qty__Under_InspectionCaption_Control1102154186Lbl)
            {
            }
            column(ShortageCaption_Control1102154187;ShortageCaption_Control1102154187Lbl)
            {
            }
            column(Integer5__Number;Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "Breaka" THEN
                CurrReport.BREAK ;

                IF BOM_DUM[5].NEXT=0 THEN
                "Breaka":=TRUE;

                //Rev01

                //<Integer5>, Header (2) - OnPreSection()
                Sheet5.Range('c1').Value :='Shortage material ';
                Sheet5.Range('A2').Value := 'Item No.';
                Sheet5.Range('b2').Value := 'Description';
                Sheet5.Range('c2').Value := 'Required Quantity';
                Sheet5.Range('d2').Value := 'Quantity At Stores';
                Sheet5.Range('e2').Value := 'Shortage';
                Sheet5.Range('f2').Value := 'Overall Shortage';
                Sheet5.Range('g2').Value := 'Qty. On Purchase Order';
                Sheet5.Range('h2').Value := 'Qty. Under Inspection';
                 Row:=2;
                //<Integer5>, Header (2) - OnPreSection()

                //<Integer5>, Body (3) - OnPreSection()
                "Stock AT Stores":=0;
                Shortage_ByConsidering_Previou:=0;

                IF Dum.GET(BOM_DUM[5]."No.") THEN BEGIN
                  "Quantity At Stores":=Dum."Maximum Inventory";
                  Shortage_ByConsidering_Previou:=Dum."Reorder Quantity";
                END;

                Int5Body3 := CurrReport.SHOWOUTPUT(Shortage_ByConsidering_Previou>0); //Rev01
                IF BOM_DUM[PROD_NO]."Reorder Quantity">0 THEN BEGIN
                 Row+=1;
                 Sheet5.Range('a'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO]."No." ;
                 Sheet5.Range('b'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO].Description ;
                 Sheet5.Range('c'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO]."Budget Quantity" ;
                 Sheet5.Range('d'+FORMAT(Row)).Value :=FORMAT("Stock AT Stores") ;
                 IF Shortage_ByConsidering_Previou=(BOM_DUM[PROD_NO]."Budget Quantity"-"Stock AT Stores" ) THEN
                   Sheet1.Range('e'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Budget Quantity"-"Stock AT Stores")
                 ELSE
                  Sheet5.Range('e'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Budget Quantity");

                 Sheet5.Range('f'+FORMAT(Row)).Value :=FORMAT(Shortage_ByConsidering_Previou);
                 Sheet5.Range('g'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Standard Cost");
                 Sheet5.Range('h'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Unit Cost");
                END;
                //<Integer5>, Body (3) - OnPreSection()
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[5]='' THEN
                CurrReport.BREAK;
                PROD_QTY:= QTY[5];
                PROD_NO:=5;
                
                CLEAR(BOM_DUM[PROD_NO]);
                BOM_DUM[PROD_NO].DELETEALL;
                
                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                  Excel1.Worksheets.Add;
                  Sheet5 := Excel1.ActiveSheet;
                
                  Sheet5.Name :=CONVERTSTR(BOM[5],'/',' ');
                END;
                
                IF PBMH.GET(BOM[PROD_NO]) THEN
                Version1:=PBMH."Version Nos.";
                pbml.SETRANGE(pbml."Production BOM No.",BOM[PROD_NO]);
                pbml.SETRANGE(pbml."Version Code",Version1);
                IF pbml.FIND('-') THEN
                REPEAT
                  Desc1:=pbml.Description;
                  PBMH.RESET;
                  IF PBMH.GET(pbml."No.") THEN
                  Version2:=PBMH."Version Nos.";
                
                  PBML2.SETRANGE(PBML2."Production BOM No.",pbml."No.");
                  PBML2.SETRANGE(PBML2."Version Code",Version2);
                  IF PBML2.FIND('-') THEN
                  BEGIN
                    REPEAT
                
                      Desc2:=PBML2.Description;
                      PBMH.RESET;
                      IF PBMH.GET(PBML2."No.") THEN
                      Version3:=PBMH."Version Nos.";
                
                      PBML3.SETRANGE(PBML3."Production BOM No.",PBML2."No.");
                      PBML3.SETRANGE(PBML3."Version Code",Version3);
                      IF PBML3.FIND('-') THEN
                      BEGIN
                        REPEAT
                          Desc3:=PBML3.Description;
                          Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                
                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);
                
                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);
                
                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);
                
                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);
                
                  END;
                UNTIL  pbml.NEXT=0;
                Caliculate_Product_Shortage(PROD_NO);
                
                /*
                BOUT.SETRANGE(BOUT.Code,BOM[PROD_NO]);
                IF BOUT.FIND('-') THEN
                BEGIN
                    Overall_Requirement(BOUT."Item No",PROD_QTY,BOUT.QTY,1,1);
                    Product_Requirement(PROD_NO,BOUT."Item No",PROD_QTY,BOUT.QTY,1,1);
                END;
                   */
                
                "Breaka":=FALSE;
                BOM_DUM[5].SETFILTER(BOM_DUM[5]."Budget Quantity",'>%1',0);
                BOM_DUM[5].SETFILTER(BOM_DUM[5]."Product Group Code",'<>%1','CPCB');
                IF BOM_DUM[5].FIND('-') THEN

            end;
        }
        dataitem("<Integer6>";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(Integer6_Int6Body3;Int6Body3)
            {
            }
            column(BOM_6_;BOM[6])
            {
            }
            column(QTY_6_;QTY[6])
            {
            }
            column(BOM_DUM_6__Description;BOM_DUM[6].Description)
            {
            }
            column(BOM_DUM_6___No__;BOM_DUM[6]."No.")
            {
            }
            column(BOM_DUM_6___Budget_Quantity_;BOM_DUM[6]."Budget Quantity")
            {
            }
            column(Quantity_At_Stores__Control1102154090;"Quantity At Stores")
            {
            }
            column(Shortage_ByConsidering_Previou_Control1102154091;Shortage_ByConsidering_Previou)
            {
            }
            column(BOM_DUM_6___Standard_Cost_;BOM_DUM[6]."Standard Cost")
            {
            }
            column(BOM_DUM_6___Unit_Cost_;BOM_DUM[6]."Unit Cost")
            {
            }
            column(BOM_DUM_6___Budget_Quantity___Quantity_At_Stores_;BOM_DUM[6]."Budget Quantity"-"Quantity At Stores")
            {
            }
            column(Required_ProductCaption_Control1102154085;Required_ProductCaption_Control1102154085Lbl)
            {
            }
            column(Requirerd_QuantityCaption_Control1102154086;Requirerd_QuantityCaption_Control1102154086Lbl)
            {
            }
            column(No_Caption_Control1102154188;No_Caption_Control1102154188Lbl)
            {
            }
            column(DescriptionCaption_Control1102154189;DescriptionCaption_Control1102154189Lbl)
            {
            }
            column(Required_QTYCaption_Control1102154190;Required_QTYCaption_Control1102154190Lbl)
            {
            }
            column(Qty_At_StoresCaption_Control1102154192;Qty_At_StoresCaption_Control1102154192Lbl)
            {
            }
            column(Overall_ShortageCaption_Control1102154193;Overall_ShortageCaption_Control1102154193Lbl)
            {
            }
            column(Qty__On_Purchase_OrderCaption_Control1102154194;Qty__On_Purchase_OrderCaption_Control1102154194Lbl)
            {
            }
            column(Qty__Under_InspectionCaption_Control1102154195;Qty__Under_InspectionCaption_Control1102154195Lbl)
            {
            }
            column(ShortageCaption_Control1102154196;ShortageCaption_Control1102154196Lbl)
            {
            }
            column(Integer6__Number;Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "Breaka" THEN
                CurrReport.BREAK ;

                IF BOM_DUM[6].NEXT=0 THEN
                "Breaka":=TRUE;

                //Rev01

                //<Integer6>, Header (2) - OnPreSection()
                Sheet6.Range('c1').Value :='Shortage material ';
                Sheet6.Range('A2').Value := 'Item No.';
                Sheet6.Range('b2').Value := 'Description';
                Sheet6.Range('c2').Value := 'Required Quantity';
                Sheet6.Range('d2').Value := 'Quantity At Stores';
                Sheet6.Range('e2').Value := 'Shortage';
                Sheet6.Range('f2').Value := 'Overall Shortage';
                Sheet6.Range('g2').Value := 'Qty. On Purchase Order';
                Sheet6.Range('h2').Value := 'Qty. Under Inspection';
                 Row:=2;
                //<Integer6>, Header (2) - OnPreSection()

                //<Integer6>, Body (3) - OnPreSection()
                "Stock AT Stores":=0;
                Shortage_ByConsidering_Previou:=0;

                IF Dum.GET(BOM_DUM[6]."No.") THEN BEGIN
                  "Quantity At Stores":=Dum."Maximum Inventory";
                  Shortage_ByConsidering_Previou:=Dum."Reorder Quantity";
                END;

                Int6Body3 := CurrReport.SHOWOUTPUT(BOM_DUM[PROD_NO]."Reorder Quantity">0);

                IF BOM_DUM[PROD_NO]."Reorder Quantity">0 THEN BEGIN
                 Row+=1;
                 Sheet6.Range('a'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO]."No." ;
                 Sheet6.Range('b'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO].Description ;
                 Sheet6.Range('c'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO]."Budget Quantity" ;
                 Sheet6.Range('d'+FORMAT(Row)).Value :=FORMAT("Stock AT Stores") ;
                 IF Shortage_ByConsidering_Previou=(BOM_DUM[PROD_NO]."Budget Quantity"-"Stock AT Stores" ) THEN
                   Sheet6.Range('e'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Budget Quantity"-"Stock AT Stores")
                 ELSE
                  Sheet6.Range('e'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Budget Quantity");
                 Sheet6.Range('f'+FORMAT(Row)).Value :=FORMAT(Shortage_ByConsidering_Previou);
                 Sheet6.Range('g'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Standard Cost");
                 Sheet6.Range('h'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Unit Cost");
                END;
                //<Integer6>, Body (3) - OnPreSection()
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[6]='' THEN
                CurrReport.BREAK;
                PROD_QTY:= QTY[6];
                PROD_NO:=6;
                
                CLEAR(BOM_DUM[PROD_NO]);
                BOM_DUM[PROD_NO].DELETEALL;
                
                
                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                  Excel1.Worksheets.Add;
                  Sheet6 := Excel1.ActiveSheet;
                
                  Sheet6.Name :=CONVERTSTR(BOM[6],'/',' ');
                END;
                
                IF PBMH.GET(BOM[PROD_NO]) THEN
                Version1:=PBMH."Version Nos.";
                pbml.SETRANGE(pbml."Production BOM No.",BOM[PROD_NO]);
                pbml.SETRANGE(pbml."Version Code",Version1);
                IF pbml.FIND('-') THEN
                REPEAT
                  Desc1:=pbml.Description;
                  PBMH.RESET;
                  IF PBMH.GET(pbml."No.") THEN
                  Version2:=PBMH."Version Nos.";
                
                  PBML2.SETRANGE(PBML2."Production BOM No.",pbml."No.");
                  PBML2.SETRANGE(PBML2."Version Code",Version2);
                  IF PBML2.FIND('-') THEN
                  BEGIN
                    REPEAT
                
                      Desc2:=PBML2.Description;
                      PBMH.RESET;
                      IF PBMH.GET(PBML2."No.") THEN
                      Version3:=PBMH."Version Nos.";
                
                      PBML3.SETRANGE(PBML3."Production BOM No.",PBML2."No.");
                      PBML3.SETRANGE(PBML3."Version Code",Version3);
                      IF PBML3.FIND('-') THEN
                      BEGIN
                        REPEAT
                          Desc3:=PBML3.Description;
                          Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                
                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);
                
                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);
                
                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);
                
                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);
                
                  END;
                UNTIL  pbml.NEXT=0;
                Caliculate_Product_Shortage(PROD_NO);
                
                 /*
                BOUT.SETRANGE(BOUT.Code,BOM[PROD_NO]);
                IF BOUT.FIND('-') THEN
                BEGIN
                    Overall_Requirement(BOUT."Item No",PROD_QTY,BOUT.QTY,1,1);
                    Product_Requirement(PROD_NO,BOUT."Item No",PROD_QTY,BOUT.QTY,1,1);
                END;
                 */
                
                "Breaka":=FALSE;
                BOM_DUM[6].SETFILTER(BOM_DUM[6]."Budget Quantity",'>%1',0);
                BOM_DUM[6].SETFILTER(BOM_DUM[6]."Product Group Code",'<>%1','CPCB');
                IF BOM_DUM[6].FIND('-') THEN

            end;
        }
        dataitem("<Integer7>";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(Integer7_Int7Body3;Int7Body3)
            {
            }
            column(QTY_7_;QTY[7])
            {
            }
            column(BOM_7_;BOM[7])
            {
            }
            column(BOM_DUM_7__Description;BOM_DUM[7].Description)
            {
            }
            column(BOM_DUM_7___No__;BOM_DUM[7]."No.")
            {
            }
            column(BOM_DUM_7___Budget_Quantity_;BOM_DUM[7]."Budget Quantity")
            {
            }
            column(Quantity_At_Stores__Control1102154102;"Quantity At Stores")
            {
            }
            column(Shortage_ByConsidering_Previou_Control1102154103;Shortage_ByConsidering_Previou)
            {
            }
            column(BOM_DUM_7___Standard_Cost_;BOM_DUM[7]."Standard Cost")
            {
            }
            column(BOM_DUM_7___Unit_Cost_;BOM_DUM[7]."Unit Cost")
            {
            }
            column(BOM_DUM_7___Budget_Quantity___Quantity_At_Stores_;BOM_DUM[7]."Budget Quantity"-"Quantity At Stores")
            {
            }
            column(Required_ProductCaption_Control1102154096;Required_ProductCaption_Control1102154096Lbl)
            {
            }
            column(Requirerd_QuantityCaption_Control1102154098;Requirerd_QuantityCaption_Control1102154098Lbl)
            {
            }
            column(No_Caption_Control1102154197;No_Caption_Control1102154197Lbl)
            {
            }
            column(DescriptionCaption_Control1102154198;DescriptionCaption_Control1102154198Lbl)
            {
            }
            column(Required_QTYCaption_Control1102154199;Required_QTYCaption_Control1102154199Lbl)
            {
            }
            column(Qty_At_StoresCaption_Control1102154201;Qty_At_StoresCaption_Control1102154201Lbl)
            {
            }
            column(Overall_ShortageCaption_Control1102154202;Overall_ShortageCaption_Control1102154202Lbl)
            {
            }
            column(Qty__On_Purchase_OrderCaption_Control1102154203;Qty__On_Purchase_OrderCaption_Control1102154203Lbl)
            {
            }
            column(Qty__Under_InspectionCaption_Control1102154204;Qty__Under_InspectionCaption_Control1102154204Lbl)
            {
            }
            column(ShortageCaption_Control1102154205;ShortageCaption_Control1102154205Lbl)
            {
            }
            column(Integer7__Number;Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "Breaka" THEN
                CurrReport.BREAK ;
                IF BOM_DUM[7].NEXT=0 THEN
                "Breaka":=TRUE;

                //Rev01

                //<Integer7>, Header (2) - OnPreSection()
                Sheet7.Range('c1').Value :='Shortage material ';
                Sheet7.Range('A2').Value := 'Item No.';
                Sheet7.Range('b2').Value := 'Description';
                Sheet7.Range('c2').Value := 'Required Quantity';
                Sheet7.Range('d2').Value := 'Quantity At Stores';
                Sheet7.Range('e2').Value := 'Shortage';
                Sheet7.Range('f2').Value := 'Overall Shortage';
                Sheet7.Range('g2').Value := 'Qty. On Purchase Order';
                Sheet7.Range('h2').Value := 'Qty. Under Inspection';
                 Row:=2;
                //<Integer7>, Header (2) - OnPreSection()

                //<Integer7>, Body (3) - OnPreSection()
                "Stock AT Stores":=0;
                Shortage_ByConsidering_Previou:=0;

                IF Dum.GET(BOM_DUM[7]."No.") THEN BEGIN
                  "Quantity At Stores":=Dum."Maximum Inventory";
                  Shortage_ByConsidering_Previou:=Dum."Reorder Quantity";
                END;

                Int7Body3 := CurrReport.SHOWOUTPUT(BOM_DUM[PROD_NO]."Reorder Quantity">0); //Rev01

                IF BOM_DUM[PROD_NO]."Reorder Quantity">0 THEN BEGIN
                 Row+=1;
                 Sheet7.Range('a'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO]."No." ;
                 Sheet7.Range('b'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO].Description ;
                 Sheet7.Range('c'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO]."Budget Quantity" ;
                 Sheet7.Range('d'+FORMAT(Row)).Value :=FORMAT("Stock AT Stores") ;
                 IF Shortage_ByConsidering_Previou=(BOM_DUM[PROD_NO]."Budget Quantity"-"Stock AT Stores" ) THEN
                   Sheet7.Range('e'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Budget Quantity"-"Stock AT Stores")
                 ELSE
                  Sheet7.Range('e'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Budget Quantity");
                 Sheet7.Range('f'+FORMAT(Row)).Value :=FORMAT(Shortage_ByConsidering_Previou);
                 Sheet7.Range('g'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Standard Cost");
                 Sheet7.Range('h'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Unit Cost");
                END;
                //<Integer7>, Body (3) - OnPreSection()
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[7]='' THEN
                CurrReport.BREAK;
                PROD_QTY:= QTY[7];
                PROD_NO:=7;
                
                CLEAR(BOM_DUM[PROD_NO]);
                BOM_DUM[PROD_NO].DELETEALL;
                
                
                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                  Excel1.Worksheets.Add;
                  Sheet7 := Excel1.ActiveSheet;
                
                   Sheet7.Name :=CONVERTSTR(BOM[7],'/',' ');
                END;
                
                IF PBMH.GET(BOM[PROD_NO]) THEN
                Version1:=PBMH."Version Nos.";
                pbml.SETRANGE(pbml."Production BOM No.",BOM[PROD_NO]);
                pbml.SETRANGE(pbml."Version Code",Version1);
                IF pbml.FIND('-') THEN
                REPEAT
                  Desc1:=pbml.Description;
                  PBMH.RESET;
                  IF PBMH.GET(pbml."No.") THEN
                  Version2:=PBMH."Version Nos.";
                
                  PBML2.SETRANGE(PBML2."Production BOM No.",pbml."No.");
                  PBML2.SETRANGE(PBML2."Version Code",Version2);
                  IF PBML2.FIND('-') THEN
                  BEGIN
                    REPEAT
                
                      Desc2:=PBML2.Description;
                      PBMH.RESET;
                      IF PBMH.GET(PBML2."No.") THEN
                      Version3:=PBMH."Version Nos.";
                
                      PBML3.SETRANGE(PBML3."Production BOM No.",PBML2."No.");
                      PBML3.SETRANGE(PBML3."Version Code",Version3);
                      IF PBML3.FIND('-') THEN
                      BEGIN
                        REPEAT
                          Desc3:=PBML3.Description;
                          Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                
                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);
                
                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);
                
                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);
                
                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);
                
                  END;
                UNTIL  pbml.NEXT=0;
                Caliculate_Product_Shortage(PROD_NO);
                
                /*
                
                BOUT.SETRANGE(BOUT.Code,BOM[PROD_NO]);
                IF BOUT.FIND('-') THEN
                BEGIN
                    Overall_Requirement(BOUT."Item No",PROD_QTY,BOUT.QTY,1,1);
                    Product_Requirement(PROD_NO,BOUT."Item No",PROD_QTY,BOUT.QTY,1,1);
                END;
                
                  */
                "Breaka":=FALSE;
                BOM_DUM[7].SETFILTER(BOM_DUM[7]."Budget Quantity",'>%1',0);
                BOM_DUM[7].SETFILTER(BOM_DUM[7]."Product Group Code",'<>%1','CPCB');
                IF BOM_DUM[7].FIND('-') THEN

            end;
        }
        dataitem("<Integer8>";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(Integer8_Int8Body3;Int8Body3)
            {
            }
            column(QTY_8_;QTY[8])
            {
            }
            column(BOM_8_;BOM[8])
            {
            }
            column(BOM_DUM_8___No__;BOM_DUM[8]."No.")
            {
            }
            column(BOM_DUM_8__Description;BOM_DUM[8].Description)
            {
            }
            column(BOM_DUM_8___Budget_Quantity_;BOM_DUM[8]."Budget Quantity")
            {
            }
            column(Quantity_At_Stores__Control1102154231;"Quantity At Stores")
            {
            }
            column(Shortage_ByConsidering_Previou_Control1102154232;Shortage_ByConsidering_Previou)
            {
            }
            column(BOM_DUM_8___Standard_Cost_;BOM_DUM[8]."Standard Cost")
            {
            }
            column(BOM_DUM_8___Unit_Cost_;BOM_DUM[8]."Unit Cost")
            {
            }
            column(BOM_DUM_8___Budget_Quantity___Quantity_At_Stores_;BOM_DUM[8]."Budget Quantity"-"Quantity At Stores")
            {
            }
            column(Required_ProductCaption_Control1102154225;Required_ProductCaption_Control1102154225Lbl)
            {
            }
            column(Requirerd_QuantityCaption_Control1102154227;Requirerd_QuantityCaption_Control1102154227Lbl)
            {
            }
            column(No_Caption_Control1102154206;No_Caption_Control1102154206Lbl)
            {
            }
            column(DescriptionCaption_Control1102154207;DescriptionCaption_Control1102154207Lbl)
            {
            }
            column(Required_QTYCaption_Control1102154208;Required_QTYCaption_Control1102154208Lbl)
            {
            }
            column(Qty_At_StoresCaption_Control1102154210;Qty_At_StoresCaption_Control1102154210Lbl)
            {
            }
            column(Overall_ShortageCaption_Control1102154211;Overall_ShortageCaption_Control1102154211Lbl)
            {
            }
            column(Qty__On_Purchase_OrderCaption_Control1102154212;Qty__On_Purchase_OrderCaption_Control1102154212Lbl)
            {
            }
            column(Qty__Under_InspectionCaption_Control1102154213;Qty__Under_InspectionCaption_Control1102154213Lbl)
            {
            }
            column(ShortageCaption_Control1102154214;ShortageCaption_Control1102154214Lbl)
            {
            }
            column(Integer8__Number;Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "Breaka" THEN
                CurrReport.BREAK ;

                IF BOM_DUM[8].NEXT=0 THEN
                "Breaka":=TRUE;

                //Rev01

                //<Integer8>, Header (2) - OnPreSection()
                Sheet8.Range('c1').Value :='Shortage material ';
                Sheet8.Range('A2').Value := 'Item No.';
                Sheet8.Range('b2').Value := 'Description';
                Sheet8.Range('c2').Value := 'Required Quantity';
                Sheet8.Range('d2').Value := 'Quantity At Stores';
                Sheet8.Range('e2').Value := 'Shortage';
                Sheet8.Range('f2').Value := 'Overall Shortage';
                Sheet8.Range('g2').Value := 'Qty. On Purchase Order';
                Sheet8.Range('h2').Value := 'Qty. Under Inspection';
                 Row:=2;

                //<Integer8>, Header (2) - OnPreSection()

                //<Integer8>, Body (3) - OnPreSection()
                "Stock AT Stores":=0;
                Shortage_ByConsidering_Previou:=0;

                IF Dum.GET(BOM_DUM[8]."No.") THEN BEGIN
                  "Quantity At Stores":=Dum."Maximum Inventory";
                  Shortage_ByConsidering_Previou:=Dum."Reorder Quantity";
                END;

                Int8Body3 := CurrReport.SHOWOUTPUT(BOM_DUM[PROD_NO]."Reorder Quantity">0); //Rev01

                IF BOM_DUM[PROD_NO]."Reorder Quantity">0 THEN BEGIN
                 Row+=1;
                 Sheet8.Range('a'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO]."No." ;
                 Sheet8.Range('b'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO].Description ;
                 Sheet8.Range('c'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO]."Budget Quantity" ;
                 Sheet8.Range('d'+FORMAT(Row)).Value :=FORMAT("Stock AT Stores") ;
                 IF Shortage_ByConsidering_Previou=(BOM_DUM[PROD_NO]."Budget Quantity"-"Stock AT Stores" ) THEN
                   Sheet8.Range('e'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Budget Quantity"-"Stock AT Stores")
                 ELSE
                  Sheet8.Range('e'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Budget Quantity");
                 Sheet8.Range('f'+FORMAT(Row)).Value :=FORMAT(Shortage_ByConsidering_Previou);
                 Sheet8.Range('g'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Standard Cost");
                 Sheet8.Range('h'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Unit Cost");
                END;
                //<Integer8>, Body (3) - OnPreSection()
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[8]='' THEN
                CurrReport.BREAK;
                PROD_QTY:= QTY[8];
                PROD_NO:=8;
                
                CLEAR(BOM_DUM[PROD_NO]);
                BOM_DUM[PROD_NO].DELETEALL;
                
                
                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                  Excel1.Worksheets.Add;
                  Sheet8 := Excel1.ActiveSheet;
                
                 Sheet8.Name :=CONVERTSTR(BOM[8],'/',' ');
                END;
                
                IF PBMH.GET(BOM[PROD_NO]) THEN
                Version1:=PBMH."Version Nos.";
                pbml.SETRANGE(pbml."Production BOM No.",BOM[PROD_NO]);
                pbml.SETRANGE(pbml."Version Code",Version1);
                IF pbml.FIND('-') THEN
                REPEAT
                  Desc1:=pbml.Description;
                  PBMH.RESET;
                  IF PBMH.GET(pbml."No.") THEN
                  Version2:=PBMH."Version Nos.";
                
                  PBML2.SETRANGE(PBML2."Production BOM No.",pbml."No.");
                  PBML2.SETRANGE(PBML2."Version Code",Version2);
                  IF PBML2.FIND('-') THEN
                  BEGIN
                    REPEAT
                
                      Desc2:=PBML2.Description;
                      PBMH.RESET;
                      IF PBMH.GET(PBML2."No.") THEN
                      Version3:=PBMH."Version Nos.";
                
                      PBML3.SETRANGE(PBML3."Production BOM No.",PBML2."No.");
                      PBML3.SETRANGE(PBML3."Version Code",Version3);
                      IF PBML3.FIND('-') THEN
                      BEGIN
                        REPEAT
                          Desc3:=PBML3.Description;
                          Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                
                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);
                
                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);
                
                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);
                
                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);
                
                  END;
                UNTIL  pbml.NEXT=0;
                Caliculate_Product_Shortage(PROD_NO);
                /*
                BOUT.SETRANGE(BOUT.Code,BOM[PROD_NO]);
                IF BOUT.FIND('-') THEN
                BEGIN
                    Overall_Requirement(BOUT."Item No",PROD_QTY,BOUT.QTY,1,1);
                    Product_Requirement(PROD_NO,BOUT."Item No",PROD_QTY,BOUT.QTY,1,1);
                END;
                */
                
                "Breaka":=FALSE;
                BOM_DUM[8].SETFILTER(BOM_DUM[8]."Budget Quantity",'>%1',0);
                BOM_DUM[8].SETFILTER(BOM_DUM[8]."Product Group Code",'<>%1','CPCB');
                IF BOM_DUM[8].FIND('-') THEN

            end;
        }
        dataitem("<Integer9>";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(Integer9_Int9Body3;Int9Body3)
            {
            }
            column(QTY_9_;QTY[9])
            {
            }
            column(BOM_9_;BOM[9])
            {
            }
            column(BOM_DUM_9___Budget_Quantity_;BOM_DUM[9]."Budget Quantity")
            {
            }
            column(BOM_DUM_9___No__;BOM_DUM[9]."No.")
            {
            }
            column(BOM_DUM_9__Description;BOM_DUM[9].Description)
            {
            }
            column(Quantity_At_Stores__Control1102154243;"Quantity At Stores")
            {
            }
            column(Shortage_ByConsidering_Previou_Control1102154244;Shortage_ByConsidering_Previou)
            {
            }
            column(BOM_DUM_9___Standard_Cost_;BOM_DUM[9]."Standard Cost")
            {
            }
            column(BOM_DUM_9___Unit_Cost_;BOM_DUM[9]."Unit Cost")
            {
            }
            column(BOM_DUM_9___Budget_Quantity___Quantity_At_Stores_;BOM_DUM[9]."Budget Quantity"-"Quantity At Stores")
            {
            }
            column(Required_ProductCaption_Control1102154237;Required_ProductCaption_Control1102154237Lbl)
            {
            }
            column(Requirerd_QuantityCaption_Control1102154239;Requirerd_QuantityCaption_Control1102154239Lbl)
            {
            }
            column(No_Caption_Control1102154215;No_Caption_Control1102154215Lbl)
            {
            }
            column(DescriptionCaption_Control1102154216;DescriptionCaption_Control1102154216Lbl)
            {
            }
            column(Required_QTYCaption_Control1102154217;Required_QTYCaption_Control1102154217Lbl)
            {
            }
            column(Qty_At_StoresCaption_Control1102154219;Qty_At_StoresCaption_Control1102154219Lbl)
            {
            }
            column(Overall_ShortageCaption_Control1102154220;Overall_ShortageCaption_Control1102154220Lbl)
            {
            }
            column(Qty__On_Purchase_OrderCaption_Control1102154290;Qty__On_Purchase_OrderCaption_Control1102154290Lbl)
            {
            }
            column(Qty__Under_InspectionCaption_Control1102154291;Qty__Under_InspectionCaption_Control1102154291Lbl)
            {
            }
            column(ShortageCaption_Control1102154292;ShortageCaption_Control1102154292Lbl)
            {
            }
            column(Integer9__Number;Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "Breaka" THEN
                CurrReport.BREAK ;

                IF BOM_DUM[9].NEXT=0 THEN
                "Breaka":=TRUE;

                //Rev01

                //<Integer9>, Header (2) - OnPreSection()
                Sheet9.Range('c1').Value :='Shortage material ';
                Sheet9.Range('A2').Value := 'Item No.';
                Sheet9.Range('b2').Value := 'Description';
                Sheet9.Range('c2').Value := 'Required Quantity';
                Sheet9.Range('d2').Value := 'Quantity At Stores';
                Sheet9.Range('e2').Value := 'Shortage';
                Sheet9.Range('f2').Value := 'Overall Shortage';
                Sheet9.Range('g2').Value := 'Qty. On Purchase Order';
                Sheet9.Range('h2').Value := 'Qty. Under Inspection';
                 Row:=2;
                //<Integer9>, Header (2) - OnPreSection()

                //<Integer9>, Body (3) - OnPreSection()
                "Stock AT Stores":=0;
                Shortage_ByConsidering_Previou:=0;

                IF Dum.GET(BOM_DUM[9]."No.") THEN BEGIN
                  "Quantity At Stores":=Dum."Maximum Inventory";
                  Shortage_ByConsidering_Previou:=Dum."Reorder Quantity";
                END;

                Int9Body3 := CurrReport.SHOWOUTPUT(BOM_DUM[PROD_NO]."Reorder Quantity">0); //Rev01

                IF BOM_DUM[PROD_NO]."Reorder Quantity">0 THEN BEGIN
                  Row+=1;
                  Sheet9.Range('a'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO]."No." ;
                  Sheet9.Range('b'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO].Description ;
                  Sheet9.Range('c'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO]."Budget Quantity" ;
                  Sheet9.Range('d'+FORMAT(Row)).Value :=FORMAT("Stock AT Stores") ;
                  IF Shortage_ByConsidering_Previou=(BOM_DUM[PROD_NO]."Budget Quantity"-"Stock AT Stores" ) THEN
                    Sheet9.Range('e'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Budget Quantity"-"Stock AT Stores")
                  ELSE
                   Sheet9.Range('e'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Budget Quantity");
                  Sheet9.Range('f'+FORMAT(Row)).Value :=FORMAT(Shortage_ByConsidering_Previou);
                  Sheet9.Range('g'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Standard Cost");
                  Sheet9.Range('h'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Unit Cost");
                END;
                //<Integer9>, Body (3) - OnPreSection()
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[9]='' THEN
                CurrReport.BREAK;
                PROD_QTY:= QTY[9];
                PROD_NO:=9;
                
                CLEAR(BOM_DUM[PROD_NO]);
                BOM_DUM[PROD_NO].DELETEALL;
                
                
                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                  Excel1.Worksheets.Add;
                  Sheet9 := Excel1.ActiveSheet;
                
                 Sheet9.Name :=CONVERTSTR(BOM[9],'/',' ');
                END;
                
                IF PBMH.GET(BOM[PROD_NO]) THEN
                Version1:=PBMH."Version Nos.";
                pbml.SETRANGE(pbml."Production BOM No.",BOM[PROD_NO]);
                pbml.SETRANGE(pbml."Version Code",Version1);
                IF pbml.FIND('-') THEN
                REPEAT
                  Desc1:=pbml.Description;
                  PBMH.RESET;
                  IF PBMH.GET(pbml."No.") THEN
                  Version2:=PBMH."Version Nos.";
                
                  PBML2.SETRANGE(PBML2."Production BOM No.",pbml."No.");
                  PBML2.SETRANGE(PBML2."Version Code",Version2);
                  IF PBML2.FIND('-') THEN
                  BEGIN
                    REPEAT
                
                      Desc2:=PBML2.Description;
                      PBMH.RESET;
                      IF PBMH.GET(PBML2."No.") THEN
                      Version3:=PBMH."Version Nos.";
                
                      PBML3.SETRANGE(PBML3."Production BOM No.",PBML2."No.");
                      PBML3.SETRANGE(PBML3."Version Code",Version3);
                      IF PBML3.FIND('-') THEN
                      BEGIN
                        REPEAT
                          Desc3:=PBML3.Description;
                          Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                
                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);
                
                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);
                
                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);
                
                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);
                
                  END;
                UNTIL  pbml.NEXT=0;
                Caliculate_Product_Shortage(PROD_NO);
                
                 /*
                BOUT.SETRANGE(BOUT.Code,BOM[PROD_NO]);
                IF BOUT.FIND('-') THEN
                BEGIN
                    Overall_Requirement(BOUT."Item No",PROD_QTY,BOUT.QTY,1,1);
                    Product_Requirement(PROD_NO,BOUT."Item No",PROD_QTY,BOUT.QTY,1,1);
                END;
                */
                "Breaka":=FALSE;
                BOM_DUM[9].SETFILTER(BOM_DUM[9]."Budget Quantity",'>%1',0);
                BOM_DUM[9].SETFILTER(BOM_DUM[9]."Product Group Code",'<>%1','CPCB');
                IF BOM_DUM[9].FIND('-') THEN

            end;
        }
        dataitem("<Integer10>";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(Integer10_Int10Body3;Int10Body3)
            {
            }
            column(QTY_10_;QTY[10])
            {
            }
            column(BOM_10_;BOM[10])
            {
            }
            column(BOM_DUM_10__Description;BOM_DUM[10].Description)
            {
            }
            column(BOM_DUM_10___Budget_Quantity_;BOM_DUM[10]."Budget Quantity")
            {
            }
            column(BOM_DUM_10___No__;BOM_DUM[10]."No.")
            {
            }
            column(Quantity_At_Stores__Control1102154338;"Quantity At Stores")
            {
            }
            column(Shortage_ByConsidering_Previou_Control1102154339;Shortage_ByConsidering_Previou)
            {
            }
            column(BOM_DUM_10___Standard_Cost_;BOM_DUM[10]."Standard Cost")
            {
            }
            column(BOM_DUM_10___Unit_Cost_;BOM_DUM[10]."Unit Cost")
            {
            }
            column(BOM_DUM_10___Budget_Quantity___Quantity_At_Stores_;BOM_DUM[10]."Budget Quantity"-"Quantity At Stores")
            {
            }
            column(Required_ProductCaption_Control1102154249;Required_ProductCaption_Control1102154249Lbl)
            {
            }
            column(Requirerd_QuantityCaption_Control1102154251;Requirerd_QuantityCaption_Control1102154251Lbl)
            {
            }
            column(No_Caption_Control1102154293;No_Caption_Control1102154293Lbl)
            {
            }
            column(DescriptionCaption_Control1102154294;DescriptionCaption_Control1102154294Lbl)
            {
            }
            column(Required_QTYCaption_Control1102154295;Required_QTYCaption_Control1102154295Lbl)
            {
            }
            column(Qty_At_StoresCaption_Control1102154297;Qty_At_StoresCaption_Control1102154297Lbl)
            {
            }
            column(Overall_ShortageCaption_Control1102154298;Overall_ShortageCaption_Control1102154298Lbl)
            {
            }
            column(Qty__On_Purchase_OrderCaption_Control1102154299;Qty__On_Purchase_OrderCaption_Control1102154299Lbl)
            {
            }
            column(Qty__Under_InspectionCaption_Control1102154300;Qty__Under_InspectionCaption_Control1102154300Lbl)
            {
            }
            column(ShortageCaption_Control1102154301;ShortageCaption_Control1102154301Lbl)
            {
            }
            column(Integer10__Number;Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "Breaka" THEN
                CurrReport.BREAK ;

                IF BOM_DUM[10].NEXT=0 THEN
                "Breaka":=TRUE;

                //Rev01

                //<Integer10>, Header (2) - OnPreSection()
                Sheet10.Range('c1').Value :='Shortage material ';
                Sheet10.Range('A2').Value := 'Item No.';
                Sheet10.Range('b2').Value := 'Description';
                Sheet10.Range('c2').Value := 'Required Quantity';
                Sheet10.Range('d2').Value := 'Quantity At Stores';
                Sheet10.Range('e2').Value := 'Shortage';
                Sheet10.Range('f2').Value := 'Overall Shortage';
                Sheet10.Range('g2').Value := 'Qty. On Purchase Order';
                Sheet10.Range('h2').Value := 'Qty. Under Inspection';
                 Row:=2;
                //<Integer10>, Header (2) - OnPreSection()

                //<Integer10>, Body (3) - OnPreSection()
                "Stock AT Stores":=0;
                Shortage_ByConsidering_Previou:=0;

                IF Dum.GET(BOM_DUM[10]."No.") THEN BEGIN
                  "Quantity At Stores":=Dum."Maximum Inventory";
                  Shortage_ByConsidering_Previou:=Dum."Reorder Quantity";
                END;

                Int10Body3 := CurrReport.SHOWOUTPUT(BOM_DUM[PROD_NO]."Reorder Quantity">0); //Rev01

                IF BOM_DUM[PROD_NO]."Reorder Quantity">0 THEN BEGIN
                  Row+=1;
                  Sheet10.Range('a'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO]."No." ;
                  Sheet10.Range('b'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO].Description ;
                  Sheet10.Range('c'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO]."Budget Quantity" ;
                  Sheet10.Range('d'+FORMAT(Row)).Value :=FORMAT("Stock AT Stores") ;
                  IF Shortage_ByConsidering_Previou=(BOM_DUM[PROD_NO]."Budget Quantity"-"Stock AT Stores" ) THEN
                    Sheet10.Range('e'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Budget Quantity"-"Stock AT Stores")
                  ELSE
                   Sheet10.Range('e'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Budget Quantity");
                  Sheet10.Range('f'+FORMAT(Row)).Value :=FORMAT(Shortage_ByConsidering_Previou);
                  Sheet10.Range('g'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Standard Cost");
                  Sheet10.Range('h'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Unit Cost");
                END;
                //<Integer10>, Body (3) - OnPreSection()
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[10]='' THEN
                CurrReport.BREAK;
                PROD_QTY:= QTY[10];
                PROD_NO:=10;

                CLEAR(BOM_DUM[PROD_NO]);
                BOM_DUM[PROD_NO].DELETEALL;


                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                  Excel1.Worksheets.Add;
                  Sheet10 := Excel1.ActiveSheet;

                  Sheet10.Name :=CONVERTSTR(BOM[10],'/',' ');
                END;

                IF PBMH.GET(BOM[PROD_NO]) THEN
                Version1:=PBMH."Version Nos.";
                pbml.SETRANGE(pbml."Production BOM No.",BOM[PROD_NO]);
                pbml.SETRANGE(pbml."Version Code",Version1);
                IF pbml.FIND('-') THEN
                REPEAT
                  Desc1:=pbml.Description;
                  PBMH.RESET;
                  IF PBMH.GET(pbml."No.") THEN
                  Version2:=PBMH."Version Nos.";

                  PBML2.SETRANGE(PBML2."Production BOM No.",pbml."No.");
                  PBML2.SETRANGE(PBML2."Version Code",Version2);
                  IF PBML2.FIND('-') THEN
                  BEGIN
                    REPEAT

                      Desc2:=PBML2.Description;
                      PBMH.RESET;
                      IF PBMH.GET(PBML2."No.") THEN
                      Version3:=PBMH."Version Nos.";

                      PBML3.SETRANGE(PBML3."Production BOM No.",PBML2."No.");
                      PBML3.SETRANGE(PBML3."Version Code",Version3);
                      IF PBML3.FIND('-') THEN
                      BEGIN
                        REPEAT
                          Desc3:=PBML3.Description;
                          Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                Caliculate_Product_Shortage(PROD_NO);

                BOUT.SETRANGE(BOUT.Code,BOM[10]);
                IF BOUT.FIND('-') THEN
                BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,BOUT.QTY,1,1);
                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,BOUT.QTY,1,1);
                END;

                "Breaka":=FALSE;
                BOM_DUM[10].SETFILTER(BOM_DUM[10]."Budget Quantity",'>%1',0);
                BOM_DUM[10].SETFILTER(BOM_DUM[10]."Product Group Code",'<>%1','CPCB');
                IF BOM_DUM[10].FIND('-') THEN
            end;
        }
        dataitem("<Integer11>";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(Integer11_Int11Body3;Int11Body3)
            {
            }
            column(QTY_11_;QTY[11])
            {
            }
            column(BOM_11_;BOM[11])
            {
            }
            column(BOM_DUM_11__Description;BOM_DUM[11].Description)
            {
            }
            column(BOM_DUM_11___Budget_Quantity_;BOM_DUM[11]."Budget Quantity")
            {
            }
            column(BOM_DUM_11___No__;BOM_DUM[11]."No.")
            {
            }
            column(Quantity_At_Stores__Control1102154345;"Quantity At Stores")
            {
            }
            column(Shortage_ByConsidering_Previou_Control1102154346;Shortage_ByConsidering_Previou)
            {
            }
            column(BOM_DUM_11___Standard_Cost_;BOM_DUM[11]."Standard Cost")
            {
            }
            column(BOM_DUM_11___Unit_Cost_;BOM_DUM[11]."Unit Cost")
            {
            }
            column(BOM_DUM_11___Budget_Quantity___Quantity_At_Stores_;BOM_DUM[11]."Budget Quantity"-"Quantity At Stores")
            {
            }
            column(Required_ProductCaption_Control1102154254;Required_ProductCaption_Control1102154254Lbl)
            {
            }
            column(Requirerd_QuantityCaption_Control1102154256;Requirerd_QuantityCaption_Control1102154256Lbl)
            {
            }
            column(No_Caption_Control1102154302;No_Caption_Control1102154302Lbl)
            {
            }
            column(DescriptionCaption_Control1102154303;DescriptionCaption_Control1102154303Lbl)
            {
            }
            column(Required_QTYCaption_Control1102154304;Required_QTYCaption_Control1102154304Lbl)
            {
            }
            column(Qty_At_StoresCaption_Control1102154306;Qty_At_StoresCaption_Control1102154306Lbl)
            {
            }
            column(Overall_ShortageCaption_Control1102154307;Overall_ShortageCaption_Control1102154307Lbl)
            {
            }
            column(Qty__On_Purchase_OrderCaption_Control1102154308;Qty__On_Purchase_OrderCaption_Control1102154308Lbl)
            {
            }
            column(Qty__Under_InspectionCaption_Control1102154309;Qty__Under_InspectionCaption_Control1102154309Lbl)
            {
            }
            column(ShortageCaption_Control1102154310;ShortageCaption_Control1102154310Lbl)
            {
            }
            column(Integer11__Number;Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "Breaka" THEN
                CurrReport.BREAK ;


                IF BOM_DUM[11].NEXT=0 THEN
                "Breaka":=TRUE;

                //Rev01

                //<Integer11>, Header (2) - OnPreSection()
                Sheet11.Range('c1').Value :='Shortage material ';
                Sheet11.Range('A2').Value := 'Item No.';
                Sheet11.Range('b2').Value := 'Description';
                Sheet11.Range('c2').Value := 'Required Quantity';
                Sheet11.Range('d2').Value := 'Quantity At Stores';
                Sheet11.Range('e2').Value := 'Shortage';
                Sheet11.Range('f2').Value := 'Overall Shortage';
                Sheet11.Range('g2').Value := 'Qty. On Purchase Order';
                Sheet11.Range('h2').Value := 'Qty. Under Inspection';
                 Row:=2;
                //<Integer11>, Header (2) - OnPreSection()

                //<Integer11>, Body (3) - OnPreSection()
                "Stock AT Stores":=0;
                Shortage_ByConsidering_Previou:=0;

                IF Dum.GET(BOM_DUM[11]."No.") THEN BEGIN
                  "Quantity At Stores":=Dum."Maximum Inventory";
                  Shortage_ByConsidering_Previou:=Dum."Reorder Quantity";
                END;

                Int11Body3 := CurrReport.SHOWOUTPUT(BOM_DUM[PROD_NO]."Reorder Quantity">0); //Rev01
                IF BOM_DUM[PROD_NO]."Reorder Quantity">0 THEN BEGIN
                 Row+=1;
                 Sheet11.Range('a'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO]."No." ;
                 Sheet11.Range('b'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO].Description ;
                 Sheet11.Range('c'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO]."Budget Quantity" ;
                  Sheet11.Range('d'+FORMAT(Row)).Value :=FORMAT("Stock AT Stores") ;
                 IF Shortage_ByConsidering_Previou=(BOM_DUM[PROD_NO]."Budget Quantity"-"Stock AT Stores" ) THEN
                   Sheet11.Range('e'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Budget Quantity"-"Stock AT Stores")
                 ELSE
                  Sheet11.Range('e'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Budget Quantity");
                 Sheet11.Range('f'+FORMAT(Row)).Value :=FORMAT(Shortage_ByConsidering_Previou);
                 Sheet11.Range('g'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Standard Cost");
                 Sheet11.Range('h'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Unit Cost");
                END;
                //<Integer11>, Body (3) - OnPreSection()
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[11]='' THEN
                CurrReport.BREAK;
                PROD_QTY:= QTY[11];
                PROD_NO:=11;

                CLEAR(BOM_DUM[PROD_NO]);
                BOM_DUM[PROD_NO].DELETEALL;


                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                 Excel1.Worksheets.Add;
                  Sheet11 := Excel1.ActiveSheet;

                  Sheet11.Name :=CONVERTSTR(BOM[11],'/',' ');
                END;

                IF PBMH.GET(BOM[PROD_NO]) THEN
                Version1:=PBMH."Version Nos.";
                pbml.SETRANGE(pbml."Production BOM No.",BOM[PROD_NO]);
                pbml.SETRANGE(pbml."Version Code",Version1);
                IF pbml.FIND('-') THEN
                REPEAT
                  Desc1:=pbml.Description;
                  PBMH.RESET;
                  IF PBMH.GET(pbml."No.") THEN
                  Version2:=PBMH."Version Nos.";

                  PBML2.SETRANGE(PBML2."Production BOM No.",pbml."No.");
                  PBML2.SETRANGE(PBML2."Version Code",Version2);
                  IF PBML2.FIND('-') THEN
                  BEGIN
                    REPEAT

                      Desc2:=PBML2.Description;
                      PBMH.RESET;
                      IF PBMH.GET(PBML2."No.") THEN
                      Version3:=PBMH."Version Nos.";

                      PBML3.SETRANGE(PBML3."Production BOM No.",PBML2."No.");
                      PBML3.SETRANGE(PBML3."Version Code",Version3);
                      IF PBML3.FIND('-') THEN
                      BEGIN
                        REPEAT
                          Desc3:=PBML3.Description;
                          Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                Caliculate_Product_Shortage(PROD_NO);

                BOUT.SETRANGE(BOUT.Code,BOM[11]);
                IF BOUT.FIND('-') THEN
                BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,BOUT.QTY,1,1);
                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,BOUT.QTY,1,1);
                END;

                "Breaka":=FALSE;
                BOM_DUM[11].SETFILTER(BOM_DUM[11]."Budget Quantity",'>%1',0);
                BOM_DUM[11].SETFILTER(BOM_DUM[11]."Product Group Code",'<>%1','CPCB');
                IF BOM_DUM[11].FIND('-') THEN
            end;
        }
        dataitem("<Integer12>";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(Integer12_Int12Body3;Int12Body3)
            {
            }
            column(QTY_12_;QTY[12])
            {
            }
            column(BOM_12_;BOM[12])
            {
            }
            column(BOM_DUM_12__Description;BOM_DUM[12].Description)
            {
            }
            column(BOM_DUM_12___Budget_Quantity_;BOM_DUM[12]."Budget Quantity")
            {
            }
            column(BOM_DUM_12___No__;BOM_DUM[12]."No.")
            {
            }
            column(Quantity_At_Stores__Control1102154352;"Quantity At Stores")
            {
            }
            column(Shortage_ByConsidering_Previou_Control1102154353;Shortage_ByConsidering_Previou)
            {
            }
            column(BOM_DUM_12___Standard_Cost_;BOM_DUM[12]."Standard Cost")
            {
            }
            column(BOM_DUM_12___Unit_Cost_;BOM_DUM[12]."Unit Cost")
            {
            }
            column(BOM_DUM_12___Budget_Quantity___Quantity_At_Stores_;BOM_DUM[12]."Budget Quantity"-"Quantity At Stores")
            {
            }
            column(Required_ProductCaption_Control1102154259;Required_ProductCaption_Control1102154259Lbl)
            {
            }
            column(Requirerd_QuantityCaption_Control1102154261;Requirerd_QuantityCaption_Control1102154261Lbl)
            {
            }
            column(No_Caption_Control1102154311;No_Caption_Control1102154311Lbl)
            {
            }
            column(DescriptionCaption_Control1102154312;DescriptionCaption_Control1102154312Lbl)
            {
            }
            column(Required_QTYCaption_Control1102154313;Required_QTYCaption_Control1102154313Lbl)
            {
            }
            column(Qty_At_StoresCaption_Control1102154315;Qty_At_StoresCaption_Control1102154315Lbl)
            {
            }
            column(Overall_ShortageCaption_Control1102154316;Overall_ShortageCaption_Control1102154316Lbl)
            {
            }
            column(Qty__On_Purchase_OrderCaption_Control1102154317;Qty__On_Purchase_OrderCaption_Control1102154317Lbl)
            {
            }
            column(Qty__Under_InspectionCaption_Control1102154318;Qty__Under_InspectionCaption_Control1102154318Lbl)
            {
            }
            column(ShortageCaption_Control1102154384;ShortageCaption_Control1102154384Lbl)
            {
            }
            column(Integer12__Number;Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "Breaka" THEN
                CurrReport.BREAK ;

                IF BOM_DUM[12].NEXT=0 THEN
                "Breaka":=TRUE;

                //Rev01

                //<Integer12>, Header (2) - OnPreSection()
                Sheet12.Range('c1').Value :='Shortage material ';
                Sheet12.Range('A2').Value := 'Item No.';
                Sheet12.Range('b2').Value := 'Description';
                Sheet12.Range('c2').Value := 'Required Quantity';
                Sheet12.Range('d2').Value := 'Quantity At Stores';
                Sheet12.Range('e2').Value := 'Shortage';
                Sheet12.Range('f2').Value := 'Overall Shortage';
                Sheet12.Range('g2').Value := 'Qty. On Purchase Order';
                Sheet12.Range('h2').Value := 'Qty. Under Inspection';
                 Row:=2;
                //<Integer12>, Header (2) - OnPreSection()

                //<Integer12>, Body (3) - OnPreSection()
                "Stock AT Stores":=0;
                Shortage_ByConsidering_Previou:=0;

                IF Dum.GET(BOM_DUM[12]."No.") THEN BEGIN
                  "Quantity At Stores":=Dum."Maximum Inventory";
                  Shortage_ByConsidering_Previou:=Dum."Reorder Quantity";
                END;

                Int12Body3 := CurrReport.SHOWOUTPUT(BOM_DUM[PROD_NO]."Reorder Quantity">0); //Rev01

                IF BOM_DUM[PROD_NO]."Reorder Quantity">0 THEN BEGIN
                 Row+=1;
                 Sheet12.Range('a'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO]."No." ;
                 Sheet12.Range('b'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO].Description ;
                 Sheet12.Range('c'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO]."Budget Quantity" ;
                 Sheet12.Range('d'+FORMAT(Row)).Value :=FORMAT("Stock AT Stores") ;
                 IF Shortage_ByConsidering_Previou=(BOM_DUM[PROD_NO]."Budget Quantity"-"Stock AT Stores" ) THEN
                   Sheet12.Range('e'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Budget Quantity"-"Stock AT Stores")
                 ELSE
                  Sheet12.Range('e'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Budget Quantity");
                 Sheet12.Range('f'+FORMAT(Row)).Value :=FORMAT(Shortage_ByConsidering_Previou);
                 Sheet12.Range('g'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Standard Cost");
                 Sheet12.Range('h'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Unit Cost");
                END;
                //<Integer12>, Body (3) - OnPreSection()
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[12]='' THEN
                CurrReport.BREAK;
                PROD_QTY:= QTY[12];
                PROD_NO:=12;

                CLEAR(BOM_DUM[PROD_NO]);
                BOM_DUM[PROD_NO].DELETEALL;


                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                 Excel1.Worksheets.Add;
                  Sheet12 := Excel1.ActiveSheet;

                  Sheet12.Name :=CONVERTSTR(BOM[12],'/',' ');
                END;

                IF PBMH.GET(BOM[PROD_NO]) THEN
                Version1:=PBMH."Version Nos.";
                pbml.SETRANGE(pbml."Production BOM No.",BOM[PROD_NO]);
                pbml.SETRANGE(pbml."Version Code",Version1);
                IF pbml.FIND('-') THEN
                REPEAT
                  Desc1:=pbml.Description;
                  PBMH.RESET;
                  IF PBMH.GET(pbml."No.") THEN
                  Version2:=PBMH."Version Nos.";

                  PBML2.SETRANGE(PBML2."Production BOM No.",pbml."No.");
                  PBML2.SETRANGE(PBML2."Version Code",Version2);
                  IF PBML2.FIND('-') THEN
                  BEGIN
                    REPEAT

                      Desc2:=PBML2.Description;
                      PBMH.RESET;
                      IF PBMH.GET(PBML2."No.") THEN
                      Version3:=PBMH."Version Nos.";

                      PBML3.SETRANGE(PBML3."Production BOM No.",PBML2."No.");
                      PBML3.SETRANGE(PBML3."Version Code",Version3);
                      IF PBML3.FIND('-') THEN
                      BEGIN
                        REPEAT
                          Desc3:=PBML3.Description;
                          Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                Caliculate_Product_Shortage(PROD_NO);

                BOUT.SETRANGE(BOUT.Code,BOM[12]);
                IF BOUT.FIND('-') THEN
                BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,BOUT.QTY,1,1);
                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,BOUT.QTY,1,1);
                END;

                "Breaka":=FALSE;
                BOM_DUM[12].SETFILTER(BOM_DUM[12]."Budget Quantity",'>%1',0);
                BOM_DUM[12].SETFILTER(BOM_DUM[12]."Product Group Code",'<>%1','CPCB');
                IF BOM_DUM[12].FIND('-') THEN
            end;
        }
        dataitem("<Integer13>";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(Integer13_Int13Body3;Int13Body3)
            {
            }
            column(QTY_13_;QTY[13])
            {
            }
            column(BOM_13_;BOM[13])
            {
            }
            column(BOM_DUM_13__Description;BOM_DUM[13].Description)
            {
            }
            column(BOM_DUM_13___Budget_Quantity_;BOM_DUM[13]."Budget Quantity")
            {
            }
            column(BOM_DUM_13___No__;BOM_DUM[13]."No.")
            {
            }
            column(Quantity_At_Stores__Control1102154359;"Quantity At Stores")
            {
            }
            column(Shortage_ByConsidering_Previou_Control1102154360;Shortage_ByConsidering_Previou)
            {
            }
            column(BOM_DUM_13___Standard_Cost_;BOM_DUM[13]."Standard Cost")
            {
            }
            column(BOM_DUM_13___Unit_Cost_;BOM_DUM[13]."Unit Cost")
            {
            }
            column(BOM_DUM_13___Budget_Quantity___Quantity_At_Stores_;BOM_DUM[13]."Budget Quantity"-"Quantity At Stores")
            {
            }
            column(Required_ProductCaption_Control1102154264;Required_ProductCaption_Control1102154264Lbl)
            {
            }
            column(Requirerd_QuantityCaption_Control1102154266;Requirerd_QuantityCaption_Control1102154266Lbl)
            {
            }
            column(No_Caption_Control1102154385;No_Caption_Control1102154385Lbl)
            {
            }
            column(DescriptionCaption_Control1102154386;DescriptionCaption_Control1102154386Lbl)
            {
            }
            column(Required_QTYCaption_Control1102154387;Required_QTYCaption_Control1102154387Lbl)
            {
            }
            column(Qty_At_StoresCaption_Control1102154389;Qty_At_StoresCaption_Control1102154389Lbl)
            {
            }
            column(Overall_ShortageCaption_Control1102154390;Overall_ShortageCaption_Control1102154390Lbl)
            {
            }
            column(Qty__On_Purchase_OrderCaption_Control1102154391;Qty__On_Purchase_OrderCaption_Control1102154391Lbl)
            {
            }
            column(Qty__Under_InspectionCaption_Control1102154392;Qty__Under_InspectionCaption_Control1102154392Lbl)
            {
            }
            column(ShortageCaption_Control1102154393;ShortageCaption_Control1102154393Lbl)
            {
            }
            column(Integer13__Number;Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "Breaka" THEN
                CurrReport.BREAK ;

                IF BOM_DUM[13].NEXT=0 THEN
                "Breaka":=TRUE;

                //Rev01

                //<Integer13>, Header (2) - OnPreSection()
                Sheet13.Range('c1').Value :='Shortage material ';
                Sheet13.Range('A2').Value := 'Item No.';
                Sheet13.Range('b2').Value := 'Description';
                Sheet13.Range('c2').Value := 'Required Quantity';
                Sheet13.Range('d2').Value := 'Quantity At Stores';
                Sheet13.Range('e2').Value := 'Shortage';
                Sheet13.Range('f2').Value := 'Overall Shortage';
                Sheet13.Range('g2').Value := 'Qty. On Purchase Order';
                Sheet13.Range('h2').Value := 'Qty. Under Inspection';
                 Row:=2;
                //<Integer13>, Header (2) - OnPreSection()

                //<Integer13>, Body (3) - OnPreSection()
                "Stock AT Stores":=0;
                Shortage_ByConsidering_Previou:=0;

                IF Dum.GET(BOM_DUM[13]."No.") THEN BEGIN
                  "Quantity At Stores":=Dum."Maximum Inventory";
                  Shortage_ByConsidering_Previou:=Dum."Reorder Quantity";
                END;

                Int13Body3 := CurrReport.SHOWOUTPUT(BOM_DUM[PROD_NO]."Reorder Quantity">0); //Rev01

                IF BOM_DUM[PROD_NO]."Reorder Quantity">0 THEN BEGIN
                 Row+=1;
                 Sheet13.Range('a'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO]."No." ;
                 Sheet13.Range('b'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO].Description ;
                 Sheet13.Range('c'+FORMAT(Row)).Value :=BOM_DUM[PROD_NO]."Budget Quantity" ;
                 Sheet13.Range('d'+FORMAT(Row)).Value :=FORMAT("Stock AT Stores") ;
                 IF Shortage_ByConsidering_Previou=(BOM_DUM[PROD_NO]."Budget Quantity"-"Stock AT Stores" ) THEN
                   Sheet13.Range('e'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Budget Quantity"-"Stock AT Stores")
                 ELSE
                  Sheet13.Range('e'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Budget Quantity");
                 Sheet13.Range('f'+FORMAT(Row)).Value :=FORMAT(Shortage_ByConsidering_Previou);
                 Sheet13.Range('g'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Standard Cost");
                 Sheet13.Range('h'+FORMAT(Row)).Value :=FORMAT(BOM_DUM[PROD_NO]."Unit Cost");
                END;
                //<Integer13>, Body (3) - OnPreSection()
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[13]='' THEN
                CurrReport.BREAK;

                PROD_QTY:= QTY[13];
                PROD_NO:=13;

                CLEAR(BOM_DUM[PROD_NO]);
                BOM_DUM[PROD_NO].DELETEALL;

                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                  Excel1.Worksheets.Add;
                  Sheet13 := Excel1.ActiveSheet;

                  Sheet13.Name :=CONVERTSTR(BOM[13],'/',' ');
                END;

                IF PBMH.GET(BOM[PROD_NO]) THEN
                Version1:=PBMH."Version Nos.";
                pbml.SETRANGE(pbml."Production BOM No.",BOM[PROD_NO]);
                pbml.SETRANGE(pbml."Version Code",Version1);
                IF pbml.FIND('-') THEN
                REPEAT
                  Desc1:=pbml.Description;
                  PBMH.RESET;
                  IF PBMH.GET(pbml."No.") THEN
                  Version2:=PBMH."Version Nos.";

                  PBML2.SETRANGE(PBML2."Production BOM No.",pbml."No.");
                  PBML2.SETRANGE(PBML2."Version Code",Version2);
                  IF PBML2.FIND('-') THEN
                  BEGIN
                    REPEAT

                      Desc2:=PBML2.Description;
                      PBMH.RESET;
                      IF PBMH.GET(PBML2."No.") THEN
                      Version3:=PBMH."Version Nos.";

                      PBML3.SETRANGE(PBML3."Production BOM No.",PBML2."No.");
                      PBML3.SETRANGE(PBML3."Version Code",Version3);
                      IF PBML3.FIND('-') THEN
                      BEGIN
                        REPEAT
                          Desc3:=PBML3.Description;
                          Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                Caliculate_Product_Shortage(PROD_NO);

                BOUT.SETRANGE(BOUT.Code,BOM[13]);
                IF BOUT.FIND('-') THEN
                BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,BOUT.QTY,1,1);
                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,BOUT.QTY,1,1);
                END;

                "Breaka":=FALSE;
                BOM_DUM[13].SETFILTER(BOM_DUM[13]."Budget Quantity",'>%1',0);
                BOM_DUM[13].SETFILTER(BOM_DUM[13]."Product Group Code",'<>%1','CPCB');
                IF BOM_DUM[13].FIND('-') THEN
            end;
        }
        dataitem("<Integer14>";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(QTY_14_;QTY[14])
            {
            }
            column(BOM_14_;BOM[14])
            {
            }
            column(BOM_DUM_14__Description;BOM_DUM[14].Description)
            {
            }
            column(BOM_DUM_14___Budget_Quantity_;BOM_DUM[14]."Budget Quantity")
            {
            }
            column(BOM_DUM_14___No__;BOM_DUM[14]."No.")
            {
            }
            column(Quantity_At_Stores__Control1102154366;"Quantity At Stores")
            {
            }
            column(Shortage_ByConsidering_Previou_Control1102154367;Shortage_ByConsidering_Previou)
            {
            }
            column(BOM_DUM_14___Standard_Cost_;BOM_DUM[14]."Standard Cost")
            {
            }
            column(BOM_DUM_14___Unit_Cost_;BOM_DUM[14]."Unit Cost")
            {
            }
            column(BOM_DUM_14___Budget_Quantity___Quantity_At_Stores_;BOM_DUM[14]."Budget Quantity"-"Quantity At Stores")
            {
            }
            column(Required_ProductCaption_Control1102154269;Required_ProductCaption_Control1102154269Lbl)
            {
            }
            column(Requirerd_QuantityCaption_Control1102154271;Requirerd_QuantityCaption_Control1102154271Lbl)
            {
            }
            column(No_Caption_Control1102154394;No_Caption_Control1102154394Lbl)
            {
            }
            column(DescriptionCaption_Control1102154395;DescriptionCaption_Control1102154395Lbl)
            {
            }
            column(Required_QTYCaption_Control1102154396;Required_QTYCaption_Control1102154396Lbl)
            {
            }
            column(Qty_At_StoresCaption_Control1102154398;Qty_At_StoresCaption_Control1102154398Lbl)
            {
            }
            column(Overall_ShortageCaption_Control1102154399;Overall_ShortageCaption_Control1102154399Lbl)
            {
            }
            column(Qty__On_Purchase_OrderCaption_Control1102154400;Qty__On_Purchase_OrderCaption_Control1102154400Lbl)
            {
            }
            column(Qty__Under_InspectionCaption_Control1102154401;Qty__Under_InspectionCaption_Control1102154401Lbl)
            {
            }
            column(ShortageCaption_Control1102154402;ShortageCaption_Control1102154402Lbl)
            {
            }
            column(Integer14__Number;Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "Breaka" THEN
                CurrReport.BREAK ;

                IF BOM_DUM[14].NEXT=0 THEN
                "Breaka":=TRUE;
                        Row:=0;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[14]='' THEN
                CurrReport.BREAK;
                PROD_QTY:= QTY[14];
                PROD_NO:=14;

                CLEAR(BOM_DUM[PROD_NO]);
                BOM_DUM[PROD_NO].DELETEALL;

                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                  Excel1.Worksheets.Add;
                  Sheet14 := Excel1.ActiveSheet;

                  Sheet14.Name :=CONVERTSTR(BOM[14],'/',' ');
                END;

                IF PBMH.GET(BOM[PROD_NO]) THEN
                Version1:=PBMH."Version Nos.";
                pbml.SETRANGE(pbml."Production BOM No.",BOM[PROD_NO]);
                pbml.SETRANGE(pbml."Version Code",Version1);
                IF pbml.FIND('-') THEN
                REPEAT
                  Desc1:=pbml.Description;
                  PBMH.RESET;
                  IF PBMH.GET(pbml."No.") THEN
                  Version2:=PBMH."Version Nos.";

                  PBML2.SETRANGE(PBML2."Production BOM No.",pbml."No.");
                  PBML2.SETRANGE(PBML2."Version Code",Version2);
                  IF PBML2.FIND('-') THEN
                  BEGIN
                    REPEAT

                      Desc2:=PBML2.Description;
                      PBMH.RESET;
                      IF PBMH.GET(PBML2."No.") THEN
                      Version3:=PBMH."Version Nos.";

                      PBML3.SETRANGE(PBML3."Production BOM No.",PBML2."No.");
                      PBML3.SETRANGE(PBML3."Version Code",Version3);
                      IF PBML3.FIND('-') THEN
                      BEGIN
                        REPEAT
                          Desc3:=PBML3.Description;
                          Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                Caliculate_Product_Shortage(PROD_NO);


                "Breaka":=FALSE;
                BOM_DUM[14].SETFILTER(BOM_DUM[14]."Budget Quantity",'>%1',0);
                BOM_DUM[14].SETFILTER(BOM_DUM[14]."Product Group Code",'<>%1','CPCB');
                IF BOM_DUM[14].FIND('-') THEN
            end;
        }
        dataitem("<Integer15>";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(QTY_15_;QTY[15])
            {
            }
            column(BOM_15_;BOM[15])
            {
            }
            column(BOM_DUM_15__Description;BOM_DUM[15].Description)
            {
            }
            column(BOM_DUM_15___Budget_Quantity_;BOM_DUM[15]."Budget Quantity")
            {
            }
            column(BOM_DUM_15___No__;BOM_DUM[15]."No.")
            {
            }
            column(Quantity_At_Stores__Control1102154373;"Quantity At Stores")
            {
            }
            column(Shortage_ByConsidering_Previou_Control1102154374;Shortage_ByConsidering_Previou)
            {
            }
            column(BOM_DUM_15___Standard_Cost_;BOM_DUM[15]."Standard Cost")
            {
            }
            column(BOM_DUM_15___Unit_Cost_;BOM_DUM[15]."Unit Cost")
            {
            }
            column(BOM_DUM_15___Budget_Quantity___Quantity_At_Stores_;BOM_DUM[15]."Budget Quantity"-"Quantity At Stores")
            {
            }
            column(Required_ProductCaption_Control1102154274;Required_ProductCaption_Control1102154274Lbl)
            {
            }
            column(Requirerd_QuantityCaption_Control1102154276;Requirerd_QuantityCaption_Control1102154276Lbl)
            {
            }
            column(No_Caption_Control1102154403;No_Caption_Control1102154403Lbl)
            {
            }
            column(DescriptionCaption_Control1102154404;DescriptionCaption_Control1102154404Lbl)
            {
            }
            column(Required_QTYCaption_Control1102154405;Required_QTYCaption_Control1102154405Lbl)
            {
            }
            column(Qty_At_StoresCaption_Control1102154407;Qty_At_StoresCaption_Control1102154407Lbl)
            {
            }
            column(Overall_ShortageCaption_Control1102154408;Overall_ShortageCaption_Control1102154408Lbl)
            {
            }
            column(Qty__On_Purchase_OrderCaption_Control1102154409;Qty__On_Purchase_OrderCaption_Control1102154409Lbl)
            {
            }
            column(Qty__Under_InspectionCaption_Control1102154410;Qty__Under_InspectionCaption_Control1102154410Lbl)
            {
            }
            column(ShortageCaption_Control1102154411;ShortageCaption_Control1102154411Lbl)
            {
            }
            column(Integer15__Number;Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "Breaka" THEN
                CurrReport.BREAK ;

                IF BOM_DUM[15].NEXT=0 THEN
                "Breaka":=TRUE;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[15]='' THEN
                CurrReport.BREAK;

                PROD_QTY:= QTY[15];
                PROD_NO:=15;

                CLEAR(BOM_DUM[PROD_NO]);
                BOM_DUM[PROD_NO].DELETEALL;

                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                  Excel1.Worksheets.Add;
                  Sheet15 := Excel1.ActiveSheet;

                  Sheet15.Name :=CONVERTSTR(BOM[15],'/',' ');;
                END;

                IF PBMH.GET(BOM[PROD_NO]) THEN
                Version1:=PBMH."Version Nos.";
                pbml.SETRANGE(pbml."Production BOM No.",BOM[PROD_NO]);
                pbml.SETRANGE(pbml."Version Code",Version1);
                IF pbml.FIND('-') THEN
                REPEAT
                  Desc1:=pbml.Description;
                  PBMH.RESET;
                  IF PBMH.GET(pbml."No.") THEN
                  Version2:=PBMH."Version Nos.";

                  PBML2.SETRANGE(PBML2."Production BOM No.",pbml."No.");
                  PBML2.SETRANGE(PBML2."Version Code",Version2);
                  IF PBML2.FIND('-') THEN
                  BEGIN
                    REPEAT

                      Desc2:=PBML2.Description;
                      PBMH.RESET;
                      IF PBMH.GET(PBML2."No.") THEN
                      Version3:=PBMH."Version Nos.";

                      PBML3.SETRANGE(PBML3."Production BOM No.",PBML2."No.");
                      PBML3.SETRANGE(PBML3."Version Code",Version3);
                      IF PBML3.FIND('-') THEN
                      BEGIN
                        REPEAT
                          Desc3:=PBML3.Description;
                          Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                Caliculate_Product_Shortage(PROD_NO);

                "Breaka":=FALSE;
                BOM_DUM[15].SETFILTER(BOM_DUM[15]."Budget Quantity",'>%1',0);
                BOM_DUM[15].SETFILTER(BOM_DUM[15]."Product Group Code",'<>%1','CPCB');
                IF BOM_DUM[15].FIND('-') THEN
            end;
        }
        dataitem("<Integer16>";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(QTY_16_;QTY[16])
            {
            }
            column(BOM_16_;BOM[16])
            {
            }
            column(BOM_DUM_16__Description;BOM_DUM[16].Description)
            {
            }
            column(BOM_DUM_16___Budget_Quantity_;BOM_DUM[16]."Budget Quantity")
            {
            }
            column(BOM_DUM_16___No__;BOM_DUM[16]."No.")
            {
            }
            column(Quantity_At_Stores__Control1102154380;"Quantity At Stores")
            {
            }
            column(Shortage_ByConsidering_Previou_Control1102154381;Shortage_ByConsidering_Previou)
            {
            }
            column(BOM_DUM_16___Standard_Cost_;BOM_DUM[16]."Standard Cost")
            {
            }
            column(BOM_DUM_16___Unit_Cost_;BOM_DUM[16]."Unit Cost")
            {
            }
            column(BOM_DUM_16___Budget_Quantity___Quantity_At_Stores_;BOM_DUM[16]."Budget Quantity"-"Quantity At Stores")
            {
            }
            column(Required_ProductCaption_Control1102154279;Required_ProductCaption_Control1102154279Lbl)
            {
            }
            column(Requirerd_QuantityCaption_Control1102154281;Requirerd_QuantityCaption_Control1102154281Lbl)
            {
            }
            column(No_Caption_Control1102154412;No_Caption_Control1102154412Lbl)
            {
            }
            column(DescriptionCaption_Control1102154413;DescriptionCaption_Control1102154413Lbl)
            {
            }
            column(Required_QTYCaption_Control1102154414;Required_QTYCaption_Control1102154414Lbl)
            {
            }
            column(Qty_At_StoresCaption_Control1102154416;Qty_At_StoresCaption_Control1102154416Lbl)
            {
            }
            column(Overall_ShortageCaption_Control1102154417;Overall_ShortageCaption_Control1102154417Lbl)
            {
            }
            column(Qty__On_Purchase_OrderCaption_Control1102154418;Qty__On_Purchase_OrderCaption_Control1102154418Lbl)
            {
            }
            column(Qty__Under_InspectionCaption_Control1102154419;Qty__Under_InspectionCaption_Control1102154419Lbl)
            {
            }
            column(ShortageCaption_Control1102154420;ShortageCaption_Control1102154420Lbl)
            {
            }
            column(Integer16__Number;Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "Breaka" THEN
                CurrReport.BREAK ;

                IF BOM_DUM[PROD_NO].NEXT=0 THEN
                "Breaka":=TRUE;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[16]='' THEN
                CurrReport.BREAK;

                PROD_QTY:= QTY[16];
                PROD_NO:=16;

                CLEAR(BOM_DUM[PROD_NO]);
                BOM_DUM[PROD_NO].DELETEALL;


                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                 Excel1.Worksheets.Add;
                  Sheet16 := Excel1.ActiveSheet;

                  Sheet16.Name :=CONVERTSTR(BOM[16],'/',' ');;
                END;

                IF PBMH.GET(BOM[PROD_NO]) THEN
                Version1:=PBMH."Version Nos.";
                pbml.SETRANGE(pbml."Production BOM No.",BOM[PROD_NO]);
                pbml.SETRANGE(pbml."Version Code",Version1);
                IF pbml.FIND('-') THEN
                REPEAT
                  Desc1:=pbml.Description;
                  PBMH.RESET;
                  IF PBMH.GET(pbml."No.") THEN
                  Version2:=PBMH."Version Nos.";

                  PBML2.SETRANGE(PBML2."Production BOM No.",pbml."No.");
                  PBML2.SETRANGE(PBML2."Version Code",Version2);
                  IF PBML2.FIND('-') THEN
                  BEGIN
                    REPEAT

                      Desc2:=PBML2.Description;
                      PBMH.RESET;
                      IF PBMH.GET(PBML2."No.") THEN
                      Version3:=PBMH."Version Nos.";

                      PBML3.SETRANGE(PBML3."Production BOM No.",PBML2."No.");
                      PBML3.SETRANGE(PBML3."Version Code",Version3);
                      IF PBML3.FIND('-') THEN
                      BEGIN
                        REPEAT
                          Desc3:=PBML3.Description;
                          Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                Caliculate_Product_Shortage(PROD_NO);

                "Breaka":=FALSE;
                BOM_DUM[PROD_NO].SETFILTER(BOM_DUM[16]."Budget Quantity",'>%1',0);
                BOM_DUM[PROD_NO].SETFILTER(BOM_DUM[16]."Product Group Code",'<>%1','CPCB');
                IF BOM_DUM[PROD_NO].FIND('-') THEN
            end;
        }
        dataitem("<Integer17>";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(QTY_PROD_NO_;QTY[PROD_NO])
            {
            }
            column(BOM_PROD_NO_;BOM[PROD_NO])
            {
            }
            column(BOM_DUM_PROD_NO__Description;BOM_DUM[PROD_NO].Description)
            {
            }
            column(BOM_DUM_PROD_NO___Budget_Quantity_;BOM_DUM[PROD_NO]."Budget Quantity")
            {
            }
            column(BOM_DUM_PROD_NO___No__;BOM_DUM[PROD_NO]."No.")
            {
            }
            column(Quantity_At_Stores__Control1102154007;"Quantity At Stores")
            {
            }
            column(Shortage_ByConsidering_Previou_Control1102154008;Shortage_ByConsidering_Previou)
            {
            }
            column(BOM_DUM_PROD_NO___Standard_Cost_;BOM_DUM[PROD_NO]."Standard Cost")
            {
            }
            column(BOM_DUM_PROD_NO___Unit_Cost_;BOM_DUM[PROD_NO]."Unit Cost")
            {
            }
            column(BOM_DUM_PROD_NO___Budget_Quantity___Quantity_At_Stores_;BOM_DUM[PROD_NO]."Budget Quantity"-"Quantity At Stores")
            {
            }
            column(Required_ProductCaption_Control1102154328;Required_ProductCaption_Control1102154328Lbl)
            {
            }
            column(Requirerd_QuantityCaption_Control1102154330;Requirerd_QuantityCaption_Control1102154330Lbl)
            {
            }
            column(No_Caption_Control1102154331;No_Caption_Control1102154331Lbl)
            {
            }
            column(DescriptionCaption_Control1102154332;DescriptionCaption_Control1102154332Lbl)
            {
            }
            column(Required_QTYCaption_Control1102154333;Required_QTYCaption_Control1102154333Lbl)
            {
            }
            column(Qty_At_StoresCaption_Control1102154437;Qty_At_StoresCaption_Control1102154437Lbl)
            {
            }
            column(Overall_ShortageCaption_Control1102154438;Overall_ShortageCaption_Control1102154438Lbl)
            {
            }
            column(Qty__On_Purchase_OrderCaption_Control1102154439;Qty__On_Purchase_OrderCaption_Control1102154439Lbl)
            {
            }
            column(Qty__Under_InspectionCaption_Control1102154440;Qty__Under_InspectionCaption_Control1102154440Lbl)
            {
            }
            column(ShortageCaption_Control1102154441;ShortageCaption_Control1102154441Lbl)
            {
            }
            column(Integer17__Number;Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "Breaka" THEN
                CurrReport.BREAK ;

                IF BOM_DUM[PROD_NO].NEXT=0 THEN
                "Breaka":=TRUE;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[17]='' THEN
                CurrReport.BREAK;


                PROD_QTY:= QTY[17];
                PROD_NO:=17;

                CLEAR(BOM_DUM[PROD_NO]);
                BOM_DUM[PROD_NO].DELETEALL;


                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                 Excel1.Worksheets.Add;
                  Sheet17 := Excel1.ActiveSheet;

                  Sheet17.Name :=CONVERTSTR(BOM[17],'/',' ');;
                END;

                IF PBMH.GET(BOM[PROD_NO]) THEN
                Version1:=PBMH."Version Nos.";
                pbml.SETRANGE(pbml."Production BOM No.",BOM[PROD_NO]);
                pbml.SETRANGE(pbml."Version Code",Version1);
                IF pbml.FIND('-') THEN
                REPEAT
                  Desc1:=pbml.Description;
                  PBMH.RESET;
                  IF PBMH.GET(pbml."No.") THEN
                  Version2:=PBMH."Version Nos.";

                  PBML2.SETRANGE(PBML2."Production BOM No.",pbml."No.");
                  PBML2.SETRANGE(PBML2."Version Code",Version2);
                  IF PBML2.FIND('-') THEN
                  BEGIN
                    REPEAT

                      Desc2:=PBML2.Description;
                      PBMH.RESET;
                      IF PBMH.GET(PBML2."No.") THEN
                      Version3:=PBMH."Version Nos.";

                      PBML3.SETRANGE(PBML3."Production BOM No.",PBML2."No.");
                      PBML3.SETRANGE(PBML3."Version Code",Version3);
                      IF PBML3.FIND('-') THEN
                      BEGIN
                        REPEAT
                          Desc3:=PBML3.Description;
                          Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                Caliculate_Product_Shortage(PROD_NO);

                "Breaka":=FALSE;
                BOM_DUM[PROD_NO].SETFILTER(BOM_DUM[16]."Budget Quantity",'>%1',0);
                BOM_DUM[PROD_NO].SETFILTER(BOM_DUM[16]."Product Group Code",'<>%1','CPCB');
                IF BOM_DUM[PROD_NO].FIND('-') THEN
            end;
        }
        dataitem("<Integer18>";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(QTY_PROD_NO__Control1102154443;QTY[PROD_NO])
            {
            }
            column(BOM_PROD_NO__Control1102154445;BOM[PROD_NO])
            {
            }
            column(BOM_DUM_PROD_NO__Description_Control1102154012;BOM_DUM[PROD_NO].Description)
            {
            }
            column(BOM_DUM_PROD_NO___Budget_Quantity__Control1102154013;BOM_DUM[PROD_NO]."Budget Quantity")
            {
            }
            column(BOM_DUM_PROD_NO___No___Control1102154014;BOM_DUM[PROD_NO]."No.")
            {
            }
            column(Quantity_At_Stores__Control1102154015;"Quantity At Stores")
            {
            }
            column(Shortage_ByConsidering_Previou_Control1102154016;Shortage_ByConsidering_Previou)
            {
            }
            column(BOM_DUM_PROD_NO___Standard_Cost__Control1102154017;BOM_DUM[PROD_NO]."Standard Cost")
            {
            }
            column(BOM_DUM_PROD_NO___Unit_Cost__Control1102154018;BOM_DUM[PROD_NO]."Unit Cost")
            {
            }
            column(BOM_DUM_PROD_NO___Budget_Quantity___Quantity_At_Stores__Control1102154021;BOM_DUM[PROD_NO]."Budget Quantity"-"Quantity At Stores")
            {
            }
            column(Required_ProductCaption_Control1102154444;Required_ProductCaption_Control1102154444Lbl)
            {
            }
            column(Requirerd_QuantityCaption_Control1102154446;Requirerd_QuantityCaption_Control1102154446Lbl)
            {
            }
            column(No_Caption_Control1102154495;No_Caption_Control1102154495Lbl)
            {
            }
            column(DescriptionCaption_Control1102154496;DescriptionCaption_Control1102154496Lbl)
            {
            }
            column(Required_QTYCaption_Control1102154497;Required_QTYCaption_Control1102154497Lbl)
            {
            }
            column(Qty_At_StoresCaption_Control1102154499;Qty_At_StoresCaption_Control1102154499Lbl)
            {
            }
            column(Overall_ShortageCaption_Control1102154500;Overall_ShortageCaption_Control1102154500Lbl)
            {
            }
            column(Qty__On_Purchase_OrderCaption_Control1102154501;Qty__On_Purchase_OrderCaption_Control1102154501Lbl)
            {
            }
            column(Qty__Under_InspectionCaption_Control1102154502;Qty__Under_InspectionCaption_Control1102154502Lbl)
            {
            }
            column(ShortageCaption_Control1102154503;ShortageCaption_Control1102154503Lbl)
            {
            }
            column(Integer18__Number;Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "Breaka" THEN
                CurrReport.BREAK ;

                IF BOM_DUM[PROD_NO].NEXT=0 THEN
                "Breaka":=TRUE;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[18]='' THEN
                CurrReport.BREAK;


                PROD_QTY:= QTY[18];
                PROD_NO:=18;

                CLEAR(BOM_DUM[PROD_NO]);
                BOM_DUM[PROD_NO].DELETEALL;


                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                 Excel1.Worksheets.Add;
                  Sheet18 := Excel1.ActiveSheet;

                  Sheet18.Name :=CONVERTSTR(BOM[18],'/',' ');;
                END;

                IF PBMH.GET(BOM[PROD_NO]) THEN
                Version1:=PBMH."Version Nos.";
                pbml.SETRANGE(pbml."Production BOM No.",BOM[PROD_NO]);
                pbml.SETRANGE(pbml."Version Code",Version1);
                IF pbml.FIND('-') THEN
                REPEAT
                  Desc1:=pbml.Description;
                  PBMH.RESET;
                  IF PBMH.GET(pbml."No.") THEN
                  Version2:=PBMH."Version Nos.";

                  PBML2.SETRANGE(PBML2."Production BOM No.",pbml."No.");
                  PBML2.SETRANGE(PBML2."Version Code",Version2);
                  IF PBML2.FIND('-') THEN
                  BEGIN
                    REPEAT

                      Desc2:=PBML2.Description;
                      PBMH.RESET;
                      IF PBMH.GET(PBML2."No.") THEN
                      Version3:=PBMH."Version Nos.";

                      PBML3.SETRANGE(PBML3."Production BOM No.",PBML2."No.");
                      PBML3.SETRANGE(PBML3."Version Code",Version3);
                      IF PBML3.FIND('-') THEN
                      BEGIN
                        REPEAT
                          Desc3:=PBML3.Description;
                          Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                Caliculate_Product_Shortage(PROD_NO);

                "Breaka":=FALSE;
                BOM_DUM[PROD_NO].SETFILTER(BOM_DUM[16]."Budget Quantity",'>%1',0);
                BOM_DUM[PROD_NO].SETFILTER(BOM_DUM[16]."Product Group Code",'<>%1','CPCB');
                IF BOM_DUM[PROD_NO].FIND('-') THEN
            end;
        }
        dataitem("<Integer19>";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(QTY_PROD_NO__Control1102154448;QTY[PROD_NO])
            {
            }
            column(BOM_PROD_NO__Control1102154450;BOM[PROD_NO])
            {
            }
            column(BOM_DUM_PROD_NO__Description_Control1102154022;BOM_DUM[PROD_NO].Description)
            {
            }
            column(BOM_DUM_PROD_NO___Budget_Quantity__Control1102154104;BOM_DUM[PROD_NO]."Budget Quantity")
            {
            }
            column(BOM_DUM_PROD_NO___No___Control1102154105;BOM_DUM[PROD_NO]."No.")
            {
            }
            column(Quantity_At_Stores__Control1102154106;"Quantity At Stores")
            {
            }
            column(Shortage_ByConsidering_Previou_Control1102154107;Shortage_ByConsidering_Previou)
            {
            }
            column(BOM_DUM_PROD_NO___Standard_Cost__Control1102154108;BOM_DUM[PROD_NO]."Standard Cost")
            {
            }
            column(BOM_DUM_PROD_NO___Unit_Cost__Control1102154109;BOM_DUM[PROD_NO]."Unit Cost")
            {
            }
            column(BOM_DUM_PROD_NO___Budget_Quantity___Quantity_At_Stores__Control1102154110;BOM_DUM[PROD_NO]."Budget Quantity"-"Quantity At Stores")
            {
            }
            column(Required_ProductCaption_Control1102154449;Required_ProductCaption_Control1102154449Lbl)
            {
            }
            column(Requirerd_QuantityCaption_Control1102154451;Requirerd_QuantityCaption_Control1102154451Lbl)
            {
            }
            column(No_Caption_Control1102154504;No_Caption_Control1102154504Lbl)
            {
            }
            column(DescriptionCaption_Control1102154505;DescriptionCaption_Control1102154505Lbl)
            {
            }
            column(Required_QTYCaption_Control1102154506;Required_QTYCaption_Control1102154506Lbl)
            {
            }
            column(Qty_At_StoresCaption_Control1102154508;Qty_At_StoresCaption_Control1102154508Lbl)
            {
            }
            column(Overall_ShortageCaption_Control1102154509;Overall_ShortageCaption_Control1102154509Lbl)
            {
            }
            column(Qty__On_Purchase_OrderCaption_Control1102154510;Qty__On_Purchase_OrderCaption_Control1102154510Lbl)
            {
            }
            column(Qty__Under_InspectionCaption_Control1102154511;Qty__Under_InspectionCaption_Control1102154511Lbl)
            {
            }
            column(ShortageCaption_Control1102154512;ShortageCaption_Control1102154512Lbl)
            {
            }
            column(Integer19__Number;Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "Breaka" THEN
                CurrReport.BREAK ;

                IF BOM_DUM[PROD_NO].NEXT=0 THEN
                "Breaka":=TRUE;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[19]='' THEN
                CurrReport.BREAK;

                PROD_QTY:= QTY[19];
                PROD_NO:=19;

                CLEAR(BOM_DUM[PROD_NO]);
                BOM_DUM[PROD_NO].DELETEALL;


                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                 Excel1.Worksheets.Add;
                  Sheet19 := Excel1.ActiveSheet;

                  Sheet19.Name :=CONVERTSTR(BOM[19],'/',' ');;
                END;

                IF PBMH.GET(BOM[PROD_NO]) THEN
                Version1:=PBMH."Version Nos.";
                pbml.SETRANGE(pbml."Production BOM No.",BOM[PROD_NO]);
                pbml.SETRANGE(pbml."Version Code",Version1);
                IF pbml.FIND('-') THEN
                REPEAT
                  Desc1:=pbml.Description;
                  PBMH.RESET;
                  IF PBMH.GET(pbml."No.") THEN
                  Version2:=PBMH."Version Nos.";

                  PBML2.SETRANGE(PBML2."Production BOM No.",pbml."No.");
                  PBML2.SETRANGE(PBML2."Version Code",Version2);
                  IF PBML2.FIND('-') THEN
                  BEGIN
                    REPEAT

                      Desc2:=PBML2.Description;
                      PBMH.RESET;
                      IF PBMH.GET(PBML2."No.") THEN
                      Version3:=PBMH."Version Nos.";

                      PBML3.SETRANGE(PBML3."Production BOM No.",PBML2."No.");
                      PBML3.SETRANGE(PBML3."Version Code",Version3);
                      IF PBML3.FIND('-') THEN
                      BEGIN
                        REPEAT
                          Desc3:=PBML3.Description;
                          Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                Caliculate_Product_Shortage(PROD_NO);

                "Breaka":=FALSE;
                BOM_DUM[PROD_NO].SETFILTER(BOM_DUM[16]."Budget Quantity",'>%1',0);
                BOM_DUM[PROD_NO].SETFILTER(BOM_DUM[16]."Product Group Code",'<>%1','CPCB');
                IF BOM_DUM[PROD_NO].FIND('-') THEN
            end;
        }
        dataitem("<Integer20>";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(QTY_PROD_NO__Control1102154458;QTY[PROD_NO])
            {
            }
            column(BOM_PROD_NO__Control1102154460;BOM[PROD_NO])
            {
            }
            column(BOM_DUM_PROD_NO__Description_Control1102154111;BOM_DUM[PROD_NO].Description)
            {
            }
            column(BOM_DUM_PROD_NO___Budget_Quantity__Control1102154112;BOM_DUM[PROD_NO]."Budget Quantity")
            {
            }
            column(BOM_DUM_PROD_NO___No___Control1102154113;BOM_DUM[PROD_NO]."No.")
            {
            }
            column(Quantity_At_Stores__Control1102154114;"Quantity At Stores")
            {
            }
            column(Shortage_ByConsidering_Previou_Control1102154115;Shortage_ByConsidering_Previou)
            {
            }
            column(BOM_DUM_PROD_NO___Standard_Cost__Control1102154116;BOM_DUM[PROD_NO]."Standard Cost")
            {
            }
            column(BOM_DUM_PROD_NO___Unit_Cost__Control1102154117;BOM_DUM[PROD_NO]."Unit Cost")
            {
            }
            column(BOM_DUM_PROD_NO___Budget_Quantity___Quantity_At_Stores__Control1102154118;BOM_DUM[PROD_NO]."Budget Quantity"-"Quantity At Stores")
            {
            }
            column(Required_ProductCaption_Control1102154459;Required_ProductCaption_Control1102154459Lbl)
            {
            }
            column(Requirerd_QuantityCaption_Control1102154461;Requirerd_QuantityCaption_Control1102154461Lbl)
            {
            }
            column(No_Caption_Control1102154513;No_Caption_Control1102154513Lbl)
            {
            }
            column(DescriptionCaption_Control1102154514;DescriptionCaption_Control1102154514Lbl)
            {
            }
            column(Required_QTYCaption_Control1102154515;Required_QTYCaption_Control1102154515Lbl)
            {
            }
            column(Qty_At_StoresCaption_Control1102154517;Qty_At_StoresCaption_Control1102154517Lbl)
            {
            }
            column(Overall_ShortageCaption_Control1102154518;Overall_ShortageCaption_Control1102154518Lbl)
            {
            }
            column(Qty__On_Purchase_OrderCaption_Control1102154519;Qty__On_Purchase_OrderCaption_Control1102154519Lbl)
            {
            }
            column(Qty__Under_InspectionCaption_Control1102154520;Qty__Under_InspectionCaption_Control1102154520Lbl)
            {
            }
            column(ShortageCaption_Control1102154521;ShortageCaption_Control1102154521Lbl)
            {
            }
            column(Integer20__Number;Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "Breaka" THEN
                CurrReport.BREAK ;

                IF BOM_DUM[PROD_NO].NEXT=0 THEN
                "Breaka":=TRUE;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[20]='' THEN
                CurrReport.BREAK;

                PROD_QTY:= QTY[20];
                PROD_NO:=20;

                CLEAR(BOM_DUM[PROD_NO]);
                BOM_DUM[PROD_NO].DELETEALL;


                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                 Excel1.Worksheets.Add;
                  Sheet20 := Excel1.ActiveSheet;

                  Sheet20.Name :=CONVERTSTR(BOM[20],'/',' ');;
                END;

                IF PBMH.GET(BOM[PROD_NO]) THEN
                Version1:=PBMH."Version Nos.";
                pbml.SETRANGE(pbml."Production BOM No.",BOM[PROD_NO]);
                pbml.SETRANGE(pbml."Version Code",Version1);
                IF pbml.FIND('-') THEN
                REPEAT
                  Desc1:=pbml.Description;
                  PBMH.RESET;
                  IF PBMH.GET(pbml."No.") THEN
                  Version2:=PBMH."Version Nos.";

                  PBML2.SETRANGE(PBML2."Production BOM No.",pbml."No.");
                  PBML2.SETRANGE(PBML2."Version Code",Version2);
                  IF PBML2.FIND('-') THEN
                  BEGIN
                    REPEAT

                      Desc2:=PBML2.Description;
                      PBMH.RESET;
                      IF PBMH.GET(PBML2."No.") THEN
                      Version3:=PBMH."Version Nos.";

                      PBML3.SETRANGE(PBML3."Production BOM No.",PBML2."No.");
                      PBML3.SETRANGE(PBML3."Version Code",Version3);
                      IF PBML3.FIND('-') THEN
                      BEGIN
                        REPEAT
                          Desc3:=PBML3.Description;
                          Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                Caliculate_Product_Shortage(PROD_NO);

                "Breaka":=FALSE;
                BOM_DUM[PROD_NO].SETFILTER(BOM_DUM[16]."Budget Quantity",'>%1',0);
                BOM_DUM[PROD_NO].SETFILTER(BOM_DUM[16]."Product Group Code",'<>%1','CPCB');
                IF BOM_DUM[PROD_NO].FIND('-') THEN
            end;
        }
        dataitem("<Integer21>";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(QTY_PROD_NO__Control1102154468;QTY[PROD_NO])
            {
            }
            column(BOM_PROD_NO__Control1102154470;BOM[PROD_NO])
            {
            }
            column(BOM_DUM_PROD_NO__Description_Control1102154119;BOM_DUM[PROD_NO].Description)
            {
            }
            column(BOM_DUM_PROD_NO___Budget_Quantity__Control1102154120;BOM_DUM[PROD_NO]."Budget Quantity")
            {
            }
            column(BOM_DUM_PROD_NO___No___Control1102154121;BOM_DUM[PROD_NO]."No.")
            {
            }
            column(Quantity_At_Stores__Control1102154122;"Quantity At Stores")
            {
            }
            column(Shortage_ByConsidering_Previou_Control1102154123;Shortage_ByConsidering_Previou)
            {
            }
            column(BOM_DUM_PROD_NO___Standard_Cost__Control1102154124;BOM_DUM[PROD_NO]."Standard Cost")
            {
            }
            column(BOM_DUM_PROD_NO___Unit_Cost__Control1102154125;BOM_DUM[PROD_NO]."Unit Cost")
            {
            }
            column(BOM_DUM_PROD_NO___Budget_Quantity___Quantity_At_Stores__Control1102154126;BOM_DUM[PROD_NO]."Budget Quantity"-"Quantity At Stores")
            {
            }
            column(Required_ProductCaption_Control1102154469;Required_ProductCaption_Control1102154469Lbl)
            {
            }
            column(Requirerd_QuantityCaption_Control1102154471;Requirerd_QuantityCaption_Control1102154471Lbl)
            {
            }
            column(No_Caption_Control1102154522;No_Caption_Control1102154522Lbl)
            {
            }
            column(DescriptionCaption_Control1102154523;DescriptionCaption_Control1102154523Lbl)
            {
            }
            column(Required_QTYCaption_Control1102154524;Required_QTYCaption_Control1102154524Lbl)
            {
            }
            column(Qty_At_StoresCaption_Control1102154526;Qty_At_StoresCaption_Control1102154526Lbl)
            {
            }
            column(Overall_ShortageCaption_Control1102154527;Overall_ShortageCaption_Control1102154527Lbl)
            {
            }
            column(Qty__On_Purchase_OrderCaption_Control1102154528;Qty__On_Purchase_OrderCaption_Control1102154528Lbl)
            {
            }
            column(Qty__Under_InspectionCaption_Control1102154529;Qty__Under_InspectionCaption_Control1102154529Lbl)
            {
            }
            column(ShortageCaption_Control1102154530;ShortageCaption_Control1102154530Lbl)
            {
            }
            column(Integer21__Number;Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "Breaka" THEN
                CurrReport.BREAK ;

                IF BOM_DUM[PROD_NO].NEXT=0 THEN
                "Breaka":=TRUE;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[21]='' THEN
                CurrReport.BREAK;

                PROD_QTY:= QTY[21];
                PROD_NO:=21;

                CLEAR(BOM_DUM[PROD_NO]);
                BOM_DUM[PROD_NO].DELETEALL;


                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                 Excel1.Worksheets.Add;
                  Sheet21 := Excel1.ActiveSheet;

                  Sheet21.Name :=CONVERTSTR(BOM[21],'/',' ');;
                END;

                IF PBMH.GET(BOM[PROD_NO]) THEN
                Version1:=PBMH."Version Nos.";
                pbml.SETRANGE(pbml."Production BOM No.",BOM[PROD_NO]);
                pbml.SETRANGE(pbml."Version Code",Version1);
                IF pbml.FIND('-') THEN
                REPEAT
                  Desc1:=pbml.Description;
                  PBMH.RESET;
                  IF PBMH.GET(pbml."No.") THEN
                  Version2:=PBMH."Version Nos.";

                  PBML2.SETRANGE(PBML2."Production BOM No.",pbml."No.");
                  PBML2.SETRANGE(PBML2."Version Code",Version2);
                  IF PBML2.FIND('-') THEN
                  BEGIN
                    REPEAT

                      Desc2:=PBML2.Description;
                      PBMH.RESET;
                      IF PBMH.GET(PBML2."No.") THEN
                      Version3:=PBMH."Version Nos.";

                      PBML3.SETRANGE(PBML3."Production BOM No.",PBML2."No.");
                      PBML3.SETRANGE(PBML3."Version Code",Version3);
                      IF PBML3.FIND('-') THEN
                      BEGIN
                        REPEAT
                          Desc3:=PBML3.Description;
                          Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                Caliculate_Product_Shortage(PROD_NO);

                "Breaka":=FALSE;
                BOM_DUM[PROD_NO].SETFILTER(BOM_DUM[16]."Budget Quantity",'>%1',0);
                BOM_DUM[PROD_NO].SETFILTER(BOM_DUM[16]."Product Group Code",'<>%1','CPCB');
                IF BOM_DUM[PROD_NO].FIND('-') THEN
            end;
        }
        dataitem("<Integer22>";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(QTY_PROD_NO__Control1102154473;QTY[PROD_NO])
            {
            }
            column(BOM_PROD_NO__Control1102154475;BOM[PROD_NO])
            {
            }
            column(BOM_DUM_PROD_NO__Description_Control1102154127;BOM_DUM[PROD_NO].Description)
            {
            }
            column(BOM_DUM_PROD_NO___Budget_Quantity__Control1102154128;BOM_DUM[PROD_NO]."Budget Quantity")
            {
            }
            column(BOM_DUM_PROD_NO___No___Control1102154129;BOM_DUM[PROD_NO]."No.")
            {
            }
            column(Quantity_At_Stores__Control1102154130;"Quantity At Stores")
            {
            }
            column(Shortage_ByConsidering_Previou_Control1102154131;Shortage_ByConsidering_Previou)
            {
            }
            column(BOM_DUM_PROD_NO___Standard_Cost__Control1102154132;BOM_DUM[PROD_NO]."Standard Cost")
            {
            }
            column(BOM_DUM_PROD_NO___Unit_Cost__Control1102154133;BOM_DUM[PROD_NO]."Unit Cost")
            {
            }
            column(BOM_DUM_PROD_NO___Budget_Quantity___Quantity_At_Stores__Control1102154134;BOM_DUM[PROD_NO]."Budget Quantity"-"Quantity At Stores")
            {
            }
            column(Required_ProductCaption_Control1102154474;Required_ProductCaption_Control1102154474Lbl)
            {
            }
            column(Requirerd_QuantityCaption_Control1102154476;Requirerd_QuantityCaption_Control1102154476Lbl)
            {
            }
            column(No_Caption_Control1102154531;No_Caption_Control1102154531Lbl)
            {
            }
            column(DescriptionCaption_Control1102154532;DescriptionCaption_Control1102154532Lbl)
            {
            }
            column(Required_QTYCaption_Control1102154533;Required_QTYCaption_Control1102154533Lbl)
            {
            }
            column(Qty_At_StoresCaption_Control1102154535;Qty_At_StoresCaption_Control1102154535Lbl)
            {
            }
            column(Overall_ShortageCaption_Control1102154536;Overall_ShortageCaption_Control1102154536Lbl)
            {
            }
            column(Qty__On_Purchase_OrderCaption_Control1102154537;Qty__On_Purchase_OrderCaption_Control1102154537Lbl)
            {
            }
            column(Qty__Under_InspectionCaption_Control1102154538;Qty__Under_InspectionCaption_Control1102154538Lbl)
            {
            }
            column(ShortageCaption_Control1102154539;ShortageCaption_Control1102154539Lbl)
            {
            }
            column(Integer22__Number;Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "Breaka" THEN
                CurrReport.BREAK ;

                IF BOM_DUM[PROD_NO].NEXT=0 THEN
                "Breaka":=TRUE;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[22]='' THEN
                CurrReport.BREAK;

                PROD_QTY:= QTY[22];
                PROD_NO:=22;

                CLEAR(BOM_DUM[PROD_NO]);
                BOM_DUM[PROD_NO].DELETEALL;


                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                 Excel1.Worksheets.Add;
                  Sheet22 := Excel1.ActiveSheet;

                  Sheet22.Name :=CONVERTSTR(BOM[22],'/',' ');;
                END;

                IF PBMH.GET(BOM[PROD_NO]) THEN
                Version1:=PBMH."Version Nos.";
                pbml.SETRANGE(pbml."Production BOM No.",BOM[PROD_NO]);
                pbml.SETRANGE(pbml."Version Code",Version1);
                IF pbml.FIND('-') THEN
                REPEAT
                  Desc1:=pbml.Description;
                  PBMH.RESET;
                  IF PBMH.GET(pbml."No.") THEN
                  Version2:=PBMH."Version Nos.";

                  PBML2.SETRANGE(PBML2."Production BOM No.",pbml."No.");
                  PBML2.SETRANGE(PBML2."Version Code",Version2);
                  IF PBML2.FIND('-') THEN
                  BEGIN
                    REPEAT

                      Desc2:=PBML2.Description;
                      PBMH.RESET;
                      IF PBMH.GET(PBML2."No.") THEN
                      Version3:=PBMH."Version Nos.";

                      PBML3.SETRANGE(PBML3."Production BOM No.",PBML2."No.");
                      PBML3.SETRANGE(PBML3."Version Code",Version3);
                      IF PBML3.FIND('-') THEN
                      BEGIN
                        REPEAT
                          Desc3:=PBML3.Description;
                          Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                Caliculate_Product_Shortage(PROD_NO);

                "Breaka":=FALSE;
                BOM_DUM[PROD_NO].SETFILTER(BOM_DUM[16]."Budget Quantity",'>%1',0);
                BOM_DUM[PROD_NO].SETFILTER(BOM_DUM[16]."Product Group Code",'<>%1','CPCB');
                IF BOM_DUM[PROD_NO].FIND('-') THEN
            end;
        }
        dataitem("<Integer23>";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(QTY_PROD_NO__Control1102154478;QTY[PROD_NO])
            {
            }
            column(BOM_PROD_NO__Control1102154480;BOM[PROD_NO])
            {
            }
            column(BOM_DUM_PROD_NO__Description_Control1102154135;BOM_DUM[PROD_NO].Description)
            {
            }
            column(BOM_DUM_PROD_NO___Budget_Quantity__Control1102154136;BOM_DUM[PROD_NO]."Budget Quantity")
            {
            }
            column(BOM_DUM_PROD_NO___No___Control1102154137;BOM_DUM[PROD_NO]."No.")
            {
            }
            column(Quantity_At_Stores__Control1102154138;"Quantity At Stores")
            {
            }
            column(Shortage_ByConsidering_Previou_Control1102154139;Shortage_ByConsidering_Previou)
            {
            }
            column(BOM_DUM_PROD_NO___Standard_Cost__Control1102154140;BOM_DUM[PROD_NO]."Standard Cost")
            {
            }
            column(BOM_DUM_PROD_NO___Unit_Cost__Control1102154141;BOM_DUM[PROD_NO]."Unit Cost")
            {
            }
            column(BOM_DUM_PROD_NO___Budget_Quantity___Quantity_At_Stores__Control1102154142;BOM_DUM[PROD_NO]."Budget Quantity"-"Quantity At Stores")
            {
            }
            column(Required_ProductCaption_Control1102154479;Required_ProductCaption_Control1102154479Lbl)
            {
            }
            column(Requirerd_QuantityCaption_Control1102154481;Requirerd_QuantityCaption_Control1102154481Lbl)
            {
            }
            column(No_Caption_Control1102154540;No_Caption_Control1102154540Lbl)
            {
            }
            column(DescriptionCaption_Control1102154541;DescriptionCaption_Control1102154541Lbl)
            {
            }
            column(Required_QTYCaption_Control1102154542;Required_QTYCaption_Control1102154542Lbl)
            {
            }
            column(Qty_At_StoresCaption_Control1102154544;Qty_At_StoresCaption_Control1102154544Lbl)
            {
            }
            column(Overall_ShortageCaption_Control1102154545;Overall_ShortageCaption_Control1102154545Lbl)
            {
            }
            column(Qty__On_Purchase_OrderCaption_Control1102154546;Qty__On_Purchase_OrderCaption_Control1102154546Lbl)
            {
            }
            column(Qty__Under_InspectionCaption_Control1102154547;Qty__Under_InspectionCaption_Control1102154547Lbl)
            {
            }
            column(ShortageCaption_Control1102154548;ShortageCaption_Control1102154548Lbl)
            {
            }
            column(Integer23__Number;Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "Breaka" THEN
                CurrReport.BREAK ;

                IF BOM_DUM[PROD_NO].NEXT=0 THEN
                "Breaka":=TRUE;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[23]='' THEN
                CurrReport.BREAK;

                PROD_QTY:= QTY[23];
                PROD_NO:=23;

                CLEAR(BOM_DUM[PROD_NO]);
                BOM_DUM[PROD_NO].DELETEALL;


                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                 Excel1.Worksheets.Add;
                  Sheet23 := Excel1.ActiveSheet;

                  Sheet23.Name :=CONVERTSTR(BOM[23],'/',' ');
                END;

                IF PBMH.GET(BOM[PROD_NO]) THEN
                Version1:=PBMH."Version Nos.";
                pbml.SETRANGE(pbml."Production BOM No.",BOM[PROD_NO]);
                pbml.SETRANGE(pbml."Version Code",Version1);
                IF pbml.FIND('-') THEN
                REPEAT
                  Desc1:=pbml.Description;
                  PBMH.RESET;
                  IF PBMH.GET(pbml."No.") THEN
                  Version2:=PBMH."Version Nos.";

                  PBML2.SETRANGE(PBML2."Production BOM No.",pbml."No.");
                  PBML2.SETRANGE(PBML2."Version Code",Version2);
                  IF PBML2.FIND('-') THEN
                  BEGIN
                    REPEAT

                      Desc2:=PBML2.Description;
                      PBMH.RESET;
                      IF PBMH.GET(PBML2."No.") THEN
                      Version3:=PBMH."Version Nos.";

                      PBML3.SETRANGE(PBML3."Production BOM No.",PBML2."No.");
                      PBML3.SETRANGE(PBML3."Version Code",Version3);
                      IF PBML3.FIND('-') THEN
                      BEGIN
                        REPEAT
                          Desc3:=PBML3.Description;
                          Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                Caliculate_Product_Shortage(PROD_NO);

                "Breaka":=FALSE;
                BOM_DUM[PROD_NO].SETFILTER(BOM_DUM[16]."Budget Quantity",'>%1',0);
                BOM_DUM[PROD_NO].SETFILTER(BOM_DUM[16]."Product Group Code",'<>%1','CPCB');
                IF BOM_DUM[PROD_NO].FIND('-') THEN
            end;
        }
        dataitem("<Integer24>";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(QTY_PROD_NO__Control1102154483;QTY[PROD_NO])
            {
            }
            column(BOM_PROD_NO__Control1102154485;BOM[PROD_NO])
            {
            }
            column(BOM_DUM_PROD_NO__Description_Control1102154143;BOM_DUM[PROD_NO].Description)
            {
            }
            column(BOM_DUM_PROD_NO___Budget_Quantity__Control1102154319;BOM_DUM[PROD_NO]."Budget Quantity")
            {
            }
            column(BOM_DUM_PROD_NO___No___Control1102154320;BOM_DUM[PROD_NO]."No.")
            {
            }
            column(Quantity_At_Stores__Control1102154321;"Quantity At Stores")
            {
            }
            column(Shortage_ByConsidering_Previou_Control1102154322;Shortage_ByConsidering_Previou)
            {
            }
            column(BOM_DUM_PROD_NO___Standard_Cost__Control1102154323;BOM_DUM[PROD_NO]."Standard Cost")
            {
            }
            column(BOM_DUM_PROD_NO___Unit_Cost__Control1102154324;BOM_DUM[PROD_NO]."Unit Cost")
            {
            }
            column(BOM_DUM_PROD_NO___Budget_Quantity___Quantity_At_Stores__Control1102154325;BOM_DUM[PROD_NO]."Budget Quantity"-"Quantity At Stores")
            {
            }
            column(Required_ProductCaption_Control1102154484;Required_ProductCaption_Control1102154484Lbl)
            {
            }
            column(Requirerd_QuantityCaption_Control1102154486;Requirerd_QuantityCaption_Control1102154486Lbl)
            {
            }
            column(No_Caption_Control1102154549;No_Caption_Control1102154549Lbl)
            {
            }
            column(DescriptionCaption_Control1102154550;DescriptionCaption_Control1102154550Lbl)
            {
            }
            column(Required_QTYCaption_Control1102154551;Required_QTYCaption_Control1102154551Lbl)
            {
            }
            column(Qty_At_StoresCaption_Control1102154553;Qty_At_StoresCaption_Control1102154553Lbl)
            {
            }
            column(Overall_ShortageCaption_Control1102154554;Overall_ShortageCaption_Control1102154554Lbl)
            {
            }
            column(Qty__On_Purchase_OrderCaption_Control1102154555;Qty__On_Purchase_OrderCaption_Control1102154555Lbl)
            {
            }
            column(Qty__Under_InspectionCaption_Control1102154556;Qty__Under_InspectionCaption_Control1102154556Lbl)
            {
            }
            column(ShortageCaption_Control1102154557;ShortageCaption_Control1102154557Lbl)
            {
            }
            column(Integer24__Number;Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "Breaka" THEN
                CurrReport.BREAK ;

                IF BOM_DUM[PROD_NO].NEXT=0 THEN
                "Breaka":=TRUE;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[24]='' THEN
                CurrReport.BREAK;

                PROD_QTY:= QTY[24];
                PROD_NO:=24;

                CLEAR(BOM_DUM[PROD_NO]);
                BOM_DUM[PROD_NO].DELETEALL;


                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                 Excel1.Worksheets.Add;
                  Sheet24 := Excel1.ActiveSheet;

                  Sheet24.Name :=CONVERTSTR(BOM[24],'/',' ');;
                END;

                IF PBMH.GET(BOM[PROD_NO]) THEN
                Version1:=PBMH."Version Nos.";
                pbml.SETRANGE(pbml."Production BOM No.",BOM[PROD_NO]);
                pbml.SETRANGE(pbml."Version Code",Version1);
                IF pbml.FIND('-') THEN
                REPEAT
                  Desc1:=pbml.Description;
                  PBMH.RESET;
                  IF PBMH.GET(pbml."No.") THEN
                  Version2:=PBMH."Version Nos.";

                  PBML2.SETRANGE(PBML2."Production BOM No.",pbml."No.");
                  PBML2.SETRANGE(PBML2."Version Code",Version2);
                  IF PBML2.FIND('-') THEN
                  BEGIN
                    REPEAT

                      Desc2:=PBML2.Description;
                      PBMH.RESET;
                      IF PBMH.GET(PBML2."No.") THEN
                      Version3:=PBMH."Version Nos.";

                      PBML3.SETRANGE(PBML3."Production BOM No.",PBML2."No.");
                      PBML3.SETRANGE(PBML3."Version Code",Version3);
                      IF PBML3.FIND('-') THEN
                      BEGIN
                        REPEAT
                          Desc3:=PBML3.Description;
                          Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                Caliculate_Product_Shortage(PROD_NO);

                "Breaka":=FALSE;
                BOM_DUM[PROD_NO].SETFILTER(BOM_DUM[16]."Budget Quantity",'>%1',0);
                BOM_DUM[PROD_NO].SETFILTER(BOM_DUM[16]."Product Group Code",'<>%1','CPCB');
                IF BOM_DUM[PROD_NO].FIND('-') THEN
            end;
        }
        dataitem("<Integer25>";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(QTY_PROD_NO__Control1102154453;QTY[PROD_NO])
            {
            }
            column(BOM_PROD_NO__Control1102154455;BOM[PROD_NO])
            {
            }
            column(BOM_DUM_PROD_NO__Description_Control1102154568;BOM_DUM[PROD_NO].Description)
            {
            }
            column(BOM_DUM_PROD_NO___Budget_Quantity__Control1102154569;BOM_DUM[PROD_NO]."Budget Quantity")
            {
            }
            column(BOM_DUM_PROD_NO___No___Control1102154570;BOM_DUM[PROD_NO]."No.")
            {
            }
            column(Quantity_At_Stores__Control1102154571;"Quantity At Stores")
            {
            }
            column(Shortage_ByConsidering_Previou_Control1102154572;Shortage_ByConsidering_Previou)
            {
            }
            column(BOM_DUM_PROD_NO___Standard_Cost__Control1102154573;BOM_DUM[PROD_NO]."Standard Cost")
            {
            }
            column(BOM_DUM_PROD_NO___Unit_Cost__Control1102154574;BOM_DUM[PROD_NO]."Unit Cost")
            {
            }
            column(BOM_DUM_PROD_NO___Budget_Quantity___Quantity_At_Stores__Control1102154575;BOM_DUM[PROD_NO]."Budget Quantity"-"Quantity At Stores")
            {
            }
            column(Required_ProductCaption_Control1102154454;Required_ProductCaption_Control1102154454Lbl)
            {
            }
            column(Requirerd_QuantityCaption_Control1102154456;Requirerd_QuantityCaption_Control1102154456Lbl)
            {
            }
            column(No_Caption_Control1102154487;No_Caption_Control1102154487Lbl)
            {
            }
            column(DescriptionCaption_Control1102154488;DescriptionCaption_Control1102154488Lbl)
            {
            }
            column(Required_QTYCaption_Control1102154489;Required_QTYCaption_Control1102154489Lbl)
            {
            }
            column(Qty_At_StoresCaption_Control1102154491;Qty_At_StoresCaption_Control1102154491Lbl)
            {
            }
            column(Overall_ShortageCaption_Control1102154492;Overall_ShortageCaption_Control1102154492Lbl)
            {
            }
            column(Qty__On_Purchase_OrderCaption_Control1102154493;Qty__On_Purchase_OrderCaption_Control1102154493Lbl)
            {
            }
            column(Qty__Under_InspectionCaption_Control1102154494;Qty__Under_InspectionCaption_Control1102154494Lbl)
            {
            }
            column(ShortageCaption_Control1102154558;ShortageCaption_Control1102154558Lbl)
            {
            }
            column(Integer25__Number;Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "Breaka" THEN
                CurrReport.BREAK ;

                IF BOM_DUM[PROD_NO].NEXT=0 THEN
                "Breaka":=TRUE;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[25]='' THEN
                CurrReport.BREAK;

                PROD_QTY:= QTY[25];
                PROD_NO:=25;

                CLEAR(BOM_DUM[PROD_NO]);
                BOM_DUM[PROD_NO].DELETEALL;


                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                 Excel1.Worksheets.Add;
                  Sheet25 := Excel1.ActiveSheet;

                  Sheet25.Name :=CONVERTSTR(BOM[25],'/',' ');;
                END;

                IF PBMH.GET(BOM[PROD_NO]) THEN
                Version1:=PBMH."Version Nos.";
                pbml.SETRANGE(pbml."Production BOM No.",BOM[PROD_NO]);
                pbml.SETRANGE(pbml."Version Code",Version1);
                IF pbml.FIND('-') THEN
                REPEAT
                  Desc1:=pbml.Description;
                  PBMH.RESET;
                  IF PBMH.GET(pbml."No.") THEN
                  Version2:=PBMH."Version Nos.";

                  PBML2.SETRANGE(PBML2."Production BOM No.",pbml."No.");
                  PBML2.SETRANGE(PBML2."Version Code",Version2);
                  IF PBML2.FIND('-') THEN
                  BEGIN
                    REPEAT

                      Desc2:=PBML2.Description;
                      PBMH.RESET;
                      IF PBMH.GET(PBML2."No.") THEN
                      Version3:=PBMH."Version Nos.";

                      PBML3.SETRANGE(PBML3."Production BOM No.",PBML2."No.");
                      PBML3.SETRANGE(PBML3."Version Code",Version3);
                      IF PBML3.FIND('-') THEN
                      BEGIN
                        REPEAT
                          Desc3:=PBML3.Description;
                          Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                Caliculate_Product_Shortage(PROD_NO);

                "Breaka":=FALSE;
                BOM_DUM[PROD_NO].SETFILTER(BOM_DUM[16]."Budget Quantity",'>%1',0);
                BOM_DUM[PROD_NO].SETFILTER(BOM_DUM[16]."Product Group Code",'<>%1','CPCB');
                IF BOM_DUM[PROD_NO].FIND('-') THEN
            end;
        }
        dataitem("<Integer26>";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(QTY_PROD_NO__Control1102154463;QTY[PROD_NO])
            {
            }
            column(BOM_PROD_NO__Control1102154465;BOM[PROD_NO])
            {
            }
            column(BOM_DUM_PROD_NO__Description_Control1102154576;BOM_DUM[PROD_NO].Description)
            {
            }
            column(BOM_DUM_PROD_NO___Budget_Quantity__Control1102154577;BOM_DUM[PROD_NO]."Budget Quantity")
            {
            }
            column(BOM_DUM_PROD_NO___No___Control1102154578;BOM_DUM[PROD_NO]."No.")
            {
            }
            column(Quantity_At_Stores__Control1102154579;"Quantity At Stores")
            {
            }
            column(Shortage_ByConsidering_Previou_Control1102154580;Shortage_ByConsidering_Previou)
            {
            }
            column(BOM_DUM_PROD_NO___Standard_Cost__Control1102154581;BOM_DUM[PROD_NO]."Standard Cost")
            {
            }
            column(BOM_DUM_PROD_NO___Unit_Cost__Control1102154582;BOM_DUM[PROD_NO]."Unit Cost")
            {
            }
            column(BOM_DUM_PROD_NO___Budget_Quantity___Quantity_At_Stores__Control1102154583;BOM_DUM[PROD_NO]."Budget Quantity"-"Quantity At Stores")
            {
            }
            column(Required_ProductCaption_Control1102154464;Required_ProductCaption_Control1102154464Lbl)
            {
            }
            column(Requirerd_QuantityCaption_Control1102154466;Requirerd_QuantityCaption_Control1102154466Lbl)
            {
            }
            column(No_Caption_Control1102154611;No_Caption_Control1102154611Lbl)
            {
            }
            column(DescriptionCaption_Control1102154612;DescriptionCaption_Control1102154612Lbl)
            {
            }
            column(Required_QTYCaption_Control1102154613;Required_QTYCaption_Control1102154613Lbl)
            {
            }
            column(Qty_At_StoresCaption_Control1102154615;Qty_At_StoresCaption_Control1102154615Lbl)
            {
            }
            column(Overall_ShortageCaption_Control1102154616;Overall_ShortageCaption_Control1102154616Lbl)
            {
            }
            column(Qty__On_Purchase_OrderCaption_Control1102154617;Qty__On_Purchase_OrderCaption_Control1102154617Lbl)
            {
            }
            column(Qty__Under_InspectionCaption_Control1102154618;Qty__Under_InspectionCaption_Control1102154618Lbl)
            {
            }
            column(ShortageCaption_Control1102154619;ShortageCaption_Control1102154619Lbl)
            {
            }
            column(Integer26__Number;Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "Breaka" THEN
                CurrReport.BREAK ;

                IF BOM_DUM[PROD_NO].NEXT=0 THEN
                "Breaka":=TRUE;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[26]='' THEN
                CurrReport.BREAK;

                PROD_QTY:= QTY[26];
                PROD_NO:=26;

                CLEAR(BOM_DUM[PROD_NO]);
                BOM_DUM[PROD_NO].DELETEALL;


                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                 Excel1.Worksheets.Add;
                  Sheet26 := Excel1.ActiveSheet;

                  Sheet26.Name :=CONVERTSTR(BOM[26],'/',' ');;
                END;

                IF PBMH.GET(BOM[PROD_NO]) THEN
                Version1:=PBMH."Version Nos.";
                pbml.SETRANGE(pbml."Production BOM No.",BOM[PROD_NO]);
                pbml.SETRANGE(pbml."Version Code",Version1);
                IF pbml.FIND('-') THEN
                REPEAT
                  Desc1:=pbml.Description;
                  PBMH.RESET;
                  IF PBMH.GET(pbml."No.") THEN
                  Version2:=PBMH."Version Nos.";

                  PBML2.SETRANGE(PBML2."Production BOM No.",pbml."No.");
                  PBML2.SETRANGE(PBML2."Version Code",Version2);
                  IF PBML2.FIND('-') THEN
                  BEGIN
                    REPEAT

                      Desc2:=PBML2.Description;
                      PBMH.RESET;
                      IF PBMH.GET(PBML2."No.") THEN
                      Version3:=PBMH."Version Nos.";

                      PBML3.SETRANGE(PBML3."Production BOM No.",PBML2."No.");
                      PBML3.SETRANGE(PBML3."Version Code",Version3);
                      IF PBML3.FIND('-') THEN
                      BEGIN
                        REPEAT
                          Desc3:=PBML3.Description;
                          Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                Caliculate_Product_Shortage(PROD_NO);

                "Breaka":=FALSE;
                BOM_DUM[PROD_NO].SETFILTER(BOM_DUM[16]."Budget Quantity",'>%1',0);
                BOM_DUM[PROD_NO].SETFILTER(BOM_DUM[16]."Product Group Code",'<>%1','CPCB');
                IF BOM_DUM[PROD_NO].FIND('-') THEN
            end;
        }
        dataitem("<Integer27>";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(QTY_PROD_NO__Control1102154630;QTY[PROD_NO])
            {
            }
            column(BOM_PROD_NO__Control1102154632;BOM[PROD_NO])
            {
            }
            column(BOM_DUM_PROD_NO__Description_Control1102154643;BOM_DUM[PROD_NO].Description)
            {
            }
            column(BOM_DUM_PROD_NO___Budget_Quantity__Control1102154644;BOM_DUM[PROD_NO]."Budget Quantity")
            {
            }
            column(BOM_DUM_PROD_NO___No___Control1102154645;BOM_DUM[PROD_NO]."No.")
            {
            }
            column(Quantity_At_Stores__Control1102154646;"Quantity At Stores")
            {
            }
            column(Shortage_ByConsidering_Previou_Control1102154647;Shortage_ByConsidering_Previou)
            {
            }
            column(BOM_DUM_PROD_NO___Standard_Cost__Control1102154648;BOM_DUM[PROD_NO]."Standard Cost")
            {
            }
            column(BOM_DUM_PROD_NO___Unit_Cost__Control1102154649;BOM_DUM[PROD_NO]."Unit Cost")
            {
            }
            column(BOM_DUM_PROD_NO___Budget_Quantity___Quantity_At_Stores__Control1102154650;BOM_DUM[PROD_NO]."Budget Quantity"-"Quantity At Stores")
            {
            }
            column(Required_ProductCaption_Control1102154631;Required_ProductCaption_Control1102154631Lbl)
            {
            }
            column(Requirerd_QuantityCaption_Control1102154633;Requirerd_QuantityCaption_Control1102154633Lbl)
            {
            }
            column(No_Caption_Control1102154634;No_Caption_Control1102154634Lbl)
            {
            }
            column(DescriptionCaption_Control1102154635;DescriptionCaption_Control1102154635Lbl)
            {
            }
            column(Required_QTYCaption_Control1102154636;Required_QTYCaption_Control1102154636Lbl)
            {
            }
            column(Qty_At_StoresCaption_Control1102154638;Qty_At_StoresCaption_Control1102154638Lbl)
            {
            }
            column(Overall_ShortageCaption_Control1102154639;Overall_ShortageCaption_Control1102154639Lbl)
            {
            }
            column(Qty__On_Purchase_OrderCaption_Control1102154640;Qty__On_Purchase_OrderCaption_Control1102154640Lbl)
            {
            }
            column(Qty__Under_InspectionCaption_Control1102154641;Qty__Under_InspectionCaption_Control1102154641Lbl)
            {
            }
            column(ShortageCaption_Control1102154642;ShortageCaption_Control1102154642Lbl)
            {
            }
            column(Integer27__Number;Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "Breaka" THEN
                CurrReport.BREAK ;

                IF BOM_DUM[PROD_NO].NEXT=0 THEN
                "Breaka":=TRUE;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[27]='' THEN
                CurrReport.BREAK;

                PROD_QTY:= QTY[27];
                PROD_NO:=27;

                CLEAR(BOM_DUM[PROD_NO]);
                BOM_DUM[PROD_NO].DELETEALL;


                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                 Excel1.Worksheets.Add;
                  Sheet27 := Excel1.ActiveSheet;

                  Sheet27.Name :=CONVERTSTR(BOM[27],'/',' ');;
                END;

                IF PBMH.GET(BOM[PROD_NO]) THEN
                Version1:=PBMH."Version Nos.";
                pbml.SETRANGE(pbml."Production BOM No.",BOM[PROD_NO]);
                pbml.SETRANGE(pbml."Version Code",Version1);
                IF pbml.FIND('-') THEN
                REPEAT
                  Desc1:=pbml.Description;
                  PBMH.RESET;
                  IF PBMH.GET(pbml."No.") THEN
                  Version2:=PBMH."Version Nos.";

                  PBML2.SETRANGE(PBML2."Production BOM No.",pbml."No.");
                  PBML2.SETRANGE(PBML2."Version Code",Version2);
                  IF PBML2.FIND('-') THEN
                  BEGIN
                    REPEAT

                      Desc2:=PBML2.Description;
                      PBMH.RESET;
                      IF PBMH.GET(PBML2."No.") THEN
                      Version3:=PBMH."Version Nos.";

                      PBML3.SETRANGE(PBML3."Production BOM No.",PBML2."No.");
                      PBML3.SETRANGE(PBML3."Version Code",Version3);
                      IF PBML3.FIND('-') THEN
                      BEGIN
                        REPEAT
                          Desc3:=PBML3.Description;
                          Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                Caliculate_Product_Shortage(PROD_NO);

                "Breaka":=FALSE;
                BOM_DUM[PROD_NO].SETFILTER(BOM_DUM[16]."Budget Quantity",'>%1',0);
                BOM_DUM[PROD_NO].SETFILTER(BOM_DUM[16]."Product Group Code",'<>%1','CPCB');
                IF BOM_DUM[PROD_NO].FIND('-') THEN
            end;
        }
        dataitem("Integer";"Integer")
        {
            DataItemTableView = SORTING(Number);
            column(Dum__No__;Dum."No.")
            {
            }
            column(Dum_Description;Dum.Description)
            {
            }
            column(SHORTAGE_LINE;SHORTAGE_LINE)
            {
            }
            column(Dum__Standard_Cost__Control1000000052;Dum."Standard Cost")
            {
            }
            column(Dum__Unit_Cost__Control1000000056;Dum."Unit Cost")
            {
            }
            column(Expected_date_;"Expected date")
            {
            }
            column(Dum__Safety_Lead_Time_;Dum."Safety Lead Time")
            {
            }
            column(Stock_AT_Stores__Control1102154148;"Stock AT Stores")
            {
            }
            column(Dum__Budget_Quantity_;Dum."Budget Quantity")
            {
            }
            column(Item_Shortage_List_Caption;Item_Shortage_List_CaptionLbl)
            {
            }
            column(Required_BOM_Caption;Required_BOM_CaptionLbl)
            {
            }
            column(Item_No_Caption_Control1000000043;Item_No_Caption_Control1000000043Lbl)
            {
            }
            column(DescriptionCaption_Control1000000046;DescriptionCaption_Control1000000046Lbl)
            {
            }
            column(ShortageCaption_Control1000000047;ShortageCaption_Control1000000047Lbl)
            {
            }
            column(Qty__On_Purchase_OrderCaption_Control1000000053;Qty__On_Purchase_OrderCaption_Control1000000053Lbl)
            {
            }
            column(Qty__Under_InspectionCaption_Control1000000054;Qty__Under_InspectionCaption_Control1000000054Lbl)
            {
            }
            column(Lead_TimeCaption;Lead_TimeCaptionLbl)
            {
            }
            column(Required_QuantityCaption;Required_QuantityCaptionLbl)
            {
            }
            column(Qty__At_StoresCaption;Qty__At_StoresCaptionLbl)
            {
            }
            column(Expected_DateCaption;Expected_DateCaptionLbl)
            {
            }
            column(Integer_Number;Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF "Breaka" THEN
                CurrReport.BREAK;

                //Integer, Body (4) - OnPreSection()

                  SHORTAGE_LINE:=0;
                  "Order Date":=0D;
                  "Expected date":=0D;
                  "Purchase line".SETCURRENTKEY("Purchase line"."No.","Purchase line"."Unit Cost (LCY)");
                  "Purchase line".SETFILTER("Purchase line"."Outstanding Quantity",'>%1',0);
                  "Purchase line".SETRANGE("Purchase line"."No.",Dum."No.");
                  IF "Purchase line".FIND('+') THEN
                  BEGIN
                    "Purchase line".CALCFIELDS("Purchase line"."Document Date");
                    "Order Date":="Purchase line"."Document Date";
                     IF "Expected date">TODAY THEN
                    "Expected date":="Purchase line"."Expected Receipt Date";
                  END;
                  "Stock AT Stores":=0;

                  Item.RESET;
                  Item.SETRANGE(Item."No.",Dum."No.");
                  IF Item.FIND('-') THEN
                  BEGIN
                    Item.CALCFIELDS(Item."Inventory at Stores",Item."Quantity Under Inspection",Item."Quantity Rejected");
                    Item.CALCFIELDS(Item."Quantity Under Inspection",Item."Quantity Rejected",Item."Quantity Rework",
                    Item."Quantity Sent for Rework",Item."Stock at PROD Stores");
                    IF Item."QC Enabled" = TRUE THEN
                    BEGIN
                      IF (Item."Quantity Under Inspection"=0)AND (Item."Quantity Rejected"=0) AND
                         (Item."Quantity Rework"=0) AND (Item."Quantity Sent for Rework"=0) THEN
                      BEGIN
                        ItemLedgEntry.RESET;
                        ItemLedgEntry.SETCURRENTKEY("Item No.","Variant Code",Open,Positive,"Location Code","Posting Date",
                        "Expiration Date","Lot No.","Serial No.");
                        ItemLedgEntry.SETRANGE("Item No.",Item."No.");
                        ItemLedgEntry.SETRANGE(Open,TRUE);
                        ItemLedgEntry.SETRANGE("Location Code",'STR');
                        IF ItemLedgEntry.FIND('-') THEN
                        REPEAT
                          "Stock AT Stores"+=ItemLedgEntry."Remaining Quantity";
                        UNTIL ItemLedgEntry.NEXT=0;
                      END ELSE
                      BEGIN
                        "Stock AT Stores":=0 ;
                        ItemLedgEntry.RESET;
                        ItemLedgEntry.SETCURRENTKEY("Item No.","Variant Code",Open,Positive,"Location Code","Posting Date",
                        "Expiration Date","Lot No.","Serial No.");
                        ItemLedgEntry.SETRANGE("Item No.",Item."No.");
                        ItemLedgEntry.SETRANGE(Open,TRUE);
                        ItemLedgEntry.SETRANGE("Location Code",'STR');
                        IF ItemLedgEntry.FIND('-')THEN
                        REPEAT
                          ItemLedgEntry.MARK(TRUE);
                          IF (QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.") AND (QualityItemLedgEntry."Inspection Status"=
                              QualityItemLedgEntry."Inspection Status"::"0")) OR
                             (QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.")
                             AND (QualityItemLedgEntry."Inspection Status"=QualityItemLedgEntry."Inspection Status"::"1")) THEN
                          ItemLedgEntry.MARK(FALSE);
                        UNTIL ItemLedgEntry.NEXT=0;
                      END;
                    END;
                    ItemLedgEntry.MARKEDONLY(TRUE);
                    IF ItemLedgEntry.FIND('-')THEN
                    REPEAT
                      "Stock AT Stores":="Stock AT Stores"+ItemLedgEntry."Remaining Quantity";
                    UNTIL ItemLedgEntry.NEXT=0;
                  END;
                  "Stock AT Stores":="Stock AT Stores"+Item."Stock at PROD Stores";


                  IF Choice=Choice::Shortage THEN
                  BEGIN
                    SHORTAGE_LINE:=Dum."Budget Quantity"-"Stock AT Stores" ;
                    IF SHORTAGE_LINE<0 THEN
                        CurrReport.SHOWOUTPUT:=FALSE;
                  END ELSE
                  BEGIN
                    SHORTAGE_LINE:=Dum."Budget Quantity"-"Stock AT Stores" ;
                    IF SHORTAGE_LINE<0 THEN
                     SHORTAGE_LINE:= 0
                  END;


                IF Choice=Choice::Shortage THEN
                BEGIN
                  IF SHORTAGE_LINE>0  THEN
                  BEGIN
                  IF Excel THEN
                  BEGIN
                  Sheet.Range('a'+FORMAT(Row)).Value :=Dum."No." ;
                  Sheet.Range('b'+FORMAT(Row)).Value :=Dum.Description ;
                  Sheet.Range('c'+FORMAT(Row)).Value :=FORMAT(Dum."Base Unit of Measure") ;
                  Sheet.Range('d'+FORMAT(Row)).Value :=Dum."Budget Quantity" ;
                  Sheet.Range('e'+FORMAT(Row)).Value :=FORMAT("Stock AT Stores") ;
                  Sheet.Range('f'+FORMAT(Row)).Value :=FORMAT(Dum."Stock at Stores" ) ;
                  Sheet.Range('g'+FORMAT(Row)).Value :=FORMAT(SHORTAGE_LINE);
                  Sheet.Range('h'+FORMAT(Row)).Value :=FORMAT(Dum."Standard Cost");
                  Sheet.Range('i'+FORMAT(Row)).Value :=FORMAT(Dum."Unit Cost"*Dum."Budget Quantity");
                  Sheet.Range('j'+FORMAT(Row)).Value :=FORMAT(Dum."Safety Lead Time");
                  Orders:='';
                  "Expected Dates":='';
                  "Purchase line".SETCURRENTKEY("Purchase line"."No.","Purchase line"."Buy-from Vendor No.");
                  "Purchase line".SETRANGE("Purchase line"."No.",Dum."No.");
                    "Purchase line".SETFILTER("Purchase line"."Qty. to Receive",'>%1',0);
                    "Purchase line".SETFILTER("Purchase line"."Location Code",'STR');

                    "Purchase line".SETFILTER("Purchase line"."Document Type",'Order');

                  IF "Purchase line".FIND('-') THEN
                  REPEAT
                    Orders+="Purchase line"."Document No."+',';
                     IF ("Purchase line"."Expected Receipt Date"<TODAY) AND ("Purchase line"."Deviated Receipt Date">0D)  THEN
                       "Expected Dates"+=FORMAT("Purchase line"."Deviated Receipt Date")+','
                     ELSE
                      "Expected Dates"+=FORMAT("Purchase line"."Deviated Receipt Date")+',';

                  UNTIL "Purchase line".NEXT=0;

                  Sheet.Range('k'+FORMAT(Row)).Value :=FORMAT(Orders);
                  Sheet.Range('l'+FORMAT(Row)).Value :=FORMAT("Expected Dates");
                  Sheet.Range('m'+FORMAT(Row)).Value :=FORMAT(Dum."Avg Unit Cost");
                  BATCH_INFO:='';
                  PREV_BATCH:='';
                  PREV_BATCH_QTY:=0;
                  Row+=1;
                 END;
                END;

                END ELSE
                BEGIN
                  Sheet.Range('a'+FORMAT(Row)).Value :=Dum."No." ;

                  IF Update_Consumption  THEN
                  BEGIN
                    IF Item.GET(BOM[PROD_NO]) THEN
                       BOM_Product_Group:=Item."Item Sub Group Code";
                    IF (BOM_Product_Group='DL') AND (BOM[PROD_NO]='99/2006DL512D32A001') THEN
                    BEGIN
                     IF Item_Consume_Update.GET(Dum."No." ) THEN
                      BEGIN
                        Item_Consume_Update."Used In DL":=TRUE;
                        Item_Consume_Update.DL_Consumption:=Dum."Budget Quantity";
                        Item_Consume_Update.MODIFY;
                      END;
                     END ELSE
                    IF (BOM_Product_Group='MFEP') AND (BOM[PROD_NO]='99/2006MFP8NW0001') THEN
                    BEGIN

                      IF Item_Consume_Update.GET(Dum."No." ) THEN
                      BEGIN
                        Item_Consume_Update."Used In MFEP":=TRUE;
                        Item_Consume_Update.MFEP_Consumption:=Dum."Budget Quantity";
                        Item_Consume_Update.MODIFY;
                      END;
                     END ELSE
                    IF (BOM_Product_Group='ERTU') AND (BOM[PROD_NO]='99/2006ERTU32D16A002') THEN
                    BEGIN

                      IF Item_Consume_Update.GET(Dum."No." ) THEN
                      BEGIN
                        Item_Consume_Update."Used In RTU":=TRUE;
                        Item_Consume_Update.RTU_Consumption:=Dum."Budget Quantity";
                        Item_Consume_Update.MODIFY;
                      END;
                     END ELSE
                    IF (BOM_Product_Group='PMU') AND (BOM[PROD_NO]='PMU32D4A003') THEN
                    BEGIN

                      IF Item_Consume_Update.GET(Dum."No." ) THEN
                      BEGIN
                        Item_Consume_Update."Used In PMU":=TRUE;
                        Item_Consume_Update.PMU_Consumption:=Dum."Budget Quantity";
                        Item_Consume_Update.MODIFY;
                      END;
                     END;


                  END;
                  IF QC_Report AND Excel THEN
                  BEGIN
                    PRL.SETCURRENTKEY(PRL."No.");
                    PRL.SETRANGE(PRL."No.",Dum."No.");
                    PRL.SETRANGE(PRL."Document date",QC_From_Date,QC_To_Date);
                    PRL.SETFILTER(PRL.Quantity,'>%1',0);
                    PRL.SETFILTER(PRL."Quantity Accepted",'>%1',0);
                    Inward_Count:=0;
                    Inward_Count:=PRL.COUNT;
                    IF PRL.FIND('+') THEN
                    BEGIN
                      QC_ROW+=1;
                      "Enter Cell"(QC_ROW,1,Dum."No.",FALSE);
                      "Enter Cell"(QC_ROW,2,Dum.Description,FALSE);
                      "Enter Cell"(QC_ROW,3,FORMAT(PRL.Quantity),FALSE);
                      "Enter Cell"(QC_ROW,4,Item."Base Unit of Measure",FALSE);

                      ILE.SETCURRENTKEY(ILE."Document No.",ILE."Item No.",ILE."Posting Date");
                      ILE.SETFILTER(ILE."Entry Type",'Purchase');
                      ILE.SETRANGE(ILE."Document No.",PRL."Document No.");
                      ILE.SETRANGE(ILE."Item No.",Dum."No.");
                      IF ILE.FIND('-') THEN
                      BEGIN
                        "Enter Cell"(QC_ROW,5,ILE."Lot No.",FALSE);
                        IRS.SETCURRENTKEY(IRS."Receipt No.",IRS."Item No.");
                        IRS.SETRANGE(IRS."Receipt No.",PRL."Document No.");
                        IRS.SETRANGE(IRS."Item No.",Dum."No.");
                        IF IRS.FIND('-') THEN
                        BEGIN
                          "Enter Cell"(QC_ROW,6,FORMAT(IRS.Status),FALSE);
                          IF IRS.Status THEN
                          BEGIN
                            "Enter Cell"( QC_ROW,7,FORMAT(IRS."Qty. Accepted"),FALSE);
                            "Enter Cell"(QC_ROW,8,FORMAT(IRS."Qty. Rejected"),FALSE);
                            "Enter Cell"(QC_ROW,9,FORMAT(IRS."Qty. Rejected"/(IRS."Qty. Accepted"+IRS."Qty. Rejected")),FALSE);
                            "Enter Cell"(QC_ROW,10,FORMAT(IRS."Vendor Name"),FALSE);
                              "Enter Cell"( QC_ROW,11,FORMAT(Inward_Count),FALSE);
                          END;
                       END;
                     END;
                   END;
                 END;
                 IF Excel THEN
                 BEGIN
                  Sheet.Range('a'+FORMAT(Row)).Value :=Dum."No." ;
                  Sheet.Range('b'+FORMAT(Row)).Value :=Dum.Description ;
                  Sheet.Range('c'+FORMAT(Row)).Value :=FORMAT(Dum."Base Unit of Measure") ;
                  Sheet.Range('d'+FORMAT(Row)).Value :=Dum."Budget Quantity" ;
                  Sheet.Range('e'+FORMAT(Row)).Value :=FORMAT("Stock AT Stores") ;
                  Sheet.Range('f'+FORMAT(Row)).Value :=FORMAT(Dum."Stock at Stores" ) ;


                  Sheet.Range('g'+FORMAT(Row)).Value :=FORMAT(SHORTAGE_LINE);
                  Sheet.Range('h'+FORMAT(Row)).Value :=FORMAT(Dum."Standard Cost");
                  Sheet.Range('i'+FORMAT(Row)).Value :=FORMAT(Dum."Unit Cost");
                  Sheet.Range('j'+FORMAT(Row)).Value :=FORMAT(Dum."Safety Lead Time");

                  Orders:='';
                  "Expected Dates":='';
                  "Purchase line".SETCURRENTKEY("Purchase line"."No.","Purchase line"."Buy-from Vendor No.");
                  "Purchase line".SETRANGE("Purchase line"."No.",Dum."No.");
                    "Purchase line".SETFILTER("Purchase line"."Qty. to Receive",'>%1',0);
                    "Purchase line".SETFILTER("Purchase line"."Location Code",'STR');

                    "Purchase line".SETFILTER("Purchase line"."Document Type",'Order');

                  IF "Purchase line".FIND('-') THEN
                  REPEAT
                    Orders+="Purchase line"."Document No."+',';
                     IF ("Purchase line"."Expected Receipt Date"<TODAY) AND ("Purchase line"."Deviated Receipt Date">0D)  THEN
                       "Expected Dates"+=FORMAT("Purchase line"."Deviated Receipt Date")+','
                     ELSE
                      "Expected Dates"+=FORMAT("Purchase line"."Expected Receipt Date")+',';

                  UNTIL "Purchase line".NEXT=0;
                  Sheet.Range('k'+FORMAT(Row)).Value :=FORMAT(Orders);
                  Sheet.Range('l'+FORMAT(Row)).Value :=FORMAT("Expected Dates");
                  Sheet.Range('m'+FORMAT(Row)).Value :=FORMAT(Dum."Avg Unit Cost");

                  BATCH_INFO:='';
                  PREV_BATCH:='';
                  PREV_BATCH_QTY:=0;

                  IF (Item."Item Tracking Code"='LOT') AND BATCH_INFO_DETIALS THEN
                  BEGIN
                    ItemLedgEntry.RESET;
                    ItemLedgEntry.SETCURRENTKEY("Item No.","Variant Code",Open,Positive,"Location Code","Posting Date",
                         "Expiration Date","Lot No.","Serial No.");
                    ItemLedgEntry.SETRANGE("Item No.",Item."No.");
                    ItemLedgEntry.SETRANGE(Open,TRUE);
                    ItemLedgEntry.SETRANGE("Location Code",'STR');
                    IF ItemLedgEntry.FINDSET THEN
                    REPEAT
                      IF (PREV_BATCH<>ItemLedgEntry."Lot No.") AND (PREV_BATCH<>'')  THEN
                      BEGIN
                        Row+=1;
                       // BATCH_INFO+=PREV_BATCH+'('+FORMAT(PREV_BATCH_QTY)+'),';
                        Sheet.Range('B'+FORMAT(Row)).Value :=PREV_BATCH;
                        Sheet.Range('C'+FORMAT(Row)).Value :=FORMAT(PREV_BATCH_QTY);
                        PREV_BATCH:= ItemLedgEntry."Lot No.";
                        PREV_BATCH_QTY:=ItemLedgEntry."Remaining Quantity";
                      END ELSE
                      BEGIN
                        PREV_BATCH:=ItemLedgEntry."Lot No.";
                        PREV_BATCH_QTY+=ItemLedgEntry."Remaining Quantity";
                      END;
                    UNTIL ItemLedgEntry.NEXT=0;
                    Row+=1;
                    Sheet.Range('B'+FORMAT(Row)).Value :=PREV_BATCH;
                    Sheet.Range('C'+FORMAT(Row)).Value :=FORMAT(PREV_BATCH_QTY);

                    BATCH_INFO+=PREV_BATCH+'('+FORMAT(PREV_BATCH_QTY)+'),';
                  END;



                  IF LATEST_VENDOR THEN
                  BEGIN
                    "Purchase line".RESET;
                    "Purchase line".SETCURRENTKEY("Purchase line"."No.","Purchase line"."Buy-from Vendor No.");
                    "Purchase line".SETRANGE("Purchase line"."No.",Dum."No.");
                //    "Purchase line".SETFILTER("Purchase line"."Location Code",'STR');
                    "Purchase line".SETFILTER("Purchase line"."Document Type",'Order');
                    IF "Purchase line".FIND('+') THEN
                    BEGIN
                      IF VENDOR.GET("Purchase line"."Buy-from Vendor No.") THEN
                         Sheet.Range('O'+FORMAT(Row)).Value :=VENDOR.Name;
                    END;
                  END;
                Row+=1;
                END;
                END;
                IF Dum.NEXT=0 THEN
                "Breaka":=TRUE;

                //Integer, Body (4) - OnPreSection()
            end;

            trigger OnPreDataItem();
            begin
                
                
                Dum.SETCURRENTKEY(Dum."Avg Unit Cost");
                Dum.SETFILTER(Dum."Budget Quantity",'>%1',0);
                Dum.SETFILTER(Dum."Product Group Code",'<>%1','CPCB');
                IF Dum.FIND('-') THEN
                "Breaka":=FALSE;
                
                
                IF Excel THEN
                BEGIN
                 // CREATE(Excel1,TRUE,TRUE);
                
                  Excel1.Worksheets.Add;
                  Sheet := Excel1.ActiveSheet;
                
                  Sheet.Name :='Total BOM';
                END;
                  IF Update_Consumption  THEN
                  BEGIN
                    IF Item.GET(BOM[PROD_NO]) THEN
                       BOM_Product_Group:=Item."Item Sub Group Code";
                    IF (BOM_Product_Group='DL') AND (BOM[PROD_NO]='99/2006DL512D32A001') THEN
                    BEGIN
                       MESSAGE('HI');
                      Item.RESET;
                       Item.SETFILTER(Item.DL_Consumption,'>%1',0);
                       IF Item.FIND('-') THEN
                       REPEAT
                           MESSAGE('Hello');
                          Item."Used In DL":=FALSE;
                          Item.DL_Consumption:=0;
                          Item.MODIFY;
                       UNTIL Item.NEXT=0;
                
                     END ELSE
                    IF (BOM_Product_Group='MFEP') AND (BOM[PROD_NO]='99/2006MFP8NW0001') THEN
                    BEGIN
                       Item.RESET;
                       Item.SETFILTER(Item.MFEP_Consumption,'>%1',0);
                       IF Item.FIND('-') THEN
                       REPEAT
                          Item."Used In MFEP":=FALSE;
                          Item.MFEP_Consumption:=0;
                          Item.MODIFY;
                       UNTIL Item.NEXT=0;
                
                     END ELSE
                    IF (BOM_Product_Group='ERTU') AND (BOM[PROD_NO]='99/2006ERTU32D16A002') THEN
                    BEGIN
                       Item.RESET;
                       Item.SETFILTER(Item.RTU_Consumption,'>%1',0);
                       IF Item.FIND('-') THEN
                       REPEAT
                          Item."Used In RTU":=FALSE;
                          Item.RTU_Consumption:=0;
                          Item.MODIFY;
                       UNTIL Item.NEXT=0;
                
                     END ELSE
                    IF (BOM_Product_Group='PMU') AND (BOM[PROD_NO]='PMU32D4A003') THEN
                    BEGIN
                       Item.RESET;
                       Item.SETFILTER(Item.PMU_Consumption,'>%1',0);
                       IF Item.FIND('-') THEN
                       REPEAT
                          Item."Used In PMU":=FALSE;
                          Item.PMU_Consumption:=0;
                          Item.MODIFY;
                       UNTIL Item.NEXT=0;
                
                     END;
                  END;
                //Integer, Header (1) - OnPreSection()
                IF Choice=Choice::Shortage THEN
                BEGIN
                  IF Excel AND QC_Report THEN
                  BEGIN
                  Row:=1;
                  "Enter Headings"(Row,1,'It',TRUE);
                  Row+=1;
                  "Enter Headings"(Row,1,'',TRUE);
                  END;
                END;
                /*
                ELSE
                CurrReport.SHOWOUTPUT:=FALSE;
                */
                //Integer, Header (1) - OnPreSection()
                
                
                //Integer, Header (2) - OnPreSection()
                IF Choice=Choice::Total THEN
                BEGIN
                 IF Excel AND QC_Report THEN
                 BEGIN
                  Row:=1;
                  "Enter Headings"(Row,1,'ITEM SHORTAGE LIST',TRUE);
                  Row+=1;
                  "Enter Headings"(Row,1,'',TRUE);
                  END;
                END;
                /*
                ELSE
                CurrReport.SHOWOUTPUT:=FALSE;
                */
                //Integer, Header (2) - OnPreSection()
                
                
                //Integer, Header (3) - OnPreSection()
                 IF Excel THEN
                 BEGIN
                  Sheet.Range('A1').Value :='Item No.';
                  Sheet.Range('b1').Value := 'Description';
                  Sheet.Range('c1').Value:='UOM';
                  Sheet.Range('d1').Value := 'Required Quantity';
                  Sheet.Range('e1').Value := 'Quantity At Stores';
                  Sheet.Range('f1').Value := 'Quantity At Machine Location';
                
                  Sheet.Range('g1').Value := 'Shortage';
                  Sheet.Range('h1').Value := 'Qty. On Purchase Order';
                  Sheet.Range('i1').Value := 'Qty. Under Inspection';
                  Sheet.Range('j1').Value := 'Item Lead Time';
                
                  Sheet.Range('k1').Value := 'Purchase Orders';
                   Sheet.Range('l1').Value := 'Expected Reciept Date';
                   Sheet.Range('m1').Value := 'Unit Cost';
                   IF LATEST_VENDOR THEN
                     Sheet.Range('O1').Value := 'LATEST VENDOR';
                
                  IF QC_Report AND Excel THEN
                  BEGIN
                   QC_ROW:=Row+1;
                    "Enter Headings"(QC_ROW,1,'Item No.',TRUE);
                    "Enter Headings"(QC_ROW,2,'Description',TRUE);
                    "Enter Headings"(QC_ROW,3,'Qunatity',TRUE);
                    "Enter Headings"(QC_ROW,4,'Unit Of Measurement',TRUE);
                    "Enter Headings"(QC_ROW,5,'LOT No.',TRUE);
                    "Enter Headings"(QC_ROW,7,'Accepted Quantity',TRUE);
                    "Enter Headings"(QC_ROW,8,'Rejected Quantity',TRUE);
                    "Enter Headings"(QC_ROW,9,'Rejection %',TRUE);
                    "Enter Headings"(QC_ROW,10,'Vendor Name',TRUE);
                     "Enter Headings"(QC_ROW,11,'No. Of Inwards',TRUE);
                  END;
                
                   Row:=2;
                 END;
                //Integer, Header (3) - OnPreSection()

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
                    grid(Control1000000002)
                    {
                        GridLayout = Rows;
                        ShowCaption = false;
                        group(Control1000000003)
                        {
                            ShowCaption = false;
                            field("Production Bom No.1";'')
                            {
                                ShowCaption = false;
                            }
                            field("BOM[1]";BOM[1])
                            {
                                ShowCaption = false;
                                TableRelation = "Production BOM Header";
                            }
                            field("Production Bom No.2";'')
                            {
                                ShowCaption = false;
                            }
                            field("BOM[2]";BOM[2])
                            {
                                ShowCaption = false;
                                TableRelation = "Production BOM Header";
                            }
                            field("Production Bom No.3";'')
                            {
                                ShowCaption = false;
                            }
                            field("BOM[3]";BOM[3])
                            {
                                ShowCaption = false;
                                TableRelation = "Production BOM Header";
                            }
                            field("Production Bom No.4";'')
                            {
                                ShowCaption = false;
                            }
                            field("BOM[4]";BOM[4])
                            {
                                ShowCaption = false;
                                TableRelation = "Production BOM Header";
                            }
                        }
                        group(Control1000000012)
                        {
                            ShowCaption = false;
                            field("Required Quantity1";'')
                            {
                                Caption = 'Required Quantity';
                                ShowCaption = false;
                            }
                            field("QTY[1]";QTY[1])
                            {
                                ShowCaption = false;
                            }
                            field("Required Quantity2";'')
                            {
                                Caption = 'Required Quantity';
                                ShowCaption = false;
                            }
                            field("QTY[2]";QTY[2])
                            {
                                ShowCaption = false;
                            }
                            field("Required Quantity3";'')
                            {
                                Caption = 'Required Quantity';
                                ShowCaption = false;
                            }
                            field("QTY[3]";QTY[3])
                            {
                                ShowCaption = false;
                            }
                            field("Required Quantity4";'')
                            {
                                Caption = 'Required Quantity';
                                ShowCaption = false;
                            }
                            field("QTY[4]";QTY[4])
                            {
                                ShowCaption = false;
                            }
                        }
                        group(Control1000000029)
                        {
                            ShowCaption = false;
                            field("Production Bom No.5";'')
                            {
                                ShowCaption = false;
                            }
                            field("BOM[5]";BOM[5])
                            {
                                ShowCaption = false;
                                TableRelation = "Production BOM Header";
                            }
                            field("Production Bom No.6";'')
                            {
                                ShowCaption = false;
                            }
                            field("BOM[6]";BOM[6])
                            {
                                ShowCaption = false;
                                TableRelation = "Production BOM Header";
                            }
                            field("Production Bom No.7";'')
                            {
                                ShowCaption = false;
                            }
                            field("BOM[7]";BOM[7])
                            {
                                ShowCaption = false;
                                TableRelation = "Production BOM Header";
                            }
                            field("Production Bom No.8";'')
                            {
                                ShowCaption = false;
                            }
                            field("BOM[8]";BOM[8])
                            {
                                ShowCaption = false;
                                TableRelation = "Production BOM Header";
                            }
                        }
                        group(Control1000000038)
                        {
                            ShowCaption = false;
                            field("Required Quantity5";'')
                            {
                                Caption = 'Required Quantity';
                                ShowCaption = false;
                            }
                            field("QTY[5]";QTY[5])
                            {
                                ShowCaption = false;
                            }
                            field("Required Quantity6";'')
                            {
                                Caption = 'Required Quantity';
                                ShowCaption = false;
                            }
                            field("QTY[6]";QTY[6])
                            {
                                ShowCaption = false;
                            }
                            field("Required Quantity7";'')
                            {
                                Caption = 'Required Quantity';
                                ShowCaption = false;
                            }
                            field("QTY[7]";QTY[7])
                            {
                                ShowCaption = false;
                            }
                            field("Required Quantity8";'')
                            {
                                Caption = 'Required Quantity';
                                ShowCaption = false;
                            }
                            field("QTY[8]";QTY[8])
                            {
                                ShowCaption = false;
                            }
                        }
                        group(Control1000000056)
                        {
                            ShowCaption = false;
                            field("Production Bom No.9";'')
                            {
                                ShowCaption = false;
                            }
                            field("BOM[9]";BOM[9])
                            {
                                ShowCaption = false;
                                TableRelation = "Production BOM Header";
                            }
                            field("Production Bom No.10";'')
                            {
                                ShowCaption = false;
                            }
                            field("BOM[10]";BOM[10])
                            {
                                ShowCaption = false;
                                TableRelation = "Production BOM Header";
                            }
                            field("Production Bom No.11";'')
                            {
                                ShowCaption = false;
                            }
                            field("BOM[11]";BOM[11])
                            {
                                ShowCaption = false;
                                TableRelation = "Production BOM Header";
                            }
                            field("Production Bom No.12";'')
                            {
                                ShowCaption = false;
                            }
                            field("BOM[12]";BOM[12])
                            {
                                ShowCaption = false;
                                TableRelation = "Production BOM Header";
                            }
                        }
                        group(Control1000000047)
                        {
                            ShowCaption = false;
                            field("Required Quantity9";'')
                            {
                                Caption = 'Required Quantity';
                                ShowCaption = false;
                            }
                            field("QTY[9]";QTY[9])
                            {
                                ShowCaption = false;
                            }
                            field("Required Quantity10";'')
                            {
                                Caption = 'Required Quantity';
                                ShowCaption = false;
                            }
                            field("QTY[10]";QTY[10])
                            {
                                ShowCaption = false;
                            }
                            field("Required Quantity11";'')
                            {
                                Caption = 'Required Quantity';
                                ShowCaption = false;
                            }
                            field("QTY[11]";QTY[11])
                            {
                                ShowCaption = false;
                            }
                            field("Required Quantity12";'')
                            {
                                Caption = 'Required Quantity';
                                ShowCaption = false;
                            }
                            field("QTY[12]";QTY[12])
                            {
                                ShowCaption = false;
                            }
                        }
                        group(Control1000000074)
                        {
                            ShowCaption = false;
                            field("Production Bom No.13";'')
                            {
                                ShowCaption = false;
                            }
                            field("BOM[13]";BOM[13])
                            {
                                ShowCaption = false;
                                TableRelation = "Production BOM Header";
                            }
                            field("Production Bom No.14";'')
                            {
                                ShowCaption = false;
                            }
                            field("BOM[14]";BOM[14])
                            {
                                ShowCaption = false;
                                TableRelation = "Production BOM Header";
                            }
                            field("Production Bom No.15";'')
                            {
                                ShowCaption = false;
                            }
                            field("BOM[15]";BOM[15])
                            {
                                ShowCaption = false;
                                TableRelation = "Production BOM Header";
                            }
                            field("Production Bom No.16";'')
                            {
                                ShowCaption = false;
                            }
                            field("BOM[16]";BOM[16])
                            {
                                ShowCaption = false;
                                TableRelation = "Production BOM Header";
                            }
                        }
                        group(Control1000000065)
                        {
                            ShowCaption = false;
                            field("Required Quantity13";'')
                            {
                                Caption = 'Required Quantity';
                                ShowCaption = false;
                            }
                            field("QTY[13]";QTY[13])
                            {
                                ShowCaption = false;
                            }
                            field("Required Quantity14";'')
                            {
                                Caption = 'Required Quantity';
                                ShowCaption = false;
                            }
                            field("QTY[14]";QTY[14])
                            {
                                ShowCaption = false;
                            }
                            field("Required Quantity15";'')
                            {
                                Caption = 'Required Quantity';
                                ShowCaption = false;
                            }
                            field("QTY[15]";QTY[15])
                            {
                                ShowCaption = false;
                            }
                            field("Required Quantity16";'')
                            {
                                Caption = 'Required Quantity';
                                ShowCaption = false;
                            }
                            field("QTY[16]";QTY[16])
                            {
                                ShowCaption = false;
                            }
                        }
                        group(Control1000000092)
                        {
                            ShowCaption = false;
                            field("Production Bom No.17";'')
                            {
                                ShowCaption = false;
                            }
                            field("BOM[17]";BOM[17])
                            {
                                ShowCaption = false;
                                TableRelation = "Production BOM Header";
                            }
                            field("Production Bom No.18";'')
                            {
                                ShowCaption = false;
                            }
                            field("BOM[18]";BOM[18])
                            {
                                ShowCaption = false;
                                TableRelation = "Production BOM Header";
                            }
                            field("Production Bom No.19";'')
                            {
                                ShowCaption = false;
                            }
                            field("BOM[19]";BOM[19])
                            {
                                ShowCaption = false;
                                TableRelation = "Production BOM Header";
                            }
                            field("Production Bom No.20";'')
                            {
                                ShowCaption = false;
                            }
                            field("BOM[20]";BOM[20])
                            {
                                ShowCaption = false;
                                TableRelation = "Production BOM Header";
                            }
                        }
                        group(Control1000000083)
                        {
                            ShowCaption = false;
                            field("Required Quantity17";'')
                            {
                                Caption = 'Required Quantity';
                                ShowCaption = false;
                            }
                            field("QTY[17]";QTY[17])
                            {
                                ShowCaption = false;
                            }
                            field("Required Quantity18";'')
                            {
                                Caption = 'Required Quantity';
                                ShowCaption = false;
                            }
                            field("QTY[18]";QTY[18])
                            {
                                ShowCaption = false;
                            }
                            field("Required Quantity19";'')
                            {
                                Caption = 'Required Quantity';
                                ShowCaption = false;
                            }
                            field("QTY[19]";QTY[19])
                            {
                                ShowCaption = false;
                            }
                            field("Required Quantity20";'')
                            {
                                Caption = 'Required Quantity';
                                ShowCaption = false;
                            }
                            field("QTY[20]";QTY[20])
                            {
                                ShowCaption = false;
                            }
                        }
                        group(Control1000000110)
                        {
                            ShowCaption = false;
                            field("Production Bom No.21";'')
                            {
                                ShowCaption = false;
                            }
                            field("BOM[21]";BOM[21])
                            {
                                ShowCaption = false;
                                TableRelation = "Production BOM Header";
                            }
                            field("Production Bom No.22";'')
                            {
                                ShowCaption = false;
                            }
                            field("BOM[22]";BOM[22])
                            {
                                ShowCaption = false;
                                TableRelation = "Production BOM Header";
                            }
                            field("Production Bom No.23";'')
                            {
                                ShowCaption = false;
                            }
                            field("BOM[23]";BOM[23])
                            {
                                ShowCaption = false;
                                TableRelation = "Production BOM Header";
                            }
                            field("Production Bom No.24";'')
                            {
                                ShowCaption = false;
                            }
                            field("BOM[24]";BOM[24])
                            {
                                ShowCaption = false;
                                TableRelation = "Production BOM Header";
                            }
                        }
                        group(Control1000000101)
                        {
                            ShowCaption = false;
                            field("Required Quantity21";'')
                            {
                                Caption = 'Required Quantity';
                                ShowCaption = false;
                            }
                            field("QTY[21]";QTY[21])
                            {
                                ShowCaption = false;
                            }
                            field("Required Quantity22";'')
                            {
                                Caption = 'Required Quantity';
                                ShowCaption = false;
                            }
                            field("QTY[22]";QTY[22])
                            {
                                ShowCaption = false;
                            }
                            field("Required Quantity23";'')
                            {
                                Caption = 'Required Quantity';
                                ShowCaption = false;
                            }
                            field("QTY[23]";QTY[23])
                            {
                                ShowCaption = false;
                            }
                            field("Required Quantity24";'')
                            {
                                Caption = 'Required Quantity';
                                ShowCaption = false;
                            }
                            field("QTY[24]";QTY[24])
                            {
                                ShowCaption = false;
                            }
                        }
                        group(Control1000000128)
                        {
                            ShowCaption = false;
                            field("Production Bom No.25";'')
                            {
                                ShowCaption = false;
                            }
                            field("BOM[25]";BOM[25])
                            {
                                ShowCaption = false;
                                TableRelation = "Production BOM Header";
                            }
                            field("Production Bom No.26";'')
                            {
                                ShowCaption = false;
                            }
                            field("BOM[26]";BOM[26])
                            {
                                ShowCaption = false;
                                TableRelation = "Production BOM Header";
                            }
                            field("Production Bom No.27";'')
                            {
                                ShowCaption = false;
                            }
                            field("BOM[27]";BOM[27])
                            {
                                ShowCaption = false;
                                TableRelation = "Production BOM Header";
                            }
                        }
                        group(Control1000000119)
                        {
                            ShowCaption = false;
                            field("Required Quantity25";'')
                            {
                                Caption = 'Required Quantity';
                                ShowCaption = false;
                            }
                            field("QTY[25]";QTY[25])
                            {
                                ShowCaption = false;
                            }
                            field("Required Quantity26";'')
                            {
                                Caption = 'Required Quantity';
                                ShowCaption = false;
                            }
                            field("QTY[26]";QTY[26])
                            {
                                ShowCaption = false;
                            }
                            field("Required Quantity27";'')
                            {
                                Caption = 'Required Quantity';
                                ShowCaption = false;
                            }
                            field("QTY[27]";QTY[27])
                            {
                                ShowCaption = false;
                            }
                        }
                        group(Control1000000112)
                        {
                            ShowCaption = false;
                            field(Choice;'')
                            {
                                ShowCaption = false;
                            }
                            field(Control1000000111;Choice)
                            {
                                ShowCaption = false;
                            }
                            field(Excel;'')
                            {
                                ShowCaption = false;
                            }
                            field(Control1000000120;Excel)
                            {
                                ShowCaption = false;
                            }
                            field("Update Item Consumption";'')
                            {
                                Caption = 'Update Item Consumption';
                                ShowCaption = false;
                            }
                            field(Update_Consumption;Update_Consumption)
                            {
                                ShowCaption = false;
                            }
                            field("QC Report";'')
                            {
                                ShowCaption = false;
                            }
                            field(QC_Report;QC_Report)
                            {
                                ShowCaption = false;
                            }
                            field(Control1000000144;'')
                            {
                                ShowCaption = false;
                            }
                            field(Control1000000145;'')
                            {
                                ShowCaption = false;
                            }
                        }
                        group(Control1000000130)
                        {
                            ShowCaption = false;
                            field("From Date";'')
                            {
                                ShowCaption = false;
                            }
                            field(QC_From_Date;QC_From_Date)
                            {
                                ShowCaption = false;
                            }
                            field("BATCH INFO DETAILS";'')
                            {
                                ShowCaption = false;
                            }
                            field(BATCH_INFO_DETIALS;BATCH_INFO_DETIALS)
                            {
                                ShowCaption = false;
                            }
                        }
                        group(Control1000000133)
                        {
                            ShowCaption = false;
                            field("To Date";'')
                            {
                                ShowCaption = false;
                            }
                            field(QC_To_Date;QC_To_Date)
                            {
                                ShowCaption = false;
                            }
                            field("LATEST VENDOR DETAILS";'')
                            {
                                ShowCaption = false;
                            }
                            field(LATEST_VENDOR;LATEST_VENDOR)
                            {
                                ShowCaption = false;
                            }
                        }
                    }
                }
            }
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
        Excel1.Visible(TRUE);
        IF Excel AND QC_Report THEN
        BEGIN
         TempExcelBuffer.CreateBook('');//B2B
         //TempExcelBuffer.CreateSheet('QC','',COMPANYNAME,'');//B2B
         TempExcelBuffer.GiveUserControl;
        END;
    end;

    trigger OnPreReport();
    begin
        CREATE(Excel1,TRUE,TRUE);//B2B
           IF Excel AND QC_Report  THEN
           BEGIN
             CLEAR(TempExcelBuffer);
             TempExcelBuffer.DELETEALL;
           END;
        QC_From_Date:=010407D;
        QC_To_Date:=TODAY;
    end;

    var
        DateChange : Boolean;
        Prod_date : Date;
        Item : Record Item;
        "Quantity At Stores" : Decimal;
        Item_Decs : Text[50];
        Dum : Record Item temporary;
        shortage : Boolean;
        "Shortage Quantity" : Decimal;
        "Item Code" : Code[10];
        BOM : array [30] of Code[30];
        PBMH : Record "Production BOM Header";
        PO : Record "Production Order";
        QTY : array [30] of Integer;
        REQ_QTY : Decimal;
        pbml : Record "Production BOM Line";
        "Sub BOM's" : Text[1000];
        POS : Integer;
        CNT : Integer;
        SNO : Integer;
        "Order Date" : Date;
        "Expected date" : Date;
        "Purchase line" : Record "Purchase Line";
        TempExcelBuffer : Record "Excel Buffer" temporary;
        Row : Integer;
        PBML2 : Record "Production BOM Line";
        Breaka : Boolean;
        "Stock AT Stores" : Decimal;
        ILE : Record "Item Ledger Entry";
        Excel : Boolean;
        Choice : Option Shortage,Total;
        BOM_DUM : array [30] of Record Item temporary;
        PBML3 : Record "Production BOM Line";
        Desc1 : Text[50];
        Desc2 : Text[50];
        Desc3 : Text[50];
        Shortage_ByConsidering_Previou : Decimal;
        StockAtStores : Integer;
        ItemLedgEntry : Record "Item Ledger Entry";
        QualityItemLedgEntry : Record "Quality Item Ledger Entry";
        Stock : Decimal;
        Version1 : Code[30];
        Version2 : Code[30];
        Version3 : Code[30];
        SHORTAGE_LINE : Decimal;
        DUm2 : Record Item temporary;
        PROD_QTY : Integer;
        PROD_NO : Integer;
        Excel1 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00024500-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Application";
        Range : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Range";
        Sheet : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet1 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet2 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet3 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet4 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet5 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet6 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet7 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet8 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet9 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet10 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet11 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet12 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet13 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet14 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet15 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet16 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet17 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet18 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet19 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet20 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet21 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet22 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet23 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet24 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet25 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet26 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet27 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet28 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet29 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet30 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        BOMName : Text[50];
        ItemLedgEntry1 : Record "Item Ledger Entry";
        BOUT : Record "Bin Type";
        Update_Consumption : Boolean;
        Item_Consume_Update : Record Item;
        QC_Report : Boolean;
        PRL : Record "Purch. Rcpt. Line";
        IRS : Record "Inspection Receipt Header";
        First : Boolean;
        QC_From_Date : Date;
        QC_To_Date : Date;
        QC_ROW : Integer;
        BOM_Product_Group : Code[20];
        Inward_Count : Integer;
        "Expected Dates" : Text[200];
        Orders : Text[1000];
        PBMV : Record "Production BOM Version";
        ItemNumber : Text[30];
        LATEST_VENDOR : Boolean;
        VENDOR : Record Vendor;
        BATCH_INFO : Text[1000];
        PREV_BATCH : Text[30];
        PREV_BATCH_QTY : Decimal;
        BATCH_INFO_DETIALS : Boolean;
        PL : Record "Purchase Line";
        Shortage_List_ReportCaptionLbl : Label 'Shortage List Report';
        Production_DateCaptionLbl : Label 'Production Date';
        Project_Code__CaptionLbl : Label 'Project Code :';
        Qty__Under_InspectionCaptionLbl : Label 'Qty. Under Inspection';
        Item_No_CaptionLbl : Label 'Item No.';
        DescriptionCaptionLbl : Label 'Description';
        Required_QTYCaptionLbl : Label 'Required QTY';
        Qty_At_StoresCaptionLbl : Label 'Qty At Stores';
        Shortage_By_Considering_Previous_OrdersCaptionLbl : Label 'Shortage By Considering Previous Orders';
        Qty__On_Purchase_OrderCaptionLbl : Label 'Qty. On Purchase Order';
        No_ShortageCaptionLbl : Label 'No Shortage';
        Future_ProjectionCaptionLbl : Label 'Future Projection';
        Required_ProductCaptionLbl : Label 'Required Product';
        Requirerd_QuantityCaptionLbl : Label 'Requirerd Quantity';
        No_CaptionLbl : Label 'No.';
        DescriptionCaption_Control1102154283Lbl : Label 'Description';
        Required_QTYCaption_Control1102154284Lbl : Label 'Required QTY';
        Qty_At_StoresCaption_Control1102154286Lbl : Label 'Qty At Stores';
        Overall_ShortageCaptionLbl : Label 'Overall Shortage';
        Qty__On_Purchase_OrderCaption_Control1102154288Lbl : Label 'Qty. On Purchase Order';
        Qty__Under_InspectionCaption_Control1102154289Lbl : Label 'Qty. Under Inspection';
        ShortageCaptionLbl : Label 'Shortage';
        Required_ProductCaption_Control1102154036Lbl : Label 'Required Product';
        Requirerd_QuantityCaption_Control1102154038Lbl : Label 'Requirerd Quantity';
        No_Caption_Control1102154152Lbl : Label 'No.';
        DescriptionCaption_Control1102154153Lbl : Label 'Description';
        Required_QTYCaption_Control1102154154Lbl : Label 'Required QTY';
        Qty_At_StoresCaption_Control1102154156Lbl : Label 'Qty At Stores';
        Overall_ShortageCaption_Control1102154157Lbl : Label 'Overall Shortage';
        Qty__On_Purchase_OrderCaption_Control1102154158Lbl : Label 'Qty. On Purchase Order';
        Qty__Under_InspectionCaption_Control1102154159Lbl : Label 'Qty. Under Inspection';
        ShortageCaption_Control1102154160Lbl : Label 'Shortage';
        Required_ProductCaption_Control1102154048Lbl : Label 'Required Product';
        Requirerd_QuantityCaption_Control1102154050Lbl : Label 'Requirerd Quantity';
        No_Caption_Control1102154161Lbl : Label 'No.';
        DescriptionCaption_Control1102154162Lbl : Label 'Description';
        Required_QTYCaption_Control1102154163Lbl : Label 'Required QTY';
        Qty_At_StoresCaption_Control1102154165Lbl : Label 'Qty At Stores';
        Overall_ShortageCaption_Control1102154166Lbl : Label 'Overall Shortage';
        Qty__On_Purchase_OrderCaption_Control1102154167Lbl : Label 'Qty. On Purchase Order';
        Qty__Under_InspectionCaption_Control1102154168Lbl : Label 'Qty. Under Inspection';
        ShortageCaption_Control1102154169Lbl : Label 'Shortage';
        Required_ProductCaption_Control1102154060Lbl : Label 'Required Product';
        Requirerd_QuantityCaption_Control1102154062Lbl : Label 'Requirerd Quantity';
        No_Caption_Control1102154170Lbl : Label 'No.';
        DescriptionCaption_Control1102154171Lbl : Label 'Description';
        Required_QTYCaption_Control1102154172Lbl : Label 'Required QTY';
        Qty_At_StoresCaption_Control1102154174Lbl : Label 'Qty At Stores';
        Overall_ShortageCaption_Control1102154175Lbl : Label 'Overall Shortage';
        Qty__On_Purchase_OrderCaption_Control1102154176Lbl : Label 'Qty. On Purchase Order';
        Qty__Under_InspectionCaption_Control1102154177Lbl : Label 'Qty. Under Inspection';
        ShortageCaption_Control1102154178Lbl : Label 'Shortage';
        Required_ProductCaption_Control1102154072Lbl : Label 'Required Product';
        Requirerd_QuantityCaption_Control1102154074Lbl : Label 'Requirerd Quantity';
        No_Caption_Control1102154179Lbl : Label 'No.';
        DescriptionCaption_Control1102154180Lbl : Label 'Description';
        Required_QTYCaption_Control1102154181Lbl : Label 'Required QTY';
        Qty_At_StoresCaption_Control1102154183Lbl : Label 'Qty At Stores';
        Overall_ShortageCaption_Control1102154184Lbl : Label 'Overall Shortage';
        Qty__On_Purchase_OrderCaption_Control1102154185Lbl : Label 'Qty. On Purchase Order';
        Qty__Under_InspectionCaption_Control1102154186Lbl : Label 'Qty. Under Inspection';
        ShortageCaption_Control1102154187Lbl : Label 'Shortage';
        Required_ProductCaption_Control1102154085Lbl : Label 'Required Product';
        Requirerd_QuantityCaption_Control1102154086Lbl : Label 'Requirerd Quantity';
        No_Caption_Control1102154188Lbl : Label 'No.';
        DescriptionCaption_Control1102154189Lbl : Label 'Description';
        Required_QTYCaption_Control1102154190Lbl : Label 'Required QTY';
        Qty_At_StoresCaption_Control1102154192Lbl : Label 'Qty At Stores';
        Overall_ShortageCaption_Control1102154193Lbl : Label 'Overall Shortage';
        Qty__On_Purchase_OrderCaption_Control1102154194Lbl : Label 'Qty. On Purchase Order';
        Qty__Under_InspectionCaption_Control1102154195Lbl : Label 'Qty. Under Inspection';
        ShortageCaption_Control1102154196Lbl : Label 'Shortage';
        Required_ProductCaption_Control1102154096Lbl : Label 'Required Product';
        Requirerd_QuantityCaption_Control1102154098Lbl : Label 'Requirerd Quantity';
        No_Caption_Control1102154197Lbl : Label 'No.';
        DescriptionCaption_Control1102154198Lbl : Label 'Description';
        Required_QTYCaption_Control1102154199Lbl : Label 'Required QTY';
        Qty_At_StoresCaption_Control1102154201Lbl : Label 'Qty At Stores';
        Overall_ShortageCaption_Control1102154202Lbl : Label 'Overall Shortage';
        Qty__On_Purchase_OrderCaption_Control1102154203Lbl : Label 'Qty. On Purchase Order';
        Qty__Under_InspectionCaption_Control1102154204Lbl : Label 'Qty. Under Inspection';
        ShortageCaption_Control1102154205Lbl : Label 'Shortage';
        Required_ProductCaption_Control1102154225Lbl : Label 'Required Product';
        Requirerd_QuantityCaption_Control1102154227Lbl : Label 'Requirerd Quantity';
        No_Caption_Control1102154206Lbl : Label 'No.';
        DescriptionCaption_Control1102154207Lbl : Label 'Description';
        Required_QTYCaption_Control1102154208Lbl : Label 'Required QTY';
        Qty_At_StoresCaption_Control1102154210Lbl : Label 'Qty At Stores';
        Overall_ShortageCaption_Control1102154211Lbl : Label 'Overall Shortage';
        Qty__On_Purchase_OrderCaption_Control1102154212Lbl : Label 'Qty. On Purchase Order';
        Qty__Under_InspectionCaption_Control1102154213Lbl : Label 'Qty. Under Inspection';
        ShortageCaption_Control1102154214Lbl : Label 'Shortage';
        Required_ProductCaption_Control1102154237Lbl : Label 'Required Product';
        Requirerd_QuantityCaption_Control1102154239Lbl : Label 'Requirerd Quantity';
        No_Caption_Control1102154215Lbl : Label 'No.';
        DescriptionCaption_Control1102154216Lbl : Label 'Description';
        Required_QTYCaption_Control1102154217Lbl : Label 'Required QTY';
        Qty_At_StoresCaption_Control1102154219Lbl : Label 'Qty At Stores';
        Overall_ShortageCaption_Control1102154220Lbl : Label 'Overall Shortage';
        Qty__On_Purchase_OrderCaption_Control1102154290Lbl : Label 'Qty. On Purchase Order';
        Qty__Under_InspectionCaption_Control1102154291Lbl : Label 'Qty. Under Inspection';
        ShortageCaption_Control1102154292Lbl : Label 'Shortage';
        Required_ProductCaption_Control1102154249Lbl : Label 'Required Product';
        Requirerd_QuantityCaption_Control1102154251Lbl : Label 'Requirerd Quantity';
        No_Caption_Control1102154293Lbl : Label 'No.';
        DescriptionCaption_Control1102154294Lbl : Label 'Description';
        Required_QTYCaption_Control1102154295Lbl : Label 'Required QTY';
        Qty_At_StoresCaption_Control1102154297Lbl : Label 'Qty At Stores';
        Overall_ShortageCaption_Control1102154298Lbl : Label 'Overall Shortage';
        Qty__On_Purchase_OrderCaption_Control1102154299Lbl : Label 'Qty. On Purchase Order';
        Qty__Under_InspectionCaption_Control1102154300Lbl : Label 'Qty. Under Inspection';
        ShortageCaption_Control1102154301Lbl : Label 'Shortage';
        Required_ProductCaption_Control1102154254Lbl : Label 'Required Product';
        Requirerd_QuantityCaption_Control1102154256Lbl : Label 'Requirerd Quantity';
        No_Caption_Control1102154302Lbl : Label 'No.';
        DescriptionCaption_Control1102154303Lbl : Label 'Description';
        Required_QTYCaption_Control1102154304Lbl : Label 'Required QTY';
        Qty_At_StoresCaption_Control1102154306Lbl : Label 'Qty At Stores';
        Overall_ShortageCaption_Control1102154307Lbl : Label 'Overall Shortage';
        Qty__On_Purchase_OrderCaption_Control1102154308Lbl : Label 'Qty. On Purchase Order';
        Qty__Under_InspectionCaption_Control1102154309Lbl : Label 'Qty. Under Inspection';
        ShortageCaption_Control1102154310Lbl : Label 'Shortage';
        Required_ProductCaption_Control1102154259Lbl : Label 'Required Product';
        Requirerd_QuantityCaption_Control1102154261Lbl : Label 'Requirerd Quantity';
        No_Caption_Control1102154311Lbl : Label 'No.';
        DescriptionCaption_Control1102154312Lbl : Label 'Description';
        Required_QTYCaption_Control1102154313Lbl : Label 'Required QTY';
        Qty_At_StoresCaption_Control1102154315Lbl : Label 'Qty At Stores';
        Overall_ShortageCaption_Control1102154316Lbl : Label 'Overall Shortage';
        Qty__On_Purchase_OrderCaption_Control1102154317Lbl : Label 'Qty. On Purchase Order';
        Qty__Under_InspectionCaption_Control1102154318Lbl : Label 'Qty. Under Inspection';
        ShortageCaption_Control1102154384Lbl : Label 'Shortage';
        Required_ProductCaption_Control1102154264Lbl : Label 'Required Product';
        Requirerd_QuantityCaption_Control1102154266Lbl : Label 'Requirerd Quantity';
        No_Caption_Control1102154385Lbl : Label 'No.';
        DescriptionCaption_Control1102154386Lbl : Label 'Description';
        Required_QTYCaption_Control1102154387Lbl : Label 'Required QTY';
        Qty_At_StoresCaption_Control1102154389Lbl : Label 'Qty At Stores';
        Overall_ShortageCaption_Control1102154390Lbl : Label 'Overall Shortage';
        Qty__On_Purchase_OrderCaption_Control1102154391Lbl : Label 'Qty. On Purchase Order';
        Qty__Under_InspectionCaption_Control1102154392Lbl : Label 'Qty. Under Inspection';
        ShortageCaption_Control1102154393Lbl : Label 'Shortage';
        Required_ProductCaption_Control1102154269Lbl : Label 'Required Product';
        Requirerd_QuantityCaption_Control1102154271Lbl : Label 'Requirerd Quantity';
        No_Caption_Control1102154394Lbl : Label 'No.';
        DescriptionCaption_Control1102154395Lbl : Label 'Description';
        Required_QTYCaption_Control1102154396Lbl : Label 'Required QTY';
        Qty_At_StoresCaption_Control1102154398Lbl : Label 'Qty At Stores';
        Overall_ShortageCaption_Control1102154399Lbl : Label 'Overall Shortage';
        Qty__On_Purchase_OrderCaption_Control1102154400Lbl : Label 'Qty. On Purchase Order';
        Qty__Under_InspectionCaption_Control1102154401Lbl : Label 'Qty. Under Inspection';
        ShortageCaption_Control1102154402Lbl : Label 'Shortage';
        Required_ProductCaption_Control1102154274Lbl : Label 'Required Product';
        Requirerd_QuantityCaption_Control1102154276Lbl : Label 'Requirerd Quantity';
        No_Caption_Control1102154403Lbl : Label 'No.';
        DescriptionCaption_Control1102154404Lbl : Label 'Description';
        Required_QTYCaption_Control1102154405Lbl : Label 'Required QTY';
        Qty_At_StoresCaption_Control1102154407Lbl : Label 'Qty At Stores';
        Overall_ShortageCaption_Control1102154408Lbl : Label 'Overall Shortage';
        Qty__On_Purchase_OrderCaption_Control1102154409Lbl : Label 'Qty. On Purchase Order';
        Qty__Under_InspectionCaption_Control1102154410Lbl : Label 'Qty. Under Inspection';
        ShortageCaption_Control1102154411Lbl : Label 'Shortage';
        Required_ProductCaption_Control1102154279Lbl : Label 'Required Product';
        Requirerd_QuantityCaption_Control1102154281Lbl : Label 'Requirerd Quantity';
        No_Caption_Control1102154412Lbl : Label 'No.';
        DescriptionCaption_Control1102154413Lbl : Label 'Description';
        Required_QTYCaption_Control1102154414Lbl : Label 'Required QTY';
        Qty_At_StoresCaption_Control1102154416Lbl : Label 'Qty At Stores';
        Overall_ShortageCaption_Control1102154417Lbl : Label 'Overall Shortage';
        Qty__On_Purchase_OrderCaption_Control1102154418Lbl : Label 'Qty. On Purchase Order';
        Qty__Under_InspectionCaption_Control1102154419Lbl : Label 'Qty. Under Inspection';
        ShortageCaption_Control1102154420Lbl : Label 'Shortage';
        Required_ProductCaption_Control1102154328Lbl : Label 'Required Product';
        Requirerd_QuantityCaption_Control1102154330Lbl : Label 'Requirerd Quantity';
        No_Caption_Control1102154331Lbl : Label 'No.';
        DescriptionCaption_Control1102154332Lbl : Label 'Description';
        Required_QTYCaption_Control1102154333Lbl : Label 'Required QTY';
        Qty_At_StoresCaption_Control1102154437Lbl : Label 'Qty At Stores';
        Overall_ShortageCaption_Control1102154438Lbl : Label 'Overall Shortage';
        Qty__On_Purchase_OrderCaption_Control1102154439Lbl : Label 'Qty. On Purchase Order';
        Qty__Under_InspectionCaption_Control1102154440Lbl : Label 'Qty. Under Inspection';
        ShortageCaption_Control1102154441Lbl : Label 'Shortage';
        Required_ProductCaption_Control1102154444Lbl : Label 'Required Product';
        Requirerd_QuantityCaption_Control1102154446Lbl : Label 'Requirerd Quantity';
        No_Caption_Control1102154495Lbl : Label 'No.';
        DescriptionCaption_Control1102154496Lbl : Label 'Description';
        Required_QTYCaption_Control1102154497Lbl : Label 'Required QTY';
        Qty_At_StoresCaption_Control1102154499Lbl : Label 'Qty At Stores';
        Overall_ShortageCaption_Control1102154500Lbl : Label 'Overall Shortage';
        Qty__On_Purchase_OrderCaption_Control1102154501Lbl : Label 'Qty. On Purchase Order';
        Qty__Under_InspectionCaption_Control1102154502Lbl : Label 'Qty. Under Inspection';
        ShortageCaption_Control1102154503Lbl : Label 'Shortage';
        Required_ProductCaption_Control1102154449Lbl : Label 'Required Product';
        Requirerd_QuantityCaption_Control1102154451Lbl : Label 'Requirerd Quantity';
        No_Caption_Control1102154504Lbl : Label 'No.';
        DescriptionCaption_Control1102154505Lbl : Label 'Description';
        Required_QTYCaption_Control1102154506Lbl : Label 'Required QTY';
        Qty_At_StoresCaption_Control1102154508Lbl : Label 'Qty At Stores';
        Overall_ShortageCaption_Control1102154509Lbl : Label 'Overall Shortage';
        Qty__On_Purchase_OrderCaption_Control1102154510Lbl : Label 'Qty. On Purchase Order';
        Qty__Under_InspectionCaption_Control1102154511Lbl : Label 'Qty. Under Inspection';
        ShortageCaption_Control1102154512Lbl : Label 'Shortage';
        Required_ProductCaption_Control1102154459Lbl : Label 'Required Product';
        Requirerd_QuantityCaption_Control1102154461Lbl : Label 'Requirerd Quantity';
        No_Caption_Control1102154513Lbl : Label 'No.';
        DescriptionCaption_Control1102154514Lbl : Label 'Description';
        Required_QTYCaption_Control1102154515Lbl : Label 'Required QTY';
        Qty_At_StoresCaption_Control1102154517Lbl : Label 'Qty At Stores';
        Overall_ShortageCaption_Control1102154518Lbl : Label 'Overall Shortage';
        Qty__On_Purchase_OrderCaption_Control1102154519Lbl : Label 'Qty. On Purchase Order';
        Qty__Under_InspectionCaption_Control1102154520Lbl : Label 'Qty. Under Inspection';
        ShortageCaption_Control1102154521Lbl : Label 'Shortage';
        Required_ProductCaption_Control1102154469Lbl : Label 'Required Product';
        Requirerd_QuantityCaption_Control1102154471Lbl : Label 'Requirerd Quantity';
        No_Caption_Control1102154522Lbl : Label 'No.';
        DescriptionCaption_Control1102154523Lbl : Label 'Description';
        Required_QTYCaption_Control1102154524Lbl : Label 'Required QTY';
        Qty_At_StoresCaption_Control1102154526Lbl : Label 'Qty At Stores';
        Overall_ShortageCaption_Control1102154527Lbl : Label 'Overall Shortage';
        Qty__On_Purchase_OrderCaption_Control1102154528Lbl : Label 'Qty. On Purchase Order';
        Qty__Under_InspectionCaption_Control1102154529Lbl : Label 'Qty. Under Inspection';
        ShortageCaption_Control1102154530Lbl : Label 'Shortage';
        Required_ProductCaption_Control1102154474Lbl : Label 'Required Product';
        Requirerd_QuantityCaption_Control1102154476Lbl : Label 'Requirerd Quantity';
        No_Caption_Control1102154531Lbl : Label 'No.';
        DescriptionCaption_Control1102154532Lbl : Label 'Description';
        Required_QTYCaption_Control1102154533Lbl : Label 'Required QTY';
        Qty_At_StoresCaption_Control1102154535Lbl : Label 'Qty At Stores';
        Overall_ShortageCaption_Control1102154536Lbl : Label 'Overall Shortage';
        Qty__On_Purchase_OrderCaption_Control1102154537Lbl : Label 'Qty. On Purchase Order';
        Qty__Under_InspectionCaption_Control1102154538Lbl : Label 'Qty. Under Inspection';
        ShortageCaption_Control1102154539Lbl : Label 'Shortage';
        Required_ProductCaption_Control1102154479Lbl : Label 'Required Product';
        Requirerd_QuantityCaption_Control1102154481Lbl : Label 'Requirerd Quantity';
        No_Caption_Control1102154540Lbl : Label 'No.';
        DescriptionCaption_Control1102154541Lbl : Label 'Description';
        Required_QTYCaption_Control1102154542Lbl : Label 'Required QTY';
        Qty_At_StoresCaption_Control1102154544Lbl : Label 'Qty At Stores';
        Overall_ShortageCaption_Control1102154545Lbl : Label 'Overall Shortage';
        Qty__On_Purchase_OrderCaption_Control1102154546Lbl : Label 'Qty. On Purchase Order';
        Qty__Under_InspectionCaption_Control1102154547Lbl : Label 'Qty. Under Inspection';
        ShortageCaption_Control1102154548Lbl : Label 'Shortage';
        Required_ProductCaption_Control1102154484Lbl : Label 'Required Product';
        Requirerd_QuantityCaption_Control1102154486Lbl : Label 'Requirerd Quantity';
        No_Caption_Control1102154549Lbl : Label 'No.';
        DescriptionCaption_Control1102154550Lbl : Label 'Description';
        Required_QTYCaption_Control1102154551Lbl : Label 'Required QTY';
        Qty_At_StoresCaption_Control1102154553Lbl : Label 'Qty At Stores';
        Overall_ShortageCaption_Control1102154554Lbl : Label 'Overall Shortage';
        Qty__On_Purchase_OrderCaption_Control1102154555Lbl : Label 'Qty. On Purchase Order';
        Qty__Under_InspectionCaption_Control1102154556Lbl : Label 'Qty. Under Inspection';
        ShortageCaption_Control1102154557Lbl : Label 'Shortage';
        Required_ProductCaption_Control1102154454Lbl : Label 'Required Product';
        Requirerd_QuantityCaption_Control1102154456Lbl : Label 'Requirerd Quantity';
        No_Caption_Control1102154487Lbl : Label 'No.';
        DescriptionCaption_Control1102154488Lbl : Label 'Description';
        Required_QTYCaption_Control1102154489Lbl : Label 'Required QTY';
        Qty_At_StoresCaption_Control1102154491Lbl : Label 'Qty At Stores';
        Overall_ShortageCaption_Control1102154492Lbl : Label 'Overall Shortage';
        Qty__On_Purchase_OrderCaption_Control1102154493Lbl : Label 'Qty. On Purchase Order';
        Qty__Under_InspectionCaption_Control1102154494Lbl : Label 'Qty. Under Inspection';
        ShortageCaption_Control1102154558Lbl : Label 'Shortage';
        Required_ProductCaption_Control1102154464Lbl : Label 'Required Product';
        Requirerd_QuantityCaption_Control1102154466Lbl : Label 'Requirerd Quantity';
        No_Caption_Control1102154611Lbl : Label 'No.';
        DescriptionCaption_Control1102154612Lbl : Label 'Description';
        Required_QTYCaption_Control1102154613Lbl : Label 'Required QTY';
        Qty_At_StoresCaption_Control1102154615Lbl : Label 'Qty At Stores';
        Overall_ShortageCaption_Control1102154616Lbl : Label 'Overall Shortage';
        Qty__On_Purchase_OrderCaption_Control1102154617Lbl : Label 'Qty. On Purchase Order';
        Qty__Under_InspectionCaption_Control1102154618Lbl : Label 'Qty. Under Inspection';
        ShortageCaption_Control1102154619Lbl : Label 'Shortage';
        Required_ProductCaption_Control1102154631Lbl : Label 'Required Product';
        Requirerd_QuantityCaption_Control1102154633Lbl : Label 'Requirerd Quantity';
        No_Caption_Control1102154634Lbl : Label 'No.';
        DescriptionCaption_Control1102154635Lbl : Label 'Description';
        Required_QTYCaption_Control1102154636Lbl : Label 'Required QTY';
        Qty_At_StoresCaption_Control1102154638Lbl : Label 'Qty At Stores';
        Overall_ShortageCaption_Control1102154639Lbl : Label 'Overall Shortage';
        Qty__On_Purchase_OrderCaption_Control1102154640Lbl : Label 'Qty. On Purchase Order';
        Qty__Under_InspectionCaption_Control1102154641Lbl : Label 'Qty. Under Inspection';
        ShortageCaption_Control1102154642Lbl : Label 'Shortage';
        Item_Shortage_List_CaptionLbl : Label '"Item Shortage List "';
        Required_BOM_CaptionLbl : Label '"Required BOM "';
        Item_No_Caption_Control1000000043Lbl : Label 'Item No.';
        DescriptionCaption_Control1000000046Lbl : Label 'Description';
        ShortageCaption_Control1000000047Lbl : Label 'Shortage';
        Qty__On_Purchase_OrderCaption_Control1000000053Lbl : Label 'Qty. On Purchase Order';
        Qty__Under_InspectionCaption_Control1000000054Lbl : Label 'Qty. Under Inspection';
        Lead_TimeCaptionLbl : Label 'Lead Time';
        Required_QuantityCaptionLbl : Label 'Required Quantity';
        Qty__At_StoresCaptionLbl : Label 'Qty. At Stores';
        Expected_DateCaptionLbl : Label 'Expected Date';
        ProdOrderCompGrpFooter1 : Boolean;
        Int1Body3 : Boolean;
        Int2Body3 : Boolean;
        Int3Body3 : Boolean;
        Int4Body3 : Boolean;
        Int5Body3 : Boolean;
        Int6Body3 : Boolean;
        Int7Body3 : Boolean;
        Int8Body3 : Boolean;
        Int9Body3 : Boolean;
        Int10Body3 : Boolean;
        Int11Body3 : Boolean;
        Int12Body3 : Boolean;
        Int13Body3 : Boolean;

    [LineStart(15235)]
    procedure "Enter Cell"(RowNo : Integer;ColumnNo : Integer;CellValue : Text[250];Bold : Boolean);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.",RowNo);
        TempExcelBuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelBuffer."Cell Value as Text" := CellValue;
        TempExcelBuffer.Bold:=Bold ;
        TempExcelBuffer.INSERT;
    end;

    [LineStart(15243)]
    procedure "Enter Headings"(RowNo : Integer;ColumnNo : Integer;CellValue : Text[250];Bold : Boolean);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.",RowNo);
        TempExcelBuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelBuffer."Cell Value as Text" := FORMAT(CellValue);
        TempExcelBuffer.Bold:=Bold ;
        TempExcelBuffer.Formula := '';
        TempExcelBuffer.INSERT;
    end;

    [LineStart(15252)]
    procedure Product_Requirement("Product_No." : Integer;"Item_No." : Code[50];Prod_QTY : Integer;"BOM_QTY(Compound)" : Decimal;"BOM_QTY(Line)" : Decimal;BOM_QTY : Decimal);
    var
        TOT : Decimal;
    begin
            TOT :=Prod_QTY*"BOM_QTY(Compound)"*"BOM_QTY(Line)"*BOM_QTY;
            IF NOT(BOM_DUM["Product_No."].GET("Item_No.")) THEN
            BEGIN
            //  Item.SETFILTER(Item."No.","Item_No.");
              ItemNumber:="Item_No.";
              Item.SETRANGE(Item."No.",ItemNumber);

              IF Item.FIND('-') THEN
              BEGIN
                BOM_DUM["Product_No."].INIT;
                BOM_DUM["Product_No."]."No.":=Item."No.";
                BOM_DUM["Product_No."].Description:=Item.Description;
                BOM_DUM["Product_No."]."Standard Cost":=Item."Standard Cost" ;
                BOM_DUM["Product_No."]."Unit Cost":=Item."Quantity Under Inspection";
                BOM_DUM["Product_No."]."Base Unit of Measure":=Item."Base Unit of Measure";
                BOM_DUM["Product_No."]."Avg Unit Cost":=Item."Avg Unit Cost";
                BOM_DUM["Product_No."]."Budget Quantity"+=TOT;
                BOM_DUM["Product_No."].INSERT;
                      ItemLedgEntry.SETCURRENTKEY("Item No.","Variant Code",Open,Positive,"Location Code","Posting Date",
                      "Expiration Date","Lot No.","Serial No.");

                ItemLedgEntry.SETRANGE(ItemLedgEntry."Item No.",Item."No.");
                ItemLedgEntry.SETFILTER(ItemLedgEntry."Location Code",'MCH');
                ItemLedgEntry.SETFILTER(ItemLedgEntry."Remaining Quantity",'>%1',0);
                IF ItemLedgEntry.FIND('-') THEN
                REPEAT
                  BOM_DUM["Product_No."]."Stock at Stores"+=ItemLedgEntry."Remaining Quantity";
                UNTIL ItemLedgEntry.NEXT=0;

              END;
            END ELSE
            BEGIN

              BOM_DUM["Product_No."]."Budget Quantity"+=TOT;
              BOM_DUM["Product_No."].MODIFY;
            END;
    end;

    [LineStart(15290)]
    procedure Overall_Requirement("Item_No." : Code[50];Prod_QTY : Integer;"BOM_QTY(Compound)" : Decimal;"BOM_QTY(Line)" : Decimal;BOM_QTY : Decimal);
    var
        TOT : Decimal;
    begin
              TOT:=Prod_QTY*"BOM_QTY(Compound)"*"BOM_QTY(Line)"*BOM_QTY;
              Item.RESET;
              IF NOT( Dum.GET("Item_No.") ) THEN
              BEGIN
               // Item.SETFILTER(Item."No.","Item_No.");
              ItemNumber:="Item_No.";
              Item.SETRANGE(Item."No.",ItemNumber);
                IF Item.FIND('-') THEN
                BEGIN
                  Item.CALCFIELDS(Item."Inventory at Stores",Item."Qty. on Purch. Order",Item."Quantity Under Inspection");
                  Dum.INIT;
                  Dum."No.":=Item."No.";
                  Dum.Description:=Item.Description;
                  //Dum."Standard Cost":=Item."Qty. on Purch. Order";
                  PL.RESET;
                  PL.SETFILTER(PL."Document Type",'Order');
                  PL.SETFILTER(PL."No.",Item."No.");
                  PL.SETFILTER(PL."Location Code",'STR');
                  PL.SETFILTER(PL."Outstanding Qty. (Base)",'>%1',0);
                  IF PL.FIND('-') THEN
                  REPEAT
                    Dum."Standard Cost":=Dum."Standard Cost"+PL."Outstanding Qty. (Base)";
                  UNTIL PL.NEXT=0;
                  Dum."Unit Cost":=Item."Quantity Under Inspection";
                  Stock:=0;
                  Item.CALCFIELDS(Item."Quantity Under Inspection",Item."Quantity Rejected",Item."Quantity Rework",
                  Item."Quantity Sent for Rework",Item."Inventory at Stores",Item."Stock at PROD Stores");
                  IF Item."QC Enabled" = TRUE THEN
                  BEGIN
                    IF (Item."Quantity Under Inspection"=0)AND (Item."Quantity Rejected"=0) AND
                         (Item."Quantity Rework"=0) AND (Item."Quantity Sent for Rework"=0) THEN
                    BEGIN
                      ItemLedgEntry.RESET;
                      ItemLedgEntry.SETCURRENTKEY("Item No.","Variant Code",Open,Positive,"Location Code","Posting Date",
                      "Expiration Date","Lot No.","Serial No.");
                      ItemLedgEntry.SETRANGE("Item No.",Item."No.");
                      ItemLedgEntry.SETRANGE(Open,TRUE);
                      ItemLedgEntry.SETRANGE("Location Code",'STR');
                      IF ItemLedgEntry.FIND('-') THEN
                      REPEAT
                        Stock+=ItemLedgEntry."Remaining Quantity";
                      UNTIL ItemLedgEntry.NEXT=0;
                    END ELSE
                    BEGIN
                      Stock:=0 ;
                      ItemLedgEntry.RESET;
                      ItemLedgEntry.SETCURRENTKEY("Item No.","Variant Code",Open,Positive,"Location Code","Posting Date",
                      "Expiration Date","Lot No.","Serial No.");
                      ItemLedgEntry.SETRANGE("Item No.",Item."No.");
                      ItemLedgEntry.SETRANGE(Open,TRUE);
                      ItemLedgEntry.SETRANGE("Location Code",'STR');
                      IF ItemLedgEntry.FIND('-')THEN
                      REPEAT
                        ItemLedgEntry.MARK(TRUE);
                        IF (QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.") AND (QualityItemLedgEntry."Inspection Status"=
                               QualityItemLedgEntry."Inspection Status"::"0")) OR
                               (QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.")
                               AND (QualityItemLedgEntry."Inspection Status"=QualityItemLedgEntry."Inspection Status"::"1")) THEN
                        ItemLedgEntry.MARK(FALSE);

                      UNTIL ItemLedgEntry.NEXT=0;
                    END;
                  END;
                  ItemLedgEntry.MARKEDONLY(TRUE);
                  IF ItemLedgEntry.FIND('-')THEN
                  REPEAT
                    Stock:=Stock+ItemLedgEntry."Remaining Quantity";
                  UNTIL ItemLedgEntry.NEXT=0;

                  Dum."Budget Quantity"+=TOT;
                  Dum."Maximum Inventory":=Stock+Item."Stock at PROD Stores";
                  Dum."Product Group Code":=Item."Product Group Code";
                  Dum."Safety Lead Time":=Item."Safety Lead Time";
                  Dum."Avg Unit Cost":=Item."Avg Unit Cost";
                  Dum."Base Unit of Measure":=Item."Base Unit of Measure";
                ItemLedgEntry1.SETCURRENTKEY("Item No.","Variant Code",Open,Positive,"Location Code","Posting Date",
                      "Expiration Date","Lot No.","Serial No.");

                ItemLedgEntry1.SETRANGE(ItemLedgEntry1."Item No.",Item."No.");
                ItemLedgEntry1.SETFILTER(ItemLedgEntry1."Location Code",'MCH');
                ItemLedgEntry1.SETFILTER(ItemLedgEntry1."Remaining Quantity",'>%1',0);
                IF ItemLedgEntry1.FIND('-') THEN
                REPEAT

                  Dum."Stock at Stores"+=ItemLedgEntry1."Remaining Quantity";
                UNTIL ItemLedgEntry1.NEXT=0;

                  Dum.INSERT;

                END;
              END ELSE
              BEGIN
                IF Dum.GET("Item_No.") THEN
                BEGIN
                  Dum."Budget Quantity"+=TOT;
                  Dum.MODIFY;
                END;
              END;
    end;

    [LineStart(15390)]
    procedure Caliculate_Product_Shortage("Product No." : Integer);
    begin
        BOM_DUM["Product No."].SETFILTER(BOM_DUM["Product No."]."Budget Quantity",'>%1',0);
        BOM_DUM["Product No."].SETFILTER(BOM_DUM["Product No."]."Product Group Code",'<>%1','CPCB');
        IF BOM_DUM["Product No."].FIND('-') THEN
        BEGIN
         REPEAT
           IF Dum.GET(BOM_DUM["Product No."]."No.") THEN
           BEGIN

            IF Dum."Maximum Inventory">BOM_DUM["Product No."]."Budget Quantity"  THEN
             BEGIN
               Dum."Maximum Inventory":=Dum."Maximum Inventory"-BOM_DUM["Product No."]."Budget Quantity" ;
               BOM_DUM["Product No."]."Reorder Quantity":=0;
               Dum.MODIFY;
               BOM_DUM["Product No."].MODIFY;
             END ELSE
             BEGIN
                 BOM_DUM["Product No."]."Reorder Quantity" +=BOM_DUM["Product No."]."Budget Quantity";
                 Dum."Reorder Quantity"+=BOM_DUM["Product No."]."Budget Quantity";

               BOM_DUM["Product No."].MODIFY;
               Dum.MODIFY;

              END;
            END;
        UNTIL BOM_DUM["Product No."].NEXT=0;
        END;
    end;

    [LineStart(15418)]
    procedure DUplicate("Item_No." : Code[50];Prod_QTY : Integer;"BOM_QTY(Compound)" : Decimal;"BOM_QTY(Line)" : Decimal;BOM_QTY : Decimal);
    var
        TOT : Decimal;
    begin
            TOT :=Prod_QTY*"BOM_QTY(Compound)"*"BOM_QTY(Line)"*BOM_QTY;
            IF NOT(DUm2.GET("Item_No.")) THEN
            BEGIN
              ItemNumber:="Item_No.";
              Item.SETRANGE(Item."No.",ItemNumber);
         //  Item.SETFILTER(Item."No.","Item_No.");
              IF Item.FIND('-') THEN
              BEGIN
                DUm2.INIT;
                DUm2."No.":=Item."No.";
                DUm2.Description:=Item.Description;
                DUm2."Standard Cost":=Item."Standard Cost" ;
                DUm2."Unit Cost":=Item."Unit Cost";
                DUm2."Budget Quantity"+=TOT;
                ItemLedgEntry.SETCURRENTKEY(ItemLedgEntry."Item No.",ItemLedgEntry."Variant Code",ItemLedgEntry."Drop Shipment",
                                            ItemLedgEntry."Location Code",ItemLedgEntry."Posting Date");
                ItemLedgEntry.SETRANGE(ItemLedgEntry."Item No.",Item."No.");
                ItemLedgEntry.SETFILTER(ItemLedgEntry."Location Code",'MCH');
                ItemLedgEntry.SETFILTER(ItemLedgEntry."Remaining Quantity",'>%1',0);
                IF ItemLedgEntry.FIND('-') THEN
                REPEAT
                  Dum."Stock at Stores"+=ItemLedgEntry."Remaining Quantity";
                UNTIL ItemLedgEntry.NEXT=0;

                DUm2.INSERT;
              END;
            END ELSE
            BEGIN
                IF DUm2.GET("Item_No.") THEN
                BEGIN
                  DUm2."Budget Quantity"+=TOT;
                  DUm2.MODIFY;
                END;
            END;
    end;

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

    //event Sheet3(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet3(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet3(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet3();
    //begin
        /*
        */
    //end;

    //event Sheet3();
    //begin
        /*
        */
    //end;

    //event Sheet3();
    //begin
        /*
        */
    //end;

    //event Sheet3(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet3(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet3(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet4(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet4(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet4(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet4();
    //begin
        /*
        */
    //end;

    //event Sheet4();
    //begin
        /*
        */
    //end;

    //event Sheet4();
    //begin
        /*
        */
    //end;

    //event Sheet4(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet4(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet4(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet();
    //begin
        /*
        */
    //end;

    //event Sheet();
    //begin
        /*
        */
    //end;

    //event Sheet();
    //begin
        /*
        */
    //end;

    //event Sheet(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet5(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet5(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet5(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet5();
    //begin
        /*
        */
    //end;

    //event Sheet5();
    //begin
        /*
        */
    //end;

    //event Sheet5();
    //begin
        /*
        */
    //end;

    //event Sheet5(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet5(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet5(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet6(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet6(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet6(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet6();
    //begin
        /*
        */
    //end;

    //event Sheet6();
    //begin
        /*
        */
    //end;

    //event Sheet6();
    //begin
        /*
        */
    //end;

    //event Sheet6(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet6(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet6(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet7(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet7(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet7(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet7();
    //begin
        /*
        */
    //end;

    //event Sheet7();
    //begin
        /*
        */
    //end;

    //event Sheet7();
    //begin
        /*
        */
    //end;

    //event Sheet7(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet7(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet7(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet8(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet8(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet8(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet8();
    //begin
        /*
        */
    //end;

    //event Sheet8();
    //begin
        /*
        */
    //end;

    //event Sheet8();
    //begin
        /*
        */
    //end;

    //event Sheet8(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet8(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet8(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet9(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet9(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet9(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet9();
    //begin
        /*
        */
    //end;

    //event Sheet9();
    //begin
        /*
        */
    //end;

    //event Sheet9();
    //begin
        /*
        */
    //end;

    //event Sheet9(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet9(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet9(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet10(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet10(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet10(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet10();
    //begin
        /*
        */
    //end;

    //event Sheet10();
    //begin
        /*
        */
    //end;

    //event Sheet10();
    //begin
        /*
        */
    //end;

    //event Sheet10(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet10(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet10(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet11(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet11(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet11(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet11();
    //begin
        /*
        */
    //end;

    //event Sheet11();
    //begin
        /*
        */
    //end;

    //event Sheet11();
    //begin
        /*
        */
    //end;

    //event Sheet11(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet11(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet11(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet12(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet12(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet12(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet12();
    //begin
        /*
        */
    //end;

    //event Sheet12();
    //begin
        /*
        */
    //end;

    //event Sheet12();
    //begin
        /*
        */
    //end;

    //event Sheet12(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet12(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet12(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet13(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet13(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet13(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet13();
    //begin
        /*
        */
    //end;

    //event Sheet13();
    //begin
        /*
        */
    //end;

    //event Sheet13();
    //begin
        /*
        */
    //end;

    //event Sheet13(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet13(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet13(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet14(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet14(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet14(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet14();
    //begin
        /*
        */
    //end;

    //event Sheet14();
    //begin
        /*
        */
    //end;

    //event Sheet14();
    //begin
        /*
        */
    //end;

    //event Sheet14(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet14(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet14(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet15(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet15(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet15(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet15();
    //begin
        /*
        */
    //end;

    //event Sheet15();
    //begin
        /*
        */
    //end;

    //event Sheet15();
    //begin
        /*
        */
    //end;

    //event Sheet15(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet15(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet15(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet16(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet16(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet16(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet16();
    //begin
        /*
        */
    //end;

    //event Sheet16();
    //begin
        /*
        */
    //end;

    //event Sheet16();
    //begin
        /*
        */
    //end;

    //event Sheet16(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet16(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet16(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet17(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet17(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet17(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet17();
    //begin
        /*
        */
    //end;

    //event Sheet17();
    //begin
        /*
        */
    //end;

    //event Sheet17();
    //begin
        /*
        */
    //end;

    //event Sheet17(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet17(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet17(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet18(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet18(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet18(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet18();
    //begin
        /*
        */
    //end;

    //event Sheet18();
    //begin
        /*
        */
    //end;

    //event Sheet18();
    //begin
        /*
        */
    //end;

    //event Sheet18(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet18(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet18(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet19(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet19(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet19(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet19();
    //begin
        /*
        */
    //end;

    //event Sheet19();
    //begin
        /*
        */
    //end;

    //event Sheet19();
    //begin
        /*
        */
    //end;

    //event Sheet19(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet19(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet19(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet20(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet20(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet20(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet20();
    //begin
        /*
        */
    //end;

    //event Sheet20();
    //begin
        /*
        */
    //end;

    //event Sheet20();
    //begin
        /*
        */
    //end;

    //event Sheet20(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet20(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet20(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet21(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet21(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet21(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet21();
    //begin
        /*
        */
    //end;

    //event Sheet21();
    //begin
        /*
        */
    //end;

    //event Sheet21();
    //begin
        /*
        */
    //end;

    //event Sheet21(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet21(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet21(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet22(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet22(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet22(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet22();
    //begin
        /*
        */
    //end;

    //event Sheet22();
    //begin
        /*
        */
    //end;

    //event Sheet22();
    //begin
        /*
        */
    //end;

    //event Sheet22(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet22(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet22(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet23(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet23(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet23(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet23();
    //begin
        /*
        */
    //end;

    //event Sheet23();
    //begin
        /*
        */
    //end;

    //event Sheet23();
    //begin
        /*
        */
    //end;

    //event Sheet23(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet23(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet23(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet24(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet24(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet24(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet24();
    //begin
        /*
        */
    //end;

    //event Sheet24();
    //begin
        /*
        */
    //end;

    //event Sheet24();
    //begin
        /*
        */
    //end;

    //event Sheet24(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet24(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet24(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet25(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet25(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet25(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet25();
    //begin
        /*
        */
    //end;

    //event Sheet25();
    //begin
        /*
        */
    //end;

    //event Sheet25();
    //begin
        /*
        */
    //end;

    //event Sheet25(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet25(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet25(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet26(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet26(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet26(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet26();
    //begin
        /*
        */
    //end;

    //event Sheet26();
    //begin
        /*
        */
    //end;

    //event Sheet26();
    //begin
        /*
        */
    //end;

    //event Sheet26(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet26(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet26(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet27(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet27(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet27(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet27();
    //begin
        /*
        */
    //end;

    //event Sheet27();
    //begin
        /*
        */
    //end;

    //event Sheet27();
    //begin
        /*
        */
    //end;

    //event Sheet27(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet27(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet27(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet29(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet29(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet29(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet29();
    //begin
        /*
        */
    //end;

    //event Sheet29();
    //begin
        /*
        */
    //end;

    //event Sheet29();
    //begin
        /*
        */
    //end;

    //event Sheet29(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet29(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet29(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet28(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet28(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet28(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet28();
    //begin
        /*
        */
    //end;

    //event Sheet28();
    //begin
        /*
        */
    //end;

    //event Sheet28();
    //begin
        /*
        */
    //end;

    //event Sheet28(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet28(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet28(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet30(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet30(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet30(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet30();
    //begin
        /*
        */
    //end;

    //event Sheet30();
    //begin
        /*
        */
    //end;

    //event Sheet30();
    //begin
        /*
        */
    //end;

    //event Sheet30(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet30(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet30(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;
}

