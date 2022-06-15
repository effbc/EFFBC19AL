pageextension 70206 ServiceItemCardExt extends "Service Item Card"
{


    layout
    {



        modify("Post Code")
        {



            CaptionML = ENU = 'Post Code/City';


        }



        modify("Ship-to Post Code")
        {


            CaptionML = ENU = 'Ship-to Post Code/City';



        }



        addafter("Service Item Components")
        {
            field(ITLSNO; ITLSNO)
            {
            }
            field("SO No."; "SO No.")
            {
            }
            field("SO Line No."; "SO Line No.")
            {
            }
        }
        addafter(Priority)
        {
            field("Sales Date"; "Sales Date")
            {
            }
            field("Creation Date"; "Creation Date")
            {
                Editable = false;
            }
        }
        addafter("Preferred Resource")
        {
            field("WORKING STATUS"; "WORKING STATUS")
            {
            }
            field("Present Location"; "Present Location")
            {
            }
            field("Changed Location"; "Changed Location")
            {

                trigger OnValidate();
                begin
                    TESTFIELD(ITLSNO);
                    IF (("Changed Location" <> 'H-OFF') AND ("Changed Location" <> 'SERVICE') AND ("Changed Location" <> 'DAMAGE') AND
                        ("Changed Location" <> 'OLD STOCK') AND ("Changed Location" <> 'PRODUCT') AND ("Changed Location" <> 'DUMMY')) THEN BEGIN
                        Dimension_Value.RESET;
                        Dimension_Value.SETRANGE(Dimension_Value."Dimension Code", 'LOCATIONS');
                        Dimension_Value.SETRANGE(Dimension_Value.Code, "Changed Location");
                        IF Dimension_Value.FINDFIRST THEN
                            "Present Location" := Dimension_Value.Name;

                        IF "Item Ledger Entry".GET(ITLSNO) THEN BEGIN
                            "Item Ledger Entry"."Location Code" := 'SITE';
                            "Item Ledger Entry"."Global Dimension 2 Code" := "Changed Location";
                            "Item Ledger Entry".MODIFY;
                        END;
                    END;
                end;
            }
        }
        addafter("Ship-to Phone No.")
        {
            field("No. Series"; "No. Series")
            {
            }
        }
        addafter("Installation Date")
        {
            field("Installed Location"; "Installed Location")
            {
            }
            field(Territory; Territory)
            {
            }
            field(Position; Position)
            {
            }
            field("Power Supply"; "Power Supply")
            {
            }
            field("Job No."; "Job No.")
            {
            }
            field("Job Installation Date"; "Job Installation Date")
            {
            }
            field("Software Code"; "Software Code")
            {
            }
            field("Software Version"; "Software Version")
            {
            }
        }
    }
    actions
    {



        modify("Co&mments")
        {



            Promoted = true;



        }



        modify("Action39")
        {

            Promoted = true;



        }


        modify("Ser&vice Contracts")
        {



            Promoted = true;



        }



        modify("New Item")
        {



            Promoted = true;



        }


        modify("Service Line Item Label")
        {



            Promoted = false;



        }
        addfirst(Documents)
        {
            action("Service Orders")
            {
                Caption = 'Service Orders';
                Image = Document;
                RunObject = Page "Service Item Lines";
                RunPageLink = Service Item No.=FIELD(No.);
                RunPageView = SORTING(Service Item No.) ORDER(Ascending);
            }
        }
        addafter("Action127")
        {
            separator(Action1102152000)
            {
            }
            action("Network Dataloger/Display Board")
            {
                Caption = 'Network Dataloger/Display Board';
                RunObject = Page "Service Item DataLoggers";
                                RunPageLink = Creation Date=CONST(04/01/09),Base Location=FIELD(No.);
            }
            action("&Attachments")
            {
                Caption = '&Attachments';

                trigger OnAction();
                begin
                    Attachments;
                end;
            }
        }
    }


    

    var
        "location code" : Record "Location of service item";
        "Item Ledger Entry" : Record "Item Ledger Entry";
        Dimension_Value : Record "Dimension Value";
        Err : Boolean;
        [InDataSet]
        "Item No.Editable" : Boolean;


    
    local procedure ItemNoOnFormat();
    begin

        IF "Item No."<>'' THEN
           "Item No.Editable" :=FALSE
        ELSE
          "Item No.Editable" :=TRUE;

        RESET;
    end;

   
}

