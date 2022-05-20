page 60043 "Indent Subform"
{
    // version B2B1.0,POAU

    AutoSplitKey = true;
    PageType = ListPart;
    SaveValues = true;
    SourceTable = "Indent Line";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field(Type;Type)
                {
                }
                field("Line No.";"Line No.")
                {
                }
                field("No.";"No.")
                {
                }
                field(Description;Description)
                {
                }
                field("Unit of Measure";"Unit of Measure")
                {
                }
                field(Quantity;Quantity)
                {
                }
                field("Delivery Location";"Delivery Location")
                {
                }
                field("Store Qty";"Store Qty")
                {
                }
                field(Make;Make)
                {
                }
                field(Remarks;Remarks)
                {
                }
                field("Purchase Remarks";"Purchase Remarks")
                {
                }
                field("Indent Status";"Indent Status")
                {
                    Editable = "Indent StatusEditable";
                    Enabled = "Indent StatusEnable";
                }
                field("ICN No.";"ICN No.")
                {
                }
                field("Sale Order No.";"Sale Order No.")
                {
                }
                field("Part Number";"Part Number")
                {
                }
                field("Suitable Vendor";"Suitable Vendor")
                {
                }
                field("Unit Cost";"Unit Cost")
                {
                }
                field("G/L Account";"G/L Account")
                {
                }
                field("Production Order";"Production Order")
                {
                }
                field("Production Order Line No.";"Production Order Line No.")
                {
                }
                field("Production Start date";"Production Start date")
                {
                }
                field("Purchase Order Number";"Purchase Order Number")
                {
                }
                field("Purchase Order Line Number";"Purchase Order Line Number")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        IndentStatusOnFormat;
    end;

    trigger OnInit();
    begin
        "Indent StatusEnable" := TRUE;
        "Indent StatusEditable" := TRUE;
    end;

    var
        IndentHeader : Record "Indent Header";
        [InDataSet]
        "Indent StatusEditable" : Boolean;
        [InDataSet]
        "Indent StatusEnable" : Boolean;

    [LineStart(5511)]
    local procedure IndentStatusOnInputChange(var Text : Text[1024]);
    begin
        IF FORMAT("Indent Status")='Cancel' THEN
          TESTFIELD(Remarks);

        IF (USERID<>'07TE024')  AND (USERID<>'SUPER')AND (USERID<>'10RD010')  THEN
        BEGIN
         IF FORMAT("Indent Status")='Order' THEN
          ERROR('You are Changing the Indent Status Which has Ordered');
        END;
    end;

    [LineStart(5521)]
    local procedure IndentStatusOnFormat();
    begin
        IF ((USERID<>'EFFTRONICS\RENUKACH') AND  (USERID<>'EFFTRONICS\ANANDA') AND  (USERID<>'EFFTRONICS\BRAHMAIAH') AND (USERID<>'EFFTRONICS\PADMASRI') AND
            (USERID<>'EFFTRONICS\VISHNUPRIYA')  AND (USERID<>'EFFTRONICS\PARDHU') AND  (USERID<>'EFFTRONICS\ANILKUMAR')AND (USERID<>'EFFTRONICS\PRANAVI') AND (USERID<>'EFFTRONICS\VIJAYA')AND (USERID<>'EFFTRONICS\JHANSI')) THEN
        BEGIN
         "Indent StatusEditable" :=FALSE;
         //CurrForm."Indent Status".VISIBLE:=FALSE;
         "Indent StatusEnable" :=FALSE;
        END ELSE
        BEGIN
         "Indent StatusEditable" :=TRUE;
         //CurrForm."Indent Status".VISIBLE:=FALSE;
         "Indent StatusEnable" :=TRUE;
        END;
    end;
}

