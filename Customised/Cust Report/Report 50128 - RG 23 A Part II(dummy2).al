report 50128 "RG 23 A Part II(dummy2)"
{
    // version NAVIN3.70|srinu,EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './RG 23 A Part II(dummy2).rdlc';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending);

            trigger OnAfterGetRecord();
            begin
                SIL.SETRANGE(SIL."Document No.", "Sales Invoice Header"."No.");
                IF SIL.FIND('-') THEN
                    REPEAT
                        IF SIL."Amount To Customer" > 0 THEN BEGIN
                            SalExciseAmt := SalExciseAmt + SIL."Excise Amount";
                            SalEcessAmt := SalEcessAmt + SIL."eCess Amount";
                        END;
                    UNTIL SIL.NEXT = 0;
                SalEcess2amt := SalEcessAmt * (2 / 3);
                SalEcess2amt := SalEcessAmt * (1 / 3);
            end;

            trigger OnPreDataItem();
            begin
                TempExcelbuffer.DELETEALL;
                CLEAR(TempExcelbuffer);
                Row := 0;

                SalEcessAmt := 0;
                SalExciseAmt := 0;
                no := 1;
                SETRANGE("Sales Invoice Header"."Posting Date", StartDt, EndDt);
                SETFILTER("Sales Invoice Header".Structure, 'SALE-E+CST|SALE-E+V');
            end;
        }
        dataitem("<Purch. Inv. Header1>"; "Purch. Inv. Header")
        {
            DataItemTableView = SORTING(Type of Supplier, Buy-from Vendor Name) ORDER(Ascending);

            trigger OnAfterGetRecord();
            begin
                PurchInvL1.RESET;
                PurchInvL1.SETRANGE(PurchInvL1."Document No.", "<Purch. Inv. Header1>"."No.");
                PurchInvL1.FIND('-');
                REPEAT
                    IF PurchInvL1.Type = PurchInvL1.Type::"Fixed Asset" THEN BEGIN
                        IF PurchInvL1."Amount To Vendor" > 0 THEN BEGIN
                            cenvattotal := cenvattotal + (PurchInvL1."BED Amount" / 2);
                            cesstotal := cesstotal + (PurchInvL1."eCess Amount" / 2);
                            Addduty1 := "Purch. Inv. Header"."Additional Duty Value";
                        END;
                    END ELSE BEGIN
                        IF PurchInvL1."Amount To Vendor" > 0 THEN BEGIN
                            cenvattotal := cenvattotal + (PurchInvL1."BED Amount");
                            cesstotal := cesstotal + (PurchInvL1."eCess Amount");
                        END;
                    END;
                UNTIL PurchInvL1.NEXT = 0;
            end;

            trigger OnPreDataItem();
            begin
                cenvattotal := 0;
                cesstotal := 0;
                Addduty1 := 0;
                SETRANGE("Actual Invoiced Date", StartDt, EndDt);
                SETFILTER("Location Code", 'STR|CS STR');
                SETFILTER("<Purch. Inv. Header1>"."Excise Not to Consider", 'No');
                SETFILTER("<Purch. Inv. Header1>".Structure, 'PURC-E+VAT|PURC-E+CST|PUR+EF+VAT|P-E+CST+AD|P-E+VAT+AD|FORIEGN');
            end;
        }
        dataitem(RG2AHdr; "Integer")
        {
            DataItemTableView = SORTING(Number);
            MaxIteration = 1;
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(Vijayawada_; 'Vijayawada')
            {
            }
            column(COMPANY__Phone_No__; COMPANY."Phone No.")
            {
            }
            column(COMPANY__Address_2_; COMPANY."Address 2")
            {
            }
            column(FORMAT_StartDt_0_4_; FORMAT(StartDt, 0, 4))
            {
            }
            column(FORMAT_EndDt_0_4_; FORMAT(EndDt, 0, 4))
            {
            }
            column(FORM_R_G__23_A_Part____IICaption; FORM_R_G__23_A_Part____IICaptionLbl)
            {
            }
            column(ENTRY_BOOK_OF_DUTY_CREDITCaption; ENTRY_BOOK_OF_DUTY_CREDITCaptionLbl)
            {
            }
            column(E_C_C__FilterCaption; E_C_C__FilterCaptionLbl)
            {
            }
            column(AAACE4879QXM001Caption; AAACE4879QXM001CaptionLbl)
            {
            }
            column(FOR_THE_PERIOD_OF_Caption; FOR_THE_PERIOD_OF_CaptionLbl)
            {
            }
            column(TOCaption; TOCaptionLbl)
            {
            }
            column(Sl__no_Caption; Sl__no_CaptionLbl)
            {
            }
            column(DOCUMENT_DATECaption; DOCUMENT_DATECaptionLbl)
            {
            }
            column(BASIC_EXCISE_DUTYCaption; BASIC_EXCISE_DUTYCaptionLbl)
            {
            }
            column(Other_Duties__Specify_Caption; Other_Duties__Specify_CaptionLbl)
            {
            }
            column(A_R_1_G_P_1__other_approved_document_bill_of_entry_No__and_dateCaption; A_R_1_G_P_1__other_approved_document_bill_of_entry_No__and_dateCaptionLbl)
            {
            }
            column(ECC_Code_of_supplierCaption; ECC_Code_of_supplierCaptionLbl)
            {
            }
            column(Range__Division__Custom_House_From_Where_receivedCaption; Range__Division__Custom_House_From_Where_receivedCaptionLbl)
            {
            }
            column(Folio_and_Entry_No__in_Part_ICaption; Folio_and_Entry_No__in_Part_ICaptionLbl)
            {
            }
            column(Basic_Excise_DutyCaption_Control1102154176; Basic_Excise_DutyCaption_Control1102154176Lbl)
            {
            }
            column(Additional_Duty_of_Customs_equivalent_to_Basic_Excise_DutyCaption; Additional_Duty_of_Customs_equivalent_to_Basic_Excise_DutyCaptionLbl)
            {
            }
            column(Basic_Excise_Duty_and_Additional_Duty_of_Customs_equivalent_to_Basic_Excise_DutyCaption; Basic_Excise_Duty_and_Additional_Duty_of_Customs_equivalent_to_Basic_Excise_DutyCaptionLbl)
            {
            }
            column(A_R_1__Invoice_other_approved_document_No__and_dateCaption; A_R_1__Invoice_other_approved_document_No__and_dateCaptionLbl)
            {
            }
            column(CET_Sub_headingCaption; CET_Sub_headingCaptionLbl)
            {
            }
            column(EC_Code_of_BuyerCaption; EC_Code_of_BuyerCaptionLbl)
            {
            }
            column(Opening_Balance_of_Duty_in_CreditCaption; Opening_Balance_of_Duty_in_CreditCaptionLbl)
            {
            }
            column(Fresh_credit_allowed__4_to_6_Caption; Fresh_credit_allowed__4_to_6_CaptionLbl)
            {
            }
            column(Fresh_credit_allowed__7__Amount_of_Duty_creditedCaption; Fresh_credit_allowed__7__Amount_of_Duty_creditedCaptionLbl)
            {
            }
            column(Other_Duties__Specify_Caption_Control1102154185; Other_Duties__Specify_Caption_Control1102154185Lbl)
            {
            }
            column(Other_Duties__Specify_Caption_Control1102154186; Other_Duties__Specify_Caption_Control1102154186Lbl)
            {
            }
            column(Total_Credit__3_____7__AvailableCaption; Total_Credit__3_____7__AvailableCaptionLbl)
            {
            }
            column(Dept_9_to_11Caption; Dept_9_to_11CaptionLbl)
            {
            }
            column(Other_Duties__Specify_Caption_Control1102154189; Other_Duties__Specify_Caption_Control1102154189Lbl)
            {
            }
            column(Balance_Of_CreditCaption; Balance_Of_CreditCaptionLbl)
            {
            }
            column(B_E_D_AED_of_Customs_equivalent_to_BEDCaption; B_E_D_AED_of_Customs_equivalent_to_BEDCaptionLbl)
            {
            }
            column(Other_Duties__Specify_Caption_Control1102154192; Other_Duties__Specify_Caption_Control1102154192Lbl)
            {
            }
            column(Central_Excise_Officers_InitialsCaption; Central_Excise_Officers_InitialsCaptionLbl)
            {
            }
            column(V1Caption; V1CaptionLbl)
            {
            }
            column(V2Caption; V2CaptionLbl)
            {
            }
            column(V3aCaption; V3aCaptionLbl)
            {
            }
            column(V3bCaption; V3bCaptionLbl)
            {
            }
            column(V4aCaption; V4aCaptionLbl)
            {
            }
            column(V4dCaption; V4dCaptionLbl)
            {
            }
            column(V6Caption; V6CaptionLbl)
            {
            }
            column(V7Caption; V7CaptionLbl)
            {
            }
            column(V8aCaption; V8aCaptionLbl)
            {
            }
            column(V8DCaption; V8DCaptionLbl)
            {
            }
            column(V8ECaption; V8ECaptionLbl)
            {
            }
            column(V9aCaption; V9aCaptionLbl)
            {
            }
            column(V9bCaption; V9bCaptionLbl)
            {
            }
            column(V9cCaption; V9cCaptionLbl)
            {
            }
            column(V10Caption; V10CaptionLbl)
            {
            }
            column(V11Caption; V11CaptionLbl)
            {
            }
            column(V12Caption; V12CaptionLbl)
            {
            }
            column(V12bCaption; V12bCaptionLbl)
            {
            }
            column(V13Caption; V13CaptionLbl)
            {
            }
            column(V8bCaption; V8bCaptionLbl)
            {
            }
            column(Vendor_NameCaption; Vendor_NameCaptionLbl)
            {
            }
            column(V4cCaption; V4cCaptionLbl)
            {
            }
            column(V5Caption; V5CaptionLbl)
            {
            }
            column(Basic_Excise_DutyCaption_Control1102154284; Basic_Excise_DutyCaption_Control1102154284Lbl)
            {
            }
            column(V8cCaption; V8cCaptionLbl)
            {
            }
            column(HIGHER_E_CESSCaption; HIGHER_E_CESSCaptionLbl)
            {
            }
            column(ED__CESSCaption; ED__CESSCaptionLbl)
            {
            }
            column(V4bCaption; V4bCaptionLbl)
            {
            }
            column(RG2AHdr_Number; Number)
            {
            }
        }
        dataitem("G/L Entry"; "G/L Entry")
        {
            DataItemTableView = SORTING(Entry No.) ORDER(Ascending) WHERE(Amount = FILTER(> 0));
            column(sno; sno)
            {
            }
            column(G_L_Entry__G_L_Entry___Posting_Date_; "G/L Entry"."Posting Date")
            {
            }
            column(ROUND_CenvatOB_1_; ROUND(CenvatOB, 1))
            {
            }
            column(ROUND_CessOB_1_; ROUND(CessOB, 1))
            {
            }
            column(G_L_Entry___External_Document_No_____JV_; "G/L Entry"."External Document No." + ' JV')
            {
            }
            column(vendor__E_C_C__No__; vendor."E.C.C. No.")
            {
            }
            column(ROUND_ABS_jvbed__1_; ROUND(ABS(jvbed), 1))
            {
            }
            column(ROUND__jvcess__1_3___1_; ROUND((jvcess * (1 / 3)), 1))
            {
            }
            column(ROUND_CenvatOB_jvbed_1_; ROUND(CenvatOB + jvbed, 1))
            {
            }
            column(ROUND_CessOB_jvcess_1_; ROUND(CessOB + jvcess, 1))
            {
            }
            column(vname; vname)
            {
            }
            column(ROUND__jvcess_2_3__1_; ROUND((jvcess * 2 / 3), 1))
            {
            }
            column(ROUND_jvadd_1_; ROUND(jvadd, 1))
            {
            }
            column(FORMAT__G_L_Entry___Posting_Date__; FORMAT("G/L Entry"."Posting Date"))
            {
            }
            column(G_L_Entry_Entry_No_; "Entry No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                print := FALSE;
                IF (jvpredocno = '') OR (jvpredocno <> "G/L Entry"."Document No.") THEN BEGIN
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
                    GL1.SETRANGE(GL1."Document No.", "G/L Entry"."Document No.");
                    IF GL1.FIND('-') THEN
                        REPEAT

                            IF GL1."G/L Account No." = '51100' THEN BEGIN
                                jvbase := jvbase + ABS(GL1.Amount);
                            END;
                        UNTIL GL1.NEXT = 0;

                    IF jvbase <> 0 THEN BEGIN
                        jvexcise := jvbase * 8.24 / 100;
                        jvbed := jvbase * 8 / 100;
                        jvcess := jvbed * 3 / 100;
                        IF temp > jvexcise THEN
                            jvadd := temp - jvexcise;
                    END;
                    IF "G/L Entry"."External Document No." = '1351 (EX-035) JV' THEN BEGIN
                        jvbase := 0;
                        jvadd := 0;
                        jvbed := 4657;
                        //jvexcise:=4657;
                        jvcess := 139;
                    END;

                    jvpredocno := "G/L Entry"."Document No.";
                    IF jvexcise <> 0 THEN
                        print := TRUE
                    ELSE
                        print := FALSE;
                    sno := sno + 1;
                    tempcenvat := tempcenvat + jvbed;
                    tempcess := tempcess + jvcess;
                    Dcenvattot := Dcenvattot + jvbed;
                    DCesstot := DCesstot + jvcess;
                    TOTAED += jvadd;
                END;
            end;

            trigger OnPreDataItem();
            begin
                jvpredocno := '';
                Dcenvattot := 0;
                DCesstot := 0;
                "G/L Entry".SETCURRENTKEY("G/L Entry"."G/L Account No.", "G/L Entry"."Posting Date");
                "G/L Entry".SETRANGE("G/L Entry"."System Date", StartDt, EndDt);
                "G/L Entry".SETFILTER("G/L Entry"."G/L Account No.", '23300');
                "G/L Entry".SETFILTER("G/L Entry"."Document No.", 'JV*');
            end;
        }
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            DataItemTableView = SORTING(Type of Supplier, Buy-from Vendor Name) ORDER(Ascending);
            column(sno_Control1102154000; sno)
            {
            }
            column(DocDate; DocDate)
            {
            }
            column(ROUND_cenvatobsp_1_; ROUND(cenvatobsp, 1))
            {
            }
            column(ROUND_CessOB_1__Control1102154115; ROUND(CessOB, 1))
            {
            }
            column(invoiceno; invoiceno)
            {
            }
            column(Vend__E_C_C__No__; Vend."E.C.C. No.")
            {
            }
            column(ROUND_tempbed_1_; ROUND(tempbed, 1))
            {
            }
            column(ROUND__dummycess__1_3___1_; ROUND((dummycess * (1 / 3)), 1))
            {
            }
            column(totalexcisevalue; totalexcisevalue)
            {
            }
            column(ROUND_CessOB_dummycess_1_; ROUND(CessOB + dummycess, 1))
            {
            }
            column(VendorName; VendorName)
            {
            }
            column(ROUND__dummycess__2_3___1_; ROUND((dummycess * (2 / 3)), 1))
            {
            }
            column(ROUND_Addduty_1_; ROUND(Addduty, 1))
            {
            }
            column(Purch__Inv__Header__Purch__Inv__Header___Vendor_Invoice_Date_; "Purch. Inv. Header"."Vendor Invoice Date")
            {
            }
            column(ROUND_Dcenvattot_1_; ROUND(Dcenvattot, 1))
            {
            }
            column(ROUND_TOTAED_1_; ROUND(TOTAED, 1))
            {
            }
            column(ROUND_DCesstot_2_3_1_; ROUND(DCesstot * 2 / 3, 1))
            {
            }
            column(ROUND_DCesstot_1_3_1_; ROUND(DCesstot * 1 / 3, 1))
            {
            }
            column(Purch__Inv__Header_No_; "No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                VendorNo := "Purch. Inv. Header"."Buy-from Vendor No.";
                OrdNo := "Purch. Inv. Header"."Order No.";
                IF "Purch. Inv. Header"."Vendor Excise Invoice No." = '' THEN
                    invoiceno := "Purch. Inv. Header"."Vendor Invoice No."
                ELSE
                    invoiceno := "Purch. Inv. Header"."Vendor Excise Invoice No.";

                dummybed := 0;
                dummycess := 0;
                Amt := 0.0;
                PurchInvL.RESET;
                PurchInvL.SETRANGE(PurchInvL."Document No.", "Purch. Inv. Header"."No.");
                PurchInvL.FIND('-');
                REPEAT
                    IF PurchInvL.Type = PurchInvL.Type::"Fixed Asset" THEN BEGIN
                        STD.SETRANGE(STD."Invoice No.", PurchInvL."Document No.");
                        STD.SETRANGE(STD."Line No.", PurchInvL."Line No.");
                        IF STD.FIND('-') THEN
                            REPEAT
                                IF STD."Tax/Charge Code" = 'EXCISE' THEN BEGIN
                                    Amt := (Amt + (PurchInvL.Amount + PurchInvL."Charges To Vendor") / 2);
                                    dummybed := dummybed + (PurchInvL."BED Amount" / 2);
                                    dummycess := dummycess + (PurchInvL."eCess Amount" / 2);
                                END;
                            UNTIL STD.NEXT = 0;
                    END ELSE BEGIN
                        STD.RESET;
                        STD.SETRANGE(STD."Invoice No.", PurchInvL."Document No.");
                        STD.SETRANGE(STD."Line No.", PurchInvL."Line No.");
                        IF STD.FIND('-') THEN
                            REPEAT
                                IF STD."Tax/Charge Code" = 'EXCISE' THEN BEGIN
                                    IF "Purch. Inv. Header".Structure = 'FORIEGN' THEN BEGIN
                                        Amt := Amt + PurchInvL."Unit Cost (LCY)" * PurchInvL.Quantity;
                                        dummybed := dummybed + STD."Calculation Value";
                                        IF (dummybed > 0) AND (STD."Calculation Value" <> 0) THEN BEGIN
                                            dummycess := ((dummybed - "Purch. Inv. Header"."Additional Duty Value") * 3 / 100);
                                            dummybed := dummybed - "Purch. Inv. Header"."Additional Duty Value";
                                        END;
                                    END ELSE BEGIN
                                        Amt := Amt + STD."Base Amount";
                                        dummybed := dummybed + STD.Amount;
                                        dummycess := dummycess + PurchInvL."eCess Amount";
                                    END;
                                END;
                            UNTIL STD.NEXT = 0;
                    END;
                UNTIL PurchInvL.NEXT = 0;

                IF "Purch. Inv. Header".Structure = 'FORIEGN' THEN
                    tempbed := dummybed
                ELSE BEGIN
                    IF "Purch. Inv. Header"."Additional Duty Value" <> 0 THEN                        //added by sreenivaas on 02-09-2010
                        tempbed := dummybed - dummycess - "Purch. Inv. Header"."Additional Duty Value"
                    ELSE
                        tempbed := dummybed - dummycess;
                END;


                tempcenvat := tempcenvat + dummybed;
                tempcess := tempcess + dummycess;
                Dcenvattot := Dcenvattot + tempbed;
                DCesstot := DCesstot + dummycess;

                currentcess := currentcess + dummycess;

                IF Amt > 0 THEN BEGIN
                    Vend.RESET;
                    Vend.SETRANGE(Vend."No.", "Purch. Inv. Header"."Buy-from Vendor No.");
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
                k := k + 1;
                IF dummybed > 0 THEN
                    sno := sno + 1;
                IF ("Purch. Inv. Header"."Vendor Excise Invoice No." = '1020A') THEN
                    sno := sno - 1;
                currentrecord := currentrecord + 1;
            end;

            trigger OnPreDataItem();
            begin
                k := 0;
                currentbed := 0;
                currentcess := 0;
                previousno := '';
                SETRANGE("Actual Invoiced Date", StartDt, EndDt);
                SETFILTER("Location Code", 'STR|CS STR');
                SETFILTER("Purch. Inv. Header"."Excise Not to Consider", 'No');
                SETFILTER("Purch. Inv. Header".Structure, 'PURC-E+VAT|PURC-E+CST|PUR+EF+VAT|P-E+CST+AD|P-E+VAT+AD|FORIEGN|PUR+E+VAT');
                currentrecord := 0;
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
        IF Excel THEN BEGIN
            TempExcelbuffer.CreateBook('', '');//B2B //EFFUPG
                                               //TempExcelbuffer.CreateSheet('Rg 23 A part II','',COMPANYNAME,'');//B2B
            TempExcelbuffer.GiveUserControl;
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
        VendorName: Text[30];
        PurchInvH: Record "Purch. Rcpt. Header";
        PurchInvL: Record "Purch. Inv. Line";
        Vend: Record Vendor;
        Amt: Decimal;
        VendorNo: Code[20];
        "Date Filter": Date;
        StartDt: Date;
        EndDt: Date;
        OpenCenvatIN: Decimal;
        CrCenvatTakeIN: Decimal;
        CrCenvatUsedIN: Decimal;
        CloseCenvatIN: Decimal;
        INT: Decimal;
        RG23APARTII: Record "RG 23 A Part II";
        OpenSEDIN: Decimal;
        CrSEDTakeIN: Decimal;
        CrSEDUsedIN: Decimal;
        CloseSEDIN: Decimal;
        OpenAEDIN: Decimal;
        CrAEDTakeIN: Decimal;
        CrAEDUsedIN: Decimal;
        CloseAEDIN: Decimal;
        OpenADDIN: Decimal;
        CrADDTakeIN: Decimal;
        CrADDUsedIN: Decimal;
        CloseADDIN: Decimal;
        OpenOTHIN: Decimal;
        CrOTHTakeIN: Decimal;
        CrOTHUsedIN: Decimal;
        CloseOTHIN: Decimal;
        RG23CPARTII: Record "RG 23 C Part II";
        PurchRcptH: Record "Purch. Rcpt. Header";
        GRDt: Date;
        OrdNo: Code[20];
        OpenCenvatCG: Decimal;
        CrCenvatTakeCG: Decimal;
        CrCenvatUsedCG: Decimal;
        CloseCenvatCG: Decimal;
        OpenSEDCG: Decimal;
        CrSEDTakeCG: Decimal;
        CrSEDUsedCG: Decimal;
        CloseSEDCG: Decimal;
        OpenAEDCG: Decimal;
        CrAEDTakeCG: Decimal;
        CrAEDUsedCG: Decimal;
        CloseAEDCG: Decimal;
        OpenADDCG: Decimal;
        CrADDTakeCG: Decimal;
        CrADDUsedCG: Decimal;
        CloseADDCG: Decimal;
        OpenOTHCG: Decimal;
        CrOTHTakeCG: Decimal;
        CrOTHUsedCG: Decimal;
        CloseOTHCG: Decimal;
        VendType: Option;
        VendorType: Text[30];
        Desc: Text[50];
        Subheading: Code[10];
        Qty: Decimal;
        MaxValue: Decimal;
        Itm: Record Item;
        ItmNo: Code[10];
        dummy: Integer;
        FixAsset: Record "Fixed Asset";
        "ecc no": Code[10];
        invoiceno: Code[30];
        Dummyrg23: Record "RG 23 A Part II";
        dummybed: Decimal;
        previousno: Text[30];
        dummycess: Decimal;
        i: Integer;
        COMPANY: Record "Company Information";
        ECCFilter: Text[80];
        no: Integer;
        SIL: Record "Sales Invoice Line";
        SalExciseAmt: Decimal;
        SalEcessAmt: Decimal;
        SalEcess2amt: Decimal;
        SalEcess1Amt: Decimal;
        CenvatOB: Decimal;
        cenvattotal: Decimal;
        cesstotal: Decimal;
        CessOB: Decimal;
        DocDate: Date;
        PurchInvL1: Record "Purch. Inv. Line";
        OBCenvat: Decimal;
        OBCess: Decimal;
        Addduty1: Decimal;
        Dcenvattot: Decimal;
        DCesstot: Decimal;
        Addduty: Decimal;
        TempExcelbuffer: Record "Excel Buffer" temporary;
        Row: Integer;
        Excel: Boolean;
        tempcenvat: Decimal;
        tempcess: Decimal;
        sno: Integer;
        STD: Record "Posted Str Order Line Details";
        TOTAED: Decimal;
        vname: Text[60];
        vno: Text[15];
        vendor: Record Vendor;
        jvexcise: Decimal;
        jvbase: Decimal;
        temp: Decimal;
        jvadd: Decimal;
        jvbed: Decimal;
        jvcess: Decimal;
        jvinvno: Text[10];
        veccno: Text[50];
        GL1: Record "G/L Entry";
        jvpredocno: Text[30];
        VLE: Record "Vendor Ledger Entry";
        print: Boolean;
        typeofuspplier: Text[50];
        tempbed: Decimal;
        dummycenvatob: Decimal;
        dummycessob: Decimal;
        currentbed: Decimal;
        currentcess: Decimal;
        k: Integer;
        cenvatobsp: Decimal;
        currentrecord: Integer;
        totalexcisevalue: Decimal;
        FORM_R_G__23_A_Part____IICaptionLbl: Label 'FORM R.G. 23 A Part -  II';
        ENTRY_BOOK_OF_DUTY_CREDITCaptionLbl: Label 'ENTRY BOOK OF DUTY CREDIT';
        E_C_C__FilterCaptionLbl: Label 'E.C.C. Filter';
        AAACE4879QXM001CaptionLbl: Label 'AAACE4879QXM001';
        FOR_THE_PERIOD_OF_CaptionLbl: Label '"FOR THE PERIOD OF "';
        TOCaptionLbl: Label 'TO';
        Sl__no_CaptionLbl: Label 'Sl. no.';
        DOCUMENT_DATECaptionLbl: Label 'DOCUMENT DATE';
        BASIC_EXCISE_DUTYCaptionLbl: Label 'BASIC EXCISE DUTY';
        Other_Duties__Specify_CaptionLbl: Label 'Other Duties (Specify)';
        A_R_1_G_P_1__other_approved_document_bill_of_entry_No__and_dateCaptionLbl: Label 'A.R.1/G.P.1/ other approved document bill of entry No. and date';
        ECC_Code_of_supplierCaptionLbl: Label 'ECC Code of supplier';
        Range__Division__Custom_House_From_Where_receivedCaptionLbl: Label 'Range/ Division/ Custom House From Where received';
        Folio_and_Entry_No__in_Part_ICaptionLbl: Label 'Folio and Entry No. in Part I';
        Basic_Excise_DutyCaption_Control1102154176Lbl: Label 'Basic Excise Duty';
        Additional_Duty_of_Customs_equivalent_to_Basic_Excise_DutyCaptionLbl: Label 'Additional Duty of Customs equivalent to Basic Excise Duty';
        Basic_Excise_Duty_and_Additional_Duty_of_Customs_equivalent_to_Basic_Excise_DutyCaptionLbl: Label 'Basic Excise Duty and Additional Duty of Customs equivalent to Basic Excise Duty';
        A_R_1__Invoice_other_approved_document_No__and_dateCaptionLbl: Label 'A.R.1/ Invoice other approved document No. and date';
        CET_Sub_headingCaptionLbl: Label 'CET Sub heading';
        EC_Code_of_BuyerCaptionLbl: Label 'EC Code of Buyer';
        Opening_Balance_of_Duty_in_CreditCaptionLbl: Label 'Opening Balance of Duty in Credit';
        Fresh_credit_allowed__4_to_6_CaptionLbl: Label 'Fresh credit allowed (4 to 6)';
        Fresh_credit_allowed__7__Amount_of_Duty_creditedCaptionLbl: Label 'Fresh credit allowed (7) Amount of Duty credited';
        Other_Duties__Specify_Caption_Control1102154185Lbl: Label 'Other Duties (Specify)';
        Other_Duties__Specify_Caption_Control1102154186Lbl: Label 'Other Duties (Specify)';
        Total_Credit__3_____7__AvailableCaptionLbl: Label 'Total Credit (3) + (7) Available';
        Dept_9_to_11CaptionLbl: Label 'Dept 9 to 11';
        Other_Duties__Specify_Caption_Control1102154189Lbl: Label 'Other Duties (Specify)';
        Balance_Of_CreditCaptionLbl: Label 'Balance Of Credit';
        B_E_D_AED_of_Customs_equivalent_to_BEDCaptionLbl: Label 'B E D&AED of Customs equivalent to BED';
        Other_Duties__Specify_Caption_Control1102154192Lbl: Label 'Other Duties (Specify)';
        Central_Excise_Officers_InitialsCaptionLbl: Label 'Central Excise Officers Initials';
        V1CaptionLbl: Label '1';
        V2CaptionLbl: Label '2';
        V3aCaptionLbl: Label '3a';
        V3bCaptionLbl: Label '3b';
        V4aCaptionLbl: Label '4a';
        V4dCaptionLbl: Label '4d';
        V6CaptionLbl: Label '6';
        V7CaptionLbl: Label '7';
        V8aCaptionLbl: Label '8a';
        V8DCaptionLbl: Label '8D';
        V8ECaptionLbl: Label '8E';
        V9aCaptionLbl: Label '9a';
        V9bCaptionLbl: Label '9b';
        V9cCaptionLbl: Label '9c';
        V10CaptionLbl: Label '10';
        V11CaptionLbl: Label '11';
        V12CaptionLbl: Label '12';
        V12bCaptionLbl: Label '12b';
        V13CaptionLbl: Label '13';
        V8bCaptionLbl: Label '8b';
        Vendor_NameCaptionLbl: Label 'Vendor Name';
        V4cCaptionLbl: Label '4c';
        V5CaptionLbl: Label '5';
        Basic_Excise_DutyCaption_Control1102154284Lbl: Label 'Basic Excise Duty';
        V8cCaptionLbl: Label '8c';
        HIGHER_E_CESSCaptionLbl: Label 'HIGHER E.CESS';
        ED__CESSCaptionLbl: Label 'ED. CESS';
        V4bCaptionLbl: Label '4b';

    (7237)]
    procedure Entercell(RowNo: Integer; ColumnNo: Integer; CellValue: Text[1000]; bold: Boolean);
    begin

        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.", RowNo);
        TempExcelbuffer.VALIDATE("Column No.", ColumnNo);
        TempExcelbuffer."Cell Value as Text" := CellValue;
        TempExcelbuffer.Bold := bold;

        TempExcelbuffer.INSERT;
    end;

    (7247)]
    procedure EnterHeadings(RowNo: Integer; ColumnNo: Integer; CellValue: Text[100]; Bold: Boolean);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.", RowNo);
        TempExcelbuffer.VALIDATE("Column No.", ColumnNo);
        TempExcelbuffer."Cell Value as Text" := FORMAT(CellValue);
        TempExcelbuffer.Bold := Bold;

        TempExcelbuffer.Formula := '';
        TempExcelbuffer.INSERT;
    end;
}

