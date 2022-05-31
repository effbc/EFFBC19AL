report 50034 "Indent Status"
{
    // version Eff01,EFFUPG

    //  Actually this Report Contains 4
    DefaultLayout = RDLC;
    RDLCLayout = './Indent Status.rdlc';

    Description = '<hi>';

    dataset
    {
        dataitem("Indent Header"; "Indent Header")
        {
            DataItemTableView = WHERE(Released Status=CONST(Released));
            RequestFilterFields = "No.", "Person Code", Department1, "Production Order No.", "Last Modified Date", "Creation Date";
            ReqFilterHeading = 'Indent Status (Header)';
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(USERID; USERID)
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(total; total)
            {
            }
            column(Tot_Qty; Tot_Qty)
            {
            }
            column(RemarksCaption; RemarksCaptionLbl)
            {
            }
            column(Unit_CostCaption; Unit_CostCaptionLbl)
            {
            }
            column(Released_DateCaption; Released_DateCaptionLbl)
            {
            }
            column(Current_Stock_in_StoresCaption; Current_Stock_in_StoresCaptionLbl)
            {
            }
            column(Requested_QuantityCaption; Requested_QuantityCaptionLbl)
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(Item_NoCaption; Item_NoCaptionLbl)
            {
            }
            column(ProjectCaption; ProjectCaptionLbl)
            {
            }
            column(Indent_NoCaption; Indent_NoCaptionLbl)
            {
            }
            column(SNoCaption; SNoCaptionLbl)
            {
            }
            column(Indent_StatusCaption; Indent_StatusCaptionLbl)
            {
            }
            column(Purchase_Order_NoCaption; Purchase_Order_NoCaptionLbl)
            {
            }
            column(Time_To_Make_OrderCaption; Time_To_Make_OrderCaptionLbl)
            {
            }
            column(Project_Start_DateCaption; Project_Start_DateCaptionLbl)
            {
            }
            column(Indent_Line__Sale_Order_No__Caption; "Indent Line".FIELDCAPTION("Sale Order No."))
            {
            }
            column(Indent_Line__Sale_Order_Description_Caption; "Indent Line".FIELDCAPTION("Sale Order Description"))
            {
            }
            column(Indent_StatusCaption_Control1102154015; Indent_StatusCaption_Control1102154015Lbl)
            {
            }
            column(Indent_Header_No_; "No.")
            {
            }
            dataitem("Indent Line"; "Indent Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document No., Line No.) ORDER(Ascending) WHERE(Description = FILTER(<> ''));
                RequestFilterFields = "Indent Status", Type, "No.";
                ReqFilterHeading = 'Indent Status( Line )';
                column(Indent_Line__Indent_Line___Purchase_Remarks_; "Indent Line"."Purchase Remarks")
                {
                }
                column(DUC; DUC)
                {
                }
                column(Indent_Line__Indent_Line___Due_Date_; "Indent Line"."Due Date")
                {
                }
                column(Indent_Line__Store_Qty_; "Store Qty")
                {
                }
                column(Indent_Line_Quantity; Quantity)
                {
                }
                column(Indent_Line_Description; Description)
                {
                }
                column(Indent_Line__No__; "No.")
                {
                }
                column(Indent_Header___Production_Order_Description_; "Indent Header"."Production Order Description")
                {
                }
                column(Indent_Line__Document_No__; "Document No.")
                {
                }
                column(sno; sno)
                {
                }
                column(PO; PO)
                {
                }
                column(Delay; Delay)
                {
                }
                column(Indent_Header___Production_Start_date_; "Indent Header"."Production Start date")
                {
                }
                column(Indent_Line__Unit_of_Measure_; "Unit of Measure")
                {
                }
                column(Indent_Line__Sale_Order_No__; "Sale Order No.")
                {
                }
                column(Indent_Line__Sale_Order_Description_; "Sale Order Description")
                {
                }
                column(Indent_Line__Indent_Line___Indent_Status_; "Indent Line"."Indent Status")
                {
                }
                column(Indent_Line_Line_No_; "Line No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    sno := sno + 1;
                    PO := '';
                    Delay := 0;
                    IF Cancel AND ("Indent Line"."Indent Status" = "Indent Line"."Indent Status"::Indent) THEN BEGIN
                        "Indent Line"."Indent Status" := "Indent Line"."Indent Status"::Cancel;
                        "Indent Line"."Purchase Remarks" := Cancel_Reason;
                        "Indent Line".MODIFY;
                    END;
                    IF ("Indent Line"."ICN No." = ICNNO) AND ("Indent Line"."Suitable Vendor" <> '') THEN BEGIN
                        "Indent Line"."ICN No." := COPYSTR(ICNNO, 1, STRLEN(ICNNO) - 2);
                        "Indent Line".MODIFY;
                    END;

                    // Rev01 Code copy from //Indent Line, Body (2) - OnPreSection()
                    DUC := 0;
                    IH.SETRANGE(IH."No.", "Indent Line"."Document No.");
                    IF "Indent Header"."Project Description" <> '' THEN
                        Desc := "Indent Header"."Project Description"
                    ELSE BEGIN
                        IF IH.FIND('-') THEN BEGIN
                            "Prod. Order".SETRANGE("Prod. Order"."No.", COPYSTR("Indent Header".Description, 1, 20));
                            IF "Prod. Order".FIND('-') THEN
                                Desc := "Prod. Order".Description
                            ELSE
                                Desc := IH.Description;
                        END;
                    END;
                    Item.SETRANGE(Item."No.", "Indent Line"."No.");
                    IF Item.FIND('-') THEN
                        DUC := Item."Avg Unit Cost";

                    PL.SETCURRENTKEY(PL."ICN No.", PL."No.");
                    PL.SETRANGE(PL."ICN No.", "Indent Line"."ICN No.");
                    PL.SETRANGE(PL."No.", "Indent Line"."No.");
                    PL.SETRANGE(PL."Location Code", "Indent Line"."Delivery Location");
                    IF PL.FIND('-') THEN BEGIN
                        PO := PL."Document No.";
                        PH.SETRANGE(PH."No.", PL."Document No.");
                        IF PH.FIND('-') THEN BEGIN
                            IF (PH."Order Date" > 0D) AND ("Indent Line"."Due Date" > 0D) THEN
                                Delay := PH."Order Date" - "Indent Line"."Due Date";
                        END;
                    END;
                    row += 1;
                    IF excel1 THEN BEGIN
                        entercell(row, 1, FORMAT(sno), FALSE, TempExcelBuffer."Cell Type"::Number);
                        entercell(row, 2, "Indent Line"."Document No.", FALSE, TempExcelBuffer."Cell Type"::Text);
                        entercell(row, 3, "Indent Line"."Sale Order No.", FALSE, TempExcelBuffer."Cell Type"::Text);
                        entercell(row, 4, "Indent Header"."Project Description", FALSE, TempExcelBuffer."Cell Type"::Text);
                        entercell(row, 5, "Indent Line".Description, FALSE, TempExcelBuffer."Cell Type"::Text);
                        entercell(row, 6, FORMAT("Indent Line".Quantity), FALSE, TempExcelBuffer."Cell Type"::Number);
                        entercell(row, 7, FORMAT(DT2DATE("Indent Header"."Release Date Time")), FALSE, TempExcelBuffer."Cell Type"::Date);
                        entercell(row, 8, FORMAT(DUC), FALSE, TempExcelBuffer."Cell Type"::Text);
                        entercell(row, 9, PO, FALSE, TempExcelBuffer."Cell Type"::Text);
                        entercell(row, 10, FORMAT(Delay), FALSE, TempExcelBuffer."Cell Type"::Text);
                        entercell(row, 11, "Indent Line"."Purchase Remarks", FALSE, TempExcelBuffer."Cell Type"::Text);
                        entercell(row, 12, FORMAT("Indent Line"."Indent Status"), FALSE, TempExcelBuffer."Cell Type"::Text);
                    END;

                    total += "Indent Line".Quantity * DUC;
                    Tot_Qty += "Indent Line".Quantity;
                    // Rev01 Code copy from //Indent Line, Body (2) - OnPreSection()
                end;

                trigger OnPreDataItem();
                begin
                    //  IF "Indent Line".GETFILTER("Indent Line"."Indent Status")='' THEN
                    //     "Indent Line".SETFILTER("Indent Line"."Indent Status",'Indent');
                end;
            }

            trigger OnAfterGetRecord();
            begin
                "Rel.Date" := "Indent Header"."Released Date";
            end;

            trigger OnPostDataItem();
            begin
                row += 1;
                IF excel1 THEN
                    entercell(row, 10, FORMAT(total), FALSE, TempExcelBuffer."Cell Type"::Number);
            end;

            trigger OnPreDataItem();
            begin
                IF Choice <> Choice::Indent THEN
                    CurrReport.BREAK;

                IF excel1 THEN BEGIN
                    TempExcelBuffer.DELETEALL;
                    CLEAR(TempExcelBuffer);
                    row := 1;
                END;


                IF ("Indent Header"."ICN No." = ICNNO) AND ("Indent Header"."ICN No." <> '') THEN BEGIN
                    "Indent Header"."ICN No." := COPYSTR(ICNNO, 1, STRLEN(ICNNO) - 2);
                    "Indent Header".MODIFY;
                END;
                // Rev01 Code copy from //Indent Header, Header (1) - OnPostSection()

                IF excel1 THEN BEGIN
                    entercell(1, 1, 'No', TRUE, TempExcelBuffer."Cell Type"::Text);
                    entercell(1, 2, 'Indent No', TRUE, TempExcelBuffer."Cell Type"::Text);
                    entercell(1, 3, 'Indent Description', TRUE, TempExcelBuffer."Cell Type"::Text);
                    entercell(1, 4, 'Sales Order No.', TRUE, TempExcelBuffer."Cell Type"::Text);
                    entercell(1, 5, 'Customer', TRUE, TempExcelBuffer."Cell Type"::Text);
                    entercell(1, 6, 'Item No', TRUE, TempExcelBuffer."Cell Type"::Text);
                    entercell(1, 7, 'Description', TRUE, TempExcelBuffer."Cell Type"::Text);
                    entercell(1, 8, 'Requested Qty', TRUE, TempExcelBuffer."Cell Type"::Text);
                    entercell(1, 9, 'UOM', TRUE, TempExcelBuffer."Cell Type"::Text);
                    entercell(1, 10, 'Current Stock in Stores', TRUE, TempExcelBuffer."Cell Type"::Text);
                    entercell(1, 11, 'Released Date', TRUE, TempExcelBuffer."Cell Type"::Text);
                    entercell(1, 12, 'Unit cost', TRUE, TempExcelBuffer."Cell Type"::Text);
                    entercell(1, 13, 'Released Date', TRUE, TempExcelBuffer."Cell Type"::Text);
                    entercell(1, 14, 'Time to make order', TRUE, TempExcelBuffer."Cell Type"::Text);
                    entercell(1, 15, 'Remarks', TRUE, TempExcelBuffer."Cell Type"::Text);
                END;
                // Rev01 Code copy from //Indent Header, Header (1) - OnPostSection()
            end;
        }
        dataitem("Purchase Line"; "Purchase Line")
        {
            DataItemTableView = SORTING(Indent No.) ORDER(Ascending) WHERE(Document Type=CONST(Order),Quantity=FILTER(>0));
            RequestFilterFields = "Document Date","Indent No.","Direct Unit Cost",Type,"No.","Buy-from Vendor No.","Quantity Received","Quantity Invoiced";
            ReqFilterHeading = 'Purchase Order Report';
            column(COMPANYNAME_Control1000000041;COMPANYNAME)
            {
            }
            column(FORMAT_TODAY_0_4__Control1000000043;FORMAT(TODAY,0,4))
            {
            }
            column(USERID_Control1000000044;USERID)
            {
            }
            column(Purchase_Line__Document_No__;"Document No.")
            {
            }
            column(Purchase_Line__No__;"No.")
            {
            }
            column(Purchase_Line_Description;Description)
            {
            }
            column(Purchase_Line_Quantity;Quantity)
            {
            }
            column(Purchase_Line__Unit_of_Measure_Code_;"Unit of Measure Code")
            {
            }
            column(UID;UID)
            {
            }
            column(Purchase_Line__Document_Date_;"Document Date")
            {
            }
            column(Purchase_Line__Indent_No__;"Indent No.")
            {
            }
            column(Orders_With_Out_Having_IndentsCaption;Orders_With_Out_Having_IndentsCaptionLbl)
            {
            }
            column(Order_No_Caption;Order_No_CaptionLbl)
            {
            }
            column(Purchase_Line__No__Caption;FIELDCAPTION("No."))
            {
            }
            column(Purchase_Line_DescriptionCaption;FIELDCAPTION(Description))
            {
            }
            column(QTYCaption;QTYCaptionLbl)
            {
            }
            column(UOMCaption;UOMCaptionLbl)
            {
            }
            column(User_IdCaption;User_IdCaptionLbl)
            {
            }
            column(Purchase_Line__Document_Date_Caption;FIELDCAPTION("Document Date"))
            {
            }
            column(Purchase_Line__Indent_No__Caption;FIELDCAPTION("Indent No."))
            {
            }
            column(Purchase_Line_Document_Type;"Document Type")
            {
            }
            column(Purchase_Line_Line_No_;"Line No.")
            {
            }

            trigger OnAfterGetRecord();
            begin

                  PH.SETRANGE(PH."No.","Purchase Line"."Document No.");
                 IF PH.FIND('-') THEN
                 BEGIN

                 DV.SETFILTER(DV."Dimension Code",'EMPLOYEE CODES');
                 DV.SETRANGE(DV.Code,PH."OrderCreated by");
                 IF DV.FIND('-') THEN
                 UID:=DV.Name;
                 END;
            end;

            trigger OnPreDataItem();
            begin
                IF  Choice<>Choice::Order THEN
                CurrReport.BREAK;
            end;
        }
        dataitem("<Indent Header1>";"Indent Header")
        {
            DataItemTableView = SORTING(Department) ORDER(Ascending);
            RequestFilterFields = "Last Date Modified","Delivery Location";
            column(Indent_Header1__Department;Department)
            {
            }
            column(total_Control1102154007;total)
            {
            }
            column(TIV;TIV)
            {
            }
            column(Period_Wise_Indent_ValueCaption;Period_Wise_Indent_ValueCaptionLbl)
            {
            }
            column(DepartmentCaption;DepartmentCaptionLbl)
            {
            }
            column(ValueCaption;ValueCaptionLbl)
            {
            }
            column(Indent_Header1__No_;"No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                // Rev01 Code Copy from // <Indent Header1>, Body (4) - OnPreSection()  >>
                IL.SETRANGE(IL."Document No.","<Indent Header1>"."No.") ;
                IF IL.FIND('-') THEN
                REPEAT
                  total+=IL.Quantity*IL."Unit Cost";
                UNTIL IL.NEXT=0;
                // Rev01 Code Copy from // <Indent Header1>, Body (4) - OnPreSection()  <<


                IF IndentPrevDepart <> "<Indent Header1>".Department THEN BEGIN
                  IndentPrevDepart := "<Indent Header1>".Department;
                  TIV+=total;
                  total:=0;
                END;
                // Rev01 Code Copy from // <Indent Header1>, GroupFooter (5) - OnPreSection() >>
                row+=1;
                entercell(row,1,"<Indent Header1>".Department,TRUE,TempExcelBuffer."Cell Type"::Text);
                entercell(row,2,FORMAT(total),TRUE,TempExcelBuffer."Cell Type"::Number);
                // Rev01 Code Copy from // <Indent Header1>, GroupFooter (5) - OnPreSection() <<
            end;

            trigger OnPostDataItem();
            begin
                row+=1;
                enterheadings(row,2,FORMAT(TIV),TRUE,TempExcelBuffer."Cell Type"::Number);
            end;

            trigger OnPreDataItem();
            begin
                IF  Choice<>Choice::"Indent Department Brief " THEN
                CurrReport.BREAK;


                row+=1;
                enterheadings(row,1,'PERIOD WISE INDENT VALUE',TRUE,TempExcelBuffer."Cell Type"::Text);


                row+=1;
                enterheadings(row,1,'DEPARTMENT',TRUE,TempExcelBuffer."Cell Type"::Text);
                enterheadings(row,2,'VALUE',TRUE,TempExcelBuffer."Cell Type"::Text);
            end;
        }
        dataitem("Create Indents";"Create Indents")
        {
            DataItemTableView = SORTING(Item No.,Indent No.,Indent Line No.) ORDER(Ascending) WHERE(Item No.=FILTER(<>''));
            column(FORMAT_TODAY_0_4__Control1102154025;FORMAT(TODAY,0,4))
            {
            }
            column(USERID_Control1102154026;USERID)
            {
            }
            column(COMPANYNAME_Control1102154028;COMPANYNAME)
            {
            }
            column(Create_Indents__Item_No__;"Item No.")
            {
            }
            column(Create_Indents_Description;Description)
            {
            }
            column(sno_Control1102154029;sno)
            {
            }
            column(Items_Don_t_Have_Group_CodesCaption;Items_Don_t_Have_Group_CodesCaptionLbl)
            {
            }
            column(Create_Indents__Item_No__Caption;FIELDCAPTION("Item No."))
            {
            }
            column(Create_Indents_DescriptionCaption;FIELDCAPTION(Description))
            {
            }
            column(S_No_Caption;S_No_CaptionLbl)
            {
            }
            column(Create_Indents_Indent_No_;"Indent No.")
            {
            }
            column(Create_Indents_Indent_Line_No_;"Indent Line No.")
            {
            }
            column(ShowOutGVar;ShowOutGVar)
            {
            }

            trigger OnAfterGetRecord();
            begin

                // Rev01 Code Copy From // Create Indents, GroupHeader (3) - OnPreSection() >>
                IF CreatePreviousItem <> "Create Indents"."Item No." THEN BEGIN
                 CreatePreviousItem := "Create Indents"."Item No.";
                 ShowOutGVar := FALSE;
                 IF Item.GET("Create Indents"."Item No.") THEN
                 BEGIN
                   IF Item."Product Group Code"<>'STATIONARY' THEN
                   BEGIN
                     IF (Item."Tax Group Code"='')  OR (Item."Gen. Prod. Posting Group"='')  OR (Item."Excise Prod. Posting Group"='')
                      OR (Item."VAT Prod. Posting Group"='')
                     THEN BEGIN
                       sno+=1;
                       ShowOutGVar:=TRUE
                     END ELSE
                       ShowOutGVar:=FALSE;
                   END ELSE
                      ShowOutGVar:=FALSE;
                 END;
                END;
                // Rev01 Code Copy From // Create Indents, GroupHeader (3) - OnPreSection() <<
            end;

            trigger OnPreDataItem();
            begin
                IF  Choice<>Choice::"Item Tax Groups" THEN
                CurrReport.BREAK;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(General)
                {
                    grid(Control1102152001)
                    {
                        ShowCaption = false;
                        group(Control1102152004)
                        {
                            ShowCaption = false;
                            field(Choice;Choice)
                            {
                                Caption = 'Choice';
                            }
                            field(ICNNO;ICNNO)
                            {
                                Caption = 'ICN No.';
                            }
                            field(excel1;excel1)
                            {
                                Caption = 'Excel';
                            }
                        }
                        group(Control1102152008)
                        {
                            ShowCaption = false;
                            field(Cancel;Cancel)
                            {
                                Caption = 'Cancel';
                            }
                            field("Cancel Reason";Cancel_Reason)
                            {
                                Caption = 'Cancel Reason';
                            }
                        }
                    }
                }
                group(Details)
                {
                    grid(Control1102152029)
                    {
                        GridLayout = Columns;
                        ShowCaption = false;
                        group(Control1102152030)
                        {
                            ShowCaption = false;
                            field("Actually This Report Contains Two Reports";'')
                            {
                                Caption = 'Actually This Report Contains Two Reports';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field("1) Indent Status Report";'')
                            {
                                Caption = '1) Indent Status Report';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(Purpose;'')
                            {
                                Caption = 'Purpose';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field("1) This is the Report to Know About Indent Information.";'')
                            {
                                Caption = '1) This is the Report to Know About Indent Information.';
                                ShowCaption = false;
                            }
                            field("2) By using This Report We can Know That What Are The Indents In Different Status Like (Indent,Order,Cancel)";'')
                            {
                                Caption = '2) By using This Report We can Know That What Are The Indents In Different Status Like (Indent,Order,Cancel)';
                                ColumnSpan = 20;
                                ShowCaption = false;
                            }
                            field(Control1102152015;'')
                            {
                                Caption = '3)  This Report Gives The Information About "Indent No.","Requested Item","Requested Quantity","Current Stock In the Stores for That Perticular Item"';
                                ShowCaption = false;
                            }
                            field(Control1102152016;'')
                            {
                                Caption = '4) This Also Gives The Information Of  "Purchase Order No.","Time Taken To Convert that Indent Into Order" If The Indent Was Converted Into Order';
                                ShowCaption = false;
                            }
                            field(Usage;'')
                            {
                                Caption = 'Usage';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(Control1102152018;'')
                            {
                                Caption = '1) In Indent Status Report We Have To Give The I/P In "Indent Status (Header)" Tab, If we Need The  Information of Indent Header Part and Same in "Indent Status (Line) for Lines Infomation';
                                ShowCaption = false;
                            }
                            field(Control1102152019;'')
                            {
                                Caption = '2) We Have To Give The I/P In "Indent Status(Header)" Tab , For Indent wise, Person wise, Production Order Wise,Period Wise(Released Date) Indents.';
                                ShowCaption = false;
                            }
                            field("3) We Have To Give The I/P In ""Indent Status(Line)"" Tab For Status wise,Item Wise  Indents";'')
                            {
                                Caption = '3) We Have To Give The I/P In "Indent Status(Line)" Tab For Status wise,Item Wise  Indents';
                                ShowCaption = false;
                            }
                            field("2) Purchase Order Line Report";'')
                            {
                                Caption = '2) Purchase Order Line Report';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(Control1102152022;'')
                            {
                                Caption = 'Purpose';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field("1) This is the Report to Know About Purchase Order Information.";'')
                            {
                                Caption = '1) This is the Report to Know About Purchase Order Information.';
                                ShowCaption = false;
                            }
                            field("2) This Report Gives the Information of Purchase Order No, Item,Quantity, Indent No, Order Released User ID.";'')
                            {
                                Caption = '2) This Report Gives the Information of Purchase Order No, Item,Quantity, Indent No, Order Released User ID.';
                                ShowCaption = false;
                            }
                            field(Control1102152025;'')
                            {
                                Caption = 'Usage';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field("1) For Puchase Order Report We Have To Select The "" Purchase Order""  Option";'')
                            {
                                Caption = '1) For Puchase Order Report We Have To Select The " Purchase Order"  Option';
                                ShowCaption = false;
                            }
                            field("2) By using This Report We can Verify The Purchase Orders  Vendor Wise,Item Wise, Period Wise.";'')
                            {
                                Caption = '2) By using This Report We can Verify The Purchase Orders  Vendor Wise,Item Wise, Period Wise.';
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
        IF excel1 THEN
        BEGIN
        /*
        TempExcelBuffer.CreateBook('Test Excel','');// Rev01 //EFFUPG
        TempExcelBuffer.WriteSheet('Test Excel',COMPANYNAME,USERID);// Rev01
        TempExcelBuffer.CloseBook; //Rev01
        TempExcelBuffer.OpenExcel; //Rev01
        TempExcelBuffer.GiveUserControl;
        */
          TempExcelBuffer.CreateBookAndOpenExcel('','Test Excel','Test Excel',COMPANYNAME,USERID); //EFFUPG
        END;

    end;

    trigger OnPreReport();
    begin
        //Cancel_Reason:='';
    end;

    var
        sno : Integer;
        IH : Record "Indent Header";
        Desc : Text[100];
        Item : Record Item;
        DUC : Decimal;
        "Rel.Date" : Date;
        PL : Record "Purchase Line";
        PO : Text[30];
        Choice : Option Indent,"Order","Indent Department Brief ","Item Tax Groups";
        PH : Record "Purchase Header";
        UID : Text[50];
        DV : Record "Dimension Value";
        "Order Date" : Date;
        Delay : Integer;
        SheetName : Text[30];
        row : Integer;
        coloumn : Integer;
        TempExcelBuffer : Record "Excel Buffer" temporary;
        excel1 : Boolean;
        "Prod. Order" : Record "Production Order";
        total : Decimal;
        IL : Record "Indent Line";
        TIV : Decimal;
        Cancel : Boolean;
        Tot_Qty : Decimal;
        Cancel_Reason : Text[50];
        ICNNO : Code[10];
        RemarksCaptionLbl : Label 'Remarks';
        Unit_CostCaptionLbl : Label 'Unit Cost';
        Released_DateCaptionLbl : Label 'Released Date';
        Current_Stock_in_StoresCaptionLbl : Label 'Current Stock in Stores';
        Requested_QuantityCaptionLbl : Label 'Requested Quantity';
        DescriptionCaptionLbl : Label 'Description';
        Item_NoCaptionLbl : Label 'Item No';
        ProjectCaptionLbl : Label 'Project';
        Indent_NoCaptionLbl : Label 'Indent No';
        SNoCaptionLbl : Label 'SNo';
        Indent_StatusCaptionLbl : Label 'Indent Status';
        Purchase_Order_NoCaptionLbl : Label 'Purchase Order No';
        Time_To_Make_OrderCaptionLbl : Label 'Time To Make Order';
        Project_Start_DateCaptionLbl : Label 'Project Start Date';
        Indent_StatusCaption_Control1102154015Lbl : Label 'Indent Status';
        Orders_With_Out_Having_IndentsCaptionLbl : Label 'Orders With Out Having Indents';
        Order_No_CaptionLbl : Label '" Order No."';
        QTYCaptionLbl : Label 'QTY';
        UOMCaptionLbl : Label 'UOM';
        User_IdCaptionLbl : Label 'User Id';
        Period_Wise_Indent_ValueCaptionLbl : Label 'Period Wise Indent Value';
        DepartmentCaptionLbl : Label 'Department';
        ValueCaptionLbl : Label 'Value';
        Items_Don_t_Have_Group_CodesCaptionLbl : Label 'Items Don''t Have Group Codes';
        S_No_CaptionLbl : Label 'S No.';
        IndentPrevDepart : Code[20];
        ShowOutGVar : Boolean;
        CreatePreviousItem : Code[20];

    [LineStart(1579)]
    procedure entercell(rowno : Integer;columnno : Integer;cellvalue : Text[250];bold : Boolean;CellType : Option);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.",rowno);
        TempExcelBuffer.VALIDATE("Column No.",columnno);
        TempExcelBuffer."Cell Value as Text" := cellvalue;
        TempExcelBuffer.Bold:=bold ;
        TempExcelBuffer."Cell Type" := CellType;
        TempExcelBuffer.INSERT;
    end;

    [LineStart(1588)]
    procedure enterheadings(rowno : Integer;columnno : Integer;cellvalue : Code[50];bold : Boolean;CellType : Option);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.",rowno);
        TempExcelBuffer.VALIDATE("Column No.",columnno);
        TempExcelBuffer."Cell Value as Text" := FORMAT(cellvalue);
        TempExcelBuffer.Bold:=bold ;
        TempExcelBuffer."Cell Type" := CellType;
        TempExcelBuffer.Formula := '';
        TempExcelBuffer.INSERT;
    end;
}

