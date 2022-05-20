page 33000257 "Inspection Data Sheet"
{
    // version QC1.1,Cal1.0,RQC1.0,Rev01

    DeleteAllowed = false;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Inspection Datasheet Header";
    SourceTableView = SORTING(No.) ORDER(Ascending) WHERE(Source Type=CONST(In Bound));

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
                field(Description;Description)
                {
                    Editable = false;
                }
                field("Item No.";"Item No.")
                {
                    Editable = false;
                }
                field("Item Description";"Item Description")
                {
                    Editable = Makeedit;
                }
                field(Quantity;Quantity)
                {
                    DecimalPlaces = 0:2;
                    Editable = false;
                }
                field("Unit Of Measure Code";"Unit Of Measure Code")
                {
                    Editable = false;
                }
                field("Spec ID";"Spec ID")
                {
                    Editable = false;
                }
                field(Make;Make)
                {
                    Editable = Makeedit;
                }
                field("Lot No.";"Lot No.")
                {
                    Editable = Makeedit;
                }
                field(Location;Location)
                {
                    Editable = false;
                }
                field("Inspection Group Code";"Inspection Group Code")
                {
                    Editable = false;
                }
                field("Posting Date";"Posting Date")
                {
                    Editable = false;
                }
                field("Document Date";"Document Date")
                {
                    Editable = false;
                }
                field("Inspection Receipt No.";"Inspection Receipt No.")
                {
                    Editable = false;
                }
                field("Rework Reference No.";"Rework Reference No.")
                {
                    Editable = false;
                }
                field("Source Type";"Source Type")
                {
                    Editable = false;
                }
                field(Status;Status)
                {
                    Editable = false;
                }
                field("Actual Time";"Actual Time")
                {
                    Caption = 'Bench Mark Time';
                    Editable = false;
                }
                field("Time Taken";"Time Taken")
                {
                    Editable = false;
                }
                field("Creation DateTime";"Creation DateTime")
                {
                }
                field(MSL;MSL)
                {
                    Caption = 'MSL';
                    Editable = false;
                }
                field("ESD Class";"ESD Class")
                {
                    Caption = 'ESD Class';
                    Editable = false;
                }
                field("Floor Life at 25 C 40% RH";"Floor Life at 25 C 40% RH")
                {
                    Caption = 'Floor Life at 25 C 40% RH';
                    Editable = false;
                }
                field("Component Shelf Life(Years)";"Component Shelf Life(Years)")
                {
                    Caption = 'Component Shelf Life(Years)';
                    Editable = false;
                }
                field("Bake Hours";"Bake Hours")
                {
                    Caption = 'Component Bake Hours';
                    Editable = false;
                }
            }
            part(subform;"Inspection Data Sheet Subform")
            {
                SubPageLink = Document No.=FIELD(No.);
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
                field("Vendor Address";"Vendor Address")
                {
                    Editable = false;
                }
                field("Vendot Address 2";"Vendot Address 2")
                {
                    Editable = false;
                }
                field("Contact Person";"Contact Person")
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

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                         PurchHeaderGrec.RESET;
                         PurchHeaderGrec.SETFILTER(PurchHeaderGrec."No.","Order No.");
                         IF PurchHeaderGrec.FINDFIRST THEN
                         PAGE.RUNMODAL(50,PurchHeaderGrec)
                    end;
                }
                field("Purch Line No";"Purch Line No")
                {
                    Editable = false;
                }
                field("Purchase Consignment No.";"Purchase Consignment No.")
                {
                    Editable = false;
                }
                field("External Document No.";"External Document No.")
                {
                    Editable = false;
                }
                field("Item Tracking Exists";"Item Tracking Exists")
                {
                    Editable = false;
                }
                field("Quality Before Receipt";"Quality Before Receipt")
                {
                    Editable = false;
                }
                field(Indented_Person;Indented_Person)
                {
                    Caption = 'Indented_Person';
                    Editable = false;

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        PurchLineGrec.RESET;
                        PurchLineGrec.SETFILTER(PurchLineGrec."Document No.","Order No.");
                        PurchLineGrec.SETFILTER(PurchLineGrec."Line No.",'%1',"Purch Line No");
                        IF PurchLineGrec.FINDFIRST THEN
                        BEGIN
                          IF PurchLineGrec."Indent No." <>'' THEN
                          BEGIN
                            Indent_header.RESET;
                            IF Indent_header.GET(PurchLineGrec."Indent No.") THEN
                               PAGE.RUNMODAL(60042,Indent_header)
                          END;
                        END;
                    end;
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
                field("Prod. Description";"Prod. Description")
                {
                    Editable = false;
                }
                field("Production Batch No.";"Production Batch No.")
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
                field("Operation Description";"Operation Description")
                {
                    Editable = false;
                }
                field("Reason for Pending";"Reason for Pending")
                {
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
                    Editable = false;
                }
                field("OutPut Jr Serial No.";"OutPut Jr Serial No.")
                {
                    Editable = false;
                }
                field("Issues For Pending";"Issues For Pending")
                {
                }
                field("Finished Product Sr No";"Finished Product Sr No")
                {
                    Editable = false;
                }
                field("Rework User";"Rework User")
                {
                    Editable = false;
                }
            }
            group("Sales Returns")
            {
                Caption = 'Sales Returns';
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
                    Editable = false;
                }
                field("Trans. Order Line";"Trans. Order Line")
                {
                    Editable = false;
                }
                field("Trans. Description";"Trans. Description")
                {
                    Editable = false;
                }
                field("Transfer-from Code";"Transfer-from Code")
                {
                    Editable = false;
                }
                field("Transfer-to Code";"Transfer-to Code")
                {
                    Editable = false;
                }
            }
            group(Calibration)
            {
                Caption = 'Calibration';
                field("<Vendor No.2>";"Vendor No.")
                {
                    Editable = false;
                }
                field("<Vendor Name2>";"Vendor Name")
                {
                    Editable = false;
                }
                field("<Vendor Address2>";"Vendor Address")
                {
                    Editable = false;
                }
                field("<Vendot Address 22>";"Vendot Address 2")
                {
                    Editable = false;
                }
                field("<Contact Person2>";"Contact Person")
                {
                    Editable = false;
                }
                field("Calibration Party";"Calibration Party")
                {
                    Editable = false;
                }
                field("<Resource2>";Resource)
                {
                    Editable = false;
                }
                field("Eqpt. Serial No.";"Eqpt. Serial No.")
                {
                    Editable = false;
                }
                field("Least Count";"Least Count")
                {
                    Editable = false;
                }
                field(Department;Department)
                {
                    Editable = false;
                }
                field("Std. Reference";"Std. Reference")
                {
                    Editable = false;
                }
                field("Measuring Range";"Measuring Range")
                {
                    Editable = false;
                }
                field("Model No.";"Model No.")
                {
                    Editable = false;
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
                field("Reclass Entry";"Reclass Entry")
                {
                }
                field("Parent IDS No";"Parent IDS No")
                {
                }
                field("Partial Inspection";"Partial Inspection")
                {
                    Editable = PartInspec_Edit;
                }
                field("<Quantity2>";Quantity)
                {
                    DecimalPlaces = 0:0;
                    Editable = false;
                }
                field("Qty in IDS";"Qty in IDS")
                {
                    Editable = "Qty in IDSEditable";
                }
                field("Total Qty in IDS";"Total Qty in IDS")
                {
                    Editable = false;
                }
                field("Total Qty in IR";"Total Qty in IR")
                {
                    Editable = false;
                }
                field("Total Qty in PIR";"Total Qty in PIR")
                {
                    Editable = false;
                }
                field("Remaining Quantity";"Remaining Quantity")
                {
                    Caption = 'Remaining Quantity';
                    Editable = false;
                }
                field("Created Date";"Created Date")
                {
                    Editable = false;
                }
            }
            group("LED Details")
            {
                Caption = 'LED Details';
                field("LED Part No.";"LED Part No.")
                {
                    Caption = 'Part Number';
                    Editable = false;
                }
                field("LED Make";"LED Make")
                {
                    Caption = 'Make';
                    Editable = false;
                }
                field(Color;Color)
                {
                    Caption = 'Color';
                    Editable = false;
                }
                field("LED Type";"LED Type")
                {
                    Caption = 'Type';
                    Editable = false;
                }
                field("Intensity Code";"Intensity Code")
                {
                }
                field("Intensity Value";"Intensity Value")
                {
                }
                field("Color Code";"Color Code")
                {
                }
                field("Color Value";"Color Value")
                {
                }
                field("Voltage Code";"Voltage Code")
                {
                }
                field("Voltage Value";"Voltage Value")
                {
                }
                field("Ext Batch No";"Ext Batch No")
                {
                }
                field("Ext Lot No";"Ext Lot No")
                {
                }
                field("Date Code";"Date Code")
                {
                }
                field(Date;Date)
                {
                }
            }
            group(Inspection)
            {
                Caption = 'Inspection';
                field("MBB Status";"MBB Status")
                {
                }
                field("HIC 60%";"HIC 60%")
                {
                }
                field("HIC 10%";"HIC 10%")
                {
                }
                field("HIC 5%";"HIC 5%")
                {
                }
                field("MBB Packet Open DateTime";"MBB Packet Open DateTime")
                {
                }
                field("MBB Packet Close DateTime";"MBB Packet Close DateTime")
                {

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
                }
                field("MFD Date";"MFD Date")
                {
                }
                field("Packed Date";"Packed Date")
                {
                    Caption = 'Manf. Packed Date';
                }
                field("MBB Packed Date";"MBB Packed Date")
                {
                    Caption = 'MBB Packed Date after Baking';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Data Sheet")
            {
                Caption = '&Data Sheet';
                separator(Action1000000049)
                {
                }
                action("Purch. Receipt")
                {
                    Caption = 'Purch. Receipt';
                    Image = Receipt;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Posted Purchase Receipt";
                    RunPageLink = No.=FIELD(Receipt No.);
                }
                action("Calibration  &Procedure")
                {
                    Caption = 'Calibration  &Procedure';
                    Image = OpportunityList;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        CalProHeader.ShowCalProcForIDs(Rec);
                    end;
                }
                action(Specifications)
                {
                    Caption = 'Specifications';
                    Image = ItemVariant;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Sales Amc Subform1";
                    RunPageLink = Document Type=FIELD(Item No.);
                }
            }
            group(Item)
            {
                Caption = 'Item';
                action("Item &Tracking")
                {
                    Caption = 'Item &Tracking';
                    Image = ItemTracking;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        IF "Parent IDS No" = '' THEN BEGIN
                          QualityILE.RESET;
                          QualityILE.SETRANGE("Document No.","Receipt No.");
                          QualityILE.SETRANGE("Item No.","Item No.");
                          QualityILE.SETRANGE(QualityILE."Purch.Rcpt Line","Purch Line No");
                          QualityILE.SETRANGE(QualityILE."Child Ids",'');
                          QualityILE.SETRANGE(QualityILE.Select,FALSE);
                          QualityILE.SETRANGE(QualityILE."Lot No.","Lot No.");
                          PAGE.RUN(PAGE::"Quality Item Ledger Entries",QualityILE)
                        END ELSE BEGIN
                          QualityILE.RESET;
                          QualityILE.SETRANGE("Document No.","Receipt No.");
                          QualityILE.SETRANGE("Item No.","Item No.");
                          QualityILE.SETRANGE(QualityILE."Purch.Rcpt Line","Purch Line No");
                          QualityILE.SETRANGE(QualityILE.Select,TRUE);
                          QualityILE.SETRANGE(QualityILE."Child Ids","No.");
                          QualityILE.SETRANGE(QualityILE."Lot No.","Lot No.");
                           PAGE.RUN(PAGE::"Partial  IDS QLE",QualityILE);
                        END;
                    end;
                }
                action(Accept)
                {
                    Caption = 'Accept';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                         DataSheetLine.SETFILTER(DataSheetLine."Document No.","No.");
                         DataSheetLine.SETFILTER(DataSheetLine."Character Code",'<>'' ''');
                         IF DataSheetLine.FINDSET THEN
                         REPEAT
                         DataSheetLine.Accept:=TRUE;
                         DataSheetLine.MODIFY;
                         UNTIL DataSheetLine.NEXT=0;
                         MESSAGE(FORMAT(DataSheetLine.COUNT));
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Re&lease")
                {
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Ctrl+F11';

                    trigger OnAction();
                    var
                        "Count" : Integer;
                    begin
                        Count := 0;
                        DataSheetLine.SETRANGE("Document No.","No.");
                        IF DataSheetLine.FINDSET THEN
                          REPEAT
                            check := FALSE;
                            IF (DataSheetLine."Normal Value (Text)" <> '') OR (DataSheetLine."Min. Value (Text)" <> '')
                              OR (DataSheetLine."Max. Value (Text)" <>'') THEN
                                IF DataSheetLine."Actual  Value (Text)" = '' THEN BEGIN
                                  Count := Count + 1;
                                  check :=TRUE;
                                END;
                            IF (check=FALSE) AND ((DataSheetLine."Normal Value (Num)" <> 0) OR (DataSheetLine."Min. Value (Num)" <> 0)
                              OR (DataSheetLine."Max. Value (Num)" <> 0)) THEN
                                IF DataSheetLine."Actual Value (Num)" = 0 THEN
                                  Count := Count + 1;
                          UNTIL DataSheetLine.NEXT =0;


                        IF Count = 0 THEN BEGIN
                          IF CONFIRM(TEXT001,FALSE,Count) THEN
                            Status := Status ::Released;
                        END ELSE
                          IF CONFIRM(TEXT000,FALSE,Count) THEN
                            Status := Status ::Released;
                        CurrPage.UPDATE;
                    end;
                }
                action("Re&open")
                {
                    Caption = 'Re&open';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        Status := Status ::Open;
                        CurrPage.UPDATE;
                    end;
                }
                action(SalesDocument)
                {
                    Caption = 'SalesDocument';
                    Image = Document;

                    trigger OnAction();
                    begin
                        PurchHeaderGrec.RESET;
                        PurchHeaderGrec.SETFILTER(PurchHeaderGrec."No.","Order No.");
                        PurchHeaderGrec.SETFILTER(PurchHeaderGrec."Sale Order No",'<>%1','');
                        IF PurchHeaderGrec.FINDFIRST THEN
                        BEGIN
                          attachment.RESET;
                          attachment.SETRANGE("Table ID",DATABASE:: "Sales Header");
                          attachment.SETRANGE("Document No.",PurchHeaderGrec."Sale Order No");
                          PAGE.RUN(PAGE::"ESPL Attachments",attachment);
                        END
                        ELSE
                          ERROR('There is no sale order for this item');
                    end;
                }
                action("&Attachments")
                {
                    Caption = '&Attachments';
                    Image = Attachments;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin

                        attachment.RESET;
                        attachment.SETRANGE("Table ID",DATABASE:: "Inspection Datasheet Header");
                        //attachment.SETRANGE(attachment."Ids Reference No.",);
                        attachment.SETRANGE("Document No.","No.");
                        PAGE.RUN(PAGE::"ESPL Attachments",attachment);
                    end;
                }
                separator(Action1102154004)
                {
                }
                action("Select Ids Qty")
                {
                    Caption = 'Select Ids Qty';
                    Image = SelectEntries;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                              Selection := STRMENU(Text007,1);
                              IF Selection = 0 THEN
                                EXIT;

                              IDS_Qty:=0;
                              QualityILE.RESET;
                              QualityILE.SETRANGE("Document No.","Receipt No.");
                              QualityILE.SETRANGE("Item No.","Item No.");
                              QualityILE.SETRANGE(Select,FALSE);
                              IF Selection=2 THEN
                                PAGE.RUN(33000274,QualityILE)
                              ELSE
                              BEGIN
                              REPEAT
                                QualityILE.Select:=TRUE;
                                QualityILE.MODIFY;
                                IDS_Qty+=1;
                                QualityILE.NEXT;
                                MESSAGE(QualityILE."Serial No.");

                              UNTIL IDS_Qty<="Qty in IDS";
                              MESSAGE(FORMAT(IDS_Qty)+' items are selected');
                              END;
                    end;
                }
                action("Create &Reclassification")
                {
                    Caption = 'Create &Reclassification';
                    Image = CreateRating;
                    Promoted = true;

                    trigger OnAction();
                    begin
                        IF "Reclass Entry" THEN
                          ERROR(Text006);
                        IF ("Parent IDS No"<>'')THEN
                          ERROR('You cannot reclass')
                        ELSE
                        BEGIN
                          Item.GET("Item No.");
                          ItemTrackingCode.GET(Item."Item Tracking Code");
                          IF (ItemTrackingCode."Lot Specific Tracking") AND (ItemTrackingCode."SN Specific Tracking" = FALSE) THEN
                             CreateReclass
                          ELSE BEGIN
                            //ERROR(Text004);
                            IF "Parent IDS No" <> '' THEN
                            BEGIN
                              QualityILE.RESET;
                              QualityILE.SETRANGE("Document No.","Receipt No.");
                              QualityILE.SETRANGE("Item No.","Item No.");
                              QualityILE.SETRANGE(Select,TRUE);
                              QualityILE.SETRANGE(QualityILE."Lot No.","Lot No.");
                              PAGE.RUN(PAGE::"Partial  IDS QLE",QualityILE);
                              "Reclass Entry" := TRUE;
                              "Partial Inspection" := TRUE;
                              MODIFY;
                            END ELSE
                            BEGIN
                               Partial_Qty:="Qty in IDS";
                              QualityILE.RESET;
                              QualityILE.SETRANGE("Document No.","Receipt No.");
                              QualityILE.SETRANGE("Item No.","Item No.");
                              QualityILE.SETRANGE(Select,FALSE);
                              QualityILE.SETRANGE(QualityILE."Lot No.","Lot No.");
                              IF QualityILE.FINDFIRST THEN  //Added by sundar on 09-JAN-13 to reduce Automize the selection of Serial no
                              BEGIN                         //while creating Partial IDS
                                Selection := STRMENU(Text007,1);
                                IF Selection = 0 THEN
                                  EXIT;
                                IF Selection=2 THEN
                                BEGIN
                                  PAGE.RUNMODAL(33000274,QualityILE);
                                  Selected_Qty:=0;
                                  QualityILE2.RESET;
                                  QualityILE2.SETRANGE("Document No.","Receipt No.");
                                  QualityILE2.SETRANGE("Item No.","Item No.");
                                  QualityILE2.SETRANGE(Select,TRUE);
                                  QualityILE2.SETFILTER(QualityILE2."Child Ids",'%1','');
                                  QualityILE2.SETRANGE(QualityILE2."Lot No.","Lot No.");
                                  IF QualityILE2.FINDFIRST THEN
                                  REPEAT
                                    Selected_Qty+=QualityILE2."Remaining Quantity";
                                  UNTIL QualityILE2.NEXT=0;
                                  IF Selected_Qty<>"Qty in IDS" THEN
                                  BEGIN
                                    QualityILE2.RESET;
                                    QualityILE2.SETRANGE("Document No.","Receipt No.");
                                    QualityILE2.SETRANGE("Item No.","Item No.");
                                    QualityILE2.SETRANGE(Select,TRUE);
                                    QualityILE2.SETFILTER(QualityILE2."Child Ids",'%1','');
                                    QualityILE2.SETRANGE(QualityILE2."Lot No.","Lot No.");
                                    IF QualityILE2.FINDFIRST THEN
                                    REPEAT
                                      QualityILE2.Select:=FALSE;
                                      QualityILE2.MODIFY;
                                      COMMIT;
                                    UNTIL QualityILE2.NEXT=0;
                                    ERROR('You Did not select the specified quantity in IDS ');
                                  END;
                                END
                                ELSE BEGIN
                                  REPEAT
                                    QualityILE.Select:=TRUE;
                                    QualityILE.MODIFY;
                                    Partial_Qty:=Partial_Qty-1;
                                  UNTIL (QualityILE.NEXT=0) OR (Partial_Qty=0)
                                END;
                              END;// Added by sundar
                              //Page.RUN(FORM::"Partial  IDS QLE",QualityILE);
                              "Reclass Entry" := TRUE;
                              "Partial Inspection" := TRUE;
                              MODIFY;
                            END;
                          END;
                        END;
                    end;
                }
                separator(Action1102154010)
                {
                }
                action("Create &Partial IDS")
                {
                    Caption = 'Create &Partial IDS';
                    Image = CreateInteraction;
                    Promoted = true;

                    trigger OnAction();
                    begin
                           QualityILE.SETRANGE(QualityILE."Document No.","Receipt No.");
                           QualityILE.SETRANGE(QualityILE."Item No.","Item No.");
                           QualityILE.SETRANGE(QualityILE."Child Ids",'');
                           QualityILE.SETRANGE(QualityILE.Select,TRUE);
                           QualityILE.SETRANGE(QualityILE."Lot No.","Lot No.");
                           IF QualityILE.FINDFIRST THEN
                           BEGIN
                           IF (QualityILE.COUNT<>"Qty in IDS")THEN
                           ERROR('Mismatch in qty');
                           END;
                        
                        IF "Qty in IDS" = 0 THEN
                          ERROR(Text003);
                        IF NOT "Reclass Entry" THEN
                          ERROR(Text005);
                        Item.GET("Item No.");
                        //ItemTrackingCode.GET(Item."Item Tracking Code");
                        //IF ItemTrackingCode."Lot Specific Tracking" THEN
                          CreatePartialIDS
                        /*ELSE
                          ERROR(Text004);*/

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
                    begin
                        TESTFIELD(Status,Status :: Released);
                        IF "Source Type" = "Source Type"::"In Bound" THEN
                        BEGIN                                                      //modified by Swarupa on 12-01-09)
                        attachment.SETFILTER(attachment."Document No.","No.");
                        IF attachment.FINDFIRST THEN BEGIN
                         //IF (attachment."Attachment Status"=attachment."Attachment Status"::"0") THEN
                            //ERROR('Please Attach a Document to post IDS');
                        END ELSE
                         MESSAGE('Please Attach a Document to post IDS');

                        END;

                        IF "Issues For Pending" = "Issues For Pending"::"  "  THEN
                          ERROR('Please Select Issues For Pending. If No Issues - Select No Issue Option');

                        // >>Added by Pranavi on 19-05-2017 for MSL process
                        IF Item.GET("Item No.") THEN
                        BEGIN
                          IF Item.MSL <> 0 THEN
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
                            IF Item."Floor Life at 25 C 40% RH" IN['',' '] THEN
                              ERROR('Floor Life in Item card is not defined! Please contact TEMC!');
                            IF (Item.MSL IN [Item.MSL::"1",Item.MSL::"2"]) AND ("HIC 60%" <> "HIC 60%"::Blue) AND (Item."Floor Life at 25 C 40% RH" <> 'INFINITE') THEN
                            BEGIN
                              IF ("Baked Hours" <= 0) THEN
                                ERROR('Please enter baking hours!');
                              IF ("Baked Hours" <> "Bake Hours") AND ("Bake Hours" <> 0) THEN
                                ERROR('Baked Hours must equal to Bake hours defined in Item card : %1!',Item."Bake Hours");
                              IF "MBB Packed Date" = 0D THEN
                                ERROR('Please enter New MBB Packed Date!');
                            END;
                            IF (Item.MSL IN [Item.MSL::"2A",Item.MSL::"3",Item.MSL::"4",Item.MSL::"5",Item.MSL::"5A"]) AND (Item."Floor Life at 25 C 40% RH" <> 'INFINITE')
                              AND ("HIC 10%" <> "HIC 10%"::Blue) AND ("HIC 5%" <> "HIC 5%"::Pink) THEN
                            BEGIN
                              IF ("Baked Hours" <= 0) THEN
                                ERROR('Please enter baking hours!');
                              IF ("Baked Hours" <> "Bake Hours") AND ("Bake Hours" <> 0) THEN
                                ERROR('Baked Hours must equal to Bake hours defined in Item card : %1!',Item."Bake Hours");
                              IF "MBB Packed Date" = 0D THEN
                                ERROR('Please enter New MBB Packed Date!');
                            END;
                          END;
                        END;
                        // <<Added by Pranavi on 19-05-2017 for MSL process

                        IF NOT "Partial Inspection" THEN BEGIN
                          IF CONFIRM('Do you want to post the Inspection Data Sheets?') THEN BEGIN
                            IF ("Trans. Order No." <> '') THEN
                              PostInspectData.TransferOrderPostIDS(Rec)
                            ELSE
                              PostInspectData.RUN(Rec);
                            CurrPage.UPDATE;
                          END;
                        END ELSE BEGIN
                          TotalQtyinIds := 0;
                          TotalQtyinPostedIds := 0;
                          InspectDataSheet2.SETRANGE("Parent IDS No","No.");
                          InspectDataSheet2.SETRANGE("Partial Inspection",FALSE);
                          IF InspectDataSheet2.FINDSET THEN BEGIN
                            REPEAT
                              TotalQtyinIds += InspectDataSheet2.Quantity;
                            UNTIL InspectDataSheet2.NEXT = 0;
                          END;
                            PostInspectDataSheet2.SETRANGE("Parent IDS No","No.");
                            PostInspectDataSheet2.SETRANGE("Partial Inspection",FALSE);
                            IF PostInspectDataSheet2.FINDSET THEN BEGIN
                              REPEAT
                                TotalQtyinPostedIds += PostInspectDataSheet2.Quantity;
                              UNTIL PostInspectDataSheet2.NEXT = 0;
                            END;
                            IF  ((TotalQtyinIds+TotalQtyinPostedIds) <> Quantity) THEN
                                ERROR(Text002)


                            ELSE
                              IF CONFIRM('Do you want to post the Inspection Data Sheets?') THEN BEGIN
                                IF ("Trans. Order No." <> '') THEN
                                  PostInspectData.TransferOrderPostIDS(Rec)
                                ELSE
                                  PostInspectData.RUN(Rec);
                                CurrPage.UPDATE;
                             END;
                           END;
                    end;
                }
                action("&Print")
                {
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;

                    trigger OnAction();
                    begin
                        InspectDataSheet.SETRANGE("No.","No.");
                        REPORT.RUN(33000250,TRUE,FALSE,InspectDataSheet);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        OnAfterGetCurrRecord;
        //>>Added by Pranavi on 17-05-2017 for MSL Process
        IF Item.GET("Item No.") THEN
        BEGIN
          MSL:=Item.MSL;
          "ESD Class":=Item."ESD Class";
          "Floor Life at 25 C 40% RH":=Item."Floor Life at 25 C 40% RH";
          "Bake Hours":=Item."Bake Hours";
          "Component Shelf Life(Years)":=Item."Component Shelf Life(Years)";
        END;
        //<<Added by Pranavi on 17-05-2017 for MSL Process
    end;

    trigger OnInit();
    begin
        "Qty in IDSEditable" := TRUE;
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        OnAfterGetCurrRecord;
    end;

    trigger OnOpenPage();
    begin
        CALCFIELDS("Total Qty in IDS");
        IF "Parent IDS No" <> '' THEN
          "Qty in IDSEditable" := FALSE
        ELSE
          "Qty in IDSEditable" := TRUE;
        IF USERID IN ['EFFTRONICS\SUJANI','EFFTRONICS\VISHNUPRIYA','EFFTRONICS\B2BOTS'] THEN
          BEGIN
            PartInspec_Edit := TRUE;
            Makeedit := TRUE;
          END
        ELSE
          BEGIN
          PartInspec_Edit := FALSE;
           Makeedit := FALSE;
           END;
    end;

    var
        TEXT000 : Label 'Actual values are not entered for %1 lines.\Do You want to release the Document?';
        DataSheetLine : Record "Inspection Datasheet Line";
        PostInspectData : Codeunit "Post-Inspection Data Sheet";
        check : Boolean;
        TEXT001 : Label 'Do You want to release the Document?';
        InspectDataSheet : Record "Inspection Datasheet Header";
        PostInspectDataSheet : Record "Posted Inspect DatasheetHeader";
        attachment : Record Attachments;
        CalProHeader : Record "Calibration Procedure Header";
        Text002 : Label 'Partial Inspection Data sheet can not be posted.';
        Text003 : Label 'Qty in IDS should not be zero.';
        Item : Record Item;
        ItemTrackingCode : Record "Item Tracking Code";
        Text004 : Label 'Partial IDS can be created only for Lot specific tracking.';
        Text005 : Label 'Make  Reclassification before the Partial IDS creation.';
        Text006 : Label '"Create Partial IDS for previous reclassification. "';
        TotalQtyinIds : Decimal;
        TotalQtyinPostedIds : Decimal;
        InspectDataSheet2 : Record "Inspection Datasheet Header";
        PostInspectDataSheet2 : Record "Posted Inspect DatasheetHeader";
        ItemTracking : Record "Item Tracking Code";
        QualityILE : Record "Quality Item Ledger Entry";
        IDS_Qty : Integer;
        "Remaining Quantity" : Decimal;
        Partial_Qty : Integer;
        [InDataSet]
        "Qty in IDSEditable" : Boolean;
        PurchHeaderGrec : Record "Purchase Header";
        Selection : Integer;
        Text007 : Label '&Automatic,&Manual';
        SalesHeadGrec : Record "Sales Header";
        QualityILE2 : Record "Quality Item Ledger Entry";
        Selected_Qty : Decimal;
        Indented_Person : Code[20];
        Indent_header : Record "Indent Header";
        PurchLineGrec : Record "Purchase Line";
        PartInspec_Edit : Boolean;
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
        Makeedit : Boolean;

    [LineStart(22990)]
    local procedure OnAfterGetCurrRecord();
    begin
        xRec := Rec;
        SETRANGE("No.");

        IF "Parent IDS No" <> '' THEN
          "Qty in IDSEditable" := FALSE
        ELSE
          "Qty in IDSEditable" := TRUE;
        "Remaining Quantity":=Quantity-("Total Qty in IDS"+"Total Qty in IR"+"Total Qty in PIR");

        Indented_Person:='';
        PurchLineGrec.RESET;
        PurchLineGrec.SETFILTER(PurchLineGrec."Document No.","Order No.");
        PurchLineGrec.SETFILTER(PurchLineGrec."Line No.",'%1',"Purch Line No");
        IF PurchLineGrec.FINDFIRST THEN
        BEGIN
          IF PurchLineGrec."Indent No." <>'' THEN
          BEGIN
            Indented_Person:=PurchLineGrec."Indent No.";
          END;
        END;
    end;
}

