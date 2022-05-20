page 60088 "To Be Released Indents"
{
    // version B2B1.0,POAU,Rev01

    Editable = true;
    PageType = Document;
    SaveValues = true;
    SourceTable = "Indent Header";
    SourceTableView = SORTING(No.) ORDER(Ascending) WHERE(Released Status=CONST(Open));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No.";"No.")
                {
                    AssistEdit = true;
                    Editable = false;

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(Rec) THEN
                        CurrPage.UPDATE;
                    end;
                }
                field(Description;Description)
                {
                }
                field("Contact Person";"Contact Person")
                {
                }
                field("Delivery Location";"Delivery Location")
                {
                }
                field(Department;Department)
                {
                }
                field("Indent Reference";"Indent Reference")
                {
                }
                field("Last Modified Date";"Last Modified Date")
                {
                }
                field("Person Code";"Person Code")
                {
                }
                field("Production Order No.";"Production Order No.")
                {
                    Caption = 'Project Code';

                    trigger OnValidate();
                    begin
                        "Production Order".SETRANGE("Production Order".Status,"Production Order".Status::Released);
                        "Production Order".SETRANGE("Production Order"."No.","Production Order No.");
                        IF "Production Order".FINDFIRST THEN
                          "Production Order Description":="Production Order".Description;
                    end;
                }
                field("Production Order Description";"Production Order Description")
                {
                    Caption = 'Project Name';
                    Editable = false;
                }
                field("Tender No.";"Tender No.")
                {
                }
                field("Production Start date";"Production Start date")
                {

                    trigger OnValidate();
                    begin
                         indentlines.SETRANGE(indentlines."Document No.","No.");
                         IF indentlines.FINDSET THEN
                         REPEAT
                         indentlines."Production Order Description":="Production Order Description";
                         indentlines."Production Start date":="Production Start date";
                         indentlines.MODIFY;
                         UNTIL indentlines.NEXT=0;
                    end;
                }
                field("Sale Order No.";"Sale Order No.")
                {
                }
                field("Sales Order Description";"Sales Order Description")
                {
                }
                field("Creation Date";"Creation Date")
                {
                    Caption = 'Creation Date';
                    Editable = false;
                }
                field("User Id";"User Id")
                {
                    Editable = false;
                }
                field("Released By";"Released By")
                {
                    Editable = false;
                }
                field("Release Date Time";"Release Date Time")
                {
                    Editable = false;
                }
                field("Released Status";"Released Status")
                {
                    Editable = false;
                    Enabled = true;
                }
                field("ICN No.";"ICN No.")
                {
                }
                field("Tener Description";"Tener Description")
                {
                }
                field("Type of Indent";"Type of Indent")
                {
                }
            }
            part(Control1102152030;"Indent Subform")
            {
                SubPageLink = Document No.=FIELD(No.);
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
                separator(Action1102152047)
                {
                }
                action("Consolidate Indents")
                {
                    Caption = 'Consolidate Indents';
                    Image = Totals;

                    trigger OnAction();
                    var
                        IndentHeader : Record "Indent Header";
                        IndentConsolidation : Record "Indent Consolidation";
                        IndentLine : Record "Indent Line";
                        IndentConsolidation1 : Record "Indent Consolidation";
                        ItemVendor : Record "Item Vendor";
                    begin
                        TESTFIELD("No.");
                        TESTFIELD("ICN No.");
                        TESTFIELD("Indent Status","Indent Status"::Indent);
                        IndentConsolidation.DELETEALL;
                        IndentHeader.SETRANGE("ICN No.","ICN No.");
                        IF IndentHeader.FINDSET THEN
                        REPEAT
                          IndentLine.SETRANGE("Document No.",IndentHeader."No.");
                          IndentLine.SETRANGE(Type,IndentLine.Type :: Item);
                          IF IndentLine.FINDSET THEN
                            REPEAT
                              IndentConsolidation.INIT;
                              IndentConsolidation."ICN No." := "ICN No.";
                              IndentConsolidation."Indent No." := IndentLine."Document No.";
                              IndentConsolidation."Item No." := IndentLine."No.";
                              IndentConsolidation.Describtion := IndentLine.Description;
                              IndentConsolidation.Quantity := IndentLine.Quantity;
                              IndentConsolidation1.SETRANGE("Item No.",IndentConsolidation."Item No.");
                              IF IndentConsolidation1.FINDSET THEN BEGIN
                                REPEAT
                                  IndentConsolidation1.Quantity := IndentConsolidation1.Quantity + IndentConsolidation.Quantity;
                                  IndentConsolidation1.MODIFY;
                                UNTIL IndentConsolidation1.NEXT = 0;
                              END ELSE BEGIN
                              ItemVendor.SETRANGE("Item No.",IndentConsolidation."Item No.");
                              IF ItemVendor.FINDSET THEN
                                REPEAT
                                  IndentConsolidation."Vendor No." := ItemVendor."Vendor No.";
                                  IndentConsolidation.INSERT;
                                UNTIL ItemVendor.NEXT = 0;
                              END;
                            UNTIL IndentLine.NEXT = 0;
                        UNTIL IndentHeader.NEXT = 0;

                        IndentConsolidation.RESET;
                        IndentConsolidation.SETRANGE("ICN No.","ICN No.");
                        REPORT.RUN(60005);

                        //MESSAGE('Indents are Converted to Quote');

                        IndentHeader.SETRANGE("ICN No.","ICN No.");
                        IF IndentHeader.FINDSET THEN
                          REPEAT
                            IndentHeader."Indent Status" := IndentHeader."Indent Status" :: Closed;
                            IndentHeader."Released Status" := IndentHeader."Released Status" :: Released;
                            IndentHeader.MODIFY;
                            IndentLine.SETRANGE("Document No.",IndentHeader."No.");
                            IndentLine.SETRANGE(Type,IndentLine.Type :: Item);
                            IF IndentLine.FINDSET THEN
                              REPEAT
                                IndentLine."Indent Status" := IndentLine."Indent Status" :: "6";
                                IndentLine."Release Status" := IndentLine."Release Status" :: Released;
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
                        PurchaseHeader : Record "Purchase Header";
                        PurchaseLine : Record "Purchase Line";
                        PPSetup : Record "Purchases & Payables Setup";
                        NoSeriesMgt : Codeunit NoSeriesManagement;
                        Vendor : Record Vendor;
                        IndentLine : Record "Indent Line";
                        IndentConsolidation : Record "Indent Consolidation";
                        IndentConsolidation1 : Record "Indent Consolidation";
                    begin
                        TESTFIELD("ICN No.");
                        IF NOT CONFIRM(Text000,FALSE) THEN
                          EXIT;
                        PurchaseHeader.INIT;
                        PurchaseHeader."Document Type" := PurchaseHeader."Document Type" :: Quote;
                        PPSetup.GET;
                        PurchaseHeader."No." := NoSeriesMgt.GetNextNo(PPSetup."Quote Nos.",WORKDATE,TRUE);
                        PurchaseHeader."Buy-from Vendor No." :='1000';
                        PurchaseHeader.VALIDATE(PurchaseHeader."Buy-from Vendor No.");
                        PurchaseHeader.INSERT;
                        REPEAT
                            PurchaseLine.INIT;
                            PurchaseLine."Document Type" := PurchaseLine."Document Type" ::Quote;
                            PurchaseLine."Document No." := PurchaseHeader."No.";
                            PurchaseLine."Line No." := PurchaseLine."Line No." + 10000;
                            PurchaseLine."Buy-from Vendor No." := PurchaseHeader."Buy-from Vendor No.";
                            PurchaseLine.Type := PurchaseLine.Type :: Item;
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
                separator(Action1102152052)
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
                separator(Action1102152053)
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
                separator(Action1102152037)
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
                separator(Action1102152056)
                {
                }
                action("Re&lease")
                {
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction();
                    begin
                        TESTFIELD("ICN No.");
                        TESTFIELD("Delivery Location");
                        TESTFIELD(Department);
                        indentlines.SETRANGE(indentlines."Document No.","No.");
                        indentlines.SETFILTER(indentlines.Type,'<>%1',indentlines.Type::Description);
                        IF indentlines.FINDSET THEN
                        REPEAT
                          indentlines.TESTFIELD(indentlines.Quantity);
                          indentlines.TESTFIELD(indentlines."Delivery Location");
                        UNTIL indentlines.NEXT=0;
                        TESTFIELD(Status,FALSE);      // added By santhosh kumar
                        IF (Department='PROD') AND ("Production Order No."<>'EFF08MCH01')  AND ("Production Order No."<>'EFF08GEN01')
                           AND ("Production Order No."<>'EFF08TOL01')  THEN
                        BEGIN
                          IF ("Sale Order No."='') AND ("Tender No."='') THEN
                            ERROR('You Must Enter Tender or Sale Order No.');
                        END;
                        
                        IF TODAY>"Production Start date" THEN
                           ERROR('Release date is less then the Production start date');
                        
                        IF "Person Code"='' THEN
                           ERROR('Enter the Person Code');
                        
                        indent_req_person := "Person Code";
                        
                        user.RESET();
                        user.SETRANGE("User Name",indent_req_person);
                        IF user.FINDFIRST THEN
                        BEGIN
                          user_dept := COPYSTR(user.Dimension,1,2);
                          IF NOT(user_dept IN ['CU','RD'] )
                            THEN BEGIN
                            user_dept := 'STR';
                            END;
                        END ELSE
                        
                        BEGIN
                        user.RESET();
                        user.SETRANGE(EmployeeID,indent_req_person);
                        IF user.FINDFIRST THEN
                        BEGIN
                          user_dept := COPYSTR(user.Dimension,1,2);
                          IF NOT(user_dept IN ['CU','RD'] )
                            THEN
                            user_dept := 'STR';
                        END;
                        END;
                        
                        
                        IF ((USERID='EFFTRONICS\PADMAJA') OR (USERID='EFFTRONICS\ANILKUMAR') OR (USERID='EFFTRONICS\DMADHAVI') OR (USERID='EFFTRONICS\RENUKACH') OR (USERID='EFFTRONICS\TULASI') OR (USERID='SUPER') OR
                          (USERID='EFFTRONICS\KRISHNARAO')    OR (USERID='EFFTRONICS\RRAHUL') OR (USERID='EFFTRONICS\ANANDA') OR (USERID='EFFTRONICS\MARY') OR (USERID='EFFTRONICS\PADMASRI')
                                                OR (USERID='EFFTRONICS\VAMSIKRISHNAS')   OR (USERID='EFFTRONICS\ANVESH')   OR (USERID='EFFTRONICS\VISHNUPRIYA'))
                                                AND                       ((user_dept = 'STR') AND ((Department<>'SYS') AND (Department<>'EAC')))  THEN
                           //(("Delivery Location"='STR') AND ((Department<>'SYS') AND (Department<>'EAC')))  THEN
                        /*BEGIN
                           ReleaseIndent;
                           CurrPage.UPDATE;
                        END;*/
                        // ADDED BY SUJANI BY ANVESH SIR ORDER TO RESTRICT MANUAL INDENTS RELEASE ON 25-NOV-19 // start begin
                        BEGIN
                          IF COPYSTR("No.",1,6) <> 'IND-AU' THEN
                              BEGIN
                                IF Manual_indent_release_rights("No.") THEN
                                      BEGIN
                                      ReleaseIndent;
                                      CurrPage.UPDATE;
                                      END
                                ELSE
                                  ERROR('You are not allowed release manual Indents, Contact Anvesh Sir');
                              END
                          ELSE
                               BEGIN
                                 ReleaseIndent;
                                 CurrPage.UPDATE;
                               END;
                        END;
                        // ADDED BY SUJANI BY ANVESH SIR ORDER TO RESTRICT MANUAL INDENTS RELEASE ON 25-NOV-19 // end begin
                        IF ( (USERID IN['SUPER','EFFTRONICS\ANVESH','EFFTRONICS\PADMASRI','EFFTRONICS\RENUKACH','EFFTRONICS\RRAHUL','EFFTRONICS\VENU','EFFTRONICS\ANILKUMAR','EFFTRONICS\ANANDA',
                          'EFFTRONICS\VISHNUPRIYA','EFFTRONICS\SHARMA','EFFTRONICS\PRAVITEJA','EFFTRONICS\MARY'])) AND
                           ((user_dept='STR') AND ((Department='SYS') OR (Department='EAC')))  THEN
                        BEGIN
                          charline:=10;
                          Mail_Body:='';
                          "tot value":=0;
                          Location.SETRANGE(Location.Code,Department);
                          IF Location.FINDFIRST THEN
                          Mail_Subject:='ERP - '+Location.Name +' Department Indent Released';
                          Mail_Body:='Indent No.            :'+ "No.";
                          Mail_Body+=FORMAT(charline);
                          Mail_Body+='Project Description   :'+ "Production Order Description";
                          Mail_Body+=FORMAT(charline);
                          Mail_Body+='Production Start Date :'+ FORMAT("Production Start date");
                          Mail_Body+=FORMAT(charline);
                          indentlines.SETRANGE(indentlines."Document No.","No.");
                          IF indentlines.FINDSET THEN
                          REPEAT
                            item.SETRANGE(item."No.",indentlines."No.");
                            IF item.FINDFIRST THEN
                              item_value:=item."Avg Unit Cost";
                            "tot value"+=item_value;
                          UNTIL indentlines.NEXT=0;
                          Mail_Subject+=' Indent Value:'+  FORMAT(ROUND("tot value",0.01));
                          Mail_Body+=FORMAT(charline);
                          Mail_Body+=FORMAT(charline);
                        
                          Mail_Body+='***** Auto Mail Generated From ERP *****';
                          "Mail-Id".SETRANGE("Mail-Id"."User Name",USERID);
                          IF "Mail-Id".FINDFIRST THEN
                            IF "Mail-Id".MailID <> '' THEN
                             "from Mail":="Mail-Id".MailID
                            ELSE "from Mail":='erp@efftronics.com';
                           IF (Department='SYS') OR (USERID='EFFTRONICS\ANILKUMAR') THEN
                            "to mail":='anilkumar@efftronics.com,purchase@efftronics.com,tulasi@efftronics.com,mary@efftronics.com'
                           ELSE
                            "to mail":='purchase@efftronics.com,tulasi@efftronics.com';
                         //  "to mail":='anilkumar@efftronics.COM';
                          //  ReleaseIndent;
                          // ADDED BY SUJANI BY ANVESH SIR ORDER TO RESTRICT MANUAL INDENTS RELEASE ON 25-NOV-19 // start begin
                              BEGIN
                                IF COPYSTR("No.",1,6) <> 'IND-AU' THEN
                                    BEGIN
                                      IF Manual_indent_release_rights("No.") THEN
                                            BEGIN
                                            ReleaseIndent;
                                            CurrPage.UPDATE;
                                            END
                                      ELSE
                                        ERROR('You are not allowed release manual Indents, Contact Anvesh Sir');
                                    END
                                ELSE
                                     BEGIN
                                       ReleaseIndent;
                                     END;
                              END;
                        // ADDED BY SUJANI BY ANVESH SIR ORDER TO RESTRICT MANUAL INDENTS RELEASE ON 25-NOV-19 // end begin
                        
                          SMTP_MAIL.CreateMessage('INDENT',"from Mail","to mail",Mail_Subject,Mail_Body,FALSE);
                        
                          SMTP_MAIL.Send;
                        //    mail.NewCDOMessage("from Mail","to mail",Mail_Subject,Mail_Body,'');
                        
                          CurrPage.UPDATE;
                        END;
                        
                        IF USERID IN ['EFFTRONICS\ANILKUMAR','EFFTRONICS\PRASANTHI','EFFTRONICS\TULASI','EFFTRONICS\RRAHUL','EFFTRONICS\MARY', 'EFFTRONICS\RENUKACH','EFFTRONICS\ANANDA',
                          'EFFTRONICS\PADMASRI','EFFTRONICS\ANVESH','EFFTRONICS\VISHNUPRIYA'] THEN
                        IF user_dept='CU' THEN
                        //IF "Delivery Location"='CS STR' THEN
                        BEGIN
                          IF ((FORMAT("Type of Indent")='SALE ORDER') OR (FORMAT("Type of Indent")='AMC ORDER')) AND
                             ("Creation Date">040110D) THEN
                             TESTFIELD("Sale Order No.");
                        
                             charline:=10;
                             Mail_Body:='';
                            "tot value":=0;
                            Mail_Subject:='ERP - Prod Indent Released';
                            Mail_Body:='Indent No.            :'+ "No.";
                            Mail_Body+=FORMAT(charline);
                            Mail_Body+='Project Description   :'+ "Production Order Description";
                            Mail_Body+=FORMAT(charline);
                            Mail_Body+='Production Start Date :'+ FORMAT("Production Start date");
                            Mail_Body+=FORMAT(charline);
                            indentlines.SETRANGE(indentlines."Document No.","No.");
                            IF indentlines.FINDSET THEN
                            REPEAT
                            item.SETRANGE(item."No.",indentlines."No.");
                            IF item.FINDFIRST THEN
                            item_value:=item."Avg Unit Cost";
                            "tot value"+=item_value;
                            UNTIL indentlines.NEXT=0;
                            Mail_Subject+=' Indent Value:'+ FORMAT(ROUND("tot value",0.01));
                            Mail_Body+=FORMAT(charline);
                            Mail_Body+=FORMAT(charline);
                            Mail_Body+='***** Auto Mail Generated From ERP *****';
                            "Mail-Id".SETRANGE("Mail-Id"."User Name",USERID);
                            IF "Mail-Id".FINDFIRST THEN
                              IF "Mail-Id".MailID <> '' THEN
                                "from Mail":="Mail-Id".MailID
                              ELSE "from Mail":='erp@efftronics.com';
                            "to mail":='prasanthi@efftronics.com,purchase@efftronics.com,erp@efftronics.com,mary@efftronics.com,';
                            "to mail"+='tulasi@efftronics.com';
                            SMTP_MAIL.CreateMessage('CS INDENT',"from Mail","to mail",Mail_Subject,Mail_Body,FALSE);
                           // ReleaseIndent;
                        
                              // ADDED BY SUJANI BY ANVESH SIR ORDER TO RESTRICT MANUAL INDENTS RELEASE ON 25-NOV-19 // start begin
                              BEGIN
                                IF COPYSTR("No.",1,6) <> 'IND-AU' THEN
                                    BEGIN
                                      IF Manual_indent_release_rights("No.") THEN
                                            BEGIN
                                            ReleaseIndent;
                                            CurrPage.UPDATE;
                                            END
                                      ELSE
                                        ERROR('You are not allowed release manual Indents, Contact Anvesh Sir');
                                    END
                                ELSE
                                     BEGIN
                                       ReleaseIndent;
                                     END;
                              END;
                              // ADDED BY SUJANI BY ANVESH SIR ORDER TO RESTRICT MANUAL INDENTS RELEASE ON 25-NOV-19 // end begin
                            SMTP_MAIL.Send;
                        
                            //mail.NewCDOMessage("from Mail","to mail",Mail_Subject,Mail_Body,'');
                        
                            CurrPage.UPDATE;
                        END;
                        
                        
                        IF USERID IN ['EFFTRONICS\UBEDULLA','EFFTRONICS\SOMU','EFFTRONICS\BALA','EFFTRONICS\RENUKACH','EFFTRONICS\SBSHANKAR','EFFTRONICS\ANILKUMAR','EFFTRONICS\PADMASRI',
                                      'EFFTRONICS\DIVYALAKSHMI','EFFTRONICS\MARY','EFFTRONICS\ANVESH','EFFTRONICS\RATNA','EFFTRONICS\DMADHAVI','EFFTRONICS\TULASI','EFFTRONICS\ANANDA',
                                      'EFFTRONICS\ANVESH','EFFTRONICS\VISHNUPRIYA','EFFTRONICS\RAMASAMY','EFFTRONICS\RRAHUL'] THEN   BEGIN
                        
                        
                        IF user_dept='RD' THEN
                        //IF "Delivery Location"='R&D STR' THEN
                        BEGIN
                         /* IF ("Material Request No."='') AND (USERID='EFFTRONICS\MARY') THEN
                             ERROR('INDENT MUST BE CONVERTED FROM MATERIAL REQUEST');*/
                        
                           charline:=10;
                           Mail_Body:='';
                          "tot value":=0;
                          Mail_Subject:='ERP - R&D Indent Released';
                         // MESSAGE(USERID);
                            "Mail-Id".SETRANGE("Mail-Id"."User Name",USERID);
                            IF "Mail-Id".FINDFIRST THEN  BEGIN
                              IF "Mail-Id".MailID <> '' THEN
                                "from Mail":="Mail-Id".MailID
                              ELSE "from Mail":='erp@efftronics.com';
                            END;
                            "to mail":='';
                        //    MESSAGE("from Mail");
                            "Mail-Id".SETRANGE("Mail-Id"."User Name","Person Code");
                            IF "Mail-Id".FINDFIRST THEN BEGIN
                              IF "Mail-Id".MailID <> '' THEN
                                "to mail":="Mail-Id".MailID+',';
                            END;
                           "to mail"+='anilkumar@efftronics.com,mary@efftronics.com,layouts1@efftronics.com';
                             charline:=10;
                             Mail_Body+='Indent No.  : '+"No." ;
                             Mail_Body+=FORMAT(charline);
                             Mail_Body+='Project Name: '+"Production Order Description";
                             Mail_Body+=FORMAT(charline);
                             Mail_Body+=FORMAT(charline);
                             Mail_Body+='Item Description';
                             FOR i:=1 TO 34 DO
                             Mail_Body+=' ';
                             Mail_Body+='Quantity';
                             Mail_Body+=FORMAT(charline);
                            indentlines.SETRANGE(indentlines."Document No.","No.");
                            IF indentlines.FINDSET THEN
                            REPEAT
                             IF STRLEN(Mail_Body)<800 THEN
                             BEGIN
                               Mail_Body+=indentlines.Description;
                               space:=50-STRLEN(indentlines.Description);
                               FOR i:=1 TO space DO
                                 Mail_Body+=' ';
                               Mail_Body+=FORMAT(indentlines.Quantity);
                               Mail_Body+=FORMAT(charline);
                             END;
                            UNTIL indentlines.NEXT=0;
                            Mail_Body+=FORMAT(charline);
                            Mail_Body+='***** Auto Mail Generated From ERP *****';
                             // ReleaseIndent;
                                   // ADDED BY SUJANI BY ANVESH SIR ORDER TO RESTRICT MANUAL INDENTS RELEASE ON 25-NOV-19 // start begin
                                        BEGIN
                                          IF COPYSTR("No.",1,6) <> 'IND-AU' THEN
                                              BEGIN
                                                IF Manual_indent_release_rights("No.") THEN
                                                      BEGIN
                                                      ReleaseIndent;
                                                      CurrPage.UPDATE;
                                                      END
                                                ELSE
                                                  ERROR('You are not allowed release manual Indents, Contact Anvesh Sir');
                                              END
                                          ELSE
                                               BEGIN
                                                 ReleaseIndent;
                                               END;
                                        END;
                              // ADDED BY SUJANI BY ANVESH SIR ORDER TO RESTRICT MANUAL INDENTS RELEASE ON 25-NOV-19 // end begin
                            SMTP_MAIL.CreateMessage('R&D INDENT',"from Mail","to mail",Mail_Subject,Mail_Body,FALSE);
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
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        //indentlines.SETRANGE(indentlines."Document No.","No.");
                        //indentlines.SETRANGE(indentlines."Indent Status",indentlines."Indent Status"::Order);
                        //IF NOT indentlines.FINDFIRST THEN
                        //BEGIN
                        TESTFIELD(Status,FALSE);
                         // ADDED BY SUJANI BY ANVESH SIR ORDER TO RESTRICT MANUAL INDENTS RELEASE ON 25-NOV-19 // start begin
                                        BEGIN
                                          IF COPYSTR("No.",1,6) <> 'IND-AU' THEN
                                              BEGIN
                                                IF Manual_indent_release_rights("No.") THEN
                                                      BEGIN
                                                       ReopenIndent;
                                                       CurrPage.UPDATE;
                                                      END
                                                ELSE
                                                  ERROR('You are not allowed reopen manual Indents, Contact Anvesh Sir');
                                              END
                                          ELSE
                                               BEGIN
                                                 ReleaseIndent;
                                               END;
                                        END;
                              // ADDED BY SUJANI BY ANVESH SIR ORDER TO RESTRICT MANUAL INDENTS RELEASE ON 25-NOV-19 // end begin
                         /* ReopenIndent;
                          CurrPage.UPDATE;*/
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
        }
    }

    trigger OnOpenPage();
    begin
         IF USERID='EFFTRONICS\KRISHNARAO' THEN
           SETFILTER(Department,'%1|%2','GAD','HKE');
    end;

    var
        Text000 : Label 'Do U want Convert to Quote?';
        projectcode : Record "Reason Code";
        "Mail-Id" : Record User;
        "from Mail" : Text[1000];
        "to mail" : Text[1000];
        Mail_Subject : Text[1000];
        Mail_Body : Text[1000];
        mail : Codeunit Mail;
        indentlines : Record "Indent Line";
        charline : Char;
        space : Integer;
        i : Integer;
        item : Record Item;
        item_value : Decimal;
        "tot value" : Decimal;
        user : Record User;
        Location : Record Location;
        "Production Order" : Record "Production Order";
        SMTP_MAIL : Codeunit "SMTP Mail";
        indent_req_person : Text[500];
        user_dept : Text[500];
        IndentHeader : Record "Indent Header";

    [LineStart(10677)]
    procedure Manual_indent_release_rights(IndentNo : Code[20]) Authorized : Boolean;
    begin
        IF USERID IN ['EFFTRONICS\ANVESH','EFFTRONICS\ANILKUMAR','EFFTRONICS\VISHNUPRIYA'] THEN
          EXIT(TRUE)
        ELSE
          EXIT(FALSE);
    end;
}

