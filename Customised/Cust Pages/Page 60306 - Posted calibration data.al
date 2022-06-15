page 60306 "Posted calibration data"
{
    Editable = false;
    PageType = List;
    SourceTable = "Calibration Ledger Entries";

    layout
    {
        area(content)
        {
            field("xRec.COUNT"; xRec.COUNT)
            {
            }
            repeater(Group)
            {
                field("Entry No"; "Entry No")
                {
                    Style = StrongAccent;
                    StyleExpr = atch_entrno_clr_flg;

                    trigger OnAssistEdit();
                    begin
                        Attachments.RESET;
                        Attachments.SETRANGE("Table ID", 33000929);
                        Attachments.SETRANGE("Document No.", Rec."Entry No");
                        IF Attachments.FINDSET THEN BEGIN
                            IF (Attachments."Attachment Status" = FALSE) THEN
                                MESSAGE('No attachment')
                            ELSE BEGIN
                                PAGE.RUN(PAGE::"ESPL Attachments", Attachments)
                            END;
                        END;
                    end;
                }
                field("Equipment No"; "Equipment No")
                {
                }
                field(Description; Description)
                {
                }
                field("Equipment Type"; "Equipment Type")
                {
                }
                field("Eqpt. Serial No."; "Eqpt. Serial No.")
                {
                }
                field("IR No"; "IR No")
                {
                }
                field("Item No"; "Item No")
                {
                }
                field("Item Desc"; "Item Desc")
                {
                }
                field("Model No."; "Model No.")
                {
                }
                field("Last Calibration Date"; "Last Calibration Date")
                {
                }
                field("Calibration Period"; "Calibration Period")
                {
                }
                field("Next Calibration Due On"; "Next Calibration Due On")
                {
                }
                field(Manufacturer; Manufacturer)
                {
                }
                field("MFG. Serial No."; "MFG. Serial No.")
                {
                }
                field("Purchase Date"; "Purchase Date")
                {
                }
                field("Calibration Party"; "Calibration Party")
                {
                }
                field("Created Date"; "Created Date")
                {
                }
                field("Last Modified Date"; "Last Modified Date")
                {
                }
                field("Created By"; "Created By")
                {
                }
                field("Modified By"; "Modified By")
                {
                }
                field(Transfered_from; Transfered_from)
                {
                }
                field("Unit cost(LCY)"; "Unit cost(LCY)")
                {
                }
                field("Owner of the Equpmnt"; "Owner of the Equpmnt")
                {
                }
                field("Owner of the Equpmnt_empid"; "Owner of the Equpmnt_empid")
                {
                }
                field("Owner of the Equpmnt_Dept"; "Owner of the Equpmnt_Dept")
                {
                }
                field(Remarks; Remarks)
                {
                }
                field(Classification; Classification)
                {
                }
                field("Reason for Delay"; "Reason for Delay")
                {
                }
                field("Delay Days"; "Delay Days")
                {
                }
                field("Previously Calibrated Times"; "Previously Calibrated Times")
                {
                }
                field("No of times calibrated"; "Least Count")
                {
                }
                field("Life time in Yrs"; "Life time in Yrs")
                {
                }
                field("Master Item"; "Master Item")
                {
                }
                field("Not an ERP Integrated"; "Not an ERP Integrated")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Attachments)
            {
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        Attachments.RESET;
        Attachments.SETRANGE("Table ID", 33000929);
        Attachments.SETRANGE("Document No.", Rec."Entry No");
        IF Attachments.FINDSET THEN BEGIN
            IF (Attachments."Attachment Status" = FALSE) THEN
                atch_entrno_clr_flg := FALSE
            ELSE
                atch_entrno_clr_flg := TRUE;
        END
        ELSE
            atch_entrno_clr_flg := FALSE;
    end;

    trigger OnOpenPage();
    begin
        atch_entrno_clr_flg := FALSE;
    end;

    var
        Attachments: Record Attachments;
        atch_entrno_clr_flg: Boolean;
}

