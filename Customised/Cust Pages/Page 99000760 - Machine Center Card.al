page 99000760 "Machine Center Card"
{
    // version NAVW17.00

    CaptionML = ENU='Machine Center Card',
                ENN='Machine Center Card';
    PageType = Card;
    SourceTable = "Machine Center";

    layout
    {
        area(content)
        {
            group(General)
            {
                CaptionML = ENU='General',
                            ENN='General';
                field("No.";"No.")
                {
                    Importance = Promoted;

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                          CurrPage.UPDATE;
                    end;
                }
                field(Name;Name)
                {
                    Importance = Promoted;
                }
                field("Work Center No.";"Work Center No.")
                {
                    Importance = Promoted;

                    trigger OnValidate();
                    begin
                        UpdateEnabled;
                    end;
                }
                field("User Id";"User Id")
                {
                }
                field("Search Name";"Search Name")
                {
                }
                field(Blocked;Blocked)
                {
                }
                field("Last Date Modified";"Last Date Modified")
                {
                }
            }
            group(Posting)
            {
                CaptionML = ENU='Posting',
                            ENN='Posting';
                field("Direct Unit Cost";"Direct Unit Cost")
                {
                    Importance = Promoted;
                }
                field("Indirect Cost %";"Indirect Cost %")
                {
                }
                field("Overhead Rate";"Overhead Rate")
                {
                }
                field("Unit Cost";"Unit Cost")
                {
                }
                field("Flushing Method";"Flushing Method")
                {
                    Importance = Promoted;
                }
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                {
                    Importance = Promoted;
                }
            }
            group(Scheduling)
            {
                CaptionML = ENU='Scheduling',
                            ENN='Scheduling';
                field(Capacity;Capacity)
                {
                    Importance = Promoted;
                }
                field(Efficiency;Efficiency)
                {
                }
                field("Queue Time";"Queue Time")
                {
                }
                field("Queue Time Unit of Meas. Code";"Queue Time Unit of Meas. Code")
                {
                }
            }
            group("Routing Setup")
            {
                CaptionML = ENU='Routing Setup',
                            ENN='Routing Setup';
                field("Setup Time";"Setup Time")
                {
                    Importance = Promoted;
                }
                field("Wait Time";"Wait Time")
                {
                    Importance = Promoted;
                }
                field("Move Time";"Move Time")
                {
                    Importance = Promoted;
                }
                field("Fixed Scrap Quantity";"Fixed Scrap Quantity")
                {
                }
                field("Scrap %";"Scrap %")
                {
                }
                field("Send-Ahead Quantity";"Send-Ahead Quantity")
                {
                }
                field("Minimum Process Time";"Minimum Process Time")
                {
                }
                field("Maximum Process Time";"Maximum Process Time")
                {
                }
                field("Concurrent Capacities";"Concurrent Capacities")
                {
                }
            }
            group(Warehouse)
            {
                CaptionML = ENU='Warehouse',
                            ENN='Warehouse';
                field("Location Code";"Location Code")
                {

                    trigger OnValidate();
                    begin
                        UpdateEnabled;
                    end;
                }
                field("Open Shop Floor Bin Code";"Open Shop Floor Bin Code")
                {
                    Enabled = OpenShopFloorBinCodeEnable;
                }
                field("To-Production Bin Code";"To-Production Bin Code")
                {
                    Enabled = ToProductionBinCodeEnable;
                }
                field("From-Production Bin Code";"From-Production Bin Code")
                {
                    Enabled = FromProductionBinCodeEnable;
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
                    RunPageLink = No.=FIELD(No.);
                    RunPageView = WHERE(Table Name=CONST(Machine Center));
                }
                action("Lo&ad")
                {
                    CaptionML = ENU='Lo&ad',
                                ENN='Lo&ad';
                    Image = WorkCenterLoad;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Machine Center Load";
                    RunPageLink = No.=FIELD(No.),Work Shift Filter=FIELD(Work Shift Filter);
                }
                separator(Action18)
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
                    RunObject = Page "Machine Center Task List";
                    RunPageLink = No.=FIELD(No.);
                    RunPageView = SORTING(Type,No.) WHERE(Type=CONST(Machine Center),Status=FILTER(..Released),Routing Status=FILTER(<>Finished));
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        UpdateEnabled;
    end;

    trigger OnInit();
    begin
        FromProductionBinCodeEnable := TRUE;
        ToProductionBinCodeEnable := TRUE;
        OpenShopFloorBinCodeEnable := TRUE;
    end;

    trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    begin
        "User Id" := USERID;
    end;

    trigger OnOpenPage();
    begin
        OnActivateForm;
    end;

    var
        [InDataSet]
        OpenShopFloorBinCodeEnable : Boolean;
        [InDataSet]
        ToProductionBinCodeEnable : Boolean;
        [InDataSet]
        FromProductionBinCodeEnable : Boolean;

    [LineStart(23684)]
    local procedure UpdateEnabled();
    var
        Location : Record Location;
        EditEnabled : Boolean;
    begin
        IF "Location Code" <> '' THEN
          Location.GET("Location Code");

        EditEnabled := ("Location Code" <> '') AND Location."Bin Mandatory";
        OpenShopFloorBinCodeEnable := EditEnabled;
        ToProductionBinCodeEnable := EditEnabled;
        FromProductionBinCodeEnable := EditEnabled;
    end;

    [LineStart(23693)]
    local procedure OnActivateForm();
    begin
        UpdateEnabled;
    end;
}

