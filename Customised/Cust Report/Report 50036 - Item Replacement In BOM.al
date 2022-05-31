report 50036 "Item Replacement In BOM"
{
    // version NAVW17.00

    CaptionML = ENU = 'Item Replacement In BOM',
                ENN = 'Exchange Production BOM Item';
    ProcessingOnly = true;

    dataset
    {
        dataitem("Integer"; "Integer")
        {
            DataItemTableView = SORTING(Number);
            MaxIteration = 1;

            trigger OnPostDataItem();
            var
                ProdBOMHeader2: Record "Production BOM Header";
                FirstVersion: Boolean;
            begin
                IF USERID IN ['EFFTRONICS\JHANSI', 'EFFTRONICS\VANIDEVI', 'EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\SUJANI', 'EFFTRONICS\ANILKUMAR'] THEN BEGIN
                    IF Operation = Operation::Replace THEN BEGIN
                        IF Type[1] = Type[1] ::" " THEN
                            ERROR('You must enter the replaced item type!');

                        IF No[1] = '' THEN
                            ERROR('You must enter the replaced item No.!');

                        IF Type[2] = Type[2] ::" " THEN
                            ERROR(Text001);

                        IF No[2] = '' THEN
                            ERROR(Text002);
                        PBL.RESET;
                        PBL.SETCURRENTKEY(Type, "No.");
                        PBL.SETFILTER(PBL.Type, '%1', Type[1]);
                        PBL.SETFILTER(PBL."No.", No[1]);
                        IF BOMNO <> '' THEN BEGIN
                            PBL.SETFILTER(PBL."Production BOM No.", BOMNO);
                        END;
                        POL.RESET;
                        POL.SETCURRENTKEY(Status, "Prod. Order No.", "Line No.");
                        POL.SETFILTER(POL.Status, '%1', POL.Status::Released);
                        POL.SETFILTER(POL."Item No.", No[1]);
                        IF CONFIRM('Item Present IN ' + FORMAT(PBL.COUNT) + ' BOMS AND.\Item is Present in ' + FORMAT(POL.COUNT) + ' RPOs.\Do You want to Replace?') THEN BEGIN
                            IF PBL.FINDSET THEN
                                REPEAT
                                    BOMTypeChecking := TRUE;
                                    IF BOMType <> '' THEN BEGIN
                                        IF Item.GET(PBL."Production BOM No.") THEN BEGIN
                                            IF Item."Item Sub Group Code" <> BOMType THEN BEGIN
                                                BOMTypeChecking := FALSE;
                                            END;
                                        END;
                                    END;
                                    testcert := FALSE;
                                    IF PBL."Version Code" = '' THEN   // Added by Pranavi on 25-Dec-2015
                                    BEGIN
                                        testcert := FALSE;
                                        PBH.RESET;
                                        PBH.SETCURRENTKEY("No.");
                                        PBH.SETFILTER(PBH."No.", PBL."Production BOM No.");
                                        IF (PBH.FINDFIRST) AND (BOMTypeChecking = TRUE) THEN BEGIN
                                            //added by sujani to give bom replacements based on bom group (master bom or production bom or pcb)
                                            testvar := COPYSTR(PBH."No.", 1, 8) <> 'ECMPBPCB';
                                            IF ((("Standard BOM" = TRUE) AND (PBH."Stranded BOM" = TRUE)) OR (("Master BOM" = TRUE) AND (COPYSTR(PBH."No.", 1, 8) = 'ECMPBPCB')) OR
                                             (("Production BOM" = TRUE) AND (PBH."Stranded BOM" = FALSE)) AND (testvar)) THEN BEGIN  /// start of the Begin
                                                IF PBH.Status = PBH.Status::Certified THEN BEGIN
                                                    testcert := TRUE;
                                                    PBH.VALIDATE(PBH.Status, PBH.Status::"Under Development");
                                                    PBH.MODIFY;
                                                END;
                                                PBH.LOCKTABLE;        //added by pranavi on 29-06-2015
                                                CLEAR(PBLTemp);
                                                PBLTemp.RESET;
                                                PBLTemp.SETRANGE(PBLTemp."Production BOM No.", PBL."Production BOM No.");
                                                PBLTemp.SETRANGE(PBLTemp."Version Code", PBL."Version Code");
                                                PBLTemp.SETRANGE(PBLTemp."Line No.", PBL."Line No.");
                                                PBLTemp.SETRANGE(PBLTemp.Type, PBL.Type);
                                                PBLTemp.SETRANGE(PBLTemp."No.", PBL."No.");
                                                IF PBLTemp.FINDFIRST THEN BEGIN
                                                    //PBLTemp:=PBL;
                                                    PBLTemp.VALIDATE(Type, Type[2]);
                                                    PBLTemp.VALIDATE("No.", No[2]);
                                                    PBLTemp.MODIFY;
                                                END;
                                                IF (Recertify = TRUE) AND (testcert = TRUE) THEN BEGIN
                                                    PBH.VALIDATE(PBH.Status, PBH.Status::Certified);
                                                END;
                                                PBH."Last Date Modified" := TODAY();
                                                PBH."Modified User ID" := USERID;
                                                PBH.MODIFY;
                                                IF (testvar) THEN
                                                    ReplacedCount := ReplacedCount + 1;
                                                //      END;
                                            END;
                                        END;
                                    END
                                    ELSE BEGIN    // Added by Pranavi on 25-Dec-2015
                                        testcert := FALSE;
                                        PBVersion.RESET;
                                        PBVersion.SETCURRENTKEY("Production BOM No.", "Version Code");
                                        PBVersion.SETRANGE(PBVersion."Production BOM No.", PBL."Production BOM No.");
                                        PBVersion.SETRANGE(PBVersion."Version Code", PBL."Version Code");
                                        IF (PBVersion.FINDFIRST) AND (BOMTypeChecking = TRUE) THEN BEGIN
                                            IF PBVersion.Status = PBVersion.Status::Certified THEN BEGIN
                                                testcert := TRUE;
                                                PBVersion.VALIDATE(PBVersion.Status, PBVersion.Status::"Under Development");
                                                PBVersion.MODIFY;
                                            END;
                                            PBVersion.LOCKTABLE;        //added by pranavi on 29-06-2015
                                            PBLTemp.RESET;
                                            PBLTemp.SETRANGE(PBLTemp."Production BOM No.", PBL."Production BOM No.");
                                            PBLTemp.SETRANGE(PBLTemp."Version Code", PBL."Version Code");
                                            PBLTemp.SETRANGE(PBLTemp."Line No.", PBL."Line No.");
                                            PBLTemp.SETRANGE(PBLTemp.Type, PBL.Type);
                                            PBLTemp.SETRANGE(PBLTemp."No.", PBL."No.");
                                            IF PBLTemp.FINDFIRST THEN BEGIN
                                                // PBLTemp:=PBL;
                                                PBLTemp.VALIDATE(Type, Type[2]);
                                                PBLTemp.VALIDATE("No.", No[2]);
                                                PBLTemp.MODIFY;
                                            END;
                                            IF (Recertify = TRUE) AND (testcert = TRUE) THEN BEGIN
                                                PBVersion.VALIDATE(PBVersion.Status, PBVersion.Status::Certified);
                                            END;
                                            PBVersion."Last Date Modified" := TODAY();
                                            PBVersion."Modified User ID" := USERID;
                                            PBVersion.MODIFY;
                                            ReplacedCount := ReplacedCount + 1;
                                        END;
                                    END;   // End by Pranavi on 25-Dec-2015
                                    c := c + 1;
                                //  MESSAGE(FORMAT(c));
                                UNTIL PBL.NEXT = 0;
                        END
                        ELSE
                            MESSAGE('You are not Confirmed to Replace Item!' + FORMAT(Type[1]) + ': ' + FORMAT(No[1]));
                    END
                    ELSE
                        IF Operation = Operation::Delete THEN BEGIN
                            // Added by Pranavi on 25-Dec-2015
                            IF Type[1] = Type[1] ::" " THEN
                                ERROR('Please enter the item details!');
                            IF FORMAT(No[1]) = '' THEN
                                ERROR('Please enter the item details!');
                            IF Type[2] <> Type[1] ::" " THEN
                                ERROR('When 2nd Item details Filled! You can not Delete the Item!');
                            IF (No[2] <> '') THEN
                                ERROR('When 2nd Item details Filled! You can not Delete the Item!');
                            PBL.RESET;
                            PBL.SETCURRENTKEY(Type, "No.");
                            PBL.SETFILTER(PBL.Type, '%1', Type[1]);
                            PBL.SETFILTER(PBL."No.", No[1]);
                            IF BOMNO <> '' THEN BEGIN
                                PBL.SETFILTER(PBL."Production BOM No.", BOMNO);
                            END;
                            POL.RESET;
                            POL.SETCURRENTKEY(Status, "Prod. Order No.", "Line No.");
                            POL.SETFILTER(POL.Status, '%1', POL.Status::Released);
                            POL.SETFILTER(POL."Item No.", No[1]);
                            IF CONFIRM('Item Present IN ' + FORMAT(PBL.COUNT) + ' BOMS AND.\Item is Present in ' + FORMAT(POL.COUNT) + ' RPOs.\Do You want to Delete?') THEN BEGIN
                                IF PBL.FINDSET THEN
                                    REPEAT
                                        BOMTypeChecking := TRUE;
                                        IF BOMType <> '' THEN BEGIN
                                            IF Item.GET(PBL."Production BOM No.") THEN BEGIN
                                                IF Item."Item Sub Group Code" <> BOMType THEN BEGIN
                                                    BOMTypeChecking := FALSE;
                                                END;
                                            END;
                                        END;
                                        testcert := FALSE;
                                        IF PBL."Version Code" = '' THEN BEGIN
                                            testcert := FALSE;
                                            PBH.RESET;
                                            PBH.SETCURRENTKEY("No.");
                                            PBH.SETFILTER(PBH."No.", PBL."Production BOM No.");
                                            IF (PBH.FINDFIRST) AND (BOMTypeChecking = TRUE) THEN BEGIN
                                                /*   IF PBH.Status<>PBH.Status::Closed THEN
                                                   BEGIN  */                                          //commented by pranavi
                                                testvar := COPYSTR(PBH."No.", 1, 8) <> 'ECMPBPCB';
                                                IF ((("Standard BOM" = TRUE) AND (PBH."Stranded BOM" = TRUE)) OR (("Master BOM" = TRUE) AND (COPYSTR(PBH."No.", 1, 8) = 'ECMPBPCB')) OR
                                                   (("Production BOM" = TRUE) AND (PBH."Stranded BOM" = FALSE)) AND (testvar)) THEN BEGIN
                                                    IF PBH.Status = PBH.Status::Certified THEN BEGIN
                                                        testcert := TRUE;
                                                        PBH.VALIDATE(PBH.Status, PBH.Status::"Under Development");
                                                        PBH.MODIFY;
                                                    END;
                                                    PBH.LOCKTABLE;        //added by pranavi on 29-06-2015
                                                    PBLTemp.RESET;
                                                    PBLTemp.SETRANGE(PBLTemp."Production BOM No.", PBL."Production BOM No.");
                                                    PBLTemp.SETRANGE(PBLTemp."Version Code", PBL."Version Code");
                                                    PBLTemp.SETRANGE(PBLTemp."Line No.", PBL."Line No.");
                                                    PBLTemp.SETRANGE(PBLTemp.Type, PBL.Type);
                                                    PBLTemp.SETRANGE(PBLTemp."No.", PBL."No.");
                                                    IF PBLTemp.FINDFIRST THEN BEGIN
                                                        // PBLTemp:=PBL;
                                                        PBLTemp.DELETE(TRUE);
                                                    END;
                                                    //PBL.DELETE(TRUE);
                                                    IF (Recertify = TRUE) AND (testcert = TRUE) THEN BEGIN
                                                        PBH.VALIDATE(PBH.Status, PBH.Status::Certified);
                                                    END;
                                                    PBH."Last Date Modified" := TODAY();
                                                    PBH."Modified User ID" := USERID;
                                                    PBH.MODIFY;
                                                    IF (testvar) THEN
                                                        ReplacedCount := ReplacedCount + 1;
                                                    //END;
                                                END;
                                            END;
                                        END
                                        ELSE BEGIN
                                            testcert := FALSE;
                                            PBVersion.RESET;
                                            PBVersion.SETCURRENTKEY("Production BOM No.", "Version Code");
                                            PBVersion.SETRANGE(PBVersion."Production BOM No.", PBL."Production BOM No.");
                                            PBVersion.SETRANGE(PBVersion."Version Code", PBL."Version Code");
                                            IF (PBVersion.FINDFIRST) AND (BOMTypeChecking = TRUE) THEN BEGIN
                                                IF PBVersion.Status = PBVersion.Status::Certified THEN BEGIN
                                                    testcert := TRUE;
                                                    PBVersion.VALIDATE(PBVersion.Status, PBVersion.Status::"Under Development");
                                                    PBVersion.MODIFY;
                                                END;
                                                PBVersion.LOCKTABLE;        //added by pranavi on 29-06-2015
                                                PBLTemp.RESET;
                                                PBLTemp.SETRANGE(PBLTemp."Production BOM No.", PBL."Production BOM No.");
                                                PBLTemp.SETRANGE(PBLTemp."Version Code", PBL."Version Code");
                                                PBLTemp.SETRANGE(PBLTemp."Line No.", PBL."Line No.");
                                                PBLTemp.SETRANGE(PBLTemp.Type, PBL.Type);
                                                PBLTemp.SETRANGE(PBLTemp."No.", PBL."No.");
                                                IF PBLTemp.FINDFIRST THEN BEGIN
                                                    //  PBLTemp:=PBL;
                                                    PBLTemp.DELETE(TRUE);
                                                END;
                                                //PBL.DELETE(TRUE);
                                                IF (Recertify = TRUE) AND (testcert = TRUE) THEN BEGIN
                                                    PBVersion.VALIDATE(PBVersion.Status, PBVersion.Status::Certified);
                                                END;
                                                PBVersion."Last Date Modified" := TODAY();
                                                PBVersion."Modified User ID" := USERID;
                                                PBVersion.MODIFY;
                                                ReplacedCount := ReplacedCount + 1;
                                            END;
                                        END;
                                    UNTIL PBL.NEXT = 0;
                            END
                            ELSE
                                MESSAGE('You are not Confirmed to Delete Item!' + FORMAT(Type[1]) + ': ' + FORMAT(No[1]));
                            // End by Pranavi on 25-Dec-2015
                        END
                        ELSE BEGIN
                            MESSAGE('Not Completed!\Under Developement!');
                        END;
                END
                ELSE    //Added By Pranavi on 27-08-2015
                    ERROR('You Do not have Rights!');

            end;
        }
        dataitem(RecertifyLoop; "Integer")
        {
            DataItemTableView = SORTING(Number);
            MaxIteration = 1;

            trigger OnPostDataItem();
            begin
                /*
                IF Recertify THEN
                BEGIN
                //PBH.MARKEDONLY(TRUE);
                {
                IF PBH.FINDSET THEN
                REPEAT
                  PBH.VALIDATE(PBH.Status,PBH.Status::Certified);
                  PBH.MODIFY;
                UNTIL PBH.NEXT=0;
                }
                IF PBH.FINDset THEN
                REPEAT
                MESSAGE('rec: '+FORMAT(PBH.COUNT)+' '+PBH."No.");
                UNTIL PBH.NEXT=0;
                END;
                MESSAGE('Recertify!');
                */

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
                    CaptionML = ENU = 'Options',
                                ENN = 'Options';
                    group("BOM Details")
                    {
                        CaptionML = ENU = 'BOM Details',
                                    ENN = 'Exchange';
                        field(BOMNO; BOMNO)
                        {
                            CaptionML = ENU = 'BOMNO',
                                        ENN = 'Type';
                            OptionCaptionML = ENU = ' ,Item,Production BOM',
                                              ENN = ' ,Item,Production BOM';

                            trigger OnLookup(Text: Text): Boolean;
                            begin
                                IF PAGE.RUNMODAL(0, ProdBOMHeader) = ACTION::LookupOK THEN BEGIN
                                    Text := ProdBOMHeader."No.";
                                    EXIT(TRUE);
                                END;
                            end;

                            trigger OnValidate();
                            begin
                                ProdBOMHeader.RESET;
                                ProdBOMHeader.SETFILTER("No.", BOMNO);
                                IF (NOT (ProdBOMHeader.FINDSET)) THEN BEGIN
                                    ERROR('BOM no not Correct please check once');
                                END;
                            end;
                        }
                        field(BOMType; BOMType)
                        {
                            CaptionML = ENU = 'BOMType',
                                        ENN = 'No.';

                            trigger OnLookup(Text: Text): Boolean;
                            begin
                                ISG.RESET;
                                ISG.SETFILTER("Product Group Code", 'FPRODUCT');
                                IF PAGE.RUNMODAL(0, ISG) = ACTION::LookupOK THEN BEGIN
                                    Text := ISG.Code;
                                    EXIT(TRUE);
                                END;
                            end;

                            trigger OnValidate();
                            begin
                                ISG.RESET;
                                ISG.SETFILTER("Product Group Code", 'FPRODUCT');
                                ISG.GET('FPRODUCT', BOMType);
                            end;
                        }
                    }
                    group(Replace)
                    {
                        CaptionML = ENU = 'Replace',
                                    ENN = 'Exchange';
                        field(ExchangeType; Type[1])
                        {
                            CaptionML = ENU = 'Type',
                                        ENN = 'Type';
                            OptionCaptionML = ENU = ' ,Item,Production BOM',
                                              ENN = ' ,Item,Production BOM';

                            trigger OnValidate();
                            begin
                                No[1] := '';
                            end;
                        }
                        field(ExchangeNo; No[1])
                        {
                            CaptionML = ENU = 'No.',
                                        ENN = 'No.';

                            trigger OnLookup(Text: Text): Boolean;
                            begin
                                CASE Type[1] OF
                                    Type[1] ::Item:
                                        IF PAGE.RUNMODAL(0, Item) = ACTION::LookupOK THEN BEGIN
                                            Text := Item."No.";
                                            EXIT(TRUE);
                                        END;
                                    Type[1] ::"Production BOM":
                                        IF PAGE.RUNMODAL(0, ProdBOMHeader) = ACTION::LookupOK THEN BEGIN
                                            Text := ProdBOMHeader."No.";
                                            EXIT(TRUE);
                                        END;
                                END;
                            end;

                            trigger OnValidate();
                            begin
                                IF Type[1] = Type::" " THEN
                                    ERROR(Text006);

                                CASE Type[1] OF
                                    Type[1] ::Item:
                                        Item.GET(No[1]);
                                    Type[1] ::"Production BOM":
                                        ProdBOMHeader.GET(No[1]);
                                END;
                            end;
                        }
                    }
                    group("With")
                    {
                        CaptionML = ENU = 'With',
                                    ENN = 'With';
                        field(WithType; Type[2])
                        {
                            CaptionML = ENU = 'Type',
                                        ENN = 'Type';
                            OptionCaptionML = ENU = ' ,Item,Production BOM',
                                              ENN = ' ,Item,Production BOM';

                            trigger OnValidate();
                            begin
                                No[2] := '';
                                IF Type[1] <> Type[2] THEN
                                    ERROR(Text000);
                            end;
                        }
                        field(WithNo; No[2])
                        {
                            CaptionML = ENU = 'No.',
                                        ENN = 'No.';

                            trigger OnLookup(Text: Text): Boolean;
                            begin
                                CASE Type[2] OF
                                    Type[2] ::Item:
                                        IF PAGE.RUNMODAL(0, Item) = ACTION::LookupOK THEN BEGIN
                                            Text := Item."No.";
                                            EXIT(TRUE);
                                        END;
                                    Type[2] ::"Production BOM":
                                        IF PAGE.RUNMODAL(0, ProdBOMHeader) = ACTION::LookupOK THEN BEGIN
                                            Text := ProdBOMHeader."No.";
                                            EXIT(TRUE);
                                        END;
                                END;
                                EXIT(FALSE);
                            end;

                            trigger OnValidate();
                            begin
                                IF Type[1] = Type::" " THEN
                                    ERROR(Text006);

                                CASE Type[2] OF
                                    Type[2] ::Item:
                                        BEGIN
                                            Item.GET(No[2]);
                                            IF FORMAT(Item."Item Status") IN ['NRND', 'Obsolete'] THEN// added by sundar to prevent obsolete items selection in new boms
                                                ERROR('The item %1 cannot be picked as its status is %2', Item.Description, FORMAT(Item."Item Status"));
                                        END;
                                    Type[2] ::"Production BOM":
                                        ProdBOMHeader.GET(No[2]);
                                END;
                            end;
                        }
                    }
                    field(Recertify; Recertify)
                    {
                        CaptionML = ENU = 'Recertify',
                                    ENN = 'Recertify';
                    }
                    field(Operation; Operation)
                    {
                        Caption = 'Type of Operation';

                        trigger OnValidate();
                        begin
                            IF Operation = Operation::Delete THEN
                                Item2DetialsEnable := FALSE
                            ELSE
                                Item2DetialsEnable := TRUE;
                        end;
                    }
                    group("BOM Group")
                    {
                        Caption = 'BOM Group';
                        field("Production BOM"; "Production BOM")
                        {
                            Caption = 'Production BOM';
                        }
                        field("Standard BOM"; "Standard BOM")
                        {
                            Caption = 'Standard BOM';
                        }
                        field("Master BOM"; "Master BOM")
                        {
                            Caption = 'Master BOM';
                        }
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit();
        begin
            Item2DetialsEnable := TRUE;
        end;

        trigger OnOpenPage();
        begin
            Item2DetialsEnable := TRUE;
        end;
    }

    labels
    {
    }

    trigger OnInitReport();
    begin
        Recertify := TRUE;
        Item2DetialsEnable := TRUE;
    end;

    trigger OnPostReport();
    begin
        MESSAGE('Item Replacement Done in :: ' + FORMAT(ReplacedCount));
    end;

    trigger OnPreReport();
    begin
        ReplacedCount := 0;
        IF Operation = Operation::Replace THEN BEGIN
            IF Type[1] = Type[1] ::" " THEN
                ERROR(Text001);

            IF No[1] = '' THEN
                ERROR(Text002);
        END
        ELSE BEGIN
            IF Type[1] = Type[1] ::" " THEN
                ERROR(Text003);

            IF No[1] = '' THEN
                ERROR(Text004);
        END;

        IF ("Production BOM" = FALSE) AND ("Standard BOM" = FALSE) AND ("Master BOM" = FALSE)
        THEN BEGIN
            ERROR(Text005);
        END;
    end;

    var
        Text000: TextConst ENU = 'Both Types must be Equal', ENN = 'You must enter a Starting Date.';
        Text001: TextConst ENU = 'You must enter the Type to exchange.', ENN = 'You must enter the Type to exchange.';
        Text006: TextConst ENU = 'Type must be entered.', ENN = 'Type must be entered.';
        Type: array[2] of Option " ",Item,"Production BOM";
        No: array[2] of Code[20];
        Recertify: Boolean;
        ProdBOMHeader: Record "Production BOM Header";
        Item: Record Item;
        PBL: Record "Production BOM Line";
        PBH: Record "Production BOM Header";
        PBLTemp: Record "Production BOM Line";
        Text002: TextConst ENU = 'You must enter the No. to exchange.', ENN = 'You must enter the No. to exchange.';
        Operation: Option Replace,Delete,Changes;
        PO: Record "Production Order";
        POL: Record "Prod. Order Line";
        testcert: Boolean;
        c: Integer;
        PBVersion: Record "Production BOM Version";
        Item2DetialsEnable: Boolean;
        Text003: TextConst ENU = 'You must enter the Type to Delete', ENN = 'You must enter the Type to exchange.';
        Text004: TextConst ENU = 'You must enter the No. to Delete', ENN = 'You must enter the No. to exchange.';
        ModfiedPBLRec: Record "Production BOM Line";
        "Production BOM": Boolean;
        "Standard BOM": Boolean;
        "Master BOM": Boolean;
        Text005: Label 'You must select the BOM Group';
        testvar: Boolean;
        BOMNO: Text[100];
        BOMType: Text;
        ISG: Record "Item Sub Group";
        BOMTypeChecking: Boolean;
        ReplacedCount: Integer;
}

