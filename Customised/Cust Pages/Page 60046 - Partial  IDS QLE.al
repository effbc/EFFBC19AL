page 60046 "Partial  IDS QLE"
{
    // version QC1.0

    PageType = List;
    SourceTable = "Quality Item Ledger Entry";

    layout
    {
        area(content)
        {
            field("COUNT";COUNT)
            {
            }
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Entry No.";"Entry No.")
                {
                    Editable = false;
                }
                field("Item No.";"Item No.")
                {
                    Editable = false;
                }
                field("Posting Date";"Posting Date")
                {
                    Editable = false;
                }
                field("Entry Type";"Entry Type")
                {
                    Editable = false;
                }
                field("Source No.";"Source No.")
                {
                    Editable = false;
                }
                field("Document No.";"Document No.")
                {
                    Editable = false;
                }
                field(Description;Description)
                {
                    Editable = false;
                }
                field("Purch.Rcpt Line";"Purch.Rcpt Line")
                {
                }
                field(Select;Select)
                {
                }
                field("Child Ids";"Child Ids")
                {
                    Editable = false;
                }
                field("Location Code";"Location Code")
                {
                    Editable = false;
                }
                field(Quantity;Quantity)
                {
                    Editable = false;
                }
                field("Remaining Quantity";"Remaining Quantity")
                {
                    Editable = false;
                }
                field("Invoiced Quantity";"Invoiced Quantity")
                {
                    Editable = false;
                }
                field("Applies-to Entry";"Applies-to Entry")
                {
                    Editable = false;
                }
                field(Open;Open)
                {
                    Editable = false;
                }
                field("Source Type";"Source Type")
                {
                    Editable = false;
                }
                field("Document Date";"Document Date")
                {
                    Editable = false;
                }
                field("External Document No.";"External Document No.")
                {
                    Editable = false;
                }
                field("Prod. Order No.";"Prod. Order No.")
                {
                    Editable = false;
                }
                field("Variant Code";"Variant Code")
                {
                    Editable = false;
                }
                field("Qty. per Unit of Measure";"Qty. per Unit of Measure")
                {
                    Editable = false;
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                    Editable = false;
                }
                field("Originally Ordered No.";"Originally Ordered No.")
                {
                    Editable = false;
                }
                field("Originally Ordered Var. Code";"Originally Ordered Var. Code")
                {
                    Editable = false;
                }
                field("Item Category Code";"Item Category Code")
                {
                    Editable = false;
                }
                field("Product Group Code";"Product Group Code")
                {
                    Editable = false;
                }
                field("Prod. Order Line No.";"Prod. Order Line No.")
                {
                    Editable = false;
                }
                field("Serial No.";"Serial No.")
                {
                    Editable = false;
                }
                field("Lot No.";"Lot No.")
                {
                    Editable = false;
                }
                field("Warranty Date";"Warranty Date")
                {
                    Editable = false;
                }
                field("Expiration Date";"Expiration Date")
                {
                    Editable = false;
                }
                field("Return Reason Code";"Return Reason Code")
                {
                    Editable = false;
                }
                field("Declared Goods";"Declared Goods")
                {
                    Editable = false;
                }
                field("Inspection Status";"Inspection Status")
                {
                    Editable = false;
                }
                field("Quality Ledger Entry No.";"Quality Ledger Entry No.")
                {
                    Editable = false;
                }
                field(Accept;Accept)
                {
                    Editable = false;
                }
                field(Rework;Rework)
                {
                    Editable = false;
                }
                field(Reject;Reject)
                {
                    Editable = false;
                }
                field("Accept Under Deviation";"Accept Under Deviation")
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
    begin
             QualityILE.SETRANGE(QualityILE."Document No.",IDS."Receipt No.");
             QualityILE.SETRANGE(QualityILE."Item No.",IDS."Item No.");
             QualityILE.SETRANGE(QualityILE."Purch.Rcpt Line",IDS."Purch Line No");
    end;

    trigger OnQueryClosePage(CloseAction : Action) : Boolean;
    begin
        /*QualityILE.SETRANGE("Document No.","Document No.");
        QualityILE.SETRANGE("Child Ids",'');
        QualityILE.SETRANGE(Select,TRUE);
        IF NOT QualityILE.FINDFIRST THEN
          ERROR(Text001);      */
        
        IDS.RESET;
        IDS.SETRANGE(IDS."Receipt No.", "Document No.");
        IDS.SETRANGE(IDS."Item No.","Item No.");
        IF IDS.FINDFIRST THEN
        BEGIN
        
         IF IDS."Parent IDS No"='' THEN
         BEGIN
           SETRANGE(Select,TRUE);
           IF (IDS."Qty in IDS"<>COUNT)AND(IDS."Qty in IDS">0) THEN
           BEGIN
              RESET;
        
            SETRANGE("Document No.",IDS."Receipt No.");
            SETRANGE("Item No.",IDS."Item No.");
            SETRANGE("Child Ids",' ');
            SETRANGE("Lot No.",IDS."Lot No.");
        
              ERROR('You must select '+FORMAT(IDS."Qty in IDS"));
           END;
         END
        END
        
        ELSE
        EXIT;

    end;

    var
        QualityILE : Record "Quality Item Ledger Entry";
        Text001 : Label 'Select the Tracking Lines.';
        Flag : Boolean;
        IDS : Record "Inspection Datasheet Header";
}

