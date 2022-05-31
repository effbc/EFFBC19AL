page 60173 "To Be Released Indents List"
{
    // version Rev01

    CardPageID = "To Be Released Indents";
    Editable = false;
    PageType = List;
    SourceTable = "Indent Header";
    SourceTableView = SORTING(No.) ORDER(Ascending) WHERE(Released Status=CONST(Open));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                }
                field(Description; Description)
                {
                }
                field("Document Date"; "Document Date")
                {
                }
                field(Make; Make)
                {
                }
                field("Due Date"; "Due Date")
                {
                }
                field("Delivery Location"; "Delivery Location")
                {
                }
                field(Equipment; Equipment)
                {
                }
                field("Drawing No."; "Drawing No.")
                {
                }
                field("Person Code"; "Person Code")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Indent")
            {
                Caption = '&Indent';
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = Comment;
                    RunObject = Page "Purch. Comment Sheet";
                }
                separator(Action1102152027)
                {
                }
                action("Consolidate Indents")
                {
                    Caption = 'Consolidate Indents';
                    Image = Totals;

                    trigger OnAction();
                    var
                        IndentHeader: Record "Indent Header";
                        IndentConsolidation: Record "Indent Consolidation";
                        IndentLine: Record "Indent Line";
                        IndentConsolidation1: Record "Indent Consolidation";
                        ItemVendor: Record "Item Vendor";
                    begin
                        TESTFIELD("No.");
                        TESTFIELD("ICN No.");
                        TESTFIELD("Indent Status", "Indent Status"::Indent);
                        IndentConsolidation.DELETEALL;
                        IndentHeader.SETRANGE("ICN No.", "ICN No.");
                        IF IndentHeader.FINDSET THEN
                            REPEAT
                                IndentLine.SETRANGE("Document No.", IndentHeader."No.");
                                IndentLine.SETRANGE(Type, IndentLine.Type::Item);
                                IF IndentLine.FINDSET THEN
                                    REPEAT
                                        IndentConsolidation.INIT;
                                        IndentConsolidation."ICN No." := "ICN No.";
                                        IndentConsolidation."Indent No." := IndentLine."Document No.";
                                        IndentConsolidation."Item No." := IndentLine."No.";
                                        IndentConsolidation.Describtion := IndentLine.Description;
                                        IndentConsolidation.Quantity := IndentLine.Quantity;
                                        IndentConsolidation1.SETRANGE("Item No.", IndentConsolidation."Item No.");
                                        IF IndentConsolidation1.FINDSET THEN BEGIN
                                            REPEAT
                                                IndentConsolidation1.Quantity := IndentConsolidation1.Quantity + IndentConsolidation.Quantity;
                                                IndentConsolidation1.MODIFY;
                                            UNTIL IndentConsolidation1.NEXT = 0;
                                        END ELSE BEGIN
                                            ItemVendor.SETRANGE("Item No.", IndentConsolidation."Item No.");
                                            IF ItemVendor.FINDSET THEN
                                                REPEAT
                                                    IndentConsolidation."Vendor No." := ItemVendor."Vendor No.";
                                                    IndentConsolidation.INSERT;
                                                UNTIL ItemVendor.NEXT = 0;
                                        END;
                                    UNTIL IndentLine.NEXT = 0;
                            UNTIL IndentHeader.NEXT = 0;

                        IndentConsolidation.RESET;
                        IndentConsolidation.SETRANGE("ICN No.", "ICN No.");
                        REPORT.RUN(60005);

                        //MESSAGE('Indents are Converted to Quote');

                        IndentHeader.SETRANGE("ICN No.", "ICN No.");
                        IF IndentHeader.FINDSET THEN
                            REPEAT
                                IndentHeader."Indent Status" := IndentHeader."Indent Status"::Closed;
                                IndentHeader."Released Status" := IndentHeader."Released Status"::Released;
                                IndentHeader.MODIFY;
                                IndentLine.SETRANGE("Document No.", IndentHeader."No.");
                                IndentLine.SETRANGE(Type, IndentLine.Type::Item);
                                IF IndentLine.FINDSET THEN
                                    REPEAT
                                        IndentLine."Indent Status" := IndentLine."Indent Status"::"6";
                                        IndentLine."Release Status" := IndentLine."Release Status"::Released;
                                        IndentLine.MODIFY;
                                    UNTIL IndentLine.NEXT = 0;
                            UNTIL IndentHeader.NEXT = 0;
                    end;
                }
                action("Make to Quote")
                {
                    Caption = 'Make to Quote';
                    Image = MakeAgreement;
                    Visible = false;

                    trigger OnAction();
                    var
                        PurchaseHeader: Record "Purchase Header";
                        PurchaseLine: Record "Purchase Line";
                        PPSetup: Record "Purchases & Payables Setup";
                        NoSeriesMgt: Codeunit NoSeriesManagement;
                        Vendor: Record Vendor;
                        IndentLine: Record "Indent Line";
                        IndentConsolidation: Record "Indent Consolidation";
                        IndentConsolidation1: Record "Indent Consolidation";
                    begin
                        TESTFIELD("ICN No.");
                        IF NOT CONFIRM(Text000, FALSE) THEN
                            EXIT;
                        PurchaseHeader.INIT;
                        PurchaseHeader."Document Type" := PurchaseHeader."Document Type"::Quote;
                        PPSetup.GET;
                        PurchaseHeader."No." := NoSeriesMgt.GetNextNo(PPSetup."Quote Nos.", WORKDATE, TRUE);
                        PurchaseHeader."Buy-from Vendor No." := '1000';
                        PurchaseHeader.VALIDATE(PurchaseHeader."Buy-from Vendor No.");
                        PurchaseHeader.INSERT;
                        REPEAT
                            PurchaseLine.INIT;
                            PurchaseLine."Document Type" := PurchaseLine."Document Type"::Quote;
                            PurchaseLine."Document No." := PurchaseHeader."No.";
                            PurchaseLine."Line No." := PurchaseLine."Line No." + 10000;
                            PurchaseLine."Buy-from Vendor No." := PurchaseHeader."Buy-from Vendor No.";
                            PurchaseLine.Type := PurchaseLine.Type::Item;
                            PurchaseLine."No." := IndentConsolidation."Item No.";
                            IF PurchaseLine."No." <> '' THEN BEGIN
                                PurchaseLine.VALIDATE(PurchaseLine."No.");
                                PurchaseLine.Quantity := IndentConsolidation.Quantity;
                                PurchaseLine.VALIDATE(PurchaseLine.Quantity);
                                PurchaseLine.INSERT;
                            END;
                        UNTIL IndentConsolidation.NEXT = 0;
                    end;
                }
            }
        }
        area(processing)
        {
            Caption = '<Action1900000004>';
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Copy Indent")
                {
                    Caption = 'Copy Indent';
                    Image = CopyBudget;

                    trigger OnAction();
                    begin
                        CopyIndent;
                    end;
                }
                separator(Action1102152021)
                {
                }
                action("Copy &Prod. Order Components")
                {
                    Caption = 'Copy &Prod. Order Components';
                    Image = CopyDocument;

                    trigger OnAction();
                    begin
                        CopyProdComponents;
                    end;
                }
                separator(Action1102152019)
                {
                }
                action("Copy &Sale Order Lines")
                {
                    Caption = 'Copy &Sale Order Lines';
                    Image = Copy;
                    Visible = false;

                    trigger OnAction();
                    begin
                        CopySaleOrderLines;
                    end;
                }
                separator(Action1102152017)
                {
                }
                action("Copy &BOM Components")
                {
                    Caption = 'Copy &BOM Components';
                    Image = CopyBOM;

                    trigger OnAction();
                    begin
                        TESTFIELD("Production BOM No.");
                        CopyBomComponents;
                    end;
                }
                separator(Action1102152015)
                {
                }
                action("Re&lease")
                {
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction();
                    begin
                        TESTFIELD("ICN No.");
                        TESTFIELD("Delivery Location");
                        TESTFIELD(Department);
                        indentlines.SETRANGE(indentlines."Document No.", "No.");
                        indentlines.SETFILTER(indentlines.Type, '<>%1', indentlines.Type::Description);
                        IF indentlines.FINDSET THEN
                            REPEAT
                                indentlines.TESTFIELD(indentlines.Quantity);
                                indentlines.TESTFIELD(indentlines."Delivery Location");
                            UNTIL indentlines.NEXT = 0;
                        TESTFIELD(Status, FALSE);      // added By santhosh kumar
                        IF (Department = 'PROD') AND ("Production Order No." <> 'EFF08MCH01') AND ("Production Order No." <> 'EFF08GEN01')
                           AND ("Production Order No." <> 'EFF08TOL01') THEN BEGIN
                            IF ("Sale Order No." = '') AND ("Tender No." = '') THEN
                                ERROR('You Must Enter Tender or Sale Order No.');
                        END;

                        IF TODAY > "Production Start date" THEN
                            ERROR('Release date is less then the Production start date');

                        IF "Person Code" = '' THEN
                            ERROR('Enter the Person Code');

                        IF ((USERID = '04DI002') OR (USERID = '86SR001') OR (USERID = '93FD001') OR (USERID = 'SUPER') OR (USERID = '05GA003')
                                               OR (USERID = '10RD010')) AND
                           (("Delivery Location" = 'STR') AND ((Department <> 'SYS') AND (Department <> 'EAC'))) THEN BEGIN
                            ReleaseIndent;
                            CurrPage.UPDATE;
                        END;

                        IF ((USERID = 'SUPER') OR (USERID = '01RD020') OR (USERID = '10RD010')) AND
                           (("Delivery Location" = 'STR') AND ((Department = 'SYS') OR (Department = 'EAC'))) THEN BEGIN
                            charline := 10;
                            Mail_Body := '';
                            "tot value" := 0;
                            Location.SETRANGE(Location.Code, Department);
                            IF Location.FINDFIRST THEN
                                Mail_Subject := 'ERP - ' + Location.Name + ' Department Indent Released';
                            Mail_Body := 'Indent No.            :' + "No.";
                            Mail_Body += FORMAT(charline);
                            Mail_Body += 'Project Description   :' + "Production Order Description";
                            Mail_Body += FORMAT(charline);
                            Mail_Body += 'Production Start Date :' + FORMAT("Production Start date");
                            Mail_Body += FORMAT(charline);
                            indentlines.SETRANGE(indentlines."Document No.", "No.");
                            IF indentlines.FINDSET THEN
                                REPEAT
                                    item.SETRANGE(item."No.", indentlines."No.");
                                    IF item.FINDFIRST THEN
                                        item_value := item."Avg Unit Cost";
                                    "tot value" += item_value;
                                UNTIL indentlines.NEXT = 0;
                            Mail_Subject += ' Indent Value:' + FORMAT(ROUND("tot value", 0.01));
                            Mail_Body += FORMAT(charline);
                            Mail_Body += FORMAT(charline);

                            Mail_Body += '***** Auto Mail Generated From ERP *****';
                            //Rev01 Start
                            //Code Commented
                            /*
                            "Mail-Id".SETRANGE("Mail-Id"."User Security ID",USERID);
                            */
                            "Mail-Id".SETRANGE("Mail-Id"."User Name", USERID);
                            //Rev01 End
                            IF "Mail-Id".FINDFIRST THEN
                                "from Mail" := "Mail-Id".MailID;
                            "to mail" := 'kbreddy@efftronics.com,purchase@efftronics.com,dmadhavi@efftronics.com';
                            //  "to mail":='anilkumar@efftronics.COM';
                            ReleaseIndent;
                            SMTP_MAIL.CreateMessage('INDENT', "from Mail", "to mail", Mail_Subject, Mail_Body, FALSE);

                            SMTP_MAIL.Send;
                            //    mail.NewCDOMessage("from Mail","to mail",Mail_Subject,Mail_Body,'');

                            CurrPage.UPDATE;
                        END;

                        IF (USERID = '99PR003') OR (USERID = '99ST005') OR (USERID = '89HW001') OR (USERID = '10RD010') THEN
                            IF "Delivery Location" = 'CS STR' THEN BEGIN
                                IF ((FORMAT("Type of Indent") = 'SALE ORDER') OR (FORMAT("Type of Indent") = 'AMC ORDER')) AND
                                   ("Creation Date" > 040110D) THEN
                                    TESTFIELD("Sale Order No.");

                                charline := 10;
                                Mail_Body := '';
                                "tot value" := 0;
                                Mail_Subject := 'ERP - Prod Indent Released';
                                Mail_Body := 'Indent No.            :' + "No.";
                                Mail_Body += FORMAT(charline);
                                Mail_Body += 'Project Description   :' + "Production Order Description";
                                Mail_Body += FORMAT(charline);
                                Mail_Body += 'Production Start Date :' + FORMAT("Production Start date");
                                Mail_Body += FORMAT(charline);
                                indentlines.SETRANGE(indentlines."Document No.", "No.");
                                IF indentlines.FINDSET THEN
                                    REPEAT
                                        item.SETRANGE(item."No.", indentlines."No.");
                                        IF item.FINDFIRST THEN
                                            item_value := item."Avg Unit Cost";
                                        "tot value" += item_value;
                                    UNTIL indentlines.NEXT = 0;
                                Mail_Subject += ' Indent Value:' + FORMAT(ROUND("tot value", 0.01));
                                Mail_Body += FORMAT(charline);
                                Mail_Body += FORMAT(charline);
                                Mail_Body += '***** Auto Mail Generated From ERP *****';
                                //Rev01 Start
                                //Code Commented
                                /*
                                "Mail-Id".SETRANGE("Mail-Id"."User Security ID",USERID);
                                */
                                "Mail-Id".SETRANGE("Mail-Id"."User Name", USERID);
                                //Rev01 End
                                IF "Mail-Id".FINDFIRST THEN
                                    "from Mail" := "Mail-Id".MailID;
                                "to mail" := 'prasanthi@efftronics.com,purchase@efftronics.com,ramadevi@efftronics.com,erp@efftronics.com,';
                                "to mail" += 'padmasri@efftronics.com';
                                SMTP_MAIL.CreateMessage('CS INDENT', "from Mail", "to mail", Mail_Subject, Mail_Body, FALSE);
                                SMTP_MAIL.Send;

                                //mail.NewCDOMessage("from Mail","to mail",Mail_Subject,Mail_Body,'');
                                ReleaseIndent;
                                CurrPage.UPDATE;
                            END;


                        IF (USERID = '04AN006') OR (USERID = '04AN017') OR (USERID = '05AN006') OR (USERID = '20FT004') OR (USERID = '01TD001') OR (USERID = '02DV001')
                             OR (USERID = 'SUPER') OR (USERID = '10RD010') OR (USERID = '06TE017') OR (USERID = '06TE028') OR (USERID = '05PD012')
                             OR (USERID = '99P2005') OR (USERID = '01QC001') THEN BEGIN
                            IF "Delivery Location" = 'R&D STR' THEN BEGIN
                                /* IF ("Material Request No."='') AND (USERID='99P2005') THEN
                                    ERROR('INDENT MUST BE CONVERTED FROM MATERIAL REQUEST');*/

                                charline := 10;
                                Mail_Body := '';
                                "tot value" := 0;
                                Mail_Subject := 'ERP - R&D Indent Released';
                                // MESSAGE(USERID);
                                //Rev01 Start
                                //Code Commented
                                /*
                                "Mail-Id".SETRANGE("Mail-Id"."User Security ID",USERID);
                                */
                                "Mail-Id".SETRANGE("Mail-Id"."User Name", USERID);
                                //Rev01 End
                                IF "Mail-Id".FINDFIRST THEN BEGIN
                                    "from Mail" := "Mail-Id".MailID;
                                END;
                                //    MESSAGE("from Mail");
                                //Rev01 Start
                                //Code Commented
                                /*
                                "Mail-Id".SETRANGE("Mail-Id"."User Security ID","Person Code");
                                */
                                "Mail-Id".SETRANGE("Mail-Id"."User Name", "Person Code");
                                //Rev01 End
                                "Mail-Id".SETRANGE("Mail-Id"."User Security ID", "Person Code");
                                IF "Mail-Id".FINDFIRST THEN BEGIN
                                    "to mail" := "Mail-Id".MailID + ',';
                                END;
                                "to mail" += 'anilkumar@efftronics.com,mary@efftronics.com,layouts1@efftronics.com';
                                charline := 10;
                                Mail_Body += 'Indent No.  : ' + "No.";
                                Mail_Body += FORMAT(charline);
                                Mail_Body += 'Project Name: ' + "Production Order Description";
                                Mail_Body += FORMAT(charline);
                                Mail_Body += FORMAT(charline);
                                Mail_Body += 'Item Description';
                                FOR i := 1 TO 34 DO
                                    Mail_Body += ' ';
                                Mail_Body += 'Quantity';
                                Mail_Body += FORMAT(charline);
                                indentlines.SETRANGE(indentlines."Document No.", "No.");
                                IF indentlines.FINDSET THEN
                                    REPEAT
                                        IF STRLEN(Mail_Body) < 800 THEN BEGIN
                                            Mail_Body += indentlines.Description;
                                            space := 50 - STRLEN(indentlines.Description);
                                            FOR i := 1 TO space DO
                                                Mail_Body += ' ';
                                            Mail_Body += FORMAT(indentlines.Quantity);
                                            Mail_Body += FORMAT(charline);
                                        END;
                                    UNTIL indentlines.NEXT = 0;
                                Mail_Body += FORMAT(charline);
                                Mail_Body += '***** Auto Mail Generated From ERP *****';
                                ReleaseIndent;
                                SMTP_MAIL.CreateMessage('R&D INDENT', "from Mail", "to mail", Mail_Subject, Mail_Body, FALSE);
                                SMTP_MAIL.Send;
                                CurrPage.UPDATE;
                                //mail.NewCDOMessage("from Mail","to mail",Mail_Subject,Mail_Body,'');


                            END;
                        END;

                    end;
                }
                action("Re&open")
                {
                    Caption = 'Re&open';
                    Image = ReOpen;

                    trigger OnAction();
                    begin
                        //indentlines.SETRANGE(indentlines."Document No.","No.");
                        //indentlines.SETRANGE(indentlines."Indent Status",indentlines."Indent Status"::Order);
                        //IF NOT indentlines.FINDFIRST THEN
                        //BEGIN
                        ReopenIndent;
                        CurrPage.UPDATE;
                        //END ELSE
                        //  ERROR('SOME OF THE ITEMS ARE ALL READY ORDERED , SO YOU DONT REOPEN THE ORDER');
                    end;
                }
                action("Ca&ncel")
                {
                    Caption = 'Ca&ncel';
                    Image = Cancel;

                    trigger OnAction();
                    begin
                        CancelIndent;
                        CurrPage.UPDATE;
                    end;
                }
                action("Clo&se")
                {
                    Caption = 'Clo&se';
                    Image = Close;

                    trigger OnAction();
                    begin
                        CloseIndent;
                        CurrPage.UPDATE;
                    end;
                }
            }
            action(Comment)
            {
                Caption = 'Comment';
                Image = ViewComments;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Purch. Comment Sheet";
                ToolTip = 'Comment';
            }
            action("<CS Stock Indents>")
            {
                Caption = 'CS Stock Indents';

                trigger OnAction();
                var
                    Items: Record Item;
                    IH: Record "Indent Header";
                    IL: Record "Indent Line";
                    PH: Record "Purchase Header";
                    PL: Record "Purchase Line";
                    IndentQuantity: Integer;
                    PurchaseQuantity: Integer;
                    StockStatus: Integer;
                    User: Record User;
                    NoSeriesMgt: Codeunit NoSeriesManagement;
                    Indent_No: Code[20];
                    UserName: Code[100];
                    Line_No: Integer;
                    "No. Series": Record "No. Series";
                    "No. Series Line": Record "No. Series Line";
                    Qty: Integer;
                    IL1: Record "Indent Line";
                    OrderQty: Integer;
                    NO: Text;
                    ProdOrder: Record "Production Order";
                    WINDOW: Dialog;
                    T1: Label '#1##################  FOR Minimum Stock';
                begin
                    // Added by Vijaya on 02-Mar-17
                    NoSeriesMgt.InitSeries('P-INDENT', 'P-INDENT', TODAY, Indent_No, IH."No. Series");
                    User.RESET;
                    User.SETRANGE(User."User Name", USERID);
                    IF User.FINDFIRST THEN
                        UserName := User."Full Name";
                    IndentQuantity := 0;
                    WINDOW.OPEN(T1);
                    IH.RESET;
                    IH.INIT;
                    IH."No." := Indent_No;
                    IH.Description := 'Created for CS Minimum Stock';
                    IH."Contact Person" := UserName;
                    IH."Delivery Location" := 'CS STR';
                    IH.Department := 'SITE';
                    IH."Indent Reference" := UserName;
                    IH."Person Code" := USERID;
                    IH."User Id" := USERID;
                    IH."ICN No." := ICNNO(TODAY);
                    IH."Creation Date" := TODAY;
                    IH."Production Order No." := 'EFF12CST01';
                    IH."Production Order Description" := 'ALL DEPARTMENTS GENERALPURPOSE';
                    IH.VALIDATE(IH."Production Order No.", 'EFF12CST01');
                    IH.INSERT;
                    Line_No := 0;

                    Qty := 0;
                    Items.RESET;
                    Items.SETFILTER(Items."Safety Stock Qty (CS)", '> %1', 1);
                    Items.SETRANGE(Items.Blocked, FALSE);
                    IF Items.FINDSET THEN
                        REPEAT
                            Items.CALCFIELDS(Items."Stock at CS Stores");
                            IF Items."Stock at CS Stores" < Items."Safety Stock Qty (CS)" THEN BEGIN
                                PurchaseQuantity := 0;
                                PL.RESET;
                                PL.SETRANGE(PL."No.", Items."No.");
                                PL.SETFILTER(PL."Qty. to Receive", '> %1', 0);
                                PL.SETRANGE(PL."Location Code", 'CS STR');
                                IF PL.FINDFIRST THEN
                                    REPEAT
                                        PurchaseQuantity += PL."Qty. to Receive";
                                    UNTIL PL.NEXT = 0;
                                IF (Items."Stock at CS Stores" + PurchaseQuantity) < Items."Safety Stock Qty (CS)" THEN BEGIN
                                    IndentQuantity := 0;
                                    IL1.RESET;
                                    IL1.SETRANGE(IL1."No.", Items."No.");
                                    IL1.SETRANGE(IL1."Indent Status", 0);
                                    IL1.SETRANGE(IL1."Delivery Location", 'CS STR');
                                    IF IL1.FINDSET THEN
                                        REPEAT
                                            IndentQuantity += IL1."Quantity To Be Ordered";
                                        UNTIL IL1.NEXT = 0;
                                    IF (Items."Stock at CS Stores" + PurchaseQuantity + IndentQuantity) < Items."Safety Stock Qty (CS)" - 1 THEN BEGIN
                                        WINDOW.UPDATE(1, Items."No.");
                                        IL.RESET;
                                        IL.INIT;
                                        IL."Document No." := Indent_No;
                                        Line_No += 10000;
                                        IL."Line No." := Line_No;
                                        NO := Items."No.";
                                        IL."No." := NO;
                                        IL.VALIDATE(IL."No.", NO);
                                        IL."Delivery Location" := 'CS STR';
                                        IL."ICN No." := ICNNO(TODAY);
                                        IL.Description := Items.Description;
                                        OrderQty := ROUND(Items."Safety Stock Qty (CS)" - (Items."Stock at CS Stores" + PurchaseQuantity + IndentQuantity), 1);
                                        IL.Quantity := OrderQty;
                                        IL."Quantity To Be Ordered" := OrderQty;
                                        IL.INSERT;
                                        Qty += 1;
                                    END;
                                END;
                            END;
                        UNTIL Items.NEXT = 0;
                    WINDOW.CLOSE;
                    CurrPage.UPDATE(FALSE);
                    //end by Vijaya
                end;
            }
        }
    }

    var
        projectcode: Record "Reason Code";
        "Mail-Id": Record User;
        "from Mail": Text[1000];
        "to mail": Text[1000];
        Mail_Subject: Text[1000];
        Mail_Body: Text[1000];
        mail: Codeunit Mail;
        indentlines: Record "Indent Line";
        charline: Char;
        space: Integer;
        i: Integer;
        item: Record Item;
        item_value: Decimal;
        "tot value": Decimal;
        user: Record User;
        Location: Record Location;
        "Production Order": Record "Production Order";
        SMTP_MAIL: Codeunit "SMTP Mail";
        Text000: Label 'Do U want Convert to Quote?';

    [LineStart(13800)]
    procedure ICNNO(DT: Date) ICN: Code[10];
    var
        Dat: Code[10];
        Mon: Code[10];
        Yer: Code[10];
    begin
        IF DATE2DMY(DT, 1) < 10 THEN
            Dat := '0' + FORMAT(DATE2DMY(DT, 1))
        ELSE
            Dat := FORMAT(DATE2DMY(DT, 1));

        IF DATE2DMY(DT, 2) < 10 THEN
            Mon := '0' + FORMAT(DATE2DMY(DT, 2))
        ELSE
            Mon := FORMAT(DATE2DMY(DT, 2));

        //IF DATE2DMY(DT,2) < 10 THEN
        Yer := COPYSTR(FORMAT(DATE2DMY(DT, 3)), 3, 2);
        ICN := Dat + Mon + Yer;
        EXIT(ICN);
    end;
}

