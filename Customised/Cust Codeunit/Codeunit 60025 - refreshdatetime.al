codeunit 60025 refreshdatetime
{

    trigger OnRun();
    begin
        ContinuosSupportWithEfftronics;
        //SurveyWithEfftronics;

        //prodorder."No.":=FORMAT('APV08AMC01');
        // refresh(prodorder."No.");

        //B2B  Vendor  mail for gst filling
        //VendorGstFillling;

        //VendorIntimationMessage;

        //VendorCarona;
        /*
        Vendor.RESET;
        Vendor.SETRANGE(Maintenacecommonmail,TRUE);
        IF Vendor.FINDSET THEN REPEAT
          Vendor.Maintenacecommonmail := FALSE;
          Vendor.MODIFY;
        UNTIL Vendor.NEXT = 0;
        MESSAGE('completed');
        */
        //TestMail

        //SurveyWithEfftronics;

    end;

    var
        prodorder: Record "Production Order";
        date: Date;
        datetime: DateTime;
        time: Time;
        item: Record Item;
        prodline: Record "Prod. Order Line";
        "-----b2b-----": Integer;
        Vendor: Record Vendor;
        ToMail: Text[250];
        FromMail: Text[250];
        SMTPMail: Codeunit "SMTP Mail";
        Subject: Text[250];
        MonthGvar: Text;
        YearGVar: Integer;
        totVendor: Integer;
        PurchaseHeader: Record "Purchase Header";

    [LineStart(25770)]
    procedure refresh(var prodno: Code[20]);
    begin
        /*
            prodorder.SETRANGE(prodorder."No.",prodno);
            IF prodorder.FINDSET THEN
            REPEAT
            prodorder.Refreshdate:=TODAY;
          item.SETFILTER(item."No.",prodorder."Source No.");
          IF item.COUNT=1 THEN
          BEGIN
          item.GET(prodorder."Source No.");
          prodorder."Item Sub Group Code":=item."Item Sub Group Code";
          prodorder."Product Group Code":=item."Product Group Code";
          prodorder.MODIFY;
          END;
          UNTIL prodorder.NEXT=0;
        prodline.SETFILTER(prodline."Prod. Order No.",prodno);
        IF prodline.FINDSET THEN
        REPEAT
        prodline."Sales Order No":=prodorder."Sales Order No.";
        //MESSAGE(FORMAT(prodline."Sales Order No"));
        prodline.MODIFY;
        UNTIL prodline.NEXT=0;
        */

    end;

    [LineStart(25794)]
    local procedure VendorGstFillling();
    begin
        /*
        YearGVar := DATE2DMY(WORKDATE,3);
        MonthGvar := FORMAT(WORKDATE,0,'<Month text,3>');
        
        FromMail := 'purchaseaccounts@efftronics.com';
        Subject := 'Reminder for GST Returns Filling';
        
        Vendor.RESET;
        Vendor.SETRANGE("GST Vendor Type",Vendor."GST Vendor Type"::Registered);
        Vendor.SETFILTER("No Of POs",'>%1',0);
        Vendor.SETRANGE(Maintenacecommonmail,FALSE);
        IF Vendor.FINDSET THEN BEGIN
          REPEAT
            PurchaseHeader.RESET;
            PurchaseHeader.SETRANGE("Document Type",PurchaseHeader."Document Type"::Order);
            PurchaseHeader.SETFILTER("Order Date",'>=%1',010419D);
            PurchaseHeader.SETRANGE("Buy-from Vendor No.",Vendor."No.");
            IF PurchaseHeader.FINDFIRST THEN BEGIN
            CLEAR(ToMail);
            IF Vendor."E-Mail" <> '' THEN
              ToMail := Vendor."E-Mail";
             IF (ToMail <>'') AND (FromMail<>'')  THEN BEGIN
               SMTPMail.CreateMessage('ERP',FromMail,ToMail,Subject,'',TRUE);
               SMTPMail.AddBCC('purchaseaccounts@efftronics.com');
               SMTPMail.AppendBody('Dear Sir/Madam,');
               SMTPMail.AppendBody('<BR><BR>');
               SMTPMail.AppendBody('Please file the GST returns as per your terms wise.');
               SMTPMail.AppendBody('<BR><BR>');
               SMTPMail.AppendBody('Monthly returns supplies filing on or before'+' '+ MonthGvar +' 15th of '+ MonthGvar+ ' '+FORMAT(YearGVar));
               SMTPMail.AppendBody('<BR>');
               IF MonthGvar IN['Jan','Apr','Jul','Oct'] THEN
                 SMTPMail.AppendBody('Quarterly returns supplier filing on or before'+' '+ MonthGvar +' 30th of '+ MonthGvar+ ' '+FORMAT(YearGVar));
               SMTPMail.AppendBody('<BR><BR>');
               SMTPMail.AppendBody('Note : Please forget this mail,if you are filed Or Not applicable vendors.');
               SMTPMail.AppendBody('<BR><BR>');
               SMTPMail.AppendBody('Regards,');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('Padmasri D');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('Purchase');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('EfftronicsSystems Pvt. Ltd.,');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('40-15-9,Brundavan Colony,');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('Vijayawada - 520010,');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('Andhra Pradesh, India.');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('Ph No : 0866-2483375; Cell No : 08328698839');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('Website :<a href="http://www.effe.in/"><b>www.effe.in,</b></a><a href="https://www.efftronics.com/"><b>www.efftronics.com</b></a>');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.Send;
             END;
             Vendor.Maintenacecommonmail := TRUE;
             Vendor.MODIFY;
             END;
          UNTIL Vendor.NEXT = 0;
        END;
        
        MESSAGE('completed');
        */

    end;

    [LineStart(25859)]
    local procedure VendorIntimationMessage();
    begin
        /*
        FromMail := 'purchase@efftronics.com';
        Subject := 'Efftronics company representative';
        
        Vendor.RESET;
        Vendor.SETFILTER("No Of POs",'>%1',0);
        Vendor.SETRANGE("GST Vendor Type",Vendor."GST Vendor Type"::Registered);
        Vendor.SETRANGE("Information Mail",FALSE);
        IF Vendor.FINDSET THEN
          REPEAT
            CLEAR(ToMail);
            IF Vendor."E-Mail" <> '' THEN
              ToMail := Vendor."E-Mail";
             IF (ToMail <>'') AND (FromMail<>'')  THEN BEGIN
               SMTPMail.CreateMessage('ERP',FromMail,ToMail,Subject,'',TRUE);
               SMTPMail.AddBCC('purchaseaccounts@efftronics.com');
               SMTPMail.AppendBody('Dear Vendor,');
               SMTPMail.AppendBody('<BR><BR>');
               SMTPMail.AppendBody('Greetings of the day. We would like to inform that due to Mr. Chowdary’s sudden absence from office,  he is divested of his responsibilities until further notice and is not authorized to deal on behalf of the company');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('We request you to contact Ms. Renuka . Following are her contact details.');
               SMTPMail.AppendBody('<BR><BR>');
               SMTPMail.AppendBody('Email -renukach@efftronics.com');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('Mobile- +91-7036666132');
               SMTPMail.AppendBody('<BR><BR>');
               SMTPMail.AppendBody('Thanking you..');
               SMTPMail.AppendBody('<BR><BR>');
               SMTPMail.AppendBody('Regards,');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('Anvesh Dasari');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('Vice President');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('Cell No :+919849051177');
                SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('EfftronicsSystems Pvt. Ltd.,');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('40-15-9,Brundavan Colony,');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('Vijayawada - 520010,');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('Andhra Pradesh, India.');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('Ph No : 0866-2483375');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('Website :<a href="http://www.effe.in/"><b>www.effe.in,</b></a><a href="https://www.efftronics.com/"><b>www.efftronics.com</b></a>');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.Send;
             END;
             Vendor."Information Mail" := TRUE;
             Vendor.MODIFY;
          UNTIL Vendor.NEXT = 0;
             MESSAGE('Mail send');
        
        */

    end;

    [LineStart(25917)]
    local procedure VendorCarona();
    begin
        /*
        YearGVar := DATE2DMY(WORKDATE,3);
        MonthGvar := FORMAT(WORKDATE,0,'<Month text,3>');
        
        FromMail := 'purchase@efftronics.com';
        Subject := 'Important Message from Efftronics';
        
        Vendor.RESET;
        Vendor.SETFILTER("No Of POs",'>%1',0);
        Vendor.SETRANGE(Maintenacecommonmail,FALSE);
        IF Vendor.FINDSET THEN BEGIN
          REPEAT
            PurchaseHeader.RESET;
            PurchaseHeader.SETRANGE("Document Type",PurchaseHeader."Document Type"::Order);
            PurchaseHeader.SETFILTER("Order Date",'>=%1',010419D);
            PurchaseHeader.SETRANGE("Buy-from Vendor No.",Vendor."No.");
            IF PurchaseHeader.FINDFIRST THEN BEGIN
            CLEAR(ToMail);
            IF Vendor."E-Mail" <> '' THEN
              ToMail := Vendor."E-Mail";
             IF (ToMail <>'') AND (FromMail<>'')  THEN BEGIN
               SMTPMail.CreateMessage('ERP',FromMail,ToMail,Subject,'',TRUE);
               SMTPMail.AddBCC('purchaseaccounts@efftronics.com');
               SMTPMail.AppendBody('Dear Efftronics Valued Partner and Supplier,');
               SMTPMail.AppendBody('<BR><BR>');
               SMTPMail.AppendBody('Firstly, I would like to thank all suppliers who have supported us in achieving our business targets of FY19-20. Your continuous support is key to our growth.');
               SMTPMail.AppendBody('<BR><BR>');
               SMTPMail.AppendBody('Covid -19 is impacting the humanity across the globe. For Efftronics our biggest priority is the safety of all our stake holders.');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('We hope that everyone is taking required safety measures in house as well as in workplaces.');
               SMTPMail.AppendBody('<BR><BR>');
               SMTPMail.AppendBody('Covid-19 has created an unprecedented challenge to countries, Industries and individuals. This pandemic is going to impact each industry. The quantum of impact may differ from Industry to Industry.');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('In these challenging times, every business needs to transform itself to sustain. We need to re-engineer our business, processes and products.');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('We also need to rethink on our products as the customer preferences and priorities may also change.');
               SMTPMail.AppendBody('<BR><BR>');
               SMTPMail.AppendBody('For Efftronics, we have built strong foundation over the years with our values and principles. We always believed in win-win in all our collaborations.But still this global pandemic is going to hit every enterprise');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('profitability and future revenues.In these critical times, it is more important to work as a team. We all need to understand each other challenges and collaborate more efficiently.');
               SMTPMail.AppendBody('<BR><BR>');
               SMTPMail.AppendBody('In these challenging times, we all need to have a growth mindset and start using our time more productively. We need to learn various things like business tools, new technologies, productivity process and trends.');
               SMTPMail.AppendBody('<BR><BR>');
               SMTPMail.AppendBody('I would like reiterate Gartner’s simple formula.');
               SMTPMail.AppendBody('<BR><BR>');
               SMTPMail.AppendBody('(Mindsets + Practises) x Technology = Capabilities => Results');
               SMTPMail.AppendBody('<BR><BR>');
               SMTPMail.AppendBody('Changing mindsets lead to new practices, which are amplified by technology, leading to new capabilities and yielding new results.');
               SMTPMail.AppendBody('<BR><BR>');
               SMTPMail.AppendBody('We also commit to clear all pending dues of every supplier/ vendor. Our company is ensuring that all vendors get their payments at the earliest.');
               SMTPMail.AppendBody('<BR><BR>');
               SMTPMail.AppendBody('I request every supplier to well inform us on all kinds of developments. This helps us in better planning and better control of the situation. ');
               SMTPMail.AppendBody('<BR><BR>');
               SMTPMail.AppendBody('As lock downs are being implemented across the world, supply chains across the globe are going to impact. Semiconductor Foundries across the globe are also shut during these lock downs.');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('We request every dealer / distributor to inform us on all kinds of changes that has been developed due to this pandemic.');
               SMTPMail.AppendBody('<BR><BR>');
               SMTPMail.AppendBody('Our purchase team will be available for any kind of support. Our teams can be reached through all kinds of connectives during lock down period as well. ');
               SMTPMail.AppendBody('<BR><BR>');
               SMTPMail.AppendBody('As Henry Ford said, “Coming together is beginning, staying together is progress and working together is success”. In these challenging times we all need to collaborate more efficiently and combat this global crisis.');
               SMTPMail.AppendBody('<BR><BR>');
               SMTPMail.AppendBody('Stay Home, Stay Safe.');
               SMTPMail.AppendBody('<BR><BR>');
               SMTPMail.AppendBody('Regards,');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('D. Rama Krishna');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('Manging Director,');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('EfftronicsSystems Pvt. Ltd.,');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('40-15-9,Brundavan Colony,');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('Vijayawada - 520010,');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('Andhra Pradesh, India.');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.AppendBody('Website :<a href="http://www.effe.in/"><b>www.effe.in,</b></a><a href="https://www.efftronics.com/"><b>www.efftronics.com</b></a>');
               SMTPMail.AppendBody('<BR>');
               SMTPMail.Send;
             END;
             Vendor.Maintenacecommonmail := TRUE;
             Vendor.MODIFY;
             END;
          UNTIL Vendor.NEXT = 0;
          MESSAGE('completed');
        END;
        */

    end;

    [LineStart(26007)]
    local procedure SurveyWithEfftronics();
    begin

        YearGVar := DATE2DMY(WORKDATE, 3);
        MonthGvar := FORMAT(WORKDATE, 0, '<Month text,3>');

        FromMail := 'purchase@efftronics.com';
        Subject := 'Reg: Survey with Efftronics Systems Pvt ltd Suppliers -COVID-19 Period-Supply Chain Challenges';

        Vendor.RESET;
        Vendor.SETRANGE("GST Vendor Type", Vendor."GST Vendor Type"::Registered);
        Vendor.SETFILTER("No Of POs", '>%1', 0);
        Vendor.SETFILTER("E-Mail", '<>%1', ''); //added by vishnu
        Vendor.SETRANGE(Maintenacecommonmail, FALSE);
        IF Vendor.FINDSET THEN BEGIN
            REPEAT
                PurchaseHeader.RESET;
                PurchaseHeader.SETRANGE("Document Type", PurchaseHeader."Document Type"::Order);
                PurchaseHeader.SETFILTER("Order Date", '>=%1', 040119D);
                PurchaseHeader.SETRANGE("Buy-from Vendor No.", Vendor."No.");
                IF PurchaseHeader.FINDFIRST THEN BEGIN
                    CLEAR(ToMail);
                    IF Vendor."E-Mail" <> '' THEN
                        ToMail := Vendor."E-Mail";
                    IF (ToMail <> '') AND (FromMail <> '') THEN BEGIN
                        SMTPMail.CreateMessage('ERP', FromMail, ToMail, Subject, '', TRUE);
                        SMTPMail.AddBCC('purchaseaccounts@efftronics.com');
                        //SMTP_MAIL.AddBCC('vishnupriya@efftronics.com');
                        SMTPMail.AppendBody('Respected Sir/Madam,');
                        SMTPMail.AppendBody('<BR><BR>');
                        SMTPMail.AppendBody('Hope you all are fine ..your family & Staff  members also in safe position');
                        SMTPMail.AppendBody('<BR><BR>');
                        SMTPMail.AppendBody('As we all are know in this COVID-19 period , we need to face the all challenges(Raw material procurement and logistics) to sustain our business.');
                        SMTPMail.AppendBody('<BR><BR>');
                        SMTPMail.AppendBody('In this position , we are doing survey with our Suppliers. So please co-operate with us and fill this document and it is very helpful to plan our production');
                        SMTPMail.AppendBody('<BR><BR>');
                        SMTPMail.AppendBody('link');
                        SMTPMail.AppendBody('<BR>');
                        SMTPMail.AppendBody('Website :<a href="http://app.efftronics.org/vendorsurvey/App/Login"><b>app.efftronics.org/vendorsurvey/App/Login</b></a>');
                        SMTPMail.AppendBody('<BR>');
                        SMTPMail.AppendBody('Click this above link');
                        SMTPMail.AppendBody('<BR>');
                        SMTPMail.AppendBody('login with Your Company GST number');
                        SMTPMail.AppendBody('<BR><BR>');
                        SMTPMail.AppendBody('Thanking You.');
                        SMTPMail.AppendBody('<BR><BR>');
                        SMTPMail.AppendBody('Regards,');
                        SMTPMail.AppendBody('<BR>');
                        SMTPMail.AppendBody('Renuka.Ch');
                        SMTPMail.AppendBody('<BR>');
                        SMTPMail.AppendBody('Manager|ControlRoom (Planning & Purchase)');
                        SMTPMail.AppendBody('<BR>');
                        SMTPMail.AppendBody('EfftronicsSystems Pvt. Ltd.,');
                        SMTPMail.AppendBody('<BR>');
                        SMTPMail.AppendBody('40-15-9,Brundavan Colony,');
                        SMTPMail.AppendBody('<BR>');
                        SMTPMail.AppendBody('Vijayawada - 520010,');
                        SMTPMail.AppendBody('<BR>');
                        SMTPMail.AppendBody('Andhra Pradesh, India.');
                        SMTPMail.AppendBody('<BR>');
                        SMTPMail.AppendBody('Ph No : +91 866 2466699; Cell No : +91 7036666132');
                        SMTPMail.AppendBody('<BR>');
                        SMTPMail.AppendBody('Website :<a href="https://www.efftronics.com/"><b>www.efftronics.com</b></a>');
                        SMTPMail.AppendBody('<BR>');
                        SMTPMail.Send;
                    END;
                    Vendor.Maintenacecommonmail := TRUE;
                    Vendor.MODIFY;
                END;
            UNTIL Vendor.NEXT = 0;
            MESSAGE('completed');
        END;
    end;

    [LineStart(26079)]
    local procedure TestMail();
    begin
        FromMail := 'purchase@efftronics.com';
        Subject := 'Reg: Efftronics Vendor Updates';
        ToMail := 'jagadeeshm@b2bsoftech.com';

        IF (ToMail <> '') AND (FromMail <> '') THEN BEGIN
            SMTPMail.CreateMessage('ERP', FromMail, ToMail, Subject, '', TRUE);

            SMTPMail.AppendBody('Dear Vendor,');
            SMTPMail.AppendBody('<BR><BR>');
            SMTPMail.AppendBody('<BR><BR>');
            SMTPMail.AppendBody('Greetings of the day. Thanks a lot for your continued support. We are concluding the financial statements for FY19-20.');
            SMTPMail.AppendBody('<BR>');
            SMTPMail.AppendBody('As per our books, all the payments to the vendors for FY19-20 are cleared. There are no pending payments related to the invoices raised in FY 19-20.');
            SMTPMail.AppendBody('<BR>');
            SMTPMail.AppendBody('Please send us statement of accounts for reconciliation. We also request your continuous support for the coming years.We also request you to upload the GST returns in timely manner.');
            SMTPMail.AppendBody('<BR>');
            SMTPMail.AppendBody('We also request you to inform us any challenges you are facing related to the pandemic or other external issues.Any  issues related');
            SMTPMail.AppendBody('<BR>');
            SMTPMail.AppendBody('to change in lead times,availability of raw material,obsolescence please inform us well in advance.');
            SMTPMail.AppendBody('<BR><BR>');
            SMTPMail.AppendBody('<BR><BR>');
            SMTPMail.AppendBody('Thanks a lot for your continuous Support.');
            SMTPMail.AppendBody('<BR><BR>');
            SMTPMail.AppendBody('<BR><BR>');
            SMTPMail.AppendBody('Regards,');
            SMTPMail.AppendBody('<BR>');
            SMTPMail.AppendBody('Anvesh Dasari');
            SMTPMail.AppendBody('<BR>');
            SMTPMail.AppendBody('Vice President');
            SMTPMail.AppendBody('<BR>');
            SMTPMail.AppendBody('Cell No :+919849051177');
            SMTPMail.AppendBody('<BR>');
            SMTPMail.AppendBody('EfftronicsSystems Pvt. Ltd.,');
            SMTPMail.AppendBody('<BR>');
            SMTPMail.AppendBody('40-15-9,Brundavan Colony,');
            SMTPMail.AppendBody('<BR>');
            SMTPMail.AppendBody('Vijayawada - 520010,');
            SMTPMail.AppendBody('<BR>');
            SMTPMail.AppendBody('Andhra Pradesh, India.');
            SMTPMail.AppendBody('<BR>');
            SMTPMail.AppendBody('Ph No : 0866-2483375');
            SMTPMail.AppendBody('<BR>');
            SMTPMail.AppendBody('Website :<a href="http://www.effe.in/"><b>www.effe.in,</b></a><a href="https://www.efftronics.com/"><b>www.efftronics.com</b></a>');
            SMTPMail.AppendBody('<BR>');
            SMTPMail.Send;
            MESSAGE('completed');
        END;
    end;

    [LineStart(26128)]
    local procedure ContinuosSupportWithEfftronics();
    begin
        FromMail := 'purchase@efftronics.com';
        Subject := 'Reg: Efftronics Vendor Updates';

        Vendor.RESET;
        Vendor.SETRANGE("GST Vendor Type", Vendor."GST Vendor Type"::Registered);
        Vendor.SETFILTER("No Of POs", '>%1', 0);
        Vendor.SETRANGE(Maintenacecommonmail, FALSE);
        IF Vendor.FINDSET THEN BEGIN
            REPEAT
                PurchaseHeader.RESET;
                PurchaseHeader.SETRANGE("Document Type", PurchaseHeader."Document Type"::Order);
                PurchaseHeader.SETFILTER("Order Date", '>=%1', 040119D);
                PurchaseHeader.SETRANGE("Buy-from Vendor No.", Vendor."No.");
                IF PurchaseHeader.FINDFIRST THEN BEGIN
                    CLEAR(ToMail);
                    IF Vendor."E-Mail" <> '' THEN
                        ToMail := Vendor."E-Mail";
                    IF (ToMail <> '') AND (FromMail <> '') THEN BEGIN
                        SMTPMail.CreateMessage('ERP', FromMail, ToMail, Subject, '', TRUE);
                        SMTPMail.AddBCC('purchaseaccounts@efftronics.com');
                        SMTPMail.AppendBody('Dear Vendor,');
                        SMTPMail.AppendBody('<BR><BR>');
                        SMTPMail.AppendBody('<BR><BR>');
                        SMTPMail.AppendBody('Greetings of the day. Thanks a lot for your continued support. We are concluding the financial statements for FY19-20.');
                        SMTPMail.AppendBody('<BR>');
                        SMTPMail.AppendBody('As per our books, all the payments to the vendors for FY19-20 are cleared. There are no pending payments related to the invoices raised in FY 19-20.');
                        SMTPMail.AppendBody('<BR>');
                        SMTPMail.AppendBody('Please send us statement of accounts for reconciliation. We also request your continuous support for the coming years.We also request you to upload the GST returns in timely manner.');
                        SMTPMail.AppendBody('<BR>');
                        SMTPMail.AppendBody('We also request you to inform us any challenges you are facing related to the pandemic or other external issues.Any  issues related to change in lead times,');
                        SMTPMail.AppendBody('<BR>');
                        SMTPMail.AppendBody('availability of raw material,obsolescence please inform us well in advance.');
                        SMTPMail.AppendBody('<BR><BR>');
                        SMTPMail.AppendBody('<BR><BR>');
                        SMTPMail.AppendBody('Thanks a lot for your continuous Support.');
                        SMTPMail.AppendBody('<BR><BR>');
                        SMTPMail.AppendBody('<BR><BR>');
                        SMTPMail.AppendBody('Regards,');
                        SMTPMail.AppendBody('<BR>');
                        SMTPMail.AppendBody('Anvesh Dasari');
                        SMTPMail.AppendBody('<BR>');
                        SMTPMail.AppendBody('Vice President');
                        SMTPMail.AppendBody('<BR>');
                        SMTPMail.AppendBody('Cell No :+919849051177');
                        SMTPMail.AppendBody('<BR>');
                        SMTPMail.AppendBody('EfftronicsSystems Pvt. Ltd.,');
                        SMTPMail.AppendBody('<BR>');
                        SMTPMail.AppendBody('40-15-9,Brundavan Colony,');
                        SMTPMail.AppendBody('<BR>');
                        SMTPMail.AppendBody('Vijayawada - 520010,');
                        SMTPMail.AppendBody('<BR>');
                        SMTPMail.AppendBody('Andhra Pradesh, India.');
                        SMTPMail.AppendBody('<BR>');
                        SMTPMail.AppendBody('Ph No : 0866-2483375');
                        SMTPMail.AppendBody('<BR>');
                        SMTPMail.AppendBody('Website :<a href="http://www.effe.in/"><b>www.effe.in,</b></a><a href="https://www.efftronics.com/"><b>www.efftronics.com</b></a>');
                        SMTPMail.AppendBody('<BR>');
                        SMTPMail.Send;
                    END;
                    Vendor.Maintenacecommonmail := TRUE;
                    Vendor.MODIFY;
                END;
            UNTIL Vendor.NEXT = 0;
            MESSAGE('completed');
        END;
    end;
}

