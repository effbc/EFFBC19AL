report 50227 "Sale order project completion"
{
    // version Rev01,Eff02

    DefaultLayout = RDLC;
    RDLCLayout = './Sale order project completion.rdlc';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = SORTING(Document Type, No.) ORDER(Ascending) WHERE(Customer Posting Group=FILTER(RAILWAYS),Order Status=FILTER(<>Temporary Close),Status=FILTER(Released));
            column(Sales_Header__No__;"No.")
            {
            }
            column(formataddress_ChangeCurrency__Sale_Order_Total_Amount__;formataddress.ChangeCurrency("Sale Order Total Amount"))
            {
            }
            column(Sales_Header__Project_Completion_Date_;"Project Completion Date")
            {
            }
            column(Sales_Person;Sales_Person)
            {
            }
            column(FORMAT__Sales_Header___Project_Completion_Date__TODAY_;FORMAT("Sales Header"."Project Completion Date"-TODAY))
            {
            }
            column(Sales_Header__Sell_to_Customer_Name_;"Sell-to Customer Name")
            {
            }
            column(To_be_Expired_Sale_Orders_in_Next_20_DaysCaption;To_be_Expired_Sale_Orders_in_Next_20_DaysCaptionLbl)
            {
            }
            column(Sales_Header__No__Caption;FIELDCAPTION("No."))
            {
            }
            column(Sale_Order_Total_AmountCaption;Sale_Order_Total_AmountCaptionLbl)
            {
            }
            column(Sales_Header__Project_Completion_Date_Caption;FIELDCAPTION("Project Completion Date"))
            {
            }
            column(Sales_ExecutiveCaption;Sales_ExecutiveCaptionLbl)
            {
            }
            column(Days_RemainingCaption;Days_RemainingCaptionLbl)
            {
            }
            column(Sales_Header__Sell_to_Customer_Name_Caption;FIELDCAPTION("Sell-to Customer Name"))
            {
            }
            column(Sales_Header_Document_Type;"Document Type")
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF SP.GET("Sales Header"."Salesperson Code") THEN
                    Sales_Person:=SP.Name
                ELSE
                    Sales_Person:='';
            end;

            trigger OnPreDataItem();
            begin
                 "Sales Header".SETFILTER("Sales Header"."Document Type",'=%1',1);
                 "Sales Header".SETFILTER("Sales Header"."Project Completion Date",'%1..%2',TODAY,TODAY+20);
            end;
        }
        dataitem("<Sales Header1>";"Sales Header")
        {
            DataItemTableView = SORTING(Document Type,No.) ORDER(Ascending) WHERE(Customer Posting Group=FILTER(RAILWAYS),Order Status=FILTER(<>Temporary Close),Status=FILTER(Released));
            column(Sales_Header1___No__;"No.")
            {
            }
            column(Sales_Header1___Project_Completion_Date_;"Project Completion Date")
            {
            }
            column(Sales_Person_Control1102152018;Sales_Person)
            {
            }
            column(formataddress_ChangeCurrency__Sale_Order_Total_Amount___Control1102152020;formataddress.ChangeCurrency("Sale Order Total Amount"))
            {
            }
            column(FORMAT_TODAY___Sales_Header1____Project_Completion_Date__;FORMAT(TODAY-"<Sales Header1>"."Project Completion Date"))
            {
            }
            column(Sales_Header1___Sell_to_Customer_Name_;"Sell-to Customer Name")
            {
            }
            column(Project_Completion_dates_to_be_changed_Sale_OrdersCaption;Project_Completion_dates_to_be_changed_Sale_OrdersCaptionLbl)
            {
            }
            column(Sales_Header1___No__Caption;FIELDCAPTION("No."))
            {
            }
            column(Sales_Header1___Project_Completion_Date_Caption;FIELDCAPTION("Project Completion Date"))
            {
            }
            column(Sales_ExecutiveCaption_Control1102152017;Sales_ExecutiveCaption_Control1102152017Lbl)
            {
            }
            column(Sale_Order_Total_AmountCaption_Control1102152019;Sale_Order_Total_AmountCaption_Control1102152019Lbl)
            {
            }
            column(Days_ExtendedCaption;Days_ExtendedCaptionLbl)
            {
            }
            column(Sales_Header1___Sell_to_Customer_Name_Caption;FIELDCAPTION("Sell-to Customer Name"))
            {
            }
            column(Sales_Header1__Document_Type;"Document Type")
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF SP.GET("<Sales Header1>"."Salesperson Code") THEN
                    Sales_Person:=SP.Name
                ELSE
                    Sales_Person:='';
            end;

            trigger OnPreDataItem();
            begin
                 "<Sales Header1>".SETFILTER("<Sales Header1>"."Document Type",'=%1',1);
                 "<Sales Header1>".SETFILTER("<Sales Header1>"."Project Completion Date",'<%1',TODAY);
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
        Sales_Person : Text[50];
        SP : Record "Salesperson/Purchaser";
        formataddress : Codeunit "Format Address";
        Cust : Record Customer;
        To_be_Expired_Sale_Orders_in_Next_20_DaysCaptionLbl : Label 'To be Expired Sale Orders in Next 20 Days';
        Sale_Order_Total_AmountCaptionLbl : Label 'Sale Order Total Amount';
        Sales_ExecutiveCaptionLbl : Label 'Sales Executive';
        Days_RemainingCaptionLbl : Label 'Days Remaining';
        Project_Completion_dates_to_be_changed_Sale_OrdersCaptionLbl : Label 'Project Completion dates to be changed Sale Orders';
        Sales_ExecutiveCaption_Control1102152017Lbl : Label 'Sales Executive';
        Sale_Order_Total_AmountCaption_Control1102152019Lbl : Label 'Sale Order Total Amount';
        Days_ExtendedCaptionLbl : Label 'Days Extended';
}

