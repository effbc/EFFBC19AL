page 99000754 "Work Center Card"
{
    // version NAVW19.00.00.50785

    CaptionML = ENU = 'Work Center Card',
                ENN = 'Work Center Card';
    PageType = Card;
    SourceTable = "Work Center";

    layout
    {
        area(content)
        {
            group(General)
            {
                CaptionML = ENU = 'General',
                            ENN = 'General';
                field("No."; "No.")
                {
                    Importance = Promoted;

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field(Name; Name)
                {
                    Importance = Promoted;
                }
                field("Work Center Group Code"; "Work Center Group Code")
                {
                    Importance = Promoted;
                }
                field("Alternate Work Center"; "Alternate Work Center")
                {
                }
                field("User Id"; "User Id")
                {
                }
                field("Search Name"; "Search Name")
                {
                }
                field(Blocked; Blocked)
                {
                }
                field("Last Date Modified"; "Last Date Modified")
                {
                }
            }
            group(Posting)
            {
                CaptionML = ENU = 'Posting',
                            ENN = 'Posting';
                field("Direct Unit Cost"; "Direct Unit Cost")
                {
                    Importance = Promoted;
                }
                field("Indirect Cost %"; "Indirect Cost %")
                {
                }
                field("Overhead Rate"; "Overhead Rate")
                {
                }
                field("Unit Cost"; "Unit Cost")
                {
                }
                field("Unit Cost Calculation"; "Unit Cost Calculation")
                {
                    Importance = Promoted;
                }
                field("Specific Unit Cost"; "Specific Unit Cost")
                {
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                }
                field("Subcontractor No."; "Subcontractor No.")
                {
                }
                field("Flushing Method"; "Flushing Method")
                {
                    Importance = Promoted;
                }
                field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
                {
                    Importance = Promoted;
                }
                field("Calendar Rounding Precision"; "Calendar Rounding Precision")
                {
                }
            }
            group(Scheduling)
            {
                CaptionML = ENU = 'Scheduling',
                            ENN = 'Scheduling';
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                    Importance = Promoted;
                }
                field(Capacity; Capacity)
                {
                    Importance = Promoted;
                }
                field(Efficiency; Efficiency)
                {
                }
                field("Consolidated Calendar"; "Consolidated Calendar")
                {
                }
                field("Shop Calendar Code"; "Shop Calendar Code")
                {
                    Importance = Promoted;
                }
                field("Queue Time"; "Queue Time")
                {
                }
                field("Queue Time Unit of Meas. Code"; "Queue Time Unit of Meas. Code")
                {
                }
            }
            group(Warehouse)
            {
                CaptionML = ENU = 'Warehouse',
                            ENN = 'Warehouse';
                field("Location Code"; "Location Code")
                {

                    trigger OnValidate();
                    begin
                        UpdateEnabled;
                    end;
                }
                field("Open Shop Floor Bin Code"; "Open Shop Floor Bin Code")
                {
                    Enabled = OpenShopFloorBinCodeEnable;
                }
                field("To-Production Bin Code"; "To-Production Bin Code")
                {
                    Enabled = ToProductionBinCodeEnable;
                }
                field("From-Production Bin Code"; "From-Production Bin Code")
                {
                    Enabled = FromProductionBinCodeEnable;
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
                action(Dimensions)
                {
                    CaptionML = ENU='Dimensions',
                                ENN='Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                                    RunPageLink = Table ID=CONST(99000754),No.=FIELD(No.);
                    ShortCutKey = 'Shift+Ctrl+D';
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
                action("Lo&ad")
                {
                    CaptionML = ENU='Lo&ad',
                                ENN='Lo&ad';
                    Image = WorkCenterLoad;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Work Center Load";
                                    RunPageLink = No.=FIELD(No.),Work Shift Filter=FIELD(Work Shift Filter);
                }
                separator(Action47)
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
                    RunPageView = SORTING(Capacity Type,No.,Date,Starting Time);
                }
                action("Ta&sk List")
                {
                    CaptionML = ENU='Ta&sk List',
                                ENN='Ta&sk List';
                    Image = TaskList;
                    RunObject = Page "Work Center Task List";
                                    RunPageLink = No.=FIELD(No.);
                    RunPageView = SORTING(Type,No.) WHERE(Type=CONST(Work Center),Status=FILTER(..Released),Routing Status=FILTER(<>Finished));
                }
            }
        }
        area(reporting)
        {
            action("Subcontractor - Dispatch List")
            {
                CaptionML = ENU='Subcontractor - Dispatch List',
                            ENN='Subcontractor - Dispatch List';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Subcontractor - Dispatch List";
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

    (23659)]
    local procedure UpdateEnabled();
    var
        Location : Record Location;
    begin
        IF "Location Code" <> '' THEN
          Location.GET("Location Code");

        OpenShopFloorBinCodeEnable := Location."Bin Mandatory";
        ToProductionBinCodeEnable := Location."Bin Mandatory";
        FromProductionBinCodeEnable := Location."Bin Mandatory";
    end;

    (23667)]
    local procedure OnActivateForm();
    begin
        UpdateEnabled;
    end;
}

