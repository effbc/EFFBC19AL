page 99000788 "Production BOM Lines"
{
    // version NAVW19.00.00.45778,NAVIN9.00.00.45778,B2B1.0

    AutoSplitKey = true;
    CaptionML = ENU='Lines',
                ENN='Lines';
    DataCaptionFields = "Production BOM No.";
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SaveValues = true;
    SourceTable = "Production BOM Line";

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
                field(Type;Type)
                {
                }
                field("Line No.";"Line No.")
                {
                }
                field("No.";"No.")
                {

                    trigger OnValidate();
                    begin
                        BOMLine.RESET;
                        BOMLine.SETFILTER(BOMLine."Production BOM No.","Production BOM No.");
                        BOMLine.SETFILTER(BOMLine."No.","No.");
                        BOMLine.SETFILTER(BOMLine."Line No.",'<>%1',"Line No.");
                        IF BOMLine.FINDFIRST THEN
                        BEGIN
                          ERROR('Item already exits in line no %1',BOMLine."Line No.");
                        END;


                        IF (Type = Type::"Production BOM") THEN BEGIN
                          ProductionBOMHeader.GET("No.");
                          ProductionBOMHeader.TESTFIELD("BOM Type");
                          "BOM Type" := ProductionBOMHeader."BOM Type";
                        END;
                    end;
                }
                field("Variant Code";"Variant Code")
                {
                    Visible = false;
                }
                field("Material Reqired Day";"Material Reqired Day")
                {
                }
                field(Description;Description)
                {
                    Editable = DescriptionEditable;
                }
                field("Calculation Formula";"Calculation Formula")
                {
                    Visible = false;
                }
                field(Length;Length)
                {
                    Visible = false;
                }
                field(Width;Width)
                {
                    Visible = false;
                }
                field(Depth;Depth)
                {
                    Visible = false;
                }
                field(Weight;Weight)
                {
                    Visible = false;
                }
                field("Quantity per";"Quantity per")
                {
                }
                field("No. of Opportunities";"No. of Opportunities")
                {
                }
                field("Part number";"Part number")
                {
                }
                field(Package;Package)
                {
                }
                field("Storage Temperature";"Storage Temperature")
                {
                }
                field(Make;Make)
                {
                }
                field("Description 2";"Description 2")
                {
                    Editable = false;
                }
                field("Scrap Quantity";"Scrap Quantity")
                {
                }
                field("No. of Pins";"No. of Pins")
                {
                    Editable = "No. of PinsEditable";
                    Visible = "No. of PinsVisible";
                }
                field("No. of SMD Points";"No. of SMD Points")
                {
                    Visible = "No. of SMD PointsVisible";
                }
                field("No. of DIP Point";"No. of DIP Point")
                {
                    Visible = "No. of DIP PointVisible";
                }
                field("No. of Soldering Points";"No. of Soldering Points")
                {
                    Editable = NoofSolderingPointsEditable;
                }
                field("No. of Fixing Holes";"No. of Fixing Holes")
                {
                }
                field("Type of Solder";"Type of Solder")
                {
                    Editable = "Type of SolderEditable";
                    Visible = "Type of SolderVisible";
                }
                field("Avg Cost";"Avg Cost")
                {
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                }
                field("Scrap %";"Scrap %")
                {
                }
                field("Principal Input";"Principal Input")
                {
                }
                field("Routing Link Code";"Routing Link Code")
                {
                }
                field(Position;Position)
                {
                    Visible = true;
                }
                field("Position 2";"Position 2")
                {
                    Visible = false;
                }
                field("Position 3";"Position 3")
                {
                    Visible = false;
                }
                field("Lead-Time Offset";"Lead-Time Offset")
                {
                    Visible = false;
                }
                field("Starting Date";"Starting Date")
                {
                }
                field("Ending Date";"Ending Date")
                {
                }
                field("Position 4";"Position 4")
                {
                }
                field("BOM Type";"BOM Type")
                {
                    Editable = true;
                }
                field("Version Code";"Version Code")
                {
                }
                field("Operation No.";"Operation No.")
                {
                }
                field(Dept;Dept)
                {
                }
                field("operating temp";"operating temp")
                {
                    Caption = 'Operating Temperature';
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
                CaptionML = ENU='&Component',
                            ENN='&Component';
                Image = Components;
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                ENN='Co&mments';
                    Image = ViewComments;

                    trigger OnAction();
                    begin
                        ShowComment;
                    end;
                }
                action("Where-Used")
                {
                    CaptionML = ENU='Where-Used',
                                ENN='Where-Used';
                    Image = "Where-Used";

                    trigger OnAction();
                    begin
                        ShowWhereUsed;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
         IF FORMAT(Type)=' ' THEN
         BEGIN
            DescriptionEditable :=TRUE;
            "No. of PinsEditable" :=TRUE;
            NoofSolderingPointsEditable :=TRUE;
            "Type of SolderEditable" :=TRUE;
         END ELSE
         BEGIN
           DescriptionEditable :=FALSE;
           "No. of PinsEditable" :=FALSE;
           NoofSolderingPointsEditable :=FALSE;
           "Type of SolderEditable" :=FALSE;
         END;
    end;

    trigger OnInit();
    begin
        "Type of SolderVisible" := TRUE;
        "No. of PinsVisible" := TRUE;
        "No. of DIP PointVisible" := TRUE;
        "No. of SMD PointsVisible" := TRUE;
        "Type of SolderEditable" := TRUE;
        NoofSolderingPointsEditable := TRUE;
        "No. of PinsEditable" := TRUE;
        DescriptionEditable := TRUE;
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        Type := xRec.Type;
    end;

    var
        BOMLine : Record "Production BOM Line";
        [InDataSet]
        DescriptionEditable : Boolean;
        [InDataSet]
        "No. of PinsEditable" : Boolean;
        [InDataSet]
        NoofSolderingPointsEditable : Boolean;
        [InDataSet]
        "Type of SolderEditable" : Boolean;
        [InDataSet]
        "No. of SMD PointsVisible" : Boolean;
        [InDataSet]
        "No. of DIP PointVisible" : Boolean;
        [InDataSet]
        "No. of PinsVisible" : Boolean;
        [InDataSet]
        "Type of SolderVisible" : Boolean;
        ProductionBOMHeader : Record "Production BOM Header";

    [LineStart(23966)]
    local procedure ShowComment();
    var
        ProdOrderCompComment : Record "Production BOM Comment Line";
    begin
        ProdOrderCompComment.SETRANGE("Production BOM No.","Production BOM No.");
        ProdOrderCompComment.SETRANGE("BOM Line No.","Line No.");
        ProdOrderCompComment.SETRANGE("Version Code","Version Code");

        PAGE.RUN(PAGE::"Prod. Order BOM Cmt. Sheet",ProdOrderCompComment);
    end;

    [LineStart(23973)]
    local procedure ShowWhereUsed();
    var
        Item : Record Item;
        ProdBomHeader : Record "Production BOM Header";
        ProdBOMWhereUsed : Page "Prod. BOM Where-Used";
    begin
        IF Type = Type::" " THEN
          EXIT;

        CASE Type OF
          Type::Item:
            BEGIN
              Item.GET("No.");
              ProdBOMWhereUsed.SetItem(Item,WORKDATE);
            END;
          Type::"Production BOM":
            BEGIN
              ProdBomHeader.GET("No.");
              ProdBOMWhereUsed.SetProdBOM(ProdBomHeader,WORKDATE);
            END;
        END;
        ProdBOMWhereUsed.RUNMODAL;
        CLEAR(ProdBOMWhereUsed);
    end;

    [LineStart(23992)]
    procedure Showform(Show : Boolean);
    begin
        IF Show THEN
        BEGIN
          "No. of SMD PointsVisible" :=TRUE;
          "No. of DIP PointVisible" :=TRUE;
          "No. of PinsVisible" :=FALSE;
          "Type of SolderVisible" :=FALSE;
        END ELSE
        BEGIN
          "No. of SMD PointsVisible" :=FALSE;
          "No. of DIP PointVisible" :=FALSE;
          "No. of PinsVisible" :=TRUE;
          "Type of SolderVisible" :=TRUE;
        END;
    end;
}

