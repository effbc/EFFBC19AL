page 33000276 "Inspection Item Tracking Lines"
{
    // version QC1.0

    Caption = 'Inspection Item Tracking Lines';
    PageType = Worksheet;
    SourceTable = "Quality Item Ledger Entry";

    layout
    {
        area(content)
        {
            field("COUNT";COUNT)
            {
            }
            repeater(Control1)
            {
                ShowCaption = false;
                field("Serial No.";"Serial No.")
                {
                    Editable = false;
                }
                field("Lot No.";"Lot No.")
                {
                    Editable = true;
                }
                field(Quantity;Quantity)
                {
                    Editable = true;
                }
                field("Warranty Date";"Warranty Date")
                {
                    Editable = false;
                }
                field("Accept Under Deviation";"Accept Under Deviation")
                {
                }
                field("Inspection Status";"Inspection Status")
                {
                    Editable = false;
                }
                field(Accept;Accept)
                {
                }
                field(Rework;Rework)
                {
                }
                field("Sending to Rework";"Sending to Rework")
                {
                }
                field(Reject;Reject)
                {
                }
                field("Expiration Date";"Expiration Date")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage();
    var
        CaptionText1 : Text[100];
        CaptionText2 : Text[100];
    begin
        CaptionText1 := "Item No.";
        IF CaptionText1 <> '' THEN BEGIN
          CaptionText2 := CurrPage.CAPTION;
          CurrPage.CAPTION := STRSUBSTNO(Text001,CaptionText1,CaptionText2);
        END;

        //CurrPage."Sending to Rework".VISIBLE := FALSE;
    end;

    var
        Text001 : Label '%1 - %2';
}

