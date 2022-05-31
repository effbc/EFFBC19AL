page 60029 "Service List Archive"
{
    // version B2B1.0

    PageType = List;
    SourceTable = "Service Header Archive";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Version No."; "Version No.")
                {
                }
                field("Date Archived"; "Date Archived")
                {
                }
                field("Time Archived"; "Time Archived")
                {
                }
                field("Archived by"; "Archived by")
                {
                }
                field("Interaction Exist"; "Interaction Exist")
                {
                }
                field("Customer No."; "Customer No.")
                {
                }
                field(Name; Name)
                {
                }
                field("Your Reference"; "Your Reference")
                {
                }
                field("Contact Name"; "Contact Name")
                {
                }
                field("No."; "No.")
                {
                }
                field("Document Type"; "Document Type")
                {
                }
                field("Service Order Type"; "Service Order Type")
                {
                }
                field(Status; Status)
                {
                }
            }
        }
    }

    actions
    {
    }
}

