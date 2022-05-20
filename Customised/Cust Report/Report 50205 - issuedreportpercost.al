report 50205 issuedreportpercost
{
    // version EFFUPG

    //    Entercell(Row,1,"Value Entry"."Item No.",FALSE);
    //    Entercell(Row,2,Item.Description,FALSE);
    //    Entercell(Row,3,FORMAT("Value Entry"."Item Ledger Entry Quantity"),FALSE);
    //    Entercell(Row,4,FORMAT("Item Ledger Entry"."Lot No."),FALSE);
    //    Entercell(Row,5,FORMAT("Item Ledger Entry"."Serial No."),FALSE);
    //    Entercell(Row,8,"Posted Material Issues Header"."Prod. Order No.",FALSE);
    //    Entercell(Row,9,"Item Ledger Entry"."Order No.",FALSE);
    DefaultLayout = RDLC;
    RDLCLayout = './issuedreportpercost.rdlc';


    dataset
    {
        dataitem("Posted Material Issues Header";"Posted Material Issues Header")
        {
            RequestFilterFields = "Transfer-from Code","Transfer-to Code","Prod. Order No.","Posting Date";
            column(Item_Ledger_Entry___Serial_No__Caption;"Item Ledger Entry".FIELDCAPTION("Serial No."))
            {
            }
            column(Item_Ledger_Entry___Lot_No__Caption;"Item Ledger Entry".FIELDCAPTION("Lot No."))
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
                    column(Item_Ledger_Entry_Entry_No_;"Entry No.")
                    {
                    }
                    column(Item_Ledger_Entry_Item_No_;"Item No.")
                    {
                    }
                    column(Item_Ledger_Entry_Lot_No_;"Lot No.")
                    {
                    }
                    column(Item_Ledger_Entry_Serial_No_;"Serial No.")
                    {
                    }
                    dataitem("<Item Ledger Entry1>";"Item Ledger Entry")
                    {
                        DataItemLink = Item No.=FIELD(Item No.),Lot No.=FIELD(Lot No.),Serial No.=FIELD(Serial No.);
                        DataItemTableView = SORTING(Item No.,Lot No.,Serial No.) WHERE(Document Type=FILTER(Purchase Receipt));
                        column(Item_Ledger_Entry1__Entry_No_;"Entry No.")
                        {
                        }
                        column(Item_Ledger_Entry1__Item_No_;"Item No.")
                        {
                        }
                        column(Item_Ledger_Entry1__Lot_No_;"Lot No.")
                        {
                        }
                        column(Item_Ledger_Entry1__Serial_No_;"Serial No.")
                        {
                        }
                        column(Item_Ledger_Entry1__Document_No_;"Document No.")
                        {
                        }
                        dataitem("Purch. Rcpt. Line";"Purch. Rcpt. Line")
                        {
                            DataItemLink = Document No.=FIELD(Document No.),No.=FIELD(Item No.);
                            DataItemTableView = SORTING(Document No.,Line No.) WHERE(Quantity=FILTER(>0));
                            column(Purch__Rcpt__Line_Document_No_;"Document No.")
                            {
                            }
                            column(Purch__Rcpt__Line_Line_No_;"Line No.")
                            {
                            }
                            column(Purch__Rcpt__Line_No_;"No.")
                            {
                            }
                            dataitem("Purch. Inv. Line";"Purch. Inv. Line")
                            {
                                DataItemLink = Field60005=FIELD(Document No.),No.=FIELD(No.);
                                DataItemTableView = '';
                                column(Item_Ledger_Entry___Serial_No__;"Item Ledger Entry"."Serial No.")
                                {
                                }
                                column(Item_Ledger_Entry___Lot_No__;"Item Ledger Entry"."Lot No.")
                                {
                                }
                                column(Value_Entry___Cost_per_Unit_;"Value Entry"."Cost per Unit")
                                {
                                }
                                column(Value_Entry___Invoiced_Quantity_;"Value Entry"."Invoiced Quantity")
                                {
                                }
                                column(Value_Entry___Valued_Quantity_;"Value Entry"."Valued Quantity")
                                {
                                }
                                column(Value_Entry___Item_No__;"Value Entry"."Item No.")
                                {
                                }
                                column(Purch__Inv__Line_Document_No_;"Document No.")
                                {
                                }
                                column(Purch__Inv__Line_Line_No_;"Line No.")
                                {
                                }
                                column(Purch__Inv__Line_Receipt_No_;"Receipt No.")
                                {
                                }
                                column(Purch__Inv__Line_No_;"No.")
                                {
                                }
                                dataitem("Purch. Inv. Header";"Purch. Inv. Header")
                                {
                                    DataItemLink = No.=FIELD(Document No.);
                                    DataItemTableView = SORTING(No.);

                                    trigger OnAfterGetRecord();
                                    begin

                                            Entercell(Row,12,"Purch. Inv. Header"."Buy-from Vendor Name",FALSE);
                                           Entercell(Row,13,"Purch. Inv. Header"."Vendor Invoice No.",FALSE);
                                           Entercell(Row,14,FORMAT("Purch. Inv. Header"."Posting Date"),FALSE);
                                    end;

                                    trigger OnPreDataItem();
                                    begin
                                         /*   Entercell(Row,6,FORMAT("Purch. Inv. Line"."Amount To Vendor"/"Purch. Inv. Line".Quantity),FALSE);
                                           itemcost:="Purch. Inv. Line"."Amount To Vendor"/"Purch. Inv. Line".Quantity;
                                           Entercell(Row,7,FORMAT(itemcost*"Value Entry"."Item Ledger Entry Quantity"),FALSE);
                                            IF "Purch. Inv. Line"."Document No."<>'' THEN
                                              Entercell(Row,11,"Purch. Inv. Line"."Document No.",FALSE); */

                                    end;
                                }

                                trigger OnAfterGetRecord();
                                begin
                                      //  MESSAGE(FORMAT("Purch. Inv. Line"."Receipt No."));
                                end;
                            }

                            trigger OnPostDataItem();
                            begin
                                    IF "Purch. Rcpt. Line"."Document No."<>'' THEN
                                    Entercell(Row,10,"Purch. Rcpt. Line"."Document No.",FALSE);
                            end;
                        }
                    }

                    trigger OnAfterGetRecord();
                    begin
                           Entercell(Row,4,FORMAT("Item Ledger Entry"."Lot No."),FALSE);
                           Entercell(Row,5,FORMAT("Item Ledger Entry"."Serial No."),FALSE);
                           Entercell(Row,9,"Item Ledger Entry"."Order No.",FALSE);
                    end;

                    trigger OnPreDataItem();
                    begin
                            Row+=1;
                           Entercell(Row,1,"Value Entry"."Item No.",FALSE);
                           Entercell(Row,2,Item.Description,FALSE);
                           Entercell(Row,3,FORMAT("Value Entry"."Item Ledger Entry Quantity"),FALSE);
                           Entercell(Row,8,"Posted Material Issues Header"."Prod. Order No.",FALSE);
                    end;
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
        itemcost : Decimal;

    [LineStart(8578)]
    procedure Entercell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[1000];bold : Boolean);
    begin

        Tempexcelbuffer.INIT;
        Tempexcelbuffer.VALIDATE("Row No.",RowNo);
        Tempexcelbuffer.VALIDATE("Column No.",ColumnNo);
        Tempexcelbuffer."Cell Value as Text" := CellValue;
        Tempexcelbuffer.Bold:=bold ;

        Tempexcelbuffer.INSERT;
    end;

    [LineStart(8588)]
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

    [LineStart(8598)]
    procedure "Entercell New"();
    begin
    end;
}

