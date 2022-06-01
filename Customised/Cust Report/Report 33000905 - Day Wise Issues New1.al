report 33000905 "Day Wise Issues New1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Day Wise Issues New1.rdlc';

    dataset
    {
        dataitem("Posted Material Issues Line"; "Posted Material Issues Line")
        {
            DataItemTableView = SORTING(Material Requisition Date, Production BOM No., Issued DateTime, Dept, Item No.) ORDER(Ascending);
            RequestFilterFields = "Material Requisition Date", Dept, "Production BOM No.";
            ReqFilterHeading = 'Posted Material Issues Line';
            column(Item_No; "Posted Material Issues Line"."Item No.")
            {
            }
            column(Desc; "Posted Material Issues Line".Description)
            {
            }
            column(Qty; "Posted Material Issues Line".Quantity)
            {
            }
            column(UOM; "Posted Material Issues Line"."Unit of Measure")
            {
            }
            column(Mat_Req_Date; "Posted Material Issues Line"."Material Requisition Date")
            {
            }
            column(Dept; "Posted Material Issues Line".Dept)
            {
            }
            column(Prod_Ordr_No; "Posted Material Issues Line"."Prod. Order No.")
            {
            }
            column(Prod_Order_Line_No; "Posted Material Issues Line"."Prod. Order Line No.")
            {
            }
            column(Prod_BOM_No; ProdBOMNo)
            {
            }
            column(CURRENTDATETIME; CURRENTDATETIME)
            {
            }
            column(BinAddrs; BinAddrs)
            {
            }
            column(MechOrWring; MechOrWring)
            {
            }
            column(HeaderDesc; HeaderDesc)
            {
            }
            column(ProdBOMDesc; ProdBOMDesc)
            {
            }
            column(ReleasedDateTime; ReleasedDateTime)
            {
            }
            column(IssuedDateTime; IssuedDateTime)
            {
            }
            column(PostingDate; PostingDate)
            {
            }
            column(Req_By; Req_By)
            {
            }
            column(ProjCodes; ProjCodes)
            {
            }
            column(PMINos; PMINos)
            {
            }
            column(TransferFromCode; "Posted Material Issues Line"."Transfer-from Code")
            {
            }
            column(TransferToCode; "Posted Material Issues Line"."Transfer-to Code")
            {
            }
            column(ProdOrderNosSeries; ProdOrderNos)
            {
            }
            column(ItmDesc2; ItmDesc2)
            {
            }
            column(ShortageCount; ShortageCount)
            {
            }
            column(RequestedByCaption; RequestedByCaption)
            {
            }
            column(ProdCodesCaption; ProdCodesCaption)
            {
            }
            column(Tran4CodeCaption; Tran4CodeCaption)
            {
            }
            column(Trans2CodeCaption; Trans2CodeCaption)
            {
            }
            column(CompPCBCaption; CompPCBCaption)
            {
            }
            column(ReqDateCaption; ReqDateCaption)
            {
            }
            column(IssuedDateCaption; IssuedDateCaption)
            {
            }
            column(CompanyNameCaption; CompanyNameCaption)
            {
            }
            column(MatReqDateCaption; MatReqDateCaption)
            {
            }
            column(CurrtDateTime; CurrtDateTime)
            {
            }
            column(setcount; setcount)
            {
            }
            dataitem("Item Ledger Entry"; "Item Ledger Entry")
            {
                DataItemLink = Document No.=FIELD(Document No.),Item No.=FIELD(Item No.);
                DataItemTableView = SORTING(Document No.,Item No.,Posting Date) ORDER(Ascending) WHERE(Entry Type=CONST(Transfer),Quantity=FILTER(>0));
                column(SerialNo;"Item Ledger Entry"."Serial No.")
                {
                }
                column(LotNo;"Item Ledger Entry"."Lot No.")
                {
                }
                column(ProdOrderNos_ILE;ProdOrderNos1)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    /*
                    IF (PrevILEItm <> "Item Ledger Entry"."Item No.") OR ("Item Ledger Entry"."Lot No." <> PrevLot) THEN
                    BEGIN
                      ProdOrderNos1:='';
                      FOR i:=1 TO 1000 DO
                        Codes1[i] := '';
                      i:=0; j:=0; count1:=0;  c2:=0; templen:=0;
                      CLEAR(ItmLedgrEntr);
                      ItmLedgrEntr.SETCURRENTKEY("Entry Type","Item No.","Location Code",Open,"Lot No.","Serial No.","ITL Doc No.","ITL Doc Line No.","ITL Doc Ref Line No.");
                      ItmLedgrEntr.SETRANGE(ItmLedgrEntr."Entry Type",ItmLedgrEntr."Entry Type"::Transfer);
                      ItmLedgrEntr.SETRANGE(ItmLedgrEntr."Item No.","Item Ledger Entry"."Item No.");
                      ItmLedgrEntr.SETRANGE(ItmLedgrEntr."Location Code",'PROD');
                      ItmLedgrEntr.SETRANGE(ItmLedgrEntr."Lot No.","Item Ledger Entry"."Lot No.");
                      ItmLedgrEntr.SETRANGE(ItmLedgrEntr."Posting Date","Item Ledger Entry"."Posting Date");
                      IF "Item Ledger Entry"."Serial No." <> '' THEN
                        ItmLedgrEntr.SETFILTER(ItmLedgrEntr."Serial No.","Item Ledger Entry"."Serial No.");
                      ItmLedgrEntr.SETFILTER(ItmLedgrEntr."ITL Doc No.",codestext);
                      ItmLedgrEntr.SETFILTER(ItmLedgrEntr.Quantity,'>%1',0);
                      IF ItmLedgrEntr.FINDSET THEN
                      REPEAT
                        {
                        PostedMatIssLine.RESET;
                        PostedMatIssLine.SETCURRENTKEY("Material Requisition Date","Production BOM No.","Issued DateTime",Dept,"Item No.");
                        PostedMatIssLine.SETRANGE(PostedMatIssLine."Material Requisition Date","Posted Material Issues Line"."Material Requisition Date");
                        PostedMatIssLine.SETRANGE(PostedMatIssLine."Production BOM No.","Posted Material Issues Line"."Production BOM No.");
                        PostedMatIssLine.SETRANGE(PostedMatIssLine."Issued DateTime",CREATEDATETIME("Item Ledger Entry"."Posting Date",0T),CREATEDATETIME("Item Ledger Entry"."Posting Date",235900T));
                        PostedMatIssLine.SETRANGE(PostedMatIssLine."Item No.","Item Ledger Entry"."Item No.");
                        PostedMatIssLine.SETRANGE(PostedMatIssLine."Prod. Order No.",ItmLedgrEntr."ITL Doc No.");
                        IF PostedMatIssLine.FINDFIRST THEN
                        BEGIN
                        }
                          i:=0; j:=0; count1:=0;  c2:=0; templen:=0;
                          FOR i:=1 TO 1000 DO
                          BEGIN
                            IF Codes1[i] = ItmLedgrEntr."ITL Doc No." THEN
                              count1 := count1+1;
                            IF Codes1[i] = '' THEN
                              i:=1000;
                          END;
                          FOR i:=1 TO 1000 DO
                          BEGIN
                            IF Codes1[i] = '' THEN
                            BEGIN
                              j:=i;
                              i:=1000;
                            END;
                          END;
                          IF count1 = 0 THEN
                          BEGIN
                            FOR i:=1 TO 1000 DO
                            BEGIN
                              IF Codes1[i] <>'' THEN
                              BEGIN
                                templen:=STRLEN(COPYSTR(ItmLedgrEntr."ITL Doc No.",1,STRLEN(ItmLedgrEntr."ITL Doc No.")-4));
                                IF COPYSTR(Codes1[i],1,templen) =COPYSTR(ItmLedgrEntr."ITL Doc No.",1,STRLEN(ItmLedgrEntr."ITL Doc No.")-4) THEN
                                BEGIN
                                  Codes1[i]:=COPYSTR(Codes1[i],1,templen+4)+'..'+COPYSTR(ItmLedgrEntr."ITL Doc No.",STRLEN(ItmLedgrEntr."ITL Doc No.")-3,4);
                                  codestext1:=codestext1+'|'+ItmLedgrEntr."ITL Doc No.";
                                  i:=1000;
                                  c2:=c2+1;
                                END;
                              END ELSE i:=1000;
                            END;
                            IF c2=0 THEN
                            BEGIN
                              Codes1[j]:=ItmLedgrEntr."ITL Doc No.";
                              IF codestext1 = '' THEN
                                codestext1:=ItmLedgrEntr."ITL Doc No."
                              ELSE
                                codestext1:=codestext1+'|'+ItmLedgrEntr."ITL Doc No.";
                            END;
                          END;
                        //END;
                      UNTIL ItmLedgrEntr.NEXT=0;
                    END;
                    FOR i:=1 TO 1000 DO
                    BEGIN
                      IF ProdOrderNos1 = '' THEN
                        ProdOrderNos1:= Codes1[i]
                      ELSE
                        ProdOrderNos1:=ProdOrderNos1+'|'+Codes1[i];
                      IF Codes1[i]='' THEN
                      i:=1000;
                    END;
                    IF STRLEN(ProdOrderNos1) > 1 THEN
                      ProdOrderNos1:=COPYSTR(ProdOrderNos1,1,STRLEN(ProdOrderNos1)-1);
                    PrevILEItm:="Item Ledger Entry"."Item No.";
                    PrevLot:="Item Ledger Entry"."Lot No.";
                    */

                end;

                trigger OnPreDataItem();
                begin
                    ItmLedgrEntr.RESET;
                    ItmLedgrEntr.SETCURRENTKEY("Entry Type","Item No.","Location Code",Open,"Lot No.","Serial No.","ITL Doc No.","ITL Doc Line No.","ITL Doc Ref Line No.");
                end;
            }

            trigger OnAfterGetRecord();
            begin
                IF Picked = FALSE THEN
                BEGIN
                  IF NOT ("Posted Material Issues Line"."Transfer-from Code" IN['STR','MCH']) THEN
                    CurrReport.SKIP;
                  IF NOT ("Posted Material Issues Line"."Transfer-to Code" IN['PROD']) THEN
                    CurrReport.SKIP;
                  IF "Posted Material Issues Line".Quantity <=0 THEN
                    CurrReport.SKIP;
                  PMIH.RESET;
                  IF PMIH.GET("Posted Material Issues Line"."Document No.") THEN
                  BEGIN
                    Req_By:=PMIH."Resource Name"+'('+COPYSTR(PMIH."Released By",12,STRLEN(PMIH."Released By"))+')';
                    IssuedDateTime:=PMIH."Issued DateTime";
                    ReleasedDateTime:=PMIH."Released Date";
                    PostingDate:=PMIH."Posting Date";
                  END;
                  IssdDate:=0D;
                  IssdDate:= DT2DATE("Posted Material Issues Line"."Issued DateTime");
                  ProjCodes:="Posted Material Issues Line"."Prod. Order No.";
                  PMINos:="Posted Material Issues Line"."Document No.";
                  MechOrWring:='';
                  ItmDesc2:='';
                  Item.RESET;
                  Item.SETRANGE(Item."No.","Posted Material Issues Line"."Item No.");
                  IF Item.FINDFIRST THEN
                  BEGIN
                    BinAddrs := Item."BIN Address";
                    ItmDesc2:=Item."Description 2";
                  END;
                  ProdOrderLine.RESET;
                  ProdOrderLine.SETCURRENTKEY("Prod. Order No.","Line No.",Status);
                  ProdOrderLine.SETRANGE(ProdOrderLine."Prod. Order No.","Posted Material Issues Line"."Prod. Order No.");
                  ProdOrderLine.SETRANGE(ProdOrderLine."Line No.","Posted Material Issues Line"."Prod. Order Line No.");
                  IF ProdOrderLine.FINDFIRST THEN
                  BEGIN
                    ProdBOMNo:=ProdOrderLine."Item No.";
                    ProdBOMDesc:=ProdOrderLine.Description;
                  END;
                  "Mech&Wring".RESET;
                  "Mech&Wring".SETCURRENTKEY("Item No.","Lot No.","Production Order No.");
                  "Mech&Wring".SETRANGE("Mech&Wring"."Item No.","Posted Material Issues Line"."Item No.");
                  "Mech&Wring".SETRANGE("Mech&Wring"."Request No.","Posted Material Issues Line"."Material Issue No.");
                  IF "Mech&Wring".FINDFIRST THEN
                    MechOrWring:="Mech&Wring"."BOM Type";
                  IF MechOrWring='MECHANICAL' THEN
                    HeaderDesc:='Mechanical Sets for '+ProdBOMDesc
                  ELSE IF MechOrWring='WIRING' THEN
                    HeaderDesc:='Wiring Sets for '+ProdBOMDesc
                  ELSE
                    HeaderDesc:='Material Sets for '+ProdBOMDesc;
                  TempBOM:='';
                  TempPRevItem:='';
                  ShortageCount:=0;
                  FOR i:=1 TO 1000 DO
                    Codes[i] := '';
                  i:=0; j:=0; count1:=0;  c2:=0; templen:=0;
                  IF (PrevProdBOMNo <> ProdBOMNo)  OR (IssdDate <> PrevIssdDate)THEN
                  BEGIN
                    MIL.RESET;
                    MIL.SETCURRENTKEY("Transfer-from Code","Transfer-to Code","Material Requisition Date","Production BOM No.",Dept,"Item No.");
                    MIL.SETFILTER(MIL."Transfer-from Code",'%1|%2','STR','MCH');
                    MIL.SETFILTER(MIL."Transfer-to Code",'%1','PROD');
                    MIL.SETFILTER(MIL."Material Requisition Date","Posted Material Issues Line".GETFILTER("Posted Material Issues Line"."Material Requisition Date"));
                    MIL.SETFILTER(MIL."Outstanding Qty. (Base)",'>%1',0);
                    IF MIL.FINDSET THEN
                    REPEAT
                      TempBOM:='';
                      ProdOrderLine.RESET;
                      ProdOrderLine.SETCURRENTKEY("Prod. Order No.","Line No.",Status);
                      ProdOrderLine.SETRANGE(ProdOrderLine."Prod. Order No.",MIL."Prod. Order No.");
                      ProdOrderLine.SETRANGE(ProdOrderLine."Line No.",MIL."Prod. Order Line No.");
                      IF ProdOrderLine.FINDFIRST THEN
                      BEGIN
                        TempBOM:=ProdOrderLine."Item No.";
                      END;
                      IF TempBOM=ProdBOMNo THEN
                      BEGIN
                        IF TempPRevItem <> MIL."Item No." THEN
                          ShortageCount:=ShortageCount+1;
                      END;
                      TempPRevItem:=MIL."Item No.";
                    UNTIL MIL.NEXT=0;
                    codestext:='';
                    ProdOrderNos := '';
                    PMIL.RESET;
                    PMIL.SETCURRENTKEY("Material Requisition Date","Production BOM No.",Dept,"Item No.");
                    PMIL.SETRANGE(PMIL."Material Requisition Date","Posted Material Issues Line"."Material Requisition Date");
                    PMIL.SETRANGE(PMIL."Production BOM No.","Posted Material Issues Line"."Production BOM No.");
                    PMIL.SETRANGE(PMIL."Issued DateTime",CREATEDATETIME(IssdDate,0T),CREATEDATETIME(IssdDate,235900T));
                    IF PMIL.FINDFIRST THEN
                    REPEAT
                      i:=0; j:=0; count1:=0;  c2:=0; templen:=0;
                      FOR i:=1 TO 1000 DO
                      BEGIN
                        IF Codes[i] = PMIL."Prod. Order No." THEN
                          count1 := count1+1;
                        IF Codes[i] = '' THEN
                          i:=1000;
                      END;
                      FOR i:=1 TO 1000 DO
                      BEGIN
                        IF Codes[i] = '' THEN
                        BEGIN
                          j:=i;
                          i:=1000;
                        END;
                      END;
                      IF count1 = 0 THEN
                      BEGIN
                        FOR i:=1 TO 1000 DO
                        BEGIN
                          IF Codes[i] <>'' THEN
                          BEGIN
                            templen:=STRLEN(COPYSTR(PMIL."Prod. Order No.",1,STRLEN(PMIL."Prod. Order No.")-4));
                            IF COPYSTR(Codes[i],1,templen) =COPYSTR(PMIL."Prod. Order No.",1,STRLEN(PMIL."Prod. Order No.")-4) THEN
                            BEGIN
                              Codes[i]:=COPYSTR(Codes[i],1,templen+4)+'..'+COPYSTR(PMIL."Prod. Order No.",STRLEN(PMIL."Prod. Order No.")-3,4);
                              codestext:=codestext+'|'+PMIL."Prod. Order No.";
                              i:=1000;
                              c2:=c2+1;
                            END;
                          END ELSE i:=1000;
                        END;
                        IF c2=0 THEN
                        BEGIN
                          Codes[j]:=PMIL."Prod. Order No.";
                          IF codestext = '' THEN
                            codestext:=PMIL."Prod. Order No."
                          ELSE
                            codestext:=codestext+'|'+PMIL."Prod. Order No.";
                        END;
                      END;
                    UNTIL PMIL.NEXT=0;
                  END;
                  FOR i:=1 TO 1000 DO
                  BEGIN
                    IF ProdOrderNos = '' THEN
                      ProdOrderNos:= Codes[i]
                    ELSE
                      ProdOrderNos:=ProdOrderNos+'|'+Codes[i];
                    IF Codes[i]='' THEN
                    i:=1000;
                  END;
                  IF STRLEN(ProdOrderNos) > 1 THEN
                    ProdOrderNos:=COPYSTR(ProdOrderNos,1,STRLEN(ProdOrderNos)-1);
                  setcount:=0;
                  POL.RESET;
                  //POL.SETRANGE(POL.Status,POL.Status::Released);
                  POL.SETFILTER(POL."Prod. Order No.",codestext);
                  POL.SETRANGE(POL."Production BOM No.",ProdBOMNo);
                  IF POL.FINDSET THEN
                  REPEAT
                    setcount:=setcount+POL.Quantity;
                  UNTIL POL.NEXT=0;
                  HeaderDesc:=HeaderDesc+'-'+FORMAT(setcount);
                  PrevProdBOMNo:=ProdBOMNo;
                  //PrevPostingDate:=PostingDate;
                  PrevIssdDate:=IssdDate;
                  IF ProdBOMNo = '' THEN
                    CurrReport.SHOWOUTPUT(FALSE);
                END
                ELSE   //For picked field checking
                BEGIN
                  "Posted Material Issues Line"."Material Picked":=TRUE;
                  "Posted Material Issues Line".MODIFY;
                END;
            end;

            trigger OnPostDataItem();
            begin
                //MESSAGE(FORMAT("Posted Material Issues Line".COUNT));
            end;

            trigger OnPreDataItem();
            begin
                CurrtDateTime:=CURRENTDATETIME();
                EVALUATE(MatReqDateFilter,"Posted Material Issues Line".GETFILTER("Posted Material Issues Line"."Material Requisition Date"));
                IF FORMAT(MatReqDateFilter) = '' THEN
                  ERROR('Please enter Material Requisition Date!');
                EVALUATE(MatReqDt,"Posted Material Issues Line".GETFILTER("Posted Material Issues Line"."Material Requisition Date"));
                IF MatReqDt > TODAY THEN
                BEGIN
                  //ERROR('Material Req Day is > today');
                  GenLedgrStup.RESET;
                  GenLedgrStup.GET();
                  IF GenLedgrStup."Day Wise Issues Status" = GenLedgrStup."Day Wise Issues Status"::Applied THEN
                    ERROR('You have already applied for Authorization!')
                  ELSE IF GenLedgrStup."Day Wise Issues Status" = GenLedgrStup."Day Wise Issues Status"::Rejected THEN
                    ERROR('Your Request is Rejected!')
                  ELSE IF GenLedgrStup."Day Wise Issues Status" = GenLedgrStup."Day Wise Issues Status"::Nothing THEN
                  BEGIN
                    IF CONFIRM('Send For Authorization ?') = FALSE THEN
                    BEGIN
                      CurrReport.BREAK;
                      CurrReport.SHOWOUTPUT(FALSE);
                    END
                    ELSE
                    BEGIN
                      IF (input = '') OR (input = ' ') THEN
                        ERROR('Please enter Comments!');
                      SentForAuthorizarion;
                      CurrReport.BREAK;
                      CurrReport.SHOWOUTPUT(FALSE);
                    END;
                  END;
                END;
            end;
        }
        dataitem("Material Issues Line";"Material Issues Line")
        {
            DataItemTableView = SORTING(Transfer-from Code,Transfer-to Code,Material Requisition Date,Production BOM No.,Dept,Item No.) ORDER(Ascending) WHERE(Transfer-from Code=FILTER(STR|PROD),Transfer-to Code=CONST(PROD),Outstanding Qty. (Base)=FILTER(>0));
            column(MItem_No;"Material Issues Line"."Item No.")
            {
            }
            column(MQty;"Material Issues Line".Quantity)
            {
            }
            column(MMRD;"Material Issues Line"."Material Requisition Date")
            {
            }
            column(MDept;"Material Issues Line".Dept)
            {
            }
            column(MProdOrderNo;"Material Issues Line"."Prod. Order No.")
            {
            }
            column(MProdOrderLineNo;"Material Issues Line"."Prod. Order Line No.")
            {
            }
            column(MOutQty;"Material Issues Line"."Outstanding Qty. (Base)")
            {
            }
            column(MMechOrWring;MMechOrWring)
            {
            }
            column(MHeaderDesc;MHeaderDesc)
            {
            }
            column(MProdBOMNo;MProdBOMNo)
            {
            }
            column(MProdBOMDesc;MProdBOMDesc)
            {
            }
            column(MItmDesc2;ItmDesc2)
            {
            }
            column(MItmDesc;"Material Issues Line".Description)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF Picked = TRUE THEN
                  CurrReport.BREAK;
                MProdBOMNo:='';
                MProdBOMDesc:='';
                ItmDesc2:='';
                Item.RESET;
                Item.SETRANGE(Item."No.","Material Issues Line"."Item No.");
                IF Item.FINDFIRST THEN
                BEGIN
                  ItmDesc2:=Item."Description 2";
                END;
                ProdOrderLine.RESET;
                ProdOrderLine.SETCURRENTKEY("Prod. Order No.","Line No.",Status);
                ProdOrderLine.SETRANGE(ProdOrderLine."Prod. Order No.","Material Issues Line"."Prod. Order No.");
                ProdOrderLine.SETRANGE(ProdOrderLine."Line No.","Material Issues Line"."Prod. Order Line No.");
                IF ProdOrderLine.FINDFIRST THEN
                BEGIN
                  MProdBOMNo:=ProdOrderLine."Item No.";
                  MProdBOMDesc:=ProdOrderLine.Description;
                END;
                MHeaderDesc:='';
                MMechOrWring:='';
                "Mech&Wring".RESET;
                "Mech&Wring".SETCURRENTKEY("Item No.","Lot No.","Production Order No.");
                "Mech&Wring".SETRANGE("Mech&Wring"."Item No.","Material Issues Line"."Item No.");
                "Mech&Wring".SETRANGE("Mech&Wring"."Request No.","Material Issues Line"."Document No.");
                IF "Mech&Wring".FINDFIRST THEN
                  MMechOrWring:="Mech&Wring"."BOM Type";
                IF MMechOrWring='MECHANICAL' THEN
                  MHeaderDesc:='Mechanical Sets for '+ProdBOMDesc
                ELSE IF MMechOrWring='WIRING' THEN
                  MHeaderDesc:='Wiring Sets for '+ProdBOMDesc
                ELSE
                  MHeaderDesc:='Material Sets for '+ProdBOMDesc;
            end;

            trigger OnPostDataItem();
            begin
                //MESSAGE(FORMAT("Material Issues Line".COUNT));
            end;

            trigger OnPreDataItem();
            begin
                IF Picked = TRUE THEN
                  CurrReport.BREAK;
                "Material Issues Line".SETFILTER("Material Issues Line"."Material Requisition Date","Posted Material Issues Line".GETFILTER("Posted Material Issues Line"."Material Requisition Date"));
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Control1102152000)
                {
                    ShowCaption = false;
                    field(Picked;Picked)
                    {
                    }
                    field(EnterComments;input)
                    {
                        Caption = 'Enter Comments';
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
        IF MatReqDt > TODAY THEN
        BEGIN
          GenLedgrStup.RESET;
          GenLedgrStup.GET();
          IF GenLedgrStup."Day Wise Issues Status" = GenLedgrStup."Day Wise Issues Status"::Accepted THEN
          BEGIN
            GenLedgrStup."Day Wise Issues Status" := GenLedgrStup."Day Wise Issues Status"::Nothing;
            GenLedgrStup.MODIFY;
          END;
        END;
    end;

    var
        CurrtDateTime : DateTime;
        Item : Record Item;
        BinAddrs : Code[15];
        sampledate : Date;
        ProdOrderLine : Record "Prod. Order Line";
        ProdBOMNo : Text;
        ILE : Record "Item Ledger Entry";
        "Mech&Wring" : Record "Mech & Wirning Items";
        MechOrWring : Code[10];
        ProdBOMDesc : Text;
        HeaderDesc : Text;
        Req_By : Code[100];
        PMIH : Record "Posted Material Issues Header";
        IssuedDateTime : DateTime;
        ReleasedDateTime : Date;
        ProjCodes : Text;
        PMINos : Text;
        PMIL : Record "Posted Material Issues Line";
        PrevProdBOMNo : Code[25];
        ProdOrderComp : Record "Prod. Order Component";
        ProdOrderNos : Text;
        PrevProdOrderNo : Text;
        Series : Text;
        tempseries : Text;
        MIL : Record "Material Issues Line";
        MMechOrWring : Code[10];
        MHeaderDesc : Text;
        MProdBOMNo : Code[30];
        MProdBOMDesc : Text;
        ItmDesc2 : Text;
        ShortageCount : Integer;
        TempBOM : Code[25];
        TempPRevItem : Code[30];
        Codes : array [1000] of Code[30];
        i : Integer;
        count1 : Integer;
        j : Integer;
        c2 : Integer;
        templen : Integer;
        Picked : Boolean;
        RequestedByCaption : Label '"Requested By: "';
        ProdCodesCaption : Label '"Prod Codes: "';
        Tran4CodeCaption : Label '"Transfer from Code: "';
        Trans2CodeCaption : Label '"Transfer To Code: "';
        CompPCBCaption : Label '"Compound PCB: "';
        ReqDateCaption : Label '"Requested date: "';
        IssuedDateCaption : Label 'Issued Date Time:';
        CompanyNameCaption : Label 'Efftronics Systems Pvt Ltd.';
        MatReqDateCaption : Label 'Material Required Date:';
        codestext : Text;
        POL : Record "Prod. Order Line";
        setcount : Integer;
        PostingDate : Date;
        PrevPostingDate : Date;
        IssdDate : Date;
        PrevIssdDate : Date;
        ItmLedgrEntr : Record "Item Ledger Entry";
        PostedMatIssLine : Record "Posted Material Issues Line";
        Codes1 : array [1000] of Code[30];
        ProdOrderNos1 : Text;
        PrevILEItm : Text;
        PrevLot : Text;
        codestext1 : Text;
        MatReqDt : Date;
        GenLedgrStup : Record "General Ledger Setup";
        ret : Integer;
        input : Text;
        MatReqDateFilter : Date;

    [LineStart(22041)]
    procedure SentForAuthorizarion();
    var
        Subject : Text;
        Mail_Body : Text;
        Mail_Send_To : Text;
        Mail_To : Text;
        sender : Text;
        Mail_Body1 : Text;
        SMTP_MAIL : Codeunit "SMTP Mail";
        SQLQuery : Text[1000];
        RowCount : Integer;
        SQLConnection : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000514-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Connection";
        RecordSet : Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000535-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Recordset";
        ConnectionOpen : Integer;
        Success : Boolean;
        StatusCodes : array [4] of Integer;
        ReplyTo : Text[50];
        UserSetUp : Record "User Setup";
        RequestedMailId : Text[30];
        AuthUserID : Code[35];
        CurrUserId : Code[10];
    begin
        IF ISCLEAR(SQLConnection) THEN
          CREATE(SQLConnection,FALSE,TRUE);

        IF ISCLEAR(RecordSet) THEN
          CREATE(RecordSet,FALSE,TRUE);

        RowCount:=0;
        IF ConnectionOpen <> 1 THEN
        BEGIN
          SQLConnection.ConnectionString:='DSN=tams;UID=tams;PASSWORD=firewall123;SERVER=oracle_80;';
          SQLConnection.Open;
          SQLConnection.BeginTrans;
          ConnectionOpen:=1;
        END;
        SQLQuery:='select ID_NO, STATUS_CODE, SWIPETIME from LASTSWIPESTATUS where ID_NO  IN (''85MD001'','+
                  '''09RD001'',''10RD002'',''06TE028'') order by 1';
        MESSAGE(SQLQuery);
        RecordSet:= SQLConnection.Execute(SQLQuery,RowCount);
        IF NOT( (RecordSet.BOF) OR (RecordSet.EOF) ) THEN
           RecordSet.MoveFirst;
        RowCount:=0;
        WHILE NOT RecordSet.EOF DO
        BEGIN
          StatusCodes[RowCount+1]:= RecordSet.Fields.Item('STATUS_CODE').Value;
          RowCount:=RowCount+1;
          RecordSet.MoveNext;
        END;
        // Stutus Codes 0-IN,2-OD-IN,12-Lunch-IN,1-Out, 3-OD-Out, 13-Lunch-Out, 15-Special OD-Out
        IF  StatusCodes[4] IN [0,2,12] THEN       // MD Sir Status
        BEGIN
          Mail_To:='ceo@efftronics.com';
          AuthUserID:='85MD001';
        END
        ELSE IF StatusCodes[2] IN [0,2,12] THEN   // Anvesh Sir Status
        BEGIN
          Mail_To:='anvesh@efftronics.com';
          AuthUserID:='09RD001';
        END
        ELSE IF StatusCodes[3] IN [0,2,12] THEN   // Spurthi mam Status
        BEGIN
          Mail_To:='spurthi@efftronics.com';
          AuthUserID:='10RD002';
        END
        ELSE IF StatusCodes[1] IN [0,2,12] THEN   // Anil Sir Status
        BEGIN
          Mail_To:='anilkumar@efftronics.com';
          AuthUserID:='06TE028';
        END;

        IF  Mail_To = '' THEN
        BEGIN
          Mail_To:='erp@efftronics.com';
          AuthUserID:='06TE028';
          sender:=Mail_To;
        END
        ELSE
        BEGIN
          sender:=Mail_To;
          Mail_To+=',erp@efftronics.com';
        END;
        UserSetUp.RESET;
        UserSetUp.SETRANGE(UserSetUp."User ID",USERID);
        IF UserSetUp.FINDFIRST THEN
        BEGIN
          RequestedMailId:=UserSetUp."E-Mail";
          CurrUserId:=UserSetUp."Current UserId";
        END;
        IF RequestedMailId = '' THEN
          RequestedMailId:='Store@efftronics.com';
        MESSAGE('Mail To: '+Mail_To+', sender: '+sender);
        Subject:='ERP - Approval for Day Wise Material Issues on - '+FORMAT(MatReqDateFilter,0,'<Day,2>-<Month Text,3>-<Year>');
        sender:='erp@efftronics.com';
        Mail_To:='pranavi@efftronics.com';
        ReplyTo:='dmadhavi@efftronics.com,Store@efftronics.com';
        ReplyTo:='pranavi@efftronics.com';
        Mail_Send_To:='pranavi@efftronics.com';
        Mail_Body:='<html><body><br>';//<b>Reason: </b>'+input;
        Mail_Body+='<Body><form><br><table style="WIDTH:500px; HEIGHT: 20px;" border="1" align="center">';
        Mail_Body+='<Tr><Td>Requested User: </Td><Td>'+COPYSTR(USERID,12,STRLEN(USERID)-11)+'</Td></Tr>';
        Mail_Body+='<Tr><Td>Material Required Date: </Td><Td>'+FORMAT(MatReqDateFilter,0,'<Day,2>-<Month Text,3>-<Year>')+'</Td></Tr>';
        Mail_Body+='<Tr><Td>Reason: </Td><Td>'+input+'</Td></Tr>';
        Mail_Body+='<Tr> <Td bgcolor="green" align="center" ><b><a href="http://192.168.0.155:5556/erp_reports/Day_Wise_Material_Issues_Authorization.aspx?reason='+input;
        Mail_Body+='&accept=1';                       // accept
        Mail_Body+='&mgr='+Mail_To;                   // manager
        Mail_Body+='&sender='+sender;                 // sender mail
        Mail_Body+='&replyTo='+ReplyTo;               // reply mail
        Mail_Body+='&reqstdMailID='+RequestedMailId;  // Requested mail id
        Mail_Body+='&reqstdUser='+CurrUserId;             // Requested User Id
                                                      // Material Req Date
        Mail_Body+='&MatReqDate='+FORMAT(MatReqDateFilter);
        Mail_Body+='&AuthUser='+AuthUserID;                     // Authorized User ID
        Mail_Body+='"target="_blank"><font face="arial" color="#ffffff">ACCEPT</font></a></b></td>';
        Mail_Body+=' <Td bgcolor="red" align="center" ><b><a href="http://192.168.0.155:5556/erp_reports/Day_Wise_Material_Issues_Authorization.aspx?reason='+input;
        Mail_Body+='&accept=0';                       // reject
        Mail_Body+='&mgr='+Mail_To;                   // manager
        Mail_Body+='&sender='+sender;                 // sender mail
        Mail_Body+='&replyTo='+ReplyTo;               // reply mail
        Mail_Body+='&reqstdMailID='+RequestedMailId;  // Requested mail id
        Mail_Body+='&reqstdUser='+CurrUserId;             // Requested User Id
                                                      // Material Req Date
        Mail_Body+='&MatReqDate='+FORMAT(MatReqDateFilter);
        Mail_Body+='&AuthUser='+AuthUserID;                     // Authorized User ID
        Mail_Body+='"target="_blank"><font face="arial" color="#ffffff">REJECT</font></a></b></td></tr></table>';
        SMTP_MAIL.CreateMessage('ERP','erp@efftronics.com',Mail_To,Subject,Mail_Body+Mail_Body1,TRUE);
        SMTP_MAIL.Send;
        MESSAGE('Mail has been Sent to '+Mail_To);
        SQLConnection.CommitTrans;
        RecordSet.Close;
        SQLConnection.Close;
        Success:=TRUE;
        ConnectionOpen:=0;
        GenLedgrStup.RESET;
        GenLedgrStup.GET();
        IF GenLedgrStup."Day Wise Issues Status" = GenLedgrStup."Day Wise Issues Status"::Nothing THEN
        BEGIN
          GenLedgrStup."Day Wise Issues Status" := GenLedgrStup."Day Wise Issues Status"::Applied;
          GenLedgrStup.MODIFY;
        END;
    end;
}

