report 33000907 "Voucher Print1"
{
    // version NAVIN3.70.00.12,DIM1.0

    // Project : EFFTRONICS
    // *************************************************************************************************************************
    // SIGN Name
    // ************************************************************************************************************************
    // DIM : Resolution of Dimension Issues after Upgarding.
    // ***********************************************************************************************************************
    // Version  sign     Date       USERID    Description
    // *************************************************************************************************************************
    // 1.0      DIM      28-May-13  SAIRAM    New Code has been added for the dimensions updation after upgarding.
    DefaultLayout = RDLC;
    RDLCLayout = './Voucher Print1.rdlc';


    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            DataItemTableView = SORTING(Entry No.) ORDER(Ascending);
            RequestFilterFields = "Document No.", "Payment Type";
            column(GL_VouchType; VouchType)
            {
            }
            column(CompanyInformation_Name; CompanyInformation.Name)
            {
            }
            column(CompanyInformation_Address; CompanyInformation.Address)
            {
            }
            column(CompanyInformation__Address_2_; CompanyInformation."Address 2")
            {
            }
            column(CompanyInformation_City; CompanyInformation.City)
            {
            }
            column(FORMAT__Posting_Date__0_7_; FORMAT("Posting Date", 0, '<Day> <Month Text,3> <Year4>'))
            {
            }
            column(G_L_Entry__G_L_Entry___Payment_Type_; "G/L Entry"."Payment Type")
            {
            }
            column(CompanyInformation_Name_Control1102154046; CompanyInformation.Name)
            {
            }
            column(CompanyInformation_Address_Control1102154047; CompanyInformation.Address)
            {
            }
            column(CompanyInformation__Address_2__Control1102154048; CompanyInformation."Address 2")
            {
            }
            column(CompanyInformation_City_Control1102154049; CompanyInformation.City)
            {
            }
            column(FORMAT__Posting_Date__0_7__Control1102154050; FORMAT("Posting Date", 0, 7))
            {
            }
            column(textcap; textcap)
            {
            }
            column(G_L_Entry__Debit_Amount_; "Debit Amount")
            {
            }
            column(G_L_Entry__Credit_Amount_; "Credit Amount")
            {
            }
            column(cap1_____AccountName__________G_L_Entry___Global_Dimension_1_Code_____; cap1 + ' ' + AccountName + ' ' + '(' + "G/L Entry"."Global Dimension 1 Code" + ')')
            {
            }
            column(cap1_____AccountName__________G_L_Entry___Global_Dimension_1_Code______Control1102154019; cap1 + ' ' + AccountName + ' ' + '(' + "G/L Entry"."Global Dimension 1 Code" + ')')
            {
            }
            column(G_L_Entry___Credit_Amount___G_L_Entry___Debit_Amount_; "G/L Entry"."Credit Amount" + "G/L Entry"."Debit Amount")
            {
            }
            column(cap1_____AccountName__________G_L_Entry___Global_Dimension_1_Code______Control1102154002; cap1 + ' ' + AccountName + ' ' + '(' + "G/L Entry"."Global Dimension 1 Code" + ')')
            {
            }
            column(G_L_Entry___Credit_Amount___G_L_Entry___Debit_Amount__Control1102154004; "G/L Entry"."Credit Amount" + "G/L Entry"."Debit Amount")
            {
            }
            column(NumberText_2_; NumberText[2])
            {
            }
            column(NumberText_1_; NumberText[1])
            {
            }
            column(chetext________Description; chetext + '    ' + Description)
            {
            }
            column(capt; capt)
            {
            }
            column(G_L_Entry__G_L_Entry___Credit_Amount_; "G/L Entry"."Credit Amount")
            {
            }
            column(G_L_Entry__Debit_Amount__Control1280014; "Debit Amount")
            {
            }
            column(G_L_Entry__Credit_Amount__Control1280017; "Credit Amount")
            {
            }
            column(NumberText_2__Control1280022; NumberText[2])
            {
            }
            column(NumberText_1__Control1280023; NumberText[1])
            {
            }
            column(G_L_Entry_Description; Description)
            {
            }
            column(NumberText_2__Control1102154011; NumberText[2])
            {
            }
            column(NumberText_1__Control1102154012; NumberText[1])
            {
            }
            column(chetext_Description_potext; chetext + Description + potext)
            {
            }
            column(capt_Control1102154021; capt)
            {
            }
            column(G_L_Entry__G_L_Entry___Credit_Amount__Control1102154023; "G/L Entry"."Credit Amount")
            {
            }
            column(Dated_____Caption; Dated_____CaptionLbl)
            {
            }
            column(Credit_Caption; Credit_CaptionLbl)
            {
            }
            column(Debit_Caption; Debit_CaptionLbl)
            {
            }
            column(ParticularsCaption; ParticularsCaptionLbl)
            {
            }
            column(VoucherCaption; VoucherCaptionLbl)
            {
            }
            column(Dated_____Caption_Control1102154003; Dated_____Caption_Control1102154003Lbl)
            {
            }
            column(AmountCaption; AmountCaptionLbl)
            {
            }
            column(ParticularsCaption_Control1102154055; ParticularsCaption_Control1102154055Lbl)
            {
            }
            column(VoucherCaption_Control1102154058; VoucherCaption_Control1102154058Lbl)
            {
            }
            column(Amount__in_Words__Caption; Amount__in_Words__CaptionLbl)
            {
            }
            column(Narration_Caption; Narration_CaptionLbl)
            {
            }
            column(Authorised_SignatoryCaption; Authorised_SignatoryCaptionLbl)
            {
            }
            column(Through_Caption; Through_CaptionLbl)
            {
            }
            column(Receiver_s_Signature_Caption; Receiver_s_Signature_CaptionLbl)
            {
            }
            column(Amount__in_Words__Caption_Control1280024; Amount__in_Words__Caption_Control1280024Lbl)
            {
            }
            column(Narration_Caption_Control1102154000; Narration_Caption_Control1102154000Lbl)
            {
            }
            column(Authorised_SignatoryCaption_Control1102154006; Authorised_SignatoryCaption_Control1102154006Lbl)
            {
            }
            column(Amount__in_Words__Caption_Control1102154013; Amount__in_Words__Caption_Control1102154013Lbl)
            {
            }
            column(Narration_Caption_Control1102154015; Narration_Caption_Control1102154015Lbl)
            {
            }
            column(Authorised_SignatoryCaption_Control1102154017; Authorised_SignatoryCaption_Control1102154017Lbl)
            {
            }
            column(Through_Caption_Control1102154020; Through_Caption_Control1102154020Lbl)
            {
            }
            column(Receiver_s_Signature_Caption_Control1102154007; Receiver_s_Signature_Caption_Control1102154007Lbl)
            {
            }
            column(G_L_Entry_Entry_No_; "Entry No.")
            {
            }
            column(HeaderVisiable1; HeaderVisiable1)
            {
            }
            column(HeaderVisiable2; HeaderVisiable2)
            {
            }
            column(BodyVisiable1; BodyVisiable1)
            {
            }
            column(BodyVisiable2; BodyVisiable2)
            {
            }
            column(BodyVisiable3; BodyVisiable3)
            {
            }
            column(FooterVis1; FooterVis1)
            {
            }
            column(FooterVis2; FooterVis2)
            {
            }
            column(FooterVis3; FooterVis3)
            {
            }
            column(Desc; cap1 + ' ' + AccountName + ' ' + '(' + "G/L Entry"."Global Dimension 1 Code" + ')')
            {
            }
            column(Debit; "Debit Amount")
            {
            }
            column(Credit; "Credit Amount")
            {
            }
            column(NarrationText; NarrationText)
            {
            }

            trigger OnAfterGetRecord();
            begin
                //Hack
                NarrationText := '';
                narrationrec.RESET;
                narrationrec.SETRANGE(Type, narrationrec.Type::"Narration Line");
                narrationrec.SETFILTER("No.", "G/L Entry"."Document No.");
                IF narrationrec.FINDFIRST THEN
                    REPEAT
                        NarrationText := NarrationText + narrationrec.Comment;
                    UNTIL narrationrec.NEXT = 0;
                IF NarrationText = '' THEN BEGIN
                    NarrationText := "G/L Entry".Description;
                END;
                NarrationText := UPPERCASE(NarrationText);
                IF COPYSTR("G/L Entry"."Document No.", 1, 2) = 'JV' THEN BEGIN
                    textcap := 'Journal';
                END ELSE
                    IF ("G/L Entry".GETFILTER("G/L Entry"."Payment Type") = 'Journal') OR
                      ("G/L Entry".GETFILTER("G/L Entry"."Payment Type") = 'Contra') THEN BEGIN
                        IF "G/L Entry"."Payment Type" = "G/L Entry"."Payment Type"::Advance THEN
                            textcap := 'Receipt'
                        ELSE
                            textcap := FORMAT("G/L Entry"."Payment Type");
                    END ELSE BEGIN
                        IF "G/L Entry"."Payment Type" = "G/L Entry"."Payment Type"::Advance THEN
                            textcap := 'Receipt'
                        ELSE
                            IF "G/L Entry"."Payment Type" = "G/L Entry"."Payment Type"::"Supply Payment" THEN
                                textcap := 'Receipt'
                            ELSE
                                IF "G/L Entry"."Payment Type" = "G/L Entry"."Payment Type"::"Final Payment" THEN
                                    textcap := 'Receipt'
                                ELSE
                                    textcap := FORMAT("G/L Entry"."Payment Type");
                    END;
                //hack
                cap1 := '';
                "G/L Account".RESET;
                "G/L Account".SETRANGE("No.", "G/L Account No.");
                IF "G/L Account".FIND('-') THEN
                    AccountName := "G/L Account".Name;
                IF ("G/L Entry"."G/L Account No." = '12200') THEN
                    AccountName := 'Buildings';

                IF ("G/L Entry"."G/L Account No." = '12952') THEN
                    AccountName := 'Mobile Instruments';

                IF ("G/L Entry"."G/L Account No." = '13200') THEN
                    AccountName := 'Office Equipment';

                IF ("G/L Entry"."G/L Account No." = '14200') THEN
                    AccountName := 'Vehicles';

                IF ("G/L Entry"."G/L Account No." = '15200') THEN
                    AccountName := 'Furnitures & Fixtures';

                IF ("G/L Entry"."G/L Account No." = '16200') THEN
                    AccountName := 'Plant & Machinery';

                IF ("G/L Entry"."G/L Account No." = '17200') THEN
                    AccountName := 'Computers';
                IF ("G/L Entry"."G/L Account No." = '18200') THEN
                    AccountName := 'Software';

                IF ("G/L Entry"."G/L Account No." = '24200') THEN
                    cap1 := 'Sal-Adv';
                IF ("G/L Entry"."G/L Account No." = '24000') THEN
                    cap1 := 'TA';
                IF ("G/L Entry"."G/L Account No." = '24300') THEN
                    cap1 := 'Adv-For-Exp';
                IF ("G/L Entry"."G/L Account No." = '24600') THEN
                    cap1 := 'Adv-For-Pur';
                IF ("G/L Entry"."G/L Account No." = '37200') THEN
                    cap1 := 'Sal-Dep';
                IF ("G/L Entry"."G/L Account No." = '25700') THEN
                    cap1 := 'SD-';
                IF ("G/L Entry"."G/L Account No." = '39800') THEN
                    cap1 := 'TDS ON SAL-';
                IF ("G/L Entry"."G/L Account No." = '37400') THEN
                    cap1 := 'LMD SD-';




                "G/L Account".RESET;
                "G/L Account".SETRANGE("No.", "Bal. Account No.");
                IF "G/L Account".FIND('-') THEN
                    BalAccountName := "G/L Account".Name;

                IF ("G/L Entry"."G/L Account No." IN ['41000', '36200', '36300']) THEN BEGIN
                    vno := "G/L Entry"."Source No.";
                    vendor.SETRANGE(vendor."No.", vno);
                    IF vendor.FIND('-') THEN
                        AccountName := vendor.Name;
                END;
                IF ("G/L Entry"."G/L Account No." = '20300') OR ("G/L Entry"."G/L Account No." = '20400')
                   OR ("G/L Entry"."G/L Account No." = '20500') OR ("G/L Entry"."G/L Account No." = '20600') THEN BEGIN
                    cno := "G/L Entry"."Source No.";
                    customer.SETRANGE(customer."No.", cno);
                    IF customer.FIND('-') THEN
                        AccountName := customer.Name;
                END;
                //DIM1.0 Start
                //Code Commented
                /*
                acno:="G/L Entry"."G/L Account No.";
                IF (acno='24200') OR (acno='24000') OR (acno='24100') OR (acno='24300')  OR (acno='37200') OR (acno='25700') OR(acno='34200') THEN
                BEGIN
                LED.SETRANGE(LED."Entry No.","G/L Entry"."Entry No.");
                IF LED.FIND('-') THEN
                REPEAT
                accode:=LED."Dimension Value Code";
                DVL.SETRANGE(DVL.Code,accode);
                IF DVL.FIND('-') THEN
                AccountName:=DVL.Name;
                UNTIL LED.NEXT=0;
                END;
                */
                acno := "G/L Entry"."G/L Account No.";
                IF (acno = '24200') OR (acno = '24000') OR (acno = '24100') OR (acno = '24300') OR (acno = '24600') OR (acno = '37200') OR (acno = '25700') OR (acno = '34200') THEN BEGIN
                    DimSetEntryGRec.RESET;
                    DimSetEntryGRec.SETRANGE("Dimension Set ID", "Dimension Set ID");
                    IF DimSetEntryGRec.FINDSET THEN
                        REPEAT
                            accode := DimSetEntryGRec."Dimension Value Code";
                            AccountName := DimSetEntryGRec."Dimension Value Code";
                            dimValue.RESET;
                            dimValue.SETFILTER(dimValue."Dimension Code", DimSetEntryGRec."Dimension Code");
                            dimValue.SETFILTER(dimValue.Code, DimSetEntryGRec."Dimension Value Code");
                            IF dimValue.FINDFIRST THEN BEGIN
                                AccountName := dimValue.Name;
                            END;
                        UNTIL DimSetEntryGRec.NEXT = 0;
                END;
                //DIM1.0 End


                IF (acno = '33200') OR (acno = '22200') THEN BEGIN
                    BA.SETRANGE(BA."No.", "G/L Entry"."Source No.");
                    IF BA.FIND('-') THEN BEGIN
                        capt := BA.Name;
                        AccountName := BA.Name;
                    END;
                END;
                IF (acno = '22100') THEN BEGIN
                    "G/L Account".SETRANGE("No.", acno);
                    IF "G/L Account".FIND('-') THEN BEGIN
                        capt := "G/L Account".Name;
                    END;
                END;

                //Rev01
                // copy code from //G/L Entry, Body (4) - OnPostSection() >>
                IF ("G/L Entry"."Journal Batch Name" = 'JV') OR ("G/L Entry"."Journal Batch Name" = 'JV-E') OR
                ("G/L Entry"."Payment Type" = "G/L Entry"."Payment Type"::Contra) OR ("G/L Entry"."Journal Batch Name" = 'JV401NEW') OR
                ("G/L Entry"."Payment Type" = "G/L Entry"."Payment Type"::Journal) THEN
                    BodyVisiable1 := TRUE
                ELSE
                    BodyVisiable1 := FALSE;
                // copy code from //G/L Entry, Body (4) - OnPostSection() <<

                // copy code from //G/L Entry, Body (5) - OnPostSection() >>
                IF ("G/L Entry"."Journal Batch Name" = 'JV') OR ("G/L Entry"."Journal Batch Name" = 'JV-E') OR
                ("G/L Entry"."Payment Type" = "G/L Entry"."Payment Type"::Contra) OR
                ("G/L Entry"."Payment Type" = "G/L Entry"."Payment Type"::Journal) OR
                ("G/L Entry"."Payment Type" = "G/L Entry"."Payment Type"::payment) THEN
                    BodyVisiable2 := FALSE
                ELSE
                    BodyVisiable2 := TRUE;

                IF ("G/L Entry"."G/L Account No." = '22200') OR ("G/L Entry"."G/L Account No." = '33200') OR
                ("G/L Entry"."G/L Account No." = '22100') OR ("G/L Entry"."G/L Account No." = '22101') THEN BEGIN
                    BodyVisiable2 := FALSE;
                    amt := "G/L Entry".Amount;
                END;
                // copy code from //G/L Entry, Body (5) - OnPostSection() <<

                // copy code from //G/L Entry, Body (6) - OnPostSection() >>
                IF ("G/L Entry"."Payment Type" = "G/L Entry"."Payment Type"::payment) THEN
                    BodyVisiable3 := TRUE
                ELSE
                    BodyVisiable3 := FALSE;

                IF ("G/L Entry"."G/L Account No." = '22200') OR ("G/L Entry"."G/L Account No." = '33200') OR
                ("G/L Entry"."G/L Account No." = '22100') OR ("G/L Entry"."G/L Account No." = '22101') THEN BEGIN
                    BodyVisiable3 := FALSE;
                END;
                // copy code from //G/L Entry, Body (6) - OnPostSection() <<
                //Rev01

                // Footer code
                // copy code from // G/L Entry, Footer (7) - OnPostSection() >>
                FooterVis1 := FALSE;
                FooterVis2 := FALSE;
                FooterVis3 := FALSE;
                IF ("Payment Type" = "Payment Type"::payment) THEN
                    FooterVis1 := TRUE
                ELSE
                    IF ("Journal Batch Name" = 'JV') OR ("Journal Batch Name" = 'JV-E') OR
                     ("Payment Type" = "Payment Type"::Contra) OR ("Journal Batch Name" = 'JV401NEW')
                     OR ("Payment Type" = "Payment Type"::Journal) THEN
                        FooterVis2 := TRUE
                    ELSE
                        FooterVis3 := TRUE;

                IF "G/L Entry"."Cheque No." <> '' THEN
                    chetext := 'CH.NO. ' + "G/L Entry"."Cheque No.";

                AmtInWords += ABS("Debit Amount");

                // copy code from // G/L Entry, Footer (7) - OnPostSection() <<
                CLE.SETRANGE(CLE."Document No.", "G/L Entry"."Document No.");
                CLE.SETRANGE(CLE."Payment Type", "G/L Entry"."Payment Type");
                IF CLE.FIND('-') THEN BEGIN
                    IF (CLE."Customer ord No" <> '') AND ("G/L Entry"."Payment Type" = "G/L Entry"."Payment Type"::Advance) THEN
                        potext := 'AGAINST P.O.NO. ' + CLE."Customer ord No";

                    IF (CLE."Customer ord No" <> '') AND (("G/L Entry"."Payment Type" = "G/L Entry"."Payment Type"::"Final Payment")
                     OR ("G/L Entry"."Payment Type" = "G/L Entry"."Payment Type"::"Final Payment")) THEN BEGIN
                        potext := 'AGAINST P.O.NO. ' + CLE."Customer ord No" + ' FOR THE INVOICE NO. ' + CLE."invoice no" + ' DATED: ' +
                        FORMAT(CLE."Posting Date");
                    END;
                END;

                InitTextVariable;
                FormatNoText(NumberText, AmtInWords, '');

                // copy code from // G/L Entry, Footer (9) - OnPostSection() <<

            end;

            trigger OnPreDataItem();
            begin
                CompanyInformation.FIND('-');
                HeaderVisiable1 := FALSE;
                HeaderVisiable2 := FALSE;
                IF "G/L Entry".GETFILTERS = '' THEN
                    CurrReport.BREAK;
                VouchType := 'General';
                IF COPYSTR("G/L Entry"."Document No.", 1, 2) = 'JV' THEN BEGIN
                    textcap := 'Journal';
                END ELSE
                    IF ("G/L Entry".GETFILTER("G/L Entry"."Payment Type") = 'Journal') OR
                      ("G/L Entry".GETFILTER("G/L Entry"."Payment Type") = 'Contra') THEN BEGIN
                        HeaderVisiable1 := TRUE;
                        IF "G/L Entry"."Payment Type" = "G/L Entry"."Payment Type"::Advance THEN
                            textcap := 'Receipt'
                        ELSE
                            textcap := FORMAT("G/L Entry"."Payment Type");
                    END ELSE BEGIN
                        HeaderVisiable2 := TRUE;
                        IF "G/L Entry"."Payment Type" = "G/L Entry"."Payment Type"::Advance THEN
                            textcap := 'Receipt'
                        ELSE
                            IF "G/L Entry"."Payment Type" = "G/L Entry"."Payment Type"::"Supply Payment" THEN
                                textcap := 'Receipt'
                            ELSE
                                IF "G/L Entry"."Payment Type" = "G/L Entry"."Payment Type"::"Final Payment" THEN
                                    textcap := 'Receipt'
                                ELSE
                                    textcap := FORMAT("G/L Entry"."Payment Type");
                    END;
            end;
        }
        dataitem("Detailed GST Ledger Entry"; "Detailed GST Ledger Entry")
        {
            DataItemTableView = SORTING(Document No., Document Line No., GST Component Code) WHERE(Document Type=CONST(Payment));
            RequestFilterFields = "Document No.", "Posting Date";
            column(DGLE_VouchType; VouchType)
            {
            }
            column(CompanyName; COMPANYNAME)
            {
            }
            column(CompAddr_1; CompAddr[1])
            {
            }
            column(CompAddr_2; CompAddr[2])
            {
            }
            column(CompAddr_3; CompAddr[3])
            {
            }
            column(CompAddr_4; CompAddr[4])
            {
            }
            column(CompAddr_5; CompAddr[5])
            {
            }
            column(CompAddr_6; CompAddr[6])
            {
            }
            column(CompAddr_7; CompAddr[7])
            {
            }
            column(CompAddr_8; CompAddr[8])
            {
            }
            column(GSTIN_Numb_Caption; GSTIN_Numb_CaptionLbl)
            {
            }
            column(CompInfoRecGbl_GST_Reg_No; CompInfoRecGbl."GST Registration No.")
            {
            }
            column(PostingDate_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."Posting Date")
            {
            }
            column(DocumentNo_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."Document No.")
            {
            }
            column(Type_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry".Type)
            {
            }
            column(No_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."No.")
            {
            }
            column(HSNSACCode_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."HSN/SAC Code")
            {
            }
            column(GSTBaseAmount_DetailedGSTLedgerEntry; ABS("Detailed GST Ledger Entry"."GST Base Amount"))
            {
            }
            column(GSTGroupCode_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."GST Group Code")
            {
            }
            column(GSTComponentCode_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."GST Component Code")
            {
            }
            column(ExtDocNo_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."External Document No.")
            {
            }
            column(CGSTAmtVarGbl; ABS(CGSTAmtVarGbl))
            {
            }
            column(SGSTAmtVarGbl; ABS(SGSTAmtVarGbl))
            {
            }
            column(IGSTAmtVarGbl; ABS(IGSTAmtVarGbl))
            {
            }
            column(CGSTPercVarGbl; CGSTPercVarGbl)
            {
            }
            column(SGSTPercVarGbl; SGSTPercVarGbl)
            {
            }
            column(IGSTPercVarGbl; IGSTPercVarGbl)
            {
            }
            column(SNoVarGbl; SNoVarGbl)
            {
            }
            column(ItemRecGbl_Desc; ItemRecGbl.Description)
            {
            }
            column(Vou_Serial_No_Caption; Vou_Serial_No_CaptionLbl)
            {
            }
            column(Vou_Date_Caption; Vou_Date_CaptionLbl)
            {
            }
            column(VendAddr_1; VendAddr[1])
            {
            }
            column(VendAddr_2; VendAddr[2])
            {
            }
            column(VendAddr_3; VendAddr[3])
            {
            }
            column(VendAddr_4; VendAddr[4])
            {
            }
            column(VendAddr_5; VendAddr[5])
            {
            }
            column(VendAddr_6; VendAddr[6])
            {
            }
            column(VendAddr_7; VendAddr[7])
            {
            }
            column(VendAddr_8; VendAddr[8])
            {
            }
            column(Vend_GST_Reg_No; VendRecGbl."GST Registration No.")
            {
            }
            column(VendGSTInNUmVarGbl; VendGSTInNUmVarGbl)
            {
            }
            column(Item_Cod_Caption; Item_Cod_CaptionLbl)
            {
            }
            column(Desc_Caption; Desc_CaptionLbl)
            {
            }
            column(Hsn_Caption; Hsn_CaptionLbl)
            {
            }
            column(Amt_Caption; Amt_CaptionLbl)
            {
            }
            column(CSGT_Captio; CSGT_CaptioLbl)
            {
            }
            column(Rate_Caption; Rate_CaptionLbl)
            {
            }
            column(SGST_Captio; SGST_CaptioLbl)
            {
            }
            column(IGST_Captio; IGST_CaptioLbl)
            {
            }
            column(Total_Caption; Total_CaptionLbl)
            {
            }
            column(TotalAmtVarGbl; ABS(TotalAmtVarGbl))
            {
            }
            column(GrandTotal; ABS(GrandTotal))
            {
            }
            column(NumberText_1; NumberText[1])
            {
            }
            column(GSTNumberText_1; GSTNumberText[1])
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF PrevDocNo <> "Detailed GST Ledger Entry"."Document No." THEN BEGIN
                    CLEAR(TotalAmtVarGbl);
                    CLEAR(GrandTotal);
                    PrevDocNo := "Detailed GST Ledger Entry"."Document No.";
                    CLEAR(SNoVarGbl);
                    SNoVarGbl += 1;
                END;

                FormatAddr.Company(CompAddr, CompInfoRecGbl);

                CLEAR(VendGSTInNUmVarGbl);
                CLEAR(VendRecGbl);
                CLEAR(CustRecGbl);
                CLEAR(ItemRecGbl);

                VoucherNoVarGbl := "Document No.";
                VoucherDateVarGbl := "Posting Date";

                CLEAR(VendAddr);

                IF "Detailed GST Ledger Entry"."Source Type" = "Detailed GST Ledger Entry"."Source Type"::Vendor THEN BEGIN
                    IF VendRecGbl.GET("Detailed GST Ledger Entry"."Source No.") THEN;
                    FormatAddr.Vendor(VendAddr, VendRecGbl);
                    VendGSTInNUmVarGbl := 'GSTIN : ' + VendRecGbl."GST Registration No.";
                    VouchType := 'PAYMENT VOUCHER';
                END ELSE
                    IF "Detailed GST Ledger Entry"."Source Type" = "Detailed GST Ledger Entry"."Source Type"::Customer THEN BEGIN
                        IF CustRecGbl.GET("Detailed GST Ledger Entry"."Source No.") THEN;
                        FormatAddr.Customer(VendAddr, CustRecGbl);
                        VendGSTInNUmVarGbl := 'GSTIN : ' + CustRecGbl."GST Registration No.";
                        VouchType := 'RECEIPT VOUCHER';
                    END;

                IF ItemRecGbl.GET("Detailed GST Ledger Entry"."No.") THEN;

                CLEAR(CGSTAmtVarGbl);
                CLEAR(SGSTAmtVarGbl);
                CLEAR(IGSTAmtVarGbl);
                CLEAR(CGSTPercVarGbl);
                CLEAR(SGSTPercVarGbl);
                CLEAR(IGSTPercVarGbl);

                IF "Detailed GST Ledger Entry"."GST Component Code" = 'CGST' THEN BEGIN
                    CGSTAmtVarGbl := "Detailed GST Ledger Entry"."GST Amount";
                    CGSTPercVarGbl := "Detailed GST Ledger Entry"."GST %";
                    GrandTotal += CGSTAmtVarGbl;
                END ELSE
                    IF "Detailed GST Ledger Entry"."GST Component Code" = 'SGST' THEN BEGIN
                        SGSTAmtVarGbl := "Detailed GST Ledger Entry"."GST Amount";
                        SGSTPercVarGbl := "Detailed GST Ledger Entry"."GST %";
                        GrandTotal += SGSTAmtVarGbl + "Detailed GST Ledger Entry"."GST Base Amount";
                    END ELSE
                        IF "Detailed GST Ledger Entry"."GST Component Code" = 'IGST' THEN BEGIN
                            IGSTAmtVarGbl := "Detailed GST Ledger Entry"."GST Amount";
                            IGSTPercVarGbl := "Detailed GST Ledger Entry"."GST %";
                            GrandTotal += IGSTAmtVarGbl + "Detailed GST Ledger Entry"."GST Base Amount";
                        END;

                TotalAmtVarGbl += CGSTAmtVarGbl + SGSTAmtVarGbl + IGSTAmtVarGbl;

                CLEAR(CheckRep);
                CheckRep.InitTextVariable;
                CheckRep.FormatNoText(NumberText, (ROUND(GrandTotal, 0.01, '=')), '');

                CLEAR(GSTCheckRep);
                GSTCheckRep.InitTextVariable;
                GSTCheckRep.FormatNoText(GSTNumberText, (ROUND(TotalAmtVarGbl, 0.01, '=')), '');
            end;

            trigger OnPreDataItem();
            begin
                CLEAR(TotalAmtVarGbl);
                CLEAR(GrandTotal);
                CLEAR(CheckRep);
                IF "Detailed GST Ledger Entry".GETFILTERS = '' THEN
                    CurrReport.BREAK;
                VouchType := 'PAYMENT VOUCHER';
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

    trigger OnPreReport();
    begin
        VouchType := '';
        CompInfoRecGbl.GET;
    end;

    var
        "G/L Account": Record "G/L Account";
        CompanyInformation: Record "Company Information";
        AccountName: Text[50];
        BalAccountName: Text[30];
        NumberText: array[2] of Text[300];
        Text026: Label 'ZERO';
        Text027: Label 'HUNDRED';
        Text028: Label 'AND';
        Text032: Label 'ONE';
        Text033: Label 'TWO';
        Text034: Label 'THREE';
        Text035: Label 'FOUR';
        Text036: Label 'FIVE';
        Text037: Label 'SIX';
        Text038: Label 'SEVEN';
        Text039: Label 'EIGHT';
        Text040: Label 'NINE';
        Text041: Label 'TEN';
        Text042: Label 'ELEVEN';
        Text043: Label 'TWELVE';
        Text044: Label 'THIRTEEN';
        Text045: Label 'FOURTEEN';
        Text046: Label 'FIFTEEN';
        Text047: Label 'SIXTEEN';
        Text048: Label 'SEVENTEEN';
        Text049: Label 'EIGHTEEN';
        Text050: Label 'NINETEEN';
        Text051: Label 'TWENTY';
        Text052: Label 'THIRTY';
        Text053: Label 'FORTY';
        Text054: Label 'FIFTY';
        Text055: Label 'SIXTY';
        Text056: Label 'SEVENTY';
        Text057: Label 'EIGHTY';
        Text058: Label 'NINETY';
        Text059: Label 'THOUSAND';
        Text060: Label 'LAKH';
        Text061: Label 'CRORE';
        OnesText: array[20] of Text[30];
        TensText: array[10] of Text[30];
        ExponentText: array[5] of Text[30];
        Tens1: Integer;
        Ones1: Integer;
        Text029: Label '%1 results in a written number that is too long.';
        cap: Text[30];
        capt: Text[30];
        str1: Text[30];
        str2: Text[5];
        pos: Integer;
        str3: Text[5];
        str4: Text[5];
        str5: Text[5];
        pos1: Integer;
        vno: Code[10];
        vendor: Record Vendor;
        cno: Code[10];
        customer: Record Customer;
        acno: Code[10];
        accode: Code[15];
        DVL: Record "Dimension Value";
        docno: Code[15];
        VLE: Record "Vendor Ledger Entry";
        BA: Record "Bank Account";
        amt: Decimal;
        cap1: Text[20];
        captype: Text[30];
        textcap: Text[30];
        chetext: Text[30];
        potext: Text[100];
        CLE: Record "Cust. Ledger Entry";
        Dated_____CaptionLbl: Label 'Dated    :';
        Credit_CaptionLbl: Label '"Credit "';
        Debit_CaptionLbl: Label '"Debit "';
        ParticularsCaptionLbl: Label 'Particulars';
        VoucherCaptionLbl: Label 'Voucher';
        Dated_____Caption_Control1102154003Lbl: Label 'Dated    :';
        AmountCaptionLbl: Label 'Amount(Rs)';
        ParticularsCaption_Control1102154055Lbl: Label 'Particulars';
        VoucherCaption_Control1102154058Lbl: Label 'Voucher';
        Amount__in_Words__CaptionLbl: Label 'Amount( in Words):';
        Narration_CaptionLbl: Label 'Narration:';
        Authorised_SignatoryCaptionLbl: Label 'Authorised Signatory';
        Through_CaptionLbl: Label 'Through:';
        Receiver_s_Signature_CaptionLbl: Label 'Receiver''s Signature:';
        Amount__in_Words__Caption_Control1280024Lbl: Label 'Amount( in Words):';
        Narration_Caption_Control1102154000Lbl: Label 'Narration:';
        Authorised_SignatoryCaption_Control1102154006Lbl: Label 'Authorised Signatory';
        Amount__in_Words__Caption_Control1102154013Lbl: Label 'Amount( in Words):';
        Narration_Caption_Control1102154015Lbl: Label 'Narration:';
        Authorised_SignatoryCaption_Control1102154017Lbl: Label 'Authorised Signatory';
        Through_Caption_Control1102154020Lbl: Label 'Through:';
        Receiver_s_Signature_Caption_Control1102154007Lbl: Label 'Receiver''s Signature:';
        "-DIM1.0-": Integer;
        DimSetEntryGRec: Record "Dimension Set Entry";
        HeaderVisiable1: Boolean;
        HeaderVisiable2: Boolean;
        BodyVisiable1: Boolean;
        BodyVisiable2: Boolean;
        BodyVisiable3: Boolean;
        FooterVis1: Boolean;
        FooterVis2: Boolean;
        FooterVis3: Boolean;
        AmtInWords: Decimal;
        dimValue: Record "Dimension Value";
        DimSetEntry: Record "Dimension Set Entry";
        CompInfoRecGbl: Record "Company Information";
        VoucherNoVarGbl: Code[50];
        VoucherDateVarGbl: Date;
        VendRecGbl: Record Vendor;
        CustRecGbl: Record Customer;
        FormatAddr: Codeunit "Format Address";
        VendAddr: array[8] of Text;
        CompAddr: array[8] of Text;
        VendGSTInNUmVarGbl: Text;
        ItemRecGbl: Record Item;
        CGSTAmtVarGbl: Decimal;
        CGSTPercVarGbl: Decimal;
        SGSTAmtVarGbl: Decimal;
        SGSTPercVarGbl: Decimal;
        IGSTAmtVarGbl: Decimal;
        IGSTPercVarGbl: Decimal;
        TotalAmtVarGbl: Decimal;
        GrandTotal: Decimal;
        GSTNumberText: array[2] of Text[300];
        CheckRep: Report Check;
        GSTCheckRep: Report Check;
        PrevDocNo: Code[50];
        SNoVarGbl: Integer;
        GSTIN_Numb_CaptionLbl: Label 'GSTIN Number:';
        Vou_Serial_No_CaptionLbl: Label 'Voucher Serial Number:';
        Vou_Date_CaptionLbl: Label 'Voucher Date:';
        Item_Cod_CaptionLbl: Label 'Item Code';
        Desc_CaptionLbl: Label 'Description of Goods / Services';
        Hsn_CaptionLbl: Label 'HSN / SAC';
        Amt_CaptionLbl: Label 'Amount';
        CSGT_CaptioLbl: Label 'CSGT';
        SGST_CaptioLbl: Label 'SGST';
        IGST_CaptioLbl: Label 'IGST';
        Rate_CaptionLbl: Label 'Rate';
        Total_CaptionLbl: Label 'Total';
        DGLE: Record "Detailed GST Ledger Entry";
        VouchType: Code[30];
        NarrationText: Text[1000];
        narrationrec: Record "Purch. Comment Line";

    [LineStart(22685)]
    procedure FormatNoText(var NoText: array[2] of Text[80]; No: Decimal; CurrencyCode: Code[10]);
    var
        PrintExponent: Boolean;
        Ones: Integer;
        Tens: Integer;
        Hundreds: Integer;
        Exponent: Integer;
        NoTextIndex: Integer;
        Curr: Record Currency;
    begin
        CLEAR(NoText);
        NoTextIndex := 1;
        NoText[1] := '';  // NAVIN

        IF No < 1 THEN
            AddToNoText(NoText, NoTextIndex, PrintExponent, Text026)
        ELSE BEGIN
            FOR Exponent := 4 DOWNTO 1 DO BEGIN
                PrintExponent := FALSE;

                // NAVIN
                IF No > 99999 THEN BEGIN
                    Ones := No DIV (POWER(100, Exponent - 1) * 10);
                    Hundreds := 0;
                END ELSE BEGIN
                    Ones := No DIV POWER(1000, Exponent - 1);
                    Hundreds := Ones DIV 100;
                END;
                // NAVIN
                Tens := (Ones MOD 100) DIV 10;
                Ones := Ones MOD 10;
                IF Hundreds > 0 THEN BEGIN
                    AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Hundreds]);
                    AddToNoText(NoText, NoTextIndex, PrintExponent, Text027);
                END;
                IF Tens >= 2 THEN BEGIN
                    AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[Tens]);
                    IF Ones > 0 THEN
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Ones]);
                END ELSE
                    IF (Tens * 10 + Ones) > 0 THEN
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Tens * 10 + Ones]);
                IF PrintExponent AND (Exponent > 1) THEN
                    AddToNoText(NoText, NoTextIndex, PrintExponent, ExponentText[Exponent]);
                // NAVIN
                IF No > 99999 THEN
                    No := No - (Hundreds * 100 + Tens * 10 + Ones) * POWER(100, Exponent - 1) * 10
                ELSE
                    No := No - (Hundreds * 100 + Tens * 10 + Ones) * POWER(1000, Exponent - 1);
            END;
            // NAVIN
        END;

        IF (CurrencyCode <> '') THEN BEGIN
            Curr.GET(CurrencyCode);
            AddToNoText(NoText, NoTextIndex, PrintExponent, ' ' + Curr."Currency Numeric Description");
        END ELSE
            AddToNoText(NoText, NoTextIndex, PrintExponent, 'RUPEES');

        AddToNoText(NoText, NoTextIndex, PrintExponent, Text028);
        // NAVIN
        //AddToNoText(NoText,NoTextIndex,PrintExponent,FORMAT(No * 100) + '/100');

        Tens1 := ((No * 100) MOD 100) DIV 10;
        Ones1 := (No * 100) MOD 10;
        IF Tens1 >= 2 THEN BEGIN
            AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[Tens1]);
            IF Ones1 > 0 THEN
                AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Ones1]);
        END ELSE
            IF (Tens1 * 10 + Ones1) > 0 THEN
                AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Tens1 * 10 + Ones1])
            ELSE
                AddToNoText(NoText, NoTextIndex, PrintExponent, Text026);

        IF (CurrencyCode <> '') THEN
            AddToNoText(NoText, NoTextIndex, PrintExponent, ' ' + Curr."Currency Decimal Description" + ' ONLY')
        ELSE
            AddToNoText(NoText, NoTextIndex, PrintExponent, ' PAISA ONLY');
        //AddToNoText(NoText,NoTextIndex,PrintExponent,' PAISA ONLY');
        // NAVIN

        // IF CurrencyCode <> '' THEN
        //  AddToNoText(NoText,NoTextIndex,PrintExponent,CurrencyCode);
    end;

    [LineStart(22761)]
    procedure InitTextVariable();
    begin
        OnesText[1] := Text032;
        OnesText[2] := Text033;
        OnesText[3] := Text034;
        OnesText[4] := Text035;
        OnesText[5] := Text036;
        OnesText[6] := Text037;
        OnesText[7] := Text038;
        OnesText[8] := Text039;
        OnesText[9] := Text040;
        OnesText[10] := Text041;
        OnesText[11] := Text042;
        OnesText[12] := Text043;
        OnesText[13] := Text044;
        OnesText[14] := Text045;
        OnesText[15] := Text046;
        OnesText[16] := Text047;
        OnesText[17] := Text048;
        OnesText[18] := Text049;
        OnesText[19] := Text050;

        TensText[1] := '';
        TensText[2] := Text051;
        TensText[3] := Text052;
        TensText[4] := Text053;
        TensText[5] := Text054;
        TensText[6] := Text055;
        TensText[7] := Text056;
        TensText[8] := Text057;
        TensText[9] := Text058;

        ExponentText[1] := '';
        ExponentText[2] := Text059;
        ExponentText[3] := Text060;
        ExponentText[4] := Text061;
    end;

    [LineStart(22797)]
    local procedure AddToNoText(var NoText: array[2] of Text[80]; var NoTextIndex: Integer; var PrintExponent: Boolean; AddText: Text[30]);
    begin
        PrintExponent := TRUE;

        WHILE STRLEN(NoText[NoTextIndex] + ' ' + AddText) > MAXSTRLEN(NoText[1]) DO BEGIN
            NoTextIndex := NoTextIndex + 1;
            IF NoTextIndex > ARRAYLEN(NoText) THEN
                ERROR(Text029, AddText);
        END;

        NoText[NoTextIndex] := DELCHR(NoText[NoTextIndex] + ' ' + AddText, '<');
    end;
}

