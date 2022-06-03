report 50045 "Schedule Plan Change"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Schedule Plan Change.rdlc';

    dataset
    {
        dataitem("Production Order"; "Production Order")
        {
            DataItemTableView = SORTING(Sales Order No., Source No., Prod Start date) ORDER(Ascending) WHERE(Prod Start date=FILTER(<>''),Source No.=CONST(99/2006DL512D32A001));
            RequestFilterFields = "Sales Order No.","Source No.","Prod Start date";
            column(Schedule_Items_Don_t_Have_PlanCaption;Schedule_Items_Don_t_Have_PlanCaptionLbl)
            {
            }
            column(Bout_DescriptionCaption;Bout_DescriptionCaptionLbl)
            {
            }
            column(Bout_ItemCaption;Bout_ItemCaptionLbl)
            {
            }
            column(ProductCaption;ProductCaptionLbl)
            {
            }
            column(Sale_Order_No_Caption;Sale_Order_No_CaptionLbl)
            {
            }
            column(Production_Order_Status;Status)
            {
            }
            column(Production_Order_No_;"No.")
            {
            }
            column(Production_Order_Source_No_;"Source No.")
            {
            }
            dataitem("Sales Line1";"Sales Line")
            {
                DataItemTableView = SORTING(Document Type,Document No.,Line No.) ORDER(Ascending);
                column(Sales_Line1_Document_Type;"Document Type")
                {
                }
                column(Sales_Line1_Document_No_;"Document No.")
                {
                }
                column(Sales_Line1_Line_No_;"Line No.")
                {
                }
                dataitem(Schedule1;Schedule2)
                {
                    DataItemLink = Document No.=FIELD(Document No.),Document Line No.=FIELD(Line No.);
                    DataItemTableView = SORTING(Document Type,Document No.,Document Line No.,Line No.) ORDER(Ascending) WHERE(Material Required Date=FILTER(''),No.=FILTER(<>''));
                    column(Schedule1__Document_No__;"Document No.")
                    {
                    }
                    column(Sales_Line1___No__;"Sales Line1"."No.")
                    {
                    }
                    column(Schedule1__No__;"No.")
                    {
                    }
                    column(Schedule1_Description;Description)
                    {
                    }
                    column(Schedule1_Document_Type;"Document Type")
                    {
                    }
                    column(Schedule1_Document_Line_No_;"Document Line No.")
                    {
                    }
                    column(Schedule1_Line_No_;"Line No.")
                    {
                    }

                    trigger OnPreDataItem();
                    begin

                          Schedule1.SETFILTER(Schedule1."No.",'<>%1',Prev_Source);
                    end;
                }

                trigger OnPreDataItem();
                begin
                    IF NOT Change THEN
                       CurrReport.BREAK
                    ELSE
                    BEGIN
                      "Sales Line1".SETRANGE("Sales Line1"."Document No.",Prev_Sale_Order);
                      "Sales Line1".SETRANGE("Sales Line1"."No.",Prev_Source);
                      Visit:=FALSE;
                    END;
                end;
            }

            trigger OnPreDataItem();
            begin
                //MESSAGE(FORMAT("Calculation Date"));
                "Production Order".SETFILTER("Production Order"."Prod Start date",'>%1',"Calculation Date");
                Visit:=FALSE;
            end;
        }
        dataitem("Sales Line2";"Sales Line")
        {
            column(Sales_Line2_Document_Type;"Document Type")
            {
            }
            column(Sales_Line2_Document_No_;"Document No.")
            {
            }
            column(Sales_Line2_Line_No_;"Line No.")
            {
            }
            dataitem(Schedule2;Schedule2)
            {
                DataItemLink = Document No.=FIELD(Document No.),Document Line No.=FIELD(Line No.);
                DataItemTableView = SORTING(Document Type,Document No.,Document Line No.,Line No.) ORDER(Ascending) WHERE(Material Required Date=FILTER(''));
                column(Schedule2_Description;Description)
                {
                }
                column(Schedule2__No__;"No.")
                {
                }
                column(Sales_Line2___No__;"Sales Line2"."No.")
                {
                }
                column(Schedule2__Document_No__;"Document No.")
                {
                }
                column(Schedule2_Document_Type;"Document Type")
                {
                }
                column(Schedule2_Document_Line_No_;"Document Line No.")
                {
                }
                column(Schedule2_Line_No_;"Line No.")
                {
                }

                trigger OnPreDataItem();
                begin
                        Schedule2.SETFILTER(Schedule2."No.",'<>%1',Prev_Source);
                end;
            }

            trigger OnPreDataItem();
            begin
                  "Sales Line2".SETRANGE("Sales Line2"."Document No.",Prev_Sale_Order);
                  "Sales Line2".SETRANGE("Sales Line2"."No.",Prev_Source);
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
            "Calculation Date":=TODAY;
    end;

    var
        "Calculation Date" : Date;
        Schedule : Record Schedule2;
        "Sales Line" : Record "Sales Line";
        "Earliest Date" : Date;
        BOUT : Record "Bin Type";
        Change : Boolean;
        Visit : Boolean;
        Prev_Sale_Order : Code[30];
        Prev_Source : Code[30];
        Schedule_Items_Don_t_Have_PlanCaptionLbl : Label 'Schedule Items Don''t Have Plan';
        Bout_DescriptionCaptionLbl : Label 'Bout Description';
        Bout_ItemCaptionLbl : Label 'Bout Item';
        ProductCaptionLbl : Label 'Product';
        Sale_Order_No_CaptionLbl : Label 'Sale Order No.';
}

