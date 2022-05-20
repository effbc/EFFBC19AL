report 50031 "Production Order Status"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Production Order Status.rdlc';

    dataset
    {
        dataitem("Production Order";"Production Order")
        {
            RequestFilterFields = Status,"No.","Due Date";
            column(COMPANYNAME;COMPANYNAME)
            {
            }
            column(FORMAT_TODAY_0_4_;FORMAT(TODAY,0,4))
            {
            }
            column(USERID;USERID)
            {
            }
            column(Total;Total)
            {
            }
            column(Notys;Notys)
            {
            }
            column(Wip;Wip)
            {
            }
            column(Completed;Completed)
            {
            }
            column(Total_OrdersCaption;Total_OrdersCaptionLbl)
            {
            }
            column(Not_yet_Started_OrdersCaption;Not_yet_Started_OrdersCaptionLbl)
            {
            }
            column(In_Progress_OrdersCaption;In_Progress_OrdersCaptionLbl)
            {
            }
            column(Completed_OrdersCaption;Completed_OrdersCaptionLbl)
            {
            }
            column(Production_Order_StatusCaption;Production_Order_StatusCaptionLbl)
            {
            }
            column(Production_Order_Status;Status)
            {
            }
            column(Production_Order_No_;"No.")
            {
            }
            dataitem("Material Issues Header";"Material Issues Header")
            {
                DataItemLink = Prod. Order No.=FIELD(No.);
                DataItemTableView = SORTING(No.) ORDER(Ascending);

                trigger OnPreDataItem();
                begin
                             "Material Issues Header".SETFILTER("Material Issues Header"."Transfer-to Code",'PROD');
                             "Material Issues Header".SETFILTER("Material Issues Header"."Prod. Order No.","Production Order"."No.");
                             IF "Material Issues Header".FIND('-') THEN
                             Wip:=Wip+1;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                
                                      IF "Production Order".Status="Production Order".Status::Released THEN
                                        BEGIN
                                    /* "Material Issues Header".SETRANGE("Material Issues Header"."Prod. Order No.","Production Order"."No.");
                                          IF "Material Issues Header".FIND('-') THEN
                                            Wip:=Wip+1
                                          ELSE */
                                              Notys:=Notys+1;
                                           END;
                
                                      IF "Production Order".Status="Production Order".Status::Finished THEN
                                       Completed:=Completed+1;

            end;

            trigger OnPreDataItem();
            begin
                    "Production Order".SETFILTER("Production Order"."Location Code",'PROD');
            end;
        }
        dataitem("Sales Header";"Sales Header")
        {
            DataItemTableView = SORTING(Document Type,No.) ORDER(Ascending);
            RequestFilterFields = "No.";
            column(COMPANYNAME_Control1000000023;COMPANYNAME)
            {
            }
            column(FORMAT_TODAY_0_4__Control1000000024;FORMAT(TODAY,0,4))
            {
            }
            column(USERID_Control1000000025;USERID)
            {
            }
            column(Total_QtyCaption;Total_QtyCaptionLbl)
            {
            }
            column(RPO_sreleasedCaption;RPO_sreleasedCaptionLbl)
            {
            }
            column(pendingCaption;pendingCaptionLbl)
            {
            }
            column(Sale_order_NoCaption;Sale_order_NoCaptionLbl)
            {
            }
            column(Sale_Order_Wise_RPO_StatusCaption;Sale_Order_Wise_RPO_StatusCaptionLbl)
            {
            }
            column(Sales_Header_Document_Type;"Document Type")
            {
            }
            column(Sales_Header_No_;"No.")
            {
            }
            dataitem("Sales Line";"Sales Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document No.) ORDER(Ascending);
                column(Sales_Line__Sales_Line___Document_No__;"Sales Line"."Document No.")
                {
                }
                column(total1;total1)
                {
                }
                column(poq;poq)
                {
                }
                column(rem;rem)
                {
                }
                column(Sales_Line_Document_Type;"Document Type")
                {
                }
                column(Sales_Line_Line_No_;"Line No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                                            //  "Sales Line".SETRANGE("Sales Line"."Document No.","Sales Header"."No.");
                                             //   IF "Sales Line".FIND('-') THEN
                                                  total1:=total1+"Sales Line".Quantity;
                                                  rem:=total1-poq;
                end;

                trigger OnPostDataItem();
                begin
                                                  total2:=total2+total1;
                                                    rem1:=rem1+rem;
                end;

                trigger OnPreDataItem();
                begin
                                        total1:=0;
                                        rem:=0;
                                         "Sales Line".SETFILTER("Sales Line"."Gen. Prod. Posting Group",'MPBI-FINIS');
                end;
            }

            trigger OnAfterGetRecord();
            begin
                                        "Production Order".SETRANGE("Production Order"."Sales Order No.","Sales Header"."No.");
                                        poq:=0;
                                         IF "Production Order".FIND('-') THEN
                                           REPEAT
                                         poq:=poq+"Production Order".Quantity;

                                         UNTIL "Production Order".NEXT=0;
                                            poq1:=poq1+poq;
            end;

            trigger OnPreDataItem();
            begin
                                                "Production Order".SETFILTER("Production Order"."Gen. Prod. Posting Group",'MPBI-FINIS');
            end;
        }
        dataitem("Interaction Group";"Interaction Group")
        {
            DataItemTableView = SORTING(Code);
            column(total2;total2)
            {
            }
            column(poq1;poq1)
            {
            }
            column(rem1;rem1)
            {
            }
            column(TotalCaption;TotalCaptionLbl)
            {
            }
            column(Interaction_Group_Code;Code)
            {
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

    var
        Total : Decimal;
        Notys : Decimal;
        Wip : Decimal;
        Completed : Decimal;
        "order" : Option Prodorder,Saleorder;
        total1 : Decimal;
        poq : Decimal;
        rem : Decimal;
        total2 : Decimal;
        poq1 : Decimal;
        rem1 : Decimal;
        Total_OrdersCaptionLbl : Label 'Total Orders';
        Not_yet_Started_OrdersCaptionLbl : Label 'Not yet Started Orders';
        In_Progress_OrdersCaptionLbl : Label 'In Progress Orders';
        Completed_OrdersCaptionLbl : Label 'Completed Orders';
        Production_Order_StatusCaptionLbl : Label 'Production Order Status';
        Total_QtyCaptionLbl : Label 'Total Qty';
        RPO_sreleasedCaptionLbl : Label 'RPO''sreleased';
        pendingCaptionLbl : Label 'pending';
        Sale_order_NoCaptionLbl : Label 'Sale order No';
        Sale_Order_Wise_RPO_StatusCaptionLbl : Label 'Sale Order Wise RPO Status';
        TotalCaptionLbl : Label 'Total';
}

