report 50206 DISR
{
    // version EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './DISR.rdlc';

    dataset
    {
        dataitem("Posted Material Issues Header";"Posted Material Issues Header")
        {
            RequestFilterFields = "Transfer-from Code","Transfer-to Code","Prod. Order No.","Posting Date";
            column(Item_Ledger_Entry__Serial_No__Caption;"Item Ledger Entry".FIELDCAPTION("Serial No."))
            {
            }
            column(Item_Ledger_Entry__Lot_No__Caption;"Item Ledger Entry".FIELDCAPTION("Lot No."))
            {
            }
            column(Value_Entry___Cost_per_Unit_Caption;"Value Entry".FIELDCAPTION("Cost per Unit"))
            {
            }
            column(Value_Entry___Invoiced_Quantity_Caption;"Value Entry".FIELDCAPTION("Invoiced Quantity"))
            {
            }
            column(Value_Entry___Valued_Quantity_Caption;"Value Entry".FIELDCAPTION("Valued Quantity"))
            {
            }
            column(Value_Entry___Item_No__Caption;"Value Entry".FIELDCAPTION("Item No."))
            {
            }
            column(Posted_Material_Issues_Header_No_;"No.")
            {
            }
            dataitem("Value Entry";"Value Entry")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document No.,Posting Date) WHERE(Item Ledger Entry Quantity=FILTER(>0));
                column(Value_Entry_Entry_No_;"Entry No.")
                {
                }
                column(Value_Entry_Document_No_;"Document No.")
                {
                }
                column(Value_Entry_Item_Ledger_Entry_No_;"Item Ledger Entry No.")
                {
                }
                dataitem(Item;Item)
                {
                    DataItemLink = No.=FIELD(Item No.);
                }
                dataitem("Item Ledger Entry";"Item Ledger Entry")
                {
                    DataItemLink = Entry No.=FIELD(Item Ledger Entry No.);
                    column(Value_Entry___Item_No__;"Value Entry"."Item No.")
                    {
                    }
                    column(Value_Entry___Valued_Quantity_;"Value Entry"."Valued Quantity")
                    {
                    }
                    column(Value_Entry___Invoiced_Quantity_;"Value Entry"."Invoiced Quantity")
                    {
                    }
                    column(Value_Entry___Cost_per_Unit_;"Value Entry"."Cost per Unit")
                    {
                    }
                    column(Item_Ledger_Entry__Lot_No__;"Lot No.")
                    {
                    }
                    column(Item_Ledger_Entry__Serial_No__;"Serial No.")
                    {
                    }
                    column(Item_Ledger_Entry_Entry_No_;"Entry No.")
                    {
                    }
                }
            }

            trigger OnPreDataItem();
            begin
                Tempexcelbuffer.DELETEALL;
                CLEAR(Tempexcelbuffer);
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
          Tempexcelbuffer.CreateBook('','');//B2B //EFFUPG
          //Tempexcelbuffer.CreateSheet('test excel','',COMPANYNAME,'');//B2B
          Tempexcelbuffer.GiveUserControl;
    end;

    var
        EXCEL : Boolean;
        Row : Integer;
        Tempexcelbuffer : Record "Excel Buffer";

    [LineStart(8605)]
    procedure Entercell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[1000];bold : Boolean);
    begin

        Tempexcelbuffer.INIT;
        Tempexcelbuffer.VALIDATE("Row No.",RowNo);
        Tempexcelbuffer.VALIDATE("Column No.",ColumnNo);
        Tempexcelbuffer."Cell Value as Text" := CellValue;
        Tempexcelbuffer.Bold:=bold ;

        Tempexcelbuffer.INSERT;
    end;

    [LineStart(8615)]
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

    [LineStart(8625)]
    procedure "Entercell New"();
    begin
    end;
}

