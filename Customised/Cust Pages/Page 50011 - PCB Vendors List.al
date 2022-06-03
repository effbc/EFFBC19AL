page 50011 "PCB Vendors List"
{
    PageType = List;
    Permissions =;
    SourceTable = "PCB Vendors";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vendor No."; "Vendor No.")
                {
                }
                field("Vendor Name"; "Vendor Name")
                {
                }
                field("No. of Sides"; "No. of Sides")
                {
                }
                field("PCB Thickness"; "PCB Thickness")
                {
                }
                field("Copper Clad Thickness"; "Copper Clad Thickness")
                {
                }
                field("Min PCB Qty"; "Min PCB Qty")
                {
                }
                field("Max PCB Qty"; "Max PCB Qty")
                {
                }
                field("Min PCB Area"; "Min PCB Area")
                {
                }
                field("Max PCB Area"; "Max PCB Area")
                {
                }
                field("Price per Sq.m"; "Price per Sq.m")
                {
                }
                field("Fast Price"; "Fast Price")
                {
                }
                field("Super Fast Price"; "Super Fast Price")
                {
                }
                field("Fast Lead Time"; "Fast Lead Time")
                {
                }
                field("Super Fast Lead Time"; "Super Fast Lead Time")
                {
                }
                field("Quotation Date"; "Quotation Date")
                {
                }
                field(Type; Type)
                {
                }
                field("End Date"; "End Date")
                {
                }
                field(White; White)
                {
                }
                field(Green; Green)
                {
                }
                field(Black; Black)
                {
                }
                field(Blue; Blue)
                {
                }
            }
            group(Control1102152023)
            {
                ShowCaption = false;
                field("Total Items"; xRec.COUNT)
                {
                    Caption = 'Total Items';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnDeleteRecord(): Boolean;
    begin
        IF NOT (USERID IN ['EFFTRONICS\PRANAVI', 'EFFTRONICS\JHANSI', 'EFFTRONICS\VANIDEVI']) THEN
            ERROR('You do not right to delete!');
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean;
    begin
        IF NOT (USERID IN ['EFFTRONICS\PRANAVI', 'EFFTRONICS\JHANSI', 'EFFTRONICS\VANIDEVI', 'EFFTRONICS\RENUKACH', 'EFFTRONICS\ANANDA']) THEN
            ERROR('You do not right to insert!');
    end;

    trigger OnModifyRecord(): Boolean;
    begin
        IF NOT (USERID IN ['EFFTRONICS\PRANAVI', 'EFFTRONICS\JHANSI', 'EFFTRONICS\VANIDEVI', 'EFFTRONICS\RENUKACH', 'EFFTRONICS\ANANDA']) THEN
            ERROR('You do not right to modify!');
    end;
}

