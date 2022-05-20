page 60016 "Archived Design Worksheet"
{
    // version B2B1.0

    Editable = false;
    PageType = Document;
    SourceTable = "Archived DesignWorksheet";

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
            }
            part(DesignWorksheetLines;"Archived Designsheet Subform")
            {
                SubPageLink = Document No.=FIELD(Document No.),Document Type=FIELD(Document Type),Document Line No.=FIELD(Document Line No.),Version No.=FIELD(Version No.);
            }
            group(Costings)
            {
                Caption = 'Costings';
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
                field("Development cost per hour";"Development cost per hour")
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
            group(Version)
            {
                Caption = 'Version';
                field("Version No.";"Version No.")
                {
                }
                field("Main Item Manu Cost";"Main Item Manu Cost")
                {
                }
                field("Total Manu Cost";"Total Manu Cost")
                {
                }
                field("Archived By.";"Archived By.")
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

    [LineStart(4281)]
    procedure CalculateTotalCost();
    begin
    end;
}

