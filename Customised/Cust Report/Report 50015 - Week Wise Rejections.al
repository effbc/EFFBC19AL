report 50015 "Week Wise Rejections"
{
    // version B2B1.0,EFFUPG

    // PROJECT : Efftronics
    // *********************************************************************
    // SIGN
    // *********************************************************************
    // B2B     : B2B Software Technologies
    // *********************************************************************
    // VER                  SIGN       USERID                 DATE          DESCRIPTION
    // *********************************************************************
    // 1.0                   B2B       Srinivas banny         07-aug-13    ->Report Created For Posted Inspection Datasheets Details & related Inspection receipts data in both Report and Excel
    DefaultLayout = RDLC;
    RDLCLayout = './Week Wise Rejections.rdlc';


    dataset
    {
        dataitem("Posted Inspect DatasheetHeader"; "Posted Inspect DatasheetHeader")
        {
            DataItemTableView = SORTING(Inspection Receipt No., Item No.) ORDER(Ascending) WHERE(Source Type=CONST(In Bound));
            RequestFilterFields = "Posting Date", "Vendor No.", "Item No.";
            column(WORKDATE; FORMAT(WORKDATE))
            {
            }
            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(CompanyPicture; CompanyInfo.Picture)
            {
            }
            column("filter"; filter)
            {
            }
            column(j; j)
            {
            }
            column(Posted_Inspect_DatasheetHeader__Vendor_Name_; "Vendor Name")
            {
            }
            column(Posted_Inspect_DatasheetHeader__Item_Description_; "Item Description")
            {
            }
            column(Actual_Lot_; "Actual Lot")
            {
            }
            column(Posted_Inspect_DatasheetHeader__Posted_Inspect_DatasheetHeader__Quantity; "Posted Inspect DatasheetHeader".Quantity)
            {
            }
            column(sno; sno)
            {
            }
            column(Accepted_Quantity_; "Accepted Quantity")
            {
            }
            column(Per__Of_REJ_; "Per. Of REJ")
            {
            }
            column(Posted_Inspect_DatasheetHeader__Posted_Inspect_DatasheetHeader___Unit_Of_Measure_Code_; "Posted Inspect DatasheetHeader"."Unit Of Measure Code")
            {
            }
            column(Posted_Inspect_DatasheetHeader__Item_No__; "Item No.")
            {
            }
            column(Posted_Inspect_DatasheetHeader_Quantity; Quantity)
            {
            }
            column(Posted_Inspect_DatasheetHeader__Order_No__; "Order No.")
            {
            }
            column(S_NoCaption; S_NoCaptionLbl)
            {
            }
            column(Vendor_NameCaption; Vendor_NameCaptionLbl)
            {
            }
            column(ItemCaption; ItemCaptionLbl)
            {
            }
            column(Rjctd_QtyCaption; Rjctd_QtyCaptionLbl)
            {
            }
            column(Lot_No_Caption; Lot_No_CaptionLbl)
            {
            }
            column(Tot_QtyCaption; Tot_QtyCaptionLbl)
            {
            }
            column(Acptd_QtyCaption; Acptd_QtyCaptionLbl)
            {
            }
            column(Of__RejectionCaption; Of__RejectionCaptionLbl)
            {
            }
            column(UOMCaption; UOMCaptionLbl)
            {
            }
            column(Inspection_Receipt_Header__Nature_Of_Rejection_Caption; "Inspection Receipt Header"."Reason Description")
            {
            }
            column(Posted_Inspect_DatasheetHeader__Item_No__Caption; FIELDCAPTION("Item No."))
            {
            }
            column(Posted_Inspect_DatasheetHeader__Order_No__Caption; FIELDCAPTION("Order No."))
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(Posted_Inspect_DatasheetHeader_No_; "No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                j := 0;
                "max Qty" := 0;
                IF STRLEN("Posted Inspect DatasheetHeader"."Lot No.") = 11 THEN BEGIN
                    cod := COPYSTR("Posted Inspect DatasheetHeader"."Lot No.", 11);
                    IF cod = 'R' THEN BEGIN
                        "Rejected Lots"[i] := "Posted Inspect DatasheetHeader"."Lot No.";
                        j := 1;
                        "item desc" := "Posted Inspect DatasheetHeader"."Item Description";

                        "Actual Lot" := DELSTR("Posted Inspect DatasheetHeader"."Lot No.", 11);

                        qle.SETRANGE(qle."Lot No.", "Actual Lot");
                        qle.SETRANGE(qle."Item No.", "Posted Inspect DatasheetHeader"."Item No.");
                        IF qle.FIND('-') THEN BEGIN
                            "max Qty" := qle.Quantity;
                        END;
                        IF "max Qty" = 0 THEN
                            "max Qty" := "Posted Inspect DatasheetHeader".Quantity;
                    END;
                END;
                ////Sections Code B2B1.0>>

                IF (j = 1) THEN BEGIN
                    sno := sno + 1;
                    "Accepted Quantity" := "max Qty" - "Posted Inspect DatasheetHeader".Quantity;
                END;
                ////Sections Code B2B1.0<<
            end;

            trigger OnPreDataItem();
            begin
                //B2B1.0>>
                CompanyInfo.GET;
                CompanyInfo.CALCFIELDS(Picture);
                filter := "Posted Inspect DatasheetHeader".GETFILTERS;
                //B2B1.0<<
                IF EXCEL THEN BEGIN
                    CLEAR(Tempexcelbuffer);
                    Tempexcelbuffer.DELETEALL;
                END;


                i := 1;
                IF filter <> '' THEN BEGIN
                    min := "Posted Inspect DatasheetHeader".GETRANGEMIN("Posted Inspect DatasheetHeader"."Posting Date");
                    max := "Posted Inspect DatasheetHeader".GETRANGEMAX("Posted Inspect DatasheetHeader"."Posting Date");
                    cnt := "Posted Inspect DatasheetHeader".COUNT;
                    IF ("Posted Inspect DatasheetHeader".GETFILTER("Posted Inspect DatasheetHeader"."Vendor No.")) <> '' THEN
                        vendor := "Posted Inspect DatasheetHeader".GETFILTER("Posted Inspect DatasheetHeader"."Vendor No.");
                    IF ("Posted Inspect DatasheetHeader".GETFILTER("Posted Inspect DatasheetHeader"."Item No.")) <> '' THEN
                        Item := "Posted Inspect DatasheetHeader".GETFILTER("Posted Inspect DatasheetHeader"."Item No.");
                END;
                IF EXCEL THEN BEGIN
                    Row += 1;
                    EnterHeadings(Row, 1, 'SNO', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 2, 'PURCHASE ORDER NO', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 3, 'VENDOR NAME', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 4, 'ITEM NO', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 5, 'ITEM DESCRIPTION', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 6, 'UNIT OF MEASEURE', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 7, 'ACCEPTED QUANTITY', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 8, 'REJECTED QUNATITY', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 9, 'TOTAL QUANTITY', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 10, 'PER OF REJECTION', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 11, 'TYPE OF REJECTION', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 12, 'MAKE', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 13, 'VENDOR NO', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 14, 'LOT NO.', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    // EnterHeadings(Row,15,'NATURE OF REJECTION',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 15, 'REJECTION REASON', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 16, 'PRODUCT GROUP CODE', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 17, 'REJECTION DATE', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    // added by vishnu on 02-05-2019
                    EnterHeadings(Row, 18, 'NATURE OF REJECTION', TRUE, Tempexcelbuffer."Cell Type"::Text);

                END;
            end;
        }
        dataitem("Inspection Receipt Header"; "Inspection Receipt Header")
        {
            DataItemTableView = WHERE(Source Type=CONST(In Bound),Status=CONST(Yes),Qty. Rejected=FILTER(>0));
            column(Inspection_Receipt_Header__Vendor_Name_;"Vendor Name")
            {
            }
            column(sno_Control1000000024;sno)
            {
            }
            column(Inspection_Receipt_Header__Lot_No__;"Lot No.")
            {
            }
            column(Inspection_Receipt_Header__Item_Description_;"Item Description")
            {
            }
            column(Inspection_Receipt_Header__Qty__Accepted_;"Qty. Accepted")
            {
            }
            column(Rej_Category;"Rejection Category")
            {
            }
            column(Inspection_Receipt_Header__Nature_Of_Rejection_;"Reason Description")
            {
            }
            column(Inspection_Receipt_Header__Item_No__;"Item No.")
            {
            }
            column(Inspection_Receipt_Header_Quantity;Quantity)
            {
            }
            column(Inspection_Receipt_Header__Qty__Rejected_;"Qty. Rejected")
            {
            }
            column(Inspection_Receipt_Header__Inspection_Receipt_Header___Unit_Of_Measure_Code_;"Inspection Receipt Header"."Unit Of Measure Code")
            {
            }
            column(Inspection_Receipt_Header__Order_No__;"Order No.")
            {
            }
            column(PPM;PPM)
            {
            }
            column(totqty;totqty)
            {
            }
            column(rejqty;rejqty)
            {
            }
            column(rejper;rejper)
            {
            }
            column(EmptyStringCaption_Control1102154013;EmptyStringCaption_Control1102154013Lbl)
            {
            }
            column(Vendor_Item__PPMCaption;Vendor_Item__PPMCaptionLbl)
            {
            }
            column(Total_QtyCaption;Total_QtyCaptionLbl)
            {
            }
            column(Total_Rejected_QtyCaption;Total_Rejected_QtyCaptionLbl)
            {
            }
            column(Total_Rejected__Caption;Total_Rejected__CaptionLbl)
            {
            }
            column(EmptyStringCaption_Control1102154010;EmptyStringCaption_Control1102154010Lbl)
            {
            }
            column(Inspection_Receipt_Header_No_;"No.")
            {
            }
            column(PerRejection;"Per. Of REJ")
            {
            }

            trigger OnAfterGetRecord();
            begin
                /*IF NOT (("Inspection Receipt Header"."Qty. Accepted">0) AND ("Inspection Receipt Header"."Qty. Rejected">0)) THEN
                CurrReport.SKIP;*/
                
                
                ////Sections Code>>
                
                sno:=sno+1;
                totqty:=totqty+"Inspection Receipt Header".Quantity;
                totacc:=totacc+"Inspection Receipt Header"."Qty. Accepted";
                rejqty:=rejqty+"Inspection Receipt Header"."Qty. Rejected";
                PPM:=(rejqty/totqty)*1000000;
                
                CurrReport.SHOWOUTPUT("Inspection Receipt Header"."Qty. Rejected" >0);
                "Per. Of REJ":=ROUND(("Inspection Receipt Header"."Qty. Rejected"/"Inspection Receipt Header".Quantity)*100);
                Row+=1;
                IF EXCEL=TRUE THEN
                BEGIN
                  Entercell(Row,1,FORMAT(sno),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  Entercell(Row,2,FORMAT("Inspection Receipt Header"."Order No."),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  Entercell(Row,3,"Inspection Receipt Header"."Vendor Name",FALSE,Tempexcelbuffer."Cell Type"::Text);
                  Entercell(Row,4,"Inspection Receipt Header"."Item No.",FALSE,Tempexcelbuffer."Cell Type"::Text);
                  Entercell(Row,5,"Inspection Receipt Header"."Item Description",FALSE,Tempexcelbuffer."Cell Type"::Text);
                  Entercell(Row,6,"Inspection Receipt Header"."Unit Of Measure Code",FALSE,Tempexcelbuffer."Cell Type"::Text);
                  Entercell(Row,7,FORMAT("Inspection Receipt Header"."Qty. Accepted"),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  Entercell(Row,8,FORMAT("Inspection Receipt Header"."Qty. Rejected"),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  Entercell(Row,9,FORMAT("Inspection Receipt Header".Quantity),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  Entercell(Row,10,FORMAT("Per. Of REJ")+'%',FALSE,Tempexcelbuffer."Cell Type"::Text);
                  Entercell(Row,11,FORMAT("Inspection Receipt Header"."Rejection Category"),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  //Entercell(Row,15,FORMAT("Inspection Receipt Header"."Nature Of Rejection"),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  Entercell(Row,13,"Inspection Receipt Header"."Vendor No.",FALSE,Tempexcelbuffer."Cell Type"::Text);
                  Entercell(Row,14,"Inspection Receipt Header"."Lot No.",FALSE,Tempexcelbuffer."Cell Type"::Text);
                  Entercell(Row,12,"Inspection Receipt Header".Make,FALSE,Tempexcelbuffer."Cell Type"::Text);
                  ITEM1.RESET;
                  IF ITEM1.GET("Inspection Receipt Header"."Item No.") THEN
                    Entercell(Row,16,ITEM1."Product Group Code",FALSE,Tempexcelbuffer."Cell Type"::Text);
                  Entercell(Row,17,FORMAT("Posting Date"),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  Entercell(Row,15,FORMAT("Reason Description"),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  // ADDED BY VISHNU ON 02-05-2019
                  Entercell(Row,18,FORMAT("Inspection Receipt Header"."Nature Of Rejection"),FALSE,Tempexcelbuffer."Cell Type"::Text);
                END;
                
                ///Sections Code<<

            end;

            trigger OnPostDataItem();
            begin

                rejper:=(rejqty/totqty)*100;
                IF EXCEL THEN BEGIN
                  Row+=2;
                  EnterHeadings(Row,5,'TOTAL QUANTITY',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row+1,5,'TOTAL REJECTED QTY',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row+2,5,'TOTAL REJECTED %',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row+3,5,'VENDOR/ITEM PPM',TRUE,Tempexcelbuffer."Cell Type"::Text);
                  Entercell(Row,6,FORMAT(totqty),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  Entercell(Row+1,6,FORMAT(rejqty),FALSE,Tempexcelbuffer."Cell Type"::Text);
                  Entercell(Row+2,6,FORMAT(rejper)+'%',FALSE,Tempexcelbuffer."Cell Type"::Text);
                  Entercell(Row+3,6,FORMAT(PPM),FALSE,Tempexcelbuffer."Cell Type"::Text);
                END;
            end;

            trigger OnPreDataItem();
            begin
                IF max=0D THEN
                BEGIN
                  max:=WORKDATE;
                  min:=040107D;
                END;
                "Inspection Receipt Header".SETRANGE("Inspection Receipt Header"."Posting Date",min,max);
                IF  vendor<>'' THEN
                BEGIN
                  "Inspection Receipt Header".SETRANGE("Inspection Receipt Header"."Vendor No.",vendor);
                  IF "Inspection Receipt Header"."Qty. Rejected"=0 THEN BEGIN
                    rejqty:=0;
                    "Per. Of REJ":=0;
                    PPM:=0;
                  END
                  ELSE
                    "Inspection Receipt Header".SETRANGE("Inspection Receipt Header"."Qty. Rejected",1,10000000);
                END;

                IF Item<>'' THEN
                BEGIN
                  "Inspection Receipt Header".SETRANGE("Inspection Receipt Header"."Item No.",Item);
                  IF "Inspection Receipt Header"."Qty. Rejected"=0 THEN BEGIN
                    rejqty:=0;
                    "Per. Of REJ":=0;
                    PPM:=0;
                  END
                  ELSE
                    "Inspection Receipt Header".SETRANGE("Inspection Receipt Header"."Qty. Rejected",1,10000000);
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
                    field(Excel;EXCEL)
                    {
                        Caption = 'Excel';
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
        IF EXCEL THEN BEGIN
          /*
          Tempexcelbuffer.CreateBook('PER OF REJ',''); //EFFUPG
          Tempexcelbuffer.WriteSheet('PER OF REJ',COMPANYNAME,USERID);
          Tempexcelbuffer.CloseBook; //Rev01
          Tempexcelbuffer.OpenExcel; //Rev01
          Tempexcelbuffer.GiveUserControl;
          */
          Tempexcelbuffer.CreateBookAndOpenExcel('','PER OF REJ','PER OF REJ',COMPANYNAME,USERID); //EFFUPG
        END;

    end;

    var
        "Rejected Lots" : array [100] of Code[15];
        i : Integer;
        cod : Code[10];
        "filter" : Text[200];
        j : Integer;
        hhh : array [100] of Integer;
        "Actual Lot" : Code[10];
        "item desc" : Text[30];
        "max Qty" : Decimal;
        qle : Record "Quality Ledger Entry";
        sno : Integer;
        "Accepted Quantity" : Integer;
        "max" : Date;
        "min" : Date;
        "Per. Of REJ" : Decimal;
        vendor : Text[30];
        totqty : Decimal;
        PPM : Decimal;
        rejqty : Decimal;
        Item : Code[50];
        Tempexcelbuffer : Record "Excel Buffer" temporary;
        EXCEL : Boolean;
        Row : Integer;
        totacc : Decimal;
        cnt : Integer;
        rejper : Decimal;
        ITEM1 : Record Item;
        S_NoCaptionLbl : Label 'S.No';
        Vendor_NameCaptionLbl : Label 'Vendor Name';
        ItemCaptionLbl : Label 'Item';
        Rjctd_QtyCaptionLbl : Label 'Rjctd Qty';
        Lot_No_CaptionLbl : Label 'Lot No.';
        Tot_QtyCaptionLbl : Label 'Tot Qty';
        Acptd_QtyCaptionLbl : Label 'Acptd Qty';
        Of__RejectionCaptionLbl : Label '" % Of  Rejection"';
        UOMCaptionLbl : Label 'UOM';
        EmptyStringCaptionLbl : Label '%';
        EmptyStringCaption_Control1102154013Lbl : Label '%';
        Vendor_Item__PPMCaptionLbl : Label 'Vendor/Item  PPM';
        Total_QtyCaptionLbl : Label 'Total Qty';
        Total_Rejected_QtyCaptionLbl : Label 'Total Rejected Qty';
        Total_Rejected__CaptionLbl : Label 'Total Rejected %';
        EmptyStringCaption_Control1102154010Lbl : Label '%';
        CompanyInfo : Record "Company Information";

    (534)]
    procedure Entercell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[1000];bold : Boolean;CellType : Option);
    begin

        Tempexcelbuffer.INIT;
        Tempexcelbuffer.VALIDATE("Row No.",RowNo);
        Tempexcelbuffer.VALIDATE("Column No.",ColumnNo);
        Tempexcelbuffer."Cell Value as Text" := CellValue;
        Tempexcelbuffer.Bold:=bold ;
        Tempexcelbuffer."Cell Type":=CellType;
        Tempexcelbuffer.INSERT;
    end;

    (544)]
    procedure EnterHeadings(RowNo : Integer;ColumnNo : Integer;CellValue : Text[100];Bold : Boolean;CellType : Option);
    begin
        Tempexcelbuffer.INIT;
        Tempexcelbuffer.VALIDATE("Row No.",RowNo);
        Tempexcelbuffer.VALIDATE("Column No.",ColumnNo);
        Tempexcelbuffer."Cell Value as Text" := FORMAT(CellValue);
        Tempexcelbuffer.Bold:=Bold ;
        Tempexcelbuffer."Cell Type":=CellType;
        Tempexcelbuffer.Formula := '';
        Tempexcelbuffer.INSERT;
    end;
}

