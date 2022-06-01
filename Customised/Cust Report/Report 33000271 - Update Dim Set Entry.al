report 33000271 "Update Dim Set Entry"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Update Dim Set Entry.rdlc';
    Permissions = TableData "Dimension Set Tree Node" = rm;

    dataset
    {
        dataitem("Dimension Set Tree Node"; "Dimension Set Tree Node")
        {

            trigger OnAfterGetRecord();
            begin
                /*"Dimension Set Entry"."Dimension Value Code" := '08CA085';
                "Dimension Set Entry"."Dimension Value ID" := 745;
                "Dimension Set Entry".MODIFY;*/
                /*
                "Dimension Set Tree Node"."Dimension Set ID":=6191;
                "Dimension Set Tree Node".MODIFY;
                */
                "Dimension Set Tree Node".RENAME("Dimension Set Tree Node"."Parent Dimension Set ID", 2830);

            end;

            trigger OnPostDataItem();
            begin
                MESSAGE('completed');
            end;

            trigger OnPreDataItem();
            begin
                /*SETRANGE("Dimension Set Entry"."Dimension Set ID",17877);
                SETRANGE("Dimension Set Entry"."Dimension Code", 'EMPLOYEE CODES');
                IF COUNT >1 THEN
                  ERROR('do not run');*/
                /*
                SETRANGE("Dimension Set Tree Node"."Dimension Value ID",2499);
                SETRANGE("Dimension Set Tree Node"."Dimension Set ID",6849);
                SETRANGE("Dimension Set Tree Node"."Parent Dimension Set ID",85);
                IF COUNT >1 THEN
                ERROR('do not run');
                */
                SETRANGE("Dimension Set Tree Node"."Dimension Value ID", 17321);
                //SETRANGE("Dimension Set Tree Node"."Dimension Set ID",25594);
                SETRANGE("Dimension Set Tree Node"."Parent Dimension Set ID", 0);
                IF COUNT > 1 THEN
                    ERROR('do not run');



            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }
}

