report 50044 "Prod. Order Wise Serial No's"
{
    // version santhosh,EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './Prod. Order Wise Serial No's.rdlc';

    dataset
    {
        dataitem("Production Order"; "Production Order")
        {
            DataItemTableView = SORTING(Status, No.) ORDER(Ascending) WHERE(Status = CONST(Released));
            RequestFilterFields = "No.";
            ReqFilterHeading = 'Production Order Wise Serial No''s( As Per BOM)';
            column(PO_Choice; choice)
            {
            }
            column(PO_Choice2; Choice2)
            {
            }
            column(PO_Print_Type; Print_Type)
            {
            }
            column(USERID; USERID)
            {
            }
            column(TODAY; TODAY)
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(Production_Order__GETFILTER__Production_Order___No___; "Production Order".GETFILTER("Production Order"."No."))
            {
            }
            column(COMPANYNAME_Control1102156005; COMPANYNAME)
            {
            }
            column(USERID_Control1102156010; USERID)
            {
            }
            column(TODAY_Control1102156012; TODAY)
            {
            }
            column(USERID_Control1000000070; USERID)
            {
            }
            column(TODAY_Control1000000071; TODAY)
            {
            }
            column(COMPANYNAME_Control1000000072; COMPANYNAME)
            {
            }
            column(Production_Order__Production_Order___No__; "Production Order"."No.")
            {
            }
            column(Production_Order__Production_Order___No___Control1102154022; "Production Order"."No.")
            {
            }
            column(Production_Order_Wise_Issued_Serial_No_sCaption; Production_Order_Wise_Issued_Serial_No_sCaptionLbl)
            {
            }
            column(Item_Wise_Issued_Serial_No_s__For_Production_Order_sCaption; Item_Wise_Issued_Serial_No_s__For_Production_Order_sCaptionLbl)
            {
            }
            column(Production_Order_Wise_Issued_Serial_No_sCaption_Control1000000068; Production_Order_Wise_Issued_Serial_No_sCaption_Control1000000068Lbl)
            {
            }
            column(Prod__Order_No_Caption; Prod__Order_No_CaptionLbl)
            {
            }
            column(Prod__Order_No_Caption_Control1102154023; Prod__Order_No_Caption_Control1102154023Lbl)
            {
            }
            column(Serial_No_Caption; Serial_No_CaptionLbl)
            {
            }
            column(Lot_No_Caption; Lot_No_CaptionLbl)
            {
            }
            column(Item_DescriptionCaption; Item_DescriptionCaptionLbl)
            {
            }
            column(Item_No_Caption; Item_No_CaptionLbl)
            {
            }
            column(Compound_DescriptionCaption; Compound_DescriptionCaptionLbl)
            {
            }
            column(Production_Order_Status; Status)
            {
            }
            column(Prod__Order_Line___Production_BOM_No__; "Prod. Order Line"."Production BOM No.")
            {
            }
            column(ProductionBOM_Caption; ProductionBOM_CaptionLbl)
            {
            }
            dataitem("<Item Ledger Entry3>"; "Item Ledger Entry")
            {
                DataItemLink = ITL Doc No.=FIELD(No.);
                DataItemTableView = SORTING(Item No., Lot No., ITL Doc No.) ORDER(Ascending) WHERE(Entry Type=CONST(Transfer),Product Group Code=CONST(PCB),Location Code=FILTER(<>STR),Remaining Quantity=FILTER(>0));
                RequestFilterFields = "ITL Doc Line No.";
                column(ILE3_Choice2;Choice2)
                {
                }
                column(ILE3Body3;ILE3Body3)
                {
                }
                column(Item_Ledger_Entry3___Serial_No__;"Serial No.")
                {
                }
                column(Item_Ledger_Entry3___Lot_No__;"Lot No.")
                {
                }
                column(item_desc_;"item desc")
                {
                }
                column(CARD_DESC;CARD_DESC)
                {
                }
                column(Item__No__;Item."No.")
                {
                }
                column(Item_Ledger_Entry3__Entry_No_;"Entry No.")
                {
                }
                column(Item_Ledger_Entry3__ITL_Doc_No_;"ITL Doc No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    ILE3Body3 := TRUE;
                    // IF Choice2=Choice2::Item THEN
                    
                     IF Choice2Item THEN
                     BEGIN
                       IF NOT ILE1.GET("<Item Ledger Entry3>"."Entry No.") THEN
                       BEGIN
                        ILE1.INIT;
                        ILE1."Item No." :="<Item Ledger Entry3>"."Item No.";
                        ILE1."Serial No.":="<Item Ledger Entry3>"."Serial No.";
                        ILE1."Lot No." :="<Item Ledger Entry3>"."Lot No.";
                        ILE1."ITL Doc No.":="<Item Ledger Entry3>"."ITL Doc No.";
                        ILE1."ITL Doc Line No.":="<Item Ledger Entry3>"."ITL Doc Line No.";
                        ILE1."Entry No.":="<Item Ledger Entry3>"."Entry No.";
                        ILE1.INSERT;
                       END;
                       IF NOT item1.GET("<Item Ledger Entry3>"."Item No.") THEN
                       BEGIN
                         item1.INIT;
                         item1."No.":="<Item Ledger Entry3>"."Item No.";
                         item1.Description:="<Item Ledger Entry3>".Description;
                         item1.INSERT;
                       END;
                     END;
                    
                    //Rev01
                    
                    //<Item Ledger Entry3>, Body (2) - OnPreSection()
                    //IF (Choice2=Choice2::Item) THEN
                    IF (Choice2Item) THEN
                      //CurrReport.SHOWOUTPUT:=FALSE
                      ILE3Body3 := FALSE
                      //ILE3Body3 := NOT (Choice2=Choice2::Item);
                    ELSE
                    BEGIN
                     IF Item.GET("<Item Ledger Entry3>"."Item No.") THEN BEGIN
                      "item desc":=Item.Description;
                      BINAddress := Item."BIN Address";
                      IF Item."Item Tracking Code"<>'LOTSERIAL' THEN
                        //CurrReport.SHOWOUTPUT:=FALSE;
                        ILE3Body3 := FALSE;
                      CARD_DESC:='';
                      "Prod. Order Line".SETRANGE("Prod. Order Line"."Prod. Order No.","<Item Ledger Entry3>"."ITL Doc No.");
                      "Prod. Order Line".SETRANGE("Prod. Order Line"."Line No.","<Item Ledger Entry3>"."ITL Doc Line No.");
                      IF "Prod. Order Line".FIND('-') THEN
                        CARD_DESC:="Prod. Order Line".Description;
                      VALID:=TRUE;
                    /*
                      ILE.SETCURRENTKEY(ILE."Entry Type",ILE."Item No.",ILE."Location Code",ILE.Open,ILE."Lot No.",ILE."Serial No.");
                      ILE.SETFILTER(ILE."Entry Type",'Transfer');
                      ILE.SETFILTER(ILE."Location Code",'PROD');
                      ILE.SETFILTER(ILE.Quantity,'<%1',0);
                      ILE.SETRANGE(ILE."Item No.","<Item Ledger Entry3>"."Item No.");
                      ILE.SETRANGE(ILE."Serial No.","<Item Ledger Entry3>"."Serial No.");
                      IF ILE.FIND('-') THEN BEGIN
                        //CurrReport.SHOWOUTPUT:=FALSE;
                        ILE3Body3 := FALSE;
                        VALID:=FALSE;
                      END;
                    */
                      IF Excel AND VALID THEN BEGIN
                        Row+=1;
                        Entercell(Row,1,"<Item Ledger Entry3>"."Item No.",FALSE,TempExcelbuffer."Cell Type" :: Number);
                        Entercell(Row,2,CARD_DESC,FALSE,TempExcelbuffer."Cell Type" :: Text);
                        Entercell(Row,3,"item desc",FALSE,TempExcelbuffer."Cell Type" :: Text);
                        Entercell(Row,4,"<Item Ledger Entry3>"."Lot No.",FALSE,TempExcelbuffer."Cell Type" :: Number);
                        Entercell(Row,5,"<Item Ledger Entry3>"."Serial No.",FALSE,TempExcelbuffer."Cell Type" :: Number);
                        Entercell(Row,6,"Production Order"."No.",FALSE,TempExcelbuffer."Cell Type" :: Number);
                      END;
                     END;
                    END;
                    //<Item Ledger Entry3>, Body (2) - OnPreSection()

                end;

                trigger OnPreDataItem();
                begin
                    IF ChoiceIssue THEN
                      choice:='Issue'
                    ELSE IF ChoiceItem  THEN
                      choice:='Item';

                    IF Choice2Default THEN
                      Choice2:='Default'
                    ELSE IF Choice2Alternative THEN
                      Choice2:='Alternative'
                    ELSE IF Choice2Item THEN
                      Choice2:='Item' ;

                    IF Choice3Item THEN
                      Choice3:='Item'
                    ELSE IF Choice3Issue THEN
                      Choice3:='ISSUE';
                end;
            }

            trigger OnAfterGetRecord();
            begin
                //Rev01

                //Production Order, Header (1) - OnPreSection()
                //CurrReport.SHOWOUTPUT((Choice2=Choice2::Default) AND (Print_Type=Print_Type::Serial));
                //Production Order, Header (1) - OnPreSection()

                //Production Order, Header (2) - OnPreSection()
                //CurrReport.SHOWOUTPUT((Choice2=Choice2::Item));
                //Production Order, Header (2) - OnPreSection()

                //Production Order, Body (3) - OnPreSection()
                //IF (Choice2=Choice2::Default) THEN BEGIN

                IF (Choice2Default) THEN BEGIN
                  IF Excel THEN BEGIN
                    Row+=1;
                    EnterHeadings(Row,1,"Production Order"."No.",TRUE,TempExcelbuffer."Cell Type" :: Number);
                  END;
                END;

                //CurrReport.SHOWOUTPUT((Choice2=Choice2::Default) AND (Print_Type=Print_Type::Project));
                //Production Order, Body (3) - OnPreSection()

                //Production Order, Body (4) - OnPreSection()
                 //CurrReport.SHOWOUTPUT((Choice2=Choice2::Default) AND (Print_Type=Print_Type::Serial));
                //Production Order, Body (4) - OnPreSection()

                //Production Order, Body (5) - OnPreSection()
                //IF (Choice2=Choice2::Item) THEN

                IF (Choice2Item) THEN
                  CurrReport.SHOWOUTPUT:=FALSE;
                 //IF (Choice2=Choice2::Default) THEN BEGIN
                IF (Choice2Default) THEN BEGIN
                  IF Excel THEN BEGIN
                    Row+=1;
                    EnterHeadings(Row,1,'Item No.',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    EnterHeadings(Row,2,'Compound Description',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    EnterHeadings(Row,3,'Item Description',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    EnterHeadings(Row,4,'Lot No.',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    EnterHeadings(Row,5,'Serial no.',TRUE,TempExcelbuffer."Cell Type" :: Text);
                    EnterHeadings(Row,6,'Prod Order No.',TRUE,TempExcelbuffer."Cell Type" :: Text);
                  END;
                END;
                //Production Order, Body (5) - OnPreSection()
            end;

            trigger OnPostDataItem();
            begin
                IF ChoiceIssue THEN
                  choice:='Issue'
                ELSE IF ChoiceItem  THEN
                  choice:='Item';

                IF Choice2Default THEN
                  Choice2:='Default'
                ELSE IF Choice2Alternative THEN
                  Choice2:='Alternative'
                ELSE IF Choice2Item THEN
                  Choice2:='Item' ;
            end;

            trigger OnPreDataItem();
            begin
                // IF (choice<>choice::Issue) OR (Choice2=Choice2::Alternative) THEN

                 IF (NOT ChoiceIssue) OR (Choice2Alternative) THEN
                 CurrReport.BREAK;
                // IF  (Choice2=Choice2::Default) THEN

                 IF  (Choice2Default) THEN
                 BEGIN
                 IF Print_Type=Print_Type::Project THEN
                    CurrReport.NEWPAGEPERRECORD:=TRUE;
                 END;
                IF ChoiceIssue THEN
                  choice:='Issue'
                ELSE IF ChoiceItem  THEN
                  choice:='Item';

                IF Choice2Default THEN
                  Choice2:='Default'
                ELSE IF Choice2Alternative THEN
                  Choice2:='Alternative'
                ELSE IF Choice2Item THEN
                  Choice2:='Item' ;

                IF Choice3Item THEN
                  Choice3:='Item'
                ELSE IF Choice3Issue THEN
                  Choice3:='ISSUE';
            end;
        }
        dataitem("<Item Ledger Entry5>";"Item Ledger Entry")
        {
            DataItemTableView = SORTING(Item No.,Lot No.,ITL Doc No.) ORDER(Ascending) WHERE(Entry Type=CONST(Transfer),Product Group Code=CONST(PCB),Location Code=FILTER(<>STR),Remaining Quantity=FILTER(>0));
            column(ILE5;ILE5)
            {
            }
            column(ILE5_Choice;choice)
            {
            }
            column(ILE5_Choice2;Choice2)
            {
            }
            column(Item_Ledger_Entry5__Entry_No_;"Entry No.")
            {
            }
            column(Item_Ledger_Entry5__Item_No_;"Item No.")
            {
            }
            dataitem("<Item1>";Item)
            {
                DataItemLink = No.=FIELD(Item No.);
                DataItemTableView = SORTING(No.) ORDER(Ascending);
                column(Item1Header1;Item1Header1)
                {
                }
                column(item_desc__Control1000000003;"item desc")
                {
                }
                column(BINAddress;BINAddress)
                {
                }
                column(ILE1__ITL_Doc_No__;ILE1."ITL Doc No.")
                {
                }
                column(ILE1__Lot_No__;ILE1."Lot No.")
                {
                }
                column(CARD_DESC_Control1102156014;CARD_DESC)
                {
                }
                column(ILE1__Serial_No__;ILE1."Serial No.")
                {
                }
                column(serial_no_qty_print;"Production Order".COUNT)
                {
                }
                column(Item_Description__Caption;Item_Description__CaptionLbl)
                {
                }
                column(Production_Order_No_Caption;Production_Order_No_CaptionLbl)
                {
                }
                column(Lot_No_Caption_Control1102156008;Lot_No_Caption_Control1102156008Lbl)
                {
                }
                column(Serial_No_Caption_Control1102156009;Serial_No_Caption_Control1102156009Lbl)
                {
                }
                column(Compound_DescriptionCaption_Control1102156001;Compound_DescriptionCaption_Control1102156001Lbl)
                {
                }
                column(Item1__No_;"No.")
                {
                }
                column(ProductionBOM_Caption1;ProductionBOM_CaptionLbl)
                {
                }
                column(Prod__Order_Line___Production_BOM_No__1;"Prod. Order Line"."Production BOM No.")
                {
                }
                column(Stencil1;Stencil1)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    //Rev01
                    Item1Header1 := TRUE;
                    
                    //<Item1>, Header (1) - OnPreSection()
                    item1.SETRANGE(item1."No.","<Item1>"."No.");
                    item1.MARKEDONLY(TRUE);
                    IF item1.FINDFIRST THEN BEGIN
                      //CurrReport.SHOWOUTPUT(TRUE);
                      Item1Header1 := TRUE;
                    
                      "item desc" := "<Item1>".Description;
                      BINAddress := "<Item1>"."BIN Address";
                       ILE1.SETRANGE(ILE1."Item No.",item1."No.");
                       ILE1.SETFILTER(ILE1."ITL Doc No.","<Item Ledger Entry5>".GETFILTER("<Item Ledger Entry5>"."ITL Doc No."))  ;
                       IF Excel THEN BEGIN
                        Row+=1;
                        EnterHeadings(Row,1,item1."No.",TRUE,TempExcelbuffer."Cell Type" :: Number);
                        EnterHeadings(Row,2,"item desc",TRUE,TempExcelbuffer."Cell Type" :: Text);
                        Row+=1;
                        EnterHeadings(Row,1,'PRODUCTION ORDER NO',TRUE,TempExcelbuffer."Cell Type" :: Text);
                        EnterHeadings(Row,2,'COMPOUND DESCRIPTION',TRUE,TempExcelbuffer."Cell Type" :: Text);
                        EnterHeadings(Row,3,'LOT NO',TRUE,TempExcelbuffer."Cell Type" :: Text);
                        EnterHeadings(Row,4,'SERIAL NO',TRUE,TempExcelbuffer."Cell Type" :: Text);
                       END;
                    END ELSE
                     //CurrReport.SHOWOUTPUT(FALSE);
                     Item1Header1 := FALSE;
                    //<Item1>, Header (1) - OnPreSection()
                    
                    //<Item1>, Body (2) - OnPreSection()
                    /*IF Item.GET("<Item1>"."No.") THEN BEGIN
                      Item.MARKEDONLY(TRUE);
                      IF Item.FINDFIRST THEN BEGIN
                        ILE.SETRANGE(ILE."Item No.",Item."No.");
                        ILE.SETFILTER(ILE."ITL Doc No.","<Item Ledger Entry5>".GETFILTER("<Item Ledger Entry5>"."ITL Doc No."))  ;
                        IF ILE.FIND('-') THEN BEGIN
                        END;
                      END;
                     END;
                    */
                    ILE1.MARKEDONLY(TRUE);
                    IF ILE1.FINDFIRST THEN BEGIN
                      ILE1.MARK(FALSE);
                      ILE1.MODIFY;
                      "Prod. Order Line".RESET;
                      "Prod. Order Line".SETRANGE("Prod. Order Line"."Prod. Order No.",ILE1."ITL Doc No.");
                      "Prod. Order Line".SETRANGE("Prod. Order Line"."Line No.",ILE1."ITL Doc Line No.");
                      IF "Prod. Order Line".FIND('-') THEN
                      CARD_DESC := "Prod. Order Line".Description;
                      IF Excel THEN BEGIN
                        Row+=1;
                        Entercell(Row,1,ILE1."ITL Doc No.",FALSE,TempExcelbuffer."Cell Type" :: Number);
                        Entercell(Row,2,CARD_DESC,FALSE,TempExcelbuffer."Cell Type" :: Text);
                        Entercell(Row,3,ILE1."Lot No.",FALSE,TempExcelbuffer."Cell Type" :: Number);
                        Entercell(Row,4,ILE1."Serial No.",FALSE,TempExcelbuffer."Cell Type" :: Number);
                      END;
                    END;
                    //<Item1>, Body (2) - OnPreSection()
                    
                    //<Item1>, Body (2) - OnPostSection()
                    IF item1.GET("<Item1>"."No.") THEN BEGIN
                      item1.MARK(FALSE);
                      item1.MODIFY;
                    END;
                    //<Item1>, Body (2) - OnPostSection()

                end;

                trigger OnPreDataItem();
                begin
                    sno_cnt:=0;
                     IF item1.FIND('-') THEN
                     REPEAT
                     item1.MARK(TRUE);
                     item1.MODIFY;
                     UNTIL item1.NEXT=0;

                     IF ILE1.FIND('-') THEN
                     REPEAT
                     ILE1.MARK(TRUE);
                     ILE1.MODIFY;
                     sno_cnt:=sno_cnt+1;
                     UNTIL ILE1.NEXT=0;

                    IF ChoiceIssue THEN
                      choice:='Issue'
                    ELSE IF ChoiceItem  THEN
                      choice:='Item';

                    IF Choice2Default THEN
                      Choice2:='Default'
                    ELSE IF Choice2Alternative THEN
                      Choice2:='Alternative'
                    ELSE IF Choice2Item THEN
                      Choice2:='Item' ;

                    IF Choice3Item THEN
                      Choice3:='Item'
                    ELSE IF Choice3Issue THEN
                      Choice3:='ISSUE';
                end;
            }

            trigger OnAfterGetRecord();
            begin
                Stencil1:='';
                PCBGRec.RESET;
                PCBGRec.SETRANGE(PCBGRec."PCB No.","<Item Ledger Entry5>"."Item No.");
                PCBGRec.SETFILTER(PCBGRec.Stencil,'<>%1','');
                IF NOT PCBGRec.FINDFIRST THEN
                  Stencil1:=''
                ELSE Stencil1:='Stencil';
            end;

            trigger OnPreDataItem();
            begin
                //ILE5 := (choice<>choice::Issue) OR (Choice2<>Choice2::Item);
                //IF (choice<>choice::Issue) OR (Choice2<>Choice2::Item) THEN

                IF (NOT ChoiceIssue) OR (NOT Choice2Item) THEN
                CurrReport.BREAK;

                //IF ILE5 = FALSE THEN
                //CurrReport.BREAK;

                  STRING := "Production Order".GETFILTER("Production Order"."No.");
                 "<Item Ledger Entry5>".SETFILTER("<Item Ledger Entry5>"."ITL Doc No.",STRING);
                IF ChoiceIssue THEN
                  choice:='Issue'
                ELSE IF ChoiceItem  THEN
                  choice:='Item';

                IF Choice2Default THEN
                  Choice2:='Default'
                ELSE IF Choice2Alternative THEN
                  Choice2:='Alternative'
                ELSE IF Choice2Item THEN
                  Choice2:='Item' ;

                IF Choice3Item THEN
                  Choice3:='Item'
                ELSE IF Choice3Issue THEN
                  Choice3:='ISSUE';
            end;
        }
        dataitem("Posted Material Issues Header";"Posted Material Issues Header")
        {
            DataItemTableView = SORTING(Prod. Order No.,Prod. Order Line No.) ORDER(Ascending) WHERE(Transfer-from Code=CONST(STR));
            RequestFilterFields = "Prod. Order No.","Prod. Order Line No.","Prod. BOM No.";
            ReqFilterHeading = 'Production Order Wise Issued Serial No''s(If Any Deviations)';
            column(PMIH_Choice;choice)
            {
            }
            column(PMIH_Choice2;Choice2)
            {
            }
            column(USERID_Control1102154010;USERID)
            {
            }
            column(TODAY_Control1102154011;TODAY)
            {
            }
            column(COMPANYNAME_Control1102154012;COMPANYNAME)
            {
            }
            column(Posted_Material_Issues_Header__Prod__Order_No__;"Prod. Order No.")
            {
            }
            column(Production_Order_Wise_Issued_Serial_No_sCaption_Control1102154009;Production_Order_Wise_Issued_Serial_No_sCaption_Control1102154009Lbl)
            {
            }
            column(Posted_Material_Issues_Header__Prod__Order_No__Caption;FIELDCAPTION("Prod. Order No."))
            {
            }
            column(Serial_No_Caption_Control1102154017;Serial_No_Caption_Control1102154017Lbl)
            {
            }
            column(Lot_No_Caption_Control1102154018;Lot_No_Caption_Control1102154018Lbl)
            {
            }
            column(Item_DescriptionCaption_Control1102154019;Item_DescriptionCaption_Control1102154019Lbl)
            {
            }
            column(Item_No_Caption_Control1102154020;Item_No_Caption_Control1102154020Lbl)
            {
            }
            column(Compound_DescriptionCaption_Control1102154021;Compound_DescriptionCaption_Control1102154021Lbl)
            {
            }
            column(Posted_Material_Issues_Header_No_;"No.")
            {
            }
            dataitem("Item Ledger Entry";"Item Ledger Entry")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document No.,Item No.,Posting Date) ORDER(Ascending) WHERE(Entry Type=CONST(Transfer),Product Group Code=CONST(PCB),Location Code=CONST(PROD));
                column(ILE_Choice;choice)
                {
                }
                column(ILEBody1;ILEBody1)
                {
                }
                column(Item_Ledger_Entry__Item_No__;"Item No.")
                {
                }
                column(item_desc__Control1000000002;"item desc")
                {
                }
                column(Item_Ledger_Entry__Lot_No__;"Lot No.")
                {
                }
                column(Item_Ledger_Entry__Serial_No__;"Serial No.")
                {
                }
                column(CARD_DESC_Control1102154003;CARD_DESC)
                {
                }
                column(Item_Ledger_Entry_Entry_No_;"Entry No.")
                {
                }
                column(Item_Ledger_Entry_Document_No_;"Document No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    //Rev01
                    ILEBody1 := TRUE;

                    //Item Ledger Entry, Body (1) - OnPreSection()
                    IF Item.GET("Item Ledger Entry"."Item No.") THEN BEGIN
                      "item desc":=Item.Description;
                      BINAddress := Item."BIN Address";
                      IF Item."Item Tracking Code"<>'LOTSERIAL' THEN
                       //CurrReport.SHOWOUTPUT:=FALSE;
                       ILEBody1 := FALSE;
                       "Prod. Order Line".SETRANGE("Prod. Order Line"."Prod. Order No.","Posted Material Issues Header"."Prod. Order No.");
                       "Prod. Order Line".SETRANGE("Prod. Order Line"."Line No.","Posted Material Issues Header"."Prod. Order Line No.");
                       IF "Prod. Order Line".FIND('-') THEN
                         CARD_DESC:="Prod. Order Line".Description;

                      ILE.SETCURRENTKEY(ILE."Entry Type",ILE."Item No.",ILE."Location Code",ILE.Open,ILE."Lot No.",ILE."Serial No.");
                      ILE.SETFILTER(ILE."Entry Type",'Transfer');
                      ILE.SETFILTER(ILE."Location Code",'STR');
                      ILE.SETFILTER(ILE.Quantity,'>%1',0);
                      ILE.SETRANGE(ILE."Item No.","Item Ledger Entry"."Item No.");
                      ILE.SETRANGE(ILE."Serial No.","Item Ledger Entry"."Serial No.");
                      //IF ILE.FIND('-') THEN
                      //CurrReport.SHOWOUTPUT:=FALSE;
                      IF Excel  THEN BEGIN
                        Row+=1;
                        Entercell(Row,1,"<Item Ledger Entry3>"."Item No.",FALSE,TempExcelbuffer."Cell Type" :: Number);
                        Entercell(Row,2,CARD_DESC,FALSE,TempExcelbuffer."Cell Type" :: Text);
                        Entercell(Row,3,"item desc",FALSE,TempExcelbuffer."Cell Type" :: Number);
                        Entercell(Row,4,"<Item Ledger Entry3>"."Lot No.",FALSE,TempExcelbuffer."Cell Type" :: Number);
                        Entercell(Row,5,"<Item Ledger Entry3>"."Serial No.",FALSE,TempExcelbuffer."Cell Type" :: Number);
                      END;
                    END;
                    //Item Ledger Entry, Body (1) - OnPreSection()
                end;

                trigger OnPreDataItem();
                begin
                    IF ChoiceIssue THEN
                      choice:='Issue'
                    ELSE IF ChoiceItem  THEN
                      choice:='Item';

                    IF Choice2Default THEN
                      Choice2:='Default'
                    ELSE IF Choice2Alternative THEN
                      Choice2:='Alternative'
                    ELSE IF Choice2Item THEN
                      Choice2:='Item' ;

                    IF Choice3Item THEN
                      Choice3:='Item'
                    ELSE IF Choice3Issue THEN
                      Choice3:='ISSUE';
                end;
            }

            trigger OnAfterGetRecord();
            begin
                //Rev01

                //Posted Material Issues Header, Header (2 - OnPreSection()
                IF Excel THEN
                BEGIN
                  Row+=1;
                  EnterHeadings(Row,1,'Item No.',TRUE,TempExcelbuffer."Cell Type" :: Text);
                  EnterHeadings(Row,2,'Compound Description',TRUE,TempExcelbuffer."Cell Type" :: Text);
                  EnterHeadings(Row,3,'Item Description',TRUE,TempExcelbuffer."Cell Type" :: Text);
                  EnterHeadings(Row,4,'Lot No.',TRUE,TempExcelbuffer."Cell Type" :: Text);
                  EnterHeadings(Row,5,'Serial no.',TRUE,TempExcelbuffer."Cell Type" :: Text);

                END;
                //Posted Material Issues Header, Header (2 - OnPreSection()
            end;

            trigger OnPreDataItem();
            begin
                 IF (NOT ChoiceIssue) OR (NOT Choice2Alternative) THEN
                 CurrReport.BREAK;


                  IF Excel THEN
                  BEGIN
                   CLEAR(TempExcelbuffer);
                   TempExcelbuffer.DELETEALL;
                  END;

                IF ChoiceIssue THEN
                  choice:='Issue'
                ELSE IF ChoiceItem  THEN
                  choice:='Item';

                IF Choice2Default THEN
                  Choice2:='Default'
                ELSE IF Choice2Alternative THEN
                  Choice2:='Alternative'
                ELSE IF Choice2Item THEN
                  Choice2:='Item' ;

                IF Choice3Item THEN
                  Choice3:='Item'
                ELSE IF Choice3Issue THEN
                  Choice3:='ISSUE';
            end;
        }
        dataitem("<Item Ledger Entry2>";"Item Ledger Entry")
        {
            DataItemTableView = SORTING(Item No.,Lot No.,ITL Doc No.) ORDER(Ascending) WHERE(Entry Type=CONST(Transfer),Remaining Quantity=FILTER(>0));
            RequestFilterFields = "Item No.","Lot No.","Serial No.";
            ReqFilterHeading = 'Item Wise';
            column(ILE2Body4;ILE2Body4)
            {
            }
            column(ILE2_Choice;choice)
            {
            }
            column(ILE2_Choice3;Choice3)
            {
            }
            column(TODAY_Control1000000059;TODAY)
            {
            }
            column(USERID_Control1000000060;USERID)
            {
            }
            column(COMPANYNAME_Control1000000066;COMPANYNAME)
            {
            }
            column(COMPANYNAME_Control1000000083;COMPANYNAME)
            {
            }
            column(Desc;Desc)
            {
            }
            column(Item_Ledger_Entry2____Item_Ledger_Entry2____Serial_No__;"<Item Ledger Entry2>"."Serial No.")
            {
            }
            column(Desc1;Desc1)
            {
            }
            column(Item_Ledger_Entry2___Item_No__;"Item No.")
            {
            }
            column(Item_Ledger_Entry2___Serial_No__;"Serial No.")
            {
            }
            column(Dept;Dept)
            {
            }
            column(Name;Name)
            {
            }
            column(Item_Ledger_Entry2___Posting_Date_;"Posting Date")
            {
            }
            column(PO;PO)
            {
            }
            column(Item_Wise_Prod__Order_No_Caption;Item_Wise_Prod__Order_No_CaptionLbl)
            {
            }
            column(Module_Wise_Material_TestCaption;Module_Wise_Material_TestCaptionLbl)
            {
            }
            column(PCBCaption;PCBCaptionLbl)
            {
            }
            column(Serial_No_Caption_Control1000000030;Serial_No_Caption_Control1000000030Lbl)
            {
            }
            column(Production_Order_NoCaption;Production_Order_NoCaptionLbl)
            {
            }
            column(Issued_PersonCaption;Issued_PersonCaptionLbl)
            {
            }
            column(Posting_DateCaption;Posting_DateCaptionLbl)
            {
            }
            column(DEPTCaption;DEPTCaptionLbl)
            {
            }
            column(Serila_No_Caption;Serila_No_CaptionLbl)
            {
            }
            column(Item_No_Caption_Control1000000038;Item_No_Caption_Control1000000038Lbl)
            {
            }
            column(DescriptionCaption;DescriptionCaptionLbl)
            {
            }
            column(Item_Ledger_Entry2__Entry_No_;"Entry No.")
            {
            }
            column(Item_Ledger_Entry2__Document_No_;"Document No.")
            {
            }
            dataitem("<Item Ledger Entry4>";"Item Ledger Entry")
            {
                DataItemLink = Document No.=FIELD(Document No.);
                DataItemTableView = SORTING(Document No.,Item No.,Posting Date) ORDER(Ascending) WHERE(Entry Type=CONST(Transfer),Location Code=CONST(PROD));
                column(Item_Ledger_Entry4___Item_No__;"Item No.")
                {
                }
                column(Item_Ledger_Entry4___Lot_No__;"Lot No.")
                {
                }
                column(Item_Ledger_Entry4__Quantity;Quantity)
                {
                }
                column(Desc_Control1000000056;Desc)
                {
                }
                column(Item_Ledger_Entry4___Item_No__Caption;FIELDCAPTION("Item No."))
                {
                }
                column(Item_Ledger_Entry4___Lot_No__Caption;FIELDCAPTION("Lot No."))
                {
                }
                column(Item_Ledger_Entry4__QuantityCaption;FIELDCAPTION(Quantity))
                {
                }
                column(DescriptionCaption_Control1000000057;DescriptionCaption_Control1000000057Lbl)
                {
                }
                column(Item_Ledger_Entry4__Entry_No_;"Entry No.")
                {
                }
                column(Item_Ledger_Entry4__Document_No_;"Document No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    IF NOT Choice3Issue THEN
                    CurrReport.BREAK;

                    //Rev01

                    //<Item Ledger Entry4>, Body (2) - OnPreSection()
                    Item.SETRANGE(Item."No.","<Item Ledger Entry4>"."Item No.");
                    IF Item.FIND('-') THEN
                     Desc:=Item.Description;
                    //<Item Ledger Entry4>, Body (2) - OnPreSection()
                end;

                trigger OnPreDataItem();
                begin
                    IF ChoiceIssue THEN
                      choice:='Issue'
                    ELSE IF ChoiceItem  THEN
                      choice:='Item';

                    IF Choice2Default THEN
                      Choice2:='Default'
                    ELSE IF Choice2Alternative THEN
                      Choice2:='Alternative'
                    ELSE IF Choice2Item THEN
                      Choice2:='Item' ;

                    IF Choice3Item THEN
                      Choice3:='Item'
                    ELSE IF Choice3Issue THEN
                      Choice3:='ISSUE';
                end;
            }

            trigger OnAfterGetRecord();
            begin

                 IF Item.GET("<Item Ledger Entry2>"."Item No.") THEN
                 Desc:=Item.Description;


                //Rev01

                //<Item Ledger Entry2>, Header (1) - OnPreSection()
                //CurrReport.SHOWOUTPUT(Choice3=Choice3::Item);
                //<Item Ledger Entry2>, Header (1) - OnPreSection()

                //<Item Ledger Entry2>, Header (2) - OnPreSection()
                //CurrReport.SHOWOUTPUT(Choice3<>Choice3::Item);
                //<Item Ledger Entry2>, Header (2) - OnPreSection()

                //<Item Ledger Entry2>, Header (3) - OnPreSection()
                //CurrReport.SHOWOUTPUT(Choice3=Choice3::Item);
                //IF Excel AND (Choice3=Choice3::Item) THEN BEGIN
                IF Excel AND (Choice3Item) THEN BEGIN
                  Row+=1;
                  EnterHeadings(Row,1,'Production Order No.',TRUE,TempExcelbuffer."Cell Type" :: Text);
                  EnterHeadings(Row,2,'Issued Person',TRUE,TempExcelbuffer."Cell Type" :: Text);
                  EnterHeadings(Row,3,'Posting Date',TRUE,TempExcelbuffer."Cell Type" :: Text);
                  EnterHeadings(Row,4,'Deaprtment',TRUE,TempExcelbuffer."Cell Type" :: Text);
                  EnterHeadings(Row,5,'Serial no  .',TRUE,TempExcelbuffer."Cell Type" :: Text);
                  EnterHeadings(Row,6,'Item No.',TRUE,TempExcelbuffer."Cell Type" :: Text);
                  EnterHeadings(Row,7,'Description',TRUE,TempExcelbuffer."Cell Type" :: Text);
                END;
                //<Item Ledger Entry2>, Header (3) - OnPreSection()

                //<Item Ledger Entry2>, Body (4) - OnPreSection()

                PMH.SETRANGE(PMH."No.","<Item Ledger Entry2>"."Document No.");
                 IF PMH.FIND('-') THEN BEGIN
                  USer:=PMH."User ID";
                  PO:=PMH."Prod. Order No.";

                  DV.SETFILTER(DV."Dimension Code",'EMPLOYEE CODES');
                  DV.SETRANGE(DV.Code,PMH."Posted By");
                  Dept:=PMH."Transfer-to Code";
                  IF DV.FIND('-') THEN
                   Name:=DV.Name;
                 END;

                Item.SETRANGE(Item."No.","<Item Ledger Entry2>"."Item No.");
                IF Item.FIND('-') THEN
                 Desc1:=Item.Description;
                // ILE2Body4 := CurrReport.SHOWOUTPUT(Choice3=Choice3::Item);
                ILE2Body4 := CurrReport.SHOWOUTPUT(Choice3Item); //adsk
                 // IF Excel AND (Choice3=Choice3::Item) THEN BEGIN
                  IF Excel AND (Choice3Item) THEN BEGIN
                    Row+=1;
                    Entercell(Row,1,PO,FALSE,TempExcelbuffer."Cell Type" :: Number);
                    Entercell(Row,2,Name,FALSE,TempExcelbuffer."Cell Type" :: Text);
                    Entercell(Row,3,FORMAT("<Item Ledger Entry2>"."Posting Date"),FALSE,TempExcelbuffer."Cell Type" :: Date);
                    Entercell(Row,4,Dept,FALSE,TempExcelbuffer."Cell Type" :: Text);
                    Entercell(Row,5,"<Item Ledger Entry2>"."Serial No.",FALSE,TempExcelbuffer."Cell Type" :: Number);
                    Entercell(Row,6,"<Item Ledger Entry2>"."Item No.",FALSE,TempExcelbuffer."Cell Type" :: Number);
                    Entercell(Row,7,Desc1,FALSE,TempExcelbuffer."Cell Type" :: Text);
                  END;

                //<Item Ledger Entry2>, Body (4) - OnPreSection()
            end;

            trigger OnPreDataItem();
            begin
                  IF NOT ChoiceItem THEN
                  CurrReport.BREAK;
                 Filter:="<Item Ledger Entry2>".GETFILTERS;
                 //"Sr.No":="<Item Ledger Entry2>"."Serial No.";
                IF ChoiceIssue THEN
                  choice:='Issue'
                ELSE IF ChoiceItem  THEN
                  choice:='Item';

                IF Choice2Default THEN
                  Choice2:='Default'
                ELSE IF Choice2Alternative THEN
                  Choice2:='Alternative'
                ELSE IF Choice2Item THEN
                  Choice2:='Item' ;

                IF Choice3Item THEN
                  Choice3:='Item'
                ELSE IF Choice3Issue THEN
                  Choice3:='ISSUE';
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
                    field("Prod. Order Wise";'')
                    {
                        Caption = 'Prod. Order Wise....';
                        Style = Strong;
                        StyleExpr = TRUE;
                    }
                    field(Issue;ChoiceIssue)
                    {
                        Caption = '"   Issue"';

                        trigger OnValidate();
                        begin
                            IF ChoiceIssue=TRUE THEN BEGIN
                              ChoiceItem:=FALSE;
                              Choice3Item:=FALSE;
                              Choice3Issue:=FALSE;
                              Choice2Default:=TRUE;
                            END;
                        end;
                    }
                    field(Default;Choice2Default)
                    {
                        Caption = '"      Default"';

                        trigger OnValidate();
                        begin
                            IF Choice2Default=TRUE THEN BEGIN
                              ChoiceIssue:=TRUE;
                              Choice2Alternative:=FALSE;
                              Choice2Item:=FALSE;
                              ChoiceItem:=FALSE;
                              Choice3Item:=FALSE;
                              Choice3Issue:=FALSE;

                            END;
                        end;
                    }
                    field(Alternative;Choice2Alternative)
                    {
                        Caption = '"      Alternative"';

                        trigger OnValidate();
                        begin
                            IF Choice2Alternative=TRUE THEN BEGIN
                              ChoiceIssue:=TRUE;
                              Choice2Default:=FALSE;
                              Choice2Item:=FALSE;
                              ChoiceItem:=FALSE;
                              Choice3Item:=FALSE;
                              Choice3Issue:=FALSE;

                            END;
                        end;
                    }
                    field(Item1;Choice2Item)
                    {
                        Caption = '"      Item"';

                        trigger OnValidate();
                        begin
                            IF Choice2Item=TRUE THEN BEGIN
                              ChoiceIssue:=TRUE;
                              Choice2Default:=FALSE;
                              Choice2Alternative:=FALSE;
                              ChoiceItem:=FALSE;
                              Choice3Item:=FALSE;
                              Choice3Issue:=FALSE;

                            END;
                        end;
                    }
                    field("Item Wise";'')
                    {
                        Caption = 'Item Wise....';
                        Style = Strong;
                        StyleExpr = TRUE;
                    }
                    field(Item;ChoiceItem)
                    {
                        Caption = '"   Item"';

                        trigger OnValidate();
                        begin
                            IF ChoiceItem=TRUE THEN BEGIN
                              ChoiceIssue:=FALSE;
                              Choice2Default:=FALSE;
                              Choice2Alternative:=FALSE;
                              Choice2Item:=FALSE;
                              Choice3Item:=TRUE;
                            END;
                        end;
                    }
                    field(Individual;Choice3Item)
                    {
                        Caption = '"      Individual"';

                        trigger OnValidate();
                        begin
                            IF Choice3Item=TRUE THEN BEGIN
                              ChoiceItem:=TRUE;
                              Choice3Issue:=FALSE;
                              ChoiceIssue:=FALSE;
                              Choice2Default:=FALSE;
                              Choice2Alternative:=FALSE;
                              Choice2Item:=FALSE;

                            END;
                        end;
                    }
                    field(Module;Choice3Issue)
                    {
                        Caption = '"      Module"';

                        trigger OnValidate();
                        begin
                            IF Choice3Issue=TRUE THEN BEGIN
                              ChoiceItem:=TRUE;
                              Choice3Item:=FALSE;
                              ChoiceIssue:=FALSE;
                              Choice2Default:=FALSE;
                              Choice2Alternative:=FALSE;
                              Choice2Item:=FALSE;

                            END;
                        end;
                    }
                    field(Excel;Excel)
                    {
                    }
                    field("Print Type";Print_Type)
                    {
                        OptionCaption = 'New Page For Project, Serial';
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
        IF Excel THEN
        BEGIN
          /*
          TempExcelbuffer.CreateBook('Prod Order Serial No.',''); //EFFUPG
          TempExcelbuffer.WriteSheet('Prod Order Serial No.',COMPANYNAME,USERID);
          TempExcelbuffer.CloseBook;
          TempExcelbuffer.OpenExcel;
          TempExcelbuffer.GiveUserControl;
          */
          TempExcelbuffer.CreateBookAndOpenExcel('','Prod Order Serial No.','Prod Order Serial No.',COMPANYNAME,USERID); //EFFUPG
        END;

    end;

    trigger OnPreReport();
    begin
         //Filters:="Production Order".GETFILTERS;
          IF Excel THEN
          BEGIN
           CLEAR(TempExcelbuffer);
           TempExcelbuffer.DELETEALL;
          END;
    end;

    var
        "item desc" : Text[50];
        Item : Record Item;
        Desc : Text[100];
        Desc1 : Text[100];
        Dept : Code[100];
        Name : Text[100];
        PO : Text;
        choice : Text;
        PMH : Record "Posted Material Issues Header";
        USer : Code[100];
        DV : Record "Dimension Value";
        Choice2 : Text;
        ILE : Record "Item Ledger Entry";
        Choice3 : Text;
        "Filter" : Text[300];
        "Sr.No" : Integer;
        "Prod. Order Line" : Record "Prod. Order Line";
        CARD_DESC : Text[200];
        TempExcelbuffer : Record "Excel Buffer" temporary;
        Row : Integer;
        Excel : Boolean;
        VALID : Boolean;
        Print_Type : Option Project,Serial;
        STRING : Code[1024];
        ILE1 : Record "Item Ledger Entry" temporary;
        item1 : Record Item temporary;
        Production_Order_Wise_Issued_Serial_No_sCaptionLbl : Label 'Production Order Wise Issued Serial No''s';
        Item_Wise_Issued_Serial_No_s__For_Production_Order_sCaptionLbl : Label 'Item Wise Issued Serial No''s  For Production Order''s';
        Production_Order_Wise_Issued_Serial_No_sCaption_Control1000000068Lbl : Label 'Production Order Wise Issued Serial No''s';
        Prod__Order_No_CaptionLbl : Label 'Prod .Order No.';
        Prod__Order_No_Caption_Control1102154023Lbl : Label 'Prod .Order No.';
        Serial_No_CaptionLbl : Label 'Serial No.';
        Lot_No_CaptionLbl : Label 'Lot No.';
        Item_DescriptionCaptionLbl : Label 'Item Description';
        Item_No_CaptionLbl : Label 'Item No.';
        Compound_DescriptionCaptionLbl : Label 'Compound Description';
        Item_Description__CaptionLbl : Label 'Item Description :';
        Production_Order_No_CaptionLbl : Label 'Production Order No.';
        Lot_No_Caption_Control1102156008Lbl : Label 'Lot No.';
        Serial_No_Caption_Control1102156009Lbl : Label 'Serial No.';
        Compound_DescriptionCaption_Control1102156001Lbl : Label 'Compound Description';
        Production_Order_Wise_Issued_Serial_No_sCaption_Control1102154009Lbl : Label 'Production Order Wise Issued Serial No''s';
        Serial_No_Caption_Control1102154017Lbl : Label 'Serial No.';
        Lot_No_Caption_Control1102154018Lbl : Label 'Lot No.';
        Item_DescriptionCaption_Control1102154019Lbl : Label 'Item Description';
        Item_No_Caption_Control1102154020Lbl : Label 'Item No.';
        Compound_DescriptionCaption_Control1102154021Lbl : Label 'Compound Description';
        Item_Wise_Prod__Order_No_CaptionLbl : Label 'Item Wise Prod. Order No.';
        Module_Wise_Material_TestCaptionLbl : Label 'Module Wise Material Test';
        PCBCaptionLbl : Label 'PCB';
        Serial_No_Caption_Control1000000030Lbl : Label 'Serial No.';
        Production_Order_NoCaptionLbl : Label 'Production Order No';
        Issued_PersonCaptionLbl : Label 'Issued Person';
        Posting_DateCaptionLbl : Label 'Posting Date';
        DEPTCaptionLbl : Label 'DEPT';
        Serila_No_CaptionLbl : Label 'Serila No.';
        Item_No_Caption_Control1000000038Lbl : Label 'Item No.';
        DescriptionCaptionLbl : Label 'Description';
        DescriptionCaption_Control1000000057Lbl : Label 'Description';
        "-Rev01-" : Integer;
        ILE3Body3 : Boolean;
        Item1Header1 : Boolean;
        ILEBody1 : Boolean;
        ILE5 : Boolean;
        ILE2Body4 : Boolean;
        ProductionBOM_CaptionLbl : Label 'Production BOM No.';
        ChoiceIssue : Boolean;
        Choice2Default : Boolean;
        Choice2Alternative : Boolean;
        Choice2Item : Boolean;
        ChoiceItem : Boolean;
        Choice3Item : Boolean;
        Choice3Issue : Boolean;
        PCBGRec : Record PCB;
        Stencil1 : Code[10];
        BINAddress : Code[20];
        sno_cnt : Integer;

    (3385)]
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

    (3395)]
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

    (3406)]
    procedure "Entercell New"();
    begin
    end;
}

