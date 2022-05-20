page 33000268 "Posted Inspection Receipt"
{
    // version QC1.1,Cal1.0,RQC1.0,Rev01

    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Document;
    SourceTable = "Inspection Receipt Header";
    SourceTableView = WHERE(Status=FILTER(Yes));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No.";"No.")
                {
                    Editable = false;
                }
                field("Item No.";"Item No.")
                {
                    Editable = false;
                }
                field("Item Description";"Item Description")
                {
                    Editable = false;
                }
                field("Unit Of Measure Code";"Unit Of Measure Code")
                {
                    Editable = false;
                }
                field(Quantity;Quantity)
                {
                    Editable = EditableOrNot;
                }
                field("Spec ID";"Spec ID")
                {
                    Editable = false;
                }
                field("IDS Posted By";"IDS Posted By")
                {
                    Editable = false;
                }
                field("IR Posted By";"IR Posted By")
                {
                    Editable = true;
                }
                field("Posting Date";"Posting Date")
                {
                    Editable = false;
                }
                field("Document Date";"Document Date")
                {
                    Editable = false;
                }
                field("Rework Reference No.";"Rework Reference No.")
                {
                    Editable = false;
                }
                field("Stock Rcvd from QC";"Stock Rcvd from QC")
                {
                }
                field("Source Type";"Source Type")
                {
                    Editable = false;
                }
                field(Status;Status)
                {
                    Editable = EditableOrNot;
                }
                field(Make;Make)
                {
                    Editable = EditableOrNot;
                }
                field("Lot No.";"Lot No.")
                {
                    Editable = false;
                }
            }
            part(InpectionReceiptLine;"Inpection Receipt Line")
            {
                Editable = false;
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
                field("Receipt No.";"Receipt No.")
                {
                    Editable = false;
                }
                field("Order No.";"Order No.")
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
                field("OutPut Jr Serial No.";"OutPut Jr Serial No.")
                {
                }
                field("Finished Product Sr No";"Finished Product Sr No")
                {
                }
                field("Rework User";"Rework User")
                {
                }
                field(Resource;Resource)
                {
                    Editable = false;
                }
            }
            group(Inspection)
            {
                Caption = 'Inspection';
                field("<Quantity2>";Quantity)
                {
                    Editable = EditableOrNot;
                }
                field("Qty. Accepted";"Qty. Accepted")
                {
                    Editable = EditableOrNot;

                    trigger OnAssistEdit();
                    begin
                        QualityAcceptanceLevels(QualityType :: Accepted);
                    end;
                }
                field("Qty. Accepted Under Deviation";"Qty. Accepted Under Deviation")
                {
                    Editable = EditableOrNot;

                    trigger OnAssistEdit();
                    begin
                        QualityAcceptanceLevels(QualityType :: "Accepted Under Deviation");
                    end;
                }
                field("Qty. Rework";"Qty. Rework")
                {
                    Editable = EditableOrNot;

                    trigger OnAssistEdit();
                    begin
                        QualityAcceptanceLevels(QualityType :: Rework);
                    end;
                }
                field("Qty. Rejected";"Qty. Rejected")
                {
                    Editable = EditableOrNot;

                    trigger OnAssistEdit();
                    begin
                        QualityAcceptanceLevels(QualityType :: Rejected);
                    end;
                }
                field("Qty. Accepted UD Reason";"Qty. Accepted UD Reason")
                {
                    Editable = EditableOrNot;
                }
                field("Reason Description";"Reason Description")
                {
                    Editable = false;
                }
                field("Nature Of Rejection";"Nature Of Rejection")
                {
                    Editable = true;
                }
                field("Location Code";"Location Code")
                {
                    Editable = false;
                }
                field("New Location Code";"New Location Code")
                {
                    Editable = false;
                }
                field("Rework Completed";"Rework Completed")
                {
                    Editable = false;
                }
                field("Qty. To Receive(Rework)";"Qty. To Receive(Rework)")
                {
                }
                field("Rejection Category";"Rejection Category")
                {
                }
                field("Rejection Reason";"Rejection Reason")
                {
                }
                field(Flag;Flag)
                {

                    trigger OnValidate();
                    begin
                        // Added by Vishnu Priya to log the flag cleared time.
                        IF Rec.Flag=FALSE THEN
                        BEGIN
                          "Flag Cleared Date" := TODAY;
                           Rec.MODIFY;
                        END;
                        // Added by Vishnu Priya to log the flag cleared time.

                        // Added by Vishnu Priya on 30-06-2020 for avoiding the muti time flag for the same vendor.
                        IF Rec.Flag = TRUE THEN
                          BEGIN
                            IRH.RESET;
                            IRH.SETCURRENTKEY(Flag,"Item No.","Vendor No.");
                            IRH.SETRANGE(Flag,TRUE);
                            IRH.SETFILTER("Item No.",Rec."Item No.");
                            IRH.SETFILTER("Vendor No.",Rec."Vendor No.");
                            IF IRH.FINDFIRST THEN
                              ERROR('Item was QC Flagged with the same vendor in IR Number: '+ IRH."No.");
                          END;
                        // Added by Vishnu Priya on 30-06-2020 for avoiding the muti time flag for the same vendor.
                    end;
                }
                field("MBB Status";"MBB Status")
                {
                    Editable = false;
                }
                field("HIC 60%";"HIC 60%")
                {
                    Editable = false;
                }
                field("HIC 10%";"HIC 10%")
                {
                    Editable = false;
                }
                field("HIC 5%";"HIC 5%")
                {
                    Editable = false;
                }
                field("MBB Packet Open DateTime";"MBB Packet Open DateTime")
                {
                    Editable = false;
                }
                field("MBB Packet Close DateTime";"MBB Packet Close DateTime")
                {
                    Editable = false;
                }
                field("Baked Hours";"Baked Hours")
                {
                    Editable = false;
                }
                field("MFD Date";"MFD Date")
                {
                    Editable = false;
                }
                field("Packed Date";"Packed Date")
                {
                    Editable = false;
                }
                field("Action Required";"Action Required")
                {

                    trigger OnValidate();
                    begin
                        /*
                        //added by vishnu priya on 12th Nov 2019 for the QC Flag Analysis
                        Fieldedit := FALSE;
                        IF Rec."Action Required" = TRUE THEN
                          Fieldedit := TRUE
                        ELSE
                          Fieldedit := FALSE;
                        //end by vishnu priya on 12th Nov 2019 for the QC Flag Analysis
                        */
                        //Fieldedit := TRUE;
                        
                        //B2BOTS >>
                        IF "Action Required" THEN
                          FieldValueEdit := TRUE
                        ELSE
                          FieldValueEdit := FALSE;
                        
                        IF NOT "Action Required" THEN
                          "Action Completed time" := CURRENTDATETIME;

                    end;
                }
                field("Action To Be Taken";"Action To Be Taken")
                {
                    Editable = Supervisor;
                }
                field("Tentative Clearance Date";"Tentative Clearance Date")
                {
                    Editable = true;
                }
                field("Flag Cleared Date";"Flag Cleared Date")
                {
                    Editable = false;
                }
                field("Concerned Dept";"Concerned Dept")
                {
                    Editable = true;
                }
                field("Action Completed time";"Action Completed time")
                {
                    Editable = false;
                }
                field("MBB Packed Date";"MBB Packed Date")
                {
                    Editable = false;
                }
            }
            group(Returns)
            {
                Caption = 'Returns';
                field("<Qty. Rework2>";"Qty. Rework")
                {
                    Editable = false;

                    trigger OnAssistEdit();
                    begin
                        QualityAcceptanceLevels(QualityType :: Rework);
                    end;
                }
                field("Qty. To Vendor (Rework)";"Qty. To Vendor (Rework)")
                {
                }
                field("Qty. Sent To Vendor (Rework)";"Qty. Sent To Vendor (Rework)")
                {
                    Editable = false;
                }
                field("<Qty. Rejected2>";"Qty. Rejected")
                {
                    Editable = false;

                    trigger OnAssistEdit();
                    begin
                        QualityAcceptanceLevels(QualityType :: Rejected);
                    end;
                }
                field("Qty. To Vendor (Rejected)";"Qty. To Vendor (Rejected)")
                {
                }
                field("Qty. Sent To Vendor (Rejected)";"Qty. Sent To Vendor (Rejected)")
                {
                    Editable = false;
                }
                field("Rework Reference Document No.";"Rework Reference Document No.")
                {
                    MultiLine = true;

                    trigger OnValidate();
                    begin
                        IF DeliveryReceiptEntry.GET("Rework Reference Document No.") THEN
                         "Qty. To Receive(Rework)" := DeliveryReceiptEntry."Remaining Quantity";
                    end;
                }
                field("<Qty. To Receive(Rework)2>";"Qty. To Receive(Rework)")
                {

                    trigger OnValidate();
                    begin
                        TESTFIELD("Rework Reference Document No.");
                        IF "Rework Reference Document No." <> 0 THEN BEGIN
                          IF DeliveryReceiptEntry.GET("Rework Reference Document No.") THEN
                            IF "Qty. To Receive(Rework)" > DeliveryReceiptEntry."Remaining Quantity" THEN
                               ERROR('You can not receive more against this refernce document no.');
                        END;
                        /*
                        IF "Qty. To Receive(Rework)" MOD (Quantity/"Quantity(Base)") <> 0 THEN
                          ERROR('Enter Quantity equivalent to Pieces');
                        */

                    end;
                }
                field("Qty. Received(Rework)";"Qty. Received(Rework)")
                {
                    Editable = false;
                }
            }
            group(Calibration)
            {
                Caption = 'Calibration';
                field("<Vendor No.2>";"Vendor No.")
                {
                }
                field("<Vendor Name2>";"Vendor Name")
                {
                }
                field("<Address2>";Address)
                {
                }
                field("<Address 3>";"Address 2")
                {
                }
                field("<Contact Person2>";"Contact Person")
                {
                }
                field("Calibration Status";"Calibration Status")
                {
                }
                field(Results;Results)
                {
                }
                field(Recommendations;Recommendations)
                {
                }
                field("Calibration Party";"Calibration Party")
                {
                }
                field("<Resource2>";Resource)
                {
                }
                field("Eqpt. Serial No.";"Eqpt. Serial No.")
                {
                }
                field(Department;Department)
                {
                }
                field("Std. Reference";"Std. Reference")
                {
                }
                field("Least Count";"Least Count")
                {
                }
                field("Measuring Range";"Measuring Range")
                {
                }
                field("Model No.";"Model No.")
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
                    Editable = false;
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
                field("Posted By";"Posted By")
                {
                }
                field("Reason for Pending";"Reason for Pending")
                {
                    Editable = false;
                }
            }
            group("Purchase Followup")
            {
                Caption = 'Purchase Followup';
                field("Reject/Rework Note No.";"Reject/Rework Note No.")
                {
                    Editable = rej_note_edit;
                }
                field("Purchase Status";"Purchase Status")
                {
                    Editable = pur_editable;
                }
                field("Debit Note No.";"Debit Note No.")
                {
                }
                field("Rework Sent Date";"Rework Sent Date")
                {
                    Editable = pur_editable;
                }
                field("Rework Status";"Rework Status")
                {
                    Editable = pur_editable;
                }
                field("Expected Recv Date";"Expected Recv Date")
                {
                    Caption = 'Expected Receive Date';
                    Editable = pur_editable;
                }
                field("Received Date";"Received Date")
                {
                    Editable = pur_editable;
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
                Image = Receipt;
                action("Posted &Inspect. DS Details")
                {
                    Caption = 'Posted &Inspect. DS Details';
                    Image = ViewDetails;
                    RunObject = Page "Posted Inspect. DS Details";
                    RunPageLink = Inspection Receipt No.=FIELD(No.);
                }
                action("&Rework Receipts")
                {
                    Caption = '&Rework Receipts';
                    Image = ReturnReceipt;
                    RunObject = Page "Inspection Receipt List";
                    RunPageLink = Rework Reference No.=FIELD(No.);
                }
                separator("----")
                {
                    Caption = '----';
                }
                action("&Purchase Receipt")
                {
                    Caption = '&Purchase Receipt';
                    Image = TransferReceipt;
                    RunObject = Page "Posted Purchase Receipt";
                    RunPageLink = No.=FIELD(Receipt No.);
                }
                separator(Action1102152012)
                {
                }
            }
            group("&Item")
            {
                Caption = '&Item';
                Image = Item;
                action("Ro&uting")
                {
                    Caption = 'Ro&uting';
                    Image = Item;

                    trigger OnAction();
                    begin

                        TESTFIELD("Qty. Rework");
                        TESTFIELD("Prod. Order No.");
                        TESTFIELD("Routing Reference No.");
                        TESTFIELD("Routing No.");

                        ProdOrderInspectRtng.SETRANGE(Status,ProdOrderInspectRtng.Status :: Released);
                        ProdOrderInspectRtng.SETRANGE("Prod. Order No.","Prod. Order No.");
                        ProdOrderInspectRtng.SETRANGE("Routing Reference No.","Routing Reference No.");
                        ProdOrderInspectRtng.SETRANGE("Routing No.","Routing No.");
                        ProdOrderInspectRtng.SETRANGE("Inspection Receipt No.","No.");

                        PAGE.RUN(PAGE :: "Inspect Prod. Order Routing",ProdOrderInspectRtng);
                    end;
                }
                action(Components)
                {
                    Caption = 'Components';
                    Image = Components;

                    trigger OnAction();
                    begin

                        TESTFIELD("Qty. Rework");
                        TESTFIELD("Prod. Order No.");
                        TESTFIELD("Routing Reference No.");
                        TESTFIELD("Routing No.");

                        ProdOrderComp.SETRANGE(Status,ProdOrderComp.Status ::  Released);
                        ProdOrderComp.SETRANGE("Prod. Order No.","Prod. Order No.");
                        ProdOrderComp.SETRANGE("Prod. Order Line No.","Prod. Order Line");
                        ProdOrderComp.SETRANGE("Inspection Receipt No.","No.");

                        PAGE.RUN(PAGE::"Prod. Order Inspect Components",ProdOrderComp);
                    end;
                }
                action("Quality LedgerEntries")
                {
                    Caption = 'Quality LedgerEntries';
                    Image = LedgerEntries;
                    RunObject = Page "Quality Ledger Entries";
                    RunPageLink = Document No.=FIELD(No.);
                    ShortCutKey = 'Ctrl+F5';
                }
                action("Delivery/Receipt Entries")
                {
                    Caption = 'Delivery/Receipt Entries';
                    Image = Entries;
                    RunObject = Page "Delivery/Receipt Entries";
                    RunPageLink = Document No.=FIELD(No.);
                }
                separator(Action1102152008)
                {
                }
                action("Item &Tracking Lines")
                {
                    Caption = 'Item &Tracking Lines';
                    Image = ItemTrackingLines;

                    trigger OnAction();
                    begin
                        IF NOT "Quality Before Receipt" THEN
                          ShowItemTrackingLines;
                    end;
                }
                action("Item &Tracking Lines2")
                {
                    Caption = 'Item &Tracking Lines2';
                    Image = ItemTrackingLines;
                    RunObject = Page "Quality Ledger Entries";
                    RunPageLink = Document No.=FIELD(No.);
                }
            }
        }
        area(processing)
        {
            Caption = '<Action1900000004>';
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Create Inspection Data &Sheets")
                {
                    Caption = 'Create Inspection Data &Sheets';
                    Image = CreatePutAway;
                    Visible = false;

                    trigger OnAction();
                    begin
                        InspectReceipt.CreateReworkInspectDataSheets(Rec);
                    end;
                }
                action(Rework)
                {
                    Caption = 'Rework';
                    Image = CalculateWIP;

                    trigger OnAction();
                    begin
                        IF "Item Tracking Exists" THEN
                          InspectJnlPostLine.UpdateSentBackToVendor(Rec)
                        ELSE
                          InspectJnlPostLine.FillReworkItemJnlLineAndPost(Rec);
                        UpdateQCCheck(Rec);
                        CurrPage.UPDATE;
                    end;
                }
                action(Receive)
                {
                    Caption = 'Receive';
                    Image = ReceivableBill;

                    trigger OnAction();
                    begin
                        //B2B
                        TESTFIELD("Qty. To Receive(Rework)");
                        //TESTFIELD("Rework Posted");//RQC1.0 B2B 290508
                        //B2B
                        IF "Item Tracking Exists" THEN
                          InspectJnlPostLine.UpdateReceiveRework(Rec)
                        ELSE
                         InspectJnlPostLine.ReceiveReworkAndPost(Rec);


                        CurrPage.UPDATE;
                    end;
                }
                action("&Attachments")
                {
                    Caption = '&Attachments';
                    Image = Attach;

                    trigger OnAction();
                    begin

                        Attachment.RESET;
                        Attachment.SETRANGE("Table ID",DATABASE::"Inspection Receipt Header");
                        Attachment.SETRANGE("Document No.","No.");
                        //Attachment.SETRANGE("Document Type","Document Type");

                        PAGE.RUN(PAGE::"ESPL Attachments",Attachment);
                    end;
                }
            }
            action("&Print")
            {
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    InspectRcpt.SETRANGE(InspectRcpt."No.","No.");
                    REPORT.RUN(33000254,TRUE,FALSE,InspectRcpt);
                    InspectRcpt.SETRANGE(InspectRcpt."No.");
                end;
            }
            action("Rejection NOte mail")
            {
                Visible = false;

                trigger OnAction();
                begin
                        // added by sujani for testing purpose
                        SMTP_MAIL.CreateMessage('rejection Note','erp@efftronics.com','sujani@efftronics.com','Rejection Note',Body,TRUE);
                      //  IRH.RESET;
                      //  IRH.SETFILTER("No.",Rec."No.");
                       // IF IRH.FINDSET THEN
                          BEGIN
                          FileDirectory := '\\erpserver\ErpAttachments\QC_Rejection_Note\';
                          //FileName:=IRH."No.");
                          //filesub:=COPYSTR("No.",5,5);
                          FileName :='QC Rejection Note '+Rec."No."+ '.pdf';
                          REPORT.RUN(32000006,FALSE,FALSE,Rec);
                          REPORT.SAVEASPDF(32000006,FileDirectory+FileName,Rec);
                          QC_ATCH:=FileDirectory+FileName;
                          SMTP_MAIL.AddAttachment(QC_ATCH,FileName);
                          END;
                          SMTP_MAIL.Send;
                end;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        // Added by Rakesh for Permissions in Purchase Details
        IF UPPERCASE(USERID) IN ['EFFTRONICS\PARDHU','EFFTRONICS\SIRISHA','EFFTRONICS\MNRAJU','EFFTRONICS\RAKESHT','EFFTRONICS\B2BOTS'] THEN
          rej_note_edit:=TRUE
        ELSE
          rej_note_edit:=FALSE;

        IF UPPERCASE(USERID) IN ['EFFTRONICS\PARDHU','EFFTRONICS\RAKESHT','EFFTRONICS\MNRAJU','EFFTRONICS\B2BOTS'] THEN
          pur_editable:=TRUE
        ELSE
          pur_editable:=FALSE;

        IF "Rework Status" = "Rework Status"::Completed THEN
        BEGIN
          pur_editable:=FALSE;
          rej_note_edit:=FALSE;
        END;

        IF UPPERCASE(USERID) IN ['EFFTRONICS\ANILKUMAR','EFFTRONICS\RAKESHT','EFFTRONICS\MNRAJU','EFFTRONICS\B2BOTS'] THEN
        BEGIN
          pur_editable:=TRUE;
          rej_note_edit:=TRUE
        END;

        IF USERID IN ['EFFTRONICS\VISHNUPRIYA','EFFTRONICS\B2BOTS'] THEN
          EditableOrNot := TRUE
        ELSE EditableOrNot := FALSE;
        IF USERID IN ['EFFTRONICS\VIJAYALAKSHMIB'] THEN
          Supervisor := TRUE;
    end;

    var
        ProdOrderInspectRtng : Record "Ins Prod. Order Routing Line";
        ProdOrderComp : Record "Prod. Order Inspect Component";
        InspectReceipt : Codeunit "Inspection Data Sheets";
        InspectJnlPostLine : Codeunit "Inspection Jnl.-Post Line";
        InspectRcpt : Record "Inspection Receipt Header";
        QualityType : Option Accepted,"Accepted Under Deviation",Rework,Rejected;
        DeliveryReceiptEntry : Record "Delivery/Receipt Entry";
        Attachment : Record Attachments;
        ItemLedgEntry : Record "Item Ledger Entry";
        Rejection : Record "QC Rejection Master";
        pur_editable : Boolean;
        rej_note_edit : Boolean;
        FileDirectory : Text[100];
        FileName : Text[100];
        QC_ATCH : Text;
        attachments : Record Attachments;
        Fname : Text[250];
        SMTP_MAIL : Codeunit "SMTP Mail";
        Body : Text;
        Fieldedit : Boolean;
        EditableOrNot : Boolean;
        Supervisor : Boolean;
        FieldValueEdit : Boolean;
        IRH : Record "Inspection Receipt Header";

    [LineStart(23132)]
    procedure UpdateQCCheck(InspRcpt : Record "Inspection Receipt Header");
    begin
        IF InspRcpt."Item Ledger Entry No." <> 0 THEN BEGIN
          IF InspRcpt."Rework Level" = 0 THEN BEGIN
            IF ItemLedgEntry.GET(InspRcpt."Item Ledger Entry No.") THEN BEGIN
              IF ItemLedgEntry."Remaining Quantity" = 0 THEN
                ItemLedgEntry."QC Check" := FALSE;
              ItemLedgEntry.MODIFY;
            END;
          END ELSE BEGIN
            IF ItemLedgEntry.GET(InspRcpt."DC Inbound Ledger Entry.") THEN BEGIN
              IF ItemLedgEntry."Remaining Quantity" = 0 THEN
                ItemLedgEntry."QC Check" := FALSE;
              ItemLedgEntry.MODIFY;
            END;
          END;
        END;
    end;
}

