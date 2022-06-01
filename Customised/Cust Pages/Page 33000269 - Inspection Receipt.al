page 33000269 "Inspection Receipt"
{
    // version QC1.1,Cal1.0,QCP1.0,RQC1.0,Rev01,EFFUPG

    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Document;
    Permissions = TableData "Item Ledger Entry" = rimd;
    SourceTable = "Inspection Receipt Header";
    SourceTableView = SORTING(No.) WHERE(Status = FILTER(No), Source Type=CONST(In Bound));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                    Editable = false;
                }
                field("Item No."; "Item No.")
                {
                    Editable = false;
                }
                field("Item Description"; "Item Description")
                {
                    Editable = false;
                }
                field("Unit Of Measure Code"; "Unit Of Measure Code")
                {
                    Editable = false;
                }
                field(Quantity; Quantity)
                {
                    Editable = false;
                }
                field("Spec ID"; "Spec ID")
                {
                    Editable = false;
                }
                field("IDS Posted By"; "IDS Posted By")
                {
                    Editable = false;
                }
                field("Created Date"; "Created Date")
                {
                    Editable = false;
                }
                field("Posting Date"; "Posting Date")
                {
                }
                field("Document Date"; "Document Date")
                {
                    Editable = false;
                }
                field("Rework Reference No."; "Rework Reference No.")
                {
                    Editable = false;
                }
                field("Source Type"; "Source Type")
                {
                    Editable = false;
                }
                field(Status; Status)
                {
                    Editable = editfields;
                }
                field(Make; Make)
                {
                    Editable = false;
                }
                field("Lot No."; "Lot No.")
                {
                    Editable = false;
                }
                field("Reason code"; "Reason code")
                {
                }
                field(MSL; MSL)
                {
                    Caption = 'MSL';
                    Editable = false;
                    Visible = Visible_Bool;
                }
                field("ESD Class"; "ESD Class")
                {
                    Caption = 'ESD Class';
                    Editable = false;
                    Visible = Visible_Bool;
                }
                field("Floor Life at 25 C 40% RH"; "Floor Life at 25 C 40% RH")
                {
                    Caption = 'Floor Life at 25 C 40% RH';
                    Editable = false;
                    Visible = Visible_Bool;
                }
                field("Component Shelf Life(Years)"; "Component Shelf Life(Years)")
                {
                    Caption = 'Component Shelf Life(Years)';
                    Editable = false;
                    Visible = Visible_Bool;
                }
                field("Bake Hours"; "Bake Hours")
                {
                    Caption = 'Component Bake Hours';
                    Editable = false;
                    Visible = Visible_Bool;
                }
            }
            part(InpectionReceiptLine; "Inpection Receipt Line")
            {
                SubPageLink = Document No.=FIELD(No.),Purch Line No.=FIELD(Purch Line No);
            }
            group(Receipt)
            {
                Caption = 'Receipt';
                field("Vendor No.";"Vendor No.")
                {
                    Editable = false;
                }
                field("Vendor Name";"Vendor Name")
                {
                    Editable = false;
                }
                field("Vendor Name 2";"Vendor Name 2")
                {
                    Editable = false;
                }
                field(Address;Address)
                {
                    Editable = false;
                }
                field("Address 2";"Address 2")
                {
                    Editable = false;
                }
                field("Contact Person";"Contact Person")
                {
                    Editable = false;
                }
                field("Created time";"Created time")
                {
                    Editable = false;
                }
                field("Order No.";"Order No.")
                {
                    Editable = false;
                }
                field("Receipt No.";"Receipt No.")
                {
                    Editable = false;
                }
                field("Purch Line No";"Purch Line No")
                {
                    Editable = false;
                }
                field("External Document No.";"External Document No.")
                {
                    Editable = false;
                }
                field("Purchase Consignment";"Purchase Consignment")
                {
                }
                field("Item Tracking Exists";"Item Tracking Exists")
                {
                    Editable = false;
                }
                field("Quality Before Receipt";"Quality Before Receipt")
                {
                }
            }
            group(Production)
            {
                Caption = 'Production';
                field("Prod. Order No.";"Prod. Order No.")
                {
                    Editable = false;
                }
                field("Prod. Order Line";"Prod. Order Line")
                {
                    Editable = false;
                }
                field("Routing No.";"Routing No.")
                {
                    Editable = false;
                }
                field("Routing Reference No.";"Routing Reference No.")
                {
                    Editable = false;
                }
                field("Operation No.";"Operation No.")
                {
                    Editable = false;
                }
                field("Prod. Description";"Prod. Description")
                {
                    Editable = false;
                }
                field("Operation Description";"Operation Description")
                {
                    Editable = false;
                }
                field("Production Batch No.";"Production Batch No.")
                {
                    Editable = false;
                }
                field("Sub Assembly Code";"Sub Assembly Code")
                {
                    Editable = false;
                }
                field("Sub Assembly Description";"Sub Assembly Description")
                {
                    Editable = false;
                }
                field("In Process";"In Process")
                {
                    Editable = false;
                }
                field(Resource;Resource)
                {
                }
                field("OutPut Jr Serial No.";"OutPut Jr Serial No.")
                {
                }
                field("Issues For Pending";"Issues For Pending")
                {
                }
                field("Finished Product Sr No";"Finished Product Sr No")
                {
                }
                field("Rework User";"Rework User")
                {
                }
                field("Reason for Pending";"Reason for Pending")
                {
                    Editable = false;
                }
            }
            group("Sales Cr.Memo")
            {
                Caption = 'Sales Cr.Memo';
                field("Sales Order No.";"Sales Order No.")
                {
                }
                field("Posted Sales Order No.";"Posted Sales Order No.")
                {
                }
                field("Sales Line No";"Sales Line No")
                {
                }
                field("Customer No.";"Customer No.")
                {
                }
                field("Customer Name";"Customer Name")
                {
                }
                field("Customer Name 2";"Customer Name 2")
                {
                }
                field("Customer Address";"Customer Address")
                {
                }
                field("Customer Address2";"Customer Address2")
                {
                }
            }
            group(Transfer)
            {
                Caption = 'Transfer';
                field("Trans. Order No.";"Trans. Order No.")
                {
                }
                field("Trans. Order Line";"Trans. Order Line")
                {
                }
                field("Trans. Description";"Trans. Description")
                {
                }
                field("Transfer-from Code";"Transfer-from Code")
                {
                }
                field("Transfer-to Code";"Transfer-to Code")
                {
                }
            }
            group(Inspection)
            {
                Caption = 'Inspection';
                field("<Quantity2>";Quantity)
                {
                    Caption = 'Quantity';
                    Editable = false;
                }
                field(UndefinedQty;UndefinedQty)
                {
                    Caption = 'UndefinedQty';
                    Editable = true;
                }
                field("Qty. Accepted";"Qty. Accepted")
                {

                    trigger OnAssistEdit();
                    begin
                        QualityAcceptanceLevels(QualityType :: Accepted);
                        CalculateUndefinedQty;
                    end;
                }
                field("Qty. Accepted Under Deviation";"Qty. Accepted Under Deviation")
                {

                    trigger OnAssistEdit();
                    begin
                        IF "Trans. Order No." <> '' THEN
                          ERROR('You can not enter the rework quantity for sample inspection');
                        IF "Sample Inspection" THEN
                          ERROR('You can not enter the rework quantity for sample inspection');

                        QualityAcceptanceLevels(QualityType :: "Accepted Under Deviation");
                        CalculateUndefinedQty;
                    end;
                }
                field("Qty. Rework";"Qty. Rework")
                {

                    trigger OnAssistEdit();
                    begin
                        IF "Trans. Order No." <> '' THEN
                          ERROR('You can not enter the rework quantity for sample inspection');
                        IF "Sample Inspection" THEN
                          ERROR('You can not enter the rework quantity for sample inspection');

                        QualityAcceptanceLevels(QualityType :: Rework);
                        CalculateUndefinedQty;
                    end;
                }
                field("Qty. Rejected";"Qty. Rejected")
                {

                    trigger OnAssistEdit();
                    begin
                        QualityAcceptanceLevels(QualityType :: Rejected);
                        CalculateUndefinedQty;
                    end;
                }
                field("Rejection Category";"Rejection Category")
                {
                }
                field(Flag;Flag)
                {
                }
                field("Location Code";"Location Code")
                {
                    Editable = false;
                }
                field("New Location Code";"New Location Code")
                {
                }
                field("Qty. Accepted UD Reason";"Qty. Accepted UD Reason")
                {
                }
                field("Reason Description";"Reason Description")
                {
                }
                field("Nature Of Rejection";"Nature Of Rejection")
                {
                }
                field("Rework Time( In Minutes)";"Rework Time( In Minutes)")
                {
                    Editable = ReworkTimeInMinutesEditable;
                }
                field("Rejection Reason";"Rejection Reason")
                {
                }
                field("MBB Status";"MBB Status")
                {
                    Visible = Visible_Bool;
                }
                field("HIC 60%";"HIC 60%")
                {
                    Visible = Visible_Bool;
                }
                field("HIC 10%";"HIC 10%")
                {
                    Visible = Visible_Bool;
                }
                field("HIC 5%";"HIC 5%")
                {
                    Visible = Visible_Bool;
                }
                field("MBB Packet Open DateTime";"MBB Packet Open DateTime")
                {
                    Visible = Visible_Bool;
                }
                field("MBB Packet Close DateTime";"MBB Packet Close DateTime")
                {
                    Visible = Visible_Bool;

                    trigger OnValidate();
                    begin
                        IF "MBB Packet Close DateTime" <> 0DT THEN
                        BEGIN
                          IF "MBB Packet Open DateTime" = 0DT THEN
                            ERROR('Please enter MBB Packet Open DateTime first!');
                          IF "MBB Packet Close DateTime"-"MBB Packet Open DateTime" <= 0 THEN
                            ERROR('MBB Packet Close Time must be >= MBB packet Open Time!');
                        END;
                    end;
                }
                field("Baked Hours";"Baked Hours")
                {
                    Visible = Visible_Bool;
                }
                field("MFD Date";"MFD Date")
                {
                    Visible = Visible_Bool;
                }
                field("Packed Date";"Packed Date")
                {
                    Caption = 'Manf. Packed Date';
                    Visible = Visible_Bool;
                }
                field("MBB Packed Date";"MBB Packed Date")
                {
                    Caption = 'MBB Packed Date after Baking';
                    Visible = Visible_Bool;
                }
                field("<Vendor No.2>";"Vendor No.")
                {
                    Editable = false;
                }
                field("<Vendor Name2>";"Vendor Name")
                {
                    Editable = false;
                }
                field("<Address2>";Address)
                {
                    Editable = false;
                }
                field("<Address 22>";"Address 2")
                {
                    Editable = false;
                }
                field("<Contact Person2>";"Contact Person")
                {
                    Editable = false;
                }
                field(Results;Results)
                {
                }
                field(Recommendations;Recommendations)
                {
                }
            }
            group(Calibration)
            {
                Caption = 'Calibration';
                field(Transfer_to_calibration;Transfer_to_calibration)
                {
                }
                field("Equp Type";"Equp Type")
                {
                    Caption = 'Equipment Type';
                }
                field("Equp Desc";"Equp Desc")
                {
                    Caption = '"Equipment Description

';
                }
                field("Eqpt. Serial No.";"Eqpt. Serial No.")
                {
                }
                field("Equipment Make";Make)
                {
                    Caption = 'Equipment Make';
                }
                field("Equp Model";"Equp Model")
                {
                    Caption = 'Equipment Model';
                }
                field("Calibration Type";"Calibration Party")
                {
                }
                field("Frequency of Calibration";"Calibration frequency")
                {
                    Caption = 'Frequency of Calibration';
                }
                field("Calibration Date";"Calibration Date")
                {
                }
                field("Next Calibration Date";"Next calib date")
                {
                }
            }
            group(Others)
            {
                Caption = 'Others';
                field("Item Category Code";"Item Category Code")
                {
                }
                field("Product Group Code";"Product Group Code")
                {
                }
                field("Item Sub Group Code";"Item Sub Group Code")
                {
                }
                field("Item Sub Sub Group Code";"Item Sub Sub Group Code")
                {
                }
                field("IDS creation Date";"IDS creation Date")
                {
                }
                field("No. of Opportunities";"No. of Opportunities")
                {
                }
                field("No.of Fixing Holes";"No.of Fixing Holes")
                {
                }
                field("No. of Soldering Points";"No. of Soldering Points")
                {
                }
                field("No. of Pins";"No. of Pins")
                {
                }
                field("OLD IDS";"OLD IDS")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Receipt")
            {
                Caption = '&Receipt';
                action("&Inspection Data Sheets")
                {
                    Caption = '&Inspection Data Sheets';
                    Image = Worksheet;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Inspection Data Sheet List";
                                    RunPageLink = Receipt No.=FIELD(Receipt No.),Order No.=FIELD(Order No.),Purch Line No=FIELD(Purch Line No),Lot No.=FIELD(Lot No.);
                }
                action("P&osted Inspect. Data Sheets")
                {
                    Caption = 'P&osted Inspect. Data Sheets';
                    Image = PostedTimeSheet;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Posted Inspect Data Sheet List";
                                    RunPageLink = Inspection Receipt No.=FIELD(No.);
                }
                separator("-----")
                {
                    Caption = '-----';
                }
                action("&Purchase Receipt")
                {
                    Caption = '&Purchase Receipt';
                    Image = Receipt;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Posted Purchase Receipt";
                                    RunPageLink = No.=FIELD(Receipt No.);
                }
                separator(Action1102152062)
                {
                }
                action(Accept)
                {
                    Caption = 'Accept';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        InspectionReceiptline.SETFILTER(InspectionReceiptline."Document No.","No.");
                        // InspectionReceiptline.SETFILTER(InspectionReceiptline."Character Code",'<>'' ''');
                         IF InspectionReceiptline.FINDSET THEN
                         REPEAT
                         InspectionReceiptline.Accept:=TRUE;
                        InspectionReceiptline.MODIFY;
                         UNTIL InspectionReceiptline.NEXT=0;
                         MESSAGE(FORMAT(InspectionReceiptline.COUNT));
                    end;
                }
            }
            group("&Item")
            {
                Caption = '&Item';
                action("Item &Tracking Lines")
                {
                    Caption = 'Item &Tracking Lines';
                    Image = ItemTrackingLines;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        IF NOT "Quality Before Receipt" THEN
                         ShowItemTrackingLines;
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action(Attachments)
                {
                    Caption = 'Attachments';
                    Image = Attachments;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        Attachment.RESET;
                        Attachment.SETRANGE("Table ID",DATABASE::"Inspection Receipt Header");
                        //Attachment.SETRANGE("Ids Reference No.","Ids Reference No.");
                        Attachment.SETRANGE("Document No.","No.");
                        //Attachment.SETRANGE("Document Type","Document Type");

                        PAGE.RUN(PAGE::"ESPL Attachments",Attachment);
                    end;
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                action("P&ost")
                {
                    Caption = 'P&ost';
                    Image = Post;
                    Promoted = true;
                    ShortCutKey = 'F9';

                    trigger OnAction();
                    var
                        MIH : Record "Material Issues Line";
                    begin
                          IF NOT (SMTP_MAIL.Permission_Checking(USERID,'IR-POSTING'))
                            THEN ERROR('YOU DONT HAVE RIGHTS TO POST THE INSPECTION RECEIPT');
                        
                        /*IF NOT (UPPERCASE(USERID) IN ['EFFTRONICS\ANILKUMAR','EFFTRONICS\BHARAT','EFFTRONICS\PRANAVI','EFFTRONICS\CHOWDARY','EFFTRONICS\DINEEL','EFFTRONICS\SHEKHAR']) THEN //Rev01
                          ERROR('YOU DONT HAVE RIGHTS TO POST THE INSPECTION RECEIPT');*/  //Rev01
                        
                        IF ("Qty. Rejected" >0 ) AND ("Rejection Reason"='') THEN
                          ERROR('Enter The Rejection Category and Rejection Reason');
                        
                        
                        IF NOT CONFIRM('Do you want to Post the Inspection Receipt?') THEN
                          EXIT;
                        
                        IF(Transfer_to_calibration = TRUE) THEN
                          BEGIN
                             Trasfer_To_calibration_module();
                          END;
                        //ELSE
                        //  MESSAGE('You are posting this IR with out transfering to Calibration');
                        // >>Added by Pranavi on 19-05-2017 for MSL process
                        IF item.GET("Item No.") THEN
                        BEGIN
                          IF (item.MSL <> 0) AND (item.MSL <> 1) THEN
                          BEGIN
                            IF "Qty. Accepted" <> 0 THEN
                            BEGIN
                              IF "MFD Date" = 0D THEN
                                ERROR('Please enter MFD Date!');
                              IF Rec."MBB Status" = 0 THEN
                                ERROR('Please enter MBB Status!');
                              IF ("HIC 5%" = 0) OR ("HIC 10%" = 0) OR ("HIC 60%" = 0) THEN
                                ERROR('Please enter HIC Color status!');
                              IF "MBB Packet Open DateTime" = 0DT THEN
                                ERROR('Please enter MBB Packet Open DateTime!');
                              IF "MBB Packet Close DateTime" = 0DT THEN
                                ERROR('Please enter MBB Packet Close DateTime!');
                              IF "MBB Packet Close DateTime"-"MBB Packet Open DateTime" <= 0 THEN
                                ERROR('MBB Packet Close Time must be >= MBB packet Open Time!');
                              IF (Rec."MBB Status" = "MBB Status"::Damage) AND ("MBB Packed Date" = 0D) THEN
                                ERROR('Please enter MBB packed date as MBB is damaged!');
                              IF (item.MSL <> 0) AND (item."Floor Life at 25 C 40% RH" IN['',' ']) THEN
                              BEGIN
                                TEMCMail.TEMC_MSLMail(item."No.");
                                ERROR('Floor Life in Item card is not defined! Please contact TEMC!');
                              END;
                              IF (item.MSL IN [item.MSL::"2"]) AND ("HIC 60%" <> "HIC 60%"::Blue) AND (item."Floor Life at 25 C 40% RH" <> 'INFINITE') THEN
                              BEGIN
                                IF ("Baked Hours" <= 0) THEN
                                  ERROR('Please enter baking hours!');
                                IF ("Baked Hours" <> "Bake Hours") AND ("Bake Hours" <> 0) THEN
                                  ERROR('Baked Hours must equal to Bake hours defined in Item card : %1!',item."Bake Hours");
                                IF "MBB Packed Date" = 0D THEN
                                  ERROR('Please enter New MBB Packed Date!');
                              END;
                              IF (item.MSL IN [item.MSL::"2A",item.MSL::"3",item.MSL::"4",item.MSL::"5",item.MSL::"5A"]) AND (item."Floor Life at 25 C 40% RH" <> 'INFINITE')
                                AND ("HIC 10%" <> "HIC 10%"::Blue) AND ("HIC 5%" <> "HIC 5%"::Pink) THEN
                              BEGIN
                                IF ("Baked Hours" <= 0) THEN
                                  ERROR('Please enter baking hours!');
                                IF ("Baked Hours" <> "Bake Hours") AND ("Bake Hours" <> 0) THEN
                                  ERROR('Baked Hours must equal to Bake hours defined in Item card : %1!',item."Bake Hours");
                                IF "MBB Packed Date" = 0D THEN
                                  ERROR('Please enter New MBB Packed Date!');
                              END;
                            END;
                          END;
                        END;
                        // <<Added by Pranavi on 19-05-2017 for MSL process
                        
                        IF "Source Type" = "Source Type" :: Calibration THEN
                        BEGIN
                          Calibration.SETRANGE("Equipment No","Item No.");
                          IF Calibration.FINDFIRST THEN
                          BEGIN
                            Calibration."Current Status" := Calibration."Current Status" :: Calibrated;
                            Calibration.Results := Results;
                            Calibration.Recommendations := Recommendations;
                            Calibration.Status := "Calibration Status";
                            Calibration."Last Calibration Date" := WORKDATE;
                            IF Calibration."Calibration Party" = Calibration."Calibration Party" :: "External Calibration" THEN
                              Calibration."Calibration Cert No./ IR No" := "No.";
                            Calibration.MODIFY;
                          END;
                          Status := TRUE;
                          CurrPage.SAVERECORD;
                          MESSAGE(Text001,"No.");
                          CurrPage.UPDATE(TRUE);
                        END ELSE
                        BEGIN   // begin of if source type is not calibration
                          IF "Trans. Order No." <> '' THEN
                            InspectJnlLine.TransferOrderIRPost(Rec)
                          //   UpdateQCCheck(Rec)
                          ELSE
                          BEGIN
                            CancelReservation(Rec);
                            InspectJnlLine.RUN(Rec);
                            UpdateQCCheck(Rec);
                          END;
                          Status := TRUE;
                          CurrPage.SAVERECORD;
                          Status := TRUE;
                          CurrPage.SAVERECORD;
                          //***********************Mail Code for Inwards Rejection****************(swarupa)
                          /*
                        
                          nextline:=10;
                          Mail_Body:='';
                          "to mail":='';
                          "total price":=0;
                          "acc amt":=0;
                          "rej amt":=0;
                          IF "Qty. Rejected"<>0 THEN
                          BEGIN
                            Mail_Subject:='ERP- '+'Inward Rejected for Item : '+"Item Description";
                            ITEM_LEAD_TIME:='';
                            ITEM_STOCK:=0;
                            item.SETRANGE(item."No.","Item No.");
                            IF item.FINDFIRST THEN
                            BEGIN
                              ITEM_LEAD_TIME:=FORMAT(item."Safety Lead Time");
                              IF item."Avg Unit Cost"<>0 THEN
                              BEGIN
                                "total price":=ROUND(item."Avg Unit Cost"*Quantity,1);
                                "acc amt":=ROUND(item."Avg Unit Cost"*"Qty. Accepted",1);
                                "rej amt":=ROUND(item."Avg Unit Cost"*"Qty. Rejected",1);
                              END;
                            END ELSE
                            BEGIN
                              PRL.SETRANGE(PRL."Document No.","Receipt No.");
                              PRL.SETRANGE(PRL."No.","Item No.");
                              IF PRL.FINDFIRST THEN
                              BEGIN
                                "total price":=ROUND(PRL.Quantity*PRL."Unit Cost",1);
                                "acc amt":=ROUND(PRL."Unit Cost"*"Qty. Accepted",1);
                                "rej amt":=ROUND(PRL."Unit Cost"*"Qty. Rejected",1);
                              END;
                            END;
                        
                            Mail_Body:='REJECTED ITEM DETAILS :';
                            Mail_Body+=FORMAT(nextline);
                            Mail_Body+=FORMAT(nextline);
                            Mail_Body+='Vendor Name                  : '+"Vendor Name";
                            Mail_Body+=FORMAT(nextline);
                            vend.SETRANGE(vend."No.","Vendor No.");
                            IF vend.FINDFIRST THEN
                            Mail_Body+='Item No.                     : '+"Item No.";
                            Mail_Body+=FORMAT(nextline);
                            Mail_Body+='Item Description             : '+"Item Description";
                            Mail_Body+=FORMAT(nextline);
                            Mail_Body+='Location Code                : '+"Location Code";
                            Mail_Body+=FORMAT(nextline);
                            Mail_Body+='Make                         : '+Make;
                            Mail_Body+=FORMAT(nextline);
                        
                            Mail_Body+='Accepted Quantity            : '+FORMAT("Qty. Accepted");
                            Mail_Body+=FORMAT(nextline);
                            Mail_Body+='Rejected Quantity            : '+FORMAT("Qty. Rejected");
                            Mail_Body+=FORMAT(nextline);
                        //    Mail_Body+='Total Quantity          : '+FORMAT(Quantity);
                        //    Mail_Body+=FORMAT(nextline);
                            ids.SETRANGE(ids."No.","Parent IDS");
                            IF ids.FINDFIRST THEN   BEGIN
                              inwqty:=ids.Quantity;
                              IF Quantity < inwqty THEN BEGIN
                                Mail_Body+='Total Quantity Checked at QC : '+FORMAT(Quantity);
                                Mail_Body+=FORMAT(nextline);
                              END
                              ELSE BEGIN
                                Mail_Body+='Total Quantity               : '+FORMAT(Quantity);
                                Mail_Body+=FORMAT(nextline);
                              END;
                              Mail_Body+='Inward Quantity              : '+FORMAT(inwqty);
                              Mail_Body+=FORMAT(nextline);
                            END
                            ELSE IF inwqty=0 THEN
                            BEGIN
                              postedids.SETRANGE(postedids."No.","Parent IDS");
                              IF postedids.FINDFIRST THEN
                              BEGIN
                                inwqty:=postedids.Quantity;
                                IF Quantity < inwqty THEN BEGIN
                                  Mail_Body+='Total Quantity Checked at QC : '+FORMAT(Quantity);
                                  Mail_Body+=FORMAT(nextline);
                                END
                                ELSE BEGIN
                                  Mail_Body+='Total Quantity               : '+FORMAT(Quantity);
                                  Mail_Body+=FORMAT(nextline);
                                END;
                                Mail_Body+='Inward Quantity              : '+FORMAT(inwqty);
                                Mail_Body+=FORMAT(nextline);
                              END;
                            END
                            ELSE BEGIN
                              Mail_Body+='Total Quantity               : '+FORMAT(Quantity);
                              Mail_Body+=FORMAT(nextline);
                              Mail_Body+='Inward Quantity              : '+FORMAT(Quantity);
                              Mail_Body+=FORMAT(nextline);
                            END;
                            accper:=ROUND((("Qty. Accepted"/Quantity)*100),0.01);
                            Mail_Body+='Accepted %                   : '+FORMAT(accper)+'%';
                            Mail_Body+=FORMAT(nextline);
                            rejper:=ROUND((("Qty. Rejected"/Quantity)*100),0.01);
                            Mail_Body+='Rejected %                   : '+FORMAT(rejper)+'%';
                            Mail_Body+=FORMAT(nextline);
                            Mail_Body+='Accepted Quantity price      : '+FORMAT("acc amt");
                            Mail_Body+=FORMAT(nextline);
                            Mail_Body+='Rejected Quantity Price      : '+FORMAT("rej amt");
                            Mail_Body+=FORMAT(nextline);
                            Mail_Body+='Total Quantity Price         : '+FORMAT("total price");
                            Mail_Body+=FORMAT(nextline);
                            IF "Nature Of Rejection"='' THEN
                              ERROR('Please update Nature of Rejection');
                            Mail_Body+='Rejected Category            : '+"Nature Of Rejection";
                            Mail_Body+=FORMAT(nextline);
                            Mail_Body+='Reason Description           : '+"Reason Description";
                            Mail_Body+=FORMAT(nextline);
                            Mail_Body+='Inward Date                  : '+FORMAT(("IDS creation Date"),0,4);
                            Mail_Body+=FORMAT(nextline);
                            user.SETRANGE(user."User Name",USERID);
                            IF user.FINDFIRST THEN
                              "user name":=user."User Name";
                            Mail_Body+='QC Passed By                 : '+"user name";
                            Mail_Body+=FORMAT(nextline);
                            "Mail-Id".SETRANGE("Mail-Id"."User Name",USERID);
                            IF "Mail-Id".FINDFIRST THEN
                               "from Mail":="Mail-Id".MailID;
                            "from Mail":='erp@efftronics.com';
                            "to mail"+='purchase@efftronics.com,padmasri@efftronics.com,bharat@efftronics.com,erp@efftronics.com';
                            "to mail"+=',padmaja@efftronics.com';
                            "to mail"+=',qainward@efftronics.com';
                            item.SETRANGE(item."No.","Item No.");
                            IF item.FINDFIRST THEN
                            BEGIN
                              IF item."Item Category Code"='MECH' THEN
                                 "to mail"+=',ubedulla@efftronics.com';
                              IF item."Product Group Code"='B OUT' THEN
                              BEGIN
                                PH.RESET;
                                PH.SETFILTER(PH."No.","Order No.");
                                PH.SETFILTER(PH."Sale Order No",'<>%1','');
                                IF PH.FINDFIRST THEN
                                 "to mail"+=',pmsubhani@efftronics.com';
                              END;
                            END;
                          //    "to mail":='santhoshk@efftronics.com';
                            PL.SETRANGE(PL."Document No.","Order No.");
                            PL.SETRANGE(PL."No.","Item No.");
                            IF PL.FINDFIRST THEN
                            BEGIN
                              IH.SETRANGE(IH."No.",PL."Indent No.");
                              "Mail-Id".RESET;
                              IF IH.FINDFIRST THEN
                              BEGIN
                                "Mail-Id".SETRANGE("Mail-Id"."User Name",IH."Person Code");
                                IF "Mail-Id".FINDFIRST THEN
                                BEGIN
                                  Mail_Body+='Indented By             : '+"Mail-Id"."User Name";
                                  Mail_Body+=FORMAT(nextline);
                                  "to mail"+=','+"Mail-Id".MailID;
                                END;
                               // IF IH."Delivery Location"='R&D STR' THEN
                               //    "to mail"+=',mary@efftronics.com';
                               // IF IH."Delivery Location"='CS STR' THEN
                               //   "to mail"+=',nayomi@efftronics.com';
                              END;
                            END;
                            //Mail_Body+=FORMAT(nextline);
                            PRH.SETRANGE(PRH."No.","Receipt No.");
                            IF PRH.FINDFIRST THEN
                            Mail_Body+='Invoice No.                  : '+PRH."Vendor Order No.";
                            Mail_Body+=FORMAT(nextline);
                            Mail_Body+='DC No.                       : '+PRH."Vendor Shipment No.";
                            Mail_Body+=FORMAT(nextline);
                            Mail_Body+='Batch No                     : '+"Lot No.";
                            Mail_Body+=FORMAT(nextline);
                            Mail_Body+=FORMAT(nextline);
                            Mail_Body+=FORMAT(nextline);
                            Mail_Body+='***** Auto Mail Generated from ERP *****';
                          //  MESSAGE("to mail"+'dir@efftronics.com,ceo@efftronics.com');
                            "to mail"+=',Temc@efftronics.com';
                            IF ("rej amt">10000)OR(rejper>10) THEN
                               "to mail"+=',ceo@efftronics.com';
                        
                            IF ("from Mail"<>'')AND("to mail"<>'') THEN
                            BEGIN
                              SMTP_MAIL.CreateMessage('QC INWARD',"from Mail","to mail",Mail_Subject,Mail_Body,FALSE);
                              IF ("Location Code"='STR') AND ("Qty. Rejected">0) THEN
                              BEGIN
                                PROD_ORDER_COMPONENT.RESET;
                                PROD_ORDER_COMPONENT.SETCURRENTKEY("Production Plan Date",
                                                                   "Item No.",
                                                                   "Prod. Order No.");
                                PROD_ORDER_COMPONENT.SETFILTER("Production Plan Date",'>%1',TODAY);
                                PROD_ORDER_COMPONENT.SETRANGE(PROD_ORDER_COMPONENT."Item No.","Item No.");
                                PROD_ORDER_COMPONENT.CALCSUMS(PROD_ORDER_COMPONENT."Expected Quantity");
                                IF (PROD_ORDER_COMPONENT."Expected Quantity")>(ITEM_STOCK+"Qty. Accepted")  THEN
                                BEGIN
                                  QC_SETUP.GET;
                                  QC_SETUP."Rejected IR No.":="No.";
                                  QC_SETUP.MODIFY;
                                  IF IRH.GET("No.") THEN
                                  BEGIN
                                 //ANIL
                                 {  REPORT.RUN(50043,FALSE,FALSE,IRH);
                                    //Rev01 Start
                                    //Code Commented
                                    {
                                    //REPORT.SAVEASHTML(50043,'\\Erpserver\ErpAttachments\QC_REJECTCION.HTML',FALSE,IRH);
                                    }
                                    REPORT.SAVEASPDF(50043,'\\Erpserver\ErpAttachments\QC_REJECTCION.PDF',IRH);
                                    //Rev01 End
                                    SMTP_MAIL.AddAttachment('\\Erpserver\ErpAttachments\QC_REJECTCION.PDF');      }
                                  END;
                                END;
                              END;
                              IF "Rejection Category" IN [3,4,6] THEN
                              BEGIN
                                Fname:='\\Erpserver\ErpAttachments\' +"No."+'.JPG';
                                IF EXISTS(Fname) THEN
                                  SMTP_MAIL.AddAttachment(Fname)
                                ELSE
                                  ERROR('Please attach Photo');
                              END;
                              SMTP_MAIL.Send;
                            // mail.NewCDOMessage("from Mail","to mail",Mail_Subject,Mail_Body,'');
                            END;
                          END;          */
                           //old code
                          nextline:=10;
                          // Mail_Body:='';
                          // "to mail":='';
                          "total price":=0;
                          "acc amt":=0;
                          "rej amt":=0;
                          IF "Qty. Rejected"<>0 THEN
                          BEGIN
                            Mail_Subject:='ERP- '+'Inward Rejected for Item : '+"Item Description";
                            ITEM_LEAD_TIME:='';
                            ITEM_STOCK:=0;
                            item.SETRANGE(item."No.","Item No.");
                            IF item.FINDFIRST THEN
                            BEGIN
                              ITEM_LEAD_TIME:=FORMAT(item."Safety Lead Time");
                              IF item."Avg Unit Cost"<>0 THEN
                              BEGIN
                                "total price":=ROUND(item."Avg Unit Cost"*Quantity,1);
                                "acc amt":=ROUND(item."Avg Unit Cost"*"Qty. Accepted",1);
                                "rej amt":=ROUND(item."Avg Unit Cost"*"Qty. Rejected",1);
                              END;
                            END ELSE
                            BEGIN
                              PRL.SETRANGE(PRL."Document No.","Receipt No.");
                              PRL.SETRANGE(PRL."No.","Item No.");
                              IF PRL.FINDFIRST THEN
                              BEGIN
                                "total price":=ROUND(PRL.Quantity*PRL."Unit Cost",1);
                                "acc amt":=ROUND(PRL."Unit Cost"*"Qty. Accepted",1);
                                "rej amt":=ROUND(PRL."Unit Cost"*"Qty. Rejected",1);
                              END;
                            END;
                            "Mail-Id".SETRANGE("Mail-Id"."User Name",USERID);
                            IF "Mail-Id".FINDFIRST THEN
                              "from Mail":="Mail-Id".MailID;
                            "from Mail":='erp@efftronics.com';
                            "to mail"+='purchase@efftronics.com,padmasri@efftronics.com,bharat@efftronics.com,dineel@efftronics.com,erp@efftronics.com,vijayalakshmib@efftronics.com';
                            "to mail"+=',padmaja@efftronics.com';
                            "to mail"+=',qainward@efftronics.com';
                            "to mail"+=',Temc@efftronics.com';
                            "to mail"+=',store@efftronics.com';
                            "to mail"+=',pardhu@efftronics.com';
                        
                            item.SETRANGE(item."No.","Item No.");
                            IF item.FINDFIRST THEN
                            BEGIN
                              IF item."Item Category Code"='MECH' THEN
                                "to mail"+=',ubedulla@efftronics.com';
                              IF item."Product Group Code"='B OUT' THEN
                              BEGIN
                                PH.RESET;
                                PH.SETFILTER(PH."No.","Order No.");
                                PH.SETFILTER(PH."Sale Order No",'<>%1','');
                                IF PH.FINDFIRST THEN
                                  "to mail"+=',pmsubhani@efftronics.com';
                              END;
                            END;
                        
                        
                            accper:=ROUND((("Qty. Accepted"/Quantity)*100),0.01);
                            rejper:=ROUND((("Qty. Rejected"/Quantity)*100),0.01);
                            IF ("rej amt">10000)OR(rejper>10) THEN
                              "to mail"+=',ceo@efftronics.com';
                        
                            PL.SETRANGE(PL."Document No.","Order No.");
                            PL.SETRANGE(PL."No.","Item No.");
                            IF PL.FINDFIRST THEN
                            BEGIN
                              IH.SETRANGE(IH."No.",PL."Indent No.");
                              "Mail-Id".RESET;
                              IF IH.FINDFIRST THEN
                              BEGIN
                                "Mail-Id".SETRANGE("Mail-Id"."User Name",IH."Person Code");
                                IF "Mail-Id".FINDFIRST THEN
                                BEGIN
                                 // QCMail.AppendBody('<tr><td><b>Indented By</b></td><td> '+"Mail-Id"."User Name"+'</td></tr>');
                                  IF "Mail-Id".MailID<>'' THEN        //added by pranavi on 23-04-2015 to check user has mail ID
                                    "to mail"+=','+"Mail-Id".MailID;
                                END;
                              END;
                            END;
                        
                        
                            //************************************new format of mail*********************************************//
                            QCMail.CreateMessage('EFF',"from Mail","to mail",Mail_Subject,Mail_Body,TRUE);
                            QCMail.AppendBody('<html><head><style> divone{background-color: white; width: 700px; padding: 20px; border-style:solid ; border-color:#666699;  margin: 20px;} </style></head>');
                            QCMail.AppendBody('<body><div style="border-color:#025E4D;  margin: 20px; border-width:15px;   border-style:solid; padding: 20px; width: 600px;"><label><font size="6"> REJECTED ITEM DETAILS </font></label>');
                            QCMail.AppendBody('<hr style=solid; color= #3333CC>');
                            QCMail.AppendBody('<h>Dear Sir/Madam,</h><br>');
                            QCMail.AppendBody('<P>REJECTED ITEM DETAILS </P>');
                            QCMail.AppendBody('<table border="1" style="border-collapse:collapse; width:100%; font-size:10pt;">');
                            QCMail.AppendBody('<tr><td width= "40%"><b>Vendor Name  </b> </td><td>'+"Vendor Name"+'</td></tr> ');
                            QCMail.AppendBody('<tr><td ><b>Item no. </b></td><td>'+"Item No."+'</td></tr> ');
                            QCMail.AppendBody('<tr><td ><b>Item Description </b></td><td>'+"Item Description"+'</td></tr> ');
                            QCMail.AppendBody('<tr><td ><b>Location Code </b></td><td>'+"Location Code"+'</td></tr> ');
                            QCMail.AppendBody('<tr><td><b> Make</b></td><td>'+Make+'</td></tr>');
                            QCMail.AppendBody('<tr><td><b> Accepted Quantity </b></td><td>'+FORMAT("Qty. Accepted")+'</td></tr>');
                            QCMail.AppendBody('<tr><td><b> Rejected Quantity  </b></td><td>'+FORMAT("Qty. Rejected")+'</td></tr>');
                               //added by sujani for the Rejection note
                              IRH1.RESET;
                              IRH1.SETFILTER("No.",Rec."No.");
                              IF IRH1.FINDSET THEN
                              BEGIN
                        
                              FileDirectory := '\\erpserver\ErpAttachments\QC_Rejection_Note\';
                              //FileName:=IRH."No.");
                              //filesub:=COPYSTR("No.",5,5);
                              FileName_rej :='QC Rejection Note '+IRH1."No."+ '.pdf';
                              REPORT.RUN(32000006,FALSE,FALSE,IRH1);
                              REPORT.SAVEASPDF(32000006,FileDirectory+FileName_rej,IRH1);
                              QC_ATCH:=FileDirectory+FileName_rej;
                              QCMail.AddAttachment(QC_ATCH,FileName_rej);
                              END;
                        
                        
                            ids.SETRANGE(ids."No.","Parent IDS");
                            IF ids.FINDFIRST THEN   BEGIN
                              inwqty:=ids.Quantity;
                              IF Quantity < inwqty THEN BEGIN
                                QCMail.AppendBody('<tr><td><b>Total Quantity Checked at QC</b></td><td>'+FORMAT(Quantity)+'</td></tr>');
                                 //  Mail_Body+=FORMAT(nextline);
                              END
                              ELSE BEGIN
                                QCMail.AppendBody('<tr><td><b>Total Quantity </b></td><td>'+FORMAT(Quantity)+'</td></tr>') ;
                                Mail_Body+=FORMAT(nextline);
                                QCMail.AppendBody('<tr><td><b>Inward Quantity </b></td><td>'+FORMAT(inwqty)+'</td></tr>');
                              END;
                             // Mail_Body+=FORMAT(nextline);
                            END
                            ELSE IF inwqty=0 THEN
                            BEGIN
                              postedids.SETRANGE(postedids."No.","Parent IDS");
                              IF postedids.FINDFIRST THEN
                              BEGIN
                                inwqty:=postedids.Quantity;
                                IF Quantity < inwqty THEN BEGIN
                                  QCMail.AppendBody('<tr><td><b>Total Quantity Checked at QC</b></td><td>'+FORMAT(Quantity)+'</td></tr>');
                                 // Mail_Body+=FORMAT(nextline);
                                END
                                ELSE BEGIN
                                  QCMail.AppendBody('<tr><td><b>Total Quantity </b></td><td>'+FORMAT(Quantity)+'</td></tr>');
                                  // Mail_Body+=FORMAT(nextline);
                                END;
                                QCMail.AppendBody('<tr><td><b>Inward Quantity </b></td><td>'+FORMAT(inwqty)+'</td></tr>');
                              END;
                            END
                            ELSE BEGIN
                              QCMail.AppendBody('<tr><td><b> Total Quantity </b></td><td>'+FORMAT(Quantity)+'</td></tr>');
                              QCMail.AppendBody('<tr><td><b> Inward Quantity </b></td><td>'+FORMAT(inwqty)+'</td></tr>');
                            END;
                                 // ADDED BY VISHNU PRIYA ON 17-03-2020
                            PARENT_IDS_QTY := 0;
                            PIDSH.RESET;
                            IF Rec."Parent IDS" <> '' THEN
                            BEGIN
                              PIDSH.SETFILTER("No.","Parent IDS");
                              IF PIDSH.FINDFIRST THEN
                                PARENT_IDS_QTY := PIDSH."Quantity(Base)"
                          //ADDED BY VISHNU PRIYA ON 27-08-2020
                              ELSE
                                BEGIN
                                ids.RESET;
                                ids.SETFILTER("No.",Rec."Parent IDS");
                                IF ids.FINDFIRST THEN
                                  PARENT_IDS_QTY := ids.Quantity;
                                END;
                          //ADDED BY VISHNU PRIYA ON 27-08-2020
                           END
                           ELSE
                            PARENT_IDS_QTY := Rec.Quantity;
                              accper:=ROUND((("Qty. Accepted"/PARENT_IDS_QTY)*100),0.01);
                              rejper:=ROUND((("Qty. Rejected"/PARENT_IDS_QTY)*100),0.01);
                        // ADDED BY VISHNU PRIYA ON 17-03-2020
                           // accper:=ROUND((("Qty. Accepted"/Quantity)*100),0.01); commented by vishnupriya on 17-03-2020
                            QCMail.AppendBody('<tr><td><b> Accepted % </b></td><td><div style="width:' +FORMAT(accper)+'; background: rgb(128, 177, 133); overflow:visible;">'+FORMAT(accper)+'%</div></td></tr>');
                           // rejper:=ROUND((("Qty. Rejected"/Quantity)*100),0.01); commented by vishnupriya on 17-03-2020
                            QCMail.AppendBody('<tr><td><b> Rejected % </b></td><td>'+FORMAT(rejper)+'%</td></tr>');
                            QCMail.AppendBody('<tr><td><b> Accepted Quantity price  </b></td><td>'+FORMAT("acc amt")+'</td></tr>');
                            QCMail.AppendBody('<tr><td><b> Rejected Quantity Price  </b></td><td>'+FORMAT("rej amt")+'</td></tr>');
                            QCMail.AppendBody('<tr><td><b> Total Quantity Price </b></td><td>'+FORMAT("total price")+'</td></tr>');
                            IF "Nature Of Rejection"='' THEN
                              ERROR('Please update Nature of Rejection');
                            QCMail.AppendBody('<tr><td><b> Rejected Category    </b></td><td>'+"Nature Of Rejection"+'</td></tr>');
                            QCMail.AppendBody('<tr><td><b>Reason Description </b></td><td>'+"Reason Description"+'</td></tr>');
                            QCMail.AppendBody('<tr><td><b>Inward Date </b></td><td>'+FORMAT(("IDS creation Date"),0,4)+'</td></tr>');
                            PRH.SETRANGE(PRH."No.","Receipt No.");
                            IF PRH.FINDFIRST THEN
                              QCMail.AppendBody('<tr><td><b>Invoice No.  </b></td><td> '+PRH."Vendor Order No."+'</td></tr>');;
                            Mail_Body+=FORMAT(nextline);
                            QCMail.AppendBody('<tr><td><b>DC No.</b></td><td>  '+PRH."Vendor Shipment No."+'</td></tr>');
                            Mail_Body+=FORMAT(nextline);
                            QCMail.AppendBody('<tr><td><b>Batch No</b></td><td>'+"Lot No."+'</td></tr>');
                            // Mail_Body+='***** Auto Mail Generated from ERP *****';
                            "to mail"+=',Temc@efftronics.com';
                            user.SETRANGE(user."User Name",USERID);
                            IF user.FINDFIRST THEN
                              "user name":=user."User Name";
                            QCMail.AppendBody('<tr><td><b>QC Passed By    </b></td><td>'+"user name"+'</td></tr>');
                            QCMail.AppendBody('<tr><td><b>Purch Order No. </b></td><td>'+"Order No."+'</td></tr>');
                        
                            PL.SETRANGE(PL."Document No.","Order No.");
                            PL.SETRANGE(PL."No.","Item No.");
                            IF PL.FINDFIRST THEN
                            BEGIN
                              IH.SETRANGE(IH."No.",PL."Indent No.");
                              "Mail-Id".RESET;
                              IF IH.FINDFIRST THEN
                              BEGIN
                                "Mail-Id".SETRANGE("Mail-Id"."User Name",IH."Person Code");
                                IF "Mail-Id".FINDFIRST THEN
                                BEGIN
                                  QCMail.AppendBody('<tr><td><b>Indented By</b></td><td> '+"Mail-Id"."User Name"+'</td></tr>');
                                  IF "Mail-Id".MailID<>'' THEN
                                   "to mail"+=','+"Mail-Id".MailID;
                                END;
                              END;
                            END;
                            QCMail.AppendBody('</table>');
                            QCMail.AppendBody('<BR><p align ="left"> Regards,<br>ERP Team </p>');
                            QCMail.AppendBody('<br><p align = "center">::::Note: Auto Generated mail from ERP:::: </b></P></div></body></html>');
                        
                            IF ("from Mail"<>'')AND("to mail"<>'') THEN
                            BEGIN
                              //QCMAIL.CreateMessage('QC INWARD',"from Mail","to mail",Mail_Subject,Mail_Body,FALSE);
                              IF ("Location Code"='STR') AND ("Qty. Rejected">0) THEN
                              BEGIN
                                PROD_ORDER_COMPONENT.RESET;
                                PROD_ORDER_COMPONENT.SETCURRENTKEY("Production Plan Date",
                                                                   "Item No.",
                                                                   "Prod. Order No.");
                                PROD_ORDER_COMPONENT.SETFILTER("Production Plan Date",'>%1',TODAY);
                                PROD_ORDER_COMPONENT.SETRANGE(PROD_ORDER_COMPONENT."Item No.","Item No.");
                                PROD_ORDER_COMPONENT.CALCSUMS(PROD_ORDER_COMPONENT."Expected Quantity");
                                IF (PROD_ORDER_COMPONENT."Expected Quantity")>(ITEM_STOCK+"Qty. Accepted")  THEN
                                BEGIN
                                  QC_SETUP.GET;
                                  QC_SETUP."Rejected IR No.":="No.";
                                  QC_SETUP.MODIFY;
                                  IF IRH.GET("No.") THEN
                                  BEGIN
                                  END;
                                END;
                              END;
                              IF "Rejection Category" IN [3,4,6] THEN
                              BEGIN
                                Fname:='\\Erpserver\ErpAttachments\' +"No."+'.JPG';
                                TempFileName := '';//EFFUPG
                                IF EXISTS(Fname) THEN
                                  QCMail.AddAttachment(Fname,TempFileName)//EFFUPG
                                ELSE
                                  ERROR('Please attach Photo');
                              END;
                        
                        
                             // To_Mail := "to mail"
                              QCMail.Send;
                              //  mail.NewCDOMessage("from Mail","to mail",Mail_Subject,Mail_Body,'');
                            END;
                            CreateIndent;   // Added by Pranavi on 20-Aug-2016 for Auto Indent Creation for Rejected Qty
                          END;  // END OF Qty.Rejected <> 0
                        
                          // mails for Qty Under Deviation added by vishnu on 30-03-2019
                        
                          IF ( "Qty. Accepted Under Deviation" >0) THEN
                            //UnderDeviationMails;
                        
                        
                          //Mail For Accepted Item
                        
                          IF (Quantity="Qty. Accepted")THEN
                          BEGIN   // QTY = QTY ACCPTED BEGIN
                            /*//***********new mail format *********** added by ahmed
                            Mail_Body+=FORMAT(nextline);
                            "Mail-Id".SETRANGE("Mail-Id"."User Name",USERID);
                            IF "Mail-Id".FINDFIRST THEN
                                "from Mail":="Mail-Id".MailID;
                                 Mail_Subject:="Item Description"+' Item QC Passed';
                                 QCMail.CreateMessage('QC INWARD',"from Mail","to mail",Mail_Subject,Mail_Body,FALSE);
                                 QCMail.AppendBody('<table border="1" style="border-collapse:collapse; width:100%; font-size:10pt;">');
                                 QCMail.AppendBody('<tr><td width= "40%"><b>Vendor Name  </b> </td><td>'+"Vendor Name"+'</td></tr> ');
                                 QCMail.AppendBody('<tr><td ><b>Item no. </b></td><td>'+"Item No."+'</td></tr> ');
                                 QCMail.AppendBody('<tr><td ><b>Item Description </b></td><td>'+"Item Description"+'</td></tr> ');
                                 QCMail.AppendBody('<tr><td ><b>Location Code </b></td><td>'+"Location Code"+'</td></tr> ');
                                 QCMail.AppendBody('<tr><td ><b>Accepted Quantity </b></td><td>'+FORMAT("Qty. Accepted")+'</td></tr> ');
                                 QCMail.AppendBody('<tr><td ><b>Inward Date  </b></td><td>'+FORMAT(("IDS creation Date"),0,4)+'</td></tr> ');
                                 QCMail.AppendBody('<tr><td ><b>Item Lead Time  </b></td><td></table>'+FORMAT(("IDS creation Date"),0,4)+'</td></tr></table><br><br>');
                                 QCMail.AppendBody('<BR><p align ="left"> Regards,<br>ERP Team </p>');
                                 QCMail.AppendBody('<br><p align = "center">::::Note: Auto Generated mail from ERP:::: </b></P></div></body></html>');
                            */
                            Mail_Body:='';
                            Mail_Body+=FORMAT(nextline);
                            Mail_Body+=FORMAT(nextline);
                            Mail_Body+='Vendor Name             : '+"Vendor Name";
                            Mail_Body+=FORMAT(nextline);
                            Mail_Body+='Item Description        : '+"Item Description";
                            Mail_Body+=FORMAT(nextline);
                            Mail_Body+='Location Code           : '+"Location Code";
                            Mail_Body+=FORMAT(nextline);
                            Mail_Body+='Accepted Quantity       : '+FORMAT("Qty. Accepted");
                            Mail_Body+=FORMAT(nextline);
                            Mail_Body+='Inward Date             : '+FORMAT(("IDS creation Date"),0,4);
                            Mail_Body+=FORMAT(nextline);
                            Mail_Body+='Item Lead Time          : '+FORMAT(("IDS creation Date"),0,4);
                        
                            Mail_Body+=FORMAT(nextline);
                            "Mail-Id".SETRANGE("Mail-Id"."User Name",USERID);
                            IF "Mail-Id".FINDFIRST THEN
                              "from Mail":="Mail-Id".MailID;
                            Mail_Subject:="Item Description"+' Item QC Passed';
                            Mail_Body+=FORMAT(nextline);
                            Mail_Body+=FORMAT(nextline);
                            Mail_Body+='***** Auto Mail Generated from ERP *****';
                            // "to mail":=',padmaja@efftronics.com';
                            IF ("from Mail"<>'')AND("to mail"<>'') THEN
                            BEGIN
                              SMTP_MAIL.CreateMessage('QC INWARD',"from Mail","to mail",Mail_Subject,Mail_Body,FALSE);
                              // SMTP_MAIL.Send;   anil assigned
                        
                              // mail.NewCDOMessage("from Mail","to mail",Mail_Subject,Mail_Body,'');  //cometed by anil
                            END;
                        
                            // Mail For QC Passing For R&D Items
                            IF ("Location Code"='STR')    THEN // commented by vijaya on 28-07-2018 for all memebers to provide status of the requested Item
                            BEGIN   // LOCAION CODE R&D STR BEING
                              "from Mail":='';
                              "to mail":='';
                              Mail_Subject:='';
                              Mail_Body:='';
                        
                              PRL.RESET;
                              PRL.SETRANGE(PRL."Document No.","Receipt No.");
                              PRL.SETRANGE(PRL."Line No.","Purch Line No");
                              IF PRL.FINDFIRST THEN
                              BEGIN     // PRL BEIGN
                                IH.RESET;
                                IH.SETRANGE(IH."No.",PRL."Indent No.");
                                IF IH.FINDFIRST THEN
                                BEGIN     // IH BEGIN
                                  Mail_Subject:='ERP- YOUR INDENTED ITEM ('+FORMAT("Item Description")+') HAS BEEN QC PASSED';
                                  //Mail_Subject:='YOUR INDENTED ITEM  HAS BEEN QC PASSED ';
                                  //Mail_Subject:='YOUR INDENTED ITEM ('+FORMAT("Item Description")+') FOR "'+FORMAT(IH."Production Order Description") +'" HAS BEEN QC PASSED ';
                                  nextline:=10;
                                  Mail_Body+=FORMAT(nextline);
                                  Mail_Body+=FORMAT(nextline);
                        
                                  Mail_Body+='QC PASSED DATE & TIME   : '+FORMAT((TODAY),0,4)+FORMAT(TIME);
                                  Mail_Body+=FORMAT(nextline);
                        
                                  Mail_Body+='Indent No.              : '+IH."No.";
                                  Mail_Body+=FORMAT(nextline);
                                  Mail_Body+='Purchase Order No.      : '+"Order No.";
                                  Mail_Body+=FORMAT(nextline);
                                  Mail_Body+='Vendor Name             : '+"Vendor Name";
                                  Mail_Body+=FORMAT(nextline);
                                  Mail_Body+='Inwarded Quantity       : '+FORMAT(PRL.Quantity);
                                  Mail_Body+=FORMAT(nextline);
                                  Mail_Body+='Inward Date             : '+FORMAT(("IDS creation Date"),0,4);
                                  Mail_Body+=FORMAT(nextline);
                        
                                  Mail_Body+='Inspected Quantity      : '+FORMAT(Quantity);
                                  Mail_Body+=FORMAT(nextline);
                                  Mail_Body+='Accepted Quantity       : '+FORMAT("Qty. Accepted");
                                  Mail_Body+=FORMAT(nextline);
                                  IF "Qty. Rejected">0 THEN
                                  BEGIN
                                    Mail_Body+='Rejected Quantity       : '+FORMAT("Qty. Rejected");
                                    Mail_Body+=FORMAT(nextline);
                                    Mail_Body+='Nature Of Rejection     : '+FORMAT("Nature Of Rejection");
                                    Mail_Body+=FORMAT(nextline);
                                    Mail_Body+='Rejection Reason        : '+FORMAT("Reason Description");
                                    Mail_Body+=FORMAT(nextline);
                                  END;
                        
                                  IF "Qty. Rework">0 THEN
                                  BEGIN
                                    Mail_Body+='Rework Quantity       : '+FORMAT("Qty. Rework");
                                    Mail_Body+=FORMAT(nextline);
                                  END;
                        
                                  "Mail-Id".SETRANGE("Mail-Id"."User Name",USERID);
                                  IF "Mail-Id".FINDFIRST THEN
                                     "from Mail":="Mail-Id".MailID;
                                  "from Mail":='erp@efftronics.com';
                                  Mail_Body+='Inspeceted By           : '+FORMAT("Mail-Id"."User Name");
                                  Mail_Body+=FORMAT(nextline);
                        
                                  "Mail-Id".RESET;
                                  "Mail-Id".SETRANGE("Mail-Id"."User Name",IH."Person Code");
                                  IF "Mail-Id".FINDFIRST THEN  BEGIN
                                    "to mail":="Mail-Id".MailID;
                                    /*  IF (STRLEN( "to mail") > 0)THEN
                                        "to mail"+=',anilkumar@efftronics.com'
                                      ELSE
                                         "to mail"+='anilkumar@efftronics.com';
                                    */
                                  END;
                                  // ELSE
                                  // "to mail"+='anilkumar@efftronics.com';
                        
                                  Mail_Body+='***** Auto Mail Generated from ERP *****';
                                  IF ("from Mail"<>'')AND("to mail"<>'') THEN
                                  BEGIN
                                    SMTP_MAIL.CreateMessage('QC INWARD',"from Mail","to mail",Mail_Subject,Mail_Body,FALSE);
                                    SMTP_MAIL.Send;
                                    // mail.NewCDOMessage("from Mail","to mail",Mail_Subject,Mail_Body,'');
                                  END;
                                END;  // IH END
                              END;  // PRL END
                            END;  // LOCAION CODE R&D STR END
                          END;  // QTY = QTY ACCPTED END
                        
                          IF Flag= TRUE THEN
                          BEGIN
                            "from Mail":='ERP@efftronics.com';
                            "to mail":='Purchase@efftronics.com,Padmaja@Efftronics.com,erp@efftronics.com,temc@efftronics.com,jhansi@efftronics.com,';
                            "to mail"+='bharat@efftronics.com,dineel@efftronics.com,vijayalakshmib@efftronics.com';
                            Mail_Subject:=' QC Blocked Item '+"Item Description";
                            Mail_Body:='***** Auto Mail Generated from ERP *****';
                            Attach.RESET;
                            Attach.SETFILTER(Attach."Document No.","No.");
                            Attach.SETFILTER(Attach.Description,'FLAG');
                            Attach.SETFILTER(Attach."Attachment Status",'%1',TRUE);
                            IF Attach.FINDFIRST THEN
                            BEGIN
                              Fname:='\\erpserver\ErpAttachments\'+FORMAT(Attach."No.")+'.'+Attach."File Extension";
                              Attach.ExportAttachment(Fname);
                              Attachment1:=Fname;
                              TempFileName := '';//EFFUPG
                              SMTP_MAIL.CreateMessage('ERP',"from Mail","to mail",Mail_Subject,Mail_Body,TRUE);
                              SMTP_MAIL.AddAttachment(Attachment1,TempFileName);//EFFUPG
                              SMTP_MAIL.Send;
                            END
                            ELSE
                              ERROR('There is no Attachment to Flag');
                          END;
                        
                          MESSAGE(Text001,"No.");
                          CurrPage.UPDATE(TRUE);
                        
                          // >>Added by Pranavi on 19-05-2017 for MSL process
                            IF item.GET("Item No.") THEN
                            BEGIN
                              IF (item.MSL <> 0) THEN
                              BEGIN
                                IF "Qty. Accepted" <> 0 THEN
                                BEGIN
                                  ItemLedgEntry.RESET;
                                  ItemLedgEntry.SETCURRENTKEY("Item No.","Entry Type");
                                  ItemLedgEntry.SETRANGE("Item No.","Item No.");
                                  ItemLedgEntry.SETRANGE("Entry Type",ItemLedgEntry."Entry Type"::Purchase);
                                  ItemLedgEntry.SETRANGE("Document Type",ItemLedgEntry."Document Type"::"Purchase Receipt");
                                  ItemLedgEntry.SETRANGE("Lot No.","Lot No.");
                                  IF ItemLedgEntry.FINDFIRST THEN
                                  BEGIN
                                    ItemLedgEntry."MFD Date":="MFD Date";
                                    ItemLedgEntry."MBB Packed Date":="Packed Date";
                                    ItemLedgEntry."MBB Packet Open DateTime":="MBB Packet Open DateTime";
                                    ItemLedgEntry."MBB Packet Close DateTime":="MBB Packet Close DateTime";
                                    IF (DateAndTime.DateDiff('N',"MBB Packet Open DateTime","MBB Packet Close DateTime",DayofWeekInput,WeekofYearInput)) > 15 THEN
                                    BEGIN
                                      ItemLedgEntry."Floor Life"+=ROUND((DateAndTime.DateDiff('N',"MBB Packet Open DateTime","MBB Packet Close DateTime",DayofWeekInput,WeekofYearInput))/60,0.01);
                                    END;
                                    IF (item.MSL IN [item.MSL::"1",item.MSL::"2"]) AND ("HIC 60%" <> "HIC 60%"::Blue) AND NOT (item."Floor Life at 25 C 40% RH" IN ['INFINITE','']) THEN
                                    BEGIN
                                      ItemLedgEntry."Recharge Cycles"+=1;
                                      ItemLedgEntry."Floor Life":=0;
                                      ItemLedgEntry."MBB Packed Date":="MBB Packed Date";
                                    END;
                                    IF (item.MSL IN [item.MSL::"2A",item.MSL::"3",item.MSL::"4",item.MSL::"5",item.MSL::"5A"]) AND NOT (item."Floor Life at 25 C 40% RH" IN ['INFINITE',''])
                                      AND ("HIC 10%" <> "HIC 10%"::Blue) AND ("HIC 5%" <> "HIC 5%"::Pink) THEN
                                    BEGIN
                                      ItemLedgEntry."Recharge Cycles"+=1;
                                      ItemLedgEntry."Floor Life":=0;
                                      ItemLedgEntry."MBB Packed Date":="MBB Packed Date";
                                    END;
                                    ItemLedgEntry.MODIFY;
                                  END;
                                END;
                              END;
                            END;
                          // >>Added by Pranavi on 19-05-2017 for MSL process
                        END;  // end of if source type is not calibration

                    end;
                }
                action(Tranfer_to_callibration)
                {
                    Visible = false;

                    trigger OnAction();
                    begin
                        Trasfer_To_calibration_module();
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        //B2B to get the value of Undefined Qty.
        UndefinedQty :=Quantity;
        //B2B

        //>>Added by Pranavi on 17-05-2017 for MSL Process
        IF item.GET("Item No.") THEN
        BEGIN
          MSL:=item.MSL;
          "ESD Class":=item."ESD Class";
          "Floor Life at 25 C 40% RH":=item."Floor Life at 25 C 40% RH";
          "Bake Hours":=item."Bake Hours";
          "Component Shelf Life(Years)":=item."Component Shelf Life(Years)";
        END;
        //<<Added by Pranavi on 17-05-2017 for MSL Process
    end;

    trigger OnInit();
    begin
        ReworkTimeInMinutesEditable := TRUE;
    end;

    trigger OnOpenPage();
    begin

        Visible_Bool:=TRUE;

        IF USERID IN ['EFFTRONICS\VISHNNUPRIYA','EFFTRONICS\B2BOTS'] THEN
            editfields := TRUE;
    end;

    var
        Text001 : Label 'Inspection receipt %1 posted successfully.';
        InspectJnlLine : Codeunit "Inspection Jnl.-Post Line";
        QualityType : Option Accepted,"Accepted Under Deviation",Rework,Rejected;
        UndefinedQty : Decimal;
        Attachment : Record Attachments;
        ItemLedgEntry : Record "Item Ledger Entry";
        Calibration : Record Calibration;
        "Mail-Id" : Record User;
        "from Mail" : Text[150];
        "to mail" : Text[1000];
        Mail_Subject : Text[1000];
        Mail_Body : Text[1024];
        mail : Codeunit Mail;
        nextline : Char;
        rejper : Decimal;
        accper : Decimal;
        PL : Record "Purchase Line";
        IH : Record "Indent Header";
        PRL : Record "Purch. Rcpt. Line";
        "total price" : Decimal;
        item : Record Item;
        "acc amt" : Decimal;
        "rej amt" : Decimal;
        user : Record User;
        "user name" : Text[50];
        inwqty : Decimal;
        ids : Record "Inspection Datasheet Header";
        InspectionReceiptline : Record "Inspection Receipt Line";
        vend : Record Vendor;
        postedids : Record "Posted Inspect DatasheetHeader";
        PRH : Record "Purch. Rcpt. Header";
        SMTP_MAIL : Codeunit "SMTP Mail";
        ITEM_LEAD_TIME : Code[10];
        PROD_ORDER_COMPONENT : Record "Prod. Order Component";
        IRH : Record "Inspection Receipt Header";
        QC_SETUP : Record "Quality Control Setup";
        ITEM_STOCK : Decimal;
        Rejection : Record "QC Rejection Master";
        Fname : Text[250];
        Attach : Record Attachments;
        Attachment1 : Text[1000];
        [InDataSet]
        ReworkTimeInMinutesEditable : Boolean;
        PH : Record "Purchase Header";
        QCMail : Codeunit "SMTP Mail";
        "---EFFUPG---" : Integer;
        TempFileName : Text;
        MSL : Option " ","1","2","2A","3","4","5","5A","6";
        "ESD Class" : Option " ","0","1A","1B","1C","2","3A","3B";
        "Floor Life at 25 C 40% RH" : Code[15];
        "Bake Hours" : Decimal;
        "Component Shelf Life(Years)" : Decimal;
        "MBB Shelf Life" : Decimal;
        Visible_Bool : Boolean;
        DateAndTime : DotNet "'Microsoft.VisualBasic, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a'.Microsoft.VisualBasic.DateAndTime";
                          DayofWeekInput : DotNet "'Microsoft.VisualBasic, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a'.Microsoft.VisualBasic.FirstDayOfWeek";
                          WeekofYearInput : DotNet "'Microsoft.VisualBasic, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a'.Microsoft.VisualBasic.FirstWeekOfYear";
                          TEMCMail : Page "Material Requests";
                          REASON : Record "Reason Code";
                          FileDirectory : Text[100];
                          FileName_rej : Text[100];
                          QC_ATCH : Text;
                          attachments : Record Attachments;
                          IRH1 : Record "Inspection Receipt Header";
                          QCSetup : Record "Quality Control Setup";
                          NoSeriesMgt : Codeunit NoSeriesManagement;
                          Transfer_to_calibration : Boolean;
                          editfields : Boolean;
                          PIDSH : Record "Posted Inspect DatasheetHeader";
                          PARENT_IDS_QTY : Decimal;

    [LineStart(23175)]
    procedure CalculateUndefinedQty();
    begin
        UndefinedQty := Quantity - "Qty. Accepted" - "Qty. Rejected" - "Qty. Rework" - "Qty. Accepted Under Deviation";
    end;

    [LineStart(23178)]
    procedure CancelReservation(var InspectionReceipt: Record "Inspection Receipt Header");
    var
        ReservationEntry: Record "Reservation Entry";
        ReservationEntry2: Record "Reservation Entry";
        ReservEngineMgt: Codeunit "Reservation Engine Mgt.";
    begin
        ReservationEntry.SETRANGE("Item No.", InspectionReceipt."Item No."); //300708
        ReservationEntry.SETRANGE("Source Ref. No.", InspectionReceipt."Item Ledger Entry No.");
        IF ReservationEntry.FINDFIRST THEN BEGIN
            ReservationEntry2.SETRANGE("Entry No.", ReservationEntry."Entry No.");
            IF ReservationEntry2.FINDSET THEN
                REPEAT
                    ReservationEntry2.TESTFIELD("Reservation Status", ReservationEntry2."Reservation Status"::Reservation);
                    // ReservEngineMgt.CloseReservEntry2(ReservationEntry2,TRUE,FALSE);
                    // commented for navision upgradation
                    COMMIT;
                UNTIL ReservationEntry2.NEXT = 0;
        END;
    end;

    [LineStart(23192)]
    procedure UpdateQCCheck(InspecRcpt: Record "Inspection Receipt Header");
    begin
        IF InspecRcpt."Item Ledger Entry No." <> 0 THEN BEGIN
            IF InspecRcpt."Rework Level" <> 0 THEN BEGIN
                ItemLedgEntry.GET(InspecRcpt."DC Inbound Ledger Entry.");
                IF ItemLedgEntry."Remaining Quantity" = 0 THEN BEGIN
                    ItemLedgEntry."QC Check" := FALSE;
                    ItemLedgEntry.MODIFY;
                END;
            END ELSE BEGIN
                ItemLedgEntry.GET(InspecRcpt."Item Ledger Entry No.");
                IF ItemLedgEntry."Remaining Quantity" = 0 THEN BEGIN
                    ItemLedgEntry."QC Check" := FALSE;
                    ItemLedgEntry.MODIFY;
                END;
            END;
        END;
    end;

    [LineStart(23209)]
    local procedure ReworkTimeInMinutesOnBeforeInp();
    begin
        IF "Rework Reference No." = '' THEN
            ReworkTimeInMinutesEditable := FALSE
        ELSE
            ReworkTimeInMinutesEditable := TRUE;
    end;

    [LineStart(23215)]
    procedure CreateIndent();
    var
        Indent_No: Code[20];
        "Indent Header": Record "Indent Header";
        "Indent Line": Record "Indent Line";
        Prev_Indent: Code[20];
        Prev_Indent_Series: Code[20];
        "No. Series": Record "No. Series";
        "No. Series Line": Record "No. Series Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Line_No: Integer;
        User: Record User;
        UserName: Code[100];
        DimVal: Record "Dimension Value";
        PRL: Record "Purch. Rcpt. Line";
        IndntHdr: Record "Indent Header";
    begin
        // Added by Pranavi on 20-Aug-2016 auto indent creation for rejected qty

        Indent_No := '';
        UserName := '';

        User.RESET;
        User.SETRANGE(User."User Name", USERID);
        IF User.FINDFIRST THEN
            UserName := User."Full Name";

        // Indent Header Creating
        "Indent Header".RESET;
        "Indent Header".INIT;
        NoSeriesMgt.InitSeries('P-INDENT', 'P-INDENT', TODAY,
                                                      Indent_No, "Indent Header"."No. Series");
        "Indent Header"."No." := Indent_No;
        "Indent Header".Description := 'Created From QC Inward Item Rejection';

        PRL.RESET;
        PRL.SETRANGE(PRL."Document No.", "Receipt No.");
        PRL.SETRANGE(PRL."No.", "Item No.");
        IF PRL.FINDFIRST THEN BEGIN
            "Indent Header"."Delivery Location" := PRL."Location Code";
            DimVal.RESET;
            DimVal.SETRANGE(DimVal."Dimension Code", 'DEPARTMENTS');
            DimVal.SETRANGE(DimVal.Code, PRL."Shortcut Dimension 1 Code");
            IF DimVal.FINDFIRST THEN
                "Indent Header".Department := DimVal.Name
            ELSE
                "Indent Header".Department := 'PROD';
            IndntHdr.RESET;
            IndntHdr.SETRANGE(IndntHdr."No.", PRL."Indent No.");
            IF IndntHdr.FINDFIRST THEN BEGIN
                "Indent Header"."Indent Reference" := IndntHdr."Indent Reference";
                "Indent Header"."Person Code" := IndntHdr."Person Code";
                "Indent Header"."Contact Person" := IndntHdr."Contact Person";
            END ELSE BEGIN
                "Indent Header"."Contact Person" := UserName;
                "Indent Header"."Indent Reference" := UserName;
                "Indent Header"."Person Code" := USERID;
            END;
        END
        ELSE BEGIN
            "Indent Header"."Delivery Location" := 'STR';
            "Indent Header".Department := 'PROD';
            "Indent Header"."Contact Person" := UserName;
            "Indent Header"."Indent Reference" := UserName;
            "Indent Header"."Person Code" := USERID;
        END;
        "Indent Header"."Delivery Place" := "Indent Header"."Delivery Place"::Store;
        "Indent Header"."User Id" := USERID;
        "Indent Header"."ICN No." := ICNNO(TODAY);
        "Indent Header"."Creation Date" := TODAY;
        "Indent Header".VALIDATE("Indent Header"."Production Order No.", "Prod. Order No.");
        "Indent Header"."IR Number" := "No.";
        "Indent Header".INSERT;

        // Indent Line Creating
        Line_No := 0;
        "Indent Line".INIT;
        "Indent Line"."Document No." := Indent_No;
        Line_No := Line_No + 10000;
        "Indent Line"."Line No." := Line_No;
        "Indent Line"."No." := "Item No.";
        "Indent Line".VALIDATE("Indent Line"."No.", "Item No.");
        "Indent Line"."ICN No." := ICNNO(TODAY);
        "Indent Line".Description := "Item Description";
        "Indent Line".Quantity := "Qty. Rejected";
        "Indent Line".INSERT;

        "Indent Header".ReleaseIndent1("Indent Header"."No.");    // Release indent

        // Updating No.Series
        "No. Series Line".RESET;
        //"No. Series Line".SETRANGE("No. Series Line"."Series Code",'P-INDENT');
        "No. Series Line".SETRANGE("No. Series Line"."Series Code", 'P-IND1112');
        "No. Series Line".SETRANGE("No. Series Line".Open, TRUE);
        IF "No. Series Line".FINDFIRST THEN BEGIN
            "No. Series Line"."Last No. Used" := Indent_No;
            "No. Series Line"."Last Date Used" := TODAY;
            "No. Series Line".MODIFY;
        END;

        MESSAGE('INDENT CREATED FOR THE ITEM: ' + "Item Description" + '\INDENT NO.: ' + Indent_No);
        "Indent Header".RESET;
        // End by pranavi
    end;

    [LineStart(23303)]
    procedure ICNNO(DT: Date) ICN: Code[10];
    var
        Dat: Code[10];
        Mon: Code[10];
        Yer: Code[10];
    begin
        IF DATE2DMY(DT, 1) < 10 THEN
            Dat := '0' + FORMAT(DATE2DMY(DT, 1))
        ELSE
            Dat := FORMAT(DATE2DMY(DT, 1));

        IF DATE2DMY(DT, 2) < 10 THEN
            Mon := '0' + FORMAT(DATE2DMY(DT, 2))
        ELSE
            Mon := FORMAT(DATE2DMY(DT, 2));

        //IF DATE2DMY(DT,2) < 10 THEN
        Yer := COPYSTR(FORMAT(DATE2DMY(DT, 3)), 3, 2);
        ICN := Dat + Mon + Yer;
        EXIT(ICN);
    end;

    [LineStart(23317)]
    local procedure "Rejection Note"();
    begin
    end;

    [LineStart(23320)]
    local procedure Trasfer_To_calibration_module();
    begin
        IF Rec."Equp Model" = '' THEN
            ERROR('Enter the Equipment Serial No Under Calibration tab');
        IF Rec."Eqpt. Serial No." = '' THEN
            ERROR('Enter the Equipment Serial No Under Calibration tab');
        IF Rec."Equp Desc" = '' THEN
            ERROR('Enter the Equipment Description Under Calibration tab');
        IF (FORMAT(Rec."Calibration frequency") = '') THEN
            ERROR('Enter the Freuency of Callibration Under Calibration tab');

        Calibration.RESET;
        Calibration.SETFILTER("IR No", Rec."No.");
        IF Calibration.FINDSET THEN
            ERROR('This Item has alredy there in calibration with Calibration id ' + Calibration."Equipment No")
        ELSE BEGIN
            QCSetup.GET;
            QCSetup.TESTFIELD(QCSetup."Equipment No.");
            NoSeriesMgt.InitSeries(QCSetup."Equipment No.", Calibration."No. Series", 0D, Calibration."Equipment No", Calibration."No. Series");
            Calibration."Eqpt. Serial No." := Rec."Eqpt. Serial No.";
            Calibration.Description := Rec."Equp Desc";
            Calibration.Manufacturer := Rec.Make;
            Calibration."Model No." := Rec."Equp Model";
            Calibration."Equipment Type" := Rec."Equp Type";
            Calibration."Calibration Party" := Rec."Calibration Party";
            Calibration."IR No" := Rec."No.";
            Calibration."Item No" := Rec."Item No.";
            Calibration."Item Desc" := Rec."Item Description";
            Calibration."Created By" := USERID;
            Calibration."Created Date" := TODAY;
            Calibration.Transfered_from := Calibration.Transfered_from::IR;
            Calibration."MFG. Serial No." := Rec."Lot No.";
            Calibration."Last Calibration Date" := Rec."Calibration Date";
            Calibration."Next Calibration Due On" := Rec."Next calib date";
            Calibration."Calibration Period" := Rec."Calibration frequency";
            PRL.RESET;
            PRL.SETFILTER("Document No.", Rec."Receipt No.");
            PRL.SETFILTER("Order Line No.", FORMAT(Rec."Purch Line No"));
            PRL.SETFILTER("No.", Rec."Item No.");
            IF PRL.FINDSET THEN BEGIN
                PRH.RESET;
                PRH.SETFILTER("No.", PRL."Document No.");
                IF PRH.FINDSET THEN BEGIN
                    Calibration."Purchase Date" := PRH."Posting Date";
                    Calibration."Unit cost(LCY)" := PRL."Unit Cost (LCY)";
                END;
            END;
            Calibration.INSERT;
            COMMIT;

            MESSAGE('Transfered for Calibration with Calibration ID' + Calibration."Equipment No");
        END;
    end;

    [LineStart(23375)]
    local procedure UnderDeviationMails();
    begin
        "total price" := 0;
        "acc amt" := 0;
        "rej amt" := 0;

        IF "Qty. Accepted Under Deviation" <> 0 THEN BEGIN
            Mail_Subject := 'Inward - QA Accepted Under Deviation, Item: ' + "Item Description";
            ITEM_LEAD_TIME := '';
            ITEM_STOCK := 0;
            item.SETRANGE(item."No.", "Item No.");
            IF item.FINDFIRST THEN BEGIN
                ITEM_LEAD_TIME := FORMAT(item."Safety Lead Time");
                IF item."Avg Unit Cost" <> 0 THEN BEGIN
                    "total price" := ROUND(item."Avg Unit Cost" * Quantity, 1);
                    "acc amt" := ROUND(item."Avg Unit Cost" * "Qty. Accepted", 1);
                    "rej amt" := ROUND(item."Avg Unit Cost" * "Qty. Accepted Under Deviation", 1);
                END;
            END ELSE BEGIN
                PRL.SETRANGE(PRL."Document No.", "Receipt No.");
                PRL.SETRANGE(PRL."No.", "Item No.");
                IF PRL.FINDFIRST THEN BEGIN
                    "total price" := ROUND(PRL.Quantity * PRL."Unit Cost", 1);
                    "acc amt" := ROUND(PRL."Unit Cost" * "Qty. Accepted", 1);
                    "rej amt" := ROUND(PRL."Unit Cost" * "Qty. Accepted Under Deviation", 1);
                END;
            END;
            "Mail-Id".SETRANGE("Mail-Id"."User Name", USERID);
            IF "Mail-Id".FINDFIRST THEN
                "from Mail" := "Mail-Id".MailID;
            "from Mail" := 'erp@efftronics.com';
            "to mail" += 'purchase@efftronics.com,padmasri@efftronics.com,bharat@efftronics.com,dineel@efftronics.com,erp@efftronics.com,vijayalakshmib@efftronics.com';
            "to mail" += ',padmaja@efftronics.com';
            "to mail" += ',qainward@efftronics.com';
            "to mail" += ',Temc@efftronics.com';
            "to mail" += ',store@efftronics.com';
            "to mail" += ',pardhu@efftronics.com';

            item.SETRANGE(item."No.", "Item No.");
            IF item.FINDFIRST THEN BEGIN
                IF item."Item Category Code" = 'MECH' THEN
                    "to mail" += ',ubedulla@efftronics.com';
                IF item."Product Group Code" = 'B OUT' THEN BEGIN
                    PH.RESET;
                    PH.SETFILTER(PH."No.", "Order No.");
                    PH.SETFILTER(PH."Sale Order No", '<>%1', '');
                    IF PH.FINDFIRST THEN
                        "to mail" += ',pmsubhani@efftronics.com';
                END;
            END;
            accper := ROUND((("Qty. Accepted" / Quantity) * 100), 0.01);
            rejper := ROUND((("Qty. Accepted Under Deviation" / Quantity) * 100), 0.01);
            IF ("rej amt" > 10000) OR (rejper > 10) THEN
                "to mail" += ',ceo@efftronics.com';

            PL.SETRANGE(PL."Document No.", "Order No.");
            PL.SETRANGE(PL."No.", "Item No.");
            IF PL.FINDFIRST THEN BEGIN
                IH.SETRANGE(IH."No.", PL."Indent No.");
                "Mail-Id".RESET;
                IF IH.FINDFIRST THEN BEGIN
                    "Mail-Id".SETRANGE("Mail-Id"."User Name", IH."Person Code");
                    IF "Mail-Id".FINDFIRST THEN BEGIN
                        // QCMail.AppendBody('<tr><td><b>Indented By</b></td><td> '+"Mail-Id"."User Name"+'</td></tr>');
                        IF "Mail-Id".MailID <> '' THEN        //added by pranavi on 23-04-2015 to check user has mail ID
                            "to mail" += ',' + "Mail-Id".MailID;
                    END;
                END;
            END;


            //************************************new format of mail*********************************************//
            QCMail.CreateMessage('EFF', 'erp@efftronics.com', "to mail", Mail_Subject, Mail_Body, TRUE);
            QCMail.AppendBody('<html><head><style> divone{background-color: white; width: 700px; padding: 20px; border-style:solid ; border-color:#666699;  margin: 20px;} </style></head>');
            QCMail.AppendBody('<body><div style="border-color:#025E4D;  margin: 20px; border-width:15px;   border-style:solid; padding: 20px; width: 600px;"><label><font size="6"> Under Deviation Accepted ITEM DETAILS </font></label>');
            QCMail.AppendBody('<hr style=solid; color= #3333CC>');
            QCMail.AppendBody('<h>Dear Sir/Madam,</h><br>');
            QCMail.AppendBody('<P>Under deviation Accepted ITEM DETAILS </P>');
            QCMail.AppendBody('<table border="1" style="border-collapse:collapse; width:100%; font-size:10pt;">');
            QCMail.AppendBody('<tr><td width= "40%"><b>Vendor Name  </b> </td><td>' + "Vendor Name" + '</td></tr> ');
            QCMail.AppendBody('<tr><td ><b>Item no. </b></td><td>' + "Item No." + '</td></tr> ');
            QCMail.AppendBody('<tr><td ><b>Item Description </b></td><td>' + "Item Description" + '</td></tr> ');
            QCMail.AppendBody('<tr><td ><b>Location Code </b></td><td>' + "Location Code" + '</td></tr> ');
            QCMail.AppendBody('<tr><td><b> Make</b></td><td>' + Make + '</td></tr>');
            QCMail.AppendBody('<tr><td><b> Accepted Quantity </b></td><td>' + FORMAT("Qty. Accepted") + '</td></tr>');
            //QCMail.AppendBody('<tr><td><b> Rejected Quantity  </b></td><td>'+FORMAT("Qty. Rejected")+'</td></tr>');
            QCMail.AppendBody('<tr><td><b> Under Deviation Quantity  </b></td><td>' + FORMAT("Qty. Accepted Under Deviation") + '</td></tr>');
            //added by sujani for the Rejection note
            /* IRH1.RESET;
             IRH1.SETFILTER("No.",Rec."No.");
             IF IRH1.FINDSET THEN
             BEGIN

             FileDirectory := '\\erpserver\ErpAttachments\QC_Rejection_Note\';
             //FileName:=IRH."No.");
             //filesub:=COPYSTR("No.",5,5);
             FileName_rej :='QC Rejection Note '+IRH1."No."+ '.pdf';
             REPORT.RUN(32000006,FALSE,FALSE,IRH1);
             REPORT.SAVEASPDF(32000006,FileDirectory+FileName_rej,IRH1);
             QC_ATCH:=FileDirectory+FileName_rej;
             QCMail.AddAttachment(QC_ATCH,FileName_rej);
             END;
             */


            ids.SETRANGE(ids."No.", "Parent IDS");
            IF ids.FINDFIRST THEN BEGIN
                inwqty := ids.Quantity;
                IF Quantity < inwqty THEN BEGIN
                    QCMail.AppendBody('<tr><td><b>Total Quantity Checked at QC</b></td><td>' + FORMAT(Quantity) + '</td></tr>');
                    //  Mail_Body+=FORMAT(nextline);
                END
                ELSE BEGIN
                    QCMail.AppendBody('<tr><td><b>Total Quantity </b></td><td>' + FORMAT(Quantity) + '</td></tr>');
                    Mail_Body += FORMAT(nextline);
                    QCMail.AppendBody('<tr><td><b>Inward Quantity </b></td><td>' + FORMAT(inwqty) + '</td></tr>');
                END;
                // Mail_Body+=FORMAT(nextline);
            END
            ELSE
                IF inwqty = 0 THEN BEGIN
                    postedids.SETRANGE(postedids."No.", "Parent IDS");
                    IF postedids.FINDFIRST THEN BEGIN
                        inwqty := postedids.Quantity;
                        IF Quantity < inwqty THEN BEGIN
                            QCMail.AppendBody('<tr><td><b>Total Quantity Checked at QC</b></td><td>' + FORMAT(Quantity) + '</td></tr>');
                            // Mail_Body+=FORMAT(nextline);
                        END
                        ELSE BEGIN
                            QCMail.AppendBody('<tr><td><b>Total Quantity </b></td><td>' + FORMAT(Quantity) + '</td></tr>');
                            // Mail_Body+=FORMAT(nextline);
                        END;
                        QCMail.AppendBody('<tr><td><b>Inward Quantity </b></td><td>' + FORMAT(inwqty) + '</td></tr>');
                    END;
                END
                ELSE BEGIN
                    QCMail.AppendBody('<tr><td><b> Total Quantity </b></td><td>' + FORMAT(Quantity) + '</td></tr>');
                    QCMail.AppendBody('<tr><td><b> Inward Quantity </b></td><td>' + FORMAT(inwqty) + '</td></tr>');
                END;
            accper := ROUND((("Qty. Accepted" / Quantity) * 100), 0.01);
            QCMail.AppendBody('<tr><td><b> Accepted % </b></td><td><div style="width:' + FORMAT(accper) + '; background: rgb(128, 177, 133); overflow:visible;">' + FORMAT(accper) + '%</div></td></tr>');
            rejper := ROUND((("Qty. Accepted Under Deviation" / Quantity) * 100), 0.01);
            QCMail.AppendBody('<tr><td><b> Under Deviation % </b></td><td>' + FORMAT(rejper) + '%</td></tr>');
            QCMail.AppendBody('<tr><td><b> Accepted Quantity price  </b></td><td>' + FORMAT("acc amt") + '</td></tr>');
            QCMail.AppendBody('<tr><td><b> Under Deviation Qty  Price  </b></td><td>' + FORMAT("rej amt") + '</td></tr>');
            QCMail.AppendBody('<tr><td><b> Total Quantity Price </b></td><td>' + FORMAT("total price") + '</td></tr>');
            IF "Nature Of Rejection" = '' THEN
                ERROR('Please update Nature of Rejection');
            QCMail.AppendBody('<tr><td><b> Rejected Category    </b></td><td>' + "Nature Of Rejection" + '</td></tr>');
            QCMail.AppendBody('<tr><td><b>Reason Description </b></td><td><b>' + "Reason Description" + '</b></td></tr>');
            QCMail.AppendBody('<tr><td><b>Under Deviation Reason</b></td><td>' + "Qty. Accepted UD Reason" + '</td></tr>');
            QCMail.AppendBody('<tr><td><b>Inward Date </b></td><td>' + FORMAT(("IDS creation Date"), 0, 4) + '</td></tr>');
            PRH.SETRANGE(PRH."No.", "Receipt No.");
            IF PRH.FINDFIRST THEN
                QCMail.AppendBody('<tr><td><b>Invoice No.  </b></td><td> ' + PRH."Vendor Order No." + '</td></tr>');
            ;
            Mail_Body += FORMAT(nextline);
            QCMail.AppendBody('<tr><td><b>DC No.</b></td><td>  ' + PRH."Vendor Shipment No." + '</td></tr>');
            Mail_Body += FORMAT(nextline);
            QCMail.AppendBody('<tr><td><b>Batch No</b></td><td>' + "Lot No." + '</td></tr>');
            // Mail_Body+='***** Auto Mail Generated from ERP *****';
            "to mail" += ',Temc@efftronics.com';
            user.SETRANGE(user."User Name", USERID);
            IF user.FINDFIRST THEN
                "user name" := user."User Name";
            QCMail.AppendBody('<tr><td><b>QC Passed By    </b></td><td>' + "user name" + '</td></tr>');
            QCMail.AppendBody('<tr><td><b>Purch Order No. </b></td><td>' + "Order No." + '</td></tr>');

            PL.SETRANGE(PL."Document No.", "Order No.");
            PL.SETRANGE(PL."No.", "Item No.");
            IF PL.FINDFIRST THEN BEGIN
                IH.SETRANGE(IH."No.", PL."Indent No.");
                "Mail-Id".RESET;
                IF IH.FINDFIRST THEN BEGIN
                    "Mail-Id".SETRANGE("Mail-Id"."User Name", IH."Person Code");
                    IF "Mail-Id".FINDFIRST THEN BEGIN
                        QCMail.AppendBody('<tr><td><b>Indented By</b></td><td> ' + "Mail-Id"."User Name" + '</td></tr>');
                        IF "Mail-Id".MailID <> '' THEN
                            "to mail" += ',' + "Mail-Id".MailID;
                    END;
                END;
            END;
            QCMail.AppendBody('</table>');
            QCMail.AppendBody('<BR><p align ="left"> Regards,<br>ERP Team </p>');
            QCMail.AppendBody('<br><p align = "center">::::Note: Auto Generated mail from ERP:::: </b></P></div></body></html>');
            QCMail.Send;
        END;
        //  mail.NewCDOMessage("from Mail","to mail",Mail_Subject,Mail_Body,'');

    end;
}

