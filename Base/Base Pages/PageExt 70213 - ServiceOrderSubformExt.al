pageextension 70213 ServiceOrderSubformExt extends "Service Order Subform"
{
    // version NAVW19.00.00.45778,NAVIN9.00.00.45778

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.

        modify("Control 1")
        {

            //Unsupported feature: Change Name on "Control 1". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "ServiceItemNo(Control 6)". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 48". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 48". Please convert manually.


        //Unsupported feature: Change Name on "Control 78". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 78". Please convert manually.


        //Unsupported feature: Change Name on "Control 76". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 76". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 50". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 50". Please convert manually.


        //Unsupported feature: Change Name on "Control 46". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 46". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 18". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 18". Please convert manually.


        //Unsupported feature: Change Name on "Control 20". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 22". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 22". Please convert manually.


        //Unsupported feature: Change Name on "Control 24". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 24". Please convert manually.


        //Unsupported feature: Change Name on "Control 56". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 56". Please convert manually.


        //Unsupported feature: Change Name on "Control 58". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 58". Please convert manually.


        //Unsupported feature: Change Name on "Control 26". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 26". Please convert manually.


        //Unsupported feature: Change Name on "Control 28". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 28". Please convert manually.


        //Unsupported feature: Change Name on "Control 36". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 36". Please convert manually.


        //Unsupported feature: Change Name on "Control 80". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 80". Please convert manually.


        //Unsupported feature: Change Name on "Control 82". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 82". Please convert manually.


        //Unsupported feature: Change Name on "Control 40". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 40". Please convert manually.


        //Unsupported feature: Change Name on "Control 42". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 42". Please convert manually.


        //Unsupported feature: Change Name on "Control 44". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 44". Please convert manually.


        //Unsupported feature: Change Name on "Control 60". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 60". Please convert manually.


        //Unsupported feature: Change Name on "Control 38". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 38". Please convert manually.


        //Unsupported feature: Change Name on "Control 30". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 30". Please convert manually.


        //Unsupported feature: Change Name on "Control 32". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 32". Please convert manually.


        //Unsupported feature: Change Name on "Control 34". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 34". Please convert manually.


        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 52". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 52". Please convert manually.


        //Unsupported feature: Change Name on "Control 54". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 54". Please convert manually.


        //Unsupported feature: Change Name on "Control 66". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 66". Please convert manually.


        //Unsupported feature: Change Name on "Control 68". Please convert manually.


        //Unsupported feature: Change Editable on "Control 68". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 68". Please convert manually.


        //Unsupported feature: Change Name on "Control 70". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 70". Please convert manually.


        //Unsupported feature: Change Name on "Control 72". Please convert manually.


        //Unsupported feature: Change Editable on "Control 72". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 72". Please convert manually.


        //Unsupported feature: Change Name on "Control 74". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 74". Please convert manually.

        addafter("Control 16")
        {
            field(Tested; Tested)
            {
            }
            field(Station; Station)
            {
            }
            field("Station Name"; "Station Name")
            {
            }
            field("From Location"; "From Location")
            {

                trigger OnValidate();
                begin
                    FromLocationOnAfterValidate;
                end;
            }
            field("To Location"; "To Location")
            {

                trigger OnValidate();
                begin
                    ToLocationOnAfterValidate;
                end;
            }
            field(Account; Account)
            {

                trigger OnValidate();
                begin
                    AccountOnPush;
                end;
            }
            field("Service Level"; "Service Level")
            {
            }
        }
        addafter("Control 56")
        {
            field("CS Product"; "CS Product")
            {
                Editable = false;
            }
            field("CS Module"; "CS Module")
            {
                Editable = false;
            }
            field("CS model"; "CS model")
            {
                Editable = false;
            }
        }
        addafter("Control 40")
        {
            field("Fault Area Description"; "Fault Area Description")
            {
                Caption = 'Product Module Description';
                Editable = false;
            }
            field("Sub Module Code"; "Sub Module Code")
            {
            }
            field("Sub Module Descrption"; "Sub Module Descrption")
            {
                Editable = false;
            }
            field("Problem from Site"; "Problem from Site")
            {
            }
            field("Site Problem Matched"; "Site Problem Matched")
            {
            }
            field("QC internal Remarks"; "QC internal Remarks")
            {
            }
            field("Site Feedback"; "Site Feedback")
            {
            }
        }
        addafter("Control 72")
        {
            field("Sent date time"; "Sent date time")
            {
            }
            field("Unit cost"; "Unit cost")
            {
            }
        }
    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.


        //Unsupported feature: Change Name on "Action 1907935204". Please convert manually.

        modify("Action 1900296804")
        {

            //Unsupported feature: Change Name on "Action 1900296804". Please convert manually.

            ShortCutKey = Shift+Ctrl+A;
        }

        //Unsupported feature: Change Name on "Action 1901033504". Please convert manually.


        //Unsupported feature: Change AccessByPermission on "Action 1905427504". Please convert manually.


        //Unsupported feature: Change Name on "Action 1905427504". Please convert manually.


        //Unsupported feature: Change Name on "Action 1901313504". Please convert manually.


        //Unsupported feature: Change Name on "Action 1901652704". Please convert manually.


        //Unsupported feature: Change Name on "Action 1902759304". Please convert manually.


        //Unsupported feature: Change Name on "Action 1900207104". Please convert manually.


        //Unsupported feature: Change Name on "Action 1903099904". Please convert manually.


        //Unsupported feature: Change Name on "Action 1901742304". Please convert manually.


        //Unsupported feature: Change Name on "Action 1901991404". Please convert manually.


        //Unsupported feature: Change Name on "Action 1906587504". Please convert manually.


        //Unsupported feature: Change Name on "Action 1900206304". Please convert manually.


        //Unsupported feature: Change Name on "Action 1902759704". Please convert manually.


        //Unsupported feature: Change Ellipsis on "Action 1901092004". Please convert manually.


        //Unsupported feature: Change Name on "Action 1901092004". Please convert manually.


        //Unsupported feature: Change Name on "Action 1905926804". Please convert manually.

        addafter("Action 1901991404")
        {
            action("T&roubleshotting Setup")
            {
                Caption = 'T&roubleshotting Setup';

                trigger OnAction();
                begin
                    //This functionality was copied from page #5900. Unsupported part was commented. Please check it.
                    /*CurrPage.ServItemLines.Page.*/
                    TroubleShottingforSerItem;

                end;
            }
        }
        addafter("Action 1901092004")
        {
            action("&Attachments")
            {
                Caption = '&Attachments';

                trigger OnAction();
                begin
                    //This functionality was copied from page #5900. Unsupported part was commented. Please check it.
                    /*CurrPage.ServItemLines.Page.*/
                    _Attachments;

                end;
            }
            action("Pre Site Visit")
            {
                Caption = 'Pre Site Visit';

                trigger OnAction();
                begin
                    //This functionality was copied from page #5900. Unsupported part was commented. Please check it.
                    /*CurrPage.ServItemLines.Page.*/
                    _Presite;

                end;
            }
        }
    }


    //Unsupported feature: PropertyModification on "ServiceItemNo(Control 6).OnLookup.ServOrderMgt(Variable 1000)". Please convert manually.

    //var
        //>>>> ORIGINAL VALUE:
        //ServiceItemNo : 5900;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //ServiceItemNo : ServOrderManagement;
        //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "RegisterServInvLines(PROCEDURE 4).ServInvLine(Variable 1000)". Please convert manually.

    //var
        //>>>> ORIGINAL VALUE:
        //RegisterServInvLines : 5902;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //RegisterServInvLines : "Service Line";
        //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "RegisterServInvLines(PROCEDURE 4).ServInvLines(Variable 1001)". Please convert manually.

    //var
        //>>>> ORIGINAL VALUE:
        //RegisterServInvLines : 5905;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //RegisterServInvLines : "Service Lines";
        //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ShowServOrderWorksheet(PROCEDURE 5).ServItemLine(Variable 1000)". Please convert manually.

    //var
        //>>>> ORIGINAL VALUE:
        //ShowServOrderWorksheet : 5901;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //ShowServOrderWorksheet : "Service Item Line";
        //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "AllocateResource(PROCEDURE 6).ServOrderAlloc(Variable 1000)". Please convert manually.

    //var
        //>>>> ORIGINAL VALUE:
        //AllocateResource : 5950;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //AllocateResource : "Service Order Allocation";
        //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "AllocateResource(PROCEDURE 6).ResAlloc(Variable 1001)". Please convert manually.

    //var
        //>>>> ORIGINAL VALUE:
        //AllocateResource : 6005;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //AllocateResource : "Resource Allocations";
        //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ShowServItemLog(PROCEDURE 13).ServItemLog(Variable 1000)". Please convert manually.

    //var
        //>>>> ORIGINAL VALUE:
        //ShowServItemLog : 5942;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //ShowServItemLog : "Service Item Log";
        //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ShowChecklist(PROCEDURE 3).TblshtgHeader(Variable 1000)". Please convert manually.

    //var
        //>>>> ORIGINAL VALUE:
        //ShowChecklist : 5943;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //ShowChecklist : "Troubleshooting Header";
        //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SelectFaultResolutionCode(PROCEDURE 15).ServSetup(Variable 1000)". Please convert manually.

    //var
        //>>>> ORIGINAL VALUE:
        //SelectFaultResolutionCode : 5911;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //SelectFaultResolutionCode : "Service Mgt. Setup";
        //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SelectFaultResolutionCode(PROCEDURE 15).FaultResolutionRelation(Variable 1001)". Please convert manually.

    //var
        //>>>> ORIGINAL VALUE:
        //SelectFaultResolutionCode : 5930;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //SelectFaultResolutionCode : "Fault/Resol. Cod. Relationship";
        //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CreatePriceAdjmt(PROCEDURE 8).ServPriceMgmt(Variable 1000)". Please convert manually.

    //var
        //>>>> ORIGINAL VALUE:
        //CreatePriceAdjmt : 6080;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //CreatePriceAdjmt : "Service Price Management";
        //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CreateServiceItem(PROCEDURE 9).Item(Variable 1001)". Please convert manually.

    //var
        //>>>> ORIGINAL VALUE:
        //CreateServiceItem : 27;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //CreateServiceItem : Item;
        //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CreateServiceItem(PROCEDURE 9).ServItemMgt(Variable 1000)". Please convert manually.

    //var
        //>>>> ORIGINAL VALUE:
        //CreateServiceItem : 5920;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //CreateServiceItem : ServItemManagement;
        //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GetStdServiceCodes(PROCEDURE 12).StdServItemGrCode(Variable 1000)". Please convert manually.

    //var
        //>>>> ORIGINAL VALUE:
        //GetStdServiceCodes : 5998;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //GetStdServiceCodes : "Standard Service Item Gr. Code";
        //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ServMgtSetup(Variable 1005)". Please convert manually.

    //var
        //>>>> ORIGINAL VALUE:
        //ServMgtSetup : 5911;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //ServMgtSetup : "Service Mgt. Setup";
        //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ServLoanerMgt(Variable 1007)". Please convert manually.

    //var
        //>>>> ORIGINAL VALUE:
        //ServLoanerMgt : 5901;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //ServLoanerMgt : ServLoanerManagement;
        //Variable type has not been exported.

    var
        "ITEMLEDGER ENTRY" : Record "Item Ledger Entry";
        item : Record Item;
        Customer : Record Customer;
        ServHeader : Record "Service Header";
        SMTP_MAIL : Codeunit "SMTP Mail";
        Mail_From : Text;
        Mail_To : Text;
        Subject : Text;
        Body : Text;


    //Unsupported feature: CodeInsertion on "OnDeleteRecord". Please convert manually.

    //trigger OnDeleteRecord() : Boolean;
    //begin
        /*
         //ERROR('You dont have rights to insert line');
        */
    //end;


    //Unsupported feature: CodeInsertion on "OnInit". Please convert manually.

    //trigger OnInit();
    //Parameters and return type have not been exported.
    //begin
        /*
        IPBarchartEnable := TRUE;
        IPSkilledResTextboxEnable := TRUE;
        IPSkilledResEnable := TRUE;
        IPTroubleshootingTextboxEnable := TRUE;
        IPTroubleshootingEnable := TRUE;
        IPCompListTextboxEnable := TRUE;
        IPCompListEnable := TRUE;
        IPServItemCommentPBEnable := TRUE;
        IPServItemButtonEnable := TRUE;
        IPServItemEnable := TRUE;
        */
    //end;


    //Unsupported feature: CodeInsertion on "OnInsertRecord". Please convert manually.

    //trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    //begin
        /*
        //ERROR('You dont have rights to insert line');
        */
    //end;

    [LineStart(27197)]
    procedure "---B2B--"();
    begin
    end;

    [LineStart(27200)]
    procedure _Attachments();
    var
        Attach : Record Attachments;
    begin
        Attach.RESET;
        Attach.SETRANGE("Table ID",DATABASE::"Service Header");
        Attach.SETRANGE("Document No.",Rec."Document No.");
        Attach.SETRANGE("Document Type","Document Type");

        PAGE.RUN(PAGE::"ESPL Attachments",Attach);
    end;

    [LineStart(27208)]
    procedure Attachments();
    var
        Attach : Record Attachments;
    begin
        Attach.RESET;
        Attach.SETRANGE("Table ID",DATABASE::"Service Header");
        Attach.SETRANGE("Document No.",Rec."Document No.");
        Attach.SETRANGE("Document Type","Document Type");

        PAGE.RUN(PAGE::"ESPL Attachments",Attach);
    end;

    [LineStart(27216)]
    procedure _Presite();
    var
        PreSiteCheckList : Record "Inst. PreSite Check List";
    begin
        PreSiteCheckList.RESET;
        PreSiteCheckList.SETRANGE("Sales Order No.","Document No.");
        PreSiteCheckList.SETRANGE("Sales Order Line No.","Line No.");
        PAGE.RUN(PAGE::"Inst. PreSite Check List",PreSiteCheckList);
    end;

    [LineStart(27222)]
    procedure Presite();
    var
        PreSiteCheckList : Record "Inst. PreSite Check List";
    begin
        PreSiteCheckList.RESET;
        PreSiteCheckList.SETRANGE("Sales Order No.","Document No.");
        PreSiteCheckList.SETRANGE("Sales Order Line No.","Line No.");
        PAGE.RUN(PAGE::"Inst. PreSite Check List",PreSiteCheckList);
    end;

    [LineStart(27228)]
    procedure TroubleShottingforSerItem();
    var
        TroubleshottingSetup : Record "Troubleshooting Setup";
    begin
        TroubleshottingSetup.SETRANGE("No.","Service Item No.");
        TroubleshottingSetup.SETRANGE(TroubleshottingSetup."Service Order No","Document No.");
        IF NOT( TroubleshottingSetup.FINDFIRST) THEN
        BEGIN
          TroubleshottingSetup.INIT;
          TroubleshottingSetup.Type:=TroubleshottingSetup.Type::"Service Item";
          TroubleshottingSetup."No.":="Service Item No.";
          TroubleshottingSetup."Troubleshooting No.":='TR00001';
          TroubleshottingSetup."Line No.":=10000;
          TroubleshottingSetup.Date:=WORKDATE;
          TroubleshottingSetup."Service Order No":="Document No.";
          TroubleshottingSetup.INSERT;
        END;

        TroubleshottingSetup.RESET;
        TroubleshottingSetup.SETRANGE("No.","Service Item No.");
        PAGE.RUN(PAGE::"Troubleshooting Setup",TroubleshottingSetup);
    end;

    [LineStart(27247)]
    local procedure FromLocationOnAfterValidate();
    begin
        IF "To Location"<>'' THEN
        BEGIN
          IF "To Location"="From Location" THEN
                 ERROR('From and TO Locations Must not be Same');
        END;

        ServHeader.RESET;
        ServHeader.SETRANGE(ServHeader."No.","Document No.");
        IF ServHeader.FINDFIRST THEN
        BEGIN
          IF ServHeader.Description='Created Automatically' THEN
          BEGIN
            IF    ("From Location"<>'H-OFF') AND ("From Location"<>'SERVICE') AND ("From Location"<>'V-R-L')
              AND ("From Location"<>'DAMAGE') THEN
              ERROR('PLEASE CHOOSE THE CORRECT LOCATION');
          END;
        END;
    end;

    [LineStart(27266)]
    local procedure ToLocationOnAfterValidate();
    begin
        IF "From Location"<>'' THEN
        BEGIN
          IF "To Location"="From Location" THEN
                 ERROR('From and TO Locations Must not be Same');
        END;

        ServHeader.RESET;
        ServHeader.SETRANGE(ServHeader."No.","Document No.");
        IF ServHeader.FINDFIRST THEN
        BEGIN
          IF ServHeader.Description='Created Automatically' THEN
          BEGIN
            IF    ("To Location"<>'H-OFF') AND ("To Location"<>'SERVICE') AND ("To Location"<>'V-R-L')
              AND ("To Location"<>'DAMAGE') THEN
              ERROR('PLEASE CHOOSE THE CORRECT LOCATION');
          END;
        END;
    end;

    [LineStart(27285)]
    local procedure AccountOnPush();
    begin
        
        
        
        
        
        
        IF xRec.Account= TRUE THEN
        BEGIN
          IF xRec."Item No."='' THEN
          BEGIN
            MESSAGE('PLEASE SELECT ITEM LOCATION');
            EXIT;
          END;
          IF xRec."From Location"='' THEN
          BEGIN
            MESSAGE('PLEASE ENTER FROM LOCATION');
            EXIT;
          END;
          IF xRec."To Location"='' THEN
          BEGIN
            MESSAGE('PLEASE ENTER TO LOCATION');
            EXIT;
          END;
          IF xRec."Serial No."='' THEN
          BEGIN
            MESSAGE('PLEASE ENTER SERIAL NO LOCATION');
            EXIT;
          END;
        END;
        
        
        Mail_From :='erp@efftronics.com';
        Mail_To := 'vishnupriya@efftronics.com';
        Subject := 'Reg: Service Card Account Change '+Rec."Document No.";
        Body:='';
        SMTP_MAIL.CreateMessage('ERP',Mail_From,Mail_To,Subject,Body,TRUE);
        SMTP_MAIL.AppendBody('<html><head><style> divone{background-color: white; width: 900px; padding: 20px; border-style:solid ; border-color:#666699;  margin: 20px;} </style></head>');
        SMTP_MAIL.AppendBody('<body><div style="border-color:#666699;  margin: 20px; border-width:15px;   border-style:solid; padding: 20px; width: 800px;"><label><font size="6">Service Order Account Tick Mark</font></label>');
        SMTP_MAIL.AppendBody('<hr style=solid; color= #3333CC>');
        /*
        SMTP_MAIL.AppendBody('<h>Dear Manufacturing Dept. ,</h><br><br>');
        SMTP_MAIL.AppendBody('<h><b>Responsible Dept: <font color=red>Manufacturing.</b></font></h><br>');
        SMTP_MAIL.AppendBody('<P> The below are details of RPO without Material Issues and have prod start date < today, </P>');
        */
        SMTP_MAIL.AppendBody('<table border="1" style="border-collapse:collapse; width:100%; font-size:10pt;"><tr><th >User id</th><th >Service Order Number</th><th >service Item Number</th><th >Tickmark</th></tr>');
        //SMTP_MAIL.AppendBody('<th>Schedule Line No.</th><th>Quantity</th><th>Prod Start Date</th></tr>');
        SMTP_MAIL.AppendBody('<tr><td>'+USERID+'</td>');
        SMTP_MAIL.AppendBody('<td>'+Rec."Document No."+'</td>');
        SMTP_MAIL.AppendBody('<td>'+Rec."Service Item No."+'</td>');
        SMTP_MAIL.AppendBody('<td>'+FORMAT(Rec.Account)+'</td></tr></table>');
        SMTP_MAIL.AppendBody('<td>'+FORMAT(Rec."Repair Status Code")+'</td></tr></table>');
        SMTP_MAIL.Send;

    end;

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

