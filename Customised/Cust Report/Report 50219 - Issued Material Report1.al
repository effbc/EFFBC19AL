report 50219 "Issued Material Report1"
{
    // version santhosh,EFFUPG

    //      EnterHeadings(Row,21,'Vendor Name',TRUE);
    //      EnterHeadings(Row,22,'Inward Date',TRUE);
    //      EnterHeadings(Row,23,'Purchase Order No.',TRUE);
    //      EnterHeadings(Row,24, 'Vendor Shipment No.',TRUE);
    DefaultLayout = RDLC;
    RDLCLayout = './Issued Material Report1.rdlc';


    dataset
    {
        dataitem("<Production Order1>"; "Production Order")
        {
            DataItemTableView = SORTING(Status, No.) ORDER(Ascending) WHERE(Status = FILTER(>= Released));
            RequestFilterFields = "No.", "Source No.";
            column(Production_Order1__Status; Status)
            {
            }
            column(Production_Order1__No_; "No.")
            {
            }
            dataitem("Posted Material Issues Header"; "Posted Material Issues Header")
            {
                DataItemLink = Prod. Order No.=FIELD(No.);
                DataItemTableView = SORTING(Prod. Order No., Prod. Order Line No.);
                RequestFilterFields = "Material Issue No.", "Posting Date", "Resource Name", "Reason Code", "Transfer-to Code", "Transfer-from Code", "Prod. Order No.";
                column(COMPANYNAME; COMPANYNAME)
                {
                }
                column(USERID; USERID)
                {
                }
                column(TODAY; TODAY)
                {
                }
                column(COMPANYNAME_Control1102154003; COMPANYNAME)
                {
                }
                column(USERID_Control1102154016; USERID)
                {
                }
                column(TODAY_Control1102154017; TODAY)
                {
                }
                column(Posted_Material_Issues_Header__Prod__Order_No__; "Prod. Order No.")
                {
                }
                column(Project_Desc; Project_Desc)
                {
                }
                column(Project_Total_; "Project Total")
                {
                }
                column(R_D_total_; "R&D total")
                {
                }
                column(Total; Total)
                {
                }
                column(Total_Qty; Total_Qty)
                {
                }
                column(Material_IssuesCaption; Material_IssuesCaptionLbl)
                {
                }
                column(Project_CodeCaption; Project_CodeCaptionLbl)
                {
                }
                column(Requisition_NoCaption; Requisition_NoCaptionLbl)
                {
                }
                column(Item_Caption; Item_CaptionLbl)
                {
                }
                column(UOMCaption; UOMCaptionLbl)
                {
                }
                column(Employee_NameCaption; Employee_NameCaptionLbl)
                {
                }
                column(Reqested_DateCaption; Reqested_DateCaptionLbl)
                {
                }
                column(DeptCaption; DeptCaptionLbl)
                {
                }
                column(Quantity_RequestedCaption; Quantity_RequestedCaptionLbl)
                {
                }
                column(Quantity_ReceivedCaption; Quantity_ReceivedCaptionLbl)
                {
                }
                column(Unit_costCaption; Unit_costCaptionLbl)
                {
                }
                column(LOT_No_Caption; LOT_No_CaptionLbl)
                {
                }
                column(Serial_No_Caption; Serial_No_CaptionLbl)
                {
                }
                column(Bench_MarkCaption; Bench_MarkCaptionLbl)
                {
                }
                column(Vendor_NameCaption; Vendor_NameCaptionLbl)
                {
                }
                column(Bill_No_Caption; Bill_No_CaptionLbl)
                {
                }
                column(Bill_DateCaption; Bill_DateCaptionLbl)
                {
                }
                column(Issued_Date_TimeCaption; Issued_Date_TimeCaptionLbl)
                {
                }
                column(Material_IssuesCaption_Control1102154002; Material_IssuesCaption_Control1102154002Lbl)
                {
                }
                column(Project_CodeCaption_Control1102154004; Project_CodeCaption_Control1102154004Lbl)
                {
                }
                column(ValueCaption; ValueCaptionLbl)
                {
                }
                column(Project_DescriptionCaption; Project_DescriptionCaptionLbl)
                {
                }
                column(Posted_Material_Issues_Header_No_; "No.")
                {
                }
                dataitem("Posted Material Issues Line"; "Posted Material Issues Line")
                {
                    DataItemLink = Document No.=FIELD(No.);
                    DataItemTableView = SORTING(Document No., Item No.) WHERE(Quantity = FILTER(> 0));
                    RequestFilterFields = "Item No.";
                    column(Posted_Material_Issues_Header___Reason_Code_; "Posted Material Issues Header"."Reason Code")
                    {
                    }
                    column(Posted_Material_Issues_Line__Material_Issue_No__; "Material Issue No.")
                    {
                    }
                    column(Posted_Material_Issues_Line__Posted_Material_Issues_Line__Description; "Posted Material Issues Line".Description)
                    {
                    }
                    column(Posted_Material_Issues_Line__Unit_of_Measure_; "Unit of Measure")
                    {
                    }
                    column(Posted_Material_Issues_Header___Resource_Name_; "Posted Material Issues Header"."Resource Name")
                    {
                    }
                    column(Posted_Material_Issues_Line__Posted_Material_Issues_Line___Issued_DateTime_; "Posted Material Issues Line"."Issued DateTime")
                    {
                    }
                    column(Posted_Material_Issues_Header___Transfer_from_Code_; "Posted Material Issues Header"."Transfer-from Code")
                    {
                    }
                    column(QTY; QTY)
                    {
                    }
                    column(Posted_Material_Issues_Line__Posted_Material_Issues_Line__Quantity; "Posted Material Issues Line".Quantity)
                    {
                    }
                    column(UC; UC)
                    {
                    }
                    column(Posted_Material_Issues_Header___Released_Date_; "Posted Material Issues Header"."Released Date")
                    {
                    }
                    column(Lot; Lot)
                    {
                    }
                    column(Serial_no_; "Serial no")
                    {
                    }
                    column(Bench_Mark_; "Bench-Mark")
                    {
                    }
                    column(Reason; Reason)
                    {
                    }
                    column(Posted_Material_Issues_Line__Material_Issue_No___Control1000000025; "Material Issue No.")
                    {
                    }
                    column(Posted_Material_Issues_Line__Posted_Material_Issues_Line__Description_Control1000000026; "Posted Material Issues Line".Description)
                    {
                    }
                    column(Posted_Material_Issues_Line__Unit_of_Measure__Control1000000027; "Unit of Measure")
                    {
                    }
                    column(Posted_Material_Issues_Header___Resource_Name__Control1000000028; "Posted Material Issues Header"."Resource Name")
                    {
                    }
                    column(Posted_Material_Issues_Line__Posted_Material_Issues_Line___Issued_DateTime__Control1000000029; "Posted Material Issues Line"."Issued DateTime")
                    {
                    }
                    column(Posted_Material_Issues_Line__Transfer_to_Code_; "Transfer-to Code")
                    {
                    }
                    column(QTY_Control1000000031; QTY)
                    {
                    }
                    column(Posted_Material_Issues_Line__Posted_Material_Issues_Line__Quantity_Control1000000032; "Posted Material Issues Line".Quantity)
                    {
                    }
                    column(UC_Control1000000033; UC)
                    {
                    }
                    column(Posted_Material_Issues_Header___Released_Date__Control1000000036; "Posted Material Issues Header"."Released Date")
                    {
                    }
                    column(Lot_Control1000000041; Lot)
                    {
                    }
                    column(Serial_no__Control1000000042; "Serial no")
                    {
                    }
                    column(Bench_Mark__Control1102154010; "Bench-Mark")
                    {
                    }
                    column(Reason_Control1000000054; Reason)
                    {
                    }
                    column(Posted_Material_Issues_Line__Material_Issue_No___Control1000000055; "Material Issue No.")
                    {
                    }
                    column(Posted_Material_Issues_Line__Posted_Material_Issues_Line__Description_Control1000000056; "Posted Material Issues Line".Description)
                    {
                    }
                    column(Posted_Material_Issues_Line__Unit_of_Measure__Control1000000057; "Unit of Measure")
                    {
                    }
                    column(Posted_Material_Issues_Header___Resource_Name__Control1000000058; "Posted Material Issues Header"."Resource Name")
                    {
                    }
                    column(Posted_Material_Issues_Line__Posted_Material_Issues_Line___Issued_DateTime__Control1000000059; "Posted Material Issues Line"."Issued DateTime")
                    {
                    }
                    column(Posted_Material_Issues_Header___Transfer_from_Code__Control1000000060; "Posted Material Issues Header"."Transfer-from Code")
                    {
                    }
                    column(QTY_Control1000000061; QTY)
                    {
                    }
                    column(Posted_Material_Issues_Line__Posted_Material_Issues_Line__Quantity_Control1000000062; "Posted Material Issues Line".Quantity)
                    {
                    }
                    column(UC_Control1000000063; UC)
                    {
                    }
                    column(Posted_Material_Issues_Header___Released_Date__Control1000000037; "Posted Material Issues Header"."Released Date")
                    {
                    }
                    column(Lot_Control1000000045; Lot)
                    {
                    }
                    column(Serial_no__Control1000000046; "Serial no")
                    {
                    }
                    column(Bench_Mark__Control1102154012; "Bench-Mark")
                    {
                    }
                    column(Posted_Material_Issues_Line__Material_Issue_No___Control1000000015; "Material Issue No.")
                    {
                    }
                    column(Posted_Material_Issues_Line__Posted_Material_Issues_Line__Description_Control1000000013; "Posted Material Issues Line".Description)
                    {
                    }
                    column(Posted_Material_Issues_Line__Unit_of_Measure__Control1000000012; "Unit of Measure")
                    {
                    }
                    column(Posted_Material_Issues_Header___Resource_Name__Control1000000016; "Posted Material Issues Header"."Resource Name")
                    {
                    }
                    column(Posted_Material_Issues_Line__Posted_Material_Issues_Line___Issued_DateTime__Control1000000017; "Posted Material Issues Line"."Issued DateTime")
                    {
                    }
                    column(Posted_Material_Issues_Line__Transfer_to_Code__Control1000000011; "Transfer-to Code")
                    {
                    }
                    column(QTY_Control1000000018; QTY)
                    {
                    }
                    column(Posted_Material_Issues_Line__Posted_Material_Issues_Line__Quantity_Control1000000010; "Posted Material Issues Line".Quantity)
                    {
                    }
                    column(UC_Control1000000019; UC)
                    {
                    }
                    column(Posted_Material_Issues_Header___Released_Date__Control1000000038; "Posted Material Issues Header"."Released Date")
                    {
                    }
                    column(Lot_Control1000000047; Lot)
                    {
                    }
                    column(Serial_no__Control1000000048; "Serial no")
                    {
                    }
                    column(Posted_Material_Issues_Header___Prod__Order_No__; "Posted Material Issues Header"."Prod. Order No.")
                    {
                    }
                    column(Bench_Mark__Control1102154015; "Bench-Mark")
                    {
                    }
                    column(vendor; vendor)
                    {
                    }
                    column(BILLNO__; "BILLNO.")
                    {
                    }
                    column(BillDate; BillDate)
                    {
                    }
                    column(DaysCaption; DaysCaptionLbl)
                    {
                    }
                    column(DaysCaption_Control1102154011; DaysCaption_Control1102154011Lbl)
                    {
                    }
                    column(DaysCaption_Control1102154013; DaysCaption_Control1102154013Lbl)
                    {
                    }
                    column(DaysCaption_Control1102154018; DaysCaption_Control1102154018Lbl)
                    {
                    }
                    column(Posted_Material_Issues_Line_Document_No_; "Document No.")
                    {
                    }
                    column(Posted_Material_Issues_Line_Line_No_; "Line No.")
                    {
                    }
                    column(Posted_Material_Issues_Line_Item_No_; "Item No.")
                    {
                    }

                    trigger OnAfterGetRecord();
                    begin
                        UC := 0;
                        IF Choice1 = Choice1::Damage THEN BEGIN
                            IF NOT (("Posted Material Issues Header"."Reason Code" = 'Damage')
                                OR ("Posted Material Issues Header"."Transfer-to Code" = 'DAMAGE')) THEN
                                CurrReport.SKIP;
                        END ELSE
                            IF Choice1 = Choice1::Normal THEN BEGIN

                                IF "Posted Material Issues Line"."Transfer-to Code" = 'DAMAGE' THEN BEGIN
                                    CurrReport.SKIP;
                                    MESSAGE("Posted Material Issues Line"."Item No.");
                                END;
                            END;
                    end;
                }

                trigger OnPreDataItem();
                begin
                    //IF Choice3<>Choice3::Issue THEN
                    //  CurrReport.BREAK;
                    IF Choice3 = Choice3::Summary THEN
                        CurrReport.BREAK;


                    IF Choice3 = Choice3::WRET THEN
                        CurrReport.BREAK;
                    IF Choice3 = Choice3::Issue THEN BEGIN
                        "Posted Material Issues Header".SETCURRENTKEY("Material Issue No.", "Posting Date", "Resource Name", "Reason Code",
                        "Prod. Order No.", "Transfer-to Code", "Transfer-from Code");
                        IF Choice1 = Choice1::Return THEN BEGIN
                            "Posted Material Issues Header".SETFILTER("Posted Material Issues Header"."Transfer-to Code", 'STR|MCH|CS STR|''R&D STR''');
                            "Posted Material Issues Header".SETFILTER("Posted Material Issues Header"."Reason Code", '<>%1''DAMAGE');
                        END ELSE
                            IF Choice1 = Choice1::Normal THEN BEGIN
                                IF "Posted Material Issues Header".GETFILTER("Posted Material Issues Header"."Transfer-from Code") = '' THEN
                                    "Posted Material Issues Header".SETFILTER("Posted Material Issues Header"."Transfer-from Code", 'STR|MCH|CS STR|''R&D STR''');
                                IF "Posted Material Issues Header".GETFILTER("Posted Material Issues Header"."Transfer-to Code") = '' THEN
                                    "Posted Material Issues Header".SETFILTER("Posted Material Issues Header"."Transfer-to Code", '<>%1''DAMAGE');
                            END ELSE
                                IF Choice1 = Choice1::Damage THEN BEGIN
                                    "Posted Material Issues Header".SETRANGE("Posted Material Issues Header"."Transfer-to Code", 'DAMAGE');
                                END;
                    END ELSE BEGIN
                        SETCURRENTKEY("Prod. Order No.", "Prod. Order Line No.");
                    END;
                end;
            }
        }
        dataitem("Production Order"; "Production Order")
        {
            DataItemTableView = SORTING(Status, No.) WHERE(Location Code=CONST(R&D));
            column(Production_Order_Status; Status)
            {
            }
            column(Production_Order_No_; "No.")
            {
            }
            dataitem("<Posted Material Issues Line1>"; "Posted Material Issues Line")
            {
                DataItemLink = Prod. Order No.=FIELD(No.);
                DataItemTableView = SORTING(Prod. Order No., Item No.) ORDER(Ascending) WHERE(Transfer-from Code=FILTER(STR|'R&D STR'),Quantity=FILTER(>0));
                ReqFilterHeading = 'Summerised Project wise Issues';
                column(COMPANYNAME_Control1102154031;COMPANYNAME)
                {
                }
                column(USERID_Control1102154035;USERID)
                {
                }
                column(TODAY_Control1102154036;TODAY)
                {
                }
                column(Posted_Material_Issues_Line1___Unit_of_Measure_Code_;"Unit of Measure Code")
                {
                }
                column(Posted_Material_Issues_Line1___Item_No__;"Item No.")
                {
                }
                column(Ret_Qty;Ret_Qty)
                {
                }
                column(Value;Value)
                {
                }
                column(Posted_Material_Issues_Line1__Quantity;Quantity)
                {
                }
                column(Posted_Material_Issues_Line1__Description;Description)
                {
                }
                column(Total_Value_;"Total Value")
                {
                }
                column(Material_IssuesCaption_Control1102154030;Material_IssuesCaption_Control1102154030Lbl)
                {
                }
                column(Item_No_Caption;Item_No_CaptionLbl)
                {
                }
                column(ValueCaption_Control1102154033;ValueCaption_Control1102154033Lbl)
                {
                }
                column(DescriptionCaption;DescriptionCaptionLbl)
                {
                }
                column(Issued_QtyCaption;Issued_QtyCaptionLbl)
                {
                }
                column(Return_QtyCaption;Return_QtyCaptionLbl)
                {
                }
                column(Posted_Material_Issues_Line1___Unit_of_Measure_Code_Caption;FIELDCAPTION("Unit of Measure Code"))
                {
                }
                column(Posted_Material_Issues_Line1__Document_No_;"Document No.")
                {
                }
                column(Posted_Material_Issues_Line1__Line_No_;"Line No.")
                {
                }
                column(Posted_Material_Issues_Line1__Prod__Order_No_;"Prod. Order No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    PMIH.SETRANGE(PMIH."No.","<Posted Material Issues Line1>"."Document No.");
                    IF PMIH.FIND('-') THEN
                    BEGIN
                      IF PMIH."Posting Date"<040108D THEN
                        CurrReport.SKIP;
                    END;
                end;

                trigger OnPreDataItem();
                begin
                    //IF Choice3<>Choice3::WRET THEN
                    //CurrReport.BREAK;
                end;
            }

            trigger OnPreDataItem();
            begin
                //IF Choice3<>Choice3::Project THEN
                //CurrReport.BREAK;
                 IF Choice3=Choice3::Summary THEN
                    CurrReport.BREAK;


                "Production Order".SETFILTER("Production Order"."No.",
                                             "Posted Material Issues Header".GETFILTER("Prod. Order No."));
            end;
        }
        dataitem("Integer";"Integer")
        {
            DataItemTableView = SORTING(Number);

            trigger OnAfterGetRecord();
            begin
                IF "BREAK" THEN
                   CurrReport.BREAK;
                IF ItemLotNumbers.NEXT=0 THEN
                "BREAK":=TRUE;
            end;

            trigger OnPreDataItem();
            begin
                 IF Choice3<>Choice3::Summary THEN
                    CurrReport.BREAK;
                "Str Rdso report".DELETEALL;
                IF (Sales_Order_No<>'') AND (Item_No<>'') AND ((Posting_From_Date=0D) AND (Posting_To_Date=0D)) AND (Lot='') THEN
                BEGIN
                  "Posted Material Issues Line".SETCURRENTKEY("Posted Material Issues Line"."Item No.",
                                                              "Posted Material Issues Line"."Transfer-from Code",
                                                              "Posted Material Issues Line"."Issued DateTime");
                  "Posted Material Issues Line".SETRANGE("Posted Material Issues Line"."Item No.",Item_No);
                  "Posted Material Issues Line".SETRANGE("Posted Material Issues Line"."Transfer-from Code",'STR');
                  "Posted Material Issues Line".SETRANGE("Posted Material Issues Line"."Transfer-to Code",'PROD');
                  IF "Posted Material Issues Line".FIND('-') THEN
                  REPEAT
                    "Posted Material Issues Header".RESET;
                    "Posted Material Issues Header".SETRANGE("Posted Material Issues Header"."No.","Posted Material Issues Line"."Document No.");
                    IF "Posted Material Issues Header".FIND('-') THEN
                    BEGIN
                      PO.RESET;
                      PO.SETRANGE(PO."No.","Posted Material Issues Header"."Prod. Order No.");
                      IF PO.FIND('-') THEN
                      BEGIN
                        IF Item.GET(PO."Source No.") AND  (PO."Sales Order No."=Sales_Order_No) THEN
                        BEGIN
                          ILE.RESET;
                          ILE.SETCURRENTKEY(ILE."Document No.",ILE."Item No.",ILE."Posting Date");
                          ILE.SETRANGE(ILE."Document No.","Posted Material Issues Line"."Document No.");
                          ILE.SETRANGE(ILE."Item No.",Item_No);
                          ILE.SETRANGE(ILE."Location Code",'STR');
                          IF ILE.FIND('-') THEN
                          BEGIN
                            /*  ItemLotNumbers.SETRANGE(ItemLotNumbers."Item No",Item_No);
                               ItemLotNumbers.SETRANGE(ItemLotNumbers."Sales Order No.",Sales_Order_No);
                               ItemLotNumbers.SETRANGE(ItemLotNumbers."Product Type",Item."Item Sub Group Code");
                               ItemLotNumbers.SETRANGE(ItemLotNumbers."Suitable Vendor",ILE."Lot No.");
                               IF ItemLotNumbers.FIND('-') THEN
                               BEGIN
                                 ItemLotNumbers.Shortage+="Posted Material Issues Line".Quantity;
                
                                 IF ItemLotNumbers."Production Orders">"Posted Material Issues Line"."Prod. Order No." THEN
                                    ItemLotNumbers."Production Orders":="Posted Material Issues Line"."Prod. Order No.";
                                 IF ItemLotNumbers."Indent No."<"Posted Material Issues Line"."Prod. Order No." THEN
                                    ItemLotNumbers."Indent No.":="Posted Material Issues Line"."Prod. Order No.";
                                 ItemLotNumbers.MODIFY;
                               END ELSE
                               BEGIN
                                 ItemLotNumbers.INIT;
                                 ItemLotNumbers."Item No":="Posted Material Issues Line"."Item No.";
                                 ItemLotNumbers.Description:="Posted Material Issues Line".Description;
                                 ItemLotNumbers."Planned Purchase Date":=TODAY;
                                 ItemLotNumbers."Production Order No.":="Posted Material Issues Line"."Prod. Order No.";
                                 ItemLotNumbers."Sales Order No.":="Posted Material Issues Line".Saleorderno;
                                 ItemLotNumbers."Product Type":=Item."Item Sub Group Code";
                                 ItemLotNumbers.Product:="Production Order"."Source No.";
                                 ItemLotNumbers.Shortage:="Posted Material Issues Line".Quantity;
                                 ItemLotNumbers."Production Orders":="Posted Material Issues Line"."Prod. Order No.";
                                 ItemLotNumbers."Indent No.":="Posted Material Issues Line"."Prod. Order No.";
                                 ItemLotNumbers."Suitable Vendor":=ILE."Lot No.";
                                 ItemLotNumbers.INSERT;
                               END; */
                            IF NOT("Str Rdso report".GET("Posted Material Issues Line"."Document No.")) THEN
                            BEGIN
                              "Str Rdso report".INIT;
                              "Str Rdso report"."Issue No.":="Posted Material Issues Line"."Document No.";
                              "Str Rdso report"."Issue Line No.":="Posted Material Issues Line"."Line No.";
                              "Str Rdso report"."Item No.":="Posted Material Issues Line"."Item No.";
                              "Str Rdso report".Description:="Posted Material Issues Line".Description;
                              "Str Rdso report"."Production Order":="Posted Material Issues Header"."Prod. Order No.";
                              "Str Rdso report"."Sales Order No.":=PO."Sales Order No.";
                              "Str Rdso report"."Product No.":="Production Order"."Source No.";
                              "Str Rdso report"."Issued Qty":="Posted Material Issues Line".Quantity;
                              "Str Rdso report".Lot:=ILE."Lot No.";
                              "Str Rdso report".INSERT;
                            END ELSE
                            BEGIN
                              "Str Rdso report"."Issued Qty"+="Posted Material Issues Line".Quantity;
                              "Str Rdso report".MODIFY;
                            END;
                
                          END;
                        END;
                      END;
                    END;
                  UNTIL "Posted Material Issues Line".NEXT=0;
                END ELSE
                IF (Sales_Order_No='') AND (Item_No<>'') AND ((Posting_From_Date>0D) AND (Posting_To_Date>0D)) AND (Lot='') THEN
                BEGIN
                  ILE.RESET;
                  ILE.SETCURRENTKEY(ILE."Item No.",ILE.Open,ILE."Variant Code",ILE.Positive,ILE."Location Code",ILE."Posting Date");
                  ILE.SETRANGE(ILE."Item No.",Item_No);
                  ILE.SETRANGE(ILE."Location Code",'STR');
                  ILE.SETRANGE(ILE."Posting Date",Posting_From_Date,Posting_To_Date);
                  ILE.SETFILTER(ILE."Entry Type",'Transfer');
                  IF ILE.FIND('-') THEN
                  REPEAT
                    "Posted Material Issues Line".RESET;
                    "Posted Material Issues Line".SETRANGE("Posted Material Issues Line"."Document No.",ILE."Document No.");
                    "Posted Material Issues Line".SETRANGE("Posted Material Issues Line"."Item No.",ILE."Item No.");
                    IF "Posted Material Issues Line".FIND('-') THEN
                    BEGIN
                      "Posted Material Issues Header".RESET;
                      "Posted Material Issues Header".SETRANGE("Posted Material Issues Header"."No.","Posted Material Issues Line"."Document No.");
                      IF "Posted Material Issues Header".FIND('-') THEN
                      BEGIN
                        PO.RESET;
                        PO.SETRANGE(PO."No.","Posted Material Issues Header"."Prod. Order No.");
                        IF PO.FIND('-') THEN
                        BEGIN
                          IF Item.GET(PO."Source No.") THEN
                          BEGIN
                            /*  ItemLotNumbers.SETRANGE(ItemLotNumbers."Item No",Item_No);
                               ItemLotNumbers.SETRANGE(ItemLotNumbers."Sales Order No.",PO."Sales Order No.");
                               ItemLotNumbers.SETRANGE(ItemLotNumbers."Product Type",Item."Item Sub Group Code");
                               ItemLotNumbers.SETRANGE(ItemLotNumbers."Suitable Vendor",ILE."Lot No.");
                               IF ItemLotNumbers.FIND('-') THEN
                               BEGIN
                                 ItemLotNumbers.Shortage+="Posted Material Issues Line".Quantity;
                                 IF ItemLotNumbers."Production Orders">"Posted Material Issues Line"."Prod. Order No." THEN
                                    ItemLotNumbers."Production Orders":="Posted Material Issues Line"."Prod. Order No.";
                                 IF ItemLotNumbers."Indent No."<"Posted Material Issues Line"."Prod. Order No." THEN
                                    ItemLotNumbers."Indent No.":="Posted Material Issues Line"."Prod. Order No.";
                                 ItemLotNumbers.MODIFY;
                               END ELSE
                               BEGIN
                                 ItemLotNumbers.INIT;
                                 ItemLotNumbers."Item No":="Posted Material Issues Line"."Item No.";
                                 ItemLotNumbers.Description:="Posted Material Issues Line".Description;
                                 ItemLotNumbers."Planned Purchase Date":=TODAY;
                                 ItemLotNumbers."Production Order No.":="Posted Material Issues Line"."Prod. Order No.";
                                 ItemLotNumbers."Sales Order No.":=PO."Sales Order No.";
                                 ItemLotNumbers."Product Type":=Item."Item Sub Group Code";
                                 ItemLotNumbers.Product:="Production Order"."Source No.";
                                 ItemLotNumbers.Shortage:="Posted Material Issues Line".Quantity;
                                 ItemLotNumbers."Production Orders":="Posted Material Issues Line"."Prod. Order No.";
                                 ItemLotNumbers."Indent No.":="Posted Material Issues Line"."Prod. Order No.";
                                 ItemLotNumbers."Suitable Vendor":=ILE."Lot No.";
                                 ItemLotNumbers.INSERT;
                               END ; */
                            IF NOT("Str Rdso report".GET("Posted Material Issues Line"."Document No.")) THEN
                            BEGIN
                              "Str Rdso report".INIT;
                              "Str Rdso report"."Issue No.":="Posted Material Issues Line"."Document No.";
                              "Str Rdso report"."Issue Line No.":="Posted Material Issues Line"."Line No.";
                              "Str Rdso report"."Item No.":="Posted Material Issues Line"."Item No.";
                              "Str Rdso report".Description:="Posted Material Issues Line".Description;
                              "Str Rdso report"."Production Order":="Posted Material Issues Line"."Prod. Order No.";
                              "Str Rdso report"."Sales Order No.":=PO."Sales Order No.";
                              "Str Rdso report"."Product No.":=PO."Source No.";
                              "Str Rdso report"."Issued Qty":="Posted Material Issues Line".Quantity;
                              "Str Rdso report".Lot:=ILE."Lot No.";
                              "Str Rdso report".INSERT;
                            END ELSE
                            BEGIN
                              "Str Rdso report"."Issued Qty"+="Posted Material Issues Line".Quantity;
                              "Str Rdso report".MODIFY;
                            END;
                
                          END;
                        END;
                      END;
                    END;
                  UNTIL ILE.NEXT=0;
                
                END ELSE
                IF (Sales_Order_No='') AND (Item_No<>'') AND ((Posting_From_Date=0D) AND (Posting_To_Date=0D)) AND (Lot<>'') THEN
                BEGIN
                  ILE.RESET;
                  ILE.SETCURRENTKEY(ILE."Entry Type",ILE."Lot No.",ILE."Item No.");
                  ILE.SETFILTER(ILE."Entry Type",'Transfer');
                  ILE.SETRANGE(ILE."Lot No.",Lot);
                  ILE.SETRANGE(ILE."Item No.",Item_No);
                  ILE.SETRANGE(ILE."Location Code",'STR');
                  IF ILE.FIND('-') THEN
                  REPEAT
                    "Posted Material Issues Line".SETRANGE("Posted Material Issues Line"."Document No.",ILE."Document No.");
                    "Posted Material Issues Line".SETRANGE("Posted Material Issues Line"."Item No.",ILE."Item No.");
                    IF "Posted Material Issues Line".FIND('-') THEN
                    BEGIN
                      "Posted Material Issues Header".RESET;
                      "Posted Material Issues Header".SETRANGE("Posted Material Issues Header"."No.","Posted Material Issues Line"."Document No.");
                      IF "Posted Material Issues Header".FIND('-') THEN
                      BEGIN
                        PO.RESET;
                        PO.SETRANGE(PO."No.","Posted Material Issues Line"."Prod. Order No.");
                        IF PO.FIND('-') THEN
                        BEGIN
                          IF Item.GET(PO."Source No.") THEN
                          BEGIN
                            /*Sales_Order_No:=PO."Sales Order No.";
                              //ItemLotNumbers.RESET;
                              ItemLotNumbers.SETRANGE(ItemLotNumbers."Item No",Item_No);
                              ItemLotNumbers.SETRANGE(ItemLotNumbers."Sales Order No.",PO."Sales Order No.");
                              ItemLotNumbers.SETRANGE(ItemLotNumbers."Product Type",Item."Item Sub Group Code");
                              ItemLotNumbers.SETRANGE(ItemLotNumbers."Suitable Vendor",ILE."Lot No.");
                              IF NOT(ItemLotNumbers.FIND('-')) THEN
                              BEGIN
                                ItemLotNumbers.INIT;
                                ItemLotNumbers."Item No":=ILE."Item No.";
                                ItemLotNumbers.Description:="Posted Material Issues Line".Description;
                                ItemLotNumbers."Planned Purchase Date":=TODAY;
                                ItemLotNumbers."Production Order No.":=PO."No.";
                                ItemLotNumbers."Sales Order No.":=PO."Sales Order No.";
                                ItemLotNumbers."Product Type":=Item."Item Sub Group Code";
                                ItemLotNumbers.Product:="Production Order"."Source No.";
                                ItemLotNumbers.Shortage:=ABS(ILE.Quantity);
                                ItemLotNumbers."Production Orders":=PO."No.";
                                ItemLotNumbers."Indent No.":=PO."No.";
                                ItemLotNumbers."Suitable Vendor":=ILE."Lot No.";
                                ItemLotNumbers.INSERT;
                              END ELSE
                              BEGIN
                                ItemLotNumbers.Shortage+=ABS(ILE.Quantity);
                                IF ItemLotNumbers."Production Orders">PO."No." THEN
                                   ItemLotNumbers."Production Orders":=PO."No.";
                                IF ItemLotNumbers."Indent No."<PO."No." THEN
                                   ItemLotNumbers."Indent No.":=PO."No.";
                                ItemLotNumbers.MODIFY;
                             END;*/
                            IF NOT("Str Rdso report".GET("Posted Material Issues Line"."Document No.")) THEN
                            BEGIN
                              "Str Rdso report".INIT;
                              "Str Rdso report"."Issue No.":="Posted Material Issues Line"."Document No.";
                              "Str Rdso report"."Issue Line No.":="Posted Material Issues Line"."Line No.";
                              "Str Rdso report"."Item No.":="Posted Material Issues Line"."Item No.";
                              "Str Rdso report".Description:="Posted Material Issues Line".Description;
                              "Str Rdso report"."Production Order":="Posted Material Issues Line"."Prod. Order No.";
                              "Str Rdso report"."Sales Order No.":=PO."Sales Order No.";
                              "Str Rdso report"."Product No.":="Production Order"."Source No.";
                              "Str Rdso report"."Issued Qty":="Posted Material Issues Line".Quantity;
                              "Str Rdso report".Lot:=ILE."Lot No.";
                              "Str Rdso report".INSERT;
                            END ELSE
                            BEGIN
                              "Str Rdso report"."Issued Qty"+="Posted Material Issues Line".Quantity;
                              "Str Rdso report".MODIFY;
                            END;
                          END;
                        END;
                      END;
                    END;
                  UNTIL ILE.NEXT=0;
                
                END ELSE
                  ERROR(' PLEASE ENTER CORRECT COMBINTAION OF I/P');
                
                //ItemLotNumbers.RESET;
                IF ItemLotNumbers.FIND('-') THEN

            end;
        }
        dataitem("Str Rdso report";"Str Rdso report")
        {
            DataItemTableView = SORTING(Sales Order No.,Product No.,Lot,Production Order) ORDER(Ascending);
            column(Str_Rdso_report__Sales_Order_No__;"Sales Order No.")
            {
            }
            column(Str_Rdso_report__Production_Order_;"Production Order")
            {
            }
            column(Str_Rdso_report__Str_Rdso_report__Description;Description)
            {
            }
            column(Str_Rdso_report__Issued_Qty_;"Issued Qty")
            {
            }
            column(Str_Rdso_report_Lot;Lot)
            {
            }
            column(PO1;PO1)
            {
            }
            column(CONSUMPTION_SUMMARYCaption;CONSUMPTION_SUMMARYCaptionLbl)
            {
            }
            column(Sales_Order_NoCaption;Sales_Order_NoCaptionLbl)
            {
            }
            column(Production_OrdersCaption;Production_OrdersCaptionLbl)
            {
            }
            column(ItemCaption;ItemCaptionLbl)
            {
            }
            column(Issued_QtyCaption_Control1000000052;Issued_QtyCaption_Control1000000052Lbl)
            {
            }
            column(LOTCaption;LOTCaptionLbl)
            {
            }
            column(EmptyStringCaption;EmptyStringCaptionLbl)
            {
            }
            column(Str_Rdso_report_Issue_No_;"Issue No.")
            {
            }

            trigger OnPreDataItem();
            begin
                 IF Choice3<>Choice3::Summary THEN
                    CurrReport.BREAK;
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
        IF EXCEL THEN
        BEGIN
        Tempexcelbuffer.CreateBook('','');//B2B //EFFUPG
        //Tempexcelbuffer.CreateSheet('Issued Material Report','',COMPANYNAME,'');//B2B
        Tempexcelbuffer.GiveUserControl;
        END;
    end;

    trigger OnPreReport();
    begin
         IF EXCEL THEN
         BEGIN
         CLEAR(Tempexcelbuffer);
         Tempexcelbuffer.DELETEALL;
         END;
    end;

    var
        QTY : Decimal;
        "material issues line" : Record "Material Issues Line";
        Reason : Code[100];
        Choice1 : Option Normal,Damage,Return;
        Choice2 : Option Used,NotUsed;
        ILE : Record "Item Ledger Entry";
        Lot : Code[100];
        Item : Record Item;
        UC : Decimal;
        Total : Decimal;
        "Serial no" : Code[100];
        Choice3 : Option Issue,Project,WRET,Summary;
        "Project Total" : Decimal;
        Project_Desc : Text[100];
        PO : Record "Production Order";
        "R&D total" : Decimal;
        ILE2 : Record "Item Ledger Entry";
        Tempexcelbuffer : Record "Excel Buffer";
        EXCEL : Boolean;
        Row : Integer;
        "Prod. Order Description" : Text[50];
        "Bench-Mark" : Integer;
        "Issued Date" : Date;
        Total_Qty : Decimal;
        PRL : Record "Purch. Rcpt. Line";
        ITEMLED : Record "Item Ledger Entry";
        vendor : Text[50];
        PRH : Record "Purch. Rcpt. Header";
        "BILLNO." : Code[20];
        BillDate : Date;
        Desc : Text[50];
        Value : Decimal;
        "Total Value" : Decimal;
        Ret_Qty : Decimal;
        PMIL : Record "Posted Material Issues Line";
        PMIH : Record "Posted Material Issues Header";
        PIL : Record "Purch. Inv. Line";
        Consider_Return : Boolean;
        Issued_Qty : Decimal;
        ILE3 : Record "Item Ledger Entry";
        RETURN_ITEM1 : Code[20];
        RETURN_ITEM2 : Code[20];
        RETURN_ITEM3 : Code[20];
        RETURN_ITEM4 : Code[20];
        PO_FILTER : Text[100];
        PO_LINE_NO : Integer;
        POR_LINE_CONFIRM : Boolean;
        MATERIAL_ISSUES_HEADER : Record "Material Issues Header";
        MATERIAL_ISSUES_LINE : Record "Material Issues Line";
        PO_FORM : Page "Released Production Order";
                      user : Record User;
                      REPLACE_ITEM_FILTER : Text[100];
                      TrackingSpecification : Record "Mat.Issue Track. Specification";
                      LineNo : Integer;
                      "Release MaterialIssue Document" : Codeunit "Release MaterialIssue Document";
                      Issue_Post : Codeunit "MaterialIssueOrde-Post Receipt";
                      Text002 : Label 'There is nothing to release for MaterialIssue order %1.';
        REQUESTED_QTY : Decimal;
        Sales_Order_No : Code[30];
        Item_No : Code[30];
        Posting_From_Date : Date;
        ItemLotNumbers : Record "Item Lot Numbers" temporary;
        "BREAK" : Boolean;
        PO1 : Code[20];
        Posting_To_Date : Date;
        ileref : Code[30];
        Material_IssuesCaptionLbl : Label 'Material Issues';
        Project_CodeCaptionLbl : Label 'Project Code';
        Requisition_NoCaptionLbl : Label 'Requisition No';
        Item_CaptionLbl : Label '"Item "';
        UOMCaptionLbl : Label 'UOM';
        Employee_NameCaptionLbl : Label 'Employee Name';
        Reqested_DateCaptionLbl : Label 'Reqested Date';
        DeptCaptionLbl : Label 'Dept';
        Quantity_RequestedCaptionLbl : Label 'Quantity Requested';
        Quantity_ReceivedCaptionLbl : Label 'Quantity Received';
        Unit_costCaptionLbl : Label 'Unit cost';
        LOT_No_CaptionLbl : Label 'LOT No.';
        Serial_No_CaptionLbl : Label 'Serial No.';
        Bench_MarkCaptionLbl : Label 'Bench Mark';
        Vendor_NameCaptionLbl : Label 'Vendor Name';
        Bill_No_CaptionLbl : Label 'Bill No.';
        Bill_DateCaptionLbl : Label 'Bill Date';
        Issued_Date_TimeCaptionLbl : Label 'Issued Date Time';
        Material_IssuesCaption_Control1102154002Lbl : Label 'Material Issues';
        Project_CodeCaption_Control1102154004Lbl : Label 'Project Code';
        ValueCaptionLbl : Label 'Value';
        Project_DescriptionCaptionLbl : Label 'Project Description';
        DaysCaptionLbl : Label 'Days';
        DaysCaption_Control1102154011Lbl : Label 'Days';
        DaysCaption_Control1102154013Lbl : Label 'Days';
        DaysCaption_Control1102154018Lbl : Label 'Days';
        Material_IssuesCaption_Control1102154030Lbl : Label 'Material Issues';
        Item_No_CaptionLbl : Label 'Item No.';
        ValueCaption_Control1102154033Lbl : Label 'Value';
        DescriptionCaptionLbl : Label 'Description';
        Issued_QtyCaptionLbl : Label 'Issued Qty';
        Return_QtyCaptionLbl : Label 'Return Qty';
        CONSUMPTION_SUMMARYCaptionLbl : Label 'CONSUMPTION SUMMARY';
        Sales_Order_NoCaptionLbl : Label 'Sales Order No';
        Production_OrdersCaptionLbl : Label 'Production Orders';
        ItemCaptionLbl : Label 'Item';
        Issued_QtyCaption_Control1000000052Lbl : Label 'Issued Qty';
        LOTCaptionLbl : Label 'LOT';
        EmptyStringCaptionLbl : Label '-';

    (9656)]
    procedure Entercell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[1000];bold : Boolean);
    begin

        Tempexcelbuffer.INIT;
        Tempexcelbuffer.VALIDATE("Row No.",RowNo);
        Tempexcelbuffer.VALIDATE("Column No.",ColumnNo);
        Tempexcelbuffer."Cell Value as Text" := CellValue;
        Tempexcelbuffer.Bold:=bold ;

        Tempexcelbuffer.INSERT;
    end;

    (9666)]
    procedure EnterHeadings(RowNo : Integer;ColumnNo : Integer;CellValue : Text[100];Bold : Boolean);
    begin
        Tempexcelbuffer.INIT;
        Tempexcelbuffer.VALIDATE("Row No.",RowNo);
        Tempexcelbuffer.VALIDATE("Column No.",ColumnNo);
        Tempexcelbuffer."Cell Value as Text" := FORMAT(CellValue);
        Tempexcelbuffer.Bold:=Bold ;

        Tempexcelbuffer.Formula := '';
        Tempexcelbuffer.INSERT;
    end;

    (9676)]
    procedure "Entercell New"();
    begin
    end;

    (9679)]
    procedure GetNextNo() NumberValue : Code[20];
    var
        DateValue : Text[30];
        MonthValue : Text[30];
        YearValue : Text[30];
        MaterialIssuesHeaderLocal : Record "Material Issues Header";
        PostedMatIssHeaderLocal : Record "Posted Material Issues Header";
        LastNumber : Code[20];
    begin
        IF DATE2DMY(WORKDATE,1) < 10 THEN
          DateValue := '0'+FORMAT(DATE2DMY(WORKDATE,1))
        ELSE DateValue := FORMAT(DATE2DMY(WORKDATE,1));

        IF DATE2DMY(WORKDATE,2) < 10 THEN
          MonthValue := '0'+FORMAT(DATE2DMY(WORKDATE,2))
        ELSE
         MonthValue := FORMAT(DATE2DMY(WORKDATE,2));

        //IF DATE2DMY(WORKDATE,3) < 99 THEN
          YearValue := COPYSTR(FORMAT(DATE2DMY(WORKDATE,3)),3,2);
        //IF ((TODAY=010810D) OR (TODAY=010910D) OR (TODAY=011010D))THEN
        //  NumberValue := 'V'+YearValue+MonthValue+DateValue
        //ELSE
          NumberValue := 'R'+YearValue+MonthValue+DateValue;

        LastNumber := NumberValue+'0000';
        MaterialIssuesHeaderLocal.RESET;
        MaterialIssuesHeaderLocal.SETFILTER("No.",NumberValue+'*');
        IF MaterialIssuesHeaderLocal.FINDLAST THEN
          LastNumber := MaterialIssuesHeaderLocal."No.";

        PostedMatIssHeaderLocal.RESET;
        PostedMatIssHeaderLocal.SETCURRENTKEY("Material Issue No.");
        PostedMatIssHeaderLocal.SETFILTER("Material Issue No.",NumberValue+'*');
        IF PostedMatIssHeaderLocal.FINDLAST THEN
          IF LastNumber < PostedMatIssHeaderLocal."Material Issue No." THEN
            LastNumber := PostedMatIssHeaderLocal."Material Issue No.";

        NumberValue := INCSTR(LastNumber);
    end;
}

