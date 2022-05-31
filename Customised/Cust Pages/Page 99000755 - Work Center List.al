page 99000755 "Work Center List"
{
    // version NAVW19.00.00.45778

    CaptionML = ENU = 'Work Center List',
                ENN = 'Work Center List';
    CardPageID = "Work Center Card";
    Editable = false;
    PageType = List;
    SourceTable = "Work Center";

    layout
    {
        area(content)
        {
            grid(Control1102152001)
            {
                ShowCaption = false;
                group(Control1102152002)
                {
                    ShowCaption = false;
                    field("xRec.COUNT"; xRec.COUNT)
                    {
                    }
                }
            }
            repeater(Control1)
            {
                ShowCaption = false;
                field("No."; "No.")
                {
                }
                field(Name; Name)
                {
                }
                field("Alternate Work Center"; "Alternate Work Center")
                {
                }
                field("Work Center Group Code"; "Work Center Group Code")
                {
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    Visible = false;
                }
                field("Consolidated Calendar"; "Consolidated Calendar")
                {
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                    Visible = false;
                }
                field("Direct Unit Cost"; "Direct Unit Cost")
                {
                    Visible = false;
                }
                field("Indirect Cost %"; "Indirect Cost %")
                {
                    Visible = false;
                }
                field("Unit Cost"; "Unit Cost")
                {
                    Visible = false;
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                }
                field(Capacity; Capacity)
                {
                }
                field(Efficiency; Efficiency)
                {
                    Visible = false;
                }
                field("Maximum Efficiency"; "Maximum Efficiency")
                {
                    Visible = false;
                }
                field("Minimum Efficiency"; "Minimum Efficiency")
                {
                    Visible = false;
                }
                field("Simulation Type"; "Simulation Type")
                {
                    Visible = false;
                }
                field("Shop Calendar Code"; "Shop Calendar Code")
                {
                }
                field("Search Name"; "Search Name")
                {
                }
                field("Overhead Rate"; "Overhead Rate")
                {
                    Visible = false;
                }
                field("Last Date Modified"; "Last Date Modified")
                {
                    Visible = false;
                }
                field("Flushing Method"; "Flushing Method")
                {
                    Visible = false;
                }
                field("Subcontractor No."; "Subcontractor No.")
                {
                    Visible = false;
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
            group("Wor&k Ctr.")
            {
                CaptionML = ENU = 'Wor&k Ctr.',
                            ENN = 'Wor&k Ctr.';
                Image = WorkCenter;
                action("Capacity Ledger E&ntries")
                {
                    CaptionML = ENU = 'Capacity Ledger E&ntries',
                                ENN = 'Capacity Ledger E&ntries';
                    Image = CapacityLedger;
                    RunObject = Page "Capacity Ledger Entries";
                    RunPageLink = Work Center No.=FIELD(No.),Posting Date=FIELD(Date Filter);
                    RunPageView = SORTING(Work Center No.,Work Shift Code,Posting Date);
                    ShortCutKey = 'Ctrl+F7';
                }
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                ENN='Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Manufacturing Comment Sheet";
                                    RunPageLink = No.=FIELD(No.);
                    RunPageView = WHERE(Table Name    DataClassification = CustomerContent;
=CONST(Work Center));
                }
                group(Dimensions)
                {
                    CaptionML = ENU='Dimensions',
                                ENN='Dimensions';
                    Image = Dimensions;
                    action("Dimensions-Single")
                    {
                        CaptionML = ENU='Dimensions-Single',
                                    ENN='Dimensions-Single';
                        Image = Dimensions;
                        RunObject = Page "Default Dimensions";
                                        ShortCutKey = 'Shift+Ctrl+D';
                    }
                    action("Dimensions-&Multiple")
                    {
                        AccessByPermission = TableData Dimension=R;
                        CaptionML = ENU='Dimensions-&Multiple',
                                    ENN='Dimensions-&Multiple';
                        Image = DimensionSets;

                        trigger OnAction();
                        var
                            Work : Record "Work Center";
                            DefaultDimMultiple : Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SETSELECTIONFILTER(Work);
                            DefaultDimMultiple.SetMultiWorkCenter(Work);
                            DefaultDimMultiple.RUNMODAL;
                        end;
                    }
                }
                action("Lo&ad")
                {
                    CaptionML = ENU='Lo&ad',
                                ENN='Lo&ad';
                    Image = WorkCenterLoad;
                    RunObject = Page "Work Center Load";
                                    RunPageLink = No.=FIELD(No.);
                    RunPageView = SORTING(No.);
                }
                separator(Action33)
                {
                }
                action(Statistics)
                {
                    CaptionML = ENU='Statistics',
                                ENN='Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Work Center Statistics";
                                    RunPageLink = No.=FIELD(No.),Date Filter=FIELD(Date Filter),Work Shift Filter=FIELD(Work Shift Filter);
                    ShortCutKey = 'F7';
                }
            }
            group("Pla&nning")
            {
                CaptionML = ENU='Pla&nning',
                            ENN='Pla&nning';
                Image = Planning;
                action("&Calendar")
                {
                    CaptionML = ENU='&Calendar',
                                ENN='&Calendar';
                    Image = MachineCenterCalendar;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Work Center Calendar";
                }
                action("A&bsence")
                {
                    CaptionML = ENU='A&bsence',
                                ENN='A&bsence';
                    Image = WorkCenterAbsence;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Capacity Absence";
                                    RunPageLink = Capacity Type=CONST(Work Center),No.=FIELD(No.),Date=FIELD(Date Filter);
                }
                action("Ta&sk List")
                {
                    CaptionML = ENU='Ta&sk List',
                                ENN='Ta&sk List';
                    Image = TaskList;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Work Center Task List";
                                    RunPageLink = No.=FIELD(No.);
                    RunPageView = SORTING(Type,No.) WHERE(Type=CONST(Work Center),Status=FILTER(..Released),Routing Status=FILTER(<>Finished));
                }
            }
        }
        area(processing)
        {
            action("Calculate Work Center Calendar")
            {
                CaptionML = ENU='Calculate Work Center Calendar',
                            ENN='Calculate Work Center Calendar';
                Image = CalcWorkCenterCalendar;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report "Calculate Work Center Calendar";
            }
        }
        area(reporting)
        {
            action("Work Center List")
            {
                CaptionML = ENU='Work Center List',
                            ENN='Work Center List';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Work Center List";
            }
            action("Work Center Load")
            {
                CaptionML = ENU='Work Center Load',
                            ENN='Work Center Load';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Work Center Load";
            }
            action("Work Center Load/Bar")
            {
                CaptionML = ENU='Work Center Load/Bar',
                            ENN='Work Center Load/Bar';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Work Center Load/Bar";
            }
        }
    }
}

