report 50214 "Material Availability(New)"
{
    // version ESPL 1.0,Rev01

    DefaultLayout = RDLC;
    RDLCLayout = './Material Availability(New).rdlc';

    dataset
    {
        dataitem("Company Information"; "Company Information")
        {
            DataItemTableView = SORTING(Primary Key);
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(Shortage_List_ReportCaption; Shortage_List_ReportCaptionLbl)
            {
            }
            column(Company_Information_Primary_Key; "Primary Key")
            {
            }
        }
        dataitem("Production Order"; "Production Order")
        {
            DataItemTableView = SORTING(Prod Start date) ORDER(Ascending) WHERE(Prod Start date=FILTER(<>''));
            RequestFilterFields = "No.","Sales Order No.","Prod Start date","Location Code";
            column(Production_Order__Prod_Start_date_;"Prod Start date")
            {
            }
            column(Production_Order__No__;"No.")
            {
            }
            column(Production_DateCaption;Production_DateCaptionLbl)
            {
            }
            column(Project_Code__Caption;Project_Code__CaptionLbl)
            {
            }
            column(Production_Order_Status;Status)
            {
            }
            dataitem("Prod. Order Component";"Prod. Order Component")
            {
                DataItemLink = Prod. Order No.=FIELD(No.);
                DataItemTableView = SORTING(Item No.,Prod. Order No.,Prod. Order Line No.,Line No.,Status) ORDER(Ascending);
                column(Prod__Order_Component_Quantity;Quantity)
                {
                }
                column(Item_Decs;Item_Decs)
                {
                }
                column(Prod__Order_Component__Item_No__;"Item No.")
                {
                }
                column(Dum__Reorder_Quantity_;Dum."Reorder Quantity")
                {
                }
                column(Dum__Standard_Cost_;Dum."Standard Cost")
                {
                }
                column(Dum__Unit_Cost_;Dum."Unit Cost")
                {
                }
                column(Quantity_At_Stores_;"Quantity At Stores")
                {
                }
                column(Qty__Under_InspectionCaption;Qty__Under_InspectionCaptionLbl)
                {
                }
                column(Item_No_Caption;Item_No_CaptionLbl)
                {
                }
                column(DescriptionCaption;DescriptionCaptionLbl)
                {
                }
                column(Required_QTYCaption;Required_QTYCaptionLbl)
                {
                }
                column(Qty_At_StoresCaption;Qty_At_StoresCaptionLbl)
                {
                }
                column(Shortage_By_Considering_Previous_OrdersCaption;Shortage_By_Considering_Previous_OrdersCaptionLbl)
                {
                }
                column(Qty__On_Purchase_OrderCaption;Qty__On_Purchase_OrderCaptionLbl)
                {
                }
                column(No_ShortageCaption;No_ShortageCaptionLbl)
                {
                }
                column(Prod__Order_Component_Status;Status)
                {
                }
                column(Prod__Order_Component_Prod__Order_No_;"Prod. Order No.")
                {
                }
                column(Prod__Order_Component_Prod__Order_Line_No_;"Prod. Order Line No.")
                {
                }
                column(Prod__Order_Component_Line_No_;"Line No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    IF NOT( Dum.GET("Prod. Order Component"."Item No.") ) THEN
                    BEGIN
                     Item.SETFILTER(Item."No.","Prod. Order Component"."Item No.");
                     IF Item.FIND('-') THEN
                     BEGIN
                      Item.CALCFIELDS(Item."Inventory at Stores",Item."Qty. on Purch. Order",Item."Quantity Under Inspection");
                      Dum.INIT;
                      Dum."No.":=Item."No.";
                      Dum.Description:=Item.Description;
                      Dum."Standard Cost":=Item."Qty. on Purch. Order";
                      Dum."Unit Cost":=Item."Quantity Under Inspection";
                      Dum."Maximum Inventory":=Item."Stock at Stores";
                      Dum."Product Group Code":=Item."Product Group Code";
                      Dum."Safety Lead Time":=Item."Safety Lead Time";
                      Dum.INSERT;
                     END;
                    END;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                //IF "Production Order".GETFILTER("Production Order"."No.")<>'' THEN
                //BEGIN
                  DateChange:=FALSE;
                  IF "Production Order"."Prod Start date"<>Prod_date THEN
                  BEGIN
                    DateChange:=TRUE;
                    Prod_date:="Production Order"."Prod Start date";
                  END;
                  "Shortage Quantity":=0;
                //END;
            end;

            trigger OnPreDataItem();
            begin
                IF Excel AND QC_Report THEN
                TempExcelBuffer.DELETEALL;

                CurrReport.BREAK;

                //IF "Production Order".GETFILTER("Production Order"."No.")<>'' THEN
                "Production Order".SETFILTER("Production Order"."Prod Start date",'>%1',WORKDATE);
                Prod_date:="Production Order"."Prod Start date";
            end;
        }
        dataitem("Production BOM Line";"Production BOM Line")
        {
            DataItemTableView = SORTING(Type,No.) ORDER(Ascending);
            column(Future_ProjectionCaption;Future_ProjectionCaptionLbl)
            {
            }
            column(Production_BOM_Line_Production_BOM_No_;"Production BOM No.")
            {
            }
            column(Production_BOM_Line_Version_Code;"Version Code")
            {
            }
            column(Production_BOM_Line_Line_No_;"Line No.")
            {
            }
            column(Production_BOM_Line_No_;"No.")
            {
            }

            trigger OnPreDataItem();
            begin
                IF Item.FIND('-') THEN
                REPEAT
                IF NOT  Item1.GET(Item."No.") THEN
                      Item1.INIT;
                        Item1."No.":=Item."No.";
                        Item1.Description:=Item.Description;
                        Item1."Unit Cost":=Item."Unit Cost";
                       Item1.INSERT;
                UNTIL Item.NEXT=0;
                
                /*Item1.
                IF Item1.FIND('-') THEN
                REPEAT
                
                UNTIL Item1.NEXT=0;
                */
                FOR I:=1 TO 27 DO
                IF BOM[I] <>'' THEN
                BEGIN
                PBMV.SETRANGE(PBMV."Production BOM No.",BOM[I]);
                PBMV.SETRANGE(PBMV.Status,PBMV.Status::Certified);
                IF PBMV.FIND('+') THEN
                BEGIN
                
                 Version1:=PBMV."Version Code";
                
                END;
                pbml.SETRANGE(pbml."Production BOM No.",BOM[I]);
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
                       IF      Item1.GET(PBML3."No.") THEN
                
                          BEGIN
                          Item1.MARK(TRUE);
                          Item1.MODIFY;
                          END;
                
                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                
                        IF  Item1.GET(PBML2."No.") THEN
                          BEGIN
                          Item1.MARK(TRUE);
                          Item1.MODIFY;
                          END;
                
                
                
                      END;
                  UNTIL  PBML2.NEXT=0;
                  END ELSE
                  BEGIN
                
                        IF  Item1.GET(pbml."No.") THEN
                
                          BEGIN
                          Item1.MARK(TRUE);
                          Item1.MODIFY;
                          END;
                
                
                  END;
                UNTIL  pbml.NEXT=0;
                END;
                
                IF Excel THEN
                BEGIN
                  //Excel1.Workbooks.Add();//B2B
                  //Sheet1:= Excel1.ActiveSheet;
                  Sheet1.Name :='BOM';
                  Sheet1.Range('a1').Value :='ITEM No.';
                  Sheet1.Range('b1').Value :='ITEM Description';
                  Sheet1.Range('c1').Value :='Unit Cost';
                  Row:=1;
                Item1.MARKEDONLY(TRUE);
                IF Item1.FIND('-') THEN
                REPEAT
                Row+=1 ;
                  Sheet1.Range('a'+FORMAT(Row)).Value :=Item1."No." ;
                  Sheet1.Range('b'+FORMAT(Row)).Value :=Item1.Description ;
                  Sheet1.Range('c'+FORMAT(Row)).Value :=Item1."Unit Cost" ;
                UNTIL Item1.NEXT=0;
                
                
                END;
                
                CurrReport.BREAK;

            end;
        }
        dataitem("<Integer1>";"Integer")
        {
            DataItemTableView = SORTING(Number);
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
                IF "Break" THEN
                CurrReport.BREAK ;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[1]='' THEN
                CurrReport.BREAK;
                Item1.MARKEDONLY(TRUE);
                IF Item1.FIND('-') THEN
                REPEAT
                      ItemNumber:=Item1."No.";
                      Item.SETRANGE(Item."No.",ItemNumber);

                      IF Item.FIND('-') THEN
                      BEGIN
                        BOM_DUM[1].INIT;
                        BOM_DUM[1]."No.":=Item."No.";
                        BOM_DUM[1].Description:=Item.Description;
                        BOM_DUM[1]."Standard Cost":=Item."Standard Cost" ;
                        BOM_DUM[1]."Unit Cost":=Item."Quantity Under Inspection";
                        BOM_DUM[1]."Base Unit of Measure":=Item."Base Unit of Measure";
                        BOM_DUM[1]."Avg Unit Cost":=Item."Avg Unit Cost";
                        BOM_DUM[1]."Budget Quantity":=0;
                        BOM_DUM[1].INSERT;
                       END;
                UNTIL Item1.NEXT=0;
                PROD_QTY:= QTY[1];
                PROD_NO:=1;

                BOMName:=BOM[PROD_NO];


                IF Excel THEN
                //Sheet1:= Excel1.ActiveSheet;//B2B

                PBMV.SETRANGE(PBMV."Production BOM No.",BOM[PROD_NO]);
                PBMV.SETRANGE(PBMV.Status,PBMV.Status::Certified);
                IF PBMV.FIND('+') THEN
                BEGIN

                 Version1:=PBMV."Version Code";

                END;

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

                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;
                  END ELSE
                  BEGIN

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;




                "Break":=FALSE;
                IF BOM_DUM[1].FIND('-') THEN
            end;
        }
        dataitem("<Integer2>";"Integer")
        {
            DataItemTableView = SORTING(Number);
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
                IF "Break" THEN
                CurrReport.BREAK ;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[2]='' THEN
                CurrReport.BREAK;
                CLEAR(BOM_DUM[1]);
                BOM_DUM[1].DELETEALL;
                TempExcelBuffer.DELETEALL;
                Item1.MARKEDONLY(TRUE);
                IF Item1.FIND('-') THEN
                REPEAT
                      ItemNumber:=Item1."No.";
                      Item.SETRANGE(Item."No.",ItemNumber);

                      IF Item.FIND('-') THEN
                      BEGIN
                        BOM_DUM[2].INIT;
                        BOM_DUM[2]."No.":=Item."No.";
                        BOM_DUM[2].Description:=Item.Description;
                        BOM_DUM[2]."Standard Cost":=Item."Standard Cost" ;
                        BOM_DUM[2]."Unit Cost":=Item."Quantity Under Inspection";
                        BOM_DUM[2]."Base Unit of Measure":=Item."Base Unit of Measure";
                        BOM_DUM[2]."Avg Unit Cost":=Item."Avg Unit Cost";
                        BOM_DUM[2]."Budget Quantity":=0;
                        BOM_DUM[2].INSERT;
                       END;
                UNTIL Item1.NEXT=0;




                PROD_QTY:= QTY[2];
                PROD_NO:=2;


                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                 // Excel1.Worksheets.Add;
                //  Sheet2 := Excel1.ActiveSheet;//B2B

                //  Sheet2.Name :=CONVERTSTR(BOM[2],'/',' ');
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
                          //Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(2,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        //Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(2,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;
                  END ELSE
                  BEGIN
                    //Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(2,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;




                "Break":=FALSE;

                IF BOM_DUM[2].FIND('-') THEN
            end;
        }
        dataitem("<Integer3>";"Integer")
        {
            DataItemTableView = SORTING(Number);
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
                IF "Break" THEN
                CurrReport.BREAK ;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[3]='' THEN
                CurrReport.BREAK;

                CLEAR(BOM_DUM[2]);
                BOM_DUM[2].DELETEALL;

                Item1.MARKEDONLY(TRUE);
                IF Item1.FIND('-') THEN
                REPEAT
                      ItemNumber:=Item1."No.";
                      Item.SETRANGE(Item."No.",ItemNumber);

                      IF Item.FIND('-') THEN
                      BEGIN
                        BOM_DUM[3].INIT;
                        BOM_DUM[3]."No.":=Item."No.";
                        BOM_DUM[3].Description:=Item.Description;
                        BOM_DUM[3]."Standard Cost":=Item."Standard Cost" ;
                        BOM_DUM[3]."Unit Cost":=Item."Quantity Under Inspection";
                        BOM_DUM[3]."Base Unit of Measure":=Item."Base Unit of Measure";
                        BOM_DUM[3]."Avg Unit Cost":=Item."Avg Unit Cost";
                        BOM_DUM[3]."Budget Quantity":=0;
                        BOM_DUM[3].INSERT;
                       END;
                UNTIL Item1.NEXT=0;


                PROD_QTY:= QTY[3];
                PROD_NO:=3;


                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN

                //  Sheet3 := Excel1.ActiveSheet;//B2B
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
                         // Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        //Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);
                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;
                  END ELSE
                  BEGIN
                    //Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;

                "Break":=FALSE;
                IF BOM_DUM[3].FIND('-') THEN
            end;
        }
        dataitem("<Integer4>";"Integer")
        {
            DataItemTableView = SORTING(Number);
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
                IF "Break" THEN
                CurrReport.BREAK ;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[4]='' THEN
                CurrReport.BREAK;

                CLEAR(BOM_DUM[3]);
                BOM_DUM[3].DELETEALL;

                Item1.MARKEDONLY(TRUE);
                IF Item1.FIND('-') THEN
                REPEAT
                      ItemNumber:=Item1."No.";
                      Item.SETRANGE(Item."No.",ItemNumber);

                      IF Item.FIND('-') THEN
                      BEGIN
                        BOM_DUM[4].INIT;
                        BOM_DUM[4]."No.":=Item."No.";
                        BOM_DUM[4].Description:=Item.Description;
                        BOM_DUM[4]."Standard Cost":=Item."Standard Cost" ;
                        BOM_DUM[4]."Unit Cost":=Item."Quantity Under Inspection";
                        BOM_DUM[4]."Base Unit of Measure":=Item."Base Unit of Measure";
                        BOM_DUM[4]."Avg Unit Cost":=Item."Avg Unit Cost";
                        BOM_DUM[4]."Budget Quantity":=0;
                        BOM_DUM[4].INSERT;
                       END;
                UNTIL Item1.NEXT=0;


                PROD_QTY:= QTY[4];
                PROD_NO:=4;



                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN

                //  Sheet4 := Excel1.ActiveSheet;//B2B


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
                         // Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        //Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;
                  END ELSE
                  BEGIN
                    //Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;



                "Break":=FALSE;
                IF BOM_DUM[4].FIND('-') THEN
            end;
        }
        dataitem("<Integer5>";"Integer")
        {
            DataItemTableView = SORTING(Number);
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
                IF "Break" THEN
                CurrReport.BREAK ;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[5]='' THEN
                CurrReport.BREAK;

                CLEAR(BOM_DUM[4]);
                BOM_DUM[4].DELETEALL;

                Item1.MARKEDONLY(TRUE);
                IF Item1.FIND('-') THEN
                REPEAT
                      ItemNumber:=Item1."No.";
                      Item.SETRANGE(Item."No.",ItemNumber);

                      IF Item.FIND('-') THEN
                      BEGIN
                        BOM_DUM[5].INIT;
                        BOM_DUM[5]."No.":=Item."No.";
                        BOM_DUM[5].Description:=Item.Description;
                        BOM_DUM[5]."Standard Cost":=Item."Standard Cost" ;
                        BOM_DUM[5]."Unit Cost":=Item."Quantity Under Inspection";
                        BOM_DUM[5]."Base Unit of Measure":=Item."Base Unit of Measure";
                        BOM_DUM[5]."Avg Unit Cost":=Item."Avg Unit Cost";
                        BOM_DUM[5]."Budget Quantity":=0;
                        BOM_DUM[5].INSERT;
                       END;
                UNTIL Item1.NEXT=0;


                PROD_QTY:= QTY[5];
                PROD_NO:=5;


                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN


                //  Sheet5 := Excel1.ActiveSheet;//B2B


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
                         // Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                       // Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;
                  END ELSE
                  BEGIN
                   // Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;

                "Break":=FALSE;
                IF BOM_DUM[5].FIND('-') THEN
            end;
        }
        dataitem("<Integer6>";"Integer")
        {
            DataItemTableView = SORTING(Number);
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
                IF "Break" THEN
                CurrReport.BREAK ;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[6]='' THEN
                CurrReport.BREAK;

                CLEAR(BOM_DUM[5]);
                BOM_DUM[5].DELETEALL;

                Item1.MARKEDONLY(TRUE);
                IF Item1.FIND('-') THEN
                REPEAT
                      ItemNumber:=Item1."No.";
                      Item.SETRANGE(Item."No.",ItemNumber);

                      IF Item.FIND('-') THEN
                      BEGIN
                        BOM_DUM[6].INIT;
                        BOM_DUM[6]."No.":=Item."No.";
                        BOM_DUM[6].Description:=Item.Description;
                        BOM_DUM[6]."Standard Cost":=Item."Standard Cost" ;
                        BOM_DUM[6]."Unit Cost":=Item."Quantity Under Inspection";
                        BOM_DUM[6]."Base Unit of Measure":=Item."Base Unit of Measure";
                        BOM_DUM[6]."Avg Unit Cost":=Item."Avg Unit Cost";
                        BOM_DUM[6]."Budget Quantity":=0;
                        BOM_DUM[6].INSERT;
                       END;
                UNTIL Item1.NEXT=0;


                PROD_QTY:= QTY[6];
                PROD_NO:=6;


                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN

                //  Sheet6 := Excel1.ActiveSheet;//B2B


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

                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN


                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN


                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;

                "Break":=FALSE;
                IF BOM_DUM[6].FIND('-') THEN
            end;
        }
        dataitem("<Integer7>";"Integer")
        {
            DataItemTableView = SORTING(Number);
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
                IF "Break" THEN
                CurrReport.BREAK ;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[7]='' THEN
                CurrReport.BREAK;

                CLEAR(BOM_DUM[6]);
                BOM_DUM[6].DELETEALL;

                Item1.MARKEDONLY(TRUE);
                IF Item1.FIND('-') THEN
                REPEAT
                      ItemNumber:=Item1."No.";
                      Item.SETRANGE(Item."No.",ItemNumber);

                      IF Item.FIND('-') THEN
                      BEGIN
                        BOM_DUM[7].INIT;
                        BOM_DUM[7]."No.":=Item."No.";
                        BOM_DUM[7].Description:=Item.Description;
                        BOM_DUM[7]."Standard Cost":=Item."Standard Cost" ;
                        BOM_DUM[7]."Unit Cost":=Item."Quantity Under Inspection";
                        BOM_DUM[7]."Base Unit of Measure":=Item."Base Unit of Measure";
                        BOM_DUM[7]."Avg Unit Cost":=Item."Avg Unit Cost";
                        BOM_DUM[7]."Budget Quantity":=0;
                        BOM_DUM[7].INSERT;
                       END;
                UNTIL Item1.NEXT=0;


                PROD_QTY:= QTY[7];
                PROD_NO:=7;


                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN

                //  Sheet7 := Excel1.ActiveSheet;

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
                          //Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        //Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    //Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                "Break":=FALSE;
                IF BOM_DUM[7].FIND('-') THEN
            end;
        }
        dataitem("<Integer8>";"Integer")
        {
            DataItemTableView = SORTING(Number);
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
                IF "Break" THEN
                CurrReport.BREAK ;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[8]='' THEN
                CurrReport.BREAK;
                
                CLEAR(BOM_DUM[7]);
                BOM_DUM[7].DELETEALL;
                
                Item1.MARKEDONLY(TRUE);
                IF Item1.FIND('-') THEN
                REPEAT
                      ItemNumber:=Item1."No.";
                      Item.SETRANGE(Item."No.",ItemNumber);
                
                      IF Item.FIND('-') THEN
                      BEGIN
                        BOM_DUM[8].INIT;
                        BOM_DUM[8]."No.":=Item."No.";
                        BOM_DUM[8].Description:=Item.Description;
                        BOM_DUM[8]."Standard Cost":=Item."Standard Cost" ;
                        BOM_DUM[8]."Unit Cost":=Item."Quantity Under Inspection";
                        BOM_DUM[8]."Base Unit of Measure":=Item."Base Unit of Measure";
                        BOM_DUM[8]."Avg Unit Cost":=Item."Avg Unit Cost";
                        BOM_DUM[8]."Budget Quantity":=0;
                        BOM_DUM[8].INSERT;
                       END;
                UNTIL Item1.NEXT=0;
                
                
                PROD_QTY:= QTY[8];
                PROD_NO:=8;
                
                
                
                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                
                //  Sheet8 := Excel1.ActiveSheet;
                
                
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
                        //  Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                
                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                       // Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);
                
                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);
                
                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    //Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);
                
                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);
                
                  END;
                UNTIL  pbml.NEXT=0;
                //Caliculate_Product_Shortage(PROD_NO);
                /*
                BOUT.SETRANGE(BOUT.Code,BOM[PROD_NO]);
                IF BOUT.FIND('-') THEN
                BEGIN
                    Overall_Requirement(BOUT."Item No",PROD_QTY,BOUT.QTY,1,1);
                    Product_Requirement(PROD_NO,BOUT."Item No",PROD_QTY,BOUT.QTY,1,1);
                END;
                */
                
                "Break":=FALSE;
                IF BOM_DUM[8].FIND('-') THEN

            end;
        }
        dataitem("<Integer9>";"Integer")
        {
            DataItemTableView = SORTING(Number);
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
                IF "Break" THEN
                CurrReport.BREAK ;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[9]='' THEN
                CurrReport.BREAK;
                
                CLEAR(BOM_DUM[8]);
                BOM_DUM[8].DELETEALL;
                
                Item1.MARKEDONLY(TRUE);
                IF Item1.FIND('-') THEN
                REPEAT
                      ItemNumber:=Item1."No.";
                      Item.SETRANGE(Item."No.",ItemNumber);
                
                      IF Item.FIND('-') THEN
                      BEGIN
                        BOM_DUM[9].INIT;
                        BOM_DUM[9]."No.":=Item."No.";
                        BOM_DUM[9].Description:=Item.Description;
                        BOM_DUM[9]."Standard Cost":=Item."Standard Cost" ;
                        BOM_DUM[9]."Unit Cost":=Item."Quantity Under Inspection";
                        BOM_DUM[9]."Base Unit of Measure":=Item."Base Unit of Measure";
                        BOM_DUM[9]."Avg Unit Cost":=Item."Avg Unit Cost";
                        BOM_DUM[9]."Budget Quantity":=0;
                        BOM_DUM[9].INSERT;
                       END;
                UNTIL Item1.NEXT=0;
                
                
                PROD_QTY:= QTY[9];
                PROD_NO:=9;
                
                
                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                
                //  Sheet9 := Excel1.ActiveSheet;
                
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
                        //  Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                
                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        //Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);
                
                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);
                
                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    //Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);
                
                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);
                
                  END;
                UNTIL  pbml.NEXT=0;
                //Caliculate_Product_Shortage(PROD_NO);
                
                 /*
                BOUT.SETRANGE(BOUT.Code,BOM[PROD_NO]);
                IF BOUT.FIND('-') THEN
                BEGIN
                    Overall_Requirement(BOUT."Item No",PROD_QTY,BOUT.QTY,1,1);
                    Product_Requirement(PROD_NO,BOUT."Item No",PROD_QTY,BOUT.QTY,1,1);
                END;
                */
                "Break":=FALSE;
                IF BOM_DUM[9].FIND('-') THEN

            end;
        }
        dataitem("<Integer10>";"Integer")
        {
            DataItemTableView = SORTING(Number);
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
                IF "Break" THEN
                CurrReport.BREAK ;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[10]='' THEN
                CurrReport.BREAK;
                
                CLEAR(BOM_DUM[9]);
                BOM_DUM[9].DELETEALL;
                
                Item1.MARKEDONLY(TRUE);
                IF Item1.FIND('-') THEN
                REPEAT
                      ItemNumber:=Item1."No.";
                      Item.SETRANGE(Item."No.",ItemNumber);
                
                      IF Item.FIND('-') THEN
                      BEGIN
                        BOM_DUM[10].INIT;
                        BOM_DUM[10]."No.":=Item."No.";
                        BOM_DUM[10].Description:=Item.Description;
                        BOM_DUM[10]."Standard Cost":=Item."Standard Cost" ;
                        BOM_DUM[10]."Unit Cost":=Item."Quantity Under Inspection";
                        BOM_DUM[10]."Base Unit of Measure":=Item."Base Unit of Measure";
                        BOM_DUM[10]."Avg Unit Cost":=Item."Avg Unit Cost";
                        BOM_DUM[10]."Budget Quantity":=0;
                        BOM_DUM[10].INSERT;
                       END;
                UNTIL Item1.NEXT=0;
                
                
                PROD_QTY:= QTY[10];
                PROD_NO:=10;
                
                
                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                
                //  Sheet10 := Excel1.ActiveSheet;
                
                
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
                        //  Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                
                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                       // Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);
                
                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);
                
                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                   // Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);
                
                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);
                
                  END;
                UNTIL  pbml.NEXT=0;
                //Caliculate_Product_Shortage(PROD_NO);
                /*
                BOUT.SETRANGE(BOUT.Code,BOM[10]);
                IF BOUT.FIND('-') THEN
                BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,BOUT.QTY,1,1);
                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,BOUT.QTY,1,1);
                END;
                 */
                "Break":=FALSE;
                IF BOM_DUM[10].FIND('-') THEN

            end;
        }
        dataitem("<Integer11>";"Integer")
        {
            DataItemTableView = SORTING(Number);
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
                IF "Break" THEN
                CurrReport.BREAK ;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[11]='' THEN
                CurrReport.BREAK;
                
                CLEAR(BOM_DUM[10]);
                BOM_DUM[10].DELETEALL;
                
                Item1.MARKEDONLY(TRUE);
                IF Item1.FIND('-') THEN
                REPEAT
                      ItemNumber:=Item1."No.";
                      Item.SETRANGE(Item."No.",ItemNumber);
                
                      IF Item.FIND('-') THEN
                      BEGIN
                        BOM_DUM[11].INIT;
                        BOM_DUM[11]."No.":=Item."No.";
                        BOM_DUM[11].Description:=Item.Description;
                        BOM_DUM[11]."Standard Cost":=Item."Standard Cost" ;
                        BOM_DUM[11]."Unit Cost":=Item."Quantity Under Inspection";
                        BOM_DUM[11]."Base Unit of Measure":=Item."Base Unit of Measure";
                        BOM_DUM[11]."Avg Unit Cost":=Item."Avg Unit Cost";
                        BOM_DUM[11]."Budget Quantity":=0;
                        BOM_DUM[11].INSERT;
                       END;
                UNTIL Item1.NEXT=0;
                
                
                PROD_QTY:= QTY[11];
                PROD_NO:=11;
                
                
                
                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                
                //  Sheet11 := Excel1.ActiveSheet;
                
                
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
                        //  Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                
                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                     //   Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);
                
                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);
                
                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                  //  Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);
                
                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);
                
                  END;
                UNTIL  pbml.NEXT=0;
                //Caliculate_Product_Shortage(PROD_NO);
                /*
                BOUT.SETRANGE(BOUT.Code,BOM[11]);
                IF BOUT.FIND('-') THEN
                BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,BOUT.QTY,1,1);
                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,BOUT.QTY,1,1);
                END;
                 */
                "Break":=FALSE;
                IF BOM_DUM[11].FIND('-') THEN

            end;
        }
        dataitem("<Integer12>";"Integer")
        {
            DataItemTableView = SORTING(Number);
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
                IF "Break" THEN
                CurrReport.BREAK ;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[12]='' THEN
                CurrReport.BREAK;
                
                CLEAR(BOM_DUM[11]);
                BOM_DUM[11].DELETEALL;
                
                Item1.MARKEDONLY(TRUE);
                IF Item1.FIND('-') THEN
                REPEAT
                      ItemNumber:=Item1."No.";
                      Item.SETRANGE(Item."No.",ItemNumber);
                
                      IF Item.FIND('-') THEN
                      BEGIN
                        BOM_DUM[12].INIT;
                        BOM_DUM[12]."No.":=Item."No.";
                        BOM_DUM[12].Description:=Item.Description;
                        BOM_DUM[12]."Standard Cost":=Item."Standard Cost" ;
                        BOM_DUM[12]."Unit Cost":=Item."Quantity Under Inspection";
                        BOM_DUM[12]."Base Unit of Measure":=Item."Base Unit of Measure";
                        BOM_DUM[12]."Avg Unit Cost":=Item."Avg Unit Cost";
                        BOM_DUM[12]."Budget Quantity":=0;
                        BOM_DUM[12].INSERT;
                       END;
                UNTIL Item1.NEXT=0;
                
                
                PROD_QTY:= QTY[12];
                PROD_NO:=12;
                
                
                
                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                
                //  Sheet12 := Excel1.ActiveSheet;
                
                
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
                         // Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                
                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                       // Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);
                
                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);
                
                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                   // Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);
                
                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);
                
                  END;
                UNTIL  pbml.NEXT=0;
                //Caliculate_Product_Shortage(PROD_NO);
                /*
                BOUT.SETRANGE(BOUT.Code,BOM[12]);
                IF BOUT.FIND('-') THEN
                BEGIN
                    Overall_Requirement(pbml."No.",PROD_QTY,BOUT.QTY,1,1);
                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,BOUT.QTY,1,1);
                END;
                 */
                "Break":=FALSE;
                IF BOM_DUM[12].FIND('-') THEN

            end;
        }
        dataitem("<Integer13>";"Integer")
        {
            DataItemTableView = SORTING(Number);
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
                IF "Break" THEN
                CurrReport.BREAK ;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[13]='' THEN
                CurrReport.BREAK;

                CLEAR(BOM_DUM[12]);
                BOM_DUM[12].DELETEALL;

                Item1.MARKEDONLY(TRUE);
                IF Item1.FIND('-') THEN
                REPEAT
                      ItemNumber:=Item1."No.";
                      Item.SETRANGE(Item."No.",ItemNumber);

                      IF Item.FIND('-') THEN
                      BEGIN
                        BOM_DUM[13].INIT;
                        BOM_DUM[13]."No.":=Item."No.";
                        BOM_DUM[13].Description:=Item.Description;
                        BOM_DUM[13]."Standard Cost":=Item."Standard Cost" ;
                        BOM_DUM[13]."Unit Cost":=Item."Quantity Under Inspection";
                        BOM_DUM[13]."Base Unit of Measure":=Item."Base Unit of Measure";
                        BOM_DUM[13]."Avg Unit Cost":=Item."Avg Unit Cost";
                        BOM_DUM[13]."Budget Quantity":=0;
                        BOM_DUM[13].INSERT;
                       END;
                UNTIL Item1.NEXT=0;


                PROD_QTY:= QTY[13];
                PROD_NO:=13;


                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN

                //  Sheet13 := Excel1.ActiveSheet;


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
                         // Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        //Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    //Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                //Caliculate_Product_Shortage(PROD_NO);

                BOUT.SETRANGE(BOUT.Code,BOM[13]);
                IF BOUT.FIND('-') THEN
                BEGIN
                   // Overall_Requirement(pbml."No.",PROD_QTY,BOUT.QTY,1,1);
                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,BOUT.QTY,1,1);
                END;

                "Break":=FALSE;
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
                IF "Break" THEN
                CurrReport.BREAK ;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[14]='' THEN
                CurrReport.BREAK;

                CLEAR(BOM_DUM[13]);
                BOM_DUM[13].DELETEALL;

                Item1.MARKEDONLY(TRUE);
                IF Item1.FIND('-') THEN
                REPEAT
                      ItemNumber:=Item1."No.";
                      Item.SETRANGE(Item."No.",ItemNumber);

                      IF Item.FIND('-') THEN
                      BEGIN
                        BOM_DUM[14].INIT;
                        BOM_DUM[14]."No.":=Item."No.";
                        BOM_DUM[14].Description:=Item.Description;
                        BOM_DUM[14]."Standard Cost":=Item."Standard Cost" ;
                        BOM_DUM[14]."Unit Cost":=Item."Quantity Under Inspection";
                        BOM_DUM[14]."Base Unit of Measure":=Item."Base Unit of Measure";
                        BOM_DUM[14]."Avg Unit Cost":=Item."Avg Unit Cost";
                        BOM_DUM[14]."Budget Quantity":=0;
                        BOM_DUM[14].INSERT;
                       END;
                UNTIL Item1.NEXT=0;


                PROD_QTY:= QTY[14];
                PROD_NO:=14;

                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN

                //  Sheet14 := Excel1.ActiveSheet;


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
                         //Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                       // Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                   // Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                //Caliculate_Product_Shortage(PROD_NO);


                "Break":=FALSE;
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
                IF "Break" THEN
                CurrReport.BREAK ;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[15]='' THEN
                CurrReport.BREAK;

                CLEAR(BOM_DUM[14]);
                BOM_DUM[14].DELETEALL;

                Item1.MARKEDONLY(TRUE);
                IF Item1.FIND('-') THEN
                REPEAT
                      ItemNumber:=Item1."No.";
                      Item.SETRANGE(Item."No.",ItemNumber);

                      IF Item.FIND('-') THEN
                      BEGIN
                        BOM_DUM[15].INIT;
                        BOM_DUM[15]."No.":=Item."No.";
                        BOM_DUM[15].Description:=Item.Description;
                        BOM_DUM[15]."Standard Cost":=Item."Standard Cost" ;
                        BOM_DUM[15]."Unit Cost":=Item."Quantity Under Inspection";
                        BOM_DUM[15]."Base Unit of Measure":=Item."Base Unit of Measure";
                        BOM_DUM[15]."Avg Unit Cost":=Item."Avg Unit Cost";
                        BOM_DUM[15]."Budget Quantity":=0;
                        BOM_DUM[15].INSERT;
                       END;
                UNTIL Item1.NEXT=0;



                PROD_QTY:= QTY[15];
                PROD_NO:=15;


                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN

                //  Sheet15 := Excel1.ActiveSheet;


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
                         // Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                      // Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                   // Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                //Caliculate_Product_Shortage(PROD_NO);

                "Break":=FALSE;
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
                IF "Break" THEN
                CurrReport.BREAK ;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[16]='' THEN
                CurrReport.BREAK;

                CLEAR(BOM_DUM[15]);
                BOM_DUM[15].DELETEALL;

                Item1.MARKEDONLY(TRUE);
                IF Item1.FIND('-') THEN
                REPEAT
                      ItemNumber:=Item1."No.";
                      Item.SETRANGE(Item."No.",ItemNumber);

                      IF Item.FIND('-') THEN
                      BEGIN
                        BOM_DUM[16].INIT;
                        BOM_DUM[16]."No.":=Item."No.";
                        BOM_DUM[16].Description:=Item.Description;
                        BOM_DUM[16]."Standard Cost":=Item."Standard Cost" ;
                        BOM_DUM[16]."Unit Cost":=Item."Quantity Under Inspection";
                        BOM_DUM[16]."Base Unit of Measure":=Item."Base Unit of Measure";
                        BOM_DUM[16]."Avg Unit Cost":=Item."Avg Unit Cost";
                        BOM_DUM[16]."Budget Quantity":=0;
                        BOM_DUM[16].INSERT;
                       END;
                UNTIL Item1.NEXT=0;


                PROD_QTY:= QTY[16];
                PROD_NO:=16;



                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN

                //  Sheet16 := Excel1.ActiveSheet;


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
                         // Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                       // Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    //Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                //Caliculate_Product_Shortage(PROD_NO);

                "Break":=FALSE;
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
                IF "Break" THEN
                CurrReport.BREAK ;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[17]='' THEN
                CurrReport.BREAK;

                CLEAR(BOM_DUM[16]);
                BOM_DUM[16].DELETEALL;

                Item1.MARKEDONLY(TRUE);
                IF Item1.FIND('-') THEN
                REPEAT
                      ItemNumber:=Item1."No.";
                      Item.SETRANGE(Item."No.",ItemNumber);

                      IF Item.FIND('-') THEN
                      BEGIN
                        BOM_DUM[17].INIT;
                        BOM_DUM[17]."No.":=Item."No.";
                        BOM_DUM[17].Description:=Item.Description;
                        BOM_DUM[17]."Standard Cost":=Item."Standard Cost" ;
                        BOM_DUM[17]."Unit Cost":=Item."Quantity Under Inspection";
                        BOM_DUM[17]."Base Unit of Measure":=Item."Base Unit of Measure";
                        BOM_DUM[17]."Avg Unit Cost":=Item."Avg Unit Cost";
                        BOM_DUM[17]."Budget Quantity":=0;
                        BOM_DUM[17].INSERT;
                       END;
                UNTIL Item1.NEXT=0;


                PROD_QTY:= QTY[17];
                PROD_NO:=17;



                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN

                //  Sheet17 := Excel1.ActiveSheet;


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
                         // Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                       // Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                   // Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                //Caliculate_Product_Shortage(PROD_NO);

                "Break":=FALSE;
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
                IF "Break" THEN
                CurrReport.BREAK ;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[18]='' THEN
                CurrReport.BREAK;

                CLEAR(BOM_DUM[17]);
                BOM_DUM[17].DELETEALL;

                Item1.MARKEDONLY(TRUE);
                IF Item1.FIND('-') THEN
                REPEAT
                      ItemNumber:=Item1."No.";
                      Item.SETRANGE(Item."No.",ItemNumber);

                      IF Item.FIND('-') THEN
                      BEGIN
                        BOM_DUM[18].INIT;
                        BOM_DUM[18]."No.":=Item."No.";
                        BOM_DUM[18].Description:=Item.Description;
                        BOM_DUM[18]."Standard Cost":=Item."Standard Cost" ;
                        BOM_DUM[18]."Unit Cost":=Item."Quantity Under Inspection";
                        BOM_DUM[18]."Base Unit of Measure":=Item."Base Unit of Measure";
                        BOM_DUM[18]."Avg Unit Cost":=Item."Avg Unit Cost";
                        BOM_DUM[18]."Budget Quantity":=0;
                        BOM_DUM[18].INSERT;
                       END;
                UNTIL Item1.NEXT=0;


                PROD_QTY:= QTY[18];
                PROD_NO:=18;



                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN

                //  Sheet18 := Excel1.ActiveSheet;

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
                         // Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                       // Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                   // Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                //Caliculate_Product_Shortage(PROD_NO);

                "Break":=FALSE;
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
                IF "Break" THEN
                CurrReport.BREAK ;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[19]='' THEN
                CurrReport.BREAK;

                CLEAR(BOM_DUM[18]);
                BOM_DUM[18].DELETEALL;

                Item1.MARKEDONLY(TRUE);
                IF Item1.FIND('-') THEN
                REPEAT
                      ItemNumber:=Item1."No.";
                      Item.SETRANGE(Item."No.",ItemNumber);

                      IF Item.FIND('-') THEN
                      BEGIN
                        BOM_DUM[19].INIT;
                        BOM_DUM[19]."No.":=Item."No.";
                        BOM_DUM[19].Description:=Item.Description;
                        BOM_DUM[19]."Standard Cost":=Item."Standard Cost" ;
                        BOM_DUM[19]."Unit Cost":=Item."Quantity Under Inspection";
                        BOM_DUM[19]."Base Unit of Measure":=Item."Base Unit of Measure";
                        BOM_DUM[19]."Avg Unit Cost":=Item."Avg Unit Cost";
                        BOM_DUM[19]."Budget Quantity":=0;
                        BOM_DUM[19].INSERT;
                       END;
                UNTIL Item1.NEXT=0;


                PROD_QTY:= QTY[19];
                PROD_NO:=19;



                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN

                //  Sheet19 := Excel1.ActiveSheet;


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
                         // Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                       // Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                  //  Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                //Caliculate_Product_Shortage(PROD_NO);

                "Break":=FALSE;
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
                IF "Break" THEN
                CurrReport.BREAK ;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[20]='' THEN
                CurrReport.BREAK;

                CLEAR(BOM_DUM[19]);
                BOM_DUM[19].DELETEALL;

                Item1.MARKEDONLY(TRUE);
                IF Item1.FIND('-') THEN
                REPEAT
                      ItemNumber:=Item1."No.";
                      Item.SETRANGE(Item."No.",ItemNumber);

                      IF Item.FIND('-') THEN
                      BEGIN
                        BOM_DUM[20].INIT;
                        BOM_DUM[20]."No.":=Item."No.";
                        BOM_DUM[20].Description:=Item.Description;
                        BOM_DUM[20]."Standard Cost":=Item."Standard Cost" ;
                        BOM_DUM[20]."Unit Cost":=Item."Quantity Under Inspection";
                        BOM_DUM[20]."Base Unit of Measure":=Item."Base Unit of Measure";
                        BOM_DUM[20]."Avg Unit Cost":=Item."Avg Unit Cost";
                        BOM_DUM[20]."Budget Quantity":=0;
                        BOM_DUM[20].INSERT;
                       END;
                UNTIL Item1.NEXT=0;


                PROD_QTY:= QTY[20];
                PROD_NO:=20;


                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN

                //  Sheet20 := Excel1.ActiveSheet;


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
                         // Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        //Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                 //   Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                //Caliculate_Product_Shortage(PROD_NO);

                "Break":=FALSE;
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
                IF "Break" THEN
                CurrReport.BREAK ;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[21]='' THEN
                CurrReport.BREAK;

                CLEAR(BOM_DUM[20]);
                BOM_DUM[20].DELETEALL;

                Item1.MARKEDONLY(TRUE);
                IF Item1.FIND('-') THEN
                REPEAT
                      ItemNumber:=Item1."No.";
                      Item.SETRANGE(Item."No.",ItemNumber);

                      IF Item.FIND('-') THEN
                      BEGIN
                        BOM_DUM[21].INIT;
                        BOM_DUM[21]."No.":=Item."No.";
                        BOM_DUM[21].Description:=Item.Description;
                        BOM_DUM[21]."Standard Cost":=Item."Standard Cost" ;
                        BOM_DUM[21]."Unit Cost":=Item."Quantity Under Inspection";
                        BOM_DUM[21]."Base Unit of Measure":=Item."Base Unit of Measure";
                        BOM_DUM[21]."Avg Unit Cost":=Item."Avg Unit Cost";
                        BOM_DUM[21]."Budget Quantity":=0;
                        BOM_DUM[21].INSERT;
                       END;
                UNTIL Item1.NEXT=0;


                PROD_QTY:= QTY[21];
                PROD_NO:=21;



                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN

                //  Sheet21 := Excel1.ActiveSheet;

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
                         // Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                       // Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                   // Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                //Caliculate_Product_Shortage(PROD_NO);

                "Break":=FALSE;
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
                IF "Break" THEN
                CurrReport.BREAK ;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[22]='' THEN
                CurrReport.BREAK;

                CLEAR(BOM_DUM[21]);
                BOM_DUM[21].DELETEALL;

                Item1.MARKEDONLY(TRUE);
                IF Item1.FIND('-') THEN
                REPEAT
                      ItemNumber:=Item1."No.";
                      Item.SETRANGE(Item."No.",ItemNumber);

                      IF Item.FIND('-') THEN
                      BEGIN
                        BOM_DUM[22].INIT;
                        BOM_DUM[22]."No.":=Item."No.";
                        BOM_DUM[22].Description:=Item.Description;
                        BOM_DUM[22]."Standard Cost":=Item."Standard Cost" ;
                        BOM_DUM[22]."Unit Cost":=Item."Quantity Under Inspection";
                        BOM_DUM[22]."Base Unit of Measure":=Item."Base Unit of Measure";
                        BOM_DUM[22]."Avg Unit Cost":=Item."Avg Unit Cost";
                        BOM_DUM[22]."Budget Quantity":=0;
                        BOM_DUM[22].INSERT;
                       END;
                UNTIL Item1.NEXT=0;


                PROD_QTY:= QTY[22];
                PROD_NO:=22;


                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN

                //  Sheet22 := Excel1.ActiveSheet;

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
                         // Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        //Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                  //  Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                //Caliculate_Product_Shortage(PROD_NO);

                "Break":=FALSE;
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
                IF "Break" THEN
                CurrReport.BREAK ;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[23]='' THEN
                CurrReport.BREAK;

                CLEAR(BOM_DUM[22]);
                BOM_DUM[22].DELETEALL;

                Item1.MARKEDONLY(TRUE);
                IF Item1.FIND('-') THEN
                REPEAT
                      ItemNumber:=Item1."No.";
                      Item.SETRANGE(Item."No.",ItemNumber);

                      IF Item.FIND('-') THEN
                      BEGIN
                        BOM_DUM[23].INIT;
                        BOM_DUM[23]."No.":=Item."No.";
                        BOM_DUM[23].Description:=Item.Description;
                        BOM_DUM[23]."Standard Cost":=Item."Standard Cost" ;
                        BOM_DUM[23]."Unit Cost":=Item."Quantity Under Inspection";
                        BOM_DUM[23]."Base Unit of Measure":=Item."Base Unit of Measure";
                        BOM_DUM[23]."Avg Unit Cost":=Item."Avg Unit Cost";
                        BOM_DUM[23]."Budget Quantity":=0;
                        BOM_DUM[23].INSERT;
                       END;
                UNTIL Item1.NEXT=0;


                PROD_QTY:= QTY[23];
                PROD_NO:=23;



                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                //  Sheet23 := Excel1.ActiveSheet;

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
                          //Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                       // Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                   // Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                //Caliculate_Product_Shortage(PROD_NO);

                "Break":=FALSE;
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
                IF "Break" THEN
                CurrReport.BREAK ;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[24]='' THEN
                CurrReport.BREAK;

                CLEAR(BOM_DUM[23]);
                BOM_DUM[23].DELETEALL;

                Item1.MARKEDONLY(TRUE);
                IF Item1.FIND('-') THEN
                REPEAT
                      ItemNumber:=Item1."No.";
                      Item.SETRANGE(Item."No.",ItemNumber);

                      IF Item.FIND('-') THEN
                      BEGIN
                        BOM_DUM[24].INIT;
                        BOM_DUM[24]."No.":=Item."No.";
                        BOM_DUM[24].Description:=Item.Description;
                        BOM_DUM[24]."Standard Cost":=Item."Standard Cost" ;
                        BOM_DUM[24]."Unit Cost":=Item."Quantity Under Inspection";
                        BOM_DUM[24]."Base Unit of Measure":=Item."Base Unit of Measure";
                        BOM_DUM[24]."Avg Unit Cost":=Item."Avg Unit Cost";
                        BOM_DUM[24]."Budget Quantity":=0;
                        BOM_DUM[24].INSERT;
                       END;
                UNTIL Item1.NEXT=0;


                PROD_QTY:= QTY[24];
                PROD_NO:=24;



                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN
                //  Sheet24 := Excel1.ActiveSheet;

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
                          //Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                        //Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    //Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                //Caliculate_Product_Shortage(PROD_NO);

                "Break":=FALSE;
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
                IF "Break" THEN
                CurrReport.BREAK ;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[25]='' THEN
                CurrReport.BREAK;

                CLEAR(BOM_DUM[24]);
                BOM_DUM[24].DELETEALL;

                Item1.MARKEDONLY(TRUE);
                IF Item1.FIND('-') THEN
                REPEAT
                      ItemNumber:=Item1."No.";
                      Item.SETRANGE(Item."No.",ItemNumber);

                      IF Item.FIND('-') THEN
                      BEGIN
                        BOM_DUM[25].INIT;
                        BOM_DUM[25]."No.":=Item."No.";
                        BOM_DUM[25].Description:=Item.Description;
                        BOM_DUM[25]."Standard Cost":=Item."Standard Cost" ;
                        BOM_DUM[25]."Unit Cost":=Item."Quantity Under Inspection";
                        BOM_DUM[25]."Base Unit of Measure":=Item."Base Unit of Measure";
                        BOM_DUM[25]."Avg Unit Cost":=Item."Avg Unit Cost";
                        BOM_DUM[25]."Budget Quantity":=0;
                        BOM_DUM[25].INSERT;
                       END;
                UNTIL Item1.NEXT=0;


                PROD_QTY:= QTY[25];
                PROD_NO:=25;



                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN

                //  Sheet25 := Excel1.ActiveSheet;


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
                          //Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                       // Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    //Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                //Caliculate_Product_Shortage(PROD_NO);

                "Break":=FALSE;
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
                IF "Break" THEN
                CurrReport.BREAK ;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[26]='' THEN
                CurrReport.BREAK;

                CLEAR(BOM_DUM[25]);
                BOM_DUM[25].DELETEALL;

                Item1.MARKEDONLY(TRUE);
                IF Item1.FIND('-') THEN
                REPEAT
                      ItemNumber:=Item1."No.";
                      Item.SETRANGE(Item."No.",ItemNumber);

                      IF Item.FIND('-') THEN
                      BEGIN
                        BOM_DUM[26].INIT;
                        BOM_DUM[26]."No.":=Item."No.";
                        BOM_DUM[26].Description:=Item.Description;
                        BOM_DUM[26]."Standard Cost":=Item."Standard Cost" ;
                        BOM_DUM[26]."Unit Cost":=Item."Quantity Under Inspection";
                        BOM_DUM[26]."Base Unit of Measure":=Item."Base Unit of Measure";
                        BOM_DUM[26]."Avg Unit Cost":=Item."Avg Unit Cost";
                        BOM_DUM[26]."Budget Quantity":=0;
                        BOM_DUM[26].INSERT;
                       END;
                UNTIL Item1.NEXT=0;


                PROD_QTY:= QTY[26];
                PROD_NO:=26;



                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN

                //  Sheet26 := Excel1.ActiveSheet;


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
                         // Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                       // Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                   //Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                //Caliculate_Product_Shortage(PROD_NO);

                "Break":=FALSE;
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
                IF "Break" THEN
                CurrReport.BREAK ;
            end;

            trigger OnPreDataItem();
            begin
                IF BOM[27]='' THEN
                CurrReport.BREAK;

                CLEAR(BOM_DUM[26]);
                BOM_DUM[26].DELETEALL;

                Item1.MARKEDONLY(TRUE);
                IF Item1.FIND('-') THEN
                REPEAT
                      ItemNumber:=Item1."No.";
                      Item.SETRANGE(Item."No.",ItemNumber);

                      IF Item.FIND('-') THEN
                      BEGIN
                        BOM_DUM[27].INIT;
                        BOM_DUM[27]."No.":=Item."No.";
                        BOM_DUM[27].Description:=Item.Description;
                        BOM_DUM[27]."Standard Cost":=Item."Standard Cost" ;
                        BOM_DUM[27]."Unit Cost":=Item."Quantity Under Inspection";
                        BOM_DUM[27]."Base Unit of Measure":=Item."Base Unit of Measure";
                        BOM_DUM[27]."Avg Unit Cost":=Item."Avg Unit Cost";
                        BOM_DUM[27]."Budget Quantity":=0;
                        BOM_DUM[27].INSERT;
                       END;
                UNTIL Item1.NEXT=0;


                PROD_QTY:= QTY[27];
                PROD_NO:=27;



                BOMName:=BOM[PROD_NO];
                IF Excel THEN
                BEGIN

                //  Sheet27 := Excel1.ActiveSheet;

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
                         // Overall_Requirement(PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);
                          Product_Requirement(PROD_NO,PBML3."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,PBML3.Quantity);

                        UNTIL  PBML3.NEXT=0;
                      END ELSE
                      BEGIN
                       // Overall_Requirement(PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                        Product_Requirement(PROD_NO,PBML2."No.",PROD_QTY,pbml.Quantity,PBML2.Quantity,1);

                      END;
                  UNTIL  PBML2.NEXT=0;         Dum.NEXT
                  END ELSE
                  BEGIN
                    //Overall_Requirement(pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                    Product_Requirement(PROD_NO,pbml."No.",PROD_QTY,pbml.Quantity,1,1);

                  END;
                UNTIL  pbml.NEXT=0;
                //Caliculate_Product_Shortage(PROD_NO);

                "Break":=FALSE;
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
                IF "Break" THEN
                CurrReport.BREAK;
            end;

            trigger OnPreDataItem();
            begin
                CurrReport.BREAK;

                Dum.SETCURRENTKEY(Dum."Avg Unit Cost");
                Dum.SETFILTER(Dum."Budget Quantity",'>%1',0);
                Dum.SETFILTER(Dum."Product Group Code",'<>%1','CPCB');
                IF Dum.FIND('-') THEN
                "Break":=FALSE;


                IF Excel THEN
                BEGIN
                //  Excel1.Worksheets.Add;
                //  Sheet := Excel1.ActiveSheet;

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
        //Excel1.Visible(TRUE);//B2B
        IF Excel AND QC_Report THEN
        BEGIN
         TempExcelBuffer.CreateBook('');//B2B
         //TempExcelBuffer.CreateSheet('QC','',COMPANYNAME,'');//B2B
         TempExcelBuffer.GiveUserControl;
        END;
    end;

    trigger OnPreReport();
    begin
        //CREATE(Excel1);//B2B
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
        TempExcelBuffer : Record "Excel Buffer";
        Row : Integer;
        PBML2 : Record "Production BOM Line";
        "Break" : Boolean;
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
        Orders : Text[200];
        PBMV : Record "Production BOM Version";
        ItemNumber : Text[30];
        LATEST_VENDOR : Boolean;
        VENDOR : Record Vendor;
        BATCH_INFO : Text[1000];
        PREV_BATCH : Text[30];
        PREV_BATCH_QTY : Decimal;
        BATCH_INFO_DETIALS : Boolean;
        Item1 : Record Item temporary;
        I : Integer;
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

    (8846)]
    procedure "Enter Cell"(RowNo : Integer;ColumnNo : Integer;CellValue : Text[250];Bold : Boolean);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.",RowNo);
        TempExcelBuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelBuffer."Cell Value as Text" := CellValue;
        TempExcelBuffer.Bold:=Bold ;
        TempExcelBuffer.INSERT;
    end;

    (8854)]
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

    (8863)]
    procedure Product_Requirement("Product_No." : Integer;"Item_No." : Code[50];Prod_QTY : Integer;"BOM_QTY(Compound)" : Decimal;"BOM_QTY(Line)" : Decimal;BOM_QTY : Decimal);
    var
        TOT : Decimal;
    begin
            TOT :=Prod_QTY*"BOM_QTY(Compound)"*"BOM_QTY(Line)"*BOM_QTY;

        IF BOM_DUM["Product_No."].GET("Item_No.") THEN
         BEGIN
              BOM_DUM["Product_No."]."Budget Quantity"+=TOT;
              BOM_DUM["Product_No."].MODIFY;
            END;
    end;

    (8872)]
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
                  Dum."Standard Cost":=Item."Qty. on Purch. Order";
                  Dum."Unit Cost":=Item."Quantity Under Inspection";
                  Stock:=0;
                  Item.CALCFIELDS(Item."Quantity Under Inspection",Item."Quantity Rejected",Item."Quantity Rework",
                  Item."Quantity Sent for Rework",Item."Inventory at Stores");
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
                               QualityItemLedgEntry."Inspection Status"::"Under Inspection")) OR
                               (QualityItemLedgEntry.GET(ItemLedgEntry."Entry No.")
                               AND (QualityItemLedgEntry."Inspection Status"=QualityItemLedgEntry."Inspection Status"::Rejected)) THEN
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
                  Dum."Maximum Inventory":=Stock;
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

    (8962)]
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

    (8990)]
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

