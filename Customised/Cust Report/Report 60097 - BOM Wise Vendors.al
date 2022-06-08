report 60097 "BOM Wise Vendors"
{
    // version EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './BOM Wise Vendors.rdlc';

    dataset
    {
        dataitem("Production BOM Header"; "Production BOM Header")
        {
            dataitem("Production BOM Line"; "Production BOM Line")
            {
                DataItemLink = Production BOM No.=FIELD(No.);
                dataitem("Purchase Line"; "Purchase Line")
                {
                    DataItemLink = No.=FIELD(No.);
                    DataItemTableView = SORTING(No., Buy-from Vendor No.) ORDER(Ascending) WHERE(Document Type=CONST(Order),Quantity=FILTER(>0),Type=CONST(Item));
                }

                trigger OnAfterGetRecord();
                begin

                        Row+=1;
                        Entercell(Row,1,"Production BOM Line"."No.",FALSE);
                    //    Entercell(Row,2,Item.Description,FALSE);
                end;
            }

            trigger OnAfterGetRecord();
            begin
                    Row:=1;
                    EnterHeadings(Row,1,'Item No.',TRUE);
                    EnterHeadings(Row,2,'Description',TRUE);
                    EnterHeadings(Row,3,'VENDOR 1',TRUE);
                    EnterHeadings(Row,4,'VENDOR 2',TRUE);
                    EnterHeadings(Row,5,'VENDOR 3',TRUE);
                    EnterHeadings(Row,6,'VENDOR 4',TRUE);
                    EnterHeadings(Row,7,'VENDOR 5',TRUE);
                    EnterHeadings(Row,8,'VENDOR 6',TRUE);
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
         // TempExcelbuffer.CreateSheet('Stock','',COMPANYNAME,'');//B2B
         TempExcelbuffer.GiveUserControl;
    end;

    trigger OnPreReport();
    begin
             CLEAR(TempExcelbuffer);
             TempExcelbuffer.DELETEALL;
    end;

    var
        TempExcelbuffer : Record "Excel Buffer";
        Row : Integer;

    (12100)]
    procedure Entercell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[1000];bold : Boolean);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.",RowNo);
        TempExcelbuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelbuffer."Cell Value as Text" := CellValue;
        TempExcelbuffer.Bold:=bold ;

        TempExcelbuffer.INSERT;
    end;

    (12109)]
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

    (12119)]
    procedure "Entercell New"();
    begin
    end;
}

