report 50185 "Day wise Prod.Requests"
{
    // version EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './Day wise Prod.Requests.rdlc';

    dataset
    {
        dataitem("Posted Material Issues Header"; "Posted Material Issues Header")
        {
            DataItemTableView = SORTING(Prod. Order No., Prod. Order Line No.) ORDER(Ascending) WHERE(Transfer-to Code=FILTER(PROD),Prod. Order No.=FILTER(<>''),Prod. Order Line No.=FILTER(<>10000));
            RequestFilterFields = "Posting Date";
            column(Posted_Material_Issues_Header__Posted_Material_Issues_Header___Prod__Order_No__;"Posted Material Issues Header"."Prod. Order No.")
            {
            }
            column(Posted_Material_Issues_Header__Posting_Date_;"Posting Date")
            {
            }
            column(Product;Product)
            {
            }
            column(posting_dateCaption;posting_dateCaptionLbl)
            {
            }
            column(Production_order_noCaption;Production_order_noCaptionLbl)
            {
            }
            column(product_nameCaption;product_nameCaptionLbl)
            {
            }
            column(Posted_Material_Issues_Header_No_;"No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF (PONO='') OR (PONO<>"Posted Material Issues Header"."Prod. Order No.") THEN
                BEGIN
                countlines:=0;
                countzero:=0;
                countofnonzero:=0;
                PMIL.SETRANGE(PMIL."Document No.","Posted Material Issues Header"."No.");
                IF PMIL.FIND('-') THEN
                REPEAT
                countlines:=countlines+1;
                countzero:=countzero+1;
                countofnonzero:=countofnonzero+1;
                UNTIL PMIL.NEXT=0;
                PONO:="Posted Material Issues Header"."Prod. Order No.";

                check1:=STRPOS(PONO,'SPA');
                check2:=STRPOS(PONO,'AMC');

                Po.SETRANGE(Po."No.","Posted Material Issues Header"."Prod. Order No.");
                IF Po.FIND('-') THEN
                BEGIN
                Product:=FORMAT(Po."Item Sub Group Code");
                END;
                END;
            end;

            trigger OnPreDataItem();
            begin
                check1:=0;
                check2:=0;
                TempExcelBuffer.DELETEALL;
                CLEAR(TempExcelBuffer);
                row:=0;
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
        IF Excel THEN
        BEGIN
          TempExcelBuffer.CreateBook('','');//B2B //EFFUPG
          //TempExcelBuffer.CreateSheet('test excel','',COMPANYNAME,'');//B2B
          TempExcelBuffer.GiveUserControl;
        END
    end;

    var
        PMIL : Record "Posted Material Issues Line";
        countlines : Integer;
        countzero : Integer;
        countofnonzero : Integer;
        PONO : Text[30];
        Po : Record "Production Order";
        Product : Text[30];
        TempExcelBuffer : Record "Excel Buffer";
        row : Integer;
        Excel : Boolean;
        check1 : Integer;
        check2 : Integer;
        posting_dateCaptionLbl : Label 'posting date';
        Production_order_noCaptionLbl : Label 'Production order no';
        product_nameCaptionLbl : Label 'product name';

    [LineStart(8468)]
    procedure EnterCell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[250];Bold : Boolean);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.",RowNo);
        TempExcelBuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelBuffer."Cell Value as Text" := CellValue;
        TempExcelBuffer.Bold:=Bold ;
        TempExcelBuffer.INSERT;
    end;

    [LineStart(8476)]
    procedure EnterHeadings(RowNo : Integer;ColumnNo : Integer;CellValue : Text[250];Bold : Boolean);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.",RowNo);
        TempExcelBuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelBuffer."Cell Value as Text" := FORMAT(CellValue);
        TempExcelBuffer.Bold:=Bold ;
        TempExcelBuffer.Formula := '';
        TempExcelBuffer.INSERT;
    end;
}

