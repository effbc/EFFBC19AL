page 50006 "Purchase To Be Received Items"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    PageType = List;
    SaveValues = false;
    SourceTable = "Purchase Line";
    SourceTableView = SORTING("No.", "Buy-from Vendor No.") ORDER(Ascending) WHERE("Qty. to Receive"=FILTER(>0),"Document Type"=CONST(Order));

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                //The GridLayout property is only supported on controls of type Grid
                //GridLayout = Columns;
                ShowCaption = false;
                field("No.";"No.")
                {
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = coloring;
                }
                field(Description;Description)
                {
                    Editable = false;
                    Style = Attention;
                    StyleExpr = coloring1;
                }
                field("Safety Lead Time";"Safety Lead Time")
                {
                    Editable = false;
                }
                field("Shortage Qty";"Shortage Qty")
                {
                    Caption = 'Material Requets Pending Qty';
                }
                field("Qty on Prod order Components";"Qty on Prod order Components")
                {
                }
                field("Vendor Name";"Vendor Name")
                {
                    Editable = false;
                }
                field(contact;contact)
                {
                    Caption = 'Contact';
                    Editable = false;
                }
                field(Mobile;Mobile)
                {
                    Caption = 'Mobile No.';
                    Editable = false;
                }
                field("Document No.";"Document No.")
                {
                    Editable = false;
                }
                field("Order Confimed";"Order Confimed")
                {
                }
                field("Scheduled Date";"Scheduled Date")
                {
                }
                field("PurchaseHeader.""Sale Order No""";PurchaseHeader."Sale Order No")
                {
                    Caption = 'Sale Order No';
                    Editable = false;
                }
                field("PurchaseHeader.""Order Date""";PurchaseHeader."Order Date")
                {
                    Caption = 'Order Date';
                    Editable = false;
                }
                field("Expected Receipt Date";"Expected Receipt Date")
                {
                    Editable = false;
                }
                field("Deviated Receipt Date";"Deviated Receipt Date")
                {
                    Caption = '" Latest Mat. Expected date"';
                    Editable = true;
                }
                field("Vendor Mat. Dispatch Date";"Vendor Mat. Dispatch Date")
                {
                }
                field("Mat. Dispatched";"Mat. Dispatched")
                {
                }
                field("Outstanding Quantity";"Outstanding Quantity")
                {
                    Editable = false;
                }
                field("Direct Unit Cost";"Direct Unit Cost")
                {
                    Editable = false;
                }
                field(DevDays;DevDays)
                {
                    Caption = 'Deviated Days';
                    Editable = false;
                }
                field(Remarks;Remarks)
                {
                    Editable = true;
                }
                field("Location Code";"Location Code")
                {
                    Caption = 'Location Code';
                    Editable = false;
                }
                field(City;City)
                {
                    Caption = 'City';
                    Editable = false;
                }
                field(MailSent;MailSent)
                {
                }
                field("PCB Mode";"PCB Mode")
                {
                }
                field("Courier Agency";"Courier Agency")
                {
                }
                field("Docket No";"Docket No")
                {
                }
                field("Tracking Status";"Tracking Status")
                {
                    Editable = false;
                }
                field("Tracking Status Last Updated";"Tracking Status Last Updated")
                {
                    Editable = false;
                }
                field("Tracking URL";"Tracking URL")
                {
                    Editable = false;
                }
                field("Courier Agency Name";"Courier Agency Name")
                {
                    Editable = false;
                }
                field("Courier Dispatch Started On";"Courier Dispatch Started On")
                {
                    Editable = false;
                }
                field(Itemremarks;Itemremarks)
                {
                }
                field("Gen. Bus. Posting Group";"Gen. Bus. Posting Group")
                {
                }
                field(Status;Statuss)
                {
                }
                field("Stock At Stores";"Stock At Stores")
                {
                }
                field("Stock At CS Stores";"Stock At CS Stores")
                {
                }
                field("Stock At RD Stores";"Stock At RD Stores")
                {
                }
                field("Stock At MCH Stores";"Stock At MCH Stores")
                {
                }
                field(MatReqDate;MatReqDate)
                {
                    Caption = 'Material Required Date';
                    Editable = false;
                }
                field(ProdStartDate;ProdStartDate)
                {
                    Caption = 'Prod Start Date';
                    Editable = false;
                }
                field("Indent No.";"Indent No.")
                {
                }
                field(Indented_user;Indented_user)
                {
                }
                field("Amount To Vendor";"Amount To Vendor")
                {
                }
            }
            group(Control1102152037)
            {
                ShowCaption = false;
                grid(Control1102152036)
                {
                    ShowCaption = false;
                    group(Control1102152038)
                    {
                        ShowCaption = false;
                        field("COUNT";COUNT)
                        {
                        }
                    }
                    group(Control1102152035)
                    {
                        ShowCaption = false;
                        field(Color_Open;Color_Open)
                        {
                            Style = StrongAccent;
                            StyleExpr = true;
                        }
                    }
                    group(Control1102152046)
                    {
                        ShowCaption = false;
                        field(Color_Txt_Old_Dev_Rec_Date;Color_Txt_Old_Dev_Rec_Date)
                        {
                            Style = Attention;
                            StyleExpr = true;
                        }
                    }
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Action1102152020)
            {
                action("Auto Mail")
                {
                    CaptionML = ENU='Auto Mail',
                                ENN='&Print';
                    Ellipsis = true;
                    Image = MailSetup;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;

                    trigger OnAction();
                    begin
                        // Added by Rakesh to send Auto mail for Vendors for Followup on 13-Nov-14
                        
                        IF NOT (USERID IN ['EFFTRONICS\CHOWDARY','EFFTRONICS\RENUKACH','EFFTRONICS\BRAHMAIAH','EFFTRONICS\RRAHUL','EFFTRONICS\ANILKUMAR','EFFTRONICS\SUJANI','EFFTRONICS\VISHNUPRIYA']) THEN
                          ERROR('You donot have rights to perform this action');
                        
                        IF CONFIRM('Do want to send Auto mails to all Vendors ') = FALSE THEN
                          EXIT;
                        
                        Mail_From := 'purchase@efftronics.com';
                        first := FALSE;
                        
                        RESET;
                        SETCURRENTKEY("Document Type","Buy-from Vendor No.");
                        SETFILTER("Document Type",'%1',1);
                        SETFILTER("Qty. to Receive",'>%1',0);
                        //MESSAGE(FORMAT(COUNT));
                        
                        test :=0;
                        mailcount := 0;
                        IF FINDFIRST THEN
                        BEGIN
                          Ven_name := "Vendor Name";
                          Ven_no := "Buy-from Vendor No.";
                        END;
                        
                        USER.RESET;
                        USER.SETRANGE(USER."User Name",USERID);
                        IF USER.FINDFIRST THEN
                          username:= USER."Full Name";
                        
                        IF NOT(username IN ['Chowdary Ch','Renuka CH','APPANNA PARTHUDU . KOLLI','Brahmaiah V','RAHUL RAVULA']) THEN
                          username:= 'Chowdary Ch';
                        
                        //MESSAGE('Start: '+Ven_name);
                        IF FINDFIRST THEN
                        REPEAT
                          IF Ven_name = "Vendor Name" THEN
                          BEGIN
                            IF first = FALSE THEN
                            BEGIN
                              Vendor.RESET;
                              Vendor.SETRANGE(Vendor."No.","Buy-from Vendor No.");
                              IF Vendor.FINDFIRST THEN
                                //commented by vishnu
                                Mail_To := Vendor."E-Mail";//'rakesht@efftronics.com';
                               //Mail_To := 'anilkumar@efftronics.com,vishnupriya@efftronics.com';//'rakesht@efftronics.com';
                              Mail_Subject := 'Reg: Pending Material Expected dates Required - '+ "Vendor Name";
                              Mail_Body := '';
                              SMTP_MAIL.CreateMessage('ERP',Mail_From,Mail_To,Mail_Subject,Mail_Body,TRUE);
                              SMTP_MAIL.AppendBody('Dear Sir/Madam,');
                              SMTP_MAIL.AppendBody('<br><br>');
                              SMTP_MAIL.AppendBody('Please provide the material expected date for the below pending material.<br>');
                              SMTP_MAIL.AppendBody('Please mention the dispatch date in below field and reply through return mail.<br><br>');
                              SMTP_MAIL.AppendBody('<html><body><table border=1 style="border-collapse: collapse;font-size =8;" ><col width="180">');
                              SMTP_MAIL.AppendBody('<tr><th>Purchase Order No.</th><th>Order Date</th><th>Description</th><th>Qty. to Receive</th><th>Order Days</th><th>Exp. Dispatch Date</th></tr>');
                              PurchaseHeader.RESET;
                              PurchaseHeader.SETRANGE(PurchaseHeader."No.","Document No.");
                              IF PurchaseHeader.FINDFIRST THEN
                              BEGIN
                                Ord_date := PurchaseHeader."Order Date";
                                Dev_date := CALCDATE("Safety Lead Time",Ord_date);
                              END;
                             //commented by vishnupriya
                              IF Dev_date < TODAY THEN
                                font_color := 'red'
                              ELSE IF (Dev_date - TODAY) > 10 THEN
                                font_color := 'green'
                              ELSE
                                font_color := 'black';
                              SMTP_MAIL.AppendBody('<tr style="color:'+font_color+';"><td>'+"Document No."+'</td><td>'+FORMAT((Ord_date),0,'<Day,2><Filler Character, >. <Month Text,3> <Year4>')+'</td>');
                              SMTP_MAIL.AppendBody('<td>'+Description+'</td><td align=right>'+FORMAT("Qty. to Receive")+'</td><td align=right>'+FORMAT(TODAY-Dev_date)+'</td><td>-</td></tr>');
                              first := TRUE;
                            END
                            ELSE
                            BEGIN
                              PurchaseHeader.RESET;
                              PurchaseHeader.SETRANGE(PurchaseHeader."No.","Document No.");
                              IF PurchaseHeader.FINDFIRST THEN
                              BEGIN
                                Ord_date := PurchaseHeader."Order Date";
                                Dev_date := CALCDATE("Safety Lead Time",Ord_date);
                              END;
                              //commented by vishnu
                              IF Dev_date < TODAY THEN
                                font_color := 'red'
                              ELSE IF (Dev_date - TODAY) > 10  THEN
                                font_color := 'green'
                              ELSE
                                font_color := 'black';
                              SMTP_MAIL.AppendBody('<tr style="color:'+font_color+';"><td>'+"Document No."+'</td><td>'+FORMAT((Ord_date),0,'<Day,2><Filler Character, >. <Month Text,3> <Year4>')+'</td>');
                              SMTP_MAIL.AppendBody('<td>'+Description+'</td><td align=right>'+FORMAT("Qty. to Receive")+'</td><td align=right>'+FORMAT(TODAY-Dev_date)+'</td><td>-</td></tr>');
                            END;
                          END
                          ELSE
                          BEGIN
                            SMTP_MAIL.AppendBody('</table><br>Regards,<br>');
                            SMTP_MAIL.AppendBody('<b>'+username+'<br> Purchase Department<BR>'+'Efftronics Systems Pvt. Ltd.,</b><BR>');
                            SMTP_MAIL.AppendBody('40-15-9,Brundavan Colony,<br>Vijayawada - 520010,<br>Andhra Pradesh, India.<br>');
                            SMTP_MAIL.AppendBody('Ph No : 0866-2466679(Direct)/2466699/75<br>');
                            //commented by vishnupriya
                            SMTP_MAIL.AppendBody('<br><b>Note:<br>1. This is System generated Automail.<br>2. <font color=red>Color items</font> are deviated.<br>');
                            SMTP_MAIL.AppendBody('3. Black color items are to be received items less than 10 days<br>4. <font color=green>Color items</font> are yet to receive items greater than 10 days</b></body></html>');
                            test +=1;
                            IF (MailSent <> TODAY) AND (Mail_To <> '')  THEN
                            BEGIN
                              SMTP_MAIL.AddBCC('purchase@efftronics.com,erp@efftronics.com');
                            /*  IF test=2 THEN
                                ERROR('Just a Trail'); */ // To test for 1 vendor
                              SMTP_MAIL.Send;
                              mailcount +=1;
                              PL.RESET;
                              PL.SETFILTER(PL."Buy-from Vendor No.",Ven_no);
                              PL.SETFILTER(PL."Document Type",'%1',1);
                              PL.SETFILTER(PL."Qty. to Receive",'>%1',0);
                        
                              IF PL.FINDSET THEN
                                PL.MODIFYALL(PL.MailSent,TODAY);
                               COMMIT;
                        //      MESSAGE('Mail Sent to '+Ven_name);
                            END;
                            Ven_name := "Vendor Name";
                            Ven_no := "Buy-from Vendor No.";
                            first := FALSE;
                            Vendor.RESET;
                            Vendor.SETRANGE(Vendor."No.","Buy-from Vendor No.");
                            IF Vendor.FINDFIRST THEN
                              Mail_To := Vendor."E-Mail";//'rakesht@efftronics.com';
                               //Mail_To := 'anilkumar@efftronics.com';//'rakesht@efftronics.com';
                            Mail_Subject := 'Reg: Pending Material Expected dates Required - '+ "Vendor Name";
                            Mail_Body := '';
                            SMTP_MAIL.CreateMessage('ERP',Mail_From,Mail_To,Mail_Subject,Mail_Body,TRUE);
                            SMTP_MAIL.AppendBody('Dear Sir/Madam,');
                            SMTP_MAIL.AppendBody('<br><br>');
                            SMTP_MAIL.AppendBody('Please provide the material expected date for the below pending material.<br>');
                            SMTP_MAIL.AppendBody('Please mention the dispatch date in below field and reply through return mail.<br><br>');
                            PurchaseHeader.RESET;
                            PurchaseHeader.SETRANGE(PurchaseHeader."No.","Document No.");
                            IF PurchaseHeader.FINDFIRST THEN
                            BEGIN
                              Ord_date := PurchaseHeader."Order Date";
                              Dev_date := CALCDATE("Safety Lead Time",Ord_date);
                            END;
                        
                            SMTP_MAIL.AppendBody('<html><body><table border=1 style="border-collapse: collapse; font-size =8;" ><col width="180">');
                            //SMTP_MAIL.AppendBody('<tr><th>Purchase Order No.</th><th>Order Date</th><th>Description</th><th>Qty. to Receive</th><th>Deviated Days</th><th>Exp. Dispatch Date</th></tr>');
                            SMTP_MAIL.AppendBody('<tr><th>Purchase Order No.</th><th>Order Date</th><th>Description</th><th>Qty. to Receive</th><th>Order Days</th><th>Exp. Dispatch Date</th></tr>');
                            PurchaseHeader.RESET;
                            PurchaseHeader.SETRANGE(PurchaseHeader."No.","Document No.");
                            IF Dev_date < TODAY THEN
                              font_color := 'red'
                            ELSE IF (Dev_date - TODAY) > 10 THEN
                              font_color := 'green'
                            ELSE
                              font_color := 'black';
                              SMTP_MAIL.AppendBody('<tr style="color:'+font_color+';"><td>'+"Document No."+'</td><td>'+FORMAT((Ord_date),0,'<Day,2><Filler Character, >. <Month Text,3> <Year4>')+'</td>');
                              SMTP_MAIL.AppendBody('<td>'+Description+'</td><td align=right>'+FORMAT("Qty. to Receive")+'</td><td align=right>'+FORMAT(TODAY-Dev_date)+'</td><td>-</td></tr>');
                              //SMTP_MAIL.AppendBody('<td>'+Description+'</td><td align=right>'+FORMAT("Qty. to Receive")+'</td><td align=right>'+FORMAT(TODAY-Ord_date)+'</td><td>-</td></tr>');
                            first := TRUE;
                            END
                        UNTIL /*(test=1) OR */(NEXT =0);
                        
                        
                        Mail_To:='purchase@efftronics.com,spurthi@efftronics.com,anilkumar@efftronics.com,erp@efftronics.com';
                        //Mail_To:='anilkumar@efftronics.com,erp@efftronics.com';
                        Mail_Subject := 'Reg: Automail for Vendor Followup';
                        Mail_Body := 'Dear Sir/Madam,<br>';
                        Mail_Body+='<br>           Automails for '+FORMAT(mailcount) +' vendors have been sent.<br>';
                        Mail_Body+='<br>Regards,<br>ERP Team<br><br><b>Note: Automail generated from ERP</b>';
                        SMTP_MAIL.CreateMessage('ERP','erp@efftronics.com',Mail_To,Mail_Subject,Mail_Body,TRUE);
                        SMTP_MAIL.Send;
                        // end by Rakesh

                    end;
                }
                action("Auto Mail Vendors")
                {
                    Caption = 'Auto Mail Vendors';
                    Image = MailSetup;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        
                        //temporary commented
                        
                        /*Rec.RESET;
                        Rec.SETCURRENTKEY("No.","Buy-from Vendor No.");
                        Rec.SETFILTER("Document Type",'%1',1);
                        Rec.SETFILTER("Qty. to Receive",'>%1',0);
                        IF Rec.FINDSET THEN
                        REPEAT
                          Vendor.RESET;
                          Vendor.SETCURRENTKEY("No.");
                          Vendor.SETRANGE(Vendor."No.",Rec."Buy-from Vendor No.");
                          IF Vendor.FINDFIRST THEN
                          BEGIN
                            Vendor."Mail Required" := FALSE;
                            Vendor.MODIFY;
                          END;
                        UNTIL Rec.NEXT =0;
                        */
                        
                        
                        // Added by Rakesh on 20-Nov-14 for Vendor wise followup mails
                        Vendor.RESET;
                        Vendor.SETCURRENTKEY("No.");
                        IF Vendor.FINDSET THEN
                        BEGIN
                          Vendor.MODIFYALL(Vendor."Mail Required",FALSE);
                          COMMIT;
                        END;
                        
                        
                        
                        Rec.RESET;
                        Rec.SETCURRENTKEY("No.","Buy-from Vendor No.");
                        Rec.SETFILTER("Document Type",'%1',1);
                        Rec.SETFILTER("Qty. to Receive",'>%1',0);
                        IF Rec.FINDSET THEN
                        REPEAT
                          Vendor.RESET;
                          Vendor.SETCURRENTKEY("No.");
                          Vendor.SETRANGE(Vendor."No.",Rec."Buy-from Vendor No.");
                          IF Vendor.FINDFIRST THEN
                          BEGIN
                            Vendor."Mail Required" := TRUE;
                            Vendor.MODIFY;
                          END;
                        UNTIL Rec.NEXT =0;
                        
                        //PAGE.RUN(50009); commented by vijaya on 24-May-2016
                        //Added by vijaya on 24-May-2016 for Differentiate Material Receive and Bill Receive
                        VendorList.MailPusposeAssignment('Material');
                        VendorList.RUN;
                        //end by Vijaya
                        
                        
                        // end by Rakesh on 20-Nov-14

                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        PurchaseHeader.RESET;
        PurchaseHeader.SETFILTER(PurchaseHeader."No.","Document No.");
        IF PurchaseHeader.FINDFIRST THEN
        BEGIN
          SaleOrder:=PurchaseHeader."Sale Order No";
          IF FORMAT("Safety Lead Time")<>'' THEN
            DevDays:=TODAY-CALCDATE("Safety Lead Time",PurchaseHeader."Order Date")
          ELSE
           DevDays:=TODAY-PurchaseHeader."Order Date";
          //ven:=PurchaseHeader."Buy-from Vendor Name";
          Vendor.RESET;
          Vendor.SETFILTER(Vendor."No.",PurchaseHeader."Buy-from Vendor No.");

          IF Vendor.FINDFIRST THEN
          BEGIN
            contact:=Vendor.Contact;
            Mobile:=Vendor."Mobile No.";
            City:=Vendor.City;
          END;
          Total:=Total+1;
          Statuss := PurchaseHeader.Status;
          IF   ( PurchaseHeader.Status =  PurchaseHeader.Status::Open) THEN
            coloring := TRUE
          ELSE
            coloring := FALSE;
          IF "Deviated Receipt Date" < TODAY THEN
            coloring1 := TRUE
          ELSE coloring1 := FALSE;
          //Added by Vijaya on 23-06-2018
          Indented_user := '';
          IH.RESET;
          IH.SETRANGE("No.","Indent No.");
          IF IH.FINDFIRST THEN
          BEGIN
            Indented_user := IH."Indent Reference";
          END;
          // Added by Pranavi on 20-Dec-2016
          MatReqDate:=0D;
          ProdStartDate:=0D;
          IndentLine.RESET;
          IndentLine.SETRANGE(IndentLine."Document No.","Indent No.");
          IndentLine.SETRANGE(IndentLine."Line No.","Indent Line No.");
          IndentLine.SETRANGE(IndentLine."No.","No.");
          IF IndentLine.FINDFIRST THEN
          BEGIN
            POC.RESET;
            POC.SETRANGE(POC."Prod. Order No.",IndentLine."Production Order");
            POC.SETRANGE(POC."Prod. Order Line No.",IndentLine."Production Order Line No.");
            POC.SETRANGE(POC."Line No.",IndentLine."Production Order Comp Line No.");
            POC.SETRANGE(POC."Item No.",IndentLine."No.");
            IF POC.FINDFIRST THEN
            BEGIN
              MatReqDate:=POC."Production Plan Date"-4;
              ProdStartDate:=POC."Production Plan Date";
            END;
          END;
          // End by Pranavi
        END;


        // added by vishnu for the Shortage Qty for the Item on May 10th 2019
        SumofShortage := 0;
        MIL.RESET;
        MIL.SETFILTER("Transfer-from Code",'%1|%2','STR','MCH');
        //MIL.SETFILTER("Item No.",'BOICOMP00244');
        MIL.SETFILTER("Outstanding Quantity",'>%1',0);
        MIL.SETFILTER("Item No.",Rec."No.");
        IF MIL.FINDSET THEN
          REPEAT
            BEGIN
              SumofShortage := SumofShortage + MIL."Outstanding Quantity";
            END;
          UNTIL MIL.NEXT = 0;
          "Shortage Qty" := SumofShortage;
        // end by vishnu
    end;

    trigger OnInit();
    begin
        editSet:=TRUE;
        Total:=0;
        Color_Open := 'Purchase Order in Open';
        Totalcount := 'Total Items Count ::';
        coloring1:=FALSE;
    end;

    var
        editSet : Boolean;
        PurchaseHeader : Record "Purchase Header";
        SaleOrder : Code[20];
        Vendor : Record Vendor;
        contact : Code[50];
        Mobile : Code[30];
        DevDays : Integer;
        City : Code[30];
        Total : Integer;
        Ven_name : Text;
        Ven_no : Code[30];
        SMTP_MAIL : Codeunit "SMTP Mail";
        Mail_Subject : Text[1000];
        Mail_Body : Text[1000];
        Mail_To : Text[1000];
        Mail_From : Text[1000];
        first : Boolean;
        test : Integer;
        PL : Record "Purchase Line";
        Ord_date : Date;
        font_color : Text;
        Dev_date : Date;
        USER : Record User;
        username : Text[50];
        mailcount : Integer;
        VendorList : Page "Purchase Automail VendorsList";
                         Statuss : Option Open,Released,"Pending Approval","Pending Prepayment";
                         coloring : Boolean;
                         Color_Open : Text;
                         Totalcount : Text;
                         MatReqDate : Date;
                         ProdStartDate : Date;
                         IndentLine : Record "Indent Line";
                         POC : Record "Prod. Order Component";
                         Color_Txt_Old_Dev_Rec_Date : Label 'Deviated Receipt Date < Today';
        coloring1 : Boolean;
        Indented_user : Text;
        IH : Record "Indent Header";
        "Shortage Qty" : Decimal;
        Prod_order_Compont_Qty : Decimal;
        SumofShortage : Decimal;
        MIL : Record "Material Issues Line";
}

