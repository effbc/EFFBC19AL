pageextension 70034 CreateInteractionExt extends "Create Interaction"
{
    // version NAVW19.00.00.45778

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.

        modify("Control 28")
        {

            //Unsupported feature: Change MultiLine on "Control 28". Please convert manually.


            //Unsupported feature: Change Name on "Control 28". Please convert manually.

            ShowCaption = false;
        }
        modify("Control 37")
        {

            //Unsupported feature: Change MultiLine on "Control 37". Please convert manually.


            //Unsupported feature: Change Name on "Control 37". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 41". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 41". Please convert manually.


        //Unsupported feature: Change Name on "Control 39". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 39". Please convert manually.


        //Unsupported feature: Change Lookup on "Control 23". Please convert manually.


        //Unsupported feature: Change Name on "Control 23". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 23". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 35". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 35". Please convert manually.


        //Unsupported feature: Change Name on "Control 22". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 22". Please convert manually.


        //Unsupported feature: Change Name on "Control 27". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 27". Please convert manually.


        //Unsupported feature: Change Name on "Control 45". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 45". Please convert manually.

        modify("Control 47")
        {

            //Unsupported feature: Change Name on "Control 47". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 50". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 50". Please convert manually.


        //Unsupported feature: Change Name on "Control 52". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 52". Please convert manually.


        //Unsupported feature: Change Name on "Control 30". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 30". Please convert manually.


        //Unsupported feature: Change Name on "Control 32". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 32". Please convert manually.


        //Unsupported feature: Change Name on "Control 34". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 34". Please convert manually.


        //Unsupported feature: Change Name on "Control 36". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 36". Please convert manually.


        //Unsupported feature: Change Lookup on "Control 20". Please convert manually.


        //Unsupported feature: Change MultiLine on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 20". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 51". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 51". Please convert manually.


        //Unsupported feature: Change Name on "Control 53". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 53". Please convert manually.


        //Unsupported feature: Change Lookup on "Control 54". Please convert manually.


        //Unsupported feature: Change Name on "Control 54". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 54". Please convert manually.

        addfirst(Step3)
        {
            field("OutWard No."; "OutWard No.")
            {

                trigger OnValidate();
                begin
                    TESTFIELD("Information Flow", "Information Flow"::Outbound);
                end;
            }
            field("OutWard Ref No."; "OutWard Ref No.")
            {

                trigger OnLookup(Text: Text): Boolean;
                begin
                    InteractionLogEntry.RESET;
                    InteractionLogEntry.SETRANGE("Contact No.", "Contact No.");
                    InteractionLogEntry.SETFILTER("OutWard No.", '<>%1', '');
                    IF InteractionLogEntry.FINDFIRST THEN
                        IF PAGE.RUNMODAL(0, InteractionLogEntry) = ACTION::LookupOK THEN
                            "OutWard Ref No." := InteractionLogEntry."OutWard No.";
                end;
            }
        }
        addafter("Control 50")
        {
            field("InWard No."; "InWard No.")
            {

                trigger OnValidate();
                begin
                    TESTFIELD("Information Flow", "Information Flow"::Inbound);
                end;
            }
        }
        addafter("Control 30")
        {
            field("InWard Ref No."; "InWard Ref No.")
            {

                trigger OnLookup(Text: Text): Boolean;
                begin
                    InteractionLogEntry.RESET;
                    InteractionLogEntry.SETRANGE("Contact No.", "Contact No.");
                    InteractionLogEntry.SETFILTER("InWard No.", '<>%1', '');
                    IF InteractionLogEntry.FINDFIRST THEN
                        IF PAGE.RUNMODAL(0, InteractionLogEntry) = ACTION::LookupOK THEN
                            "InWard Ref No." := InteractionLogEntry."InWard No.";
                end;
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.

        modify(Back)
        {
            InFooterBar = true;
            Promoted = true;
            PromotedCategory = Process;
        }
        modify(Next)
        {
            InFooterBar = true;
            Promoted = true;
            PromotedCategory = Process;
        }
        modify(Finish)
        {
            InFooterBar = true;
            Promoted = true;
            PromotedCategory = Process;
        }

        //Unsupported feature: Change Name on "Action 7". Please convert manually.


        //Unsupported feature: Change Name on "Action 6". Please convert manually.

    }


    //Unsupported feature: PropertyModification on "Control 23.OnAssistEdit.Cont(Variable 1102601000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Control 23.OnAssistEdit.Cont : 5050;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Control 23.OnAssistEdit.Cont : Contact;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Control 20.OnAssistEdit.Campaign(Variable 1102601000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Control 20.OnAssistEdit.Campaign : 5071;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Control 20.OnAssistEdit.Campaign : Campaign;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Cont(Variable 1006)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Cont : 5050;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Cont : Contact;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SalesPurchPerson(Variable 1007)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SalesPurchPerson : 13;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SalesPurchPerson : "Salesperson/Purchaser";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Campaign(Variable 1008)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Campaign : 5071;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Campaign : Campaign;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Todo(Variable 1022)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Todo : 5080;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Todo : "To-do";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Opp(Variable 1016)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Opp : 5092;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Opp : Opportunity;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "AttachmentTemp(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //AttachmentTemp : 5062;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AttachmentTemp : Attachment;
    //Variable type has not been exported.

    var
        InteractionLogEntry: Record "Interaction Log Entry";
        InteractionLogEntries: Page "Interaction Log Entries";

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

