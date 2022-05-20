page 33000262 "Posted Inspection Data Sheet"
{
    // version QC1.1,Cal1.0,RQC1.0,Rev01

    Editable = true;
    InsertAllowed = false;
    PageType = Document;
    SourceTable = "Posted Inspect DatasheetHeader";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(comment;comment)
                {
                    Editable = false;
                }
                field("No.";"No.")
                {
                }
                field(Description;Description)
                {
                }
                field("Item No.";"Item No.")
                {
                }
                field("Item Description";"Item Description")
                {
                }
                field("Unit Of Measure Code";"Unit Of Measure Code")
                {
                }
                field(Quantity;Quantity)
                {
                }
                field("Spec ID";"Spec ID")
                {
                }
                field(Make;Make)
                {
                    Editable = true;
                }
                field("Lot No.";"Lot No.")
                {
                }
                field(Location;Location)
                {
                }
                field("Inspection Group Code";"Inspection Group Code")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Document Date";"Document Date")
                {
                }
                field("Rework Reference No.";"Rework Reference No.")
                {
                }
                field("Source Type";"Source Type")
                {
                }
                field(Status;Status)
                {
                    OptionCaption = '<Open,Released,Calibration>';
                }
                field("Actual Time";"Actual Time")
                {
                }
                field("Time Taken";"Time Taken")
                {
                }
                field("Planning Date";"Planning Date")
                {
                }
                field("Assigned User";"Assigned User")
                {
                }
                field("Posted By Name";"Posted By Name")
                {
                    Caption = 'Posted By';
                    Editable = false;
                }
            }
            part(DataSheetLine;"PostedInspec DataSheet Subform")
            {
                SubPageLink = Document No.=FIELD(No.);
            }
            group(Receipt)
            {
                Caption = 'Receipt';
                field("Vendor No.";"Vendor No.")
                {
                }
                field("Vendor Name";"Vendor Name")
                {
                }
                field("Vendor Name 2";"Vendor Name 2")
                {
                }
                field(Address;Address)
                {
                }
                field("Address 2";"Address 2")
                {
                }
                field("Contact Person";"Contact Person")
                {
                }
                field("Receipt No.";"Receipt No.")
                {
                }
                field("Order No.";"Order No.")
                {
                }
                field("Purch Line No";"Purch Line No")
                {
                }
                field("External Document No.";"External Document No.")
                {
                }
                field("Purchase Consignment No.";"Purchase Consignment No.")
                {
                }
                field("Inspection Receipt No.";"Inspection Receipt No.")
                {
                }
                field("Quality Before Receipt";"Quality Before Receipt")
                {
                }
                field(Indented_Person;Indented_Person)
                {
                }
            }
            group(Production)
            {
                Caption = 'Production';
                field("Prod. Order No.";"Prod. Order No.")
                {
                }
                field("Prod. Order Line";"Prod. Order Line")
                {
                }
                field("Routing No.";"Routing No.")
                {
                }
                field("Routing Reference No.";"Routing Reference No.")
                {
                }
                field("Operation No.";"Operation No.")
                {
                }
                field("Prod. Description";"Prod. Description")
                {
                }
                field("Operation Description";"Operation Description")
                {
                }
                field("Production Batch No.";"Production Batch No.")
                {
                }
                field("Sub Assembly Code";"Sub Assembly Code")
                {
                }
                field("Sub Assembly Description";"Sub Assembly Description")
                {
                }
                field("Issues For Pending";"Issues For Pending")
                {
                }
                field("In Process";"In Process")
                {
                }
                field(Resource;Resource)
                {
                }
                field("OutPut Jr Serial No.";"OutPut Jr Serial No.")
                {
                }
                field("Finished Product Sr No";"Finished Product Sr No")
                {
                }
                field("Rework User";"Rework User")
                {
                }
            }
            group("Sales Cr.Memo")
            {
                Caption = 'Sales Cr.Memo';
                field("Sales Order No.";"Sales Order No.")
                {
                }
                field("Posted Sales Order No.";"Posted Sales Order No.")
                {
                }
                field("Sales Line No";"Sales Line No")
                {
                }
                field("Customer No.";"Customer No.")
                {
                }
                field("Customer Name";"Customer Name")
                {
                }
                field("Customer Name 2";"Customer Name 2")
                {
                }
                field("Customer Address";"Customer Address")
                {
                }
                field("Customer Address2";"Customer Address2")
                {
                }
            }
            group(Transfer)
            {
                Caption = 'Transfer';
                field("Trans. Order No.";"Trans. Order No.")
                {
                }
                field("Trans. Order Line";"Trans. Order Line")
                {
                }
                field("Trans. Description";"Trans. Description")
                {
                }
                field("Transfer-from Code";"Transfer-from Code")
                {
                }
                field("Transfer-to Code";"Transfer-to Code")
                {
                }
            }
            group(Calibration)
            {
                Caption = 'Calibration';
                field("<Vendor No.2>";"Vendor No.")
                {
                }
                field("<Vendor Name2>";"Vendor Name")
                {
                }
                field("<Address2>";Address)
                {
                }
                field("<Address 22>";"Address 2")
                {
                }
                field("<Contact Person2>";"Contact Person")
                {
                }
                field("Calibration Party";"Calibration Party")
                {
                }
                field("<Resource2>";Resource)
                {
                }
                field("Eqpt. Serial No.";"Eqpt. Serial No.")
                {
                }
                field(Department;Department)
                {
                }
                field("Std. Reference";"Std. Reference")
                {
                }
                field("Least Count";"Least Count")
                {
                }
                field("Measuring Range";"Measuring Range")
                {
                }
                field("Model No.";"Model No.")
                {
                }
            }
            group(Others)
            {
                Caption = 'Others';
                field("Item Category Code";"Item Category Code")
                {
                }
                field("Product Group Code";"Product Group Code")
                {
                }
                field("Item Sub Group Code";"Item Sub Group Code")
                {
                }
                field("Item Sub Sub Group Code";"Item Sub Sub Group Code")
                {
                }
                field("No. of Opportunities";"No. of Opportunities")
                {
                }
                field("No.of Fixing Holes";"No.of Fixing Holes")
                {
                }
                field("No. of Soldering Points";"No. of Soldering Points")
                {
                }
                field("No. of Pins";"No. of Pins")
                {
                }
                field("Reason for Pending";"Reason for Pending")
                {
                }
            }
            group("LED Details")
            {
                Caption = 'LED Details';
                field("LED Part No.";"LED Part No.")
                {
                }
                field(Color;Color)
                {
                }
                field("Intensity Code";"Intensity Code")
                {
                }
                field("Intensity Value";"Intensity Value")
                {
                }
                field("Color Code";"Color Code")
                {
                }
                field("Color Value";"Color Value")
                {
                }
                field("Voltage Code";"Voltage Code")
                {
                }
                field("Voltage Value";"Voltage Value")
                {
                }
                field("Ext Batch No";"Ext Batch No")
                {
                }
                field("Ext Lot No";"Ext Lot No")
                {
                }
                field("Date Code";"Date Code")
                {
                }
                field(Date;Date)
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Data Sheet")
            {
                Caption = '&Data Sheet';
                action("&Attachments")
                {
                    Caption = '&Attachments';
                    Image = Attach;

                    trigger OnAction();
                    begin

                        attachment.RESET;
                        attachment.SETRANGE("Table ID",DATABASE::"Posted Inspect DatasheetHeader");
                        attachment.SETRANGE("Document No.","No.");
                        //attachment.SETRANGE("Ids Reference No.","Ids Reference No.");
                        //Attachment.SETRANGE("Document Type","Document Type");
                        PAGE.RUN(PAGE::"ESPL Attachments",attachment);
                    end;
                }
            }
        }
        area(processing)
        {
            action(Comment)
            {
                Caption = 'Comment';
                Image = Comment;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Quality Comment Sheet";
                RunPageLink = Type=CONST(Posted Inspection Data Sheets),No.=FIELD(No.);
                ToolTip = 'Comment';
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        Indented_Person:='';
        PurchLineGrec.RESET;
        PurchLineGrec.SETFILTER(PurchLineGrec."Document No.","Order No.");
        PurchLineGrec.SETFILTER(PurchLineGrec."Line No.",'%1',"Purch Line No");
        IF PurchLineGrec.FINDFIRST THEN
        BEGIN
          IF PurchLineGrec."Indent No." <>'' THEN
          BEGIN
            Indent_header.RESET;
            IF Indent_header.GET(PurchLineGrec."Indent No.") THEN
               Indented_Person:=Indent_header."User Id";
          END;
        END;
    end;

    trigger OnOpenPage();
    begin



        CALCFIELDS("Total Qty in IDS");
    end;

    var
        attachment : Record Attachments;
        Indented_Person : Code[50];
        Indent_header : Record "Indent Header";
        PurchLineGrec : Record "Purchase Line";
}

