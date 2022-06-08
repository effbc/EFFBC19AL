report 33000258 "Period Wise Supplier Details"
{
    // version QC1.0,EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './Period Wise Supplier Details.rdlc';

    dataset
    {
        dataitem("Inspection Receipt Header"; "Inspection Receipt Header")
        {
            DataItemTableView = SORTING(Vendor No., Item No.) ORDER(Ascending) WHERE(Status = FILTER(Yes), Source Type=FILTER(In Bound));
            RequestFilterFields = "Posting Date","Vendor No.";
            column(WORKDATE;WORKDATE)
            {
            }
            column(USERID;USERID)
            {
            }
            column(item;item)
            {
            }
            column(rejqty;rejqty)
            {
            }
            column(inwqty;inwqty)
            {
            }
            column(Inspection_Receipt_Header__Inspection_Receipt_Header___Vendor_Name_;"Inspection Receipt Header"."Vendor Name")
            {
            }
            column(Inspection_Receipt_Header__Inspection_Receipt_Header__Quantity;"Inspection Receipt Header".Quantity)
            {
            }
            column(Inspection_Receipt_Header__Inspection_Receipt_Header___Qty__Rejected_;"Inspection Receipt Header"."Qty. Rejected")
            {
            }
            column(Period_Wise_Vendor_DetailsCaption;Period_Wise_Vendor_DetailsCaptionLbl)
            {
            }
            column(Vendor_NameCaption;Vendor_NameCaptionLbl)
            {
            }
            column(Rejected_QtyCaption;Rejected_QtyCaptionLbl)
            {
            }
            column(Item_DescriptionCaption;Item_DescriptionCaptionLbl)
            {
            }
            column(Inward_QtyCaption;Inward_QtyCaptionLbl)
            {
            }
            column(Total_Rejected_QtyCaption;Total_Rejected_QtyCaptionLbl)
            {
            }
            column(Total_QtyCaption;Total_QtyCaptionLbl)
            {
            }
            column(Inspection_Receipt_Header_No_;"No.")
            {
            }
            column(Inspection_Receipt_Header_Vendor_No_;"Vendor No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                /*IF Status = Status::"0" THEN
                  AccptQty := Quantity
                ELSE IF Status = Status::"1" THEN
                  RejQty := Quantity;
                IF (Status = Status::"0") OR (Status = Status::"1") THEN BEGIN
                   UnderProgQty := 0;
                   TotalQty := AccptQty + RejQty;
                END;
                IF TotalQty = 0 THEN;
                IF Status = Status::"0" THEN BEGIN
                  UnderProgQty := Quantity;
                  AccptQty :=0;
                  RejQty :=0;
                  TotalQty := UnderProgQty+AccptQty+RejQty;
                END;
                Accpt :=  (AccptQty/TotalQty)*100;
                Rej := (RejQty/TotalQty)*100;*/

            end;

            trigger OnPreDataItem();
            begin
                  /* CompInfo.GET;
                   CompAddr[1] := CompInfo.Name;
                   CompAddr[2] := CompInfo.Address;
                   CompAddr[3] := CompInfo."Address 2";
                   CompAddr[4] := CompInfo.City;   COMPRESSARRAY(CompAddr);*/
                
                
                 IF excel THEN
                 BEGIN
                 CLEAR(Tempexcelbuffer);
                 Tempexcelbuffer.DELETEALL;
                 END;
                 Row:=1;

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

        IF excel THEN
        BEGIN
          Tempexcelbuffer.CreateBook('','');//B2B //EFFUPG
          //Tempexcelbuffer.CreateSheet('Details of vendor','',COMPANYNAME,'');//B2B
          Tempexcelbuffer.GiveUserControl;
        END
    end;

    var
        qty : Decimal;
        inwqty : Integer;
        rejqty : Integer;
        item : Text[50];
        vend : Text[50];
        vendorname : Text[50];
        totalqty : Decimal;
        totalrejqty : Decimal;
        IR : Record "Inspection Receipt Header" temporary;
        excel : Boolean;
        Tempexcelbuffer : Record "Excel Buffer";
        Row : Integer;
        row1 : Integer;
        Row_No : Integer;
        Period_Wise_Vendor_DetailsCaptionLbl : Label 'Period Wise Vendor Details';
        Vendor_NameCaptionLbl : Label 'Vendor Name';
        Rejected_QtyCaptionLbl : Label 'Rejected Qty';
        Item_DescriptionCaptionLbl : Label 'Item Description';
        Inward_QtyCaptionLbl : Label 'Inward Qty';
        Total_Rejected_QtyCaptionLbl : Label 'Total Rejected Qty';
        Total_QtyCaptionLbl : Label 'Total Qty';

    (21027)]
    procedure Entercell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[1000];bold : Boolean);
    begin

        Tempexcelbuffer.INIT;
        Tempexcelbuffer.VALIDATE("Row No.",RowNo);
        Tempexcelbuffer.VALIDATE("Column No.",ColumnNo);
        Tempexcelbuffer."Cell Value as Text" := CellValue;
        Tempexcelbuffer.Bold:=bold ;

        Tempexcelbuffer.INSERT;
    end;

    (21037)]
    procedure EnterHeadings(RowNo : Integer;ColumnNo : Integer;CellValue : Text[100];Bold : Boolean);
    begin
        Tempexcelbuffer.INIT;
        Tempexcelbuffer.VALIDATE("Row No.",RowNo);
        Tempexcelbuffer.VALIDATE("Column No.",ColumnNo);
        Tempexcelbuffer."Cell Value as Text" := FORMAT(CellValue);
        Tempexcelbuffer.Bold:=Bold ;

        Tempexcelbuffer.Formula := '';
        Tempexcelbuffer.INSERT;
    end;

    (21047)]
    procedure "Entercell New"();
    begin
    end;
}

