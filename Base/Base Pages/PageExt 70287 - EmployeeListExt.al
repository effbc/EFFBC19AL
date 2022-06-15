pageextension 70287 EmployeeListExt extends "Employee List"
{
    layout
    {
        addfirst(Control1)
        {
            field("xRec.COUNT"; xRec.COUNT)
            {

            }
        }
        addafter("Statistics Group Code")
        {
            field("Inactive Date"; "Inactive Date")
            {

            }
            field(Status; Status)
            {

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    VAR
        USER: Record User;
}