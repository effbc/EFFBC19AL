report 50175 "Qc Accept"
{
    // version EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './Qc Accept.rdlc';

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            DataItemTableView = SORTING(Item No., Location Code, Global Dimension 1 Code, Global Dimension 2 Code, Open, Remaining Quantity) ORDER(Ascending) WHERE(Remaining Quantity=FILTER(<0),Posting Date=FILTER(10/10/09..11/16/09),Entry Type=CONST(Transfer));
            RequestFilterFields = "Item No.";
            column(Item_Ledger_Entry__Entry_No__;"Entry No.")
            {
            }
            column(Item_Ledger_Entry__Item_No__;"Item No.")
            {
            }
            column(Item_Ledger_Entry__Posting_Date_;"Posting Date")
            {
            }
            column(Item_Ledger_Entry__Document_No__;"Document No.")
            {
            }
            column(Item_Ledger_Entry__Remaining_Quantity_;"Remaining Quantity")
            {
            }

            trigger OnPostDataItem();
            begin
                MESSAGE(FORMAT(cnt));
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
          TempExcelbuffer.CreateBook('','');//B2B //EFFUPG
          //TempExcelbuffer.CreateSheet('Stock','',COMPANYNAME,'');//B2B
         TempExcelbuffer.GiveUserControl;
    end;

    trigger OnPreReport();
    begin
             CLEAR(TempExcelbuffer);
             TempExcelbuffer.DELETEALL;
    end;

    var
        cnt : Integer;
        TempExcelbuffer : Record "Excel Buffer";
        Row : Integer;

    (8429)]
    procedure Entercell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[1000];bold : Boolean);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.",RowNo);
        TempExcelbuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelbuffer."Cell Value as Text" := CellValue;
        TempExcelbuffer.Bold:=bold ;

        TempExcelbuffer.INSERT;
    end;

    (8438)]
    procedure EnterHeadings(RowNo : Integer;ColumnNo : Integer;CellValue : Text[100];Bold : Boolean);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.",RowNo);
        TempExcelbuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelbuffer."Cell Value as Text" := FORMAT(CellValue);
        TempExcelbuffer.Bold:=Bold ;

        TempExcelbuffer.Formula := '';
        TempExcelbuffer.INSERT;
    end;

    (8448)]
    procedure "Entercell New"();
    begin
    end;
}

