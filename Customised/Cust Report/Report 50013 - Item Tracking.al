report 50013 "Item Tracking"
{
    // version NAVW13.70,EFF02,EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './Item Tracking.rdlc';
    Caption = 'Prod. Order - Precalc. Time';

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            DataItemTableView = SORTING(Item No., Entry Type, Variant Code, Drop Shipment, Location Code, Posting Date) WHERE(Entry Type=CONST(Transfer),Quantity=FILTER(>0),Location Code=CONST(PROD));
            RequestFilterFields = "Item No.","Lot No.","Serial No.","Order No.";
            ReqFilterHeading = '<Item Tracking>';
            column(TODAY;TODAY)
            {
            }
            column(COMPANYNAME;COMPANYNAME)
            {
            }
            column(USERID;USERID)
            {
            }
            column(PBM;PBM)
            {
            }
            column(Pc;Pc)
            {
            }
            column(SO;SO)
            {
            }
            column(CName;CName)
            {
            }
            column(Compund_Desc_;"Compund Desc")
            {
            }
            column(Item_Ledger_Entry__Item_Ledger_Entry___Lot_No__;"Item Ledger Entry"."Lot No.")
            {
            }
            column(Description1;Description1)
            {
            }
            column(Description2;Description2)
            {
            }
            column(Item_Ledger_Entry__Item_Ledger_Entry___Serial_No__;"Item Ledger Entry"."Serial No.")
            {
            }
            column(Vendor_Name_;"Vendor Name")
            {
            }
            column(Bill_No__;"Bill No.")
            {
            }
            column(FORMAT__Bill_Date__;FORMAT("Bill Date"))
            {
            }
            column(Issued_To;Issued_To)
            {
            }
            column(Item_Ledger_Entry_Quantity;Quantity)
            {
            }
            column(PMIH__Material_Issue_No__;PMIH."Material Issue No.")
            {
            }
            column(Item_TrackingCaption;Item_TrackingCaptionLbl)
            {
            }
            column(Production_BOM_sCaption;Production_BOM_sCaptionLbl)
            {
            }
            column(Project_CodeCaption;Project_CodeCaptionLbl)
            {
            }
            column(Sales_OrderCaption;Sales_OrderCaptionLbl)
            {
            }
            column(Customer_NameCaption;Customer_NameCaptionLbl)
            {
            }
            column(CPCB_NOCaption;CPCB_NOCaptionLbl)
            {
            }
            column(Lot_No_Caption;Lot_No_CaptionLbl)
            {
            }
            column(Serial_No_Caption;Serial_No_CaptionLbl)
            {
            }
            column(CPCB_DescriptionCaption;CPCB_DescriptionCaptionLbl)
            {
            }
            column(DescriptionCaption;DescriptionCaptionLbl)
            {
            }
            column(Vendor_NameCaption;Vendor_NameCaptionLbl)
            {
            }
            column(Bill_No_Caption;Bill_No_CaptionLbl)
            {
            }
            column(Invoice_DateCaption;Invoice_DateCaptionLbl)
            {
            }
            column(Issued_toCaption;Issued_toCaptionLbl)
            {
            }
            column(Item_Ledger_Entry_QuantityCaption;FIELDCAPTION(Quantity))
            {
            }
            column(Request_No_Caption;Request_No_CaptionLbl)
            {
            }
            column(Item_Ledger_Entry_Entry_No_;"Entry No.")
            {
            }
            column(Choice_;choice)
            {
            }

            trigger OnAfterGetRecord();
            begin
                  "Vendor Name":='';
                  IF  choice<>choice::Track THEN
                  CurrReport.BREAK;


                //Rev01 Item Ledger Entry, Body (4) - OnPreSection()
                 IF choice=choice::Track THEN
                 BEGIN
                   Item2.SETRANGE(Item2."No.","Item Ledger Entry"."Item No.");
                   IF Item2.FIND('-') THEN
                     Description2:=Item2.Description;
                   Issued_To:='';
                   PMIH.SETRANGE(PMIH."No.","Item Ledger Entry"."Document No.");
                   IF PMIH.FIND('-')  THEN
                     Issued_To:=  PMIH."Resource Name";

                   PO.SETRANGE(PO."No.","Item Ledger Entry"."ITL Doc No.");
                   IF PO.FIND('-') THEN
                   BEGIN
                     Pc:=PO."No.";

                     POL.SETRANGE(POL."Prod. Order No.",PO."No.");
                     POL.SETRANGE(POL."Line No.","Item Ledger Entry"."ITL Doc Line No.");
                     IF POL.FIND('-') THEN
                       "Compund Desc":=POL."Item No.";

                     Item.SETRANGE(Item."No.",POL."Item No.");
                     IF Item.FIND('-') THEN
                     Description1:=Item.Description;

                     PBMH.SETRANGE(PBMH."No.",PO."Source No.");
                     IF PBMH.FIND('-') THEN
                      PBM:=PBMH."No.";

                     SO:=PO."Sales Order No.";
                     SH.SETRANGE(SH."No.",SO);
                     IF SH.FIND('-') THEN
                        CName:=SH."Bill-to Name";

                     ILE.SETCURRENTKEY(ILE."Item No.",ILE."Lot No.",ILE."Serial No.");
                     ILE.SETRANGE(ILE."Item No.","Item Ledger Entry"."Item No.");
                     ILE.SETRANGE(ILE."Lot No.","Item Ledger Entry"."Lot No.");
                     ILE.SETFILTER(ILE."Entry Type",'Purchase');
                     IF ILE.FIND('-') THEN
                     BEGIN
                      Vendor.SETRANGE(Vendor."No.",ILE."Source No.");
                      IF Vendor.FIND('-') THEN
                      "Vendor Name":=Vendor.Name;
                       "Bill No.":=ILE."External Document No.";

                      // PH.SETCURRENTKEY(PH."Document Type",PH."Buy-from Vendor No.",PH."No.");
                       PH.SETRANGE(PH."Buy-from Vendor No.",ILE."Source No.");
                       PH.SETRANGE(PH."Vendor Invoice No.","Bill No.");
                       IF PH.FIND('-') THEN
                       "Bill Date":=PH."Posting Date";
                     END;
                     ILE1.RESET;
                     ILE1.SETFILTER(ILE1."Item No.",'%1','ECPBPCB*');
                     ILE1.SETFILTER(ILE1."ITL Doc No.","Item Ledger Entry"."ITL Doc No.");
                     ILE1.SETFILTER(ILE1."ITL Doc Line No.",'%1',"Item Ledger Entry"."ITL Doc Line No.");
                     ILE1.SETFILTER(ILE1."Location Code",'PROD');
                     ILE1.SETFILTER(ILE1."Document No.","Item Ledger Entry"."Document No.");
                     IF ILE1.FIND('-') THEN
                     BEGIN
                       "S.No":=ILE1."Serial No.";
                     END
                     ELSE
                       "S.No":='';
                     END;
                     IF excel THEN
                     BEGIN
                        Row+=1;
                        Entercell(Row,1,FORMAT(PBM),FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,2,FORMAT(Pc),FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,3,FORMAT(SO),FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,4,FORMAT(CName),FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,5,FORMAT("Compund Desc"),FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,6,FORMAT(Description1),FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,7,FORMAT("S.No"),FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,8,FORMAT("Item Ledger Entry"."Lot No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,9,"Item Ledger Entry"."Serial No.",FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,10,Description2,FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,11,"Vendor Name",FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,12,Issued_To,FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,13,FORMAT("Bill No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,14,FORMAT("Bill Date"),FALSE,TempExcelbuffer."Cell Type"::Date);
                        Entercell(Row,15,FORMAT("Item Ledger Entry".Quantity),FALSE,TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row,16,FORMAT(PMIH."Material Issue No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                     END;
                          END ELSE
                          CurrReport.SHOWOUTPUT:=FALSE;
                //Rev01 Item Ledger Entry, Body (4) - OnPreSection()
            end;

            trigger OnPreDataItem();
            begin
                  IF  choice<>choice::Track THEN
                  CurrReport.BREAK;



                //Rev01 Item Ledger Entry, Header (2) - OnPreSection()
                IF Item.GET("Item Ledger Entry"."Item No.") THEN
                Description:=Item.Description;
                //Rev01 Item Ledger Entry, Header (2) - OnPreSection()



                //Rev01 Item Ledger Entry, Header (3) - OnPreSection()
                   CurrReport.SHOWOUTPUT(choice=choice::Track);
                   IF (choice=choice::Track) AND excel THEN
                   BEGIN
                     Row+=1;
                     EnterHeadings(Row,1,'Production BOM',TRUE,TempExcelbuffer."Cell Type"::Text);
                     EnterHeadings(Row,2,'Project Code',TRUE,TempExcelbuffer."Cell Type"::Text);
                     EnterHeadings(Row,3,'Sales Order',TRUE,TempExcelbuffer."Cell Type"::Text);
                     EnterHeadings(Row,4,'Customer Name',TRUE,TempExcelbuffer."Cell Type"::Text);
                     EnterHeadings(Row,5,'CPCB NO',TRUE,TempExcelbuffer."Cell Type"::Text);
                     EnterHeadings(Row,6,'CPCB Description',TRUE,TempExcelbuffer."Cell Type"::Text);
                     EnterHeadings(Row,7,'CPCB Serial No',TRUE,TempExcelbuffer."Cell Type"::Text);
                     EnterHeadings(Row,8,'Lot No.',TRUE,TempExcelbuffer."Cell Type"::Text);
                     EnterHeadings(Row,9,'Serial No.',TRUE,TempExcelbuffer."Cell Type"::Text);
                     EnterHeadings(Row,10,'Description',TRUE,TempExcelbuffer."Cell Type"::Text);
                     EnterHeadings(Row,11,'Vendor Name',TRUE,TempExcelbuffer."Cell Type"::Text);
                     EnterHeadings(Row,12,'Issued to',TRUE,TempExcelbuffer."Cell Type"::Text);
                     EnterHeadings(Row,13,'Bill No.',TRUE,TempExcelbuffer."Cell Type"::Text);
                     EnterHeadings(Row,14,'Invoice Date',TRUE,TempExcelbuffer."Cell Type"::Text);
                     EnterHeadings(Row,15,'Quantity',TRUE,TempExcelbuffer."Cell Type"::Text);
                     EnterHeadings(Row,16,'Request No.',TRUE,TempExcelbuffer."Cell Type"::Text);
                   END
                //Rev01 Item Ledger Entry, Header (3) - OnPreSection()
            end;
        }
        dataitem("Production BOM Line";"Production BOM Line")
        {
            DataItemTableView = '';
            RequestFilterFields = Type,"No.";
            ReqFilterHeading = '<Item Where Used>';
            column(COMPANYNAME_Control1000000066;COMPANYNAME)
            {
            }
            column(TODAY_Control1000000067;TODAY)
            {
            }
            column(USERID_Control1000000068;USERID)
            {
            }
            column(Production_BOM_Line__Production_BOM_No__;"Production BOM No.")
            {
            }
            column(Production_BOM_Line__Unit_of_Measure_Code_;"Unit of Measure Code")
            {
            }
            column(Production_BOM_Line_Quantity;Quantity)
            {
            }
            column(Production_BOM_Line_Position;Position)
            {
            }
            column(DESC;DESC)
            {
            }
            column(Production_BOM_Line_Status;Status)
            {
            }
            column(Item_Where_UsedCaption;Item_Where_UsedCaptionLbl)
            {
            }
            column(Production_BOM_Line__Production_BOM_No__Caption;FIELDCAPTION("Production BOM No."))
            {
            }
            column(UOMCaption;UOMCaptionLbl)
            {
            }
            column(Production_BOM_Line_QuantityCaption;FIELDCAPTION(Quantity))
            {
            }
            column(Production_BOM_Line_PositionCaption;FIELDCAPTION(Position))
            {
            }
            column(DescriptionCaption_Control1000000115;DescriptionCaption_Control1000000115Lbl)
            {
            }
            column(Production_BOM_Line2__StatusCaption;"<Production BOM Line2>".FIELDCAPTION(Status))
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
            dataitem("<Production BOM Line2>";"Production BOM Line")
            {
                DataItemLink = Production BOM No.=FIELD(No.);
                DataItemTableView = SORTING(Type,No.) ORDER(Ascending);
                column(Production_BOM_Line2___Production_BOM_No__;"Production BOM No.")
                {
                }
                column(DESC_Control1102154001;DESC)
                {
                }
                column(Production_BOM_Line2___Unit_of_Measure_Code_;"Unit of Measure Code")
                {
                }
                column(Production_BOM_Line2__Quantity;Quantity)
                {
                }
                column(Production_BOM_Line2__Position;Position)
                {
                }
                column(Production_BOM_Line2__Status;Status)
                {
                }
                column(Production_BOM_Line2__Version_Code;"Version Code")
                {
                }
                column(Production_BOM_Line2__Line_No_;"Line No.")
                {
                }

                trigger OnAfterGetRecord();
                begin

                    //Rev01 <Production BOM Line2>, Body (1) - OnPreSection()
                        CurrReport.SHOWOUTPUT(choice=choice::Where_Used);
                         IF PBH.GET("<Production BOM Line2>"."Production BOM No.") THEN
                           DESC:=PBH.Description;
                         IF (choice=choice::Where_Used) AND  excel THEN
                         BEGIN
                           Row+=1;
                           Entercell(Row,1,FORMAT("<Production BOM Line2>"."Production BOM No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                           Entercell(Row,2,DESC,FALSE,TempExcelbuffer."Cell Type"::Text);
                           Entercell(Row,3,FORMAT("<Production BOM Line2>".Quantity),FALSE,TempExcelbuffer."Cell Type"::Number);
                           Entercell(Row,4,FORMAT("<Production BOM Line2>"."Unit of Measure Code"),FALSE,TempExcelbuffer."Cell Type"::Text);
                           Entercell(Row,5,FORMAT("<Production BOM Line2>".Position),FALSE,TempExcelbuffer."Cell Type"::Number);
                        END;
                    //Rev01 <Production BOM Line2>, Body (1) - OnPreSection()
                end;
            }

            trigger OnAfterGetRecord();
            begin
                  IF  choice<>choice::Where_Used THEN
                  CurrReport.BREAK;

                //Rev01 Production BOM Line, Body (3) - OnPreSection()
                    //CurrReport.SHOWOUTPUT(choice=choice::Where_Used);
                     IF PBH.GET("Production BOM Line"."Production BOM No.") THEN
                       DESC:=PBH.Description;
                     IF (choice=choice::Where_Used) AND  excel THEN
                     BEGIN
                       Row+=1;
                       Entercell(Row,1,FORMAT("Production BOM Line"."Production BOM No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                       Entercell(Row,2,DESC,FALSE,TempExcelbuffer."Cell Type"::Text);
                       Entercell(Row,3,FORMAT("Production BOM Line".Quantity),FALSE,TempExcelbuffer."Cell Type"::Number);
                       Entercell(Row,4,FORMAT("Production BOM Line"."Unit of Measure Code"),FALSE,TempExcelbuffer."Cell Type"::Text);
                       Entercell(Row,5,FORMAT("Production BOM Line".Position),FALSE,TempExcelbuffer."Cell Type"::Number);
                       Entercell(Row,6,FORMAT("Production BOM Line".Status),FALSE,TempExcelbuffer."Cell Type"::Text);
                    END;
                //Rev01 Production BOM Line, Body (3) - OnPreSection()
            end;

            trigger OnPreDataItem();
            begin
                  IF  choice<>choice::Where_Used THEN
                  CurrReport.BREAK;
                //Rev01 Production BOM Line, Header (2) - OnPreSection()
                   IF (choice=choice::Where_Used) AND excel THEN
                   BEGIN
                     Row+=1;
                     EnterHeadings(Row,1,'Production BOM',TRUE,TempExcelbuffer."Cell Type"::Text);
                     EnterHeadings(Row,2,'Description',TRUE,TempExcelbuffer."Cell Type"::Text);
                     EnterHeadings(Row,3,'Quantity',TRUE,TempExcelbuffer."Cell Type"::Text);
                     EnterHeadings(Row,4,'UOM',TRUE,TempExcelbuffer."Cell Type"::Text);
                     EnterHeadings(Row,5,'Position',TRUE,TempExcelbuffer."Cell Type"::Text);
                     EnterHeadings(Row,6,'Status',TRUE,TempExcelbuffer."Cell Type"::Text);
                   END;
                //Rev01 Production BOM Line, Header (2) - OnPreSection()
            end;
        }
        dataitem("<Item Ledger Entry1>";"Item Ledger Entry")
        {
            DataItemTableView = SORTING(Item No.,Lot No.,ITL Doc No.) ORDER(Ascending) WHERE(Entry Type=CONST(Transfer),ITL Doc No.=FILTER(<>''),Quantity=FILTER(>0),Remaining Quantity=FILTER(>0),Location Code=FILTER(<>STR&<>'R&D STR'&<>CS STR));
            RequestFilterFields = "Item No.","Lot No.";
            ReqFilterHeading = 'Item Consumption';
            column(COMPANYNAME_Control1102154012;COMPANYNAME)
            {
            }
            column(TODAY_Control1102154013;TODAY)
            {
            }
            column(USERID_Control1102154014;USERID)
            {
            }
            column(Item_Filter;Item_Filter)
            {
            }
            column(Item_Ledger_Entry1___Item_No__;"Item No.")
            {
            }
            column(Item_Desc;Item_Desc)
            {
            }
            column(Item_Ledger_Entry1___ITL_Doc_No__;"ITL Doc No.")
            {
            }
            column(Item_Ledger_Entry1___Lot_No__;"Lot No.")
            {
            }
            column(Item_Ledger_Entry1__Quantity;Quantity)
            {
            }
            column(ITEM_COST;ITEM_COST)
            {
            }
            column(ITEM_COST___Item_Ledger_Entry1___Quantity;ITEM_COST*"<Item Ledger Entry1>".Quantity)
            {
            }
            column(Consumed_Qty;Consumed_Qty)
            {
            }
            column(ROUND_CONSUMPTION_VALUE_0_01_;ROUND(CONSUMPTION_VALUE,0.01))
            {
            }
            column(Item_ConsumptionCaption;Item_ConsumptionCaptionLbl)
            {
            }
            column(Item_Ledger_Entry1___Item_No__Caption;FIELDCAPTION("Item No."))
            {
            }
            column(DescriptionCaption_Control1102154021;DescriptionCaption_Control1102154021Lbl)
            {
            }
            column(Production_Order_No_Caption;Production_Order_No_CaptionLbl)
            {
            }
            column(QTYCaption;QTYCaptionLbl)
            {
            }
            column(Item_Ledger_Entry1___Lot_No__Caption;FIELDCAPTION("Lot No."))
            {
            }
            column(Item_CostCaption;Item_CostCaptionLbl)
            {
            }
            column(Consumed_ValueCaption;Consumed_ValueCaptionLbl)
            {
            }
            column(Item_Ledger_Entry1__Entry_No_;"Entry No.")
            {
            }

            trigger OnAfterGetRecord();
            begin


                ///Grouped
                //Rev01  <Item Ledger Entry1>, GroupFooter (4) - OnPreSection()
                IF (InsertPrevITLDocNo <> '') AND (InsertPrevITLDocNo <> "<Item Ledger Entry1>"."ITL Doc No.") THEN BEGIN //Insert Hack
                   IF Item.GET(InsertPrevItemNo) THEN  //hack
                    Item_Desc:=Item.Description;
                  Consumed_Qty+=GroupTotQty; //Hack

                  ILE.RESET;
                  ILE.SETCURRENTKEY("Item No.","Lot No.","Serial No.");
                  ILE.SETRANGE(ILE."Item No.",InsertPrevItemNo); //hack
                  ILE.SETRANGE(ILE."Lot No.",InsertPrevLotNo);//Hack
                  ILE.SETRANGE(ILE."Entry Type",0);
                  IF ILE.FINDFIRST THEN
                  BEGIN
                    PIL.RESET;
                    PIL.SETCURRENTKEY(Type,"No.","Variant Code","Invoice Date");
                    PIL.SETRANGE(PIL.Type,2);
                    PIL.SETRANGE(PIL."No.",ILE."Item No.");
                    PIL.SETRANGE(PIL."Receipt No.",ILE."Document No.");
                    IF PIL.FINDFIRST THEN
                    BEGIN
                      PH.RESET;
                      PH.SETRANGE(PH."No.",PIL."Document No.");
                      IF PH.FIND('-') THEN
                      BEGIN
                        IF PH."Currency Code"='' THEN
                        BEGIN
                          IF PIL.Quantity>0 THEN
                            ITEM_COST:=(PIL."Amount To Vendor"/PIL.Quantity)/PIL."Qty. per Unit of Measure";
                        END ELSE
                        BEGIN
                          Structure_Amount:=0;
                          StrOrdLineDetails.SETRANGE(StrOrdLineDetails.Type,StrOrdLineDetails.Type::Purchase);
                          StrOrdLineDetails.SETRANGE(StrOrdLineDetails."Document Type",StrOrdLineDetails."Document Type"::Invoice);
                          StrOrdLineDetails.SETRANGE(StrOrdLineDetails."Invoice No.",PIL."Document No.");
                          StrOrdLineDetails.SETRANGE(StrOrdLineDetails."Line No.",PIL."Line No.");
                          IF StrOrdLineDetails.FIND('-') THEN
                          REPEAT
                            IF StrOrdLineDetails."Tax/Charge Type"<>StrOrdLineDetails."Tax/Charge Type"::Dummy THEN
                               Structure_Amount+=StrOrdLineDetails."Amount (LCY)"
                            ELSE
                              Structure_Amount+=StrOrdLineDetails."Calculation Value";
                          UNTIL StrOrdLineDetails.NEXT=0;
                          ITEM_COST:=(((PIL."Unit Cost (LCY)"*PIL.Quantity)+Structure_Amount)/
                                                              PIL.Quantity)/PIL."Qty. per Unit of Measure";
                      END;
                       CONSUMPTION_VALUE+=(GroupTotQty*ITEM_COST); //Hack
                    END ELSE
                    BEGIN
                      IF Item.GET(InsertPrevItemNo) THEN //Hack
                         CONSUMPTION_VALUE+=(GroupTotQty*Item."Item Final Cost"); //hack

                    END;
                  END ELSE
                  BEGIN
                    IF Item.GET(InsertPrevItemNo) THEN //hack
                       CONSUMPTION_VALUE+=(GroupTotQty*Item."Item Final Cost");//hack
                  END;
                END;
                    IF excel THEN
                    BEGIN
                        Row+=1;
                        Entercell(Row,1,InsertPrevItemNo,FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,2,Item_Desc,FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,3,FORMAT(InsertPrevITLDocNo),FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,4,FORMAT(GroupTotQty),FALSE,TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row,5,FORMAT(InsertPrevLotNo),FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,6,FORMAT(ROUND(ITEM_COST,0.01)),FALSE,TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row,7,FORMAT(ROUND(ITEM_COST*GroupTotQty,0.01)),FALSE,TempExcelbuffer."Cell Type"::Number);
                    END;
                END;
                 //Insert Hack
                //Rev01  <Item Ledger Entry1>, GroupFooter (4) - OnPreSection()
                IF PrevITLDocNo <> "<Item Ledger Entry1>"."ITL Doc No." THEN BEGIN
                   PrevITLDocNo := "<Item Ledger Entry1>"."ITL Doc No.";
                   GroupTotQty := 0;
                END;


                GroupTotQty += "<Item Ledger Entry1>".Quantity;
                InsertPrevITLDocNo := '';
                InsertPrevITLDocNo := "<Item Ledger Entry1>"."ITL Doc No.";
                InsertPrevItemNo := '';
                InsertPrevItemNo := "<Item Ledger Entry1>"."Item No.";
                InsertPrevLotNo := '';
                InsertPrevLotNo := "<Item Ledger Entry1>"."Lot No.";
            end;

            trigger OnPostDataItem();
            begin
                IF (InsertPrevITLDocNo <> '')  THEN BEGIN
                   IF Item.GET(InsertPrevItemNo) THEN  //hack
                    Item_Desc:=Item.Description;
                  Consumed_Qty+=GroupTotQty; //Hack

                  ILE.RESET;
                  ILE.SETCURRENTKEY("Item No.","Lot No.","Serial No.");
                  ILE.SETRANGE(ILE."Item No.",InsertPrevItemNo); //hack
                  ILE.SETRANGE(ILE."Lot No.",InsertPrevLotNo);//Hack
                  ILE.SETRANGE(ILE."Entry Type",0);
                  IF ILE.FINDFIRST THEN
                  BEGIN
                    PIL.RESET;
                    PIL.SETCURRENTKEY(Type,"No.","Variant Code","Invoice Date");
                    PIL.SETRANGE(PIL.Type,2);
                    PIL.SETRANGE(PIL."No.",ILE."Item No.");
                    PIL.SETRANGE(PIL."Receipt No.",ILE."Document No.");
                    IF PIL.FINDFIRST THEN
                    BEGIN
                      PH.RESET;
                      PH.SETRANGE(PH."No.",PIL."Document No.");
                      IF PH.FIND('-') THEN
                      BEGIN
                        IF PH."Currency Code"='' THEN
                        BEGIN
                          IF PIL.Quantity>0 THEN
                            ITEM_COST:=(PIL."Amount To Vendor"/PIL.Quantity)/PIL."Qty. per Unit of Measure";
                        END ELSE
                        BEGIN
                          Structure_Amount:=0;
                          StrOrdLineDetails.SETRANGE(StrOrdLineDetails.Type,StrOrdLineDetails.Type::Purchase);
                          StrOrdLineDetails.SETRANGE(StrOrdLineDetails."Document Type",StrOrdLineDetails."Document Type"::Invoice);
                          StrOrdLineDetails.SETRANGE(StrOrdLineDetails."Invoice No.",PIL."Document No.");
                          StrOrdLineDetails.SETRANGE(StrOrdLineDetails."Line No.",PIL."Line No.");
                          IF StrOrdLineDetails.FIND('-') THEN
                          REPEAT
                            IF StrOrdLineDetails."Tax/Charge Type"<>StrOrdLineDetails."Tax/Charge Type"::Dummy THEN
                               Structure_Amount+=StrOrdLineDetails."Amount (LCY)"
                            ELSE
                              Structure_Amount+=StrOrdLineDetails."Calculation Value";
                          UNTIL StrOrdLineDetails.NEXT=0;
                          ITEM_COST:=(((PIL."Unit Cost (LCY)"*PIL.Quantity)+Structure_Amount)/
                                                              PIL.Quantity)/PIL."Qty. per Unit of Measure";
                      END;
                       CONSUMPTION_VALUE+=(GroupTotQty*ITEM_COST); //Hack
                    END ELSE
                    BEGIN
                      IF Item.GET(InsertPrevItemNo) THEN //Hack
                         CONSUMPTION_VALUE+=(GroupTotQty*Item."Item Final Cost"); //hack

                    END;
                  END ELSE
                  BEGIN
                    IF Item.GET(InsertPrevItemNo) THEN //hack
                       CONSUMPTION_VALUE+=(GroupTotQty*Item."Item Final Cost");//hack
                  END;
                END;
                    IF excel THEN
                    BEGIN
                        Row+=1;
                        Entercell(Row,1,InsertPrevItemNo,FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,2,Item_Desc,FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,3,FORMAT(InsertPrevITLDocNo),FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,4,FORMAT(GroupTotQty),FALSE,TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row,5,FORMAT(InsertPrevLotNo),FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,6,FORMAT(ROUND(ITEM_COST,0.01)),FALSE,TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row,7,FORMAT(ROUND(ITEM_COST*GroupTotQty,0.01)),FALSE,TempExcelbuffer."Cell Type"::Number);
                    END;

                END;
                Row+=1;
                     EnterHeadings(Row,4,FORMAT(Consumed_Qty),TRUE,TempExcelbuffer."Cell Type"::Number);
                     EnterHeadings(Row,7,FORMAT(ROUND(CONSUMPTION_VALUE,0.01)),TRUE,TempExcelbuffer."Cell Type"::Number);
            end;

            trigger OnPreDataItem();
            begin
                  IF  choice<>choice::Item_Consumption THEN
                  CurrReport.BREAK;
                  Item_Filter:="<Item Ledger Entry1>".GETFILTERS;
                //Rev01 <Item Ledger Entry1>, Header (2) - OnPreSection()
                IF (choice=choice::Item_Consumption) AND excel THEN
                BEGIN
                  Row+=1;
                  EnterHeadings(Row,1,'Item No.',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,2,'Description',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,3,'Production Order No.',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,4,'Quantity',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,5,'Lot No.',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,6,'Item Cost',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,7,'Consumed Value',TRUE,TempExcelbuffer."Cell Type"::Text);
                END;
                //Rev01 <Item Ledger Entry1>, Header (2) - OnPreSection()


                InsertPrevITLDocNo := '';
                GroupTotQty := 0;
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
                    field(choice;choice)
                    {
                        Caption = 'Choice';
                    }
                    field(excel;excel)
                    {
                        Caption = 'Excel';
                    }
                    field("Final Serial No.";'')
                    {
                        Caption = 'Final Serial No.';
                        Style = Strong;
                        StyleExpr = TRUE;
                    }
                    field("Item No";"Item No")
                    {
                        Caption = 'Enter Item No.';
                        TableRelation = Item;

                        trigger OnValidate();
                        begin
                               "Serial No":='';
                               Item_Lot_Num.DELETEALL;
                               Entry_No:=0;
                               ILE.SETCURRENTKEY(ILE."Item No.",ILE."Lot No.",ILE."Serial No.");
                               Itemno:= "Item No";
                               IF COPYSTR("Item No",1,5)  = 'ECPCB' THEN
                               BEGIN
                                 PCB:="Item No";
                               REPEAT
                                 PVC.RESET;
                                 PVC.SETFILTER(PVC."PCB No2",PCB);
                                 IF PVC.FINDFIRST THEN
                                 BEGIN
                                   PCB:= PVC."PCB No";
                                   Itemno:=Itemno+'|'+PVC."PCB No";
                                 END
                                 ELSE
                                   k:=10;
                               UNTIL k=10;
                            
                               PCB:="Item No";
                               REPEAT
                                 PVC.RESET;
                                 PVC.SETFILTER(PVC."PCB No",PCB);
                                 IF PVC.FINDFIRST THEN
                                 BEGIN
                                   PCB:= PVC."PCB No2";
                                    Itemno:=Itemno+'|'+PVC."PCB No2";
                                 END
                                 ELSE
                                   k:=10;
                               UNTIL k=10;
                            
                               END;
                               ILE.SETFILTER(ILE."Item No.",Itemno);
                               ILE.SETFILTER(ILE."Entry Type",'purchase|Positive Adjmt.');
                              // MESSAGE(Itemno);
                            // Added by Rakesh on 4-Jun-14
                               IF ILE.FINDSET THEN
                               BEGIN
                                 IF ILE.FINDLAST THEN
                                   "Serial No":=ILE."Serial No.";
                               END;
                            // End by rakesh
                            
                            //Commented by Rakesh on 5-Jun-14
                            /*  IF ILE.FINDSET THEN
                               REPEAT
                                 IF STRLEN(ILE."Serial No.")>1 THEN
                                 BEGIN
                            
                                   IF (COPYSTR(ILE."Serial No.",STRLEN(ILE."Serial No."))<>'A'){  AND
                                      (COPYSTR(ILE."Serial No.",1,1)<>'O')} THEN
                                   BEGIN
                                     Item_Lot_Num.INIT;
                                     Item_Lot_Num."Entry Type":=Item_Lot_Num."Entry Type"::Transfer;
                                     Entry_No+=1;
                                     Item_Lot_Num."Entry No.":=Entry_No;
                                     Item_Lot_Num."Item No.":=ILE."Item No.";
                                     Item_Lot_Num."Location Code":= ILE."Serial No.";
                                     //EVALUATE(Item_Lot_Num.Quantity,ILE."Serial No.");
                                     Item_Lot_Num.INSERT;
                                   END;
                                 END;
                               UNTIL ILE.NEXT=0;
                               Item_Lot_Num.SETCURRENTKEY(Item_Lot_Num."Item No.",
                                                          Item_Lot_Num."Location Code");
                               IF Item_Lot_Num.FINDLAST THEN
                                 "Serial No":=Item_Lot_Num."Location Code";
                            *///Rakesh
                            
                                  /* Item_Lot_Num.DELETEALL;
                               Entry_No:=0;
                               ILE.SETCURRENTKEY(ILE."Item No.",ILE."Lot No.",ILE."Serial No.");
                            
                               ILE.SETRANGE(ILE."Item No.","Item No");
                               ILE.SETFILTER(ILE."Entry Type",'purchase|Positive Adjmt.');
                            
                               IF ILE.FINDSET THEN
                               REPEAT
                                 IF STRLEN(ILE."Serial No.")>1 THEN
                                 BEGIN
                            
                                   IF (COPYSTR(ILE."Serial No.",STRLEN(ILE."Serial No."))<>'A')  AND
                                      (COPYSTR(ILE."Serial No.",1,1)<>'O') THEN
                                   BEGIN
                                     Item_Lot_Num.INIT;
                                     Item_Lot_Num."Entry Type":=Item_Lot_Num."Entry Type"::Transfer;
                                     Entry_No+=1;
                                     Item_Lot_Num."Entry No.":=Entry_No;
                                     Item_Lot_Num."Item No.":=ILE."Item No.";
                                     Item_Lot_Num."Location Code":=ILE."Serial No.";
                                     Item_Lot_Num.INSERT;
                                   END;
                                 END;
                               UNTIL ILE.NEXT=0;
                               Item_Lot_Num.SETCURRENTKEY(Item_Lot_Num."Item No.",
                                                          Item_Lot_Num."Location Code",
                                                          Item_Lot_Num."Posting Date");
                               IF Item_Lot_Num.FINDLAST THEN
                                 "Serial No":=Item_Lot_Num."Location Code";*/
                              /*
                               ILE.SETCURRENTKEY(ILE."Item No.",ILE."Lot No.",ILE."Serial No.");
                               ILE.SETRANGE(ILE."Item No.","Item No");
                               ILE.SETFILTER(ILE."Entry Type",'purchase|Positive Adjmt.');
                               IF ILE.FINDLAST THEN
                                 "Serial No":=ILE."Serial No.";       */

                        end;
                    }
                    field("Serial No";"Serial No")
                    {
                        Caption = 'Last Serial No.';

                        trigger OnValidate();
                        begin
                               ILE.SETCURRENTKEY(ILE."Item No.",ILE."Lot No.",ILE."Serial No.");
                               ILE.SETFILTER(ILE."Entry Type",'purchase');
                               ILE.SETRANGE(ILE."Item No.","Item No");
                               IF ILE.FIND('-') THEN
                        end;
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

    trigger OnInitReport();
    begin
            IF AI=0 THEN
            AI:=12;
            IF IWP=0 THEN
            IWP:=5;
            Day:=WORKDATE;
    end;

    trigger OnPostReport();
    begin
        IF excel THEN
        BEGIN
          /*
          TempExcelbuffer.CreateBook('Report','');//Rev01 //EFFUPG
          TempExcelbuffer.WriteSheet('Report',COMPANYNAME,USERID);//Rev01
          TempExcelbuffer.CloseBook; //Rev01
          TempExcelbuffer.OpenExcel; //Rev01
          TempExcelbuffer.GiveUserControl;//Rev01
          */
          TempExcelbuffer.CreateBookAndOpenExcel('','Report','Report',COMPANYNAME,USERID); //EFFUPG
        END;

    end;

    trigger OnPreReport();
    begin
           IF excel THEN
           BEGIN
             CLEAR(TempExcelbuffer);
             TempExcelbuffer.DELETEALL;
           END;
    end;

    var
        POL : Record "Prod. Order Line";
        PO : Record "Production Order";
        SH : Record "Sales Header";
        Pc : Code[30];
        SO : Code[30];
        CName : Text[50];
        PBMH : Record "Production BOM Header";
        PBM : Code[30];
        "Compund Desc" : Text[30];
        Item : Record Item;
        Description : Text[100];
        Description1 : Text[100];
        Description2 : Text[100];
        Item2 : Record Item;
        choice : Option Track,Where_Used,Item_Consumption;
        ILE : Record "Item Ledger Entry";
        "Vendor Name" : Text[30];
        Vendor : Record Vendor;
        "Bill No." : Code[30];
        PH : Record "Purch. Inv. Header";
        "Bill Date" : Date;
        PRH : Record "Purch. Rcpt. Header";
        "Inward Date" : Date;
        "Idle Period" : Integer;
        PIL : Record "Purch. Inv. Line";
        UC : Decimal;
        Intrest : Decimal;
        AI : Decimal;
        IWP : Integer;
        IC : Decimal;
        "Total Intrest" : Decimal;
        "Total Intrest(S.O)" : Decimal;
        Max_Ordr_No : Code[10];
        Min_Order_No : Code[10];
        Min_date : Date;
        Max_Date : Date;
        Total_QTY : Decimal;
        SNO : Integer;
        PRL : Record "Purch. Rcpt. Line";
        Day : Date;
        PBH : Record "Production BOM Header";
        DESC : Text[100];
        "Item No" : Code[30];
        "Serial No" : Code[30];
        Issued_To : Text[150];
        PMIH : Record "Posted Material Issues Header";
        MC : Record "Machine Center";
        Item_Filter : Text[100];
        Item_Desc : Text[30];
        Item_Lot_Num : Record "Batch and Serial No's" temporary;
        Entry_No : Integer;
        TEMP_SERIAL : Text[30];
        CONSUMPTION_VALUE : Decimal;
        StrOrdLineDetails : Record "Posted Str Order Line Details";
        ITEM_COST : Decimal;
        Structure_Amount : Decimal;
        Consumed_Qty : Decimal;
        excel : Boolean;
        TempExcelbuffer : Record "Excel Buffer" temporary;
        Row : Integer;
        ILE1 : Record "Item Ledger Entry";
        "S.No" : Code[10];
        PVC : Record "PCB Version Control";
        k : Integer;
        PCB : Code[20];
        Itemno : Code[250];
        Item_TrackingCaptionLbl : Label 'Item Tracking';
        Production_BOM_sCaptionLbl : Label 'Production BOM''s';
        Project_CodeCaptionLbl : Label 'Project Code';
        Sales_OrderCaptionLbl : Label 'Sales Order';
        Customer_NameCaptionLbl : Label 'Customer Name';
        CPCB_NOCaptionLbl : Label 'CPCB NO';
        Lot_No_CaptionLbl : Label 'Lot No.';
        Serial_No_CaptionLbl : Label 'Serial No.';
        CPCB_DescriptionCaptionLbl : Label 'CPCB Description';
        DescriptionCaptionLbl : Label 'Description';
        Vendor_NameCaptionLbl : Label 'Vendor Name';
        Bill_No_CaptionLbl : Label 'Bill No.';
        Invoice_DateCaptionLbl : Label 'Invoice Date';
        Issued_toCaptionLbl : Label 'Issued to';
        Request_No_CaptionLbl : Label 'Request No.';
        Item_Where_UsedCaptionLbl : Label 'Item Where Used';
        UOMCaptionLbl : Label 'UOM';
        DescriptionCaption_Control1000000115Lbl : Label 'Description';
        Item_ConsumptionCaptionLbl : Label 'Item Consumption';
        DescriptionCaption_Control1102154021Lbl : Label 'Description';
        Production_Order_No_CaptionLbl : Label 'Production Order No.';
        QTYCaptionLbl : Label 'QTY';
        Item_CostCaptionLbl : Label 'Item Cost';
        Consumed_ValueCaptionLbl : Label 'Consumed Value';
        "--Rev01" : Integer;
        PrevITLDocNo : Code[20];
        GroupTotQty : Decimal;
        InsertPrevITLDocNo : Code[20];
        InsertPrevItemNo : Code[20];
        InsertPrevLotNo : Code[20];

    (325)]
    procedure Entercell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[1000];bold : Boolean;CellType : Option);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.",RowNo);
        TempExcelbuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelbuffer."Cell Value as Text" := CellValue;
        TempExcelbuffer.Bold:=bold ;
        TempExcelbuffer."Cell Type" := CellType;
        TempExcelbuffer.INSERT;
    end;

    (334)]
    procedure EnterHeadings(RowNo : Integer;ColumnNo : Integer;CellValue : Text[100];Bold : Boolean;CellType : Option);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.",RowNo);
        TempExcelbuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelbuffer."Cell Value as Text" := FORMAT(CellValue);
        TempExcelbuffer.Bold:=Bold ;
        TempExcelbuffer."Cell Type" := CellType;
        TempExcelbuffer.Formula := '';
        TempExcelbuffer.INSERT;
    end;
}

