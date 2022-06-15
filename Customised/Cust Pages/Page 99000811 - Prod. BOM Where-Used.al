page 99000811 "Prod. BOM Where-Used"
{
    // version NAVW19.00.00.46621

    CaptionML = ENU = 'Prod. BOM Where-Used',
                ENN = 'Prod. BOM Where-Used';
    DataCaptionExpression = SetCaption;
    PageType = Worksheet;
    SourceTable = "Where-Used Line";
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            group(Options)
            {
                CaptionML = ENU = 'Options',
                            ENN = 'Options';
                field(CalculateDate; CalculateDate)
                {
                    CaptionML = ENU = 'Calculation Date',
                                ENN = 'Calculation Date';

                    trigger OnValidate();
                    begin
                        CalculateDateOnAfterValidate;
                    end;
                }
                field(ShowLevel; ShowLevel)
                {
                    CaptionML = ENU = 'Levels',
                                ENN = 'Levels';
                    OptionCaptionML = ENU = 'Single,Multi',
                                      ENN = 'Single,Multi';

                    trigger OnValidate();
                    begin
                        ShowLevelOnAfterValidate;
                    end;
                }
            }
            repeater(Control1)
            {
                Editable = false;
                IndentationColumn = DescriptionIndent;
                IndentationControls = Description;
                ShowCaption = false;
                field("Item No."; "Item No.")
                {
                }
                field("Version Code"; "Version Code")
                {
                }
                field("Level Code"; "Level Code")
                {
                }
                field(Status; Status)
                {
                }
                field(Description; Description)
                {
                }
                field("Quantity Needed"; "Quantity Needed")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        DescriptionIndent := 0;
        DescriptionOnFormat;
        CALCFIELDS(Status);
    end;

    trigger OnFindRecord(Which: Text): Boolean;
    begin
        EXIT(WhereUsedMgt.FindRecord(Which, Rec));
    end;

    trigger OnNextRecord(Steps: Integer): Integer;
    begin
        EXIT(WhereUsedMgt.NextRecord(Steps, Rec));
    end;

    trigger OnOpenPage();
    begin
        BuildForm;
    end;

    var
        Item: Record Item;
        ProdBOM: Record "Production BOM Header";
        WhereUsedMgt: Codeunit "Where-Used Management";
        ShowLevel: Option Single,Multi;
        CalculateDate: Date;
        [InDataSet]
        DescriptionIndent: Integer;

    (24047)]
    procedure SetProdBOM(NewProdBOM: Record "Production BOM Header"; NewCalcDate: Date);
    begin
        ProdBOM := NewProdBOM;
        CalculateDate := NewCalcDate;
    end;

    (24051)]
    procedure SetItem(NewItem: Record Item; NewCalcDate: Date);
    begin
        Item := NewItem;
        CalculateDate := NewCalcDate;
    end;

    (24055)]
    local procedure BuildForm();
    begin
        IF ProdBOM."No." <> '' THEN
            WhereUsedMgt.WhereUsedFromProdBOM(ProdBOM, CalculateDate, ShowLevel = ShowLevel::Multi)
        ELSE
            WhereUsedMgt.WhereUsedFromItem(Item, CalculateDate, ShowLevel = ShowLevel::Multi);
    end;

    (24061)]
    procedure SetCaption(): Text[80];
    begin
        IF ProdBOM."No." <> '' THEN
            EXIT(ProdBOM."No." + ' ' + ProdBOM.Description);
        //IF STRLEN(Item."No." + ' ' + Item.Description) >0 THEN
        //EXIT(COPYSTR(FORMAT(Item."No." + ' ' + Item.Description),1,50))        swathi on 26-sep-13
        //ELSE
        EXIT(Item."No." + ' ' + Item.Description);
    end;

    (24069)]
    local procedure CalculateDateOnAfterValidate();
    begin
        BuildForm;
        CurrPage.UPDATE(FALSE);
    end;

    (24073)]
    local procedure ShowLevelOnAfterValidate();
    begin
        BuildForm;
        CurrPage.UPDATE(FALSE);
    end;

    (24077)]
    local procedure DescriptionOnFormat();
    begin
        DescriptionIndent := "Level Code" - 1;
    end;
}

