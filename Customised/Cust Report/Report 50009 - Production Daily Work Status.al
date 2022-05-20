report 50009 "Production Daily Work Status"
{
    // version santhosh

    DefaultLayout = RDLC;
    RDLCLayout = './Production Daily Work Status.rdlc';

    dataset
    {
        dataitem("Production Order";"Production Order")
        {
            RequestFilterFields = Status,"No.","Prod Start date","Sales Order No.";
            column(PlanOptionCaption;Plan)
            {
            }
            column(RoutOptionCaption;Rout)
            {
            }
            column(ConsumeOptionCaption;Consume)
            {
            }
            column(ReqOptionCaption;Req)
            {
            }
            column(FinishOptionCaption;Finish)
            {
            }
            column(ProdOrderHead1Visible;ProdOrderHead1Visible)
            {
            }
            column(ProdOrderHead2Visible;ProdOrderHead2Visible)
            {
            }
            column(ProdBody3Visible;ProdBody3Visible)
            {
            }
            column(COMPANYNAME;COMPANYNAME)
            {
            }
            column(Production_Order__No__;"No.")
            {
            }
            column(Production_Order__Sales_Order_No__;"Sales Order No.")
            {
            }
            column(Production_Request_PlanCaption;Production_Request_PlanCaptionLbl)
            {
            }
            column(Prod__Order_No_Caption;Prod__Order_No_CaptionLbl)
            {
            }
            column(Line_No_Caption;Line_No_CaptionLbl)
            {
            }
            column(Item_No_Caption;Item_No_CaptionLbl)
            {
            }
            column(DescriptionCaption;DescriptionCaptionLbl)
            {
            }
            column(QuantityCaption;QuantityCaptionLbl)
            {
            }
            column(Pending_QuantityCaption;Pending_QuantityCaptionLbl)
            {
            }
            column(Production_Order_Status;Status)
            {
            }
            dataitem("Prod. Order Routing Line";"Prod. Order Routing Line")
            {
                DataItemLink = Prod. Order No.=FIELD(No.);
                DataItemTableView = SORTING(Status,Prod. Order No.,Routing Reference No.,Routing No.,Operation No.) ORDER(Ascending) WHERE(Operation No.=FILTER(1000..9999));
                RequestFilterFields = "Work Center No.";
                ReqFilterHeading = 'Plan  And  Routing';
                column(ProdRoutLineHead1Visible;ProdRoutLineHead1Visible)
                {
                }
                column(ProdRoutLineHead2Visible;ProdRoutLineHead2Visible)
                {
                }
                column(ProdRoutLineBody5Visible;ProdRoutLineBody5Visible)
                {
                }
                column(COMPANYNAME_Control1000000019;COMPANYNAME)
                {
                }
                column(COMPANYNAME_Control1000000015;COMPANYNAME)
                {
                }
                column(Prod__Order_Routing_Line__Prod__Order_No__;"Prod. Order No.")
                {
                }
                column(Prod__Order_Routing_Line__Operation_Description_;"Operation Description")
                {
                }
                column(Desc;Desc)
                {
                }
                column(Prod__Order_Routing_Line__Run_Time_;"Run Time")
                {
                }
                column(Prod__Order_Routing_Line__Operation_No__;"Operation No.")
                {
                }
                column(Prod__Order_Routing_Line__Work_Center_No__;"Work Center No.")
                {
                }
                column(Production_PlanCaption;Production_PlanCaptionLbl)
                {
                }
                column(RoutingCaption;RoutingCaptionLbl)
                {
                }
                column(Prod__Order_Routing_Line__Prod__Order_No__Caption;FIELDCAPTION("Prod. Order No."))
                {
                }
                column(Prod__Order_Routing_Line__Operation_Description_Caption;FIELDCAPTION("Operation Description"))
                {
                }
                column(Prod__Order_Routing_Line__Work_Center_No__Caption;FIELDCAPTION("Work Center No."))
                {
                }
                column(Prod__Order_Routing_Line__Run_Time_Caption;FIELDCAPTION("Run Time"))
                {
                }
                column(DescriptionCaption_Control1000000009;DescriptionCaption_Control1000000009Lbl)
                {
                }
                column(Prod__Order_Routing_Line__Operation_No__Caption;FIELDCAPTION("Operation No."))
                {
                }
                column(Prod__Order_Routing_Line_Status;Status)
                {
                }
                column(Prod__Order_Routing_Line_Routing_Reference_No_;"Routing Reference No.")
                {
                }
                column(Prod__Order_Routing_Line_Routing_No_;"Routing No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    //Rev01 Start
                    CLEAR(ProdRoutLineHead1Visible);
                    CLEAR(ProdRoutLineHead2Visible);
                    CLEAR(ProdRoutLineBody5Visible);
                    //Rev01 End
                    
                    IF Choice=Choice::Rout THEN BEGIN
                      Rout_Avail:=FALSE;
                    
                      CPL.SETCURRENTKEY(CPL."Order No.",CPL."Order Line No.",CPL."Routing No.",CPL."Routing Reference No.",CPL."Operation No.",CPL."Last Output Line");
                      CPL.SETRANGE(CPL."Order No.","Prod. Order Routing Line"."Prod. Order No.");
                      CPL.SETRANGE(CPL."Order Line No.","Prod. Order Routing Line"."Routing Reference No.");
                      CPL.SETRANGE(CPL."Operation No.","Prod. Order Routing Line"."Operation No.");
                      IF CPL.FIND('-') THEN
                        Rout_Avail:=TRUE;
                    END;
                    
                    //Rev01 Start
                    //Prod. Order Routing Line, Header (1) - OnPreSection() >>
                    //Code Commented
                    //CurrReport.SHOWOUTPUT(Choice=Choice::Plan);
                    IF Choice = Choice :: Plan THEN
                      ProdRoutLineHead1Visible := TRUE;
                    //Prod. Order Routing Line, Header (1) - OnPreSection() <<
                    
                    //Prod. Order Routing Line, Header (2) - OnPreSection() >>
                    //Code Commented
                    //CurrReport.SHOWOUTPUT(Choice=Choice::Rout);
                    IF Choice = Choice :: Rout THEN
                      ProdRoutLineHead2Visible := TRUE;
                    //Prod. Order Routing Line, Header (2) - OnPreSection() <<
                    
                    
                    //Prod. Order Routing Line, Body (5) - OnPreSection() >>
                    //Code Commented
                    /*
                    IF Choice=Choice::Rout THEN
                      CurrReport.SHOWOUTPUT(NOT Rout_Avail);
                    */
                    IF Choice = Choice :: Rout THEN BEGIN
                      IF NOT Rout_Avail THEN
                        ProdRoutLineBody5Visible := TRUE;
                    END ELSE
                      ProdRoutLineBody5Visible := TRUE;
                    
                    IF item.GET("Prod. Order Routing Line"."Item No.")  THEN
                      Desc := item.Description;
                    //Prod. Order Routing Line, Body (5) - OnPreSection() <<

                end;

                trigger OnPreDataItem();
                begin
                    IF (Choice <> Choice::Plan) AND (Choice <> Choice::Rout) THEN
                      CurrReport.BREAK;
                    IF Choice = Choice :: Plan THEN
                      "Prod. Order Routing Line".SETFILTER("Prod. Order Routing Line".Type,'Work Center');
                end;
            }
            dataitem("Prod. Order Line";"Prod. Order Line")
            {
                DataItemLink = Prod. Order No.=FIELD(No.);
                RequestFilterFields = "Line No.";
                column(ProdOrderLineHead1Visible;ProdOrderLineHead1Visible)
                {
                }
                column(ProdOrderLineBody2Visible;ProdOrderLineBody2Visible)
                {
                }
                column(ProdOrderLineBody3visible;ProdOrderLineBody3visible)
                {
                }
                column(COMPANYNAME_Control1000000023;COMPANYNAME)
                {
                }
                column(Prod__Order_Line__Prod__Order_No__;"Prod. Order No.")
                {
                }
                column(Prod__Order_Line__Line_No__;"Line No.")
                {
                }
                column(Prod__Order_Line__Item_No__;"Item No.")
                {
                }
                column(Prod__Order_Line_Description;Description)
                {
                }
                column(Prod__Order_Line_Quantity;Quantity)
                {
                }
                column(PendignQty;PendignQty)
                {
                }
                column(ConsumptionCaption;ConsumptionCaptionLbl)
                {
                }
                column(Item_No_Caption_Control1000000024;Item_No_Caption_Control1000000024Lbl)
                {
                }
                column(DescriptionCaption_Control1000000025;DescriptionCaption_Control1000000025Lbl)
                {
                }
                column(To_Be_Consumed_QTYCaption;To_Be_Consumed_QTYCaptionLbl)
                {
                }
                column(Prod_Order_NOCaption;Prod_Order_NOCaptionLbl)
                {
                }
                column(Line_NoCaption;Line_NoCaptionLbl)
                {
                }
                column(Prod__Order_Line_Status;Status)
                {
                }
                dataitem("Prod. Order Component";"Prod. Order Component")
                {
                    DataItemLink = Prod. Order No.=FIELD(Prod. Order No.),Prod. Order Line No.=FIELD(Line No.);
                    DataItemTableView = SORTING(Status,Prod. Order No.,Prod. Order Line No.,Item No.,Line No.) ORDER(Ascending) WHERE(Remaining Quantity=FILTER(>0));
                    column(ProdOrderCompBody1Visible;ProdOrderCompBody1Visible)
                    {
                    }
                    column(Prod__Order_Component__Remaining_Quantity_;"Remaining Quantity")
                    {
                    }
                    column(Prod__Order_Component_Description;Description)
                    {
                    }
                    column(Prod__Order_Component__Item_No__;"Item No.")
                    {
                    }
                    column(Prod__Order_Component__Prod__Order_Component___Prod__Order_No__;"Prod. Order Component"."Prod. Order No.")
                    {
                    }
                    column(Prod__Order_Component__Prod__Order_Component___Prod__Order_Line_No__;"Prod. Order Component"."Prod. Order Line No.")
                    {
                    }
                    column(Prod__Order_Component_Status;Status)
                    {
                    }
                    column(Prod__Order_Component_Line_No_;"Line No.")
                    {
                    }

                    trigger OnAfterGetRecord();
                    begin
                        //Rev01 Start
                        
                        CLEAR(ProdOrderCompBody1Visible);
                        
                        //Prod. Order Component, Body (1) - OnPreSection() >>
                        //Code Commented
                        /*
                        //CurrReport.SHOWOUTPUT(Choice=Choice::Consume);
                        */
                        IF Choice = Choice :: Consume THEN
                          ProdOrderCompBody1Visible := TRUE;
                        //Prod. Order Component, Body (1) - OnPreSection() <<
                        
                        //Rev01 End

                    end;

                    trigger OnPreDataItem();
                    begin
                        IF (Choice<>Choice::Consume)  THEN
                          CurrReport.BREAK;
                    end;
                }
                dataitem("Posted Material Issues Header";"Posted Material Issues Header")
                {
                    DataItemLink = Prod. Order No.=FIELD(Prod. Order No.),Prod. Order Line No.=FIELD(Line No.);
                    DataItemTableView = SORTING(Prod. Order No.,Prod. Order Line No.) ORDER(Ascending);
                    column(PostMatIssHeadBody1Visible;PostMatIssHeadBody1Visible)
                    {
                    }
                    column(ExcessCaption;ExcessCaptionLbl)
                    {
                    }
                    column(Posted_Material_Issues_Header_No_;"No.")
                    {
                    }
                    column(Posted_Material_Issues_Header_Prod__Order_No_;"Prod. Order No.")
                    {
                    }
                    column(Posted_Material_Issues_Header_Prod__Order_Line_No_;"Prod. Order Line No.")
                    {
                    }
                    dataitem("Posted Material Issues Line";"Posted Material Issues Line")
                    {
                        DataItemLink = Document No.=FIELD(No.);
                        DataItemTableView = SORTING(Document No.,Line No.) ORDER(Ascending);
                        column(PostMatIssLineBody1Visible;PostMatIssLineBody1Visible)
                        {
                        }
                        column(Posted_Material_Issues_Line__Posted_Material_Issues_Line__Quantity;"Posted Material Issues Line".Quantity)
                        {
                        }
                        column(Posted_Material_Issues_Line_Description;Description)
                        {
                        }
                        column(Posted_Material_Issues_Line__Item_No__;"Item No.")
                        {
                        }
                        column(Posted_Material_Issues_Header___Prod__Order_No__;"Posted Material Issues Header"."Prod. Order No.")
                        {
                        }
                        column(Posted_Material_Issues_Header___Prod__Order_Line_No__;"Posted Material Issues Header"."Prod. Order Line No.")
                        {
                        }
                        column(Posted_Material_Issues_Line_Document_No_;"Document No.")
                        {
                        }
                        column(Posted_Material_Issues_Line_Line_No_;"Line No.")
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                            
                            CLEAR(PostMatIssLineBody1Visible); //Rev01
                            
                            "CONSUMED QTY":=0;
                            //Rev01 Start
                            //Code Commented
                            /*
                            ILE.SETCURRENTKEY(ILE."Prod. Order No.",ILE."Prod. Order Line No.",ILE."Prod. Order Comp. Line No.",ILE."Entry Type");
                            */
                            ILE.SETCURRENTKEY("Order Type","Order No.","Order Line No.","Prod. Order Comp. Line No.","Entry Type");
                            //Rev01 End
                            ILE.SETFILTER(ILE."Entry Type",'Consumption');
                            ILE.SETRANGE("Order Type",ILE."Order Type"::Production);//Rev01
                            ILE.SETRANGE("Entry Type",ILE."Entry Type"::Consumption);
                            ILE.SETRANGE("Order No.","Posted Material Issues Header"."Prod. Order No.");
                            ILE.SETRANGE("Order Line No.","Posted Material Issues Header"."Prod. Order Line No.");
                            ILE.SETRANGE("Item No.","Posted Material Issues Line"."Item No.");
                            IF ILE.FIND('-') THEN
                              REPEAT
                                "CONSUMED QTY"-=ILE.Quantity;
                              UNTIL ILE.NEXT=0;
                            //message('hai');
                            
                            
                            //Posted Material Issues Line, Body (1) - OnPreSection() >>
                            //Rev01 Start
                            //Code Commented
                            /*
                            CurrReport.SHOWOUTPUT(("Posted Material Issues Line"."Prod. Order No."='') AND (Choice=Choice::Consume));
                            */
                            IF ("Posted Material Issues Line"."Prod. Order No." = '') AND (Choice=Choice::Consume) THEN
                              PostMatIssLineBody1Visible := TRUE;
                            //Rev01 End
                            //Posted Material Issues Line, Body (1) - OnPreSection() <<

                        end;
                    }

                    trigger OnAfterGetRecord();
                    begin
                        //Rev01 start
                        CLEAR(PostMatIssHeadBody1Visible);
                        
                        //Posted Material Issues Header, Body (1) - OnPreSection() >>
                        //Code Commented
                        /*
                        CurrReport.SHOWOUTPUT(Choice=Choice::Consume);
                        */
                        IF Choice = Choice :: Consume THEN
                          PostMatIssHeadBody1Visible := TRUE;
                        //Posted Material Issues Header, Body (1) - OnPreSection() <<
                        
                        //Rev01 End

                    end;

                    trigger OnPostDataItem();
                    begin
                        PostMatIssHeadBody1Visible := FALSE;
                    end;

                    trigger OnPreDataItem();
                    begin
                        IF (Choice<>Choice::Consume)  THEN
                          CurrReport.BREAK;
                    end;
                }

                trigger OnAfterGetRecord();
                begin
                    
                    //Rev01 Start
                    CLEAR(ProdOrderLineHead1Visible);
                    CLEAR(ProdOrderLineBody2Visible);
                    CLEAR(ProdOrderLineBody3visible);
                    //Rev01 End
                    
                    
                    
                    //Rev01 Start
                    //Prod. Order Line, Header (1) - OnPreSection() >>
                    //Code Commented
                    /*
                    CurrReport.SHOWOUTPUT(Choice=Choice::Consume);
                    */
                    IF Choice = Choice :: Consume THEN
                      ProdOrderLineHead1Visible := TRUE;
                    //Prod. Order Line, Header (1) - OnPreSection() <<
                    
                    //Prod. Order Line, Body (2) - OnPreSection() >>
                    
                    IF Choice = Choice :: Req THEN BEGIN
                    
                      ProdOrderLineBody2Visible := TRUE; //Rev01
                    
                      MIH.SETCURRENTKEY(MIH."Prod. Order No.",MIH."Prod. Order Line No.");
                      MIH.SETRANGE(MIH."Prod. Order No.","Production Order"."No.");
                      MIH.SETRANGE(MIH."Prod. Order Line No.","Prod. Order Line"."Line No.");
                      IF MIH.FIND('-') THEN BEGIN
                        Cnt:=MIH.COUNT;
                        IF Cnt = "Prod. Order Line".Quantity THEN
                    
                          //Rev01 Start
                          //Code Commented
                          /*
                          CurrReport.SHOWOUTPUT:=FALSE
                          */
                          ProdOrderLineBody2Visible := FALSE
                          //Rev01 End
                        ELSE
                          PendignQty:="Prod. Order Line".Quantity-Cnt;
                      END;
                    
                      PMH.SETCURRENTKEY(PMH."Prod. Order No.",PMH."Prod. Order Line No.");
                      PMH.SETRANGE(PMH."Prod. Order No.","Production Order"."No.");
                      PMH.SETRANGE(PMH."Prod. Order Line No.","Prod. Order Line"."Line No.");
                      IF PMH.FIND('-') THEN
                        //Rev01 Start
                        //Code Commented
                        /*
                        CurrReport.SHOWOUTPUT := FALSE;
                        */
                        ProdOrderLineBody2Visible := FALSE;
                        //Rev01 End
                    END ELSE
                      CurrReport.SHOWOUTPUT := FALSE;
                    //Prod. Order Line, Body (2) - OnPreSection() <<
                    
                    //Prod. Order Line, Body (3) - OnPreSection() >>
                    //Rev01 Start
                    //Code Commented
                    /*
                    CurrReport.SHOWOUTPUT(Choice=Choice::Consume);
                    */
                    IF Choice = Choice :: Consume THEN
                      ProdOrderLineBody3visible := TRUE;
                    //Prod. Order Line, Body (3) - OnPreSection() <<
                    
                    //Rev01 End

                end;

                trigger OnPreDataItem();
                begin
                    IF (Choice <> Choice :: Consume) AND (Choice <> Choice::Req) THEN
                      CurrReport.BREAK;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                //Rev01 Start
                CLEAR(ProdOrderHead1Visible);
                CLEAR(ProdOrderHead2Visible);
                CLEAR(ProdBody3Visible);

                //Production Order, Header (1) - OnPreSection() >>
                //Code Commented
                //CurrReport.SHOWOUTPUT(Choice=Choice::Req);
                IF Choice = Choice :: Req THEN
                  ProdOrderHead1Visible := TRUE;
                //Production Order, Header (1) - OnPreSection() <<

                //Production Order, Header (2) - OnPreSection() >>
                //Code Commented
                //CurrReport.SHOWOUTPUT(Choice=Choice::Req);
                IF Choice = Choice :: Req THEN
                  ProdOrderHead2Visible := TRUE;
                //Production Order, Header (2) - OnPreSection() <<

                //Production Order, Body (3) - OnPreSection() >>
                //CurrReport.SHOWOUTPUT(Choice=Choice::Finish);
                IF Choice = Choice :: Finish THEN
                  ProdBody3Visible := TRUE;
                //Production Order, Body (3) - OnPreSection() <<

                //Rev01 End

                IF Choice = Choice :: Finish THEN BEGIN
                  "Prod. Order Status Management".ChangeStatusOnProdOrder("Production Order","Production Order".Status::Finished,"Completion Date",FALSE);
                  COMMIT;
                  PRM.ProdOrdRefresh("Production Order"."No.");
                END;

                IF Update_in_PRM THEN BEGIN
                  PRM.ProdOrdRefresh("Production Order"."No.");
                END;

                IF Update_Production_Date THEN BEGIN
                  IF (Prod_Start_Date=0D) AND (Prod_Dispatch_Date=0D) THEN
                    ERROR('PLEASE ENTER THE PRODUCTION START & DISPATCH DATES');
                  IF (Prod_Start_Date>0D) THEN BEGIN
                    "Production Order"."Prod Start date":=Prod_Start_Date;
                    "Production Order".VALIDATE("Production Order"."Prod Start date",Prod_Start_Date);
                  END;
                  IF (Prod_Dispatch_Date>0D) THEN BEGIN
                    "Production Order"."Planned Dispatch Date":=Prod_Dispatch_Date;
                    "Production Order".VALIDATE("Production Order"."Planned Dispatch Date",Prod_Dispatch_Date);
                  END;
                  "Production Order".MODIFY;
                END;
            end;

            trigger OnPreDataItem();
            begin
                IF (Choice=Choice::Finish) AND ("Completion Date"=0D) THEN //Existing code
                   ERROR('PLEASE ENTER THE POSTING DATE')
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    grid(Control1102152006)
                    {
                        GridLayout = Rows;
                        ShowCaption = false;
                        group(Control1102152008)
                        {
                            ShowCaption = false;
                            field(Plan;Plan)
                            {
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    Plan := TRUE;  //Planning Validate
                                    Choice := Choice :: Plan;
                                    Rout := FALSE;
                                    Consume := FALSE;
                                    Req := FALSE;
                                    Finish := FALSE;
                                end;
                            }
                            field(Planning;'')
                            {
                                ShowCaption = false;
                            }
                            field(Control1102152012;'')
                            {
                                ShowCaption = false;
                            }
                            field(Control1102152013;'')
                            {
                                ShowCaption = false;
                            }
                            field(Control1102152014;'')
                            {
                                ShowCaption = false;
                            }
                            field(Control1102152015;'')
                            {
                                ShowCaption = false;
                            }
                            field(Control1102152016;'')
                            {
                                ShowCaption = false;
                            }
                            field(Control1102152017;'')
                            {
                                ShowCaption = false;
                            }
                            field(Control1102152018;'')
                            {
                                ShowCaption = false;
                            }
                            field(Control1102152019;'')
                            {
                                ShowCaption = false;
                            }
                            field(Control1102152020;'')
                            {
                                ShowCaption = false;
                            }
                            field(Control1102152021;'')
                            {
                                ShowCaption = false;
                            }
                            field(Control1102152022;'')
                            {
                                ShowCaption = false;
                            }
                            field(Control1102152023;'')
                            {
                                ShowCaption = false;
                            }
                        }
                        group(Control1102152007)
                        {
                            ShowCaption = false;
                            field(Rout;Rout)
                            {
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    Plan := FALSE;
                                    Rout := TRUE; //Routing Validate
                                    Choice := Choice :: Rout;
                                    Consume := FALSE;
                                    Req := FALSE;
                                    Finish := FALSE;
                                end;
                            }
                            field(Routing;'')
                            {
                                ShowCaption = false;
                            }
                        }
                        grid(Control1102152032)
                        {
                            GridLayout = Rows;
                            ShowCaption = false;
                            field(Consume;Consume)
                            {
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    Plan := FALSE;
                                    Rout := FALSE;
                                    Consume := TRUE; //Consume Validate
                                    Choice := Choice :: Consume;
                                    Req := FALSE;
                                    Finish := FALSE;
                                end;
                            }
                            field(Consumption;'')
                            {
                                ShowCaption = false;
                            }
                        }
                        grid(Control1102152033)
                        {
                            ShowCaption = false;
                            field(Req;Req)
                            {
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    Plan := FALSE;
                                    Rout := FALSE;
                                    Consume := FALSE;
                                    Req := TRUE; //Req Validate
                                    Choice := Choice :: Req;
                                    Finish := FALSE;
                                end;
                            }
                            field("Request Plan";'')
                            {
                                ShowCaption = false;
                            }
                        }
                        grid(Control1102152038)
                        {
                            ShowCaption = false;
                            field(Finish;Finish)
                            {
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    Plan := FALSE;
                                    Rout := FALSE;
                                    Consume := FALSE;
                                    Req := FALSE;
                                    Finish := TRUE; //Finish Validate
                                    Choice := Choice :: Finish;
                                end;
                            }
                            field("Finish Production Order";'')
                            {
                                ShowCaption = false;
                            }
                            field("Posting Date";'')
                            {
                                ShowCaption = false;
                            }
                            field("Completion Date";"Completion Date")
                            {
                                ShowCaption = false;
                            }
                            field(" { Please Mention the Completion Date Here }";'')
                            {
                                Caption = '" { Please Mention the Completion Date Here }"';
                                ShowCaption = false;
                            }
                        }
                        grid(Control1102152009)
                        {
                            ShowCaption = false;
                            field(Update_in_PRM;Update_in_PRM)
                            {
                                ShowCaption = false;
                            }
                            field("Update in PRM";'')
                            {
                                Caption = 'Update in PRM';
                                ShowCaption = false;
                            }
                        }
                        grid(Control1102152026)
                        {
                            ShowCaption = false;
                            field(Update_Production_Date;Update_Production_Date)
                            {
                                ShowCaption = false;
                            }
                            field("Update Production Start & Dispatch Date Information";'')
                            {
                                Caption = 'Update Production Start & Dispatch Date Information';
                                ShowCaption = false;
                            }
                            field("Production Start Date";'')
                            {
                                ShowCaption = false;
                            }
                            field(Prod_Start_Date;Prod_Start_Date)
                            {
                                ShowCaption = false;
                            }
                            field("Production Dispatch Date";'')
                            {
                                ShowCaption = false;
                            }
                            field(Prod_Dispatch_Date;Prod_Dispatch_Date)
                            {
                                ShowCaption = false;
                            }
                            field(Control1102152024;'')
                            {
                                ShowCaption = false;
                            }
                            field(Control1102152025;'')
                            {
                                ShowCaption = false;
                            }
                        }
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage();
        begin
            Plan := TRUE;
        end;
    }

    labels
    {
    }

    var
        item : Record Item;
        Desc : Text[50];
        Choice : Option Plan,Rout,Consume,Req,Finish;
        CPL : Record "Capacity Ledger Entry";
        Rout_Avail : Boolean;
        ILE : Record "Item Ledger Entry";
        "CONSUMED QTY" : Decimal;
        "PROD.ORDER NO" : Code[20];
        MIH : Record "Material Issues Header";
        Test : Text[30];
        PMH : Record "Posted Material Issues Header";
        Cnt : Integer;
        PendignQty : Integer;
        "Prod. Order Status Management" : Codeunit "Prod. Order Status Management";
        "Completion Date" : Date;
        Update_in_PRM : Boolean;
        PRM : Codeunit SQLIntegration;
        Prod_Start_Date : Date;
        Prod_Dispatch_Date : Date;
        Update_Production_Date : Boolean;
        Production_Request_PlanCaptionLbl : Label 'Production Request Plan';
        Prod__Order_No_CaptionLbl : Label 'Prod. Order No.';
        Line_No_CaptionLbl : Label 'Line No.';
        Item_No_CaptionLbl : Label 'Item No.';
        DescriptionCaptionLbl : Label 'Description';
        QuantityCaptionLbl : Label 'Quantity';
        Pending_QuantityCaptionLbl : Label 'Pending Quantity';
        Production_PlanCaptionLbl : Label 'Production Plan';
        RoutingCaptionLbl : Label 'Routing';
        DescriptionCaption_Control1000000009Lbl : Label 'Description';
        ConsumptionCaptionLbl : Label 'Consumption';
        Item_No_Caption_Control1000000024Lbl : Label 'Item No.';
        DescriptionCaption_Control1000000025Lbl : Label 'Description';
        To_Be_Consumed_QTYCaptionLbl : Label 'To Be Consumed QTY';
        Prod_Order_NOCaptionLbl : Label 'Prod Order NO';
        Line_NoCaptionLbl : Label 'Line No';
        ExcessCaptionLbl : Label 'Excess';
        "-Rev01-" : Integer;
        Plan : Boolean;
        Rout : Boolean;
        Consume : Boolean;
        Req : Boolean;
        Finish : Boolean;
        ProdOrderHead1Visible : Boolean;
        ProdOrderHead2Visible : Boolean;
        ProdBody3Visible : Boolean;
        ProdRoutLineHead1Visible : Boolean;
        ProdRoutLineHead2Visible : Boolean;
        ProdRoutLineBody5Visible : Boolean;
        ProdOrderLineHead1Visible : Boolean;
        ProdOrderLineBody2Visible : Boolean;
        ProdOrderLineBody3visible : Boolean;
        ProdOrderCompBody1Visible : Boolean;
        PostMatIssHeadBody1Visible : Boolean;
        PostMatIssLineBody1Visible : Boolean;
}

