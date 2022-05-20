report 33000908 PurchaseBills
{
    // version Revo1,Eff02,EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './PurchaseBills.rdlc';

    dataset
    {
        dataitem("Purch. Inv. Header";"Purch. Inv. Header")
        {
            DataItemTableView = SORTING(Posting Date) ORDER(Ascending);
            RequestFilterFields = "Shortcut Dimension 1 Code";
            column(VAT__vatper____Bills___For_the_Given_Period__FORMAT_fromdate_0_4___To__FORMAT_todate_0_4_;'VAT '+vatper+' % Bills'+' For the Given Period '+FORMAT(fromdate,0,4)+' To '+FORMAT(todate,0,4))
            {
            }
            column(Purch__Inv__Header__Buy_from_Vendor_Name_;"Buy-from Vendor Name")
            {
            }
            column(Purch__Inv__Header__VAT_Registration_No__;"VAT Registration No.")
            {
            }
            column(Purch__Inv__Header__Vendor_Invoice_No__;"Vendor Invoice No.")
            {
            }
            column(ROUND_Assessable_1_;ROUND(Assessable,1))
            {
            }
            column(ROUND_Vatamt_1_;ROUND(Vatamt,1))
            {
            }
            column(ROUND__Invoiced_Amount__1_;ROUND("Invoiced Amount",1))
            {
            }
            column(Purch__Inv__Header__Posting_Date_;"Posting Date")
            {
            }
            column(Purch__Inv__Header__Actual_Invoiced_Date_;"Actual Invoiced Date")
            {
            }
            column(vatper;vatper)
            {
            }
            column(ROUND_totass_1_;ROUND(totass,1))
            {
            }
            column(ROUND_totvat_1_;ROUND(totvat,1))
            {
            }
            column(ROUND_totalamt_1_;ROUND(totalamt,1))
            {
            }
            column(Purch__Inv__Header__Buy_from_Vendor_Name_Caption;FIELDCAPTION("Buy-from Vendor Name"))
            {
            }
            column(Purch__Inv__Header__VAT_Registration_No__Caption;FIELDCAPTION("VAT Registration No."))
            {
            }
            column(Purch__Inv__Header__Vendor_Invoice_No__Caption;FIELDCAPTION("Vendor Invoice No."))
            {
            }
            column(Asses__ValueCaption;Asses__ValueCaptionLbl)
            {
            }
            column(VAT_amountCaption;VAT_amountCaptionLbl)
            {
            }
            column(Invoiced_AmountCaption;Invoiced_AmountCaptionLbl)
            {
            }
            column(Purch__Inv__Header__Posting_Date_Caption;FIELDCAPTION("Posting Date"))
            {
            }
            column(Purch__Inv__Header__Actual_Invoiced_Date_Caption;FIELDCAPTION("Actual Invoiced Date"))
            {
            }
            column(PercentageCaption;PercentageCaptionLbl)
            {
            }
            column(TotalsCaption;TotalsCaptionLbl)
            {
            }
            column(Purch__Inv__Header_No_;"No.")
            {
            }
            column(VendorInvoiceDate;"Vendor Invoice Date")
            {
            }

            trigger OnAfterGetRecord();
            begin
                Assessable:=0;
                Vatamt:=0;
                ExciseAmt:=0;
                PackingnForwrdingCharges:=0;
                FrieghtCharges:=0;
                InsuranceCharges:=0;
                OtherCharges:=0;
                vatper:='';
                igst_amt:=0;sgst_amt:=0;CurrHSN:='START';
                IF GSTManagement.IsGSTApplicable("Purch. Inv. Header".Structure) THEN BEGIN
                  PIL.RESET;
                  PIL.SETCURRENTKEY("Document No.","HSN/SAC Code");
                  PIL.SETRANGE(PIL."Document No.","Purch. Inv. Header"."No.");
                  PIL.SETFILTER(PIL.Quantity,'>%1',0);
                  IF PIL.FIND('-') THEN
                  REPEAT
                    IF CurrHSN <> PIL."HSN/SAC Code" THEN
                    BEGIN
                      Assessable:=0;Tot_Inv_Amt:=0;
                      PackingnForwrdingCharges:=0;
                      FrieghtCharges:=0;
                      InsuranceCharges:=0;
                      OtherCharges:=0;
                      igst_amt:=0;sgst_amt:=0;
                      TDSAmount := 0;
                      PIL1.RESET;
                      PIL1.SETRANGE(PIL1."Document No.","Purch. Inv. Header"."No.");
                      PIL1.SETFILTER(PIL1.Quantity,'>%1',0);
                      PIL1.SETRANGE("HSN/SAC Code",PIL."HSN/SAC Code");
                      IF PIL1.FINDSET THEN
                      REPEAT
                          IF "Purch. Inv. Header"."Currency Factor" > 0 THEN
                                Assessable+=(PIL1."GST Base Amount")/("Purch. Inv. Header"."Currency Factor")
                          ELSE
                              Assessable+=(PIL1."GST Base Amount");
                          TDSAmount := TDSAmount + PIL1."TDS Amount";
                          //Assessable+=(PIL1."Unit Cost (LCY)"*PIL1.Quantity);
                        //IF  ("Purch. Inv. Header"."GST Vendor Type" IN["Purch. Inv. Header"."GST Vendor Type"::Registered,"Purch. Inv. Header"."GST Vendor Type"::Import]) THEN
                        //BEGIN
                          IF PIL1."GST Jurisdiction Type" = PIL1."GST Jurisdiction Type"::Interstate THEN
                          BEGIN
                            IF "Purch. Inv. Header"."Currency Factor" > 0 THEN
                                  igst_amt+=(PIL1."Total GST Amount")/("Purch. Inv. Header"."Currency Factor")
                            ELSE
                                igst_amt+=(PIL1."Total GST Amount")
                          END
                          ELSE
                          BEGIN
                            IF "Purch. Inv. Header"."Currency Factor" > 0 THEN
                                sgst_amt+=(PIL1."Total GST Amount"/2)/("Purch. Inv. Header"."Currency Factor")
                            ELSE
                                sgst_amt+=(PIL1."Total GST Amount"/2)
                          END;
                        //END;
                        /*PstrDetails.RESET;
                        PstrDetails.SETRANGE(PstrDetails.Type,PstrDetails.Type::Purchase);
                        PstrDetails.SETRANGE(PstrDetails."Document Type",PstrDetails."Document Type"::Invoice);
                        PstrDetails.SETFILTER(PstrDetails."Invoice No.","Purch. Inv. Header"."No.");
                        PstrDetails.SETRANGE(PstrDetails."Tax/Charge Type",PstrDetails."Tax/Charge Type"::Charges);
                        PstrDetails.SETRANGE("Line No.",PIL1."Line No.");
                        PstrDetails.SETFILTER(PstrDetails.Amount,'>%1',0);
                        IF PstrDetails.FINDSET THEN
                        REPEAT
                          IF PstrDetails."Account No." IN ['53903'] THEN
                            PackingnForwrdingCharges+=PstrDetails."Amount (LCY)"
                          ELSE IF PstrDetails."Account No." IN ['51400'] THEN
                            FrieghtCharges+=PstrDetails."Amount (LCY)"
                          ELSE IF PstrDetails."Account No." IN ['58700'] THEN
                            InsuranceCharges+=PstrDetails."Amount (LCY)"
                          ELSE IF PstrDetails."Account No." IN ['61924','67600','51800','53400','48400'] THEN
                            OtherCharges+=PstrDetails."Amount (LCY)";
                        UNTIL PstrDetails.NEXT=0;
                        Tot_Inv_Amt:=Tot_Inv_Amt+PIL1."Total GST Amount"+(PIL1."Unit Cost (LCY)"*PIL1.Quantity);*/
                      UNTIL PIL1.NEXT=0;
                      //Tot_Inv_Amt+=PackingnForwrdingCharges+FrieghtCharges+InsuranceCharges+OtherCharges;
                      Tot_Inv_Amt += Assessable + igst_amt + sgst_amt +sgst_amt;
                      IF Assessable > 0 THEN BEGIN
                      Row+=1;
                        Entercell(Row,1,FORMAT(Row-1),FALSE,TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row,2,FORMAT("Purch. Inv. Header"."Posting Date"),FALSE,TempExcelbuffer."Cell Type"::Date);
                        Entercell(Row,3,FORMAT("Purch. Inv. Header"."Buy-from Vendor Name"),FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,4,FORMAT("Purch. Inv. Header"."Vendor Invoice No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,5,FORMAT("Purch. Inv. Header"."Vendor Invoice Date"),FALSE,TempExcelbuffer."Cell Type"::Date);
                        Entercell(Row,6,FORMAT(Assessable),FALSE,TempExcelbuffer."Cell Type"::Number);
                        IF PIL1."GST Jurisdiction Type" = PIL1."GST Jurisdiction Type"::Interstate THEN
                        BEGIN
                              Entercell(Row,12,FORMAT(ROUND(PIL."GST %")),FALSE,TempExcelbuffer."Cell Type"::Number);
                        END ELSE
                        BEGIN
                            Entercell(Row,10,FORMAT(ROUND(PIL."GST %"/2)),FALSE,TempExcelbuffer."Cell Type"::Number);
                            Entercell(Row,11,FORMAT(ROUND(PIL."GST %"/2)),FALSE,TempExcelbuffer."Cell Type"::Number);
                        END;
                        Entercell(Row,14,FORMAT("Purch. Inv. Header"."Shortcut Dimension 1 Code"),FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,13,FORMAT(Tot_Inv_Amt),FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,15,FORMAT("Purch. Inv. Header"."Actual Invoiced Date"),FALSE,TempExcelbuffer."Cell Type"::Date);
                
                        Entercell(Row,7,FORMAT(ROUND(sgst_amt)),FALSE,TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row,8,FORMAT(ROUND(sgst_amt)),FALSE,TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row,9,FORMAT(ROUND(igst_amt)),FALSE,TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row,16,FORMAT(PIL."GST Jurisdiction Type"),FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,18,FORMAT("Purch. Inv. Header"."GST Vendor Type"),FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,19,FORMAT(PIL."HSN/SAC Code"),FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,23,FORMAT(PIL."Unit of Measure Code"),FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,24,FORMAT(PIL.Quantity),FALSE,TempExcelbuffer."Cell Type"::Text);
                
                        HSNSACTABLE.RESET;
                        HSNSACTABLE.SETRANGE("GST Group Code",PIL."GST Group Code");
                        HSNSACTABLE.SETRANGE(Code,PIL."HSN/SAC Code");
                        IF HSNSACTABLE.FINDFIRST THEN
                          Entercell(Row,20,FORMAT(HSNSACTABLE.Description),FALSE,TempExcelbuffer."Cell Type"::Text);
                
                        IF StateGRec.GET("Purch. Inv. Header".State) THEN
                            Entercell(Row,21,FORMAT(StateGRec."State Code (GST Reg. No.)"+'-'+StateGRec.Description),FALSE,TempExcelbuffer."Cell Type"::Text);
                
                        GLEntGReC.RESET;
                        GLEntGReC.SETRANGE("Document No.","Purch. Inv. Header"."No.");
                        GLEntGReC.SETRANGE("Posting Date","Purch. Inv. Header"."Posting Date");
                        IF GLEntGReC.FINDFIRST THEN
                          Entercell(Row,22,FORMAT(GLEntGReC."System Date"),FALSE,TempExcelbuffer."Cell Type"::Text);
                
                        Vendr.RESET;
                        Vendr.SETFILTER(Vendr."No.","Purch. Inv. Header"."Buy-from Vendor No.");
                        IF Vendr.FINDFIRST THEN
                        BEGIN
                          Entercell(Row,17,FORMAT(Vendr."GST Registration No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                        END;
                        IF PIL."GST Credit" = PIL."GST Credit"::"Non-Availment" THEN
                        BEGIN
                            Entercell(Row,25,'Ineligible',FALSE,TempExcelbuffer."Cell Type"::Text);
                        END
                        ELSE IF PIL.Type = PIL.Type::"Fixed Asset" THEN
                        BEGIN
                            Entercell(Row,25,'Capital Good',FALSE,TempExcelbuffer."Cell Type"::Text);
                        END ELSE IF PIL."GST Group Type" = PIL."GST Group Type"::Goods THEN
                        BEGIN
                          Entercell(Row,25,'Input',FALSE,TempExcelbuffer."Cell Type"::Text);
                        END ELSE IF PIL."GST Group Type" = PIL."GST Group Type"::Service THEN
                        BEGIN
                            Entercell(Row,25,'Input Service',FALSE,TempExcelbuffer."Cell Type"::Text);
                        END ELSE
                        BEGIN
                              Entercell(Row,25,'None',FALSE,TempExcelbuffer."Cell Type"::Text);
                        END;
                        IF "Purch. Inv. Header"."GST Vendor Type" = "Purch. Inv. Header"."GST Vendor Type"::SEZ THEN
                        BEGIN
                              Entercell(Row,28,'SEZ',FALSE,TempExcelbuffer."Cell Type"::Text);
                        END ELSE  IF  "Purch. Inv. Header"."GST Vendor Type" = "Purch. Inv. Header"."GST Vendor Type"::Import THEN
                        BEGIN
                             IF PIL."GST Group Type" = PIL."GST Group Type"::Goods THEN
                            BEGIN
                              Entercell(Row,28,'Import of Goods',FALSE,TempExcelbuffer."Cell Type"::Text);
                            END ELSE IF PIL."GST Group Type" = PIL."GST Group Type"::Service THEN
                            BEGIN
                                Entercell(Row,28,'Import of Services',FALSE,TempExcelbuffer."Cell Type"::Text);
                            END
                        END;
                        Entercell(Row,30,FORMAT("Purch. Inv. Header"."Bill of Entry No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,31,FORMAT("Purch. Inv. Header"."Bill of Entry Date"),FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,32,FORMAT("Purch. Inv. Header"."No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row,33,FORMAT("Purch. Inv. Header"."Buy-from Vendor No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                        IF PIL.Type = PIL.Type::Item THEN
                        BEGIN
                              PostingSetup.RESET;
                              PostingSetup.SETRANGE("Gen. Prod. Posting Group", PIL."Gen. Prod. Posting Group");
                              PostingSetup.SETRANGE("Gen. Bus. Posting Group","Purch. Inv. Header"."Gen. Bus. Posting Group");
                              IF PostingSetup.FINDFIRST THEN
                              BEGIN
                                  GLAct.RESET;
                                  GLAct.SETRANGE("No.",PostingSetup."Purch. Account");
                                  IF GLAct.FINDFIRST THEN
                                  BEGIN
                                       Entercell(Row,34,FORMAT(GLAct."No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                                       Entercell(Row,35,FORMAT(GLAct.Name),FALSE,TempExcelbuffer."Cell Type"::Text);
                                  END;
                              END;
                        END ELSE IF PIL.Type = PIL.Type::"G/L Account" THEN
                        BEGIN
                              GLAct.RESET;
                              GLAct.SETRANGE("No.",PIL."No.");
                              IF GLAct.FINDFIRST THEN
                              BEGIN
                                  Entercell(Row,34,FORMAT(GLAct."No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                                  Entercell(Row,35,FORMAT(GLAct.Name),FALSE,TempExcelbuffer."Cell Type"::Text);
                              END;
                        END;
                        IF (igst_amt + sgst_amt +sgst_amt = 0) THEN
                        BEGIN
                            Entercell(Row,36,FORMAT('GST Amount should not be Zero'),FALSE,TempExcelbuffer."Cell Type"::Text);
                        END ELSE IF (NOT(ROUND(PIL."GST %",1) IN [5,12,18,28]))  THEN
                        BEGIN
                            Entercell(Row,36,FORMAT('GST % Not in Defined Percentage(5,12,18,28)'),FALSE,TempExcelbuffer."Cell Type"::Text);
                        END;
                        Entercell(Row,37,FORMAT(TDSAmount),FALSE,TempExcelbuffer."Cell Type"::Text);
                      END;
                
                    END;
                    CurrHSN := PIL."HSN/SAC Code";
                  UNTIL PIL.NEXT=0;
                
                
                /*    EnterHeadings(Row,26,'NilRated/Exempt/NonGST',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,27,'Reverse Charge',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,36,'Bill of Entry Port Code',TRUE,TempExcelbuffer."Cell Type"::Text);*/
                
                END ELSE BEGIN
                PIL.RESET;
                PIL.SETRANGE(PIL."Document No.","Purch. Inv. Header"."No.");
                PIL.SETFILTER(PIL.Quantity,'>%1',0);
                IF VatBills = TRUE THEN
                BEGIN
                  PIL.SETRANGE(PIL."Tax Area Code",'PUCH VAT');
                  IF vat5=TRUE THEN
                  BEGIN
                    PIL.SETRANGE(PIL."Tax %",vatamt5);
                    vatper:=FORMAT(vatamt5);
                  END;
                  IF vat12=TRUE THEN
                  BEGIN
                    PIL.SETRANGE(PIL."Tax %",vatamt12);
                    vatper:=FORMAT(vatamt12);
                  END;
                  IF vat4=TRUE THEN
                  BEGIN
                    PIL.SETRANGE(PIL."Tax %",vatamt4);
                    vatper:=FORMAT(vatamt4);
                  END;
                  IF vat14=TRUE THEN
                  BEGIN
                    PIL.SETRANGE(PIL."Tax %",vatamt14);
                    vatper:=FORMAT(vatamt14);
                  END;
                END;
                IF PIL.FIND('-') THEN
                REPEAT
                  IF VatBills = TRUE THEN
                    Assessable+=PIL."Tax Base Amount"  //vat base removed in table
                  ELSE
                    Assessable+=(PIL."Unit Cost (LCY)"*PIL.Quantity);
                  Vatamt+=PIL."Tax Amount";
                  ExciseAmt+=PIL."Excise Amount";
                  IF PIL."Tax %" > 0 THEN
                    IF vatper = '' THEN
                      vatper := FORMAT(PIL."Tax %");
                UNTIL PIL.NEXT=0;
                "Purch. Inv. Header".CALCFIELDS("Purch. Inv. Header"."Invoiced Amount");
                totalamt+="Purch. Inv. Header"."Invoiced Amount";
                totvat:=totvat+Vatamt;
                totexcise:=totexcise+ExciseAmt;
                totass:=totass+Assessable;
                IF Assessable=0 THEN
                 CurrReport.SKIP;
                
                IF "Purch. Inv. Header".Structure = 'FORIEGN' THEN
                  ExciseAmt:=0;
                
                PstrDetails.RESET;
                PstrDetails.SETRANGE(PstrDetails.Type,PstrDetails.Type::Purchase);
                PstrDetails.SETRANGE(PstrDetails."Document Type",PstrDetails."Document Type"::Invoice);
                PstrDetails.SETFILTER(PstrDetails."Invoice No.","Purch. Inv. Header"."No.");
                PstrDetails.SETRANGE(PstrDetails."Tax/Charge Type",PstrDetails."Tax/Charge Type"::Charges);
                PstrDetails.SETFILTER(PstrDetails.Amount,'>%1',0);
                IF PstrDetails.FINDSET THEN
                REPEAT
                  IF "Purch. Inv. Header".Structure = 'FORIEGN' THEN
                  BEGIN
                    IF PstrDetails."Account No." IN ['51300'] THEN
                      PackingnForwrdingCharges+=PstrDetails."Amount (LCY)"
                    ELSE IF PstrDetails."Account No." IN ['51400'] THEN
                      FrieghtCharges+=PstrDetails."Amount (LCY)"
                    ELSE IF PstrDetails."Account No." IN ['61924','67600','51800','53400','48400'] THEN
                      OtherCharges+=PstrDetails."Amount (LCY)"
                    ELSE IF PstrDetails."Account No." IN ['23300'] THEN
                      ExciseAmt+=PstrDetails."Amount (LCY)";
                  END
                  ELSE
                  BEGIN
                    IF PstrDetails."Account No." IN ['53903'] THEN
                      PackingnForwrdingCharges+=PstrDetails."Amount (LCY)"
                    ELSE IF PstrDetails."Account No." IN ['51100'] THEN
                      FrieghtCharges+=PstrDetails."Amount (LCY)"
                    ELSE IF PstrDetails."Account No." IN ['58700'] THEN
                      InsuranceCharges+=PstrDetails."Amount (LCY)"
                    ELSE IF PstrDetails."Account No." IN ['61924','67600','51800','53400','48400'] THEN
                      OtherCharges+=PstrDetails."Amount (LCY)";
                  END;
                UNTIL PstrDetails.NEXT=0;
                
                TotInvoicedAmnt:=Assessable+ExciseAmt+Vatamt+PackingnForwrdingCharges+InsuranceCharges+FrieghtCharges+OtherCharges;
                
                // Rev01 >>
                Row+=1;
                IF VatBills = TRUE THEN
                BEGIN
                  Entercell(Row,1,FORMAT(Row-1),FALSE,TempExcelbuffer."Cell Type"::Number);
                  Entercell(Row,2,FORMAT("Purch. Inv. Header"."Posting Date"),FALSE,TempExcelbuffer."Cell Type"::Date);
                  Entercell(Row,3,FORMAT("Purch. Inv. Header"."Buy-from Vendor Name"),FALSE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,4,FORMAT("Purch. Inv. Header"."Vendor Invoice No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,5,FORMAT("Purch. Inv. Header"."Vendor Invoice Date"),FALSE,TempExcelbuffer."Cell Type"::Date);
                  Entercell(Row,6,FORMAT(Assessable),FALSE,TempExcelbuffer."Cell Type"::Number);
                  Entercell(Row,7,FORMAT(ROUND(Vatamt,1)),FALSE,TempExcelbuffer."Cell Type"::Number);
                  Entercell(Row,8,FORMAT(ROUND("Purch. Inv. Header"."Invoiced Amount",1)),FALSE,TempExcelbuffer."Cell Type"::Number);
                  Entercell(Row,9,FORMAT(vatper),FALSE,TempExcelbuffer."Cell Type"::Number);
                  Entercell(Row,10,FORMAT("Purch. Inv. Header"."Shortcut Dimension 1 Code"),FALSE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,12,FORMAT("Purch. Inv. Header"."Actual Invoiced Date"),FALSE,TempExcelbuffer."Cell Type"::Date);
                  Entercell(Row,13,FORMAT("Purch. Inv. Header"."VAT Registration No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                  Vendr.RESET;
                  Vendr.SETFILTER(Vendr."No.","Purch. Inv. Header"."Buy-from Vendor No.");
                  IF Vendr.FINDFIRST THEN
                  BEGIN
                    IF Vendr."T.I.N. No."<>'' THEN
                      Entercell(Row,11,FORMAT(Vendr."T.I.N. No."),FALSE,TempExcelbuffer."Cell Type"::Text)
                    ELSE
                      Entercell(Row,11,FORMAT('11111111111'),FALSE,TempExcelbuffer."Cell Type"::Text);
                  END
                  ELSE
                    Entercell(Row,11,FORMAT('11111111111'),FALSE,TempExcelbuffer."Cell Type"::Text);
                END ELSE BEGIN
                  Entercell(Row,1,FORMAT(Row-1),FALSE,TempExcelbuffer."Cell Type"::Number);
                  Entercell(Row,2,FORMAT("Purch. Inv. Header"."Posting Date"),FALSE,TempExcelbuffer."Cell Type"::Date);
                  Entercell(Row,3,FORMAT("Purch. Inv. Header"."Buy-from Vendor Name"),FALSE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,4,FORMAT("Purch. Inv. Header"."Vendor Invoice No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,5,FORMAT("Purch. Inv. Header"."Vendor Invoice Date"),FALSE,TempExcelbuffer."Cell Type"::Date);
                
                  Entercell(Row,7,FORMAT(ROUND(ExciseAmt,1)),FALSE,TempExcelbuffer."Cell Type"::Number);
                  Entercell(Row,8,FORMAT(ROUND(PackingnForwrdingCharges,1)),FALSE,TempExcelbuffer."Cell Type"::Number);
                  Entercell(Row,9,FORMAT(ROUND(InsuranceCharges,1)),FALSE,TempExcelbuffer."Cell Type"::Number);
                  Entercell(Row,10,FORMAT(ROUND(FrieghtCharges,1)),FALSE,TempExcelbuffer."Cell Type"::Number);
                  IF PIL."Tax Area Code" = 'PUCH VAT' THEN
                    Entercell(Row,11,FORMAT(ROUND(Vatamt,1)),FALSE,TempExcelbuffer."Cell Type"::Number);
                  IF PIL."Tax Area Code" = 'PUCH CST' THEN
                  BEGIN
                    Entercell(Row,12,FORMAT(ROUND(Vatamt,1)),FALSE,TempExcelbuffer."Cell Type"::Number);
                    //Assessable+=ROUND(Vatamt,1);
                  END;
                  Entercell(Row,6,FORMAT(Assessable),FALSE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,13,FORMAT(ROUND(OtherCharges,1)),FALSE,TempExcelbuffer."Cell Type"::Number);
                  //Entercell(Row,14,FORMAT(ROUND("Purch. Inv. Header"."Invoiced Amount",1)),FALSE,TempExcelbuffer."Cell Type"::Number);
                  Entercell(Row,14,FORMAT(ROUND(TotInvoicedAmnt,1)),FALSE,TempExcelbuffer."Cell Type"::Number);
                  Entercell(Row,15,FORMAT(ROUND(PIL."Tax %")),FALSE,TempExcelbuffer."Cell Type"::Number);
                  Entercell(Row,16,FORMAT("Purch. Inv. Header"."Shortcut Dimension 1 Code"),FALSE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,17,FORMAT("Purch. Inv. Header"."Actual Invoiced Date"),FALSE,TempExcelbuffer."Cell Type"::Date);
                  Entercell(Row,19,FORMAT("Purch. Inv. Header"."VAT Registration No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                
                
                
                
                
                  Vendr.RESET;
                  Vendr.SETFILTER(Vendr."No.","Purch. Inv. Header"."Buy-from Vendor No.");
                  IF Vendr.FINDFIRST THEN
                  BEGIN
                    IF Vendr."T.I.N. No."<>'' THEN
                      Entercell(Row,18,FORMAT(Vendr."T.I.N. No."),FALSE,TempExcelbuffer."Cell Type"::Text)
                    ELSE
                      Entercell(Row,18,FORMAT('11111111111'),FALSE,TempExcelbuffer."Cell Type"::Text);
                  END
                  ELSE
                    Entercell(Row,18,FORMAT('11111111111'),FALSE,TempExcelbuffer."Cell Type"::Text);
                  // Rev01<<
                END;
                END;

            end;

            trigger OnPreDataItem();
            begin
                IF JVReg THEN
                  CurrReport.BREAK;
                /*IF PurchaseJVReg THEN
                 CurrReport.BREAK;*/
                
                TempExcelbuffer.DELETEALL;
                CLEAR(TempExcelbuffer);
                Row:=0;
                totalamt:=0;
                vatamt4:=4.0;
                vatamt12:=12.5;
                vatamt14:=14.5;
                vatamt5:=5;
                IF (fromdate = 0D) OR (todate = 0D) THEN
                    ERROR('Please enter From & To Dates!');
                //"Purch. Inv. Header".SETRANGE("Purch. Inv. Header"."Posting Date",fromdate,todate);
                "Purch. Inv. Header".SETRANGE("Purch. Inv. Header"."Actual Invoiced Date",fromdate,todate);
                
                /*IF PurchaseJVReg THEN
                  BEGIN
                    glentry.RESET;
                    glentry.SETCURRENTKEY("Document No.","System Date");
                   // glentry.SETFILTER("Document No.","Purch. Inv. Header"."No.");
                    glentry.SETRANGE("System Date",fromdate,todate);
                    glentry.SETFILTER("Journal Batch Name",'%1','%2','%3','PUR-CF','PURCH-CF','PUR-JV');
                    IF glentry.FINDSET THEN
                      BEGIN
                       "Purch. Inv. Header".SETFILTER("Purch. Inv. Header"."No.",glentry."Document No.");
                      END;
                  END
                  ELSE
                    "Purch. Inv. Header".SETRANGE("Purch. Inv. Header"."Posting Date",fromdate,todate);*/
                
                // Rev01 >>
                Row+=1;
                IF VatBills = TRUE THEN
                BEGIN
                  EnterHeadings(Row,1,'S NO.',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,2,'POSTING DATE',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,3,'VENDOR NAME',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,4,'INVOICE NO.',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,5,'Vendor Invoice Date',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,6,'ASSESSABLE VALUE',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,7,'VAT AMOUNT',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,8,'TOTAL INVOICED AMOUNT',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,9,'Vat %',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,10,'DEPARTMENT',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,11,'TIN No.',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,12,'ACTUAL DATE',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,13,'VAT REGISTRATION NO.',TRUE,TempExcelbuffer."Cell Type"::Text);
                END
                ELSE BEGIN
                  EnterHeadings(Row,1,'S NO.',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,2,'POSTING DATE',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,3,'VENDOR NAME',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,4,'Vendor Invoive No',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,5,'Vendor Invoice Date',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,6,'ASSESSABLE VALUE',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,7,'SGST',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,8,'CGST',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,9,'IGST',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,10,'SGST RATE',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,11,'CGST RATE',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,12,'IGST RATE',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,13,'TOTAL INVOICED AMT',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,14,'DEPARTMENT',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,15,'ACTUAL DATE',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,16,'GST JURISDICTION TYPE',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,17,'GST REG.NO',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,18,'GST REG TYPE',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,19,'HSN/SAC CODE',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,20,'HSN/SAC DESCRIPTION',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,21,'VENDOR STATE',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,22,'SYSTEM DATE',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,23,'UOM',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,24,'Quantity',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,25,'ITC Claim Type',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,26,'NilRated/Exempt/NonGST',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,27,'Reverse Charge',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,28,'Import(Goods,Services,SEZ)',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,29,'Bill of Entry Port Code',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,30,'Bill of Entry No',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,31,'Bill of Entry Date',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,32,'Voucher No',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,33,'Vendor No',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,34,'GL No',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,35,'GL Name',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,36,'Issue Remarks',TRUE,TempExcelbuffer."Cell Type"::Text);
                  EnterHeadings(Row,37,'TDS Amount',TRUE,TempExcelbuffer."Cell Type"::Text);
                
                
                
                
                END;
                // Rev01 <<

            end;
        }
        dataitem("G/L Entry";"G/L Entry")
        {
            DataItemTableView = SORTING(Posting Date,Source Code,Transaction No.) ORDER(Ascending) WHERE(Document No.=FILTER(JV*|THR*));
            RequestFilterFields = "Global Dimension 1 Code";

            trigger OnAfterGetRecord();
            begin
                IF Excel THEN
                BEGIN
                  Row+=1;
                  Entercell(Row,1,FORMAT(Row-1),FALSE,TempExcelbuffer."Cell Type"::Number);
                  Entercell(Row,2,FORMAT("G/L Entry"."Posting Date"),FALSE,TempExcelbuffer."Cell Type"::Date);
                  Entercell(Row,3,FORMAT("G/L Entry"."Document No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,4,FORMAT("G/L Entry".Description),FALSE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,5,FORMAT("G/L Entry"."G/L Account No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                  IF GLAct.GET("G/L Entry"."G/L Account No.") THEN
                    Entercell(Row,6,FORMAT(GLAct.Name),FALSE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,7,FORMAT("G/L Entry"."Source Type"),FALSE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,8,FORMAT("G/L Entry"."Source No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                  CASE "G/L Entry"."Source Type" OF
                    "G/L Entry"."Source Type"::" " :
                      Entercell(Row,9,FORMAT(''),FALSE,TempExcelbuffer."Cell Type"::Text);

                    "G/L Entry"."Source Type"::"Bank Account" :
                      IF BA.GET("G/L Entry"."Source No.") THEN
                        Entercell(Row,9,FORMAT(BA.Name),FALSE,TempExcelbuffer."Cell Type"::Text);

                    "G/L Entry"."Source Type"::Customer :
                      IF Cust.GET("G/L Entry"."Source No.") THEN
                        Entercell(Row,9,FORMAT(Cust.Name),FALSE,TempExcelbuffer."Cell Type"::Text);

                    "G/L Entry"."Source Type"::"Fixed Asset" :
                      IF FA.GET("G/L Entry"."Source No.") THEN
                        Entercell(Row,9,FORMAT(FA.Description),FALSE,TempExcelbuffer."Cell Type"::Text);

                    "G/L Entry"."Source Type"::Vendor :
                      IF Vendor.GET("G/L Entry"."Source No.") THEN
                        Entercell(Row,9,FORMAT(Vendor.Name),FALSE,TempExcelbuffer."Cell Type"::Text);
                  END;
                  Entercell(Row,10,FORMAT("G/L Entry"."Global Dimension 1 Code"),FALSE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,11,FORMAT("G/L Entry"."System Date"),FALSE,TempExcelbuffer."Cell Type"::Date);
                  Entercell(Row,12,FORMAT(ROUND(ABS("G/L Entry"."Debit Amount"),1)),FALSE,TempExcelbuffer."Cell Type"::Number);
                  Entercell(Row,13,FORMAT(ROUND(ABS("G/L Entry"."Credit Amount"),1)),FALSE,TempExcelbuffer."Cell Type"::Number);
                END;
            end;

            trigger OnPreDataItem();
            begin
                IF NOT JVReg THEN
                  CurrReport.BREAK;

                IF (fromdate = 0D) OR (todate = 0D) THEN
                    ERROR('Please enter From & To Dates!');

                "G/L Entry".SETRANGE("G/L Entry"."System Date" ,fromdate,todate);
                //"G/L Entry".SETRANGE("G/L Entry"."Posting Date",fromdate,todate);


                IF "G/L Entry".GETFILTER("G/L Entry"."Global Dimension 1 Code") = '' THEN
                  ERROR('Please enter Departments Code in G/L Entry Tab!');

                IF Excel THEN
                BEGIN
                  TempExcelbuffer.DELETEALL;
                  CLEAR(TempExcelbuffer);
                  Row:=0;

                  Row+=1;

                  IF JVReg THEN
                  BEGIN
                    EnterHeadings(Row,1,'S NO.',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,2,'POSTING DATE',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,3,'DOC NO.',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,4,'DESCRIPTION',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,5,'ACCOUNT NO.',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,6,'ACCOUNT NAME',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,7,'SOURCE TYPE',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,8,'SOURCE NO.',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,9,'SOURCE NAME',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,10,'DEPARTMENT',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,11,'ACTUAL DATE',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,12,'DEBIT AMOUNT',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,13,'CREDIT AMOUNT',TRUE,TempExcelbuffer."Cell Type"::Text);
                  END;
                END;
            end;
        }
        dataitem(gle;"G/L Entry")
        {
            DataItemTableView = SORTING(Posting Date,Source Code,Transaction No.) ORDER(Ascending) WHERE(Journal Batch Name=FILTER(PUR*));

            trigger OnAfterGetRecord();
            begin
                IF Excel THEN
                BEGIN
                  Row+=1;
                  Entercell(Row,1,FORMAT(Row-1),FALSE,TempExcelbuffer."Cell Type"::Number);
                  Entercell(Row,2,FORMAT(gle."Posting Date"),FALSE,TempExcelbuffer."Cell Type"::Date);
                  Entercell(Row,3,FORMAT(gle."Document No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,4,FORMAT(gle.Description),FALSE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,5,FORMAT(gle."G/L Account No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                  IF GLAct.GET(gle."G/L Account No.") THEN
                    Entercell(Row,6,FORMAT(GLAct.Name),FALSE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,7,FORMAT(gle."Source Type"),FALSE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,8,FORMAT(gle."Source No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                  CASE gle."Source Type" OF
                    gle."Source Type"::" " :
                      Entercell(Row,9,FORMAT(''),FALSE,TempExcelbuffer."Cell Type"::Text);

                    gle."Source Type"::"Bank Account" :
                      IF BA.GET(gle."Source No.") THEN
                        Entercell(Row,9,FORMAT(BA.Name),FALSE,TempExcelbuffer."Cell Type"::Text);

                    gle."Source Type"::Customer :
                      IF Cust.GET(gle."Source No.") THEN
                        Entercell(Row,9,FORMAT(Cust.Name),FALSE,TempExcelbuffer."Cell Type"::Text);

                    gle."Source Type"::"Fixed Asset" :
                      IF FA.GET(gle."Source No.") THEN
                        Entercell(Row,9,FORMAT(FA.Description),FALSE,TempExcelbuffer."Cell Type"::Text);

                    gle."Source Type"::Vendor :
                      IF Vendor.GET(gle."Source No.") THEN
                        Entercell(Row,9,FORMAT(Vendor.Name),FALSE,TempExcelbuffer."Cell Type"::Text);
                  END;
                  Entercell(Row,10,FORMAT(gle."Global Dimension 1 Code"),FALSE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,11,FORMAT(gle."System Date"),FALSE,TempExcelbuffer."Cell Type"::Date);
                  Entercell(Row,12,FORMAT(ROUND(ABS(gle."Debit Amount"),1)),FALSE,TempExcelbuffer."Cell Type"::Number);
                  Entercell(Row,13,FORMAT(ROUND(ABS(gle."Credit Amount"),1)),FALSE,TempExcelbuffer."Cell Type"::Number);
                END;
            end;

            trigger OnPreDataItem();
            begin
                /*IF NOT JVReg THEN
                  CurrReport.BREAK;*/
                IF NOT PurchaseJVReg THEN
                  CurrReport.BREAK;
                IF (fromdate = 0D) OR (todate = 0D) THEN
                    ERROR('Please enter From & To Dates!');
                
                  gle.SETRANGE(gle."System Date" ,fromdate,todate);
                //"G/L Entry".SETRANGE("G/L Entry"."Posting Date",fromdate,todate);
                
                
                //IF "G/L Entry".GETFILTER("G/L Entry"."Global Dimension 1 Code") = '' THEN
                //  ERROR('Please enter Departments Code in G/L Entry Tab!');
                
                IF Excel THEN
                BEGIN
                  TempExcelbuffer.DELETEALL;
                  CLEAR(TempExcelbuffer);
                  Row:=0;
                
                  Row+=1;
                
                  IF PurchaseJVReg THEN
                  BEGIN
                    EnterHeadings(Row,1,'S NO.',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,2,'POSTING DATE',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,3,'DOC NO.',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,4,'DESCRIPTION',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,5,'ACCOUNT NO.',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,6,'ACCOUNT NAME',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,7,'SOURCE TYPE',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,8,'SOURCE NO.',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,9,'SOURCE NAME',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,10,'DEPARTMENT',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,11,'ACTUAL DATE',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,12,'DEBIT AMOUNT',TRUE,TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row,13,'CREDIT AMOUNT',TRUE,TempExcelbuffer."Cell Type"::Text);
                  END;
                END;

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Control1102152001)
                {
                    ShowCaption = false;
                    field(fromdate;fromdate)
                    {
                        Caption = 'From Date';
                    }
                    field(todate;todate)
                    {
                        Caption = 'To Date';
                    }
                    field(VatBills;VatBills)
                    {
                        Caption = 'Vat Bills';

                        trigger OnValidate();
                        begin
                            IF JVReg THEN
                              ERROR('Un-Tick JV Register!');
                            IF PurchaseJVReg THEN
                              ERROR('Un-Tick Purchase JV Register!');
                        end;
                    }
                    field(JVReg;JVReg)
                    {
                        Caption = 'JV Register';

                        trigger OnValidate();
                        begin
                            IF VatBills THEN
                              ERROR('Un-Tick Vat Bills!');
                            IF PurchaseJVReg THEN
                              ERROR('Un-Tick Purchase JV Register!');
                        end;
                    }
                    field("PUR JV Register";PurchaseJVReg)
                    {
                        Caption = 'PUR JV Register';

                        trigger OnValidate();
                        begin
                            IF VatBills THEN
                              ERROR('Un-Tick Vat Bills!');
                            IF JVReg THEN
                              ERROR('Un-Tick JV Register!');
                        end;
                    }
                    field(Excel;Excel)
                    {
                        Caption = 'Excel';
                    }
                }
                group("Vat Percentage")
                {
                    field(vat4;vat4)
                    {
                        Caption = 'Vat 4%';
                    }
                    field(vat12;vat12)
                    {
                        Caption = 'Vat 12.5%';
                    }
                    field(vat14;vat14)
                    {
                        Caption = 'Vat 14.5%';
                    }
                    field(vat5;vat5)
                    {
                        Caption = 'Vat 5%';
                    }
                }
            }
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
        Excel := TRUE;
    end;

    trigger OnPostReport();
    begin
        IF Excel THEN BEGIN
          /*
          IF VatBills = TRUE THEN
          BEGIN
            TempExcelbuffer.CreateBook('Purchase Vat Bills','');//Rev01 //EFFUPG
            TempExcelbuffer.WriteSheet('Purchase Vat Bills',COMPANYNAME,USERID);//Rev01
          END ELSE BEGIN
            TempExcelbuffer.CreateBook('Purchase Register','');//Rev01 //EFFUPG
            TempExcelbuffer.WriteSheet('Purchase Register',COMPANYNAME,USERID);//Rev01
          END;
          TempExcelbuffer.CloseBook;
          TempExcelbuffer.OpenExcel;
          TempExcelbuffer.GiveUserControl;
          */
          IF VatBills = TRUE THEN
            TempExcelbuffer.CreateBookAndOpenExcel('','Purchase Vat Bills','Purchase Vat Bills',COMPANYNAME,USERID) //EFFUPG
          ELSE IF JVReg THEN
            TempExcelbuffer.CreateBookAndOpenExcel('','JV Register','JV Register',COMPANYNAME,USERID) //EFFUPG
          ELSE
            TempExcelbuffer.CreateBookAndOpenExcel('','Purchase Register','Purchase Register',COMPANYNAME,USERID); //EFFUPG
        END;

    end;

    var
        PIL : Record "Purch. Inv. Line";
        Assessable : Decimal;
        Vatamt : Decimal;
        fromdate : Date;
        todate : Date;
        vatper : Text[30];
        TempExcelbuffer : Record "Excel Buffer" temporary;
        Row : Integer;
        Excel : Boolean;
        totalamt : Decimal;
        vat4 : Boolean;
        vat12 : Boolean;
        vatamt4 : Decimal;
        vatamt12 : Decimal;
        totass : Decimal;
        totvat : Decimal;
        GL : Record "G/L Entry";
        GLvatper : Decimal;
        GLtot : Decimal;
        GLVATAmt : Decimal;
        VLE : Record "Vendor Ledger Entry";
        VName : Text[30];
        VNo : Text[10];
        Vendor : Record Vendor;
        jvvat : Boolean;
        vatamt14 : Decimal;
        vat14 : Boolean;
        vatamt5 : Decimal;
        vat5 : Boolean;
        Asses__ValueCaptionLbl : Label 'Asses. Value';
        VAT_amountCaptionLbl : Label 'VAT amount';
        Invoiced_AmountCaptionLbl : Label 'Invoiced Amount';
        PercentageCaptionLbl : Label 'Percentage';
        TotalsCaptionLbl : Label 'Totals';
        Vendr : Record Vendor;
        ExciseAmt : Decimal;
        totexcise : Decimal;
        PstrDetails : Record "Posted Str Order Line Details";
        PackingnForwrdingCharges : Decimal;
        FrieghtCharges : Decimal;
        InsuranceCharges : Decimal;
        OtherCharges : Decimal;
        TotInvoicedAmnt : Decimal;
        VatBills : Boolean;
        JVReg : Boolean;
        PurchaseJVReg : Boolean;
        GLAct : Record "G/L Account";
        Cust : Record Customer;
        FA : Record "Fixed Asset";
        BA : Record "Bank Account";
        sgst_amt : Decimal;
        igst_amt : Decimal;
        GSTManagement : Codeunit "GST Management";
        CurrHSN : Code[10];
        PIL1 : Record "Purch. Inv. Line";
        Tot_Inv_Amt : Decimal;
        HSNSACTABLE : Record "HSN/SAC";
        StateGRec : Record State;
        GLEntGReC : Record "G/L Entry";
        PostingSetup : Record "General Posting Setup";
        TDSAmount : Decimal;
        glentry : Record "G/L Entry";

    [LineStart(22834)]
    procedure Entercell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[1000];bold : Boolean;CellType : Option);
    begin

        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.",RowNo);
        TempExcelbuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelbuffer."Cell Value as Text" := CellValue;
        TempExcelbuffer.Bold:=bold ;
        TempExcelbuffer."Cell Type" := CellType;
        TempExcelbuffer.INSERT;
    end;

    [LineStart(22844)]
    procedure EnterHeadings(RowNo : Integer;ColumnNo : Integer;CellValue : Text[100];Bold : Boolean;CellType : Option);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.",RowNo);
        TempExcelbuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelbuffer."Cell Value as Text" := FORMAT(CellValue);
        TempExcelbuffer.Bold:=Bold ;
        TempExcelbuffer."Cell Type" := CellType;
        TempExcelbuffer.Formula := '';
        TempExcelbuffer.INSERT;
    end;
}

