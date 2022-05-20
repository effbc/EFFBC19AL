page 60122 "Design Worksheet-Sale"
{
    // version B2B1.0

    Editable = false;
    PageType = Document;
    SourceTable = "Design Worksheet Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Document No.";"Document No.")
                {
                }
                field("Document Type";"Document Type")
                {
                }
                field("Document Line No.";"Document Line No.")
                {
                }
                field("Item No.";"Item No.")
                {
                }
                field(Description;Description)
                {
                }
                field(Quantity;Quantity)
                {
                }
                field("Unit of Measure";"Unit of Measure")
                {
                }
                field("Production Bom No.";"Production Bom No.")
                {
                }
                field("Production Bom Version No.";"Production Bom Version No.")
                {
                }
                field(Status;Status)
                {
                }
            }
            part(DesignWorksheetLines;"Design Worksheet Subform-Sale")
            {
                SubPageLink = Document No.=FIELD(Document No.),Document Type=FIELD(Document Type),Document Line No.=FIELD(Document Line No.);
            }
            group(Costing)
            {
                Caption = 'Costing';
                field("Components Cost";"Components Cost")
                {
                }
                field("Manufacturing Cost";"Manufacturing Cost")
                {
                }
                field("Resource Cost";"Resource Cost")
                {
                }
                field("Development Time in hours";"Development Time in hours")
                {
                }
                field("Development Cost per hour";"Development Cost per hour")
                {
                }
                field("Development Cost";"Development Cost")
                {
                }
                field("Installation Cost";"Installation Cost")
                {
                }
                field("Additional Cost";"Additional Cost")
                {
                }
                field("Total Cost";"Total Cost")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        SalesLine : Record "Sales Line";
        ManufacturingSetup : Record "Manufacturing Setup";
        TenderLine : Record "Tender Line";

    [LineStart(11347)]
    procedure CalculateTotalCost();
    begin
    end;
}

