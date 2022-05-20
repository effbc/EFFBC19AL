page 99000786 "Production BOM"
{
    // version NAVW17.00,NAVIN7.00

    CaptionML = ENU='Production BOM',
                ENN='Production BOM';
    DeleteAllowed = false;
    PageType = ListPlus;
    SourceTable = "Production BOM Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                CaptionML = ENU='General',
                            ENN='General';
                field("No.";"No.")
                {

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                          CurrPage.UPDATE;
                    end;
                }
                field(Description;Description)
                {
                }
                field("Description 2";"Description 2")
                {
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                }
                field(Status;Status)
                {

                    trigger OnValidate();
                    begin
                          IF (COPYSTR("No.",1,8)<>'ECMPBPCB') AND (Status=Status::Certified) AND NOT (USERID IN ['EFFTRONICS\JHANSI','EFFTRONICS\ANILKUMAR','EFFTRONICS\VISHNUPRIYA']) THEN
                            ERROR('You dont have permissions to Certify the BOM');

                          IF (COPYSTR("No.",1,8)='ECMPBPCB') AND NOT (USERID IN ['EFFTRONICS\JHANSI','EFFTRONICS\RSILPARANI','EFFTRONICS\RATNARAVALI','EFFTRONICS\UBEDULLA','EFFTRONICS\ANILKUMAR','EFFTRONICS\VISHNUPRIYA']) THEN
                         ERROR('You dont have permissions to Certify the MASTER BOM');

                        //Added by Vishnu Priya to restrict the modifications to certified BOMs on 04-06-2020
                          IF ((Status= Rec.Status::"Under Development") OR (Status= Rec.Status::New)) AND (xRec.Status = xRec.Status::Certified) AND NOT (USERID IN ['EFFTRONICS\VANIDEVI','EFFTRONICS\VISHNUPRIYA'])THEN
                            ERROR('You dont have permissions to change the Certified BOM');
                    end;
                }
                field("Total Soldering Points SMD";"Total Soldering Points SMD")
                {
                    Editable = false;
                }
                field("Total Soldering Points DIP";"Total Soldering Points DIP")
                {
                    Editable = false;
                }
                field("Total Soldering Points";"Total Soldering Points")
                {
                    Editable = false;
                }
                field(vo;"BOM Cost")
                {
                    Editable = false;
                }
                field("Stranded BOM";"Stranded BOM")
                {
                    Caption = 'Standard BOM';
                }
                field("Search Name";"Search Name")
                {
                }
                field("Version Nos.";"Version Nos.")
                {
                }
                field(ActiveVersionCode;ActiveVersionCode)
                {
                    CaptionML = ENU='Active Version',
                                ENN='Active Version';
                    Editable = false;

                    trigger OnLookup(Text : Text) : Boolean;
                    var
                        ProdBOMVersion : Record "Production BOM Version";
                    begin
                        ProdBOMVersion.RESET;
                        ProdBOMVersion.SETRANGE("Production BOM No.","No.");
                        //ProdBOMVersion.SETRANGE("Version Code",ActiveVersionCode);
                        ProdBOMVersion.SETRANGE(ProdBOMVersion.Status,Status::Certified);
                        IF ProdBOMVersion.FINDFIRST THEN
                        BEGIN
                          PAGE.RUNMODAL(PAGE::"Production BOM Version",ProdBOMVersion);
                          ActiveVersionCode := VersionMgt.GetBOMVersion("No.",WORKDATE,TRUE);
                        END
                        ELSE
                        BEGIN
                          ProdBOMVersion.RESET;
                          ProdBOMVersion.SETRANGE("Production BOM No.","No.");
                          IF ActiveVersionCode<>'' THEN
                            ProdBOMVersion.SETRANGE("Version Code",ActiveVersionCode);
                          //ProdBOMVersion.SETRANGE(ProdBOMVersion.Status,Status::Certified);
                          PAGE.RUNMODAL(PAGE::"Production BOM Version",ProdBOMVersion);
                          ActiveVersionCode := VersionMgt.GetBOMVersion("No.",WORKDATE,TRUE);
                        END;
                    end;
                }
                field("Last Date Modified";"Last Date Modified")
                {
                }
                field("Bench Mark Time(In Hours)";"Bench Mark Time(In Hours)")
                {
                }
                field("Total No. of Fixing Holes";"Total No. of Fixing Holes")
                {
                }
                field("User Id";"User Id")
                {
                    Editable = false;
                }
                field("BOM Type";"BOM Type")
                {
                }
                field("Modified User ID";"Modified User ID")
                {
                    Editable = false;
                }
                field("Creation Date";"Creation Date")
                {
                }
                field("Total Qtyper SMD";"Total Qtyper SMD")
                {
                    Caption = 'Total SMD Qty per';
                }
                field("Total Qtyper DIP";"Total Qtyper DIP")
                {
                    Caption = 'Total DIP Qty per';
                }
                field("Total Qtyper";"Total Qtyper")
                {
                    Caption = 'Total Qty per';
                }
                field("Update in PRM";"Update in PRM")
                {
                    Editable = false;
                }
                field(Certify;Certify)
                {
                    Editable = EDIT;
                }
                field("BOM Running Status";"BOM Running Status")
                {
                }
                field("Inherited From";"Inherited From")
                {
                }
                field(Configuration;Configuration)
                {
                }
                field("Remarks/Reason";"Remarks/Reason")
                {
                }
                field("BOM Category";"BOM Category")
                {
                }
            }
            part(ProdBOMLine;"Production BOM Lines")
            {
                SubPageLink = Production BOM No.=FIELD(No.),Version Code=CONST();
                SubPageView = SORTING(Production BOM No.,Version Code,Line No.);
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207;Links)
            {
                Visible = false;
            }
            systempart(Control1905767507;Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Prod. BOM")
            {
                CaptionML = ENU='&Prod. BOM',
                            ENN='&Prod. BOM';
                Image = BOM;
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                ENN='Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Manufacturing Comment Sheet";
                    RunPageLink = Table Name=CONST(Production BOM Header),No.=FIELD(No.);
                }
                action(Versions)
                {
                    CaptionML = ENU='Versions',
                                ENN='Versions';
                    Image = BOMVersions;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Prod. BOM Version List";
                    RunPageLink = Production BOM No.=FIELD(No.);
                }
                action("Ma&trix per Version")
                {
                    CaptionML = ENU='Ma&trix per Version',
                                ENN='Ma&trix per Version';
                    Image = ProdBOMMatrixPerVersion;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        BOMMatrixPage : Page "Prod. BOM Matrix per Version";
                    begin
                        BOMMatrixPage.Set(Rec);

                        BOMMatrixPage.RUNMODAL;
                        CLEAR(BOMMatrixPage);
                    end;
                }
                action("Where-used")
                {
                    CaptionML = ENU='Where-used',
                                ENN='Where-used';
                    Image = "Where-Used";
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        ProdBOMWhereUsed.SetProdBOM(Rec,WORKDATE);
                        ProdBOMWhereUsed.RUNMODAL;
                        CLEAR(ProdBOMWhereUsed);
                    end;
                }
                action(Location)
                {
                    CaptionML = ENU='Location',
                                ENN='Location';
                    Image = Warehouse;
                    RunObject = Page "BOM Locations";
                    RunPageLink = Production BOM No.=FIELD(No.);
                }
                action(Boughtout)
                {
                    Caption = 'Boughtout';

                    trigger OnAction();
                    begin
                        Bout.SETRANGE(Bout.Code,"No.");
                        PAGE.RUN(7306,Bout);
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            ENN='F&unctions';
                Image = "Action";
                action("Copy &BOM")
                {
                    CaptionML = ENU='Copy &BOM',
                                ENN='Copy &BOM';
                    Ellipsis = true;
                    Image = CopyBOM;

                    trigger OnAction();
                    begin
                        TESTFIELD("No.");
                        IF PAGE.RUNMODAL(0,ProdBOMHeader) = ACTION::LookupOK THEN
                          ProductionBOMCopy.CopyBOM(ProdBOMHeader."No.",'',Rec,'');
                    end;
                }
                action("BOM History")
                {
                    CaptionML = ENU='BOM History',
                                ENN='BOM History';
                    Image = BOMVersions;

                    trigger OnAction();
                    var
                        BOMChangeLog : Record "BOM Change Log";
                    begin
                        BOMChangeLog.SETRANGE("BOM No.","No.");
                        REPORT.RUNMODAL(REPORT::"BOM History",TRUE,FALSE,BOMChangeLog);
                    end;
                }
                separator(Action1000000004)
                {
                }
                action("Import PAD Software Data")
                {
                    Caption = 'Import PAD Software Data';

                    trigger OnAction();
                    begin
                        CLEAR(PADSoftware);
                        PordBOMLineRec.SETRANGE("Production BOM No.","No.");
                        PADSoftware.Initilize("No.");
                        PADSoftware.RUN;
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                action("Calculate Soldering Points")
                {
                    Caption = 'Calculate Soldering Points';

                    trigger OnAction();
                    begin
                        IF Status<>Status::Certified THEN
                        BEGIN
                        StatusCheck3_Solder("No.");
                        SolderingPointsUpdate("No.");
                        END
                        ELSE
                        ERROR('Status must be released to modify');
                    end;
                }
                action("BOM Authorization")
                {
                    Caption = 'BOM Authorization';

                    trigger OnAction();
                    var
                        BOMLine : Record "Production BOM Line";
                        PrevItem : Text[30];
                        PrevPosition : Text;
                        PrevDescription : Text;
                    begin
                        PrevItem := '';
                        PrevDescription := '';
                        PrevPosition := '';
                        BOMLine.RESET;
                        BOMLine.SETCURRENTKEY(Type,"No.");
                        BOMLine.SETRANGE("Version Code",'');
                        BOMLine.SETRANGE("Production BOM No.","No.");
                        IF BOMLine.FINDSET THEN
                        REPEAT
                          IF (PrevItem = BOMLine."No.") AND (PrevDescription = BOMLine.Description) AND (PrevPosition = BOMLine.Position) THEN
                             ERROR('BOM having Duplicate Item :: ', BOMLine."No.");
                           PrevItem := BOMLine."No.";
                        UNTIL BOMLine.NEXT = 0;
                        IF NOT(Rec."BOM Category"  IN [Rec."BOM Category"::Final,Rec."BOM Category"::Tentative]) THEN
                          ERROR('Please Specify BOM Category Tentative or Final');
                        IF Rec."Remarks/Reason" = '' THEN
                          ERROR('Please fill the Reason/Remarks field with proper Reason for the BOM Approval. This will be carried to the approval mails.');
                        
                        
                        /*ProdBOMHeader.RESET;
                        ProdBOMHeader.SETFILTER(ProdBOMHeader."No.","No.");
                        IF ProdBOMHeader.FINDSET THEN
                          REPORT.RUN(50025,TRUE,FALSE,ProdBOMHeader);*/ // commented by sujani on 26-JUL-19 for adding BOM Type restriction
                        sucs := FALSE;
                        ProdBOMHeader.RESET;
                        ProdBOMHeader.SETFILTER(ProdBOMHeader."No.","No.");
                        IF ProdBOMHeader.FINDSET THEN
                          ITEM.RESET;
                          ITEM.SETCURRENTKEY("No.");
                          ITEM.SETFILTER(ITEM."No.",ProdBOMHeader."No.");
                          IF ITEM.FINDSET THEN
                         BEGIN
                              IF ITEM."Product Group Code" IN  ['FPRODUCT'] THEN  //   ,'CPCB'  commented by vishnu on 10-08-2019
                                BEGIN
                                  BOMLine.RESET;
                                  BOMLine.SETCURRENTKEY(Type,"No.");
                                  BOMLine.SETRANGE(BOMLine."Production BOM No.","No.");
                                    IF BOMLine.FINDSET THEN
                                     REPEAT
                                        BEGIN
                                        ITM2.RESET;
                                        ITM2.SETCURRENTKEY("No.");
                                        ITM2.SETFILTER(ITM2."No.",BOMLine."No.");
                                        IF ITM2.FINDSET THEN
                                          BEGIN
                                            IF NOT(ITM2."Product Group Code" IN ['FPRODUCT','CPCB']) THEN // for individual items
                                              BEGIN
                                              IF NOT(BOMLine."BOM Type" IN [BOMLine."BOM Type"::Mechanical,BOMLine."BOM Type"::Packing,BOMLine."BOM Type"::Testing,BOMLine."BOM Type"::Wiring]) THEN
                                                 ERROR('Specify BOM Type for individual BOM   ' +BOMLine."No.")
                                               ELSE
                                               sucs := TRUE;
                        
                                               END
                                            ELSE
                                            /* BEGIN
                                              IF NOT(BOMLine."BOM Type" IN [BOMLine."BOM Type"::Mechanical,BOMLine."BOM Type"::Packing,BOMLine."BOM Type"::Testing,BOMLine."BOM Type"::Wiring]) THEN
                                                 ERROR('Specify BOM Type for Production BOM   ' +BOMLine."No.")
                                               ELSE
                                               sucs := FALSE;*/
                                                  sucs := TRUE;
                                                 //REPORT.RUN(50025,TRUE,FALSE,ProdBOMHeader);
                                              // END;
                                          END // itm2 ends
                                        ELSE
                                          BEGIN
                                              IF NOT(BOMLine."BOM Type" IN [BOMLine."BOM Type"::Mechanical,BOMLine."BOM Type"::Packing,BOMLine."BOM Type"::Testing,BOMLine."BOM Type"::Wiring]) THEN // for mechanical ,wiring BOM
                                                ERROR('Specify BOM Type for production BOM  ' +BOMLine."No.")
                                              ELSE
                                              sucs := FALSE;
                                                sucs := TRUE;
                                               // REPORT.RUN(50025,TRUE,FALSE,ProdBOMHeader);
                                          END;
                                        END;
                                       UNTIL BOMLine.NEXT = 0;
                        
                                  END  //mark --  to else
                                  ELSE IF ITEM."Product Group Code" IN  ['CPCB'] THEN  sucs := TRUE;  // else case was added by Vishnu Priya on 10-08-2019
                                  IF (sucs) THEN
                                        REPORT.RUN(50025,TRUE,FALSE,ProdBOMHeader);
                              END
                            ELSE //ITEM NOT FOUND
                            BEGIN
                              IF NOT(ProdBOMHeader."BOM Type" IN [ProdBOMHeader."BOM Type"::Mechanical,ProdBOMHeader."BOM Type"::Wiring]) THEN
                                ERROR('Specify the BOM Type in Header')
                                ELSE
                                  BEGIN
                                      BOMLine.RESET;
                                      BOMLine.SETCURRENTKEY(Type,"No.");
                                      BOMLine.SETRANGE(BOMLine."Production BOM No.","No.");
                                      IF BOMLine.FINDSET THEN
                                      REPEAT
                                        IF NOT(BOMLine."BOM Type"  IN [BOMLine."BOM Type"::Mechanical,BOMLine."BOM Type"::Packing,BOMLine."BOM Type"::Testing,BOMLine."BOM Type"::Wiring]) THEN
                                          ERROR('Specify the BOM Type in Line for Item :' +BOMLine."No." )
                                         ELSE
                                            sucs := TRUE;
                                      UNTIL BOMLine.NEXT = 0;
                                      IF (sucs) THEN
                                        REPORT.RUN(50025,TRUE,FALSE,ProdBOMHeader);
                        
                        
                                  END;
                            END;
                        
                        
                        
                        /*PrevItem := '';
                        PrevDescription := '';
                        PrevPosition := '';
                        BOMLine.RESET;
                        BOMLine.SETCURRENTKEY(Type,"No.");
                        BOMLine.SETRANGE("Version Code",'');
                        BOMLine.SETRANGE("Production BOM No.","No.");
                        IF BOMLine.FINDSET THEN
                        REPEAT
                          IF (PrevItem = BOMLine."No.") AND (PrevDescription = BOMLine.Description) AND (PrevPosition = BOMLine.Position) THEN
                             ERROR('BOM having Duplicate Item :: ', BOMLine."No.");
                          PrevItem := BOMLine."No.";
                        UNTIL BOMLine.NEXT = 0;
                        ProdBOMHeader.RESET;
                        ProdBOMHeader.SETFILTER(ProdBOMHeader."No.","No.");
                        IF ProdBOMHeader.FINDSET THEN
                          REPORT.RUN(50025,TRUE,FALSE,ProdBOMHeader);*/ // Old code before adding the BOM Type restriction

                    end;
                }
            }
            action("Forward to PRM")
            {
                Caption = 'Forward to PRM';

                trigger OnAction();
                var
                    PRMIntegration : Codeunit SQLIntegration;
                    PBH : Record "Production BOM Header";
                begin
                        /*
                          PBH.RESET;
                        PBH.SETFILTER(PBH.Status,'%1',PBH.Status::Certified);
                        IF PBH.FINDFIRST THEN
                        REPEAT
                          StatusCheck3_PRM(PBH."No.");//"No."
                          PRMIntegration.ProdBOMHeadertoPRM(PBH);//Rec
                          PBH."Update in PRM":=TRUE;
                          PBH.MODIFY;
                        UNTIL PBH.NEXT=0;
                    MESSAGE('cOMPLETED');
                    */
                    
                          StatusCheck3_PRM("No.");//"No."
                          PRMIntegration.ProdBOMHeadertoPRM(Rec);//Rec
                          "Update in PRM":=TRUE;
                          MODIFY;

                end;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        ActiveVersionCode := VersionMgt.GetBOMVersion("No.",WORKDATE,TRUE);
        IF ITEM.GET("No.") THEN
          CurrPage.ProdBOMLine.PAGE.Showform(ITEM."Product Group Code"='FPRODUCT');
          "Total Qtyper SMD":= 0;
          "Total Qtyper DIP":= 0;
          "Total Qtyper":= 0;

          PordBOMLineRec.RESET;
          PordBOMLineRec.SETFILTER(PordBOMLineRec."Production BOM No.","No.");
          PordBOMLineRec.SETRANGE(PordBOMLineRec."Version Code",'');
          IF PordBOMLineRec.FIND('-') THEN
          REPEAT
            IF PordBOMLineRec."Type of Solder"=1 THEN
               "Total Qtyper SMD" :="Total Qtyper SMD"+ROUND(PordBOMLineRec."Quantity per"+0.49,1)
            ELSE IF PordBOMLineRec."Type of Solder"=2 THEN
               "Total Qtyper DIP" :="Total Qtyper DIP"+ROUND(PordBOMLineRec."Quantity per"+0.49,1);
          UNTIL PordBOMLineRec.NEXT=0;
               "Total Qtyper":="Total Qtyper DIP"+"Total Qtyper SMD";
        NoOnFormat;
        DescriptionOnFormat;

        // added by sujani for itms modified data reflection in bom lines
          PordBOMLineRec.RESET;
          PordBOMLineRec.SETFILTER(PordBOMLineRec."Production BOM No.","No.");
          IF PordBOMLineRec.FIND('-') THEN
          REPEAT
            ITEM.RESET;
            ITEM.SETRANGE("No.",PordBOMLineRec."No.");
            IF ITEM.FINDFIRST THEN
              BEGIN
              PordBOMLineRec."Part number" :=  ITEM."Part Number";
              PordBOMLineRec.Package := ITEM.Package;
              PordBOMLineRec.Make := ITEM.Make;
              PordBOMLineRec."Unit of Measure Code" := ITEM."Base Unit of Measure";
              PordBOMLineRec.Description := ITEM.Description;
              PordBOMLineRec."Description 2" := ITEM."Description 2";
              PordBOMLineRec."Storage Temperature" := ITEM."Storage Temperature";
              PordBOMLineRec."Scrap %" := ITEM."Scrap %";
              PordBOMLineRec."No. of Fixing Holes" := ITEM."No.of Fixing Holes";
              PordBOMLineRec."No. of Opportunities" := ITEM."No. of Opportunities";
              PordBOMLineRec."No. of Soldering Points" := ITEM."No. of Soldering Points";
              PordBOMLineRec."No. of Pins" := ITEM."No. of Pins";

              END;
              PordBOMLineRec.MODIFY;

          UNTIL PordBOMLineRec.NEXT=0;
          COMMIT;
    end;

    trigger OnOpenPage();
    begin
        IF UPPERCASE(USERID) IN ['EFFTRONICS\SUJANI','EFFTRONICS\VIJAYA'] THEN
          edit:=TRUE
        ELSE
          edit:=FALSE;
        IF Status = Status::Certified  THEN
          BEGIN
          IF  USERID IN ['EFFTRONICS\ANANDA'] THEN
          edit := FALSE;
          END
    end;

    var
        ProdBOMHeader : Record "Production BOM Header";
        ProdBOMWhereUsed : Page "Prod. BOM Where-Used";
        ProductionBOMCopy : Codeunit "Production BOM-Copy";
        VersionMgt : Codeunit VersionManagement;
        ActiveVersionCode : Code[20];
        PordBOMLineRec : Record "Production BOM Line";
        PADSoftware : XMLport "PAD Software Data Integration1";
        Bout : Record "Bin Type";
        ITEM : Record Item;
        "Total Qtyper SMD" : Decimal;
        "Total Qtyper DIP" : Decimal;
        "Total Qtyper" : Decimal;
        edit : Boolean;
        ITM2 : Record Item;
        sucs : Boolean;

    [LineStart(23896)]
    local procedure DescriptionOnInputChange(var Text : Text[1024]);
    begin
         IF (USERID<>'EFFTRONICS\JHANSI') AND (USERID<>'EFFTRONICS\ANILKUMAR') AND (USERID<>'EFFTRONICS\RSILPARANI') AND (USERID<>'EFFTRONICS\RATNARAVALI')  THEN
         ERROR('YOU Have no rights to Change The Description');
    end;

    [LineStart(23900)]
    local procedure NoOnFormat();
    begin
          IF ITEM.GET("No.") THEN
          BEGIN
            IF ITEM."Product Group Code"='FPRODUCT' THEN
            BEGIN

            END ELSE IF ITEM."Product Group Code"='CPCB' THEN;
          END;
    end;

    [LineStart(23909)]
    local procedure DescriptionOnFormat();
    begin
          IF ITEM.GET("No.") THEN
          BEGIN
            IF ITEM."Product Group Code"='FPRODUCT' THEN
            BEGIN

            END ELSE IF ITEM."Product Group Code"='CPCB' THEN;
          END;
    end;
}

