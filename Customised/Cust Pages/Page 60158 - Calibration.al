page 60158 Calibration
{
    // version Cal1.0,Rev01

    PageType = Card;
    SourceTable = Calibration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Equipment No"; "Equipment No")
                {

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field("Not an ERP Integrated"; "Not an ERP Integrated")
                {
                    Editable = Not_erp_item_flg;
                    Visible = true;

                    trigger OnValidate();
                    begin
                        IF (("Not an ERP Integrated" = TRUE)) THEN BEGIN
                            "IR Flag" := FALSE;
                            purchse_date_flg := TRUE;
                            unit_Cost_flg := TRUE;
                            equpmnt_sno_flg := TRUE;
                        END
                        ELSE BEGIN
                            "IR Flag" := TRUE;
                            purchse_date_flg := FALSE;
                            unit_Cost_flg := FALSE;
                            equpmnt_sno_flg := FALSE;
                        END;
                    end;
                }
                field(Description; Description)
                {
                }
                field("IR No"; "IR No")
                {
                    Editable = "IR Flag";
                }
                field("Item No"; "Item No")
                {
                    Editable = false;
                }
                field("Item Desc"; "Item Desc")
                {
                }
                field("Unit cost(LCY)"; "Unit cost(LCY)")
                {
                    Editable = unit_Cost_flg;
                }
                field("Inward/Purchase Date"; "Purchase Date")
                {
                    Editable = purchse_date_flg;

                    trigger OnValidate();
                    begin
                        //MESSAGE(FORMAT(TODAY-"Purchase Date"));
                        days := (TODAY - "Purchase Date");
                        days := ROUND(days / 365, 2);
                        //MESSAGE(FORMAT(days));
                        //"Life Time" := days;
                        "Life time in Yrs" := days;
                    end;
                }
                field("Eqpt. Serial No."; "Eqpt. Serial No.")
                {
                    Editable = true;
                }
                field("Equipment Type"; "Equipment Type")
                {
                }
                field(Manufacturer; Manufacturer)
                {
                }
                field("Eff Batch No"; "MFG. Serial No.")
                {
                    Editable = equpmnt_sno_flg;
                }
                field("Model No."; "Model No.")
                {
                }
                field("Calibration Type"; "Calibration Party")
                {

                    trigger OnValidate();
                    begin
                        IF (("Calibration Party" = "Calibration Party"::Damage) OR ("Calibration Party" = "Calibration Party"::Missing)) THEN BEGIN
                            calibration_period_flg := FALSE;
                            "Next Calibration Due On" := 0D;
                        END
                        ELSE
                            calibration_period_flg := TRUE;
                    end;
                }
                field("Calibration Date"; "Last Calibration Date")
                {
                    Caption = 'Calibration Date';

                    trigger OnValidate();
                    begin
                        IF ("Delay Days" > 0) THEN
                            delay_remarks_flg := TRUE
                        ELSE
                            delay_remarks_flg := FALSE;
                    end;
                }
                field("Calibration Period"; "Calibration Period")
                {
                    Editable = calibration_period_flg;

                    trigger OnValidate();
                    begin
                        IF ("Delay Days" > 0) THEN
                            delay_remarks_flg := TRUE
                        ELSE
                            delay_remarks_flg := FALSE;
                    end;
                }
                field("Next Calibration Due On"; "Next Calibration Due On")
                {
                    Editable = false;
                }
                field("Previously Calibrated Times"; "Previously Calibrated Times")
                {
                }
                field("No. Of Times Calibrated"; "Least Count")
                {
                    Editable = false;
                }
                field("Created By"; "Created By")
                {
                    Editable = false;
                }
                field("Created Date"; "Created Date")
                {
                    Editable = false;
                }
                field("Last Modified Date"; "Last Modified Date")
                {
                    Editable = false;
                }
                field("Modified By"; "Modified By")
                {
                    Editable = false;
                }
                field("Entry No"; "Entry No")
                {
                }
            }
            group(Transaction)
            {
                Caption = 'Transaction';
                field("Master Item"; "Master Item")
                {
                }
                field("Owner of the Equpmnt"; "Owner of the Equpmnt")
                {
                }
                field("Owner of the Equpmnt_Dept"; "Owner of the Equpmnt_Dept")
                {
                }
                field(Classification; Classification)
                {
                }
                field(Remarks; Remarks)
                {
                }
                field("Reason for Delay"; "Reason for Delay")
                {
                    Editable = delay_remarks_flg;
                }
                field("Delay Days"; "Delay Days")
                {
                }
                field("Life time in Yrs"; "Life time in Yrs")
                {
                    Editable = false;
                }
            }
            group(Attachments)
            {
                Caption = 'Attachments';
                Visible = false;
                field("Invoice Copy"; "Invoice Copy")
                {
                    Caption = 'Invoice Copy';

                    trigger OnAssistEdit();
                    begin

                        Attachments_invoice_cpy;
                    end;
                }
                field(Specifications; Specifications)
                {

                    trigger OnAssistEdit();
                    begin
                        Attachments_spec;
                    end;
                }
                field("Warranty Certificate"; "Warranty Certificate")
                {

                    trigger OnAssistEdit();
                    begin
                        Attachments_warranty_certficate;
                    end;
                }
                field("User Manual"; "User Manual")
                {

                    trigger OnAssistEdit();
                    begin
                        Attachments_user_manual;
                    end;
                }
            }
            group(Vendor)
            {
                Caption = 'Vendor';
                Visible = false;
                field("Vendor No."; "Vendor No.")
                {
                }
                field("Vendor Name"; "Vendor Name")
                {
                    Editable = false;
                }
                field(Address1; Address1)
                {
                    Editable = false;
                }
                field(Address2; Address2)
                {
                    Editable = false;
                }
                field(City; City)
                {
                    Editable = false;
                }
                field("Contact Person"; "Contact Person")
                {
                }
                field("Contact Phone No."; "Contact Phone No.")
                {
                }
                field("Purchase Date"; "Purchase Date")
                {
                }
                field("Service Agent"; "Service Agent")
                {
                    TableRelation = Vendor;
                }
                field(Name; Name)
                {
                    Editable = false;
                }
                field("S Address1"; "S Address1")
                {
                    Caption = '" Address1"';
                    Editable = false;
                }
                field("S Address2"; "S Address2")
                {
                    Caption = '" Address2"';
                    Editable = false;
                }
                field("S City"; "S City")
                {
                    Caption = '" City"';
                    Editable = false;
                }
                field("S Contact Person"; "S Contact Person")
                {
                    Caption = 'Contact Person';
                }
                field("S Contact Phone No."; "S Contact Phone No.")
                {
                    Caption = 'Contact Phone No.';
                }
                field("E-Mail Address"; "E-Mail Address")
                {
                }
            }
            group(Quality)
            {
                Caption = 'Quality';
                Visible = false;
                field("Spec Id"; "Spec Id")
                {
                }
                field("QC Enabled"; "QC Enabled")
                {
                }
            }
            group(Details)
            {
                Caption = 'Details';
                Visible = false;
                field("Measuring Range"; "Measuring Range")
                {
                }
                field("Least Count"; "Least Count")
                {
                    DecimalPlaces = 0 : 5;
                }
                field("Calibration Party"; "Calibration Party")
                {
                }
                field("Calibration Cert No./ IR No"; "Calibration Cert No./ IR No")
                {
                    Editable = false;
                }
                field(Results; Results)
                {
                    Editable = false;
                }
                field(Recommendations; Recommendations)
                {
                    Editable = false;
                }
                field("Response Time"; "Response Time")
                {
                }
                field("Expected Return Date"; "Expected Return Date")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("I&nspection")
            {
                Caption = 'I&nspection';
                Visible = false;
                action("Inspection Data Sheets")
                {
                    Caption = 'Inspection Data Sheets';
                    Image = Worksheet;

                    trigger OnAction();
                    begin
                        ShowDataSheets;
                    end;
                }
                action("Posted Inspection Data Sheets")
                {
                    Caption = 'Posted Inspection Data Sheets';
                    Image = Worksheet2;

                    trigger OnAction();
                    begin
                        ShowPostDataSheets;
                    end;
                }
                action("Inspection Receipt")
                {
                    Caption = 'Inspection Receipt';
                    Image = Receipt;

                    trigger OnAction();
                    begin
                        ShowInspectReceipt;
                    end;
                }
                action("Posted Inspection Receipt")
                {
                    Caption = 'Posted Inspection Receipt';
                    Image = PostedReceipt;

                    trigger OnAction();
                    begin
                        ShowPostInspectReceipt;
                    end;
                }
                action("Cancel Inspection")
                {
                    Caption = 'Cancel Inspection';
                    Image = CancelFALedgerEntries;

                    trigger OnAction();
                    var
                        QualityStatusValue: Text[50];
                    begin
                        IF CONFIRM(Text33000260, FALSE) THEN BEGIN
                            QualityStatusValue := 'Cancel';
                            CancelInspection(QualityStatusValue);
                            CurrPage.UPDATE(FALSE);
                        END;
                    end;
                }
            }
            group("&Calibration")
            {
                Caption = '&Calibration';
                Visible = false;
                separator(Action1102152100)
                {
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = Comment;
                    RunObject = Page "Quality Comment Sheet";
                    RunPageLink = Type = CONST(Calibration), No.=FIELD(Equipment No);
                }
                separator(Action1102152102)
                {
                }
                action("&Attachments")
                {
                    Caption = '&Attachments';
                    Image = Attachments;
                    Visible = false;

                    trigger OnAction();
                    begin
                        TenderAttachments;
                    end;
                }
                separator(Action1102152118)
                {
                }
                action("Measuring Parameters")
                {
                    Caption = 'Measuring Parameters';
                    Image = Campaign;
                    RunObject = Page "Measuring Parameters";
                                    RunPageLink = Equipment No.=FIELD(Equipment No);
                }
                separator(Action1102152130)
                {
                }
                group("Unpotsed RGPS")
                {
                    Caption = 'Unpotsed RGPS';
                    Image = PostTaxInvoice;
                    Visible = false;
                    action("RGP &Out")
                    {
                        Caption = 'RGP &Out';
                        Image = OutboundEntry;

                        trigger OnAction();
                        begin
                            RGPOutLine.SETRANGE("No.","Equipment No");
                            RGPOutLine.SETRANGE(Status,RGPOutLine.Status::"Not Posted");
                            IF RGPOutLine.FINDFIRST THEN BEGIN
                              RGPOutHeader.SETRANGE("RGP Out No.",RGPOutLine."Document No.");
                              RGPOutHeader.SETRANGE(Status,RGPOutHeader.Status::"Not Posted");
                              IF RGPOutHeader.FINDFIRST THEN
                                PAGE.RUN(60057,RGPOutHeader);
                            END;
                        end;
                    }
                    action("RGP &In")
                    {
                        Caption = 'RGP &In';
                        Image = InwardEntry;

                        trigger OnAction();
                        begin
                            RGPInLine.SETRANGE("No.","Equipment No");
                            RGPInLine.SETRANGE(Status,RGPInLine.Status::"Not Posted");
                            IF RGPInLine.FINDFIRST THEN BEGIN
                              RGPInHeader.SETRANGE("RGP In No.",RGPInLine."Document No.");
                              RGPInHeader.SETRANGE(Status,RGPInHeader.Status::"Not Posted");
                              IF RGPInHeader.FINDFIRST THEN
                                PAGE.RUN(60062,RGPInHeader);
                            END;
                        end;
                    }
                }
                group("Posted RGPS")
                {
                    Caption = 'Posted RGPS';
                    Image = PostApplication;
                    Visible = false;
                    action(Action1102152120)
                    {
                        Caption = 'RGP &Out';
                        Image = OutputJournal;

                        trigger OnAction();
                        begin
                            RGPOutLine.SETRANGE("No.","Equipment No");
                            RGPOutLine.SETRANGE(Status,RGPOutLine.Status::Posted);
                            IF RGPOutLine.FINDFIRST THEN BEGIN
                              RGPOutHeader.SETRANGE("RGP Out No.",RGPOutLine."Document No.");
                              RGPOutHeader.SETRANGE(Status,RGPOutHeader.Status::Posted);
                              IF RGPOutHeader.FINDFIRST THEN
                                PAGE.RUN(60060,RGPOutHeader);
                            END;
                        end;
                    }
                    action("RGP &IN")
                    {
                        Caption = 'RGP &IN';
                        Image = PostInventoryToGL;

                        trigger OnAction();
                        begin
                            RGPInLine.SETRANGE("No.","Equipment No");
                            RGPInLine.SETRANGE(Status,RGPInLine.Status::Posted);
                            IF RGPInLine.FINDFIRST THEN BEGIN
                              RGPInHeader.SETRANGE("RGP In No.",RGPInLine."Document No.");
                              RGPInHeader.SETRANGE(Status,RGPInHeader.Status::Posted);
                              IF RGPInHeader.FINDFIRST THEN
                                PAGE.RUN(60064,RGPInHeader);
                            END;
                        end;
                    }
                }
                separator(Action1102152111)
                {
                }
                action("Calibration Procedure Set&up")
                {
                    Caption = 'Calibration Procedure Set&up';
                    Image = Setup;
                    RunObject = Page "Calibration Setup";
                                    RunPageLink = Equipment No.=FIELD(Equipment No);
                }
                action("&Calibration Procedure")
                {
                    Caption = '&Calibration Procedure';
                    Image = StepInto;

                    trigger OnAction();
                    begin
                        CalProHeader.ShowCalProc(Rec);
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Visible = true;
                action(Post)
                {
                    Caption = 'Post';
                    Image = Post;
                    Visible = true;

                    trigger OnAction();
                    begin
                        IF NOT(USERID IN ['EFFTRONICS\SUJANI','EFFTRONICS\DINEEL','EFFTRONICS\VISHNUPRIYA']) THEN
                          ERROR('You are not authorized to post calibration record')
                        ELSE
                        BEGIN

                        IF Rec."Model No." ='' THEN
                          ERROR('Enter the Equipment Model');
                        IF Rec."Eqpt. Serial No." = '' THEN
                          ERROR('Enter the Equipment Serial No  ');
                        IF Rec.Description = '' THEN
                          ERROR('Enter the Equipment Description  ');
                        IF NOT(Rec."Calibration Party" IN [Rec."Calibration Party"::Damage,Rec."Calibration Party"::Missing]) THEN
                          BEGIN
                             IF(FORMAT(Rec."Calibration Period") ='')   THEN
                                ERROR('Enter the Freuency of Callibration  ');
                           END;
                        IF ("Purchase Date" = 0D) THEN
                          ERROR('Enter the Inward/Purchase Date');
                        IF ("Calibration Party" = "Calibration Party"::"Periodical Verification") THEN
                           "Last Calibration Date" := 0D
                          ELSE
                            BEGIN
                                IF ("Last Calibration Date" = 0D) THEN
                                ERROR('Enter the Last Calibration Date');
                            END;
                        IF "Owner of the Equpmnt" = '' THEN
                          ERROR('Fill the Owner of the Equipment');
                        IF (CONFIRM('Do you want to post this calibration record')) THEN
                          BEGIN
                            IF Rec."Equipment No" <> '' THEN
                              BEGIN
                                cal_ledger.INIT;
                                cal_ledger.TRANSFERFIELDS(Rec);
                                cal_ledger."Entry No" := NoSeriesMgt.GetNextNo('POS-CAL',WORKDATE,TRUE);
                                cal_ledger."Created Date" := TODAY;
                                cal_ledger."Delay Days" := Calibration."Delay Days";
                                cal_ledger.INSERT;
                                Calibration.INIT;
                                Calibration.SETRANGE("Equipment No" ,cal_ledger."Equipment No");
                                IF Calibration.FINDSET THEN
                                  BEGIN
                                      Calibration."Entry No" := cal_ledger."Entry No";
                                      Calibration.MODIFY;
                                      COMMIT;
                                  END;
                                MESSAGE('Calibration posted successfully');
                                Calibration."Reason for Delay" :='';// added by sujani on 20-03-19
                              END;
                              Attachments_cal();
                              CurrPage.CLOSE;
                              CalibrationMailtoOwners(Rec); // added by Vishnu on 02-05-2019
                           END
                        ELSE
                        MESSAGE('Ok Not Posting');
                        END;
                    end;
                }
                separator(Action1102152030)
                {
                }
                action(Attachment)
                {
                    Image = Attachments;
                    Visible = true;

                    trigger OnAction();
                    begin
                        Attachments_cal();
                    end;
                }
                action("Create RGP &Out")
                {
                    Caption = 'Create RGP &Out';
                    Image = CreateDocument;
                    Visible = false;

                    trigger OnAction();
                    begin
                        TESTFIELD("Response Time");
                        TESTFIELD("Service Agent");
                        IF "Current Status" <> "Current Status" :: "Under Calibration" THEN
                          RGPHeader(Rec)
                        ELSE
                          MESSAGE(Text003);
                    end;
                }
                action("Create RGP &In")
                {
                    Caption = 'Create RGP &In';
                    Image = CreateForm;
                    Visible = false;

                    trigger OnAction();
                    begin
                        CurrPage.UPDATE;
                        IF "RGP Status" = TRUE THEN
                          ERROR(Text007)
                        ELSE
                          RGPIN(Rec);
                    end;
                }
                action("Create Inspection Data &Sheets")
                {
                    Caption = 'Create Inspection Data &Sheets';
                    Image = CreateCreditMemo;
                    Visible = false;

                    trigger OnAction();
                    begin
                        IF "Current Status" <> "Current Status" :: "Under Calibration" THEN
                          CreateInspectionDataSheets
                        ELSE
                          MESSAGE(Text006);
                    end;
                }
                separator(Action1102152127)
                {
                }
                action("Get Eqpt. Due for Calibration")
                {
                    Caption = 'Get Eqpt. Due for Calibration';
                    Image = GetEntries;
                    RunObject = Report Report60023;
                                    Visible = true;
                }
            }
            group(Transactions)
            {
                Caption = 'Transactions';
                Visible = true;
                action("Get Eqpt. Out of Calibration")
                {
                    Caption = 'Get Eqpt. Out of Calibration';
                    Image = GetOrder;
                    Visible = true;
                }
            }
            action(Comment)
            {
                Caption = 'Comment';
                Image = Comment;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Quality Comment Sheet";
                                RunPageLink = Type=CONST(Calibration),No.=FIELD(Equipment No);
                ToolTip = 'Comment';
                Visible = false;
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        IF( (Transfered_from = Transfered_from::IR)) THEN
          BEGIN
          "IR Flag" := FALSE;
          Not_erp_item_flg := FALSE;
          END
        ELSE
          BEGIN
          Not_erp_item_flg := TRUE;
          "IR Flag" := TRUE;
          END;
         IF ("Delay Days"> 0 ) THEN
            delay_remarks_flg := TRUE
         ELSE
            delay_remarks_flg := FALSE;

         IF ("Purchase Date" <> 0D) THEN
           BEGIN
            days :=(TODAY-"Purchase Date");
            days := ROUND(days/365 ,2);
            "Life time in Yrs" := days;
            END;
    end;

    trigger OnOpenPage();
    begin
        "IR Flag" := FALSE;
        delay_remarks_flg := FALSE;
        Not_erp_item_flg :=FALSE;
        purchse_date_flg := FALSE;
        IF Rec."Calibration Party" = Rec."Calibration Party"::Damage THEN
          BEGIN
          calibration_period_flg := FALSE;
          "Next Calibration Due On" := 0D;
          END
        ELSE
          calibration_period_flg := TRUE;
    end;

    var
        RGPOutHeader : Record "RGP Out Header";
        RGPInHeader : Record "RGP In Header";
        RGPOutLine : Record "RGP Out Line";
        RGPInLine : Record "RGP In Line";
        RGPOutLine1 : Record "RGP Out Line";
        Text000 : Label 'RGP OUT  is Created';
        Text001 : Label 'RGP IN is Created';
        Text002 : Label 'Posted RGP OUT doesn''t exist';
        RGPOutHeader1 : Record "RGP Out Header";
        RGPInHeader1 : Record "RGP In Header";
        CalProHeader : Record "Calibration Procedure Header";
        IDS : Record "Inspection Datasheet Header";
        IR : Record "Inspection Receipt Header";
        Text003 : Label 'Cannot create RGP OUT for the equipment, Which is under inspection.';
        Text004 : Label 'RGP OUT already created';
        Text005 : Label 'Cannot create RGP IN for the equipment, Which is under inspection.';
        Text006 : Label 'Cannot create Inspection Datasheet for the equipment, Which is under inspection.';
        Text007 : Label 'RGP OUT is not posted';
        Text33000260 : Label 'Do you want to Cancel Quality Inspection?';
        Calibration : Record Calibration;
        NoSeriesMgt : Codeunit NoSeriesManagement;
        InventorySetup : Record "Inventory Setup";
        cal_ledger : Record "Calibration Ledger Entries";
        "IR Flag" : Boolean;
        delay_remarks_flg : Boolean;
        Not_erp_item_flg : Boolean;
        purchse_date_flg : Boolean;
        unit_Cost_flg : Boolean;
        equpmnt_sno_flg : Boolean;
        Attachments : Record Attachments;
        days : Integer;
        calibration_date_flg : Boolean;
        calibration_period_flg : Boolean;
        previously_calibrated_flg : Boolean;
        "Invoice Copy" : Code[5];
        Specifications : Code[5];
        "Warranty Certificate" : Code[5];
        "User Manual" : Code[5];
        SMTP_MAIL : Codeunit "SMTP Mail";
        Subject : Text;
        Body : Text;
        Mail_to : Text;
        Users : Record User;

    (13246)]
    procedure RGPHeader(Calibration : Record Calibration);
    begin
        InventorySetup.GET;
        IF Calibration.Status <> Calibration.Status ::Scrapped THEN BEGIN
          RGPOutHeader1.SETRANGE("Equipment No",Calibration."Equipment No");
          RGPOutHeader1.SETRANGE(Status,RGPOutHeader1.Status::"Not Posted");
          IF NOT RGPOutHeader1.FINDFIRST THEN BEGIN
            RGPOutHeader.INIT;
            RGPOutHeader."RGP Out No." := NoSeriesMgt.GetNextNo(InventorySetup."RGP Out No.",WORKDATE,TRUE);
            RGPOutHeader.Consignee := RGPOutHeader.Consignee::Vendor;
            RGPOutHeader."Consignee No." := Calibration."Service Agent";
            RGPOutHeader."Consignee Name" := Calibration.Name;
            RGPOutHeader.Address := Calibration."S Address1";
            RGPOutHeader."Consignee City" :=Calibration."S City";
            RGPOutHeader."Consignee Contact" := Calibration."S Contact Person";
            RGPOutHeader."Phone No." := Calibration."S Contact Phone No.";
            RGPOutHeader."RGP Date" := WORKDATE;
            RGPOutHeader."Equipment No" := Calibration."Equipment No";
            RGPOutHeader.INSERT;

            RGPOutLine.INIT;
            RGPOutLine."Document No." := RGPOutHeader."RGP Out No.";
            RGPOutLine.Type := RGPOutLine.Type ::"3";
            RGPOutLine."No." := "Equipment No";
            RGPOutLine."Line No." := RGPOutLine."Line No." + 10000;
            RGPOutLine.Description := Calibration.Description;
            RGPOutLine.UOM := Calibration."Unit Of Measure";
            RGPOutLine.Quantity := 1;
            RGPOutLine."Expected Return Date" := Calibration."Expected Return Date";
            RGPOutLine.INSERT;
            MESSAGE(Text000);
            "Expected Return Date" := CALCDATE("Response Time",WORKDATE);
            "Current Status" := "Current Status" :: "Under Calibration";
            "RGP Status" := TRUE;
             MODIFY;
            END ELSE
              MESSAGE(Text004);
        END;
    end;

    (13284)]
    procedure RGPINOne(Calibration : Record Calibration);
    begin
        IDS.SETRANGE("Source Type",IDS."Source Type"::Calibration);
        IDS.SETRANGE("Item No.","Equipment No");
        IF IDS.FINDFIRST THEN
          ERROR(Text005);

        IR.SETRANGE("Source Type",IR."Source Type" :: Calibration);
        IR.SETRANGE(Status,FALSE);
        IR.SETRANGE("Item No.","Equipment No");
        IF IR.FINDFIRST THEN
          ERROR(Text005);

        RGPOutLine.SETRANGE("No." ,Calibration."Equipment No");
        IF RGPOutLine.FINDFIRST THEN BEGIN
          IF Calibration.Status <> Calibration.Status ::Scrapped THEN BEGIN
            RGPOutHeader.SETRANGE("Equipment No",Calibration."Equipment No");
            RGPOutHeader.SETFILTER(Status,'NOT Posted');
            IF RGPOutHeader.FINDFIRST THEN BEGIN
              MESSAGE(Text007);
              EXIT;
            END ELSE BEGIN
              RGPInHeader1.SETRANGE("Equipment No",Calibration."Equipment No");
              RGPInHeader1.SETRANGE(Status,RGPInHeader1.Status::"Not Posted");
              IF NOT RGPInHeader1.FINDFIRST THEN BEGIN
                RGPInHeader.INIT;
                RGPInHeader."RGP In No." := NoSeriesMgt.GetNextNo(InventorySetup."RGP In No.",WORKDATE,TRUE);
                RGPInHeader.Consignee := RGPInHeader.Consignee::Vendor;
                RGPInHeader."Consignee No." := "Service Agent";
                RGPInHeader.VALIDATE(RGPInHeader."Consignee No.");
                RGPInHeader."RGP In Date" := WORKDATE;
                RGPInHeader."Calibration Status" := Calibration.Status;
                RGPInHeader.Results := Calibration.Results;
                RGPInHeader.Recommendations := Calibration.Recommendations;
                RGPInHeader."Equipment No" := Calibration."Equipment No";
                RGPInHeader.INSERT;
                RGPOutHeader.RESET;
                RGPOutHeader.SETRANGE("Equipment No",RGPInHeader."Equipment No");
                RGPOutHeader.SETRANGE(Status,RGPOutHeader.Status::Posted);
                IF RGPOutHeader.FINDLAST THEN BEGIN
                  RGPInHeader."RGP Out No." := RGPOutHeader."RGP Out No.";
                  RGPInHeader."RGP Out Date" := RGPOutHeader."RGP Date";
                  RGPInHeader."RGP Out Posting Date" := RGPOutHeader."RGP Posting Date";
                  RGPInHeader.MODIFY;
                END;
                RGPInLine.INIT;
                RGPInLine."Document No." := RGPInHeader."RGP In No.";
                RGPInLine.Type := RGPInLine.Type ::"3";
                RGPInLine."No." := "Equipment No";
                RGPInLine."Line No." := RGPInLine."Line No." + 10000;
                RGPOutHeader.SETRANGE(Status,RGPOutHeader.Status::Posted);
                RGPOutHeader.SETRANGE("Equipment No",Calibration."Equipment No");
                IF RGPOutHeader.FINDFIRST THEN BEGIN
                  RGPInLine."RGP Out Document No." := RGPOutHeader."RGP Out No.";
                  RGPOutLine.SETRANGE(RGPOutLine.Type,RGPOutLine.Type::"3");
                  RGPOutLine.SETRANGE("No.",RGPOutHeader."Equipment No");
                    IF RGPOutLine.FINDFIRST THEN
                      RGPInLine."RGP Out Line No." := RGPOutLine."Line No.";
                END;
                RGPInLine.Quantity := 1;
                RGPInLine."Quantity to Recieve" := 1;
                RGPInLine.Description := Calibration.Description;
                RGPInLine.UOM := Calibration."Unit Of Measure";
                RGPInLine.INSERT;
                MESSAGE(Text001);
              END;
            END;
          END;
        END;
    end;

    (13353)]
    procedure RGPIN(Calibration : Record Calibration);
    begin
        IDS.SETRANGE("Source Type",IDS."Source Type"::Calibration);
        IDS.SETRANGE("Item No.","Equipment No");
        IF IDS.FINDFIRST THEN
          ERROR(Text005);

        IR.SETRANGE("Source Type",IR."Source Type" :: Calibration);
        IR.SETRANGE(Status,FALSE);
        IR.SETRANGE("Item No.","Equipment No");
        IF IR.FINDFIRST THEN
          ERROR(Text005);

        RGPOutHeader.RESET;
        InventorySetup.GET;
        IF Calibration.Status <> Calibration.Status ::Scrapped THEN BEGIN
          RGPOutLine.SETRANGE(RGPOutLine.Type,RGPOutLine.Type::"3");
          RGPOutLine.SETRANGE("No." ,Calibration."Equipment No");
          RGPOutLine.SETFILTER(Status,'Posted');
          IF RGPOutLine.FINDFIRST THEN BEGIN
            RGPOutHeader.SETRANGE("RGP Out No.",RGPOutLine."Document No.");
            IF RGPOutHeader.FINDFIRST THEN BEGIN
              RGPInHeader.INIT;
              RGPInHeader."RGP In No." := NoSeriesMgt.GetNextNo(InventorySetup."RGP In No.",WORKDATE,TRUE);
              RGPInHeader.Consignee := RGPInHeader.Consignee::Vendor;
              RGPInHeader."Consignee No." := Calibration."Vendor No.";
              RGPInHeader."Consignee Name" := Calibration."Vendor Name";
              RGPInHeader.Address := Calibration.Address1;
              RGPInHeader."Consignee City" :=Calibration.City;
              RGPInHeader."Consignee Contact" := Calibration."Contact Person";
              RGPInHeader."Phone No.":= Calibration."Contact Phone No.";
              RGPInHeader."RGP In Date" := WORKDATE;
              RGPInHeader."Calibration Status" := Calibration.Status;
              RGPInHeader.Results := Calibration.Results;
              RGPInHeader.Recommendations := Calibration.Recommendations;
              RGPInHeader."Equipment No" := Calibration."Equipment No";
              RGPInHeader.INSERT;
              RGPInHeader."RGP Out No." := RGPOutHeader."RGP Out No.";
              RGPInHeader."RGP Out Date" := RGPOutHeader."RGP Date";
              RGPInHeader."RGP Out Posting Date" := RGPOutHeader."RGP Posting Date";
              RGPInHeader.MODIFY;

              RGPOutLine1.SETRANGE("Document No.",RGPOutHeader."RGP Out No.");
              IF RGPOutLine1.FINDSET THEN
                REPEAT
                  RGPInLine.INIT;
                  RGPInLine."Document No." := RGPInHeader."RGP In No.";
                  RGPInLine."Line No." := RGPOutLine1."Line No.";
                  RGPInLine.Type := RGPInLine.Type ::"3";
                  RGPInLine."No." := RGPOutLine1."No.";
                  RGPInLine."RGP Out Document No." := RGPOutHeader."RGP Out No.";
                  RGPInLine."RGP Out Line No." := RGPOutLine1."Line No.";
                  RGPInLine.Quantity := RGPOutLine1.Quantity;
                  RGPInLine."Quantity to Recieve" := 1;
                  RGPInLine.Description := RGPOutLine1.Description;
                  RGPInLine.UOM := RGPOutLine1.UOM;
                  RGPInLine.INSERT;
                UNTIL RGPOutLine1.NEXT = 0;
                MESSAGE(Text001);
            END;
          END;
        END;
    end;

    (13415)]
    local procedure OnHyperlink(URL : Text[1024]);
    begin
        RGPHeader(Rec);
    end;

    (13418)]
    procedure Attachments_cal();
    begin
        Attachments.RESET;
        Attachments.SETRANGE("Table ID",33000929);
        Attachments.SETRANGE("Document No.",cal_ledger."Entry No");
        PAGE.RUN(PAGE::"ESPL Attachments",Attachments);
    end;

    (13424)]
    procedure Attachments_invoice_cpy();
    begin


        Attachments.RESET;
        Attachments.SETRANGE("Table ID",33000929);
        Attachments.SETRANGE("Document No.",cal_ledger."Entry No");
        //IF
        //Attachments.Doc_Type
        //Attachments.SETRANGE(Doc_Type,Attachments.Doc_Type::Invoice);
        PAGE.RUN(PAGE::"ESPL Attachments",Attachments);
    end;

    (13435)]
    procedure Attachments_spec();
    begin
        Attachments.RESET;
        Attachments.SETRANGE("Table ID",33000929);
        Attachments.SETRANGE("Document No.",cal_ledger."Entry No");
        Attachments.SETRANGE("Attachment Status",FALSE);
        PAGE.RUN(PAGE::"ESPL Attachments",Attachments);
    end;

    (13442)]
    procedure Attachments_warranty_certficate();
    begin
        Attachments.RESET;
        Attachments.SETRANGE("Table ID",33000929);
        Attachments.SETRANGE("Document No.",cal_ledger."Entry No");
        Attachments.SETRANGE("Attachment Status",FALSE);
        PAGE.RUN(PAGE::"ESPL Attachments",Attachments);
    end;

    (13449)]
    procedure Attachments_user_manual();
    begin
        Attachments.RESET;
        Attachments.SETRANGE("Table ID",33000929);
        Attachments.SETRANGE("Document No.",cal_ledger."Entry No");
        //Attachments.SETRANGE(Description,'User Manual');
        Attachments.SETRANGE("Attachment Status",FALSE);
        PAGE.RUN(PAGE::"ESPL Attachments",Attachments);
    end;

    (13457)]
    local procedure CalibrationMailtoOwners(CalibrationTab : Record Calibration);
    begin
        CalibrationTab.RESET;
        CalibrationTab.SETFILTER("Equipment No",Rec."Equipment No");
        IF CalibrationTab.FINDFIRST THEN
          BEGIN
              Subject := 'Reg:'+CalibrationTab.Description+'Your Equipment Calibration was completed.';
            Users.RESET;
            Users.SETFILTER("User Name",CalibrationTab."Owner of the Equpmnt");
            IF Users.FINDFIRST THEN
              Mail_to := Users.MailID
            ELSE
              Mail_to := 'calibration@efftronics.com';

              SMTP_MAIL.CreateMessage('Calibrations','calibration@efftronics.com',Mail_to,Subject,Body,TRUE);
              SMTP_MAIL.AppendBody('<html><head><style> divone{background-color: white; width: 150px; padding: 8px; border-style:solid ; border-color:#CCCC00;  margin: 10px;} </style></head>');
              SMTP_MAIL.AppendBody('<body><div style="border-color:#CCCC00;  margin: 8px; border-width:10px;   border-style:solid; padding: 8px; width: 450px;">');
              //SMTP_MAIL.AppendBody('<label><font size="6">IREPS  Expected Orders List</font></label>');
              //SMTP_MAIL.AppendBody('<hr style=solid; color= #2C2EA8 >');
              SMTP_MAIL.AppendBody('<h>Dear Sir/Mam  ,</h><br>');
              SMTP_MAIL.AppendBody('<P>        Your Item was Calibrated. Below are the details of it.</P>');
              SMTP_MAIL.AppendBody('<table border = "1" style="border-collapse:collapse; width:100%; fond-size:5pt;">');
              SMTP_MAIL.AppendBody('<tr><td width= "40%"><b>Equipment Name  </b> </td><td>'+CalibrationTab.Description+'</td></tr> ');
              SMTP_MAIL.AppendBody('<tr><td width= "40%"><b>Sl.Num  </b> </td><td>'+CalibrationTab."Eqpt. Serial No."+'</td></tr> ');
              SMTP_MAIL.AppendBody('<tr><td width= "40%"><b>Make  </b> </td><td>'+CalibrationTab.Manufacturer+'</td></tr> ');
              SMTP_MAIL.AppendBody('<tr><td width= "40%"><b>Model  </b> </td><td>'+CalibrationTab."Model No."+'</td></tr> ');
              SMTP_MAIL.AppendBody('<tr><td width= "40%"><b>Date of Calibration  </b> </td><td>'+FORMAT(CalibrationTab."Last Calibration Date")+'</td></tr> ');
              SMTP_MAIL.AppendBody('<tr><td width= "40%"><b>Next Calibration Due on  </b> </td><td>'+FORMAT(CalibrationTab."Next Calibration Due On")+'</td></tr> ');
              SMTP_MAIL.AppendBody('</table>');
              SMTP_MAIL.AppendBody('<br>Regards,<br>');
              SMTP_MAIL.AppendBody('ERP.');
              SMTP_MAIL.AppendBody('<br>');
              SMTP_MAIL.AppendBody('<div style="Background-color:#E36015; color:#F0F1F5; "><p align= "center"> *****AUTO GENERATED MAIL FROM ERP**** </div><br/></div>');
              //SMTP_MAIL.AddBCC('vishnupriya@efftronics.com');
              SMTP_MAIL.Send;
          END;
    end;
}

