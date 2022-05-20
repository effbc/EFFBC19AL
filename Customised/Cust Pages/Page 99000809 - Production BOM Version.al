page 99000809 "Production BOM Version"
{
    // version NAVW17.00

    CaptionML = ENU='Production BOM Version',
                ENN='Production BOM Version';
    DataCaptionExpression = Caption;
    PageType = ListPlus;
    SourceTable = "Production BOM Version";

    layout
    {
        area(content)
        {
            group(General)
            {
                CaptionML = ENU='General',
                            ENN='General';
                field("Version Code";"Version Code")
                {

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                          CurrPage.UPDATE;
                    end;
                }
                field(Description;Description)
                {
                }
                field("Description 2";"Description 2")
                {
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                }
                field(Status;Status)
                {
                }
                field("Starting Date";"Starting Date")
                {
                }
                field("Last Date Modified";"Last Date Modified")
                {
                }
                field("Modified User ID";"Modified User ID")
                {
                    Editable = false;
                }
            }
            part(ProdBOMLine;"Production BOM Version Lines")
            {
                SubPageLink = Production BOM No.=FIELD(Production BOM No.),Version Code=FIELD(Version Code);
                SubPageView = SORTING(Production BOM No.,Version Code,Line No.);
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207;Links)
            {
                Visible = false;
            }
            systempart(Control1905767507;Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Ve&rsion")
            {
                CaptionML = ENU='Ve&rsion',
                            ENN='Ve&rsion';
                Image = Versions;
                action("Where-Used")
                {
                    CaptionML = ENU='Where-Used',
                                ENN='Where-Used';
                    Image = "Where-Used";

                    trigger OnAction();
                    var
                        ProdBOMHeader : Record "Production BOM Header";
                        ProdBOMWhereUsed : Page "Prod. BOM Where-Used";
                    begin
                        ProdBOMHeader.GET("Production BOM No.");
                        ProdBOMWhereUsed.SetProdBOM(ProdBOMHeader,"Starting Date");
                        ProdBOMWhereUsed.RUN;
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            ENN='F&unctions';
                Image = "Action";
                action("Copy BOM &Header")
                {
                    CaptionML = ENU='Copy BOM &Header',
                                ENN='Copy BOM &Header';
                    Image = CopyBOMHeader;

                    trigger OnAction();
                    begin
                        IF NOT CONFIRM(Text000,FALSE) THEN
                          EXIT;

                        ProdBOMHeader.GET("Production BOM No.");
                        ProductionBOMCopy.CopyBOM("Production BOM No.",'',ProdBOMHeader,"Version Code");
                    end;
                }
                action("Copy BOM &Version")
                {
                    CaptionML = ENU='Copy BOM &Version',
                                ENN='Copy BOM &Version';
                    Ellipsis = true;
                    Image = CopyBOMVersion;

                    trigger OnAction();
                    begin
                        ProductionBOMCopy.CopyFromVersion(Rec);
                    end;
                }
                action("Copy BOM")
                {
                    Caption = 'Copy BOM';

                    trigger OnAction();
                    begin
                        TESTFIELD("Version Code");
                        IF PAGE.RUNMODAL(0,ProdBOMHeader) = ACTION::LookupOK THEN
                          ProductionBOMCopy.CopyBomVersion(ProdBOMHeader."No.",'',Rec,"Version Code");
                    end;
                }
            }
        }
    }

    var
        Text000 : TextConst ENU='Copy from Production BOM?',ENN='Copy from Production BOM?';
        ProdBOMHeader : Record "Production BOM Header";
        ProductionBOMCopy : Codeunit "Production BOM-Copy";
}

