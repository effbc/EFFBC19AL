report 50091 "Transfer Order ESPL"
{
    // version B2B 1.0,Rev01

    DefaultLayout = RDLC;
    RDLCLayout = './Transfer Order ESPL.rdlc';
    Caption = 'Transfer Order ESPL';

    dataset
    {
        dataitem("Transfer Header";"Transfer Header")
        {
            DataItemTableView = SORTING(No.);
            RequestFilterFields = "No.","Transfer-from Code","Transfer-to Code";
            ReqFilterHeading = 'Transfer Order';
            column(CompanyInfo_Picture;CompanyInfo.Picture)
            {
            }
            column(Comp_GSTRegNo;Comp_GSTRegNo)
            {
            }
            column(Loc_GSTRegNo;Loc_GSTRegNo)
            {
            }
            column(CompanyAddr_1_;CompanyAddr[1])
            {
            }
            column(CompanyAddr_2_;CompanyAddr[2])
            {
            }
            column(CompanyAddr_3_;CompanyAddr[3])
            {
            }
            column(CompanyInfo__Fax_No__;CompanyInfo."Fax No.")
            {
            }
            column(CompanyInfo__Phone_No__;CompanyInfo."Phone No.")
            {
            }
            column(CompanyInfo__E_Mail_;CompanyInfo."E-Mail")
            {
            }
            column(CompanyInfo__Home_Page_;CompanyInfo."Home Page")
            {
            }
            column(Exe_Doc_No;"Transfer Header"."External Document No.")
            {
            }
            column(Transfer_Header__Transfer_from_Code_;"Transfer-from Code")
            {
            }
            column(Transfer_Header__Transfer_from_Name_;"Transfer-from Name")
            {
            }
            column(Transfer_Header__Transfer_to_Code_;"Transfer-to Code")
            {
            }
            column(Transfer_Header__Transfer_to_Name_;"Transfer-to Name")
            {
            }
            column(Transfer_Header__Prod__Order_No__;"Prod. Order No.")
            {
            }
            column(Transfer_Header__Prod__Order_Line_No__;"Prod. Order Line No.")
            {
            }
            column(Transfer_Header__User_ID_;"User ID")
            {
            }
            column(IsGSTApplicable;IsGSTApplicable)
            {
            }
            column(Loc_State_Code;Loc_State_Code)
            {
            }
            column(Loc_State;Loc_State)
            {
            }
            column(FAX_Caption;FAX_CaptionLbl)
            {
            }
            column(Ph_Caption;Ph_CaptionLbl)
            {
            }
            column(E__Mail_Caption;E__Mail_CaptionLbl)
            {
            }
            column(To_Provide_Insight_For_Enhancing_WealthCaption;To_Provide_Insight_For_Enhancing_WealthCaptionLbl)
            {
            }
            column(URL_Caption;URL_CaptionLbl)
            {
            }
            column(StatusCaption;StatusCaptionLbl)
            {
            }
            column(QuantityCaption;QuantityCaptionLbl)
            {
            }
            column(UOMCaption;UOMCaptionLbl)
            {
            }
            column(Shelf_No_Caption;Shelf_No_CaptionLbl)
            {
            }
            column(DescriptionCaption;DescriptionCaptionLbl)
            {
            }
            column(Item_NoCaption;Item_NoCaptionLbl)
            {
            }
            column(S_No_Caption;S_No_CaptionLbl)
            {
            }
            column(Transfer_Order_No_Caption;Transfer_Order_No_CaptionLbl)
            {
            }
            column(ReasonCaption;ReasonCaptionLbl)
            {
            }
            column(Transfer_Line_PriorityCaption;"Transfer Line".FIELDCAPTION(Priority))
            {
            }
            column(Transfer_Header__Transfer_from_Code_Caption;FIELDCAPTION("Transfer-from Code"))
            {
            }
            column(Transfer_Header__Transfer_from_Name_Caption;FIELDCAPTION("Transfer-from Name"))
            {
            }
            column(Transfer_To_Name_Caption;Transfer_To_Name_CaptionLbl)
            {
            }
            column(Transfer_To_Code_Caption;Transfer_To_Code_CaptionLbl)
            {
            }
            column(Transfer_Header__Prod__Order_No__Caption;FIELDCAPTION("Prod. Order No."))
            {
            }
            column(Transfer_Header__Prod__Order_Line_No__Caption;FIELDCAPTION("Prod. Order Line No."))
            {
            }
            column(Requested__By_Caption;Requested__By_CaptionLbl)
            {
            }
            column(StatusCaption_Control1102154028;StatusCaption_Control1102154028Lbl)
            {
            }
            column(QuantityCaption_Control1102154029;QuantityCaption_Control1102154029Lbl)
            {
            }
            column(UOMCaption_Control1102154030;UOMCaption_Control1102154030Lbl)
            {
            }
            column(Shelf_No_Caption_Control1102154031;Shelf_No_Caption_Control1102154031Lbl)
            {
            }
            column(DescriptionCaption_Control1102154032;DescriptionCaption_Control1102154032Lbl)
            {
            }
            column(Item_NoCaption_Control1102154033;Item_NoCaption_Control1102154033Lbl)
            {
            }
            column(S_No_Caption_Control1102154034;S_No_Caption_Control1102154034Lbl)
            {
            }
            column(Transfer_Order_No_Caption_Control1102154035;Transfer_Order_No_Caption_Control1102154035Lbl)
            {
            }
            column(PriorityCaption;PriorityCaptionLbl)
            {
            }
            column(ReasonCaption_Control1102154022;ReasonCaption_Control1102154022Lbl)
            {
            }
            column(Posting_Date;"Transfer Header"."Posting Date")
            {
            }
            column(Waybill;"Transfer Header"."Way Bill No.")
            {
            }
            column(Mode_of_transport;"Transfer Header"."Mode of Transport")
            {
            }
            column(Vehicle_no;"Transfer Header"."Vehicle No.")
            {
            }
            column(Amt_description;Amt_des[1])
            {
            }
            column(Created_Date_TimeCaption;Created_Date_TimeCaptionLbl)
            {
            }
            column(Transfer_Header_No_;"No.")
            {
            }
            dataitem("Transfer Line";"Transfer Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemLinkReference = "Transfer Header";
                DataItemTableView = SORTING(Document No.,Line No.) WHERE(Derived From Line No.=CONST(0));
                RequestFilterFields = "Status.";
                column(Transfer_Line__Item_No__;"Item No.")
                {
                }
                column(Transfer_Line_Quantity;Quantity)
                {
                }
                column(Transfer_Line__Unit_of_Measure_Code_;"Unit of Measure Code")
                {
                }
                column(SLNO;SLNO)
                {
                }
                column(Transfer_Line__Transfer_Line__Description;"Transfer Line".Description)
                {
                }
                column(Transfer_Line__Shelf_No__;"Shelf No.")
                {
                }
                column(Transfer_Line__Status__;"Status.")
                {
                }
                column(Transfer_Line__Document_No__;"Document No.")
                {
                }
                column(Transfer_Line_Reason;Reason)
                {
                }
                column(Transfer_Line_Priority;Priority)
                {
                }
                column(Transfer_Header___Created_Date_Time_;"Transfer Header"."Created Date Time")
                {
                }
                column(Item_NoCaption_Control14;Item_NoCaption_Control14Lbl)
                {
                }
                column(DescriptionCaption_Control17;DescriptionCaption_Control17Lbl)
                {
                }
                column(QuantityCaption_Control19;QuantityCaption_Control19Lbl)
                {
                }
                column(UOMCaption_Control21;UOMCaption_Control21Lbl)
                {
                }
                column(S_No_Caption_Control1102152009;S_No_Caption_Control1102152009Lbl)
                {
                }
                column(Shelf_No_Caption_Control1102152007;Shelf_No_Caption_Control1102152007Lbl)
                {
                }
                column(StatusCaption_Control1102154000;StatusCaption_Control1102154000Lbl)
                {
                }
                column(Transfer_Order_No_Caption_Control1102154003;Transfer_Order_No_Caption_Control1102154003Lbl)
                {
                }
                column(PriorityCaption_Control1102154023;PriorityCaption_Control1102154023Lbl)
                {
                }
                column(ReasonCaption_Control1102154024;ReasonCaption_Control1102154024Lbl)
                {
                }
                column(Created_Date_TimeCaption_Control1102154038;Created_Date_TimeCaption_Control1102154038Lbl)
                {
                }
                column(QuantityCaption_Control1000000039;QuantityCaption_Control1000000039Lbl)
                {
                }
                column(UOMCaption_Control1000000045;UOMCaption_Control1000000045Lbl)
                {
                }
                column(DescriptionCaption_Control1000000046;DescriptionCaption_Control1000000046Lbl)
                {
                }
                column(Item_NoCaption_Control1000000047;Item_NoCaption_Control1000000047Lbl)
                {
                }
                column(S_No_Caption_Control1102152012;S_No_Caption_Control1102152012Lbl)
                {
                }
                column(Transfer_Line__Shelf_No__Caption;FIELDCAPTION("Shelf No."))
                {
                }
                column(StatusCaption_Control1102154001;StatusCaption_Control1102154001Lbl)
                {
                }
                column(Transfer_Order_No_Caption_Control1102154004;Transfer_Order_No_Caption_Control1102154004Lbl)
                {
                }
                column(Transfer_Line_ReasonCaption;FIELDCAPTION(Reason))
                {
                }
                column(PriorityCaption_Control1102154025;PriorityCaption_Control1102154025Lbl)
                {
                }
                column(Transfer_Line_Excise;"Transfer Line"."Excise Amount")
                {
                }
                column(Unit_Price;"Transfer Line"."Transfer Price")
                {
                }
                column(excise_prod_posting_group;"Transfer Line"."Excise Prod. Posting Group")
                {
                }
                column(bed;bed)
                {
                }
                column(bedamt;ROUND(bed_tot,1))
                {
                }
                column(cessamt;ROUND(cess_tot,1))
                {
                }
                column(ecessamt;ROUND(ecess_tot,1))
                {
                }
                column(tot_amt;ROUND(tot_amt,1))
                {
                }
                column(Created_Date_TimeCaption_Control1102154039;Created_Date_TimeCaption_Control1102154039Lbl)
                {
                }
                column(Transfer_Line_Line_No_;"Line No.")
                {
                }
                column(Line_CGST_Amount;ROUND(Line_CGST_Amount,1))
                {
                }
                column(Line_IGST_Amount;ROUND(Line_IGST_Amount,1))
                {
                }
                column(Tot_CGST_Amt;ROUND(Tot_CGST_Amt,1))
                {
                }
                column(Tot_IGST_Amt;ROUND(Tot_IGST_Amt,1))
                {
                }
                column(IGST_Rate;IGST_Rate)
                {
                }
                column(CGST_Rate;CGST_Rate)
                {
                }
                column(HSN;HSN)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    SLNO := SLNO+1;
                    Line_CGST_Amount:=0;
                    Line_IGST_Amount:=0;
                    CGST_Rate:='';
                    IGST_Rate:='';
                    HSN:='';
                    /*ReservationEntry.SETRANGE("Source Type",DATABASE::"Transfer Line");
                    ReservationEntry.SETRANGE("Source ID","Document No.");
                    ReservationEntry.SETRANGE("Source Ref. No.","Line No.");
                     row+=1;
                      entercell(row,1,FORMAT("Transfer Line"."Document No."),FALSE);
                      entercell(row,2,FORMAT("Transfer Line"."Item No."),FALSE);
                      entercell(row,3,"Transfer Line".Description,FALSE);
                      entercell(row,4,FORMAT("Transfer Line"."Unit of Measure Code"),FALSE);
                      entercell(row,5,FORMAT("Transfer Line".Quantity),FALSE);
                      entercell(row,6,FORMAT("Transfer Line"."Status."),FALSE);
                      entercell(row,7,FORMAT("Transfer Line".Reason),FALSE);
                      entercell(row,8,FORMAT("Transfer Line".Priority),FALSE);
                      entercell(row,9,FORMAT("Transfer Header"."Created Date Time"),FALSE);
                    */
                    // Added by Rakesh to calculate the excise values
                    EPS.RESET;
                      EPS.SETRANGE("Excise Bus. Posting Group","Transfer Line"."Excise Bus. Posting Group");
                      EPS.SETRANGE("Excise Prod. Posting Group","Transfer Line"."Excise Prod. Posting Group");
                      IF ("Transfer Header"."Posting Date"<> 0D) THEN
                        EPS.SETRANGE("From Date",0D,"Transfer Header"."Posting Date")
                      ELSE
                        EPS.SETRANGE("From Date",0D,WORKDATE);
                      IF EPS.FIND('+') THEN
                         bed:=EPS."BED %";
                    
                      bedamt := ("Transfer Line".Amount*(bed)/100);
                      IF "Transfer Header"."Posting Date" < DMY2DATE(1,3,2015) THEN        // Modified by Rakesh to effect the new changes in ERP
                      BEGIN
                        cessamt:=(bedamt)*2/100;
                        ecessamt:=(bedamt)*1/100;
                      END
                      ELSE
                      BEGIN
                        cessamt:=0;
                        ecessamt:=0;
                      END;                                      // End by Rakesh
                      bed_tot:=bed_tot+bedamt;
                      cess_tot:=cess_tot+cessamt;
                      ecess_tot:=ecess_tot+ecessamt;
                    
                    IF NOT IsGSTApplicable THEN
                    BEGIN
                      tot_amt:=tot_amt+"Transfer Line".Amount+bedamt+cessamt+ecessamt;
                      tot_amt:=ROUND(tot_amt,1);
                    END;
                    Check.InitTextVariable;
                    Check.FormatNoText(Amt_des,tot_amt,'');
                    // end by Rakesh
                    
                    // >> Pranavi
                    IF IsGSTApplicable THEN
                    BEGIN
                      IF Comp_State_Code <> Loc_State_Code THEN
                      BEGIN
                        IGST_Rate := FORMAT(ROUND("Transfer Line"."GST %",1))+'%';
                        Line_IGST_Amount := ROUND("Transfer Line"."GST Base Amount" * "Transfer Line"."GST %"/100,1);
                        Tot_IGST_Amt+=Line_IGST_Amount;
                      END ELSE
                      BEGIN
                        CGST_Rate := FORMAT(ROUND("Transfer Line"."GST %"/2,1))+'%';
                        Line_CGST_Amount := ROUND("Transfer Line"."GST Base Amount" * ("Transfer Line"."GST %"/2)/100,1);
                        Tot_CGST_Amt+=Line_CGST_Amount;
                      END;
                      HSN:='';
                      IF Item.GET("Transfer Line"."Item No.") THEN
                        HSN:=Item."HSN/SAC Code";
                      tot_amt+="Transfer Line".Amount+"Transfer Line"."Total GST Amount";
                    END;
                    // << Pranavi

                end;

                trigger OnPreDataItem();
                begin
                    SLNO := 0;
                    bedamt:=0;
                    cessamt:=0;
                    ecessamt:=0;
                    tot_amt:=0;
                    bed_tot:=0;
                    cess_tot:=0;
                    ecess_tot:=0;
                    Line_CGST_Amount:=0;
                    Line_IGST_Amount:=0;
                    Tot_CGST_Amt:=0;
                    Tot_IGST_Amt:=0;
                    CGST_Rate:='';
                    IGST_Rate:='';
                    HSN:='';
                end;
            }

            trigger OnAfterGetRecord();
            begin
                  CompanyInfo.GET();
                    FormatAddr.Company(CompanyAddr,CompanyInfo);
                FormatAddr.TransferHeaderTransferFrom(TransferFromAddr,"Transfer Header");
                FormatAddr.TransferHeaderTransferTo(TransferToAddr,"Transfer Header");
                IF CompanyInfo.FIND('-') THEN
                BEGIN
                  CompanyInfo.CALCFIELDS(CompanyInfo.Picture);
                  Comp_GSTRegNo:=CompanyInfo."GST Registration No.";
                  IF StateGRec.GET(CompanyInfo.State) THEN
                    Comp_State_Code:=StateGRec."State Code (GST Reg. No.)";

                END;
                IsGSTApplicable := GSTManagement.IsGSTApplicable(Structure);
                IF Location.GET("Transfer Header"."Transfer-to Code") THEN
                BEGIN
                  Loc_GSTRegNo:=Location."GST Registration No.";
                  IF StateGRec.GET(Location."State Code") THEN
                  BEGIN
                    Loc_State_Code := StateGRec."State Code (GST Reg. No.)";
                    Loc_State := StateGRec.Description;
                  END;
                END;
            end;

            trigger OnPostDataItem();
            begin
                
                /*   entercell(1,1,'TRANSFERORDER NO.',TRUE);
                  entercell(1,2,'ITEM NO.',TRUE);
                  entercell(1,3,'DESCRIPTION',TRUE);
                   entercell(1,4,'UOM',TRUE);
                  entercell(1,5,'QUANTITY',TRUE);
                  entercell(1,6,'STATUS',TRUE);
                  entercell(1,7,'REASON',TRUE);
                  entercell(1,8,'PRIORITY',TRUE);
                  entercell(1,9,'CREATED DATE TIME',TRUE);
                */

            end;

            trigger OnPreDataItem();
            begin
                    row:=1;
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

    trigger OnPostReport();
    begin
        /* TempExcelBuffer.CreateBook('');//B2B
         //TempExcelBuffer.CreateSheet('Transfer Orders','',COMPANYNAME,'');//b2b
         TempExcelBuffer.GiveUserControl;
        */

    end;

    trigger OnPreReport();
    begin
        /*  TempExcelBuffer.DELETEALL;
          CLEAR(TempExcelBuffer);
        */

    end;

    var
        Text000 : Label 'COPY';
        Text001 : Label 'Transfer Order %1';
        Text002 : Label 'Page %1';
        ShipmentMethod : Record "Shipment Method";
        FormatAddr : Codeunit "Format Address";
        TransferFromAddr : array [8] of Text[50];
        TransferToAddr : array [8] of Text[50];
        NoOfCopies : Integer;
        NoOfLoops : Integer;
        CopyText : Text[30];
        DimText : Text[120];
        OldDimText : Text[75];
        ShowInternalInfo : Boolean;
        Continue : Boolean;
        SLNO : Integer;
        Item : Record Item;
        "item name" : Text[30];
        "item name2" : Text[30];
        ReservationEntry : Record "Reservation Entry";
        CompanyInfo : Record "Company Information";
        CompanyAddr : array [8] of Text[50];
        TempExcelBuffer : Record "Excel Buffer";
        row : Integer;
        coloumn : Integer;
        FAX_CaptionLbl : Label 'FAX:';
        Ph_CaptionLbl : Label 'Ph:';
        E__Mail_CaptionLbl : Label 'E- Mail:';
        To_Provide_Insight_For_Enhancing_WealthCaptionLbl : Label 'To Provide Insight For Enhancing Wealth';
        URL_CaptionLbl : Label 'URL:';
        StatusCaptionLbl : Label 'Status';
        QuantityCaptionLbl : Label 'Quantity';
        UOMCaptionLbl : Label 'UOM';
        Shelf_No_CaptionLbl : Label '"Shelf No "';
        DescriptionCaptionLbl : Label 'Description';
        Item_NoCaptionLbl : Label 'Item No';
        S_No_CaptionLbl : Label 'S.No.';
        Transfer_Order_No_CaptionLbl : Label 'Transfer Order No.';
        ReasonCaptionLbl : Label 'Reason';
        Transfer_To_Name_CaptionLbl : Label '<Transfer-To Name>';
        Transfer_To_Code_CaptionLbl : Label '<Transfer-To Code>';
        Requested__By_CaptionLbl : Label 'Requested  By:';
        StatusCaption_Control1102154028Lbl : Label 'Status';
        QuantityCaption_Control1102154029Lbl : Label 'Quantity';
        UOMCaption_Control1102154030Lbl : Label 'UOM';
        Shelf_No_Caption_Control1102154031Lbl : Label '"Shelf No "';
        DescriptionCaption_Control1102154032Lbl : Label 'Description';
        Item_NoCaption_Control1102154033Lbl : Label 'Item No';
        S_No_Caption_Control1102154034Lbl : Label 'S.No.';
        Transfer_Order_No_Caption_Control1102154035Lbl : Label 'Transfer Order No.';
        PriorityCaptionLbl : Label 'Priority';
        ReasonCaption_Control1102154022Lbl : Label 'Reason';
        Created_Date_TimeCaptionLbl : Label 'Created Date Time';
        Item_NoCaption_Control14Lbl : Label 'Item No';
        DescriptionCaption_Control17Lbl : Label 'Description';
        QuantityCaption_Control19Lbl : Label 'Quantity';
        UOMCaption_Control21Lbl : Label 'UOM';
        S_No_Caption_Control1102152009Lbl : Label 'S.No.';
        Shelf_No_Caption_Control1102152007Lbl : Label '"Shelf No "';
        StatusCaption_Control1102154000Lbl : Label 'Status';
        Transfer_Order_No_Caption_Control1102154003Lbl : Label 'Transfer Order No.';
        PriorityCaption_Control1102154023Lbl : Label 'Priority';
        ReasonCaption_Control1102154024Lbl : Label 'Reason';
        Created_Date_TimeCaption_Control1102154038Lbl : Label 'Created Date Time';
        QuantityCaption_Control1000000039Lbl : Label 'Quantity';
        UOMCaption_Control1000000045Lbl : Label 'UOM';
        DescriptionCaption_Control1000000046Lbl : Label 'Description';
        Item_NoCaption_Control1000000047Lbl : Label 'Item No';
        S_No_Caption_Control1102152012Lbl : Label 'S.No.';
        StatusCaption_Control1102154001Lbl : Label 'Status';
        Transfer_Order_No_Caption_Control1102154004Lbl : Label 'Transfer Order No.';
        PriorityCaption_Control1102154025Lbl : Label 'Priority';
        Created_Date_TimeCaption_Control1102154039Lbl : Label 'Created Date Time';
        EPS : Record "Excise Posting Setup";
        bed : Decimal;
        bedamt : Decimal;
        cessamt : Decimal;
        ecessamt : Decimal;
        tot_amt : Decimal;
        Amt_des : array [2] of Text[250];
        Check : Report Check;
        bed_tot : Decimal;
        cess_tot : Decimal;
        ecess_tot : Decimal;
        Comp_GSTRegNo : Code[30];
        Loc_GSTRegNo : Code[30];
        Location : Record Location;
        IsGSTApplicable : Boolean;
        Loc_State_Code : Code[2];
        Loc_State : Code[50];
        Line_CGST_Amount : Decimal;
        Line_IGST_Amount : Decimal;
        Tot_CGST_Amt : Decimal;
        Tot_IGST_Amt : Decimal;
        IGST_Rate : Code[10];
        CGST_Rate : Code[10];
        GSTManagement : Codeunit "GST Management";
        StateGRec : Record State;
        GSTComponent : Record "GST Component";
        Comp_State_Code : Code[2];
        HSN : Code[8];

    [LineStart(5208)]
    procedure entercell(rowno : Integer;columnno : Integer;cellvalue : Text[250];bold : Boolean);
    begin
        /*TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.",rowno);
        TempExcelBuffer.VALIDATE("Column No.",columnno);
        TempExcelBuffer."Cell Value as Text" := cellvalue;
        TempExcelBuffer.Bold:=bold ;
        TempExcelBuffer.INSERT;
        */

    end;

    [LineStart(5217)]
    procedure enterheadings(rowno : Integer;columnno : Integer;cellvalue : Code[50];bold : Boolean);
    begin
        /*TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.",rowno);
        TempExcelBuffer.VALIDATE("Column No.",columnno);
        TempExcelBuffer."Cell Value as Text" := FORMAT(cellvalue);
        TempExcelBuffer.Bold:=bold ;
        TempExcelBuffer.Formula := '';
        TempExcelBuffer.INSERT;
        */

    end;
}

