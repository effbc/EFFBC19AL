report 50221 "test-db"
{
    // version EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './test-db.rdlc';

    dataset
    {
        dataitem("Posted Material Issues Header"; "Posted Material Issues Header")
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending) WHERE(Transfer-from Code=FILTER(PRODSTR|STR),Transfer-to Code=FILTER(STR|PROD));
            dataitem("Posted Material Issues Line";"Posted Material Issues Line")
            {
                DataItemLink = Document No.=FIELD(No.);

                trigger OnPreDataItem();
                begin
                    IF "Posted Material Issues Header"."Transfer-from Code"='PRODSTR' THEN
                      PRD_Stock:="Posted Material Issues Line".Quantity;
                    IF "Posted Material Issues Header"."Transfer-from Code"='STR' THEN
                      str_stock:="Posted Material Issues Line".Quantity;
                end;
            }
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
         Tempexcelbuffer.CreateBook('','');//B2B //EFFUPG
         //Tempexcelbuffer.CreateSheet('BOM','',COMPANYNAME,'');//B2B
         Tempexcelbuffer.GiveUserControl;
    end;

    trigger OnPreReport();
    begin
             CLEAR(Tempexcelbuffer);
             Tempexcelbuffer.DELETEALL;
    end;

    var
        PRD_Stock : Decimal;
        str_stock : Decimal;
        TOS1 : Code[10];
        row : Integer;
        Tempexcelbuffer : Record "Excel Buffer";

    (9719)]
    procedure EnterCell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[250];Bold : Boolean);
    begin
        Tempexcelbuffer.INIT;
        Tempexcelbuffer.VALIDATE("Row No.",RowNo);
        Tempexcelbuffer.VALIDATE("Column No.",ColumnNo);
        Tempexcelbuffer."Cell Value as Text" := CellValue;
        Tempexcelbuffer.Bold:=Bold ;
        Tempexcelbuffer.INSERT;
    end;

    (9727)]
    procedure "Enter Headings"(RowNo : Integer;ColumnNo : Integer;CellValue : Text[250];Bold : Boolean);
    begin
        Tempexcelbuffer.INIT;
        Tempexcelbuffer.VALIDATE("Row No.",RowNo);
        Tempexcelbuffer.VALIDATE("Column No.",ColumnNo);
        Tempexcelbuffer."Cell Value as Text" := FORMAT(CellValue);
        Tempexcelbuffer.Bold:=Bold ;
        Tempexcelbuffer.Formula := '';
        Tempexcelbuffer.INSERT;
    end;
}

