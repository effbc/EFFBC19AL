page 60127 "Schedule List"
{
    PageType = List;
    SourceTable = Schedule2;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("M/S Item";"M/S Item")
                {
                    Editable = false;
                }
                field("Document No.";"Document No.")
                {
                    Editable = false;
                }
                field("Document Line No.";"Document Line No.")
                {
                    Editable = false;
                }
                field("Line No.";"Line No.")
                {
                    Editable = false;
                }
                field(Type;Type)
                {
                    Editable = false;
                }
                field("No.";"No.")
                {
                    Editable = false;
                }
                field(Description;Description)
                {
                    Editable = false;
                }
                field(Quantity;Quantity)
                {
                    Editable = false;
                }
                field("Unit Cost";"Unit Cost")
                {
                    Editable = false;
                }
                field("RDSO Required";"RDSO Required")
                {
                    Editable = false;
                }
                field("Insp. Letter Sent";"Insp. Letter Sent")
                {
                    Editable = false;
                }
                field(Date;Date)
                {
                    Editable = false;
                }
                field(Priority;Priority)
                {
                    Editable = true;
                }
                field("Document Type";"Document Type")
                {
                    Editable = false;
                }
                field(Remarks;Remarks)
                {
                }
                field("Tender Schedule";"Tender Schedule")
                {
                    Editable = false;
                }
                field("Sales Description";"Sales Description")
                {
                    Editable = false;
                }
                field("Design Conclusions1";"Design Conclusions1")
                {
                    Editable = false;
                }
                field(Status;Status)
                {
                    Editable = false;
                }
                field(Dispatched;Dispatched)
                {
                }
                field(SetSelection;SetSelection)
                {
                }
                field("Source Document Line No.";"Source Document Line No.")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage();
    begin
         SETCURRENTKEY("M/S Item");
    end;
}

