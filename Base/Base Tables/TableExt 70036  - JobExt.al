tableextension 70036 ResourceExt extends Job
{

    fields
    {


        field(60001; "Starting Time"; Time)
        {
            Description = 'B2B';

            trigger OnValidate();
            begin
                //   "Starting Date-Time" := DatetimeMgt.Datetime("Starting Date","Starting Time");
            end;
        }
        field(60002; "Ending Time"; Time)
        {
            Description = 'B2B';

            trigger OnValidate();
            begin
                //"Ending Date-Time" := DatetimeMgt.Datetime("Ending Date","Ending Time");
            end;
        }
        field(60003; "Starting Date-Time"; Decimal)
        {
            AutoFormatExpression = 'DATETIME';
            AutoFormatType = 10;
            DecimalPlaces = 2 :;
            Description = 'B2B';

            trigger OnValidate();
            begin
                //"Starting Date" := DatetimeMgt.Datetime2Date("Starting Date-Time");
                //"Starting Time" := DatetimeMgt.Datetime2Time("Starting Date-Time");
                Validate("Starting Time");
            end;
        }
        field(60004; "Ending Date-Time"; Decimal)
        {
            AutoFormatExpression = 'DATETIME';
            AutoFormatType = 10;
            DecimalPlaces = 2 :;
            Description = 'B2B';

            trigger OnValidate();
            begin
                //"Ending Date" := DatetimeMgt.Datetime2Date("Ending Date-Time");
                //"Ending Time" := DatetimeMgt.Datetime2Time("Ending Date-Time");
                Validate("Ending Time");
            end;
        }
        field(60005; "Status Code"; Code[10])
        {
            Description = 'B2B';
            TableRelation = Status.Code WHERE("Document No." = FIELD("No."),
                                               "Document Type" = CONST(Jobs));
        }
        field(60006; "Sales Order No."; Code[20])
        {
            Description = 'B2B';
            TableRelation = "Sales Header"."No." WHERE("Document Type" = CONST(Order));
        }
        field(60007; "Sales Order Line No."; Integer)
        {
            Description = 'B2B';
            TableRelation = "Sales Line"."Line No." WHERE("Document Type" = CONST(Order),
                                                           "Document No." = FIELD("Sales Order No."));

            trigger OnLookup();
            begin
                SalesLine.SetRange("Document No.", "Sales Order No.");
                if PAGE.RunModal(516, SalesLine) = ACTION::LookupOK then
                    "Sales Order Line No." := SalesLine."Line No.";
                "Product Qty" := SalesLine.Quantity;
                "Item No." := SalesLine."No.";
                "Item Description" := SalesLine.Description;
            end;
        }
        field(60008; "Product Qty"; Decimal)
        {
            Description = 'B2B eff';
        }
        field(60009; "Item No."; Code[20])
        {
            Description = 'B2B eff';
            Editable = false;
        }
        field(60010; "Item Description"; Text[50])
        {
            Description = 'B2B eff';
            Editable = false;
        }
    }
    PROCEDURE JobAttachments();
    VAR
        JobAttach: Record Attachments;
    BEGIN
        JobAttach.Reset;
        JobAttach.SetRange("Table ID", DATABASE::Job);
        JobAttach.SetRange("Document No.", "No.");

        PAGE.Run(PAGE::"ESPL Attachments", JobAttach);
    END;

    var
        "--B2B--": Integer;
        SalesLine: Record "Sales Line";
}

