page 99000761 "Machine Center List"
{
    // version NAVW17.00

    CaptionML = ENU='Machine Center List',
                ENN='Machine Center List';
    CardPageID = "Machine Center Card";
    Editable = false;
    PageType = List;
    SourceTable = "Machine Center";

    layout
    {
        area(content)
        {
            field("xRec.COUNT";xRec.COUNT)
            {
                Style = Strong;
                StyleExpr = TRUE;
            }
            repeater(Control1)
            {
                ShowCaption = false;
                field("No.";"No.")
                {
                }
                field(Name;Name)
                {
                }
                field("Work Center No.";"Work Center No.")
                {
                }
                field(Blocked;Blocked)
                {
                }
                field(Capacity;Capacity)
                {
                }
                field(Efficiency;Efficiency)
                {
                }
                field("Minimum Efficiency";"Minimum Efficiency")
                {
                    Visible = false;
                }
                field("Maximum Efficiency";"Maximum Efficiency")
                {
                    Visible = false;
                }
                field("Concurrent Capacities";"Concurrent Capacities")
                {
                    Visible = false;
                }
                field("Search Name";"Search Name")
                {
                }
                field("Direct Unit Cost";"Direct Unit Cost")
                {
                    Visible = false;
                }
                field("Indirect Cost %";"Indirect Cost %")
                {
                    Visible = false;
                }
                field("Unit Cost";"Unit Cost")
                {
                    Visible = false;
                }
                field("Overhead Rate";"Overhead Rate")
                {
                    Visible = false;
                }
                field("Last Date Modified";"Last Date Modified")
                {
                    Visible = false;
                }
                field("Flushing Method";"Flushing Method")
                {
                    Visible = false;
                }
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
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Mach. Ctr.")
            {
                CaptionML = ENU='&Mach. Ctr.',
                            ENN='&Mach. Ctr.';
                Image = MachineCenter;
                action("Capacity Ledger E&ntries")
                {
                    CaptionML = ENU='Capacity Ledger E&ntries',
                                ENN='Capacity Ledger E&ntries';
                    Image = CapacityLedger;
                    RunObject = Page "Capacity Ledger Entries";
                    RunPageLink = Type=CONST(Machine Center),No.=FIELD(No.),Posting Date=FIELD(Date Filter);
                    RunPageView = SORTING(Type,No.,Work Shift Code,Item No.,Posting Date);
                    ShortCutKey = 'Ctrl+F7';
                }
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                ENN='Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Manufacturing Comment Sheet";
                    RunPageLink = Table Name=CONST(Machine Center),No.=FIELD(No.);
                }
                action("Lo&ad")
                {
                    CaptionML = ENU='Lo&ad',
                                ENN='Lo&ad';
                    Image = WorkCenterLoad;
                    RunObject = Page "Machine Center Load";
                    RunPageLink = No.=FIELD(No.);
                    RunPageView = SORTING(No.);
                }
                separator(Action10)
                {
                }
                action(Statistics)
                {
                    CaptionML = ENU='Statistics',
                                ENN='Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Machine Center Statistics";
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
                    RunObject = Page "Machine Center Calendar";
                }
                action("A&bsence")
                {
                    CaptionML = ENU='A&bsence',
                                ENN='A&bsence';
                    Image = WorkCenterAbsence;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Capacity Absence";
                    RunPageLink = Capacity Type=CONST(Machine Center),No.=FIELD(No.),Date=FIELD(Date Filter);
                }
                action("Ta&sk List")
                {
                    CaptionML = ENU='Ta&sk List',
                                ENN='Ta&sk List';
                    Image = TaskList;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Machine Center Task List";
                    RunPageLink = No.=FIELD(No.);
                    RunPageView = SORTING(Type,No.) WHERE(Type=CONST(Machine Center),Status=FILTER(..Released),Routing Status=FILTER(<>Finished));
                }
            }
        }
        area(reporting)
        {
            action("Machine Center List")
            {
                CaptionML = ENU='Machine Center List',
                            ENN='Machine Center List';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Machine Center List";
            }
            action("Machine Center Load")
            {
                CaptionML = ENU='Machine Center Load',
                            ENN='Machine Center Load';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Machine Center Load";
            }
            action("Machine Center Load/Bar")
            {
                CaptionML = ENU='Machine Center Load/Bar',
                            ENN='Machine Center Load/Bar';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Machine Center Load/Bar";
            }
        }
    }
}

