report 50241 Purchase_order_mails
{
    // version Rev01,Eff02

    DefaultLayout = RDLC;
    RDLCLayout = './Purchase_order_mails.rdlc';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = SORTING(Document Type, Buy-from Vendor No., No.) ORDER(Ascending) WHERE(Mail_Sent = FILTER(No), Document Type=FILTER(Order),Status=FILTER(Released));
            RequestFilterFields = "Buy-from Vendor No.","No.","Order Date";
            column(Purchase_Header__Purchase_Header___No__;"Purchase Header"."No.")
            {
            }
            column(Purchase_Header_Document_Type;"Document Type")
            {
            }

            trigger OnAfterGetRecord();
            begin
                I:=1;
                PH.RESET;
                PH.INIT;
                PH."Document Type":=1;
                PH."No.":="Purchase Header"."No.";
                PH.INSERT;
                Mail_From:='erp@efftronics.com';
                Mail_To:='Purchase@Efftronics.com,ramkumarl@efftronics.com';
                //Mail_To:=VENDOR."E-Mail";
                fname:='';
                flag:=FALSE;
                IF temp_str='' THEN
                BEGIN
                  temp_str:="Buy-from Vendor No.";
                  temp_str_vname:="Purchase Header"."Buy-from Vendor Name";
                END;
                
                  IF temp_str<>"Buy-from Vendor No." THEN
                  BEGIN
                    SMTP_MAIL.Send;
                    PH.RESET;
                    IF PH.FINDFIRST THEN
                    REPEAT
                      PurchaseHeader.RESET;
                      PurchaseHeader.SETFILTER(PurchaseHeader."No.",PH."No.");
                      IF PurchaseHeader.FINDFIRST THEN
                      BEGIN
                        PurchaseHeader.Mail_Sent:=TRUE;
                        PurchaseHeader.MODIFY;
                      END;
                    UNTIL PH.NEXT=0;
                    PH.DELETEALL;
                    MESSAGE('Mail has been Sent To '+temp_str_vname);
                    temp_str:="Buy-from Vendor No.";
                     temp_str_vname:="Purchase Header"."Buy-from Vendor Name";
                  END;
                
                  str:='';
                  str:="No.";
                  WHILE STRPOS(str,'/') > 1 DO BEGIN
                    fname:=fname+COPYSTR(str,1,STRPOS(str,'/')-1)+'_';
                    str := COPYSTR(str,STRPOS(str,'/') + 1);
                  END;
                  fname:=fname+str;
                
                  IF ISCLEAR(Bullzippdf) THEN
                  CREATE(Bullzippdf,FALSE,TRUE);
                      PurchaseHeader.RESET;
                      PurchaseHeader.SETFILTER(PurchaseHeader."No.","No.");
                
                  FileDirectory :='\\erpserver\ErpAttachments\PurchaseOrders\';
                  Window.OPEN('PREPARING THE REPORT');
                  FileName :=fname+'.pdf';
                  Bullzippdf.Init;
                  Bullzippdf.LoadSettings;
                  RunOnceFile := Bullzippdf.GetSettingsFileName(TRUE);
                  Bullzippdf.SetValue('Output',FileDirectory+FileName);
                  Bullzippdf.SetValue('Showsettings', 'never');
                  Bullzippdf.SetValue('ShowPDF', 'no');
                  Bullzippdf.SetValue('ShowProgress', 'no');
                  Bullzippdf.SetValue('ShowProgressFinished', 'no');
                  Bullzippdf.SetValue('SuppressErrors', 'yes');
                  Bullzippdf.SetValue('ConfirmOverwrite', 'no');
                  Bullzippdf.WriteSettings(TRUE);
                  REPORT.RUNMODAL(50058,FALSE,FALSE,PurchaseHeader);
                  TimeOut := 0;
                
                  WHILE EXISTS(RunOnceFile) AND (TimeOut < 10) DO
                  BEGIN
                    SLEEP(2000);
                    TimeOut := TimeOut + 1;
                  END;
                  Window.CLOSE;
                
                  attachment:=FileDirectory+FileName;
                  /*
                  fil.OPEN(attachment);
                  fileLen:=fil.LEN;
                  fil.CLOSE;
                  */
                  //MESSAGE(FORMAT(fileLen));
                
                  Subject:='Reg : Purchase order(s) from Efftronics';
                  Body:='<HTML><BODY>Dear Sir,<BR>';
                  Body+='<BR><PRE>  Please find the attachment for purchase order and arrange the material at the earliest</PRE>';
                  Body+='<PRE><B>and send the order acknowledgment by return mail (without fail ).</B></PRE>';
                  Body+='<PRE>             ****  Automatic Mail Generated From ERP  ****</PRE></BODY></HTML>';
                
                  SMTP_MAIL.CreateMessage('EFF',Mail_From,Mail_To,Subject,Body,TRUE);
                  SMTP_MAIL.AddAttachment(attachment);
                
                
                    //SLEEP(5000);

            end;

            trigger OnPostDataItem();
            begin
                IF I=1  THEN
                BEGIN
                  SMTP_MAIL.Send;

                  PH.RESET;
                  IF PH.FINDFIRST THEN
                  REPEAT
                    PurchaseHeader.RESET;
                    PurchaseHeader.SETFILTER(PurchaseHeader."No.",PH."No.");
                    IF PurchaseHeader.FINDFIRST THEN
                    BEGIN
                      PurchaseHeader.Mail_Sent:=TRUE;
                      PurchaseHeader.MODIFY;
                    END;
                  UNTIL PH.NEXT=0;
                  PH.DELETEALL;
                   MESSAGE('Mail has been Sent To '+temp_str_vname);
                END;
            end;

            trigger OnPreDataItem();
            begin
                I:=0;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        PurchaseHeader : Record "Purchase Header";
        fname : Text[30];
        Bullzippdf : Automation "'{61CB5BFA-AFE6-4B0F-A4BB-7F3D4999EE52}' 3.2:'{BEBDC1DF-D793-4F6C-B8FF-E831A1C2595C}':''{61CB5BFA-AFE6-4B0F-A4BB-7F3D4999EE52}' 3.2'.Unknown Class";
        str : Text[30];
        flag : Boolean;
        oname : Text[30];
        FileDirectory : Text[100];
        FileName : Text[100];
        Window : Dialog;
        RunOnceFile : Text[1000];
        TimeOut : Integer;
        attachment : Text[1000];
        SMTPSETUP : Record "SMTP SETUP";
        AttachFileName : Text[1000];
        Mail_From : Text[250];
        Mail_To : Text[250];
        Body : Text[1000];
        Subject : Text[250];
        SMTP_MAIL : Codeunit "SMTP Mail";
        temp_str : Text[30];
        PH : Record "Purchase Header" temporary;
        I : Integer;
        temp_str_vname : Text[30];
        fileLen : Integer;
        fil : File;
}

