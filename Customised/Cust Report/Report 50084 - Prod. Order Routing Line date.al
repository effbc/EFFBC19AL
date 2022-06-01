report 50084 "Prod. Order Routing Line date"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Prod. Order Routing Line date.rdlc';

    dataset
    {
        dataitem("Prod. Order Routing Line"; "Prod. Order Routing Line")
        {
            DataItemTableView = SORTING(Work Center No.);
            column(Prod__Order_Routing_Line__Starting_Date_; "Starting Date")
            {
            }
            column(Prod__Order_Routing_Line__Ending_Date_; "Ending Date")
            {
            }
            column(Prod__Order_Routing_Line__No__; "No.")
            {
            }
            column(Prod__Order_Routing_Line__Routing_No__; "Routing No.")
            {
            }
            column(Prod__Order_Routing_Line__Prod__Order_No__; "Prod. Order No.")
            {
            }
            column(Prod__Order_Routing_Line__Starting_Date_Caption; FIELDCAPTION("Starting Date"))
            {
            }
            column(Prod__Order_Routing_Line__Ending_Date_Caption; FIELDCAPTION("Ending Date"))
            {
            }
            column(Prod__Order_Routing_Line__No__Caption; FIELDCAPTION("No."))
            {
            }
            column(Prod__Order_Routing_Line__Routing_No__Caption; FIELDCAPTION("Routing No."))
            {
            }
            column(Prod__Order_Routing_Line__Prod__Order_No__Caption; FIELDCAPTION("Prod. Order No."))
            {
            }
            column(Prod__Order_Routing_Line_Status; Status)
            {
            }
            column(Prod__Order_Routing_Line_Routing_Reference_No_; "Routing Reference No.")
            {
            }
            column(Prod__Order_Routing_Line_Operation_No_; "Operation No.")
            {
            }

            trigger OnPreDataItem();
            begin
                "Prod. Order Routing Line".SETRANGE("Starting Date", Startdate, Enddate);
                "Prod. Order Routing Line".SETRANGE("Ending Date", Startdate, Enddate);
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

    trigger OnInitReport();
    begin
        //od.SETFILTER("Starting Date",'=%1',Startdater);
        //od.SETFILTER("Ending Date",'<=%1',Enddater);
    end;

    var
        App: Codeunit ApplicationManagement;
        Startdate: Date;
        Enddate: Date;
        Prod: Record "Prod. Order Routing Line";
}

