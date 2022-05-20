report 80017 "Shortage Manage Audit Data13"
{
    // version NAVW17.00

    DefaultLayout = RDLC;
    RDLCLayout = './Shortage Manage Audit Data13.rdlc';

    dataset
    {
        dataitem("Production Order";"Production Order")
        {
            DataItemTableView = SORTING(Field60008,Field60001,Source No.) ORDER(Ascending) WHERE(Field60001=FILTER(<>''));
            column(Production_Order_Week;Week)
            {
            }
            column(Production_Order__Sales_Order_No__;"Sales Order No.")
            {
            }
            column(Production_Order_Quantity;Quantity)
            {
            }
            column(Production_Order__Source_No__;"Source No.")
            {
            }
            column(Production_Order__Prod_Start_date_;"Prod Start date")
            {
            }
            column(Production_Order_Status;Status)
            {
            }
            column(Production_Order_No_;"No.")
            {
            }

            trigger OnAfterGetRecord();
            begin

                   //Calc:=FALSE;
            end;

            trigger OnPreDataItem();
            begin
                   "Plan Change".RUN;
                  Table60005.DELETEALL;
                  "g\l".GET;
                    "Production Order".SETFILTER("Production Order"."Prod Start date",'>=%1',("g\l"."Shortage. Calc. Date"+1));
            end;
        }
        dataitem("Shortage Management Audit Data";"Shortage Management Audit Data")
        {
            DataItemTableView = SORTING(Field1,Field2,Field4);

            trigger OnAfterGetRecord();
            begin
                  "Plan Change".Shortage(Table60005.Week,Table60005.Sale_Order,
                                         Table60005.Product);
            end;

            trigger OnPreDataItem();
            begin
                // CurrReport.BREAK;
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

    var
        "g\l" : Record "General Ledger Setup";
        "Sales Header" : Record "Sales Header";
        SH1 : Record "Sales Header";
        "Plan Change" : Codeunit "Plan Change";
        Calc : Boolean;
        Lead_Change : Boolean;
        Lead_Item_Count : Integer;
        Prev_Lead_Time : Code[10];
        Item : Record Item;
        I : Integer;
}

