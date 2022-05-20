pageextension 70246 TroubleshootingSetupExt extends "Troubleshooting Setup"
{
    // version NAVW19.00.00.48067

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.

        modify("Control 1")
        {

            //Unsupported feature: Change Name on "Control 1". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 11". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 11". Please convert manually.


        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change DrillDown on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        addafter("Control 11")
        {
            field("Service Order No"; "Service Order No")
            {
            }
        }
        addafter("Control 2")
        {
            field(Date; Date)
            {
            }
        }
        addafter("Control 6")
        {
            field(Comment; Comment)
            {
            }
            field("Line No."; "Line No.")
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 13". Please convert manually.


        //Unsupported feature: Change Name on "Action 14". Please convert manually.

        addafter("Action 14")
        {
            action("Copy Comments")
            {
                Caption = 'Copy Comments';

                trigger OnAction();
                begin
                    Date := WORKDATE;
                    TroubleshootingLine.SETRANGE("No.", "Troubleshooting No.");
                    IF TroubleshootingLine.FINDSET THEN
                        REPEAT
                            "Line No." := TroubleshootingLine."Line No.";
                            Comment := TroubleshootingLine.Comment;
                            "Troubleshooting No." := "Troubleshooting No.";
                            Type := Type;
                            INSERT;
                        UNTIL TroubleshootingLine.NEXT = 0;
                    MESSAGE('Records Inserted');
                    TroubleshootingLine.SETRANGE("No.", "Troubleshooting No.");
                    TroubleShootingSetUp.RESET;
                    TroubleShootingSetUp.SETFILTER("Line No.", '=0');
                    IF TroubleShootingSetUp.FINDFIRST THEN
                        TroubleShootingSetUp.DELETEALL;
                end;
            }
        }
    }


    //Unsupported feature: PropertyModification on "TblshtgHeader(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TblshtgHeader : 5943;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TblshtgHeader : "Troubleshooting Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Tblshtg(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Tblshtg : 5990;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Tblshtg : Troubleshooting;
    //Variable type has not been exported.

    var
        "---b2b EFF---": Integer;
        TroubleshootingLine: Record "Troubleshooting Line";
        TroubleShootingSetUp: Record "Troubleshooting Setup";

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

