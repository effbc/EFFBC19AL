page 99000789 "Production BOM Version Lines"
{
    // version NAVW19.00.00.45778,B2B1.0

    AutoSplitKey = true;
    CaptionML = ENU = 'Lines',
                ENN = 'Lines';
    DataCaptionFields = "Production BOM No.";
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Production BOM Line";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Type; Type)
                {
                }
                field("No."; "No.")
                {
                }
                field("Variant Code"; "Variant Code")
                {
                    Visible = false;
                }
                field(Description; Description)
                {
                }
                field("Material Reqired Day"; "Material Reqired Day")
                {
                }
                field("Description 2"; "Description 2")
                {
                }
                field("Calculation Formula"; "Calculation Formula")
                {
                    Visible = false;
                }
                field(Length; Length)
                {
                    Visible = false;
                }
                field(Width; Width)
                {
                    Visible = false;
                }
                field("No. of Soldering Points"; "No. of Soldering Points")
                {
                }
                field("No. of Pins"; "No. of Pins")
                {
                }
                field("No. of Opportunities"; "No. of Opportunities")
                {
                }
                field("Type of Solder"; "Type of Solder")
                {
                }
                field("Shelf No."; "Shelf No.")
                {
                }
                field("No. of Fixing Holes"; "No. of Fixing Holes")
                {
                }
                field(Depth; Depth)
                {
                    Visible = false;
                }
                field(Weight; Weight)
                {
                    Visible = false;
                }
                field("Quantity per"; "Quantity per")
                {
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                }
                field("Scrap %"; "Scrap %")
                {
                }
                field("Routing Link Code"; "Routing Link Code")
                {
                }
                field(Position; Position)
                {
                    Visible = false;
                }
                field("Position 2"; "Position 2")
                {
                    Visible = false;
                }
                field("Position 3"; "Position 3")
                {
                    Visible = false;
                }
                field("Lead-Time Offset"; "Lead-Time Offset")
                {
                    Visible = false;
                }
                field("Starting Date"; "Starting Date")
                {
                    Visible = false;
                }
                field("Ending Date"; "Ending Date")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Component")
            {
                CaptionML = ENU = '&Component',
                            ENN = '&Component';
                Image = Components;
                action("Co&mments")
                {
                    CaptionML = ENU = 'Co&mments',
                                ENN = 'Co&mments';
                    Image = ViewComments;

                    trigger OnAction();
                    begin
                        ShowComment;
                    end;
                }
                action("Where-Used")
                {
                    CaptionML = ENU = 'Where-Used',
                                ENN = 'Where-Used';
                    Image = "Where-Used";

                    trigger OnAction();
                    begin
                        ShowWhereUsed;
                    end;
                }
            }
        }
    }

    [LineStart(24007)]
    local procedure ShowComment();
    var
        ProdOrderCompComment: Record "Production BOM Comment Line";
    begin
        ProdOrderCompComment.SETRANGE("Production BOM No.", "Production BOM No.");
        ProdOrderCompComment.SETRANGE("BOM Line No.", "Line No.");
        ProdOrderCompComment.SETRANGE("Version Code", "Version Code");

        PAGE.RUN(PAGE::"Prod. Order BOM Cmt. Sheet", ProdOrderCompComment);
    end;

    [LineStart(24014)]
    local procedure ShowWhereUsed();
    var
        Item: Record Item;
        ProdBOMHeader: Record "Production BOM Header";
        ProdBOMVersion: Record "Production BOM Version";
        ProdBOMWhereUsed: Page "Prod. BOM Where-Used";
    begin
        IF Type = Type::" " THEN
            EXIT;

        ProdBOMVersion.GET("Production BOM No.", "Version Code");
        CASE Type OF
            Type::Item:
                BEGIN
                    Item.GET("No.");
                    ProdBOMWhereUsed.SetItem(Item, ProdBOMVersion."Starting Date");
                END;
            Type::"Production BOM":
                BEGIN
                    ProdBOMHeader.GET("No.");
                    ProdBOMWhereUsed.SetProdBOM(ProdBOMHeader, ProdBOMVersion."Starting Date");
                END;
        END;
        ProdBOMWhereUsed.RUN;
    end;
}

