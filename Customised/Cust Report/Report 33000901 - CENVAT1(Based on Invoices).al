report 33000901 "CENVAT1(Based on Invoices)"
{
    // version NAVIN3.70|srinu,Rev01,Eff02,EFFUPG

    // R&D STORE MATERIAL NOT CONSIDER
    DefaultLayout = RDLC;
    RDLCLayout = './CENVAT1(Based on Invoices).rdlc';


    dataset
    {
        dataitem(RG2AHdr; "Integer")
        {
            DataItemTableView = SORTING(Number) ORDER(Ascending);
            MaxIteration = 1;
            column(FORMAT_StartDt_0_4_; FORMAT(StartDt, 0, 4))
            {
            }
            column(FORMAT_EndDt_0_4_; FORMAT(EndDt, 0, 4))
            {
            }
            column(ANNEXURE_10Caption; ANNEXURE_10CaptionLbl)
            {
            }
            column(See_sub_rule_5__of_rule_7_Caption; See_sub_rule_5__of_rule_7_CaptionLbl)
            {
            }
            column(Monthly_Return_under_Rule_7_of_the_Cenvat_Credit_Rules_2002Caption; Monthly_Return_under_Rule_7_of_the_Cenvat_Credit_Rules_2002CaptionLbl)
            {
            }
            column(INPUTSCaption; INPUTSCaptionLbl)
            {
            }
            column(ToCaption; ToCaptionLbl)
            {
            }
            column(For_the_PeriodCaption; For_the_PeriodCaptionLbl)
            {
            }
            column(Qty_Caption; Qty_CaptionLbl)
            {
            }
            column(SubheadingCaption; SubheadingCaptionLbl)
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(OtherCaption; OtherCaptionLbl)
            {
            }
            column(For_the_main_item_in_the_documentCaption; For_the_main_item_in_the_documentCaptionLbl)
            {
            }
            column(Addl___DutyCaption; Addl___DutyCaptionLbl)
            {
            }
            column(SEDCaption; SEDCaptionLbl)
            {
            }
            column(AEDCaption; AEDCaptionLbl)
            {
            }
            column(Details_of_credit_takenCaption; Details_of_credit_takenCaptionLbl)
            {
            }
            column(CENVATCaption; CENVATCaptionLbl)
            {
            }
            column(ValueCaption; ValueCaptionLbl)
            {
            }
            column(Date_on_which_inputs_receivedCaption; Date_on_which_inputs_receivedCaptionLbl)
            {
            }
            column(ECC_number_of_the_supplierCaption; ECC_number_of_the_supplierCaptionLbl)
            {
            }
            column(Type_of_supplierCaption; Type_of_supplierCaptionLbl)
            {
            }
            column(Name_of_the_supplierCaption; Name_of_the_supplierCaptionLbl)
            {
            }
            column(Date_of_documentCaption; Date_of_documentCaptionLbl)
            {
            }
            column(Number_of_DocumentCaption; Number_of_DocumentCaptionLbl)
            {
            }
            column(Type_of_docu__mentCaption; Type_of_docu__mentCaptionLbl)
            {
            }
            column(Sl__No_Caption; Sl__No_CaptionLbl)
            {
            }
            column(RG2AHdr_Number; Number)
            {
            }

            trigger OnPreDataItem();
            begin
                TempExcelbuffer.DELETEALL;
                CLEAR(TempExcelbuffer);
                Row := 0;
                i := 0;
                // Rev01 Code copy from //RG2AHdr, Header (2) - OnPostSection()
                Row += 1;
                EnterHeadings(Row, 1, 'SERIAL NO', TRUE, TempExcelbuffer."Cell Type"::Text);
                EnterHeadings(Row, 2, 'DOCMENT TYPE', TRUE, TempExcelbuffer."Cell Type"::Text);
                EnterHeadings(Row, 3, 'NUMBER OF THE DOCUMENT', TRUE, TempExcelbuffer."Cell Type"::Text);
                EnterHeadings(Row, 4, 'DATE OF DOCUMENT', TRUE, TempExcelbuffer."Cell Type"::Text);
                EnterHeadings(Row, 5, 'NAME OF THE SUPPLIER', TRUE, TempExcelbuffer."Cell Type"::Text);
                EnterHeadings(Row, 6, 'TYPE OF SUPPLIER', TRUE, TempExcelbuffer."Cell Type"::Text);
                EnterHeadings(Row, 7, 'ECC NUMBER', TRUE, TempExcelbuffer."Cell Type"::Text);
                EnterHeadings(Row, 8, 'DATE ON WHICH INPUTS RECEIVED', TRUE, TempExcelbuffer."Cell Type"::Text);
                EnterHeadings(Row, 9, 'VALUE', TRUE, TempExcelbuffer."Cell Type"::Text);
                EnterHeadings(Row, 10, 'CENVAT', TRUE, TempExcelbuffer."Cell Type"::Text);
                EnterHeadings(Row, 11, 'AED', TRUE, TempExcelbuffer."Cell Type"::Text);
                EnterHeadings(Row, 12, 'SED', TRUE, TempExcelbuffer."Cell Type"::Text);
                EnterHeadings(Row, 13, 'ADDL.DUTY', TRUE, TempExcelbuffer."Cell Type"::Text);
                EnterHeadings(Row, 14, 'CESS2%', TRUE, TempExcelbuffer."Cell Type"::Text);
                EnterHeadings(Row, 15, 'CESS1%', TRUE, TempExcelbuffer."Cell Type"::Text);
                EnterHeadings(Row, 16, 'DESCRIPTION', TRUE, TempExcelbuffer."Cell Type"::Text);
                EnterHeadings(Row, 17, 'SUBHEADING', TRUE, TempExcelbuffer."Cell Type"::Text);
                EnterHeadings(Row, 18, 'QTY', TRUE, TempExcelbuffer."Cell Type"::Text);  //swathi on 26-sep-13
                EnterHeadings(Row, 19, 'InvoiceNo', TRUE, TempExcelbuffer."Cell Type"::Text);

                // Rev01 Code copy from //RG2AHdr, Header (2) - OnPostSection()
            end;
        }
        dataitem("G/L Entry"; "G/L Entry")
        {
            DataItemTableView = SORTING(Entry No.) ORDER(Ascending) WHERE(Amount = FILTER(> 0));
            column(i; i)
            {
            }
            column(G_L_Entry___External_Document_No____JV_; "G/L Entry"."External Document No." + 'JV')
            {
            }
            column(G_L_Entry__G_L_Entry___Posting_Date_; "G/L Entry"."Posting Date")
            {
            }
            column(vendor__E_C_C__No__; vendor."E.C.C. No.")
            {
            }
            column(vname; vname)
            {
            }
            column(ROUND_jvbase_1_; ROUND(jvbase, 1))
            {
            }
            column(ROUND_ABS_jvexcise__1_; ROUND(ABS(jvexcise), 1))
            {
            }
            column(ROUND__jvcess__1_; ROUND((jvcess), 1))
            {
            }
            column(ROUND_jvadd_1_; ROUND(jvadd, 1))
            {
            }
            column(typeofuspplier; typeofuspplier)
            {
            }
            column(InvoiceCaption; InvoiceCaptionLbl)
            {
            }
            column(G_L_Entry_Entry_No_; "Entry No.")
            {
            }
            column(ShowOutPutGVar; ShowOutPutGLGVar)
            {
            }

            trigger OnAfterGetRecord();
            begin
                ShowOutPutGLGVar := FALSE;
                print := FALSE;
                IF ((jvpredocno = '') OR (jvpredocno <> "G/L Entry"."Document No.")) THEN BEGIN
                    vname := '';
                    jvexcise := 0;
                    jvbase := 0;
                    jvadd := 0;
                    jvbed := 0;
                    jvcess := 0;
                    VLE.SETRANGE(VLE."Document No.", "G/L Entry"."Document No.");
                    VLE.SETRANGE(VLE."External Document No.", "G/L Entry"."External Document No.");
                    IF VLE.FIND('-') THEN BEGIN
                        vno := VLE."Vendor No.";
                        vendor.SETRANGE(vendor."No.", vno);
                        IF vendor.FIND('-') THEN BEGIN
                            vname := vendor.Name;
                            veccno := vendor."E.C.C. No.";
                            IF vendor."Vendor Type" = 1 THEN
                                typeofuspplier := 'Manufacturer';
                            IF vendor."Vendor Type" = 2 THEN
                                typeofuspplier := 'First Stage Dealer';
                            IF vendor."Vendor Type" = 3 THEN
                                typeofuspplier := 'Second Stage Dealer';
                            IF vendor."Vendor Type" = 4 THEN
                                typeofuspplier := 'Importer';
                            IF vendor."Vendor Type" = 5 THEN
                                typeofuspplier := 'Trader';
                        END;
                    END;

                    temp := ABS("G/L Entry".Amount);
                    GL1.SETCURRENTKEY(GL1."Document No.", GL1."Posting Date");
                    GL1.SETRANGE(GL1."Document No.", "G/L Entry"."Document No.");
                    IF GL1.FIND('-') THEN
                        REPEAT
                            IF GL1."G/L Account No." = '51100' THEN BEGIN
                                jvbase := jvbase + ABS(GL1.Amount);
                                // MESSAGE(FORMAT(jvbase));
                            END;
                        UNTIL GL1.NEXT = 0;

                    IF jvbase <> 0 THEN BEGIN
                        jvcess := jvbase * 3 / 100;
                        jvexcise := jvbase - jvcess;
                        /*jvexcise:=jvbase*8.24/100;
                         jvbed:=jvbase*8/100;
                         jvcess:=jvbed*3/100;
                         IF temp>jvexcise THEN  anil comented
                          jvadd:=temp-jvexcise;
                         IF "G/L Entry"."External Document No."='1351 (EX-035) JV' THEN
                         BEGIN
                          jvbase:=0;
                          jvadd:=0;
                          jvbed:=4657;
                          //jvexcise:=4657;
                          jvcess:=139;
                         END;
                        */
                    END;
                    jvpredocno := "G/L Entry"."Document No.";
                    IF jvexcise <> 0 THEN
                        print := TRUE
                    ELSE
                        print := FALSE;

                    totassessable := totassessable + jvbase;
                    //totcenvat:=totcenvat+jvbed;
                    totcenvat := totcenvat + jvexcise;
                    tototherduty := tototherduty + jvcess;
                END;

                // Rev01 Code copy from //G/L Entry, Body (1) - OnPostSection()
                IF print THEN BEGIN
                    Testing := Testing + "G/L Entry"."External Document No." + '|';
                    Row += 1;
                    Entercell(Row, 1, FORMAT(i), FALSE, TempExcelbuffer."Cell Type"::Number);
                    Entercell(Row, 2, FORMAT('Invoice'), FALSE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 3, FORMAT("G/L Entry"."External Document No."), FALSE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 4, FORMAT("G/L Entry"."Posting Date"), FALSE, TempExcelbuffer."Cell Type"::Date);
                    IF vname <> '' THEN BEGIN
                        Entercell(Row, 5, FORMAT(vname), FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 6, FORMAT(''), FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 7, FORMAT(vendor."E.C.C. No."), FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 8, FORMAT(''), FALSE, TempExcelbuffer."Cell Type"::Text);
                    END;
                    Entercell(Row, 9, FORMAT(ROUND(jvbase, 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                    Entercell(Row, 10, FORMAT(ROUND(jvexcise, 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                    Entercell(Row, 11, FORMAT(''), FALSE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 12, FORMAT(''), FALSE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 13, FORMAT(ROUND(jvadd, 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                    Entercell(Row, 14, FORMAT(ROUND(jvcess * 2 / 3, 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                    Entercell(Row, 15, FORMAT(ROUND(jvcess / 3, 0.01)), FALSE, TempExcelbuffer."Cell Type"::Number);
                    Entercell(Row, 16, FORMAT(Subheading), FALSE, TempExcelbuffer."Cell Type"::Text);
                    Entercell(Row, 17, FORMAT(Qty), FALSE, TempExcelbuffer."Cell Type"::Number);     //swathi on 26-sep-13
                    totaddduty := totaddduty + jvadd;
                    ShowOutPutGLGVar := TRUE;
                    i := i + 1;
                END ELSE
                    ShowOutPutGLGVar := FALSE;
                // Rev01 Code copy from //G/L Entry, Body (1) - OnPostSection()

            end;

            trigger OnPreDataItem();
            begin
                jvpredocno := '';
                "G/L Entry".SETCURRENTKEY("G/L Entry"."G/L Account No.", "G/L Entry"."Posting Date");
                "G/L Entry".SETRANGE("G/L Entry"."System Date", StartDt, EndDt);
                "G/L Entry".SETFILTER("G/L Entry"."G/L Account No.", '23300');
                "G/L Entry".SETFILTER("G/L Entry"."Document No.", 'JV*');
                // MESSAGE(FORMAT("G/L Entry".COUNT));
            end;
        }
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            DataItemTableView = SORTING(Type of Supplier, Buy-from Vendor Name) ORDER(Ascending) WHERE(Excise Not to Consider=FILTER(No));
            RequestFilterFields = "Document Date";
            column(i_Control1000000000;i)
            {
            }
            column(invoiceno;invoiceno)
            {
            }
            column(Purch__Inv__Header__Purch__Inv__Header___Vendor_Invoice_Date_;"Purch. Inv. Header"."Vendor Invoice Date")
            {
            }
            column(Vend__E_C_C__No__;Vend."E.C.C. No.")
            {
            }
            column(VendorName;VendorName)
            {
            }
            column(ROUND_Amt_1_;ROUND(Amt,1))
            {
            }
            column(Purch__Inv__Header__Purch__Inv__Header___Type_of_Supplier_;"Purch. Inv. Header"."Type of Supplier")
            {
            }
            column(Desc;Desc)
            {
            }
            column(Subheading;Subheading)
            {
            }
            column(Qty;Qty)
            {
            }
            column(ROUND_tempbed___Purch__Inv__Header___Additional_Duty_Value___dummycess_2___1_;ROUND(tempbed-("Purch. Inv. Header"."Additional Duty Value"+(dummycess/2)),1))
            {
            }
            column(ROUND_dummycess_1_;ROUND(dummycess,1))
            {
            }
            column(ROUND__Purch__Inv__Header___Additional_Duty_Value__1_;ROUND("Purch. Inv. Header"."Additional Duty Value",1))
            {
            }
            column(ROUND_totassessable_1_;ROUND(totassessable,1))
            {
            }
            column(ROUND_totcenvat_1_;ROUND(totcenvat,1))
            {
            }
            column(ROUND_totaddduty_1_;ROUND(totaddduty,1))
            {
            }
            column(ROUND_tototherduty_1_;ROUND(tototherduty,1))
            {
            }
            column(totqty;totqty)
            {
            }
            column(InvoiceCaption_Control1102154000;InvoiceCaption_Control1102154000Lbl)
            {
            }
            column(TOTALSCaption;TOTALSCaptionLbl)
            {
            }
            column(Purch__Inv__Header_No_;"No.")
            {
            }
            column(ShowOutPutPGVar;ShowOutPutPGVar)
            {
            }

            trigger OnAfterGetRecord();
            begin
                
                //totassessable:=0;
                //BOut := FALSE;
                ShowOutPutPGVar := FALSE;
                VendorNo :="Purch. Inv. Header"."Buy-from Vendor No.";
                OrdNo := "Purch. Inv. Header"."Order No.";
                IF "Purch. Inv. Header"."Vendor Excise Invoice No."='' THEN
                  invoiceno:="Purch. Inv. Header"."Vendor Invoice No."
                ELSE
                  invoiceno:="Purch. Inv. Header"."Vendor Excise Invoice No.";
                dummybed:=0;
                dummycess:=0;
                Amt := 0.0;
                //BOut := FALSE;
                PurchInvL.RESET;
                PurchInvL.SETRANGE(PurchInvL."Document No.","Purch. Inv. Header"."No.");
                PurchInvL.SETFILTER(PurchInvL."Location Code",'STR');//anil |CS STR
                IF PurchInvL.FIND('-') THEN
                REPEAT
                
                  //BOut := FALSE;
                  IF PurchInvL.Type=PurchInvL.Type::"Fixed Asset" THEN
                  BEGIN
                    STD.SETRANGE(STD."Invoice No.",PurchInvL."Document No.");
                    STD.SETRANGE(STD."Line No.",PurchInvL."Line No.");
                    IF STD.FIND('-') THEN
                    REPEAT
                      IF STD."Tax/Charge Code"='EXCISE' THEN
                      BEGIN
                
                        IF "Purch. Inv. Header".Structure='FORIEGN' THEN
                        BEGIN
                           dummybed:=dummybed+(STD."Amount (LCY)"/2);
                           Amt:=Amt+((STD."Base Amount"/2)*(STD."Amount (LCY)"/STD.Amount));
                        END
                        ELSE
                        BEGIN
                          dummybed:=dummybed+(STD.Amount/2);
                          Amt:=Amt+(STD."Base Amount"/2);
                          END;
                        dummycess:=dummycess+(PurchInvL."eCess Amount"/2);
                      END;
                    UNTIL STD.NEXT=0;
                  END ELSE
                  BEGIN
                    /*
                    BOut := FALSE;
                    Item.RESET;
                    Item.SETRANGE(Item."No.",PurchInvL."No.");
                    //Item.SETFILTER(Item."Product Group Code",'B OUT');
                    IF Item.FINDFIRST THEN
                    BEGIN
                      PO.RESET;
                      PO.SETRANGE(PO."No.",PurchInvL."Purchase_Order No.");
                      PO.SETFILTER(PO."Sale Order No",'<>%1','');
                      IF PO.FINDFIRST THEN
                      BEGIN
                        BOut := TRUE;
                      END;
                    END;
                    IF BOut = FALSE THEN
                    BEGIN
                    */
                      STD.RESET;
                      STD.SETRANGE(STD."Invoice No.",PurchInvL."Document No.");
                      STD.SETRANGE(STD."Line No.",PurchInvL."Line No.");
                      IF STD.FIND('-') THEN
                      REPEAT
                        IF STD."Tax/Charge Code"='EXCISE' THEN
                        BEGIN
                          IF "Purch. Inv. Header".Structure='FORIEGN' THEN
                          BEGIN
                            Amt:=Amt+PurchInvL."Unit Cost (LCY)"*PurchInvL.Quantity;
                            dummybed:=dummybed+STD."Amount (LCY)";
                            IF (dummybed>0) AND(STD."Calculation Value"<>0)  THEN
                            BEGIN
                              dummycess:=((dummybed-"Purch. Inv. Header"."Additional Duty Value")*3/100);
                             // dummybed:=dummybed-"Purch. Inv. Header"."Additional Duty Value";
                            END;
                          END ELSE
                          BEGIN
                            Amt:=Amt+STD."Base Amount";
                            dummybed:=dummybed+STD.Amount;
                            dummycess:=dummycess+PurchInvL."eCess Amount";
                          END;
                        END;
                      UNTIL STD.NEXT=0;
                    //END;
                  END;
                UNTIL PurchInvL.NEXT = 0;
                
                IF "Purch. Inv. Header".Structure='FORIEGN' THEN
                BEGIN
                  tempbed:=dummybed;
                 // IF "Purch. Inv. Header"."Additional Duty Value"<>0 THEN
                 //    tempbed:=dummybed-dummycess-"Purch. Inv. Header"."Additional Duty Value"
                END ELSE
                BEGIN
                IF ("Purch. Inv. Header"."Additional Duty Value"<>0 ) THEN                        //added by sreenivaas on 02-09-2010
                  tempbed:=dummybed-dummycess-"Purch. Inv. Header"."Additional Duty Value"
                ELSE  //anil
                  tempbed:=dummybed-dummycess;
                END;
                totassessable:=totassessable+Amt;
                totcenvat:=totcenvat+tempbed;
                tototherduty:=tototherduty+dummycess;
                
                IF (Amt>0) THEN
                BEGIN
                  Vend.RESET;
                  Vend.SETRANGE(Vend."No.","Purch. Inv. Header"."Buy-from Vendor No.");
                  IF Vend.FIND('-') THEN
                  VendorName := Vend.Name;
                  VendType := Vend."Vendor Type";
                
                  IF VendType = 0 THEN
                    VendorType := '';
                  IF VendType = 1 THEN
                      VendorType := 'Manufacturer';
                  IF VendType = 2 THEN
                      VendorType := 'First Stage Dealer';
                  IF VendType = 3 THEN
                      VendorType := 'Second Stage Dealer';
                  IF VendType = 4 THEN
                      VendorType := 'Importer';
                  IF VendType = 5 THEN
                      VendorType := 'Trader';
                END;
                
                // Rev01 Code Copy from //Purch. Inv. Header, Body (1) - OnPreSection()
                /* IF (previousno="Purch. Inv. Header"."No.") THEN
                 ShowOutPutGVar:=FALSE
                 ELSE
                 BEGIN
                 ShowOutPutGVar:=TRUE;
                 i:=i+1;
                 END;
                 previousno:="Purch. Inv. Header"."No.";
                */
                
                totqty:=totqty+Qty;
                IF (previousno="Purch. Inv. Header"."No.") OR (Amt=0)  OR ("Purch. Inv. Header"."Vendor Excise Invoice No."='1020A') OR
                   (ROUND((tempbed-("Purch. Inv. Header"."Additional Duty Value"+(dummycess/2))),1) = 0) THEN
                  ShowOutPutPGVar:=FALSE
                ELSE
                BEGIN
                  Row+=1;
                  cess:=(ROUND((tempbed-("Purch. Inv. Header"."Additional Duty Value"+(dummycess/2))),1)*2)/100;
                  totaddduty:=totaddduty+"Purch. Inv. Header"."Additional Duty Value";
                  Entercell(Row,1,FORMAT(i),FALSE,TempExcelbuffer."Cell Type"::Number);
                  Entercell(Row,2,FORMAT('Invoice'),FALSE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,3,FORMAT(invoiceno),FALSE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,4,FORMAT("Purch. Inv. Header"."Vendor Invoice Date"),FALSE,TempExcelbuffer."Cell Type"::Date);
                  Entercell(Row,5,FORMAT(VendorName),FALSE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,6,FORMAT("Purch. Inv. Header"."Type of Supplier"),FALSE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,7,FORMAT(Vend."E.C.C. No."),FALSE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,8,FORMAT(''),FALSE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,9,FORMAT(ROUND(Amt,1)),FALSE,TempExcelbuffer."Cell Type"::Number);
                  Entercell(Row,10,FORMAT(ROUND((tempbed-("Purch. Inv. Header"."Additional Duty Value"+(dummycess/2))),1)),FALSE,TempExcelbuffer."Cell Type"::Number);
                  Entercell(Row,11,FORMAT(''),FALSE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,12,FORMAT(''),FALSE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,13,FORMAT(ROUND("Purch. Inv. Header"."Additional Duty Value",1)),FALSE,TempExcelbuffer."Cell Type"::Number);
                  Entercell(Row,14,FORMAT(ROUND(cess,1)),FALSE,TempExcelbuffer."Cell Type"::Number);
                  Entercell(Row,15,FORMAT(ROUND(cess/2,1)),FALSE,TempExcelbuffer."Cell Type"::Number);
                  /* // for cess and values
                  Entercell(Row,14,FORMAT(ROUND(dummycess,1)),FALSE);
                  Entercell(Row,15,FORMAT(ROUND(dummycess/2,1)),FALSE);
                  */
                  Entercell(Row,16,FORMAT(Desc),FALSE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,17,FORMAT(Subheading),FALSE,TempExcelbuffer."Cell Type"::Text);
                  Entercell(Row,18,FORMAT(Qty),FALSE,TempExcelbuffer."Cell Type"::Number);                //swathi on 26-sep-13
                  Entercell(Row,19,FORMAT("Purch. Inv. Header"."No."),FALSE,TempExcelbuffer."Cell Type"::Number);
                  /*
                  if BOut = TRUE THEN
                    Entercell(Row,19,FORMAT('BOut'),FALSE,TempExcelbuffer."Cell Type"::Text);
                  *///pranavi
                  ShowOutPutPGVar:=TRUE;
                  i:=i+1;
                  //MESSAGE(FORMAT("Purch. Inv. Header"."Additional Duty Value"));
                END;
                testmsg := testmsg+'|'+"Purch. Inv. Header"."No.";
                previousno:="Purch. Inv. Header"."No.";
                // Rev01 Code Copy from //Purch. Inv. Header, Body (1) - OnPreSection()

            end;

            trigger OnPostDataItem();
            begin
                //MESSAGE(testmsg);
            end;

            trigger OnPreDataItem();
            begin
                previousno:='';
                SETRANGE("Actual Invoiced Date",StartDt,EndDt);
                SETFILTER("Purch. Inv. Header"."Excise Not to Consider",'No');
                //SETFILTER("Location Code",'STR|CS STR');
                SETFILTER("Purch. Inv. Header".Structure,'PURC-E+VAT|PURC-E+CST|PUR+EF+VAT|P-E+CST+AD|P-E+VAT+AD|FORIEGN|PUR+E+VAT|PUR+EXCISE|'
                +'PUR+CST+PF');
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
                    field(StartDt;StartDt)
                    {
                        Caption = 'Start Date';
                    }
                    field(EndDt;EndDt)
                    {
                        Caption = 'End Date';
                    }
                    field(Month;MONTH)
                    {
                        Caption = 'Month';

                        trigger OnValidate();
                        begin
                            MNT:=MONTH;
                            CASE MNT OF
                               2 :
                                 IF DATE2DMY(TODAY,3) MOD 4 =0 THEN
                                   MNT_DAYS:=29
                                 ELSE
                                   MNT_DAYS:=28;
                               1,3,5,7,8,10,12 : MNT_DAYS:=31
                               ELSE             MNT_DAYS:=30
                            END;
                            StartDt:=DMY2DATE(1,MNT,DATE2DMY(TODAY,3));
                            EndDt:=DMY2DATE(MNT_DAYS,MNT,DATE2DMY(TODAY,3));
                        end;
                    }
                    field(Excel;Excel)
                    {
                        Caption = 'Excel';
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
          Testing := '';
    end;

    trigger OnPostReport();
    begin
        IF Excel THEN BEGIN
          /*
          TempExcelbuffer.CreateBook('Excise Returns','');//Rev01 //EFFUPG
          TempExcelbuffer.WriteSheet('Excise Returns',COMPANYNAME,USERID);//Rev01
          TempExcelbuffer.CloseBook; //Rev01
          TempExcelbuffer.OpenExcel; //Rev01
          TempExcelbuffer.GiveUserControl;
          */
          TempExcelbuffer.CreateBookAndOpenExcel('','Excise Returns','Excise Returns',COMPANYNAME,USERID); //EFFUPG
        END;

    end;

    trigger OnPreReport();
    begin
        IF StartDt = 0D THEN
          ERROR('Please enter a Valid Start Date And End Date');
        IF EndDt = 0D THEN
          ERROR('Please enter a Valid Start Date And End Date');
    end;

    var
        VendorName : Text[50];
        PurchInvH : Record "Purch. Rcpt. Header";
        PurchInvL : Record "Purch. Inv. Line";
        Vend : Record Vendor;
        Amt : Decimal;
        VendorNo : Code[20];
        "Date Filter" : Date;
        StartDt : Date;
        EndDt : Date;
        OpenCenvatIN : Decimal;
        CrCenvatTakeIN : Decimal;
        CrCenvatUsedIN : Decimal;
        CloseCenvatIN : Decimal;
        INT : Decimal;
        RG23APARTII : Record "RG 23 A Part II";
        OpenSEDIN : Decimal;
        CrSEDTakeIN : Decimal;
        CrSEDUsedIN : Decimal;
        CloseSEDIN : Decimal;
        OpenAEDIN : Decimal;
        CrAEDTakeIN : Decimal;
        CrAEDUsedIN : Decimal;
        CloseAEDIN : Decimal;
        OpenADDIN : Decimal;
        CrADDTakeIN : Decimal;
        CrADDUsedIN : Decimal;
        CloseADDIN : Decimal;
        OpenOTHIN : Decimal;
        CrOTHTakeIN : Decimal;
        CrOTHUsedIN : Decimal;
        CloseOTHIN : Decimal;
        RG23CPARTII : Record "RG 23 C Part II";
        PurchRcptH : Record "Purch. Rcpt. Header";
        GRDt : Date;
        OrdNo : Code[20];
        OpenCenvatCG : Decimal;
        CrCenvatTakeCG : Decimal;
        CrCenvatUsedCG : Decimal;
        CloseCenvatCG : Decimal;
        OpenSEDCG : Decimal;
        CrSEDTakeCG : Decimal;
        CrSEDUsedCG : Decimal;
        CloseSEDCG : Decimal;
        OpenAEDCG : Decimal;
        CrAEDTakeCG : Decimal;
        CrAEDUsedCG : Decimal;
        CloseAEDCG : Decimal;
        OpenADDCG : Decimal;
        CrADDTakeCG : Decimal;
        CrADDUsedCG : Decimal;
        CloseADDCG : Decimal;
        OpenOTHCG : Decimal;
        CrOTHTakeCG : Decimal;
        CrOTHUsedCG : Decimal;
        CloseOTHCG : Decimal;
        VendType : Option;
        VendorType : Text[30];
        Desc : Text[50];
        Subheading : Code[10];
        Qty : Decimal;
        MaxValue : Decimal;
        Itm : Record Item;
        ItmNo : Code[10];
        dummy : Integer;
        FixAsset : Record "Fixed Asset";
        "ecc no" : Code[10];
        invoiceno : Text[30];
        Dummyrg23 : Record "RG 23 A Part II";
        dummybed : Decimal;
        previousno : Text[30];
        dummycess : Decimal;
        i : Integer;
        TempExcelbuffer : Record "Excel Buffer" temporary;
        Row : Integer;
        Excel : Boolean;
        STD : Record "Posted Str Order Line Details";
        totassessable : Decimal;
        totcenvat : Decimal;
        totaddduty : Decimal;
        tototherduty : Decimal;
        totqty : Decimal;
        vname : Text[60];
        vno : Text[15];
        vendor : Record Vendor;
        jvexcise : Decimal;
        jvbase : Decimal;
        temp : Decimal;
        jvadd : Decimal;
        jvbed : Decimal;
        jvcess : Decimal;
        jvinvno : Text[10];
        veccno : Text[50];
        GL1 : Record "G/L Entry";
        jvpredocno : Text[30];
        VLE : Record "Vendor Ledger Entry";
        print : Boolean;
        typeofuspplier : Text[50];
        tempbed : Decimal;
        MONTH : Option " ",JAN,FEB,MAR,APR,MAY,JUN,JUL,AUG,SEP,OCT,NOV,DEC;
        MNT : Integer;
        MNT_DAYS : Integer;
        cess : Decimal;
        ANNEXURE_10CaptionLbl : Label 'ANNEXURE-10';
        See_sub_rule_5__of_rule_7_CaptionLbl : Label '[See sub-rule(5) of rule 7]';
        Monthly_Return_under_Rule_7_of_the_Cenvat_Credit_Rules_2002CaptionLbl : Label 'Monthly Return under Rule 7 of the Cenvat Credit Rules,2002';
        INPUTSCaptionLbl : Label 'INPUTS';
        ToCaptionLbl : Label 'To';
        For_the_PeriodCaptionLbl : Label 'For the Period';
        Qty_CaptionLbl : Label 'Qty.';
        SubheadingCaptionLbl : Label 'Subheading';
        DescriptionCaptionLbl : Label 'Description';
        OtherCaptionLbl : Label 'Other';
        For_the_main_item_in_the_documentCaptionLbl : Label 'For the main item in the document';
        Addl___DutyCaptionLbl : Label 'Addl.  Duty';
        SEDCaptionLbl : Label 'SED';
        AEDCaptionLbl : Label 'AED';
        Details_of_credit_takenCaptionLbl : Label 'Details of credit taken';
        CENVATCaptionLbl : Label 'CENVAT';
        ValueCaptionLbl : Label 'Value';
        Date_on_which_inputs_receivedCaptionLbl : Label 'Date on which inputs received';
        ECC_number_of_the_supplierCaptionLbl : Label 'ECC number of the supplier';
        Type_of_supplierCaptionLbl : Label 'Type of supplier';
        Name_of_the_supplierCaptionLbl : Label 'Name of the supplier';
        Date_of_documentCaptionLbl : Label 'Date of document';
        Number_of_DocumentCaptionLbl : Label 'Number of Document';
        Type_of_docu__mentCaptionLbl : Label 'Type of docu- ment';
        Sl__No_CaptionLbl : Label 'Sl. No.';
        InvoiceCaptionLbl : Label 'Invoice';
        InvoiceCaption_Control1102154000Lbl : Label 'Invoice';
        TOTALSCaptionLbl : Label 'TOTALS';
        ShowOutPutGLGVar : Boolean;
        ShowOutPutPGVar : Boolean;
        testmsg : Text;
        Item : Record Item;
        BOut : Boolean;
        PO : Record "Purchase Header";
        Testing : Text;

    [LineStart(21955)]
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

    [LineStart(21964)]
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

