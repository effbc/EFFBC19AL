page 60164 "Calibration Inspection Receipt"
{
    // version Cal1.0,Rev01,EFFUPG

    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Document;
    SourceTable = "Inspection Receipt Header";
    SourceTableView = SORTING(No.) WHERE(Status = FILTER(No));

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
                    Editable = false;
                }
                field("Spec Version"; "Spec Version")
                {
                    Editable = false;
                }
                field("Lot No."; "Lot No.")
                {
                    Editable = false;
                }
            }
            part(Control1000000032; "Inpection Receipt Line")
            {
                SubPageLink = Document No.=FIELD(No.),Purch Line No.=FIELD(Purch Line No);
            }
            group(Calibration)
            {
                Caption = 'Calibration';
                field("Vendor No.";"Vendor No.")
                {
                    Editable = false;
                }
                field("Vendor Name";"Vendor Name")
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
                    Editable = false;
                }
                field(Resource;Resource)
                {
                    Editable = false;
                }
                field("Eqpt. Serial No.";"Eqpt. Serial No.")
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
                field("IDS Posted By";"IDS Posted By")
                {
                    Editable = false;
                }
                field("IR Posted By";"IR Posted By")
                {
                    Editable = false;
                }
                field("Model No.";"Model No.")
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
            group("&Receipt")
            {
                Caption = '&Receipt';
                action("&List")
                {
                    Caption = '&List';
                    Image = EditList;
                    RunObject = Page "Calib Inspection Receipt List";
                                    RunPageLink = Source Type=CONST(Calibration);
                                    ShortCutKey = 'F5';
                }
                action("&Inspection Data Sheets")
                {
                    Caption = '&Inspection Data Sheets';
                    Image = DataEntry;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Inspection Data Sheet List";
                                    RunPageLink = Receipt No.=FIELD(Receipt No.),Order No.=FIELD(Order No.),Purch Line No=FIELD(Purch Line No),Lot No.=FIELD(Lot No.);
                }
                action("P&osted Inspect. Data Sheets")
                {
                    Caption = 'P&osted Inspect. Data Sheets';
                    Image = PostedServiceOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Posted Inspect Data Sheet List";
                                    RunPageLink = Inspection Receipt No.=FIELD(No.);
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
                    PromotedCategory = Process;
                    ShortCutKey = 'F9';

                    trigger OnAction();
                    var
                        Calibration : Record Calibration;
                    begin
                        IF NOT CONFIRM('Do you want to Post the Inspection Receipt?') THEN
                          EXIT;
                        IF "Source Type" = "Source Type" :: Calibration THEN BEGIN
                          Calibration.SETRANGE("Equipment No","Item No.");
                          IF Calibration.FINDFIRST THEN BEGIN
                            Calibration."Current Status" := Calibration."Current Status" :: Calibrated;
                            Calibration.Results := Results;
                            Calibration.Recommendations := Recommendations;
                            Calibration.Status := "Calibration Status";
                            Calibration."Last Calibration Date" := WORKDATE;
                            Calibration."Next Calibration Due On" := CALCDATE(Calibration."Calibration Period",Calibration."Last Calibration Date");
                            Calibration."Expected Return Date" := 0D;
                            IF Calibration."Calibration Party" = Calibration."Calibration Party" :: "External Calibration" THEN
                              Calibration."Calibration Cert No./ IR No" := "No.";
                            Calibration.MODIFY;
                          END;

                          Status := TRUE;
                          CurrPage.SAVERECORD;
                          MESSAGE(Text001,"No.");
                          CurrPage.UPDATE(TRUE);
                        END ELSE BEGIN
                          IF "Trans. Order No." <> '' THEN
                            InspectJnlLine.TransferOrderIRPost(Rec)
                          ELSE BEGIN
                            CancelReservation(Rec);
                            InspectJnlLine.RUN(Rec);
                          END;
                          Status := TRUE;
                          CurrPage.SAVERECORD;
                          MESSAGE(Text001,"No.");
                          CurrPage.UPDATE(TRUE);
                        END;
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
    end;

    var
        Text001 : Label 'Inspection receipt %1 posted successfully.';
        InspectJnlLine : Codeunit "Inspection Jnl.-Post Line";
        QualityType : Option Accepted,"Accepted Under Deviation",Rework,Rejected;
        UndefinedQty : Decimal;

    [LineStart(13507)]
    procedure CalculateUndefinedQty();
    begin
        UndefinedQty := Quantity - "Qty. Accepted" - "Qty. Rejected" - "Qty. Rework" -"Qty. Accepted Under Deviation";
    end;

    [LineStart(13510)]
    procedure CancelReservation(var InspectionReceipt : Record "Inspection Receipt Header");
    var
        ReservationEntry : Record "Reservation Entry";
        ReservationEntry2 : Record "Reservation Entry";
        ReservEngineMgt : Codeunit "Reservation Engine Mgt.";
    begin
        ReservationEntry.SETRANGE("Source Ref. No.",InspectionReceipt."Item Ledger Entry No.");
        IF ReservationEntry.FINDFIRST THEN BEGIN
          ReservationEntry2.SETRANGE("Entry No.",ReservationEntry."Entry No.");
          IF ReservationEntry2.FINDSET THEN
          REPEAT
            ReservationEntry2.TESTFIELD("Reservation Status",ReservationEntry2."Reservation Status"::Reservation);
            ReservEngineMgt.CancelReservation(ReservationEntry2);//EFFUPG
            //ReservEngineMgt.CloseReservEntry2(ReservationEntry2);EFFUPG
             COMMIT;
          UNTIL ReservationEntry2.NEXT = 0;
        END;
    end;
}

