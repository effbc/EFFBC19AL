page 60037 "Service Order Archive Subform"
{
    // version B2B1.0

    AutoSplitKey = true;
    Caption = 'Service Order Subform';
    DelayedInsert = true;
    PageType = ListPart;
    SourceTable = "Service Item Line Archive";
    SourceTableView = WHERE(Document Type=CONST(Order));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Line No."; "Line No.")
                {
                    Visible = false;
                }
                field("Service Item No."; "Service Item No.")
                {
                }
                field("Service Item Group Code"; "Service Item Group Code")
                {
                }
                field("Ship-to Code"; "Ship-to Code")
                {
                    Visible = false;
                }
                field("Item No."; "Item No.")
                {
                }
                field("Serial No."; "Serial No.")
                {
                }
                field(Description; Description)
                {
                }
                field("Description 2"; "Description 2")
                {
                    Visible = false;
                }
                field("Repair Status Code"; "Repair Status Code")
                {
                }
                field("Service Shelf No."; "Service Shelf No.")
                {
                    Visible = false;
                }
                field(Warranty; Warranty)
                {
                }
                field("Warranty Starting Date (Parts)"; "Warranty Starting Date (Parts)")
                {
                    Visible = false;
                }
                field("Warranty Ending Date (Parts)"; "Warranty Ending Date (Parts)")
                {
                    Visible = false;
                }
                field("Warranty % (Parts)"; "Warranty % (Parts)")
                {
                    Visible = false;
                }
                field("Warranty % (Labor)"; "Warranty % (Labor)")
                {
                    Visible = false;
                }
                field("Warranty Starting Date (Labor)"; "Warranty Starting Date (Labor)")
                {
                    Visible = false;
                }
                field("Warranty Ending Date (Labor)"; "Warranty Ending Date (Labor)")
                {
                    Visible = false;
                }
                field("Contract No."; "Contract No.")
                {
                }
                field("Fault Reason Code"; "Fault Reason Code")
                {
                    Visible = false;
                }
                field("Service Price Group Code"; "Service Price Group Code")
                {
                    Visible = false;
                }
                field("Adjustment Type"; "Adjustment Type")
                {
                    Visible = false;
                }
                field("Base Amount to Adjust"; "Base Amount to Adjust")
                {
                    Visible = false;
                }
                field("Fault Area Code"; "Fault Area Code")
                {
                    Visible = false;
                }
                field("Symptom Code"; "Symptom Code")
                {
                    Visible = false;
                }
                field("Fault Code"; "Fault Code")
                {
                    Visible = false;
                }
                field("Resolution Code"; "Resolution Code")
                {
                    Visible = false;
                }
                field(Priority; Priority)
                {
                }
                field("Response Date"; "Response Date")
                {
                }
                field("Response Time"; "Response Time")
                {
                }
                field("Vendor No."; "Vendor No.")
                {
                    Visible = false;
                }
                field("Vendor Item No."; "Vendor Item No.")
                {
                    Visible = false;
                }
                field("Loaner No."; "Loaner No.")
                {
                    LookupPageID = "Available Loaners";
                }
                field("Starting Date"; "Starting Date")
                {
                    Visible = false;
                }
                field("Starting Time"; "Starting Time")
                {
                    Visible = false;
                }
                field("Finishing Date"; "Finishing Date")
                {
                    Visible = false;
                }
                field("Finishing Time"; "Finishing Time")
                {
                    Visible = false;
                }
                field("No. of Previous Services"; "No. of Previous Services")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        ServHeader: Record "Service Header";
        ServLoanerMgt: Codeunit ServLoanerManagement;

    [LineStart(5469)]
    procedure ShowComments(Type: Option General,Fault,Resolution,Accessory,Internal,"Service Item Loaner");
    begin
    end;

    [LineStart(5472)]
    procedure RegisterServInvLines();
    var
        ServInvLine: Record "Service Line";
    begin
    end;

    [LineStart(5475)]
    procedure ShowServOrderWorksheet();
    var
        ServItemLine: Record "Service Item Line";
    begin
    end;

    [LineStart(5478)]
    procedure AllocateResource();
    var
        ServOrderAlloc: Record "Service Order Allocation";
    begin
    end;

    [LineStart(5481)]
    procedure ReceiveLoaner();
    begin
    end;

    [LineStart(5484)]
    procedure ShowServItemEventLog();
    var
        ServItemLog: Record "Service Item Log";
    begin
    end;

    [LineStart(5487)]
    procedure ShowChecklist();
    var
        TblshtgHeader: Record "Troubleshooting Header";
    begin
    end;

    [LineStart(5490)]
    procedure "---B2B--"();
    begin
    end;

    [LineStart(5493)]
    procedure OpenAttachments();
    var
        Attachments: Record Attachments;
    begin
    end;
}

