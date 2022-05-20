report 80026 "Contract Price Update - Test3"
{
    // version NAVW17.00

    DefaultLayout = RDLC;
    RDLCLayout = './Contract Price Update - Test3.rdlc';
    Caption = 'Contract Price Update - Test';

    dataset
    {
        dataitem("Material Issues Header";"Material Issues Header")
        {
            DataItemTableView = SORTING(Field44) ORDER(Ascending) WHERE(Field22=CONST(1));
            RequestFilterFields = Field44,Field2;
            column(MIH_Transfer_fromCode;"Transfer-from Code")
            {
            }
            column(CurrReport_PAGENO;CurrReport.PAGENO)
            {
            }
            column(USERID;USERID)
            {
            }
            column(FORMAT_TODAY_0_4_;FORMAT(TODAY,0,4))
            {
            }
            column(COMPANYNAME;COMPANYNAME)
            {
            }
            column(TODAY__Material_Issues_Header___Released_Date_;TODAY-Table50001."Released Date")
            {
            }
            column(Material_Issues_Header__Released_Date_;"Released Date")
            {
            }
            column(Material_Issues_Header__Transfer_to_Code_;"Transfer-to Code")
            {
            }
            column(Material_Issues_Header__Service_Order_No__;"Service Order No.")
            {
            }
            column(Material_Issues_Header__No__;"No.")
            {
            }
            column(Material_Issues_Header__Required_Date_;"Required Date")
            {
            }
            column(sno;sno)
            {
            }
            column(username;username)
            {
            }
            column(relesedusername;relesedusername)
            {
            }
            column(Material_Issues_Header_Remarks;Remarks)
            {
            }
            column(Material_Issues_Header__No___Control1102154000;"No.")
            {
            }
            column(Material_Issues_Header__Transfer_to_Code__Control1102154002;"Transfer-to Code")
            {
            }
            column(Material_Issues_Header__Proj_Description_;"Proj Description")
            {
            }
            column(Material_Issues_Header__Released_Date__Control1102154006;"Released Date")
            {
            }
            column(TODAY__Material_Issues_Header___Released_Date__Control1102154013;TODAY-Table50001."Released Date")
            {
            }
            column(Material_Issues_Header__Required_Date__Control1102154018;"Required Date")
            {
            }
            column(sno_Control1102154027;sno)
            {
            }
            column(username_Control1102154011;username)
            {
            }
            column(relesedusername_Control1102154026;relesedusername)
            {
            }
            column(Material_Issues_Header_Remarks_Control1102154036;Remarks)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Pending_Material_RequestsCaption;Pending_Material_RequestsCaptionLbl)
            {
            }
            column(DeptCaption;DeptCaptionLbl)
            {
            }
            column(Service_Order_No_Caption;Service_Order_No_CaptionLbl)
            {
            }
            column(Released_DateCaption;Released_DateCaptionLbl)
            {
            }
            column(Released_ByCaption;Released_ByCaptionLbl)
            {
            }
            column(No__Of_Pending_DaysCaption;No__Of_Pending_DaysCaptionLbl)
            {
            }
            column(Req_NoCaption;Req_NoCaptionLbl)
            {
            }
            column(Material_Issues_Header__Required_Date_Caption;FIELDCAPTION("Required Date"))
            {
            }
            column(S_NoCaption;S_NoCaptionLbl)
            {
            }
            column(User_NameCaption;User_NameCaptionLbl)
            {
            }
            column(Material_Issues_Header_RemarksCaption;FIELDCAPTION(Remarks))
            {
            }
            column(DeptCaption_Control1102154003;DeptCaption_Control1102154003Lbl)
            {
            }
            column(Material_Issues_Header__Proj_Description_Caption;FIELDCAPTION("Proj Description"))
            {
            }
            column(Material_Issues_Header__Released_Date__Control1102154006Caption;FIELDCAPTION("Released Date"))
            {
            }
            column(User_NameCaption_Control1102154009;User_NameCaption_Control1102154009Lbl)
            {
            }
            column(No__Of_Pending_DaysCaption_Control1102154012;No__Of_Pending_DaysCaption_Control1102154012Lbl)
            {
            }
            column(Required_DateCaption;Required_DateCaptionLbl)
            {
            }
            column(S_NoCaption_Control1102154021;S_NoCaption_Control1102154021Lbl)
            {
            }
            column(Req_NoCaption_Control1102154022;Req_NoCaption_Control1102154022Lbl)
            {
            }
            column(Released_ByCaption_Control1102154008;Released_ByCaption_Control1102154008Lbl)
            {
            }
            column(RemarksCaption;RemarksCaptionLbl)
            {
            }
            column(Proj_Caption;Proj_CaptionLbl)
            {
            }
            column(MILReleased_DateCaptionLbl;Released_DateCaptionLbl)
            {
            }

            trigger OnAfterGetRecord();
            begin
                //Material Issues Header, Body (5) - OnPreSection()

                "pending Days":=0;
                IF (Table50001."Transfer-from Code"='CS STR')  THEN BEGIN
                  "pending Days":=TODAY-Table50001."Released Date";
                   user.SETRANGE(user."User Name",Table50001."User ID");
                   IF user.FIND('-') THEN
                     username:=user."User Name";
                   user.SETRANGE(user."User Name",Table50001."Released By");
                   IF user.FIND('-') THEN
                   relesedusername:=user."User Name";

                  sno+=1;
                END ELSE
                  CurrReport.SHOWOUTPUT:=FALSE;
                //Material Issues Header, Body (5) - OnPreSection()


                //Material Issues Header, Body (7) - OnPreSection()

                 "pending Days":=0;
                 IF (Table50001."Transfer-from Code"<>'CS STR') THEN
                 BEGIN
                   "pending Days":=TODAY-Table50001."Released Date";
                     sno+=1;
                     user.SETRANGE(user."User Name",Table50001."User ID");
                     IF user.FIND('-') THEN
                       username:=user."User Name";
                     user.SETRANGE(user."User Name",Table50001."Released By");
                     IF user.FIND('-') THEN
                     relesedusername:=user."User Name";

                 END ELSE
                   CurrReport.SHOWOUTPUT:=FALSE;
                //Material Issues Header, Body (7) - OnPreSection()


                //Material Issues Header, Body (7) - OnPostSection()

                IF EXL=TRUE THEN BEGIN
                 row+=1;
                 entercell(row,1,FORMAT(sno),FALSE,TempExcelBuffer."Cell Type" :: Number);
                 entercell(row,2,FORMAT(Table50001."No."),FALSE,TempExcelBuffer."Cell Type" :: Number);
                 entercell(row,3,FORMAT(Table50001."Transfer-to Code"),FALSE,TempExcelBuffer."Cell Type" :: Number);
                 entercell(row,4,FORMAT(Table50001."Proj Description"),FALSE,TempExcelBuffer."Cell Type" :: Text);
                 entercell(row,5,FORMAT(username),FALSE,TempExcelBuffer."Cell Type" :: Text);
                 entercell(row,6,FORMAT(relesedusername),FALSE,TempExcelBuffer."Cell Type" :: Text);
                 entercell(row,7,FORMAT(Table50001."Released Date"),FALSE,TempExcelBuffer."Cell Type" :: Date);
                 entercell(row,8,FORMAT("pending Days"),FALSE,TempExcelBuffer."Cell Type" :: Number);
                 END;
                //Material Issues Header, Body (7) - OnPostSection()
            end;

            trigger OnPreDataItem();
            begin
                 sno:=0;
                IF Table50001.GETFILTER(Table50001."Transfer-from Code")='' THEN
                BEGIN

                  Material_Issue_View:='WHERE(Transfer-from Code=CONST(R&D STR))';
                  Table50001.SETVIEW(Material_Issue_View);
                END;
                 Table50001.SETFILTER(Table50001."Released Date",'<%1',TODAY-1);

                 row:=1;

                IF EXL=TRUE THEN BEGIN
                  entercell(1,1,'sno',TRUE,TempExcelBuffer."Cell Type" :: Text);
                  entercell(1,2,'Requisition no',TRUE,TempExcelBuffer."Cell Type" :: Text);
                  entercell(1,3,'Department',TRUE,TempExcelBuffer."Cell Type" :: Text);
                  entercell(1,4,'PrpjectDescription',TRUE,TempExcelBuffer."Cell Type" :: Text);
                  entercell(1,5,'UserName',TRUE,TempExcelBuffer."Cell Type" :: Text);
                  entercell(1,6,'Released By',TRUE,TempExcelBuffer."Cell Type" :: Text);
                  entercell(1,7,'Relesedate',TRUE,TempExcelBuffer."Cell Type" :: Text);
                  entercell(1,8,'Numberofpendingdays',TRUE,TempExcelBuffer."Cell Type" :: Text);
                END;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    field(Excel;EXL)
                    {
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPostReport();
    begin
        IF EXL =TRUE THEN BEGIN
         TempExcelBuffer.CreateBook('Transfer Orders');
         //TempExcelBuffer.CreateSheet('Transfer Orders','',COMPANYNAME,'');//B2B
         TempExcelBuffer.WriteSheet('Transfer Orders',COMPANYNAME,USERID);
         TempExcelBuffer.OpenExcel;
         TempExcelBuffer.CloseBook;
         TempExcelBuffer.GiveUserControl;
        END;
    end;

    trigger OnPreReport();
    begin
        IF EXL=TRUE THEN
        BEGIN
           TempExcelBuffer.DELETEALL;
          CLEAR(TempExcelBuffer);
            END;
    end;

    var
        Text000 : Label 'You must fill in the Price Update % field.';
        Text001 : Label 'The price update % is unusually large.\\Confirm that this is the correct percentage.';
        Text002 : Label 'The program has stopped the batch job at your request.';
        Text003 : Label 'You must fill in the Update to Date field.';
        Text005 : Label 'Error. The price update period is empty.';
        "pending Days" : Integer;
        Material_Issue_View : Text[1000];
        sno : Integer;
        user : Record User;
        username : Text[50];
        relesedusername : Text[50];
        TempExcelBuffer : Record "Excel Buffer";
        row : Integer;
        coloumn : Integer;
        EXL : Boolean;
        CurrReport_PAGENOCaptionLbl : Label 'Page';
        Pending_Material_RequestsCaptionLbl : Label 'Pending Material Requests';
        DeptCaptionLbl : Label 'Dept';
        Service_Order_No_CaptionLbl : Label 'Service Order No.';
        Released_DateCaptionLbl : Label 'Released Date';
        Released_ByCaptionLbl : Label 'Released By';
        No__Of_Pending_DaysCaptionLbl : Label 'No. Of Pending Days';
        Req_NoCaptionLbl : Label 'Req.No';
        S_NoCaptionLbl : Label 'S.No';
        User_NameCaptionLbl : Label 'User Name';
        DeptCaption_Control1102154003Lbl : Label 'Dept';
        User_NameCaption_Control1102154009Lbl : Label 'User Name';
        No__Of_Pending_DaysCaption_Control1102154012Lbl : Label 'No. Of Pending Days';
        Required_DateCaptionLbl : Label 'Required Date';
        S_NoCaption_Control1102154021Lbl : Label 'S.No';
        Req_NoCaption_Control1102154022Lbl : Label 'Req.No';
        Released_ByCaption_Control1102154008Lbl : Label 'Released By';
        RemarksCaptionLbl : Label 'Remarks';
        Proj_CaptionLbl : Label 'Proj Description';

    [LineStart(17936)]
    procedure InitVariables(LocakPriceUpdPct : Decimal;LocalUpdateToDate : Date);
    begin
    end;

    [LineStart(17939)]
    procedure entercell(rowno : Integer;columnno : Integer;cellvalue : Text[250];bold : Boolean;CellType : Option);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.",rowno);
        TempExcelBuffer.VALIDATE("Column No.",columnno);
        TempExcelBuffer."Cell Value as Text" := cellvalue;
        TempExcelBuffer.Bold:=bold ;
        TempExcelBuffer.INSERT;
    end;

    [LineStart(17947)]
    procedure enterheadings(rowno : Integer;columnno : Integer;cellvalue : Code[50];bold : Boolean;CellType : Option);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.",rowno);
        TempExcelBuffer.VALIDATE("Column No.",columnno);
        TempExcelBuffer."Cell Value as Text" := FORMAT(cellvalue);
        TempExcelBuffer.Bold:=bold ;
        TempExcelBuffer.Formula := '';
        TempExcelBuffer.INSERT;
    end;
}

