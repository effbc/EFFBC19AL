report 50194 "Item-Makes"
{
    // version EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './Item-Makes.rdlc';

    dataset
    {
        dataitem(Item;Item)
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending) WHERE(Blocked=FILTER(No));
            RequestFilterFields = "No.",Description,"Item Category Code","Product Group Code";
            column(Item__No__;"No.")
            {
            }
            column(Item_Description;Description)
            {
            }
            column(Item__No__Caption;FIELDCAPTION("No."))
            {
            }
            column(Item_DescriptionCaption;FIELDCAPTION(Description))
            {
            }
            dataitem("Item Variant";"Item Variant")
            {
                DataItemLink = Item No.=FIELD(No.);
                DataItemTableView = SORTING(Item No.,Priority,Make) ORDER(Ascending);

                trigger OnAfterGetRecord();
                begin
                      IF EXCEL AND (k=0) THEN
                      BEGIN
                        Row+=1;
                        Entercell(Row,1,Item."No.",FALSE);
                        Entercell(Row,2,Item.Description,FALSE);
                        Entercell(Row,3,Item."Product Group Code",FALSE);
                        Entercell(Row,4,"Item Variant".Make,FALSE);
                        Entercell(Row,5,"Item Variant"."Part No",FALSE);
                        Entercell(Row,6,"Item Variant".Package,FALSE);
                        Entercell(Row,7,FORMAT("Item Variant"."Item Status"),FALSE);
                      END;

                      IF EXCEL AND (k=1) THEN
                      BEGIN
                        Entercell(Row,4,"Item Variant".Make,FALSE);
                        Entercell(Row,5,"Item Variant"."Part No",FALSE);
                        Entercell(Row,6,"Item Variant".Package,FALSE);
                        Entercell(Row,7,FORMAT("Item Variant"."Item Status"),FALSE);
                        k:=0;
                      END;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                  IF EXCEL AND "No Make" THEN
                  BEGIN
                    Row+=1;
                    Entercell(Row,1,Item."No.",FALSE);
                    Entercell(Row,2,Item.Description,FALSE);
                    Entercell(Row,3,Item."Product Group Code",FALSE);
                    k:=1;
                  END;
            end;

            trigger OnPreDataItem();
            begin
                  IF EXCEL  THEN
                  BEGIN
                    Row+=1;
                    EnterHeadings(Row,1,'Item No',TRUE);
                    EnterHeadings(Row,2,'Description',TRUE);
                    EnterHeadings(Row,3,'product group Code',TRUE);
                    EnterHeadings(Row,4,'Make',TRUE);
                    EnterHeadings(Row,5,'partnumber',TRUE);
                    EnterHeadings(Row,6,'package',TRUE);
                    EnterHeadings(Row,7,'Item Status',TRUE);
                  END;
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
          IF EXCEL THEN
          BEGIN
            Tempexcelbuffer.CreateBook('','');//B2B //EFFUPG
            //Tempexcelbuffer.CreateSheet('MAKES','',COMPANYNAME,'');//B2B
            Tempexcelbuffer.GiveUserControl;
          END;
    end;

    trigger OnPreReport();
    begin
          IF EXCEL THEN
          BEGIN
            CLEAR(Tempexcelbuffer);
            Tempexcelbuffer.DELETEALL;
          END;
    end;

    var
        Tempexcelbuffer : Record "Excel Buffer" temporary;
        EXCEL : Boolean;
        Row : Integer;
        "No Make" : Boolean;
        k : Integer;

    [LineStart(8528)]
    procedure Entercell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[1000];bold : Boolean);
    begin

        Tempexcelbuffer.INIT;
        Tempexcelbuffer.VALIDATE("Row No.",RowNo);
        Tempexcelbuffer.VALIDATE("Column No.",ColumnNo);
        Tempexcelbuffer."Cell Value as Text" := CellValue;
        Tempexcelbuffer.Bold:=bold ;

        Tempexcelbuffer.INSERT;
    end;

    [LineStart(8538)]
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
}

