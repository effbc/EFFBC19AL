report 50028 "Product wise Bench mark"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Product wise Bench mark.rdlc';

    dataset
    {
        dataitem("Production BOM Header";"Production BOM Header")
        {
            RequestFilterFields = "No.";
            column(COMPANYNAME;COMPANYNAME)
            {
            }
            column(Production_BOM_Header__No__;"No.")
            {
            }
            column(FORMAT_TODAY_0_4_;FORMAT(TODAY,0,4))
            {
            }
            column(Production_BOM_Header__No___Control1000000000;"No.")
            {
            }
            column(COMPANYNAME_Control1000000026;COMPANYNAME)
            {
            }
            column(FORMAT_TODAY_0_4__Control1000000027;FORMAT(TODAY,0,4))
            {
            }
            column(Production_BOM_Header_Description;Description)
            {
            }
            column(TPRODH;TPRODH)
            {
            }
            column(TSHFH;TSHFH)
            {
            }
            column(TQASH;TQASH)
            {
            }
            column(TMPRH;TMPRH)
            {
            }
            column(TOT;TOT)
            {
            }
            column(No_Caption;No_CaptionLbl)
            {
            }
            column(Routing_Wise_Bench_MarkCaption;Routing_Wise_Bench_MarkCaptionLbl)
            {
            }
            column(DescriptionCaption;DescriptionCaptionLbl)
            {
            }
            column(Time_For_ProductionCaption;Time_For_ProductionCaptionLbl)
            {
            }
            column(Time_For_MPRCaption;Time_For_MPRCaptionLbl)
            {
            }
            column(Time_For_QASCaption;Time_For_QASCaptionLbl)
            {
            }
            column(Time_For_SHFCaption;Time_For_SHFCaptionLbl)
            {
            }
            column(Total_Time_Caption;Total_Time_CaptionLbl)
            {
            }
            column(Production_BOM_Header__No___Control1000000000Caption;FIELDCAPTION("No."))
            {
            }
            column(DescrptionCaption;DescrptionCaptionLbl)
            {
            }
            column(QtyCaption;QtyCaptionLbl)
            {
            }
            column(SMD_Caption;SMD_CaptionLbl)
            {
            }
            column(Fixing_Caption;Fixing_CaptionLbl)
            {
            }
            column(DIP_Caption;DIP_CaptionLbl)
            {
            }
            column(SMDCaption;SMDCaptionLbl)
            {
            }
            column(DIPCaption;DIPCaptionLbl)
            {
            }
            column(FixingsCaption;FixingsCaptionLbl)
            {
            }
            column(Product_Wise_Bench_markCaption;Product_Wise_Bench_markCaptionLbl)
            {
            }
            column(With_FixingsCaption;With_FixingsCaptionLbl)
            {
            }
            column(Total_Caption;Total_CaptionLbl)
            {
            }
            column(SMDCaption_Control1000000053;SMDCaption_Control1000000053Lbl)
            {
            }
            column(DIPCaption_Control1000000088;DIPCaption_Control1000000088Lbl)
            {
            }
            column(Without_FixingsCaption;Without_FixingsCaptionLbl)
            {
            }
            column(PointsCaption;PointsCaptionLbl)
            {
            }
            column(Total_PointsCaption;Total_PointsCaptionLbl)
            {
            }
            column(SMD_Caption_Control1000000093;SMD_Caption_Control1000000093Lbl)
            {
            }
            column(DIP_Caption_Control1000000094;DIP_Caption_Control1000000094Lbl)
            {
            }
            column(Fixing_Caption_Control1000000095;Fixing_Caption_Control1000000095Lbl)
            {
            }
            column(Bench_Mark___In_Mins_Caption;Bench_Mark___In_Mins_CaptionLbl)
            {
            }
            column(Toatal_Bench_Mark___in_HRS_Caption;Toatal_Bench_Mark___in_HRS_CaptionLbl)
            {
            }
            column(ComponentsCaption;ComponentsCaptionLbl)
            {
            }
            dataitem("Production BOM Line";"Production BOM Line")
            {
                DataItemLink = Production BOM No.=FIELD(No.);
                DataItemTableView = SORTING(Production BOM No.,Version Code,Line No.);
                RequestFilterFields = "Line No.";
                column(Production_BOM_Line_Description;Description)
                {
                }
                column(TPRODH_Control1000000052;TPRODH)
                {
                }
                column(TSHFH_Control1000000054;TSHFH)
                {
                }
                column(TQASH_Control1000000055;TQASH)
                {
                }
                column(TMPRH_Control1000000056;TMPRH)
                {
                }
                column(TOT_Control1000000057;TOT)
                {
                }
                column(Production_BOM_Line_Quantity;Quantity)
                {
                }
                column(Production_BOM_Line__Production_BOM_Line___Quantity_per_;"Production BOM Line"."Quantity per")
                {
                }
                column(item_Description;item.Description)
                {
                }
                column(smd;smd)
                {
                }
                column(dip;dip)
                {
                }
                column(fixing_holes_;"fixing holes")
                {
                }
                column(tsmd;tsmd)
                {
                }
                column(tdip;tdip)
                {
                }
                column(bensmd;bensmd)
                {
                }
                column(bendip;bendip)
                {
                }
                column(denfholes;denfholes)
                {
                }
                column(tbench;tbench)
                {
                }
                column(totcmp;totcmp)
                {
                }
                column(TOT_SMD;TOT_SMD)
                {
                }
                column(TOT_DIP;TOT_DIP)
                {
                }
                column(TOT_BT_WFH__;"TOT_BT(WFH)")
                {
                }
                column(tfholes;tfholes)
                {
                }
                column(T1;T1)
                {
                }
                column(T2;T2)
                {
                }
                column(T3;T3)
                {
                }
                column(T4;T4)
                {
                }
                column(TOT_Control1000000086;TOT)
                {
                }
                column(Test3;Test3)
                {
                }
                column(Test1;Test1)
                {
                }
                column(first;first)
                {
                }
                column(smd1;smd1)
                {
                }
                column(dip1;dip1)
                {
                }
                column(fixing;fixing)
                {
                }
                column(tsmd1;tsmd1)
                {
                }
                column(tdip1;tdip1)
                {
                }
                column(tfholes1;tfholes1)
                {
                }
                column(bensmd1;bensmd1)
                {
                }
                column(bendip1;bendip1)
                {
                }
                column(denfholes1;denfholes1)
                {
                }
                column(tbench1;tbench1)
                {
                }
                column(totcmp1;totcmp1)
                {
                }
                column(TOT_PROD_;"TOT-PROD")
                {
                }
                column(TOT_SHF_;"TOT-SHF")
                {
                }
                column(TOT_QAS_;"TOT-QAS")
                {
                }
                column(TOT_MPR_;"TOT-MPR")
                {
                }
                column(TOT_TOT_;"TOT-TOT")
                {
                }
                column(totalcmpnt;totalcmpnt)
                {
                }
                column(totalbench;totalbench)
                {
                }
                column(TOTALSCaption;TOTALSCaptionLbl)
                {
                }
                column(TotalCaption;TotalCaptionLbl)
                {
                }
                column(Production_BOM_Line_Production_BOM_No_;"Production BOM No.")
                {
                }
                column(Production_BOM_Line_Version_Code;"Version Code")
                {
                }
                column(Production_BOM_Line_Line_No_;"Line No.")
                {
                }
                column(Production_BOM_Line_No_;"No.")
                {
                }
                dataitem("<Production BOM Line1>";"Production BOM Line")
                {
                    DataItemLink = Production BOM No.=FIELD(No.);
                    DataItemTableView = SORTING(Production BOM No.,Version Code,Line No.);
                    column(TOT_Control1102154001;TOT)
                    {
                    }
                    column(TMPRH_Control1102154017;TMPRH)
                    {
                    }
                    column(TQASH_Control1102154018;TQASH)
                    {
                    }
                    column(TSHFH_Control1102154019;TSHFH)
                    {
                    }
                    column(TPRODH_Control1102154020;TPRODH)
                    {
                    }
                    column(Production_BOM_Line1__Description;Description)
                    {
                    }
                    column(Production_BOM_Line1__Description_Control1102154000;Description)
                    {
                    }
                    column(TOT_DIP_Control1102154002;TOT_DIP)
                    {
                    }
                    column(TOT_SMD_Control1102154003;TOT_SMD)
                    {
                    }
                    column(totcmp_Control1102154004;totcmp)
                    {
                    }
                    column(TOT_BT_WFH___Control1102154005;"TOT_BT(WFH)")
                    {
                    }
                    column(tbench_Control1102154006;tbench)
                    {
                    }
                    column(denfholes_Control1102154007;denfholes)
                    {
                    }
                    column(bendip_Control1102154008;bendip)
                    {
                    }
                    column(bensmd_Control1102154009;bensmd)
                    {
                    }
                    column(tfholes_Control1102154010;tfholes)
                    {
                    }
                    column(tdip_Control1102154011;tdip)
                    {
                    }
                    column(tsmd_Control1102154012;tsmd)
                    {
                    }
                    column(fixing_holes__Control1102154013;"fixing holes")
                    {
                    }
                    column(dip_Control1102154014;dip)
                    {
                    }
                    column(smd_Control1102154015;smd)
                    {
                    }
                    column(Production_BOM_Line___Quantity_per_;"Production BOM Line"."Quantity per")
                    {
                    }
                    column(Production_BOM_Line1__Production_BOM_No_;"Production BOM No.")
                    {
                    }
                    column(Production_BOM_Line1__Version_Code;"Version Code")
                    {
                    }
                    column(Production_BOM_Line1__Line_No_;"Line No.")
                    {
                    }

                    trigger OnAfterGetRecord();
                    begin
                          IF choice=choice::PROD THEN
                          BEGIN
                            IF item.GET( "<Production BOM Line1>"."No.") THEN
                            BEGIN
                              IF PBMH2.GET("<Production BOM Line1>"."No.") THEN
                              BEGIN
                                smd:=PBMH2."Total Soldering Points SMD";
                                dip:=PBMH2."Total Soldering Points DIP";
                                "fixing holes":=PBMH2."Total No. of Fixing Holes";
                                tsmd:=smd*"<Production BOM Line1>"."Quantity per";
                                tdip:=dip*"<Production BOM Line1>"."Quantity per";
                                tfholes:="fixing holes"*"<Production BOM Line1>"."Quantity per";
                                "Manufacturing Setup".GET;
                                bensmd:=(tsmd*"Manufacturing Setup"."Soldering Time Req.for BID")/60;
                                bendip:=(tdip*"Manufacturing Setup"."Soldering Time Req.for DIP")/60;
                                "TOT_BT(WFH)"+=bensmd+bendip;
                                denfholes:=(tfholes*"Manufacturing Setup"."Total Fixing Points Time")/60;
                                "TotBench Mark":=(bensmd+bendip)/60;
                                "Prod Tot Bench Mark"+="TotBench Mark";
                                tbench:=(bensmd+bendip+denfholes)/60;
                                totalbench:=totalbench+tbench;
                                "TOT_BT(WFH)":="TOT_BT(WFH)"/60;
                                ProductionBomLine.SETRANGE("Production BOM No.","<Production BOM Line1>"."No.");
                                IF ProductionBomLine.FIND('-') THEN
                                REPEAT
                                  BOMQ := 0;
                                  IF ProductionBomLine.Quantity < 1 THEN
                                    BOMQ := 1
                                  ELSE
                                    BOMQ :=  ProductionBomLine.Quantity;
                                  IF ProductionBomLine."Type of Solder"=ProductionBomLine."Type of Solder"::SMD THEN
                                    TOT_SMD +="Production BOM Line".Quantity*BOMQ
                                  ELSE
                                    TOT_DIP+="Production BOM Line".Quantity*BOMQ;
                                  BOMLQ += BOMQ;
                                UNTIL ProductionBomLine.NEXT = 0;
                                totcmp:=TOT_SMD+TOT_DIP;
                                totalcmpnt+=totcmp;
                                totcmp:=BOMLQ*"Production BOM Line"."Quantity per";
                              END   ELSE
                               CurrReport.SKIP;
                             END ELSE
                              CurrReport.SKIP;
                          END ELSE
                          BEGIN
                            IF item.GET( "<Production BOM Line1>"."No.") THEN
                            BEGIN
                              IF ( item."Product Group Code" ='CPCB') OR ( item."Product Group Code" ='FPRODUCT') THEN
                              BEGIN
                                TPROD:=0;
                                TSHF:=0;
                                TQAS:=0;
                                TMPR:=0;
                                TPRODH:=0;
                                TSHFH:=0;
                                TQASH:=0;
                                TMPRH:=0;
                                TOT:=0;
                                item.SETFILTER(item."No.","<Production BOM Line1>"."No.");
                                IF item.FIND('-') THEN
                                BEGIN
                                  IF ( item."Product Group Code" ='CPCB') OR ( item."Product Group Code" ='FPRODUCT') THEN
                                  BEGIN
                                    test:="<Production BOM Line1>".Description;
                                    RoutLine.SETFILTER(RoutLine."Routing No.","<Production BOM Line1>"."No.");
                                    IF RoutLine.FIND('-') THEN BEGIN
                                    REPEAT
                                      CASE RoutLine."No." OF
                                        'MPR':       TMPR+=RoutLine."Run Time";
                                        'SHF':       TSHF+=RoutLine."Run Time";
                                        'QAS':       TQAS+=RoutLine."Run Time";
                                        'P1'..'P4':  TPROD+=RoutLine."Run Time";
                                      END;
                                    UNTIL RoutLine.NEXT=0;
                                  END;
                                  IF  item."Product Group Code" ='FPRODUCT' THEN
                                  BEGIN
                                    PBML.SETFILTER(PBML."Production BOM No.","<Production BOM Line1>"."No.");
                                    Test3:="<Production BOM Line1>".Description;
                                    IF PBML.FIND('-') THEN
                                    BEGIN
                                      Test3:=PBML.Description;
                                      RoutLine.SETFILTER(RoutLine."Routing No.",PBML."No.");
                                      IF RoutLine.FIND('-') THEN
                                      REPEAT
                                        CASE RoutLine."No." OF
                                          'MPR':        TMPR1+=RoutLine."Run Time";
                                          'SHF':        TSHF1+=RoutLine."Run Time";
                                          'QAS':        TQAS1+=RoutLine."Run Time";
                                          'P1'..'P4':   TPROD1+=RoutLine."Run Time";
                                        END;
                                      UNTIL RoutLine.NEXT=0;
                                      T1:=TMPR1/60;
                                      T2:=TSHF1/60;
                                      T3:=TQAS1/60;
                                      T4:=TPROD1/60;
                                      T5:=T1+T2+T3+T4;
                                    END;
                                  END;
                                END;
                              END ELSE
                                 CurrReport.SKIP;
                            END ELSE
                             CurrReport.SKIP;
                          END ELSE
                            CurrReport.SKIP;
                        END ;
                    end;
                }

                trigger OnAfterGetRecord();
                begin
                    totcmp:=0;
                    BOMLQ := 0;
                    BOMQ := 0;
                    TOT_SMD:=0;
                    TOT_DIP:=0;
                    IF choice=choice::PROD THEN
                    BEGIN
                      IF itemrec.GET("Production BOM Line"."No.") THEN
                      BEGIN
                        test:=itemrec.Description;
                        IF itemrec."Production BOM No." <> '' THEN
                        BEGIN
                          ProductionBomLine.SETRANGE("Production BOM No.",itemrec."Production BOM No.");
                          IF ProductionBomLine.FIND('-') THEN
                          REPEAT
                            BOMQ := 0;
                            IF ProductionBomLine.Quantity < 1 THEN
                              BOMQ := 1
                            ELSE
                              BOMQ :=  ProductionBomLine.Quantity;
                            IF ProductionBomLine."Type of Solder"=ProductionBomLine."Type of Solder"::SMD THEN
                              TOT_SMD +="Production BOM Line".Quantity*BOMQ
                            ELSE
                              TOT_DIP+="Production BOM Line".Quantity*BOMQ;
                            BOMLQ += BOMQ;
                          UNTIL ProductionBomLine.NEXT = 0;
                          totcmp:=BOMLQ*"Production BOM Line"."Quantity per";
                        END;
                      END;

                      totalcmpnt:=totalcmpnt+totcmp;
                    END ELSE
                    BEGIN
                      TPROD:=0;
                      TSHF:=0;
                      TQAS:=0;
                      TMPR:=0;
                      TPRODH:=0;
                      TSHFH:=0;
                      TQASH:=0;
                      TMPRH:=0;
                      TOT:=0;
                      item.SETFILTER(item."No.","Production BOM Line"."No.");
                      IF item.FIND('-') THEN
                      BEGIN
                        IF ( item."Product Group Code" ='CPCB') OR ( item."Product Group Code" ='FPRODUCT') THEN
                        BEGIN
                          test:="Production BOM Line".Description;
                          RoutLine.SETFILTER(RoutLine."Routing No.","Production BOM Line"."No.");
                          IF RoutLine.FIND('-') THEN BEGIN
                          REPEAT
                            CASE RoutLine."No." OF
                             'MPR':       TMPR+=RoutLine."Run Time";
                             'SHF':       TSHF+=RoutLine."Run Time";
                             'QAS':       TQAS+=RoutLine."Run Time";
                             'P1'..'P4':  TPROD+=RoutLine."Run Time";
                           END;
                          UNTIL RoutLine.NEXT=0;
                        END;
                        IF  item."Product Group Code" ='FPRODUCT' THEN
                        BEGIN
                          PBML.SETFILTER(PBML."Production BOM No.","Production BOM Line"."No.");
                          Test3:="Production BOM Line".Description;
                          IF PBML.FIND('-') THEN
                          BEGIN
                            Test3:=PBML.Description;
                            RoutLine.SETFILTER(RoutLine."Routing No.",PBML."No.");
                            IF RoutLine.FIND('-') THEN
                            REPEAT
                              CASE RoutLine."No." OF
                                'MPR':        TMPR1+=RoutLine."Run Time";
                                'SHF':        TSHF1+=RoutLine."Run Time";
                                'QAS':        TQAS1+=RoutLine."Run Time";
                                'P1'..'P4':   TPROD1+=RoutLine."Run Time";
                              END;
                            UNTIL RoutLine.NEXT=0;
                            T1:=TMPR1/60;
                            T2:=TSHF1/60;
                            T3:= TQAS1/60;
                            T4:=  TPROD1/60;
                            T5:=T1+T2+T3+T4;
                          END;
                        END;
                      END;
                    END ELSE
                        CurrReport.SKIP;
                    END ;
                end;

                trigger OnPreDataItem();
                begin
                    /*  sim:=0;
                      dip:=0;
                      "fixing holes":=0; */

                end;
            }

            trigger OnAfterGetRecord();
            begin
                 TOT_SMD:=0;
                 TOT_DIP:=0;
                 IF choice=choice::PROD THEN
                 BEGIN
                   routingh.SETFILTER(routingh."No.","Production BOM Header"."No.");
                   IF routingh.FIND('-') THEN
                     bentime:=routingh."Bench Mark Time(In Hours)";
                   END ELSE
                   BEGIN
                     item.SETFILTER(item."No.","Production BOM Header"."No.");
                     IF item.FIND('-') THEN
                     BEGIN
                       IF ( item."Product Group Code" ='CPCB') OR ( item."Product Group Code" ='FPRODUCT') THEN
                       BEGIN
                         RoutLine.SETFILTER(RoutLine."Routing No.","Production BOM Header"."No.");
                         IF RoutLine.FIND('-') THEN BEGIN
                         REPEAT
                           Test3:=RoutLine."No.";
                           CASE RoutLine."No." OF
                             'MPR': TMPR+=RoutLine."Run Time";
                             'SHF': TSHF+=RoutLine."Run Time";
                             'QAS': TQAS+=RoutLine."Run Time";
                             'P1'..'P4': TPROD+=RoutLine."Run Time";
                           END;
                         UNTIL RoutLine.NEXT=0;
                       END;
                     END ELSE
                       CurrReport.SKIP
                   END ELSE
                    CurrReport.SKIP;
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

    var
        item : Record Item;
        smd : Integer;
        dip : Integer;
        "fixing holes" : Decimal;
        tsmd : Decimal;
        tdip : Decimal;
        tfholes : Decimal;
        bensmd : Decimal;
        bendip : Decimal;
        denfholes : Decimal;
        tbench : Decimal;
        cnt : Integer;
        BOMLQ : Decimal;
        BOMQ : Decimal;
        itemrec : Record Item;
        ProductionBomLine : Record "Production BOM Line";
        totalbench : Decimal;
        totalcmpnt : Decimal;
        routingh : Record "Routing Header";
        bentime : Decimal;
        totcmp : Decimal;
        bentime1 : Decimal;
        Test1 : Text[30];
        PBML : Record "Production BOM Line";
        PBMH : Record "Production BOM Header";
        smd1 : Integer;
        dip1 : Integer;
        tsmd1 : Decimal;
        fix : Decimal;
        tdip1 : Decimal;
        tfholes1 : Decimal;
        bensmd1 : Decimal;
        bendip1 : Decimal;
        denfholes1 : Decimal;
        tbench1 : Decimal;
        fixing : Decimal;
        test : Text[30];
        cou : Integer;
        BOMQ1 : Decimal;
        BOMLQ1 : Decimal;
        totcmp1 : Decimal;
        first : Integer;
        "TotBench Mark" : Decimal;
        "TotBench Mark1" : Decimal;
        "Prod Tot Bench Mark" : Decimal;
        choice : Option PROD,ROUT;
        RoutLine : Record "Routing Line";
        TPROD : Decimal;
        TSHF : Decimal;
        TQAS : Decimal;
        TMPR : Decimal;
        TPRODH : Decimal;
        TSHFH : Decimal;
        TQASH : Decimal;
        TMPRH : Decimal;
        TOT : Decimal;
        Test3 : Text[30];
        "TOT-MPR" : Decimal;
        "TOT-PROD" : Decimal;
        "TOT-QAS" : Decimal;
        "TOT-SHF" : Decimal;
        "TOT-TOT" : Decimal;
        TPROD1 : Decimal;
        TSHF1 : Decimal;
        TQAS1 : Decimal;
        TMPR1 : Decimal;
        T1 : Decimal;
        T2 : Decimal;
        T3 : Decimal;
        T4 : Decimal;
        T5 : Decimal;
        TOT_SMD : Decimal;
        TOT_DIP : Decimal;
        "TOT_BT(WFH)" : Decimal;
        "Manufacturing Setup" : Record "Manufacturing Setup";
        PBMH2 : Record "Production BOM Header";
        No_CaptionLbl : Label 'No.';
        Routing_Wise_Bench_MarkCaptionLbl : Label 'Routing Wise Bench Mark';
        DescriptionCaptionLbl : Label 'Description';
        Time_For_ProductionCaptionLbl : Label 'Time For Production';
        Time_For_MPRCaptionLbl : Label 'Time For MPR';
        Time_For_QASCaptionLbl : Label 'Time For QAS';
        Time_For_SHFCaptionLbl : Label 'Time For SHF';
        Total_Time_CaptionLbl : Label '"Total Time "';
        DescrptionCaptionLbl : Label 'Descrption';
        QtyCaptionLbl : Label 'Qty';
        SMD_CaptionLbl : Label '"SMD "';
        Fixing_CaptionLbl : Label '"Fixing "';
        DIP_CaptionLbl : Label '"DIP "';
        SMDCaptionLbl : Label 'SMD';
        DIPCaptionLbl : Label 'DIP';
        FixingsCaptionLbl : Label 'Fixings';
        Product_Wise_Bench_markCaptionLbl : Label 'Product Wise Bench mark';
        With_FixingsCaptionLbl : Label 'With Fixings';
        Total_CaptionLbl : Label '"Total "';
        SMDCaption_Control1000000053Lbl : Label '" SMD"';
        DIPCaption_Control1000000088Lbl : Label '" DIP"';
        Without_FixingsCaptionLbl : Label 'Without Fixings';
        PointsCaptionLbl : Label 'Points';
        Total_PointsCaptionLbl : Label 'Total Points';
        SMD_Caption_Control1000000093Lbl : Label '"SMD "';
        DIP_Caption_Control1000000094Lbl : Label '"DIP "';
        Fixing_Caption_Control1000000095Lbl : Label '"Fixing "';
        Bench_Mark___In_Mins_CaptionLbl : Label 'Bench Mark ( In Mins)';
        Toatal_Bench_Mark___in_HRS_CaptionLbl : Label 'Toatal Bench Mark  (in HRS)';
        ComponentsCaptionLbl : Label 'Components';
        TOTALSCaptionLbl : Label 'TOTALS';
        TotalCaptionLbl : Label 'Total';
}

