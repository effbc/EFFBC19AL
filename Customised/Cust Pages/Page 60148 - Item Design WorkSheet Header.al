page 60148 "Item Design WorkSheet Header"
{
    // version DWS1.0,Rev01

    PageType = Document;
    SourceTable = "Item Design Worksheet Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
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
            }
            part("Item Design Worksheet";"Item Design Worksheet")
            {
                SubPageLink = Item No=FIELD(Item No.);
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
                field("Development Cost";"Development Cost")
                {
                }
                field("Development Time in hours";"Development Time in hours")
                {
                }
                field("Development Cost per hour";"Development Cost per hour")
                {
                }
                field("Installation Cost";"Installation Cost")
                {
                }
                field("Additional Cost";"Additional Cost")
                {
                }
                field("Total Cost (From Line)";"Total Cost (From Line)")
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
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Copy BOM Components")
                {
                    Caption = 'Copy BOM Components';
                    Image = CopyBOM;

                    trigger OnAction();
                    begin
                        CurrPage."Item Design Worksheet".PAGE.CopyBOmComponents;
                    end;
                }
                separator(Action1000000034)
                {
                }
                action(Attachments)
                {
                    Caption = 'Attachments';
                    Image = Attachments;

                    trigger OnAction();
                    begin
                        DesignWorkSheetAttachments;
                    end;
                }
                separator(Action1000000033)
                {
                }
                action("Update Total Cost")
                {
                    Caption = 'Update Total Cost';
                    Image = UpdateUnitCost;

                    trigger OnAction();
                    begin
                        CalculateTotalCost;
                    end;
                }
            }
        }
    }

    [LineStart(13192)]
    procedure CalculateTotalCost();
    begin
        VALIDATE("Item No.");
        CALCFIELDS("Manufacturing Cost","Components Cost","Resource Cost","Installation Cost");
        "Total Manu Cost":="Main Item Manu Cost"+"Manufacturing Cost";
        "Total Cost" := "Development Cost" + "Additional Cost" + "Components Cost" + "Total Manu Cost" + "Resource Cost" +
                            "Installation Cost" ;
        MODIFY;
    end;
}

