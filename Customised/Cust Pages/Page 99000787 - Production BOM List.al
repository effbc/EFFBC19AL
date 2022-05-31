page 99000787 "Production BOM List"
{
    // version NAVW17.00

    CaptionML = ENU = 'Production BOM List',
                ENN = 'Production BOM List';
    CardPageID = "Production BOM";
    DataCaptionFields = "No.";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Production BOM Header";

    layout
    {
        area(content)
        {
            group(Control1102152006)
            {
                ShowCaption = false;
                grid(Control1102152010)
                {
                    ShowCaption = false;
                    group(Control1102152011)
                    {
                        ShowCaption = false;
                        field("xRec.COUNT"; xRec.COUNT)
                        {
                        }
                        group(Control1102152013)
                        {
                            ShowCaption = false;
                            field(Bom_Status_running; Bom_Status_running)
                            {
                                Style = Favorable;
                                StyleExpr = TRUE;
                            }
                            group(Control1102152015)
                            {
                                ShowCaption = false;
                                field(Bom_Status_old; Bom_Status_old)
                                {
                                    Style = Unfavorable;
                                    StyleExpr = TRUE;
                                }
                            }
                        }
                    }
                }
            }
            repeater(Control1)
            {
                ShowCaption = false;
                field("No."; "No.")
                {
                    Style = Favorable;
                    StyleExpr = Running_bom_flag;
                }
                field(Description; Description)
                {
                    Style = Unfavorable;
                    StyleExpr = old_bom_flag;
                }
                field("Low-Level Code"; "Low-Level Code")
                {
                }
                field("Modified User ID"; "Modified User ID")
                {
                }
                field("Bench Mark Time(In Hours)"; "Bench Mark Time(In Hours)")
                {
                }
                field("Stranded BOM"; "Stranded BOM")
                {
                }
                field("Last Date Modified"; "Last Date Modified")
                {
                }
                field("BOM Type"; "BOM Type")
                {
                }
                field("Version Nos."; "Version Nos.")
                {
                }
                field("Total No. of Fixing Holes"; "Total No. of Fixing Holes")
                {
                }
                field("Total Soldering Points"; "Total Soldering Points")
                {
                }
                field("Total Soldering Points DIP"; "Total Soldering Points DIP")
                {
                }
                field("Total Soldering Points SMD"; "Total Soldering Points SMD")
                {
                }
                field("Creation Date"; "Creation Date")
                {
                }
                field("Description 2"; "Description 2")
                {
                    Visible = false;
                }
                field(Status; Status)
                {

                    trigger OnValidate();
                    begin
                        IF (COPYSTR(ProdBOMHeader."No.", 1, 8) <> 'ECMPBPCB') AND (Status = Status::Certified) AND NOT (USERID IN ['EFFTRONICS\JHANSI', 'EFFTRONICS\SUJANI', 'EFFTRONICS\ANILKUMAR', 'EFFTRONICS\VIJAYA']) THEN
                            ERROR('You dont have permissions to Certify the BOM');
                    end;
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                }
                field("Search Name"; "Search Name")
                {
                    Visible = false;
                }
                field(Configuration; Configuration)
                {
                }
                field("BOM Running Status"; "BOM Running Status")
                {
                }
                field("Inherited From"; "Inherited From")
                {
                }
                field("BOM Category"; "BOM Category")
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
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Prod. BOM")
            {
                CaptionML = ENU = '&Prod. BOM',
                            ENN = '&Prod. BOM';
                Image = BOM;
                action("Co&mments")
                {
                    CaptionML = ENU = 'Co&mments',
                                ENN = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Manufacturing Comment Sheet";
                    RunPageLink = Table Name=CONST(Production BOM Header),No.=FIELD(No.);
                }
                action(Versions)
                {
                    CaptionML = ENU='Versions',
                                ENN='Versions';
                    Image = BOMVersions;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Prod. BOM Version List";
                                    RunPageLink = Production BOM No.=FIELD(No.);
                }
                action("Ma&trix per Version")
                {
                    CaptionML = ENU='Ma&trix per Version',
                                ENN='Ma&trix per Version';
                    Image = ProdBOMMatrixPerVersion;

                    trigger OnAction();
                    var
                        BOMMatrixPage : Page "Prod. BOM Matrix per Version";
                    begin
                        BOMMatrixPage.Set(Rec);

                        BOMMatrixPage.RUN;
                    end;
                }
                action("Where-used")
                {
                    CaptionML = ENU='Where-used',
                                ENN='Where-used';
                    Image = "Where-Used";

                    trigger OnAction();
                    begin
                        ProdBOMWhereUsed.SetProdBOM(Rec,WORKDATE);

                        ProdBOMWhereUsed.RUN;
                    end;
                }
            }
        }
        area(processing)
        {
            action("Exchange Production BOM Item")
            {
                CaptionML = ENU='Exchange Production BOM Item',
                            ENN='Exchange Production BOM Item';
                Image = ExchProdBOMItem;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report "Exchange Production BOM Item";
            }
            action("Delete Expired Components")
            {
                CaptionML = ENU='Delete Expired Components',
                            ENN='Delete Expired Components';
                Image = DeleteExpiredComponents;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report "Delete Expired Components";
            }
        }
        area(reporting)
        {
            action("Where-Used (Top Level)")
            {
                CaptionML = ENU='Where-Used (Top Level)',
                            ENN='Where-Used (Top Level)';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Where-Used (Top Level)";
            }
            action("Quantity Explosion of BOM")
            {
                CaptionML = ENU='Quantity Explosion of BOM',
                            ENN='Quantity Explosion of BOM';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Quantity Explosion of BOM";
            }
            action("Compare List")
            {
                CaptionML = ENU='Compare List',
                            ENN='Compare List';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Compare List";
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        Running_bom_flag:= FALSE;
        old_bom_flag:= FALSE;
        IF Rec."BOM Running Status"= Rec."BOM Running Status"::Running THEN
          BEGIN
            BOM_No_Clr := TRUE;
            Running_bom_flag := TRUE;
          END
        ELSE IF Rec."BOM Running Status"= Rec."BOM Running Status"::Old THEN
          BEGIN
            BOM_No_Clr := TRUE;
            old_bom_flag:= TRUE;
           END
        ELSE
          BEGIN
              BOM_No_Clr := FALSE;
              Running_bom_flag:= FALSE;
              old_bom_flag:= FALSE;
          END;
    end;

    var
        ProdBOMWhereUsed : Page "Prod. BOM Where-Used";
                               ProdBOMHeader : Record "Production BOM Header";
                               Bom_Status_running : Label '"Running BOM "';
        Bom_Status_old : Label 'Old BOM';
        Running_bom_flag : Boolean;
        old_bom_flag : Boolean;
        BOM_No_Clr : Boolean;
}

