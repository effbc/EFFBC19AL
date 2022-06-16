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
                ApplicationArea = All;
            }
            field("SO No."; "SO No.")
            {
                ApplicationArea = All;
            }
            field("SO Line No."; "SO Line No.")
            {
                ApplicationArea = All;
            }
        }
        addafter(Priority)
        {
            field("Sales Date"; "Sales Date")
            {
                ApplicationArea = All;
            }
            field("Creation Date"; "Creation Date")
            {
                Editable = false;
                ApplicationArea = All;
            }
        }
        addafter("Preferred Resource")
        {
            field("WORKING STATUS"; "WORKING STATUS")
            {
                ApplicationArea = All;
            }
            field("Present Location"; "Present Location")
            {
                ApplicationArea = All;
            }
            field("Changed Location"; "Changed Location")
            {
                ApplicationArea = All;

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
                ApplicationArea = All;
            }
        }
        addafter("Installation Date")
        {
            field("Installed Location"; "Installed Location")
            {
                ApplicationArea = All;
            }
            field(Territory; Territory)
            {
                ApplicationArea = All;
            }
            field(Position; Position)
            {
                ApplicationArea = All;
            }
            field("Power Supply"; "Power Supply")
            {
                ApplicationArea = All;
            }
            field("Job No."; "Job No.")
            {
                ApplicationArea = All;
            }
            field("Job Installation Date"; "Job Installation Date")
            {
                ApplicationArea = All;
            }
            field("Software Code"; "Software Code")
            {
                ApplicationArea = All;
            }
            field("Software Version"; "Software Version")
            {
                ApplicationArea = All;
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
                RunPageLink = Service Item No.=                ApplicationArea = All;
                ApplicationArea = All;
FIELD(No.);
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

