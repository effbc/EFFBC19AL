pageextension 70059 FixedAssetCardExt extends "Fixed Asset Card"
{
    // version NAVW19.00.00.51947,NAVIN9.00.00.51947,B2B1.0,Rev01

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.


        //Unsupported feature: Change Name on "Control 1". Please convert manually.


        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 26". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 26". Please convert manually.


        //Unsupported feature: Change Name on "Control 22". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 22". Please convert manually.


        //Unsupported feature: Change Name on "Control 20". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 18". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 18". Please convert manually.


        //Unsupported feature: Change Name on "Control 63". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 63". Please convert manually.


        //Unsupported feature: Change Name on "Control 65". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 65". Please convert manually.


        //Unsupported feature: Change Name on "Control 30". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 30". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500003". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500003". Please convert manually.


        //Unsupported feature: Change Name on "Control 32". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 32". Please convert manually.


        //Unsupported feature: Change PagePartID on "DepreciationBook(Control 6)". Please convert manually.


        //Unsupported feature: Change Name on "Control 1904784501". Please convert manually.


        //Unsupported feature: Change Name on "Control 43". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 43". Please convert manually.


        //Unsupported feature: Change Name on "Control 45". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 45". Please convert manually.


        //Unsupported feature: Change Name on "Control 52". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 52". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500001". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500001". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280000". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280000". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280002". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280002". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280004". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280004". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280006". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280006". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500002". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500002". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500004". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500004". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500005". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500005". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500006". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500006". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280008". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280008". Please convert manually.


        //Unsupported feature: Change Name on "Control 1903524101". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 24". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 24". Please convert manually.


        //Unsupported feature: Change Name on "Control 37". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 37". Please convert manually.


        //Unsupported feature: Change Name on "Control 28". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 28". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900000007". Please convert manually.


        //Unsupported feature: Change Name on "Control 1900383207". Please convert manually.


        //Unsupported feature: Change Name on "Control 1905767507". Please convert manually.

        modify("Control 1000000000")
        {
            Visible = false;
        }
        addafter("Control 20")
        {
            field("Location Code"; "Location Code")
            {
            }
        }
        addafter("Control 63")
        {
            field("Responsible Emp Name"; "Responsible Emp Name")
            {
                Editable = false;
            }
        }
        addafter("Control 32")
        {
            field("Global Dimension 2 Code"; "Global Dimension 2 Code")
            {
            }
            field(Verified; Verified)
            {

                trigger OnValidate();
                begin
                    IF NOT (USERID IN ['EFFTRONICS\ANANDA']) THEN
                        ERROR('You dont have rights to Verify');
                end;
            }
            field("Verified Date"; "Verified Date")
            {
                Editable = false;
            }
        }
        addafter("Control 1280008")
        {
            field("GST Calc. Option on Transfer"; "GST Calc. Option on Transfer")
            {
            }
            field("Service Tax Group Code"; "Service Tax Group Code")
            {
            }
            field("Item Sub Sub Group Code"; "Item Sub Sub Group Code")
            {
            }
            field("QR Code"; "QR Code")
            {
            }
            field("FA Posting Group"; "FA Posting Group")
            {
            }
        }
        addafter("Control 24")
        {
            field("AMC No."; "AMC No.")
            {
            }
            field("AMC Date"; "AMC Date")
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000003". Please convert manually.


        //Unsupported feature: Change Name on "Action 47". Please convert manually.

        modify("Action 51")
        {

            //Unsupported feature: Change RunObject on "Action 51". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 51". Please convert manually.

        }
        modify("Action 40")
        {

            //Unsupported feature: Change RunObject on "Action 40". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 40". Please convert manually.

        }

        //Unsupported feature: Change RunObject on "Action 84". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 84". Please convert manually.


        //Unsupported feature: Change Name on "Action 84". Please convert manually.

        modify("Action 35")
        {

            //Unsupported feature: Change RunObject on "Action 35". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 35". Please convert manually.

        }

        //Unsupported feature: Change RunObject on "Action 36". Please convert manually.


        //Unsupported feature: Change Name on "Action 36". Please convert manually.

        modify("Action 57")
        {

            //Unsupported feature: Change Ellipsis on "Action 57". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 57". Please convert manually.

        }

        //Unsupported feature: Change RunObject on "Action 42". Please convert manually.


        //Unsupported feature: Change Name on "Action 42". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 50". Please convert manually.


        //Unsupported feature: Change RunPageLink on "Action 50". Please convert manually.


        //Unsupported feature: Change Name on "Action 50". Please convert manually.


        //Unsupported feature: Change Name on "Action 3". Please convert manually.

        modify("Action 29")
        {

            //Unsupported feature: Change RunObject on "Action 29". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 29". Please convert manually.

        }

        //Unsupported feature: Change RunObject on "Action 41". Please convert manually.


        //Unsupported feature: Change Name on "Action 41". Please convert manually.


        //Unsupported feature: Change Name on "Action 39". Please convert manually.


        //Unsupported feature: Change Name on "Action 5". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 68". Please convert manually.


        //Unsupported feature: Change Name on "Action 68". Please convert manually.


        //Unsupported feature: Change Name on "Action 54". Please convert manually.


        //Unsupported feature: Change Name on "Action 61". Please convert manually.


        //Unsupported feature: Change Name on "Action 1500000". Please convert manually.


        //Unsupported feature: Change Name on "Action 11". Please convert manually.

        modify("Action 7")
        {

            //Unsupported feature: Change RunObject on "Action 7". Please convert manually.

            Promoted = false;

            //Unsupported feature: Change Name on "Action 7". Please convert manually.

        }

        //Unsupported feature: Change RunObject on "Action 8". Please convert manually.


        //Unsupported feature: Change Name on "Action 8". Please convert manually.

        modify("Action 9")
        {

            //Unsupported feature: Change RunObject on "Action 9". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 9". Please convert manually.

        }

        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.

        modify(CalculateDepreciation)
        {
            Promoted = true;
        }

        //Unsupported feature: Change Name on "Action 1900000006". Please convert manually.

        modify("Action 1907091306")
        {

            //Unsupported feature: Change RunObject on "Action 1907091306". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 1907091306". Please convert manually.

        }
        modify("Action 1903109606")
        {

            //Unsupported feature: Change RunObject on "Action 1903109606". Please convert manually.

            Promoted = false;

            //Unsupported feature: Change Name on "Action 1903109606". Please convert manually.

        }
        modify("Action 1901902606")
        {

            //Unsupported feature: Change RunObject on "Action 1901902606". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 1901902606". Please convert manually.

        }
        modify("Action 1905598506")
        {

            //Unsupported feature: Change RunObject on "Action 1905598506". Please convert manually.

            Promoted = false;

            //Unsupported feature: Change Name on "Action 1905598506". Please convert manually.

        }
        modify("Action 1905598606")
        {

            //Unsupported feature: Change RunObject on "Action 1905598606". Please convert manually.

            Promoted = false;

            //Unsupported feature: Change Name on "Action 1905598606". Please convert manually.

        }
        modify("Action 1901105406")
        {

            //Unsupported feature: Change RunObject on "Action 1901105406". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 1901105406". Please convert manually.

        }
        modify("Action 1902048606")
        {

            //Unsupported feature: Change RunObject on "Action 1902048606". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 1902048606". Please convert manually.

        }
        modify("Action 1903345906")
        {

            //Unsupported feature: Change RunObject on "Action 1903345906". Please convert manually.

            Promoted = false;

            //Unsupported feature: Change Name on "Action 1903345906". Please convert manually.

        }
        modify("Action 1903807106")
        {

            //Unsupported feature: Change RunObject on "Action 1903807106". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 1903807106". Please convert manually.

        }
        addafter("Action 57")
        {
            separator(Action1102152004)
            {
            }
            action("F&A Location Transfer Entries")
            {
                Caption = 'F&A Location Transfer Entries';
                Image = TransferReceipt;

                trigger OnAction();
                var
                    FixedAssetTransfer: Record "Fixed Asset Transfer";
                    FixedAssetTransferForm: Page "Fixed Asset Transfer";
                begin
                    FixedAssetTransfer.SETRANGE("Fixed Asset No.", "No.");
                    FixedAssetTransfer.SETFILTER("FA New Location", '<>%1', '');
                    IF PAGE.RUNMODAL(60006, FixedAssetTransfer) = ACTION::LookupOK THEN;
                end;
            }
            action("F&A Employee Transfer Entries")
            {
                Caption = 'F&A Employee Transfer Entries';
                Image = EmployeeAgreement;

                trigger OnAction();
                var
                    FixedAssetTransfer: Record "Fixed Asset Transfer";
                begin
                    FixedAssetTransfer.SETRANGE("Fixed Asset No.", "No.");
                    FixedAssetTransfer.SETFILTER("New Responsible Employee", '<>%1', '');
                    IF PAGE.RUNMODAL(60007, FixedAssetTransfer) = ACTION::LookupOK THEN;
                end;
            }
        }
        addafter("Action 42")
        {
            action("Purchase Receipt")
            {
                Caption = 'Purchase Receipt';

                trigger OnAction();
                begin
                    PurchRcptLine.RESET;
                    PurchRcptLine.SETFILTER(PurchRcptLine."No.", "No.");
                    PurchRcptLine.SETFILTER(PurchRcptLine.Quantity, '>%1', 0);
                    IF PurchRcptLine.FINDFIRST THEN BEGIN
                        PurchRcptHead.RESET;
                        PurchRcptHead.SETFILTER(PurchRcptHead."No.", PurchRcptLine."Document No.");
                        IF PurchRcptHead.FINDFIRST THEN BEGIN
                            PAGE.RUN(136, PurchRcptHead);
                        END;
                    END;
                end;
            }
        }
    }


    //Unsupported feature: PropertyModification on "Action 57.OnAction.CopyFA(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 57.OnAction.CopyFA : 5685;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 57.OnAction.CopyFA : "Copy Fixed Asset";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CalculateDepreciation(Action 1900145704).OnAction.FixedAsset(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CalculateDepreciation : 5600;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CalculateDepreciation : "Fixed Asset";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "FADeprBook(Variable 1500000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //FADeprBook : 5612;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //FADeprBook : "FA Depreciation Book";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "FAShifts(Variable 1500001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //FAShifts : 16520;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //FAShifts : "FA Shift";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "FAShift(Variable 1500002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //FAShift : 16537;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //FAShift : "FA Shifts";
    //Variable type has not been exported.

    var
        PurchRcptLine: Record "Purch. Rcpt. Line";
        PurchRcptHead: Record "Purch. Rcpt. Header";


    //Unsupported feature: CodeInsertion on "OnInsertRecord". Please convert manually.

    //trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    //begin
    /*
    {
    // Added by Pranavi on 02-Nov-2016
    "VAT Product Posting Group" := 'NO VAT';
    "FA Class Code" := 'TANGIBLE';
    "Gen. Prod. Posting Group" := 'FIXED AST.';
    "Excise Prod. Posting Group" := '12.5%';    // Need to be updated with excise % updated
    "Tax Group Code" := 'FIXED ASSE';
    "Excise Accounting Type" := "Excise Accounting Type"::"With CENTVAT";

    FADeprBook.INIT;
    FADeprBook."FA No." := "No.";
    FADeprBook."Depreciation Book Code" := 'COMPANY';

    IF COPYSTR("No.",1,4) = 'COMP' THEN
    BEGIN
      "FA Subclass Code" := 'COMPUTERS';
      FADeprBook."FA Posting Group" := 'COMPUTERS';
    END
    ELSE IF COPYSTR("No.",1,3) = 'SW-' THEN
    BEGIN
      "FA Subclass Code" := 'SOFT WARE';
      FADeprBook."FA Posting Group" := 'SOFTWARE';
    END
    ELSE IF COPYSTR("No.",1,3) = 'VEH' THEN
    BEGIN
      "FA Subclass Code" := 'VEHICLES';
      FADeprBook."FA Posting Group" := 'VEHICLES';
    END
    ELSE IF COPYSTR("No.",1,3) = 'P&M' THEN
    BEGIN
      "FA Subclass Code" := 'PLANT &MAC';
      FADeprBook."FA Posting Group" := 'PLA & MACH';
    END
    ELSE IF COPYSTR("No.",1,3) = 'O&E' THEN
    BEGIN
      "FA Subclass Code" := 'OFFICE';
      FADeprBook."FA Posting Group" := 'OFF-EQUIP';
    END
    ELSE IF COPYSTR("No.",1,3) = 'MI-' THEN
    BEGIN
      "FA Subclass Code" := 'MOBILE INS';
      FADeprBook."FA Posting Group" := 'MOBILE INS';
    END
    ELSE IF COPYSTR("No.",1,4) = 'LAND' THEN
    BEGIN
      "FA Subclass Code" := 'BUILDINGS';
      FADeprBook."FA Posting Group" := 'LAND';
    END
    ELSE IF COPYSTR("No.",1,3) = 'GW-' THEN
    BEGIN
      FADeprBook."FA Posting Group" := 'GOODWILL';
    END
    ELSE IF COPYSTR("No.",1,3) = 'F&F' THEN
    BEGIN
      "FA Subclass Code" := 'FURNITURES';
      FADeprBook."FA Posting Group" := 'FURN & FIX';
    END;

    FADeprBook.INSERT;
    // End by Pranavi
    }
    */
    //end;

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

