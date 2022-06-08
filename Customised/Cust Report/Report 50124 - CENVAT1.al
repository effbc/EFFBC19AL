report 50124 CENVAT1
{
    // version NAVIN3.70|srinu,EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './CENVAT1.rdlc';

    dataset
    {
        dataitem(RG2AHdr; "Integer")
        {
            DataItemTableView = SORTING(Number);
            MaxIteration = 1;
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
                i := 1;
            end;
        }
        dataitem("RG 23 A Part II"; "RG 23 A Part II")
        {
            DataItemTableView = SORTING(Type) WHERE(Type = FILTER(Purchase));
            column(RG_23_A_Part_II__Entry_No__; "Entry No.")
            {
            }
            column(invoiceno; invoiceno)
            {
            }
            column(RG_23_A_Part_II__Posting_Date_; "Posting Date")
            {
            }
            column(Vend__E_C_C__No__; Vend."E.C.C. No.")
            {
            }
            column(VendorName; VendorName)
            {
            }
            column(Amt; Amt)
            {
            }
            column(GRDt; GRDt)
            {
            }
            column(VendorType; VendorType)
            {
            }
            column(Desc; Desc)
            {
            }
            column(Subheading; Subheading)
            {
            }
            column(Qty; Qty)
            {
            }
            column(dummybed; dummybed)
            {
            }
            column(RG_23_A_Part_II__AED_GSI__Credit_; "AED(GSI) Credit")
            {
            }
            column(RG_23_A_Part_II__SED_Credit_; "SED Credit")
            {
            }
            column(RG_23_A_Part_II__SAED_Credit_; "SAED Credit")
            {
            }
            column(dummycess; dummycess)
            {
            }
            column(InvoiceCaption; InvoiceCaptionLbl)
            {
            }

            trigger OnAfterGetRecord();
            begin
                PurchInvH.RESET;
                PurchInvH.SETRANGE(PurchInvH."No.", "RG 23 A Part II"."Document No.");
                IF PurchInvH.FIND('-') THEN BEGIN
                    VendorNo := PurchInvH."Buy-from Vendor No.";
                    OrdNo := PurchInvH."Order No.";
                    invoiceno := PurchInvH."Vendor Order No.";
                END;

                Amt := 0.0;
                PurchInvL.RESET;
                PurchInvL.SETRANGE(PurchInvL."Document No.", "RG 23 A Part II"."Document No.");
                PurchInvL.FIND('-');
                REPEAT
                    IF PurchInvL.Quantity = PurchInvL."Quantity Invoiced" THEN
                        Amt := Amt + PurchInvL."Item Charge Base Amount";
                UNTIL PurchInvL.NEXT = 0;

                dummybed := 0;
                dummycess := 0;
                Dummyrg23.SETRANGE(Dummyrg23."Vendor No.", VendorNo);
                Dummyrg23.SETRANGE(Dummyrg23."Vendor Invoice No.", invoiceno);
                IF Dummyrg23.FIND('-') THEN
                    REPEAT
                        dummybed := dummybed + Dummyrg23."BED Credit";
                        dummycess := dummycess + Dummyrg23."NCCD Credit" + Dummyrg23."eCess Credit";
                    UNTIL Dummyrg23.NEXT = 0;

                MaxValue := 0;
                PurchInvL.RESET;
                PurchInvL.SETRANGE(PurchInvL."Document No.", "RG 23 A Part II"."Document No.");
                PurchInvL.SETRANGE(PurchInvL.Type, 2, 3);
                PurchInvL.FIND('-');
                REPEAT
                    IF MaxValue < PurchInvL."BED Amount" THEN
                        MaxValue := PurchInvL."BED Amount"
                    ELSE
                        MaxValue := MaxValue;
                UNTIL PurchInvL.NEXT = 0;

                /*PurchInvL.SETRANGE(PurchInvL."BED Amount", MaxValue);
                if PurchInvL.FIND('-') then
                 ItmNo := PurchInvL."No.";
                 Desc := PurchInvL.Description;
                 Qty := PurchInvL.Quantity;
                */
                //Itm.RESET;
                //Itm.SETRANGE(Itm."No.",ItmNo);
                //Itm.FIND('-');
                // Subheading := Itm."Excise Prod. Posting Group";

                Vend.RESET;
                Vend.SETRANGE(Vend."No.", VendorNo);
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


                PurchInvH.RESET;
                PurchRcptH.SETRANGE(PurchRcptH."Order No.", OrdNo);
                PurchRcptH.FIND('-');
                GRDt := PurchRcptH."Posting Date";

            end;

            trigger OnPreDataItem();
            begin
                previousno := '';
                SETRANGE("Posting Date", StartDt, EndDt);
            end;
        }
        dataitem(RG2CHdr; "Integer")
        {
            DataItemTableView = SORTING(Number);
            MaxIteration = 1;
            column(Qty_Caption_Control1000000043; Qty_Caption_Control1000000043Lbl)
            {
            }
            column(SubheadingCaption_Control1000000042; SubheadingCaption_Control1000000042Lbl)
            {
            }
            column(DescriptionCaption_Control1000000041; DescriptionCaption_Control1000000041Lbl)
            {
            }
            column(OtherCaption_Control1000000085; OtherCaption_Control1000000085Lbl)
            {
            }
            column(Addl__DutyCaption; Addl__DutyCaptionLbl)
            {
            }
            column(For_the_main_item_in_the_documentCaption_Control1000000033; For_the_main_item_in_the_documentCaption_Control1000000033Lbl)
            {
            }
            column(SEDCaption_Control1000000072; SEDCaption_Control1000000072Lbl)
            {
            }
            column(AEDCaption_Control1000000070; AEDCaption_Control1000000070Lbl)
            {
            }
            column(CENVATCaption_Control1000000068; CENVATCaption_Control1000000068Lbl)
            {
            }
            column(ValueCaption_Control1000000078; ValueCaption_Control1000000078Lbl)
            {
            }
            column(Deatils_of_credit_takenCaption; Deatils_of_credit_takenCaptionLbl)
            {
            }
            column(Date_on_which_capital_goods_receivedCaption; Date_on_which_capital_goods_receivedCaptionLbl)
            {
            }
            column(ECC_No__of_the_supplierCaption; ECC_No__of_the_supplierCaptionLbl)
            {
            }
            column(Type_of_supplierCaption_Control1000000031; Type_of_supplierCaption_Control1000000031Lbl)
            {
            }
            column(Name_of_the_supplierCaption_Control1000000082; Name_of_the_supplierCaption_Control1000000082Lbl)
            {
            }
            column(Date_of_docu__mentCaption; Date_of_docu__mentCaptionLbl)
            {
            }
            column(Number_of_DocumentCaption_Control1000000076; Number_of_DocumentCaption_Control1000000076Lbl)
            {
            }
            column(Type_of_docu__mentCaption_Control1000000080; Type_of_docu__mentCaption_Control1000000080Lbl)
            {
            }
            column(CAPITAL_GOODSCaption; CAPITAL_GOODSCaptionLbl)
            {
            }
            column(Sl__No_Caption_Control1000000062; Sl__No_Caption_Control1000000062Lbl)
            {
            }
            column(RG2CHdr_Number; Number)
            {
            }
        }
        dataitem("RG 23 C Part II"; "RG 23 C Part II")
        {
            DataItemTableView = SORTING(Type) WHERE(Type = CONST(Purchase));
            column(RG_23_C_Part_II__Entry_No__; "Entry No.")
            {
            }
            column(RG_23_C_Part_II__Document_Date_; "Document Date")
            {
            }
            column(RG_23_C_Part_II__Document_No__; "Document No.")
            {
            }
            column(VendorName_Control1000000083; VendorName)
            {
            }
            column(RG_23_C_Part_II__BED_Credit_; "BED Credit")
            {
            }
            column(RG_23_C_Part_II__AED_GSI__Credit_; "AED(GSI) Credit")
            {
            }
            column(RG_23_C_Part_II__SED_Credit_; "SED Credit")
            {
            }
            column(RG_23_C_Part_II__SAED_Credit_; "SAED Credit")
            {
            }
            column(NCCD_Credit_____eCess_Credit_; "NCCD Credit" + "eCess Credit")
            {
            }
            column(GRDt_Control1000000120; GRDt)
            {
            }
            column(VendorType_Control1000000032; VendorType)
            {
            }
            column(Vend__E_C_C__No___Control1000000065; Vend."E.C.C. No.")
            {
            }
            column(Desc_Control1000000044; Desc)
            {
            }
            column(Subheading_Control1000000045; Subheading)
            {
            }
            column(Qty_Control1000000046; Qty)
            {
            }
            column(Amt_Control1000000048; Amt)
            {
            }
            column(InvoiceCaption_Control1000000081; InvoiceCaption_Control1000000081Lbl)
            {
            }

            trigger OnAfterGetRecord();
            begin
                PurchInvH.RESET;
                PurchInvH.SETRANGE(PurchInvH."No.", "RG 23 C Part II"."Document No.");
                PurchInvH.FIND('-');
                VendorNo := PurchInvH."Buy-from Vendor No.";
                OrdNo := PurchInvH."Order No.";


                Amt := 0.0;
                PurchInvL.RESET;
                PurchInvL.SETRANGE(PurchInvL."Document No.", "RG 23 C Part II"."Document No.");
                PurchInvL.FIND('-');
                REPEAT
                    Amt := Amt + PurchInvL."Excise Base Amount";
                UNTIL PurchInvL.NEXT = 0;

                MaxValue := 0;
                PurchInvL.RESET;
                PurchInvL.SETRANGE(PurchInvL."Document No.", "RG 23 C Part II"."Document No.");
                PurchInvL.SETRANGE(PurchInvL.Type, 2, 4);
                PurchInvL.FIND('-');
                REPEAT
                    IF MaxValue < PurchInvL."BED Amount" THEN
                        MaxValue := PurchInvL."BED Amount"
                    ELSE
                        MaxValue := MaxValue;
                UNTIL PurchInvL.NEXT = 0;

                PurchInvL.SETRANGE(PurchInvL."BED Amount", MaxValue);
                PurchInvL.FIND('-');
                ItmNo := PurchInvL."No.";
                Desc := PurchInvL.Description;
                Qty := PurchInvL.Quantity;

                FixAsset.RESET;
                FixAsset.SETRANGE(FixAsset."No.", ItmNo);
                FixAsset.FIND('-');
                Subheading := FixAsset."Excise Prod. Posting Group";

                Vend.RESET;
                Vend.SETRANGE(Vend."No.", VendorNo);
                Vend.FIND('-');
                VendorName := Vend.Name;
                VendType := Vend."Vendor Type";

                IF VendType = 0 THEN
                    VendorType := '';
                IF VendType = 1 THEN
                    VendorType := 'Dealer';
                IF VendType = 2 THEN
                    VendorType := 'Manufacturer';
                VendType := Vend."Vendor Type";

                PurchInvH.RESET;
                PurchRcptH.SETRANGE(PurchRcptH."Order No.", OrdNo);
                PurchRcptH.FIND('-');
                GRDt := PurchRcptH."Posting Date";
            end;

            trigger OnPreDataItem();
            begin
                SETRANGE("Posting Date", StartDt, EndDt);
                SETRANGE("Balance Updated", FALSE);
            end;
        }
        dataitem("Integer"; "Integer")
        {
            DataItemTableView = SORTING(Number);
            MaxIteration = 1;
            column(OpenCenvatIN; OpenCenvatIN)
            {
            }
            column(CrCenvatTakeIN; CrCenvatTakeIN)
            {
            }
            column(CrSEDTakeIN; CrSEDTakeIN)
            {
            }
            column(OpenSEDIN; OpenSEDIN)
            {
            }
            column(CrAEDTakeIN; CrAEDTakeIN)
            {
            }
            column(OpenAEDIN; OpenAEDIN)
            {
            }
            column(CrCenvatUsedIN; CrCenvatUsedIN)
            {
            }
            column(CrSEDUsedIN; CrSEDUsedIN)
            {
            }
            column(CrAEDUsedIN; CrAEDUsedIN)
            {
            }
            column(CrADDUsedIN; CrADDUsedIN)
            {
            }
            column(CrADDTakeIN; CrADDTakeIN)
            {
            }
            column(OpenADDIN; OpenADDIN)
            {
            }
            column(CrOTHUsedIN; CrOTHUsedIN)
            {
            }
            column(CrOTHTakeIN; CrOTHTakeIN)
            {
            }
            column(OpenOTHIN; OpenOTHIN)
            {
            }
            column(CloseCenvatIN; CloseCenvatIN)
            {
            }
            column(CloseSEDIN; CloseSEDIN)
            {
            }
            column(CloseAEDIN; CloseAEDIN)
            {
            }
            column(CloseADDIN; CloseADDIN)
            {
            }
            column(CloseOTHIN; CloseOTHIN)
            {
            }
            column(OpenCenvatCG; OpenCenvatCG)
            {
            }
            column(CrCenvatTakeCG; CrCenvatTakeCG)
            {
            }
            column(CrCenvatUsedCG; CrCenvatUsedCG)
            {
            }
            column(CloseCenvatCG; CloseCenvatCG)
            {
            }
            column(OpenSEDCG; OpenSEDCG)
            {
            }
            column(CrSEDTakeCG; CrSEDTakeCG)
            {
            }
            column(CrSEDUsedCG; CrSEDUsedCG)
            {
            }
            column(CloseSEDCG; CloseSEDCG)
            {
            }
            column(OpenAEDCG; OpenAEDCG)
            {
            }
            column(CrAEDTakeCG; CrAEDTakeCG)
            {
            }
            column(CrAEDUsedCG; CrAEDUsedCG)
            {
            }
            column(CloseAEDCG; CloseAEDCG)
            {
            }
            column(OpenADDCG; OpenADDCG)
            {
            }
            column(CrADDTakeCG; CrADDTakeCG)
            {
            }
            column(CrADDUsedCG; CrADDUsedCG)
            {
            }
            column(CloseADDCG; CloseADDCG)
            {
            }
            column(OpenOTHCG; OpenOTHCG)
            {
            }
            column(CrOTHTakeCG; CrOTHTakeCG)
            {
            }
            column(CrOTHUsedCG; CrOTHUsedCG)
            {
            }
            column(CloseOTHCG; CloseOTHCG)
            {
            }
            column(A____INPUT_CREDITCaption; A____INPUT_CREDITCaptionLbl)
            {
            }
            column(Opening_BalanceCaption; Opening_BalanceCaptionLbl)
            {
            }
            column(CENVATCaption_Control1000000143; CENVATCaption_Control1000000143Lbl)
            {
            }
            column(Credit_taken_during_the_monthCaption; Credit_taken_during_the_monthCaptionLbl)
            {
            }
            column(SEDCaption_Control1000000148; SEDCaption_Control1000000148Lbl)
            {
            }
            column(AEDCaption_Control1000000151; AEDCaption_Control1000000151Lbl)
            {
            }
            column(Credit_utilized_during_the_monthCaption; Credit_utilized_during_the_monthCaptionLbl)
            {
            }
            column(ADDL__DUTYCaption_Control1000000159; ADDL__DUTYCaption_Control1000000159Lbl)
            {
            }
            column(OTHER_pl__specify_Caption; OTHER_pl__specify_CaptionLbl)
            {
            }
            column(Closing_balanceCaption; Closing_balanceCaptionLbl)
            {
            }
            column(B___CAPITAL_GOODS_CREDITCaption; B___CAPITAL_GOODS_CREDITCaptionLbl)
            {
            }
            column(Opening_BalanceCaption_Control1000000172; Opening_BalanceCaption_Control1000000172Lbl)
            {
            }
            column(Credit_taken_during_the_monthCaption_Control1000000173; Credit_taken_during_the_monthCaption_Control1000000173Lbl)
            {
            }
            column(Credit_utilized_during_the_monthCaption_Control1000000174; Credit_utilized_during_the_monthCaption_Control1000000174Lbl)
            {
            }
            column(Closing_balanceCaption_Control1000000175; Closing_balanceCaption_Control1000000175Lbl)
            {
            }
            column(CENVATCaption_Control1000000176; CENVATCaption_Control1000000176Lbl)
            {
            }
            column(SEDCaption_Control1000000181; SEDCaption_Control1000000181Lbl)
            {
            }
            column(AEDCaption_Control1000000186; AEDCaption_Control1000000186Lbl)
            {
            }
            column(ADDL__DUTYCaption_Control1000000191; ADDL__DUTYCaption_Control1000000191Lbl)
            {
            }
            column(OTHER_pl__specify_Caption_Control1000000196; OTHER_pl__specify_Caption_Control1000000196Lbl)
            {
            }
            column(Place__Caption; Place__CaptionLbl)
            {
            }
            column(Date__Caption; Date__CaptionLbl)
            {
            }
            column(Signature_of_the_assessee_or_the_authorised_signatoryCaption; Signature_of_the_assessee_or_the_authorised_signatoryCaptionLbl)
            {
            }
            column(Name_in_capital_lettersCaption; Name_in_capital_lettersCaptionLbl)
            {
            }
            column(Seal_of_the_assesseeCaption; Seal_of_the_assesseeCaptionLbl)
            {
            }
            column(DesignationCaption; DesignationCaptionLbl)
            {
            }
            column(ABSTRACTCaption; ABSTRACTCaptionLbl)
            {
            }
            column(Integer_Number; Number)
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

    trigger OnPostReport();
    begin
        IF Excel THEN BEGIN
            /*
          TempExcelbuffer.CreateBook('','');//B2B //EFFUPG
          //TempExcelbuffer.CreateSheet('Total Sale orders','',COMPANYNAME,'');//B2B
          TempExcelbuffer.GiveUserControl;
          */
            TempExcelbuffer.CreateBookAndOpenExcel('', 'Total Sale Orders', 'Total Sale Orders', COMPANYNAME, USERID); //EFFUPG
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
        PurchInvL: Record "Purch. Rcpt. Line";
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
        invoiceno: Code[10];
        Dummyrg23: Record "RG 23 A Part II";
        dummybed: Decimal;
        previousno: Text[10];
        dummycess: Decimal;
        TempExcelbuffer: Record "Excel Buffer";
        Row: Integer;
        Excel: Boolean;
        i: Integer;
        ANNEXURE_10CaptionLbl: Label 'ANNEXURE-10';
        See_sub_rule_5__of_rule_7_CaptionLbl: Label '[See sub-rule(5) of rule 7]';
        Monthly_Return_under_Rule_7_of_the_Cenvat_Credit_Rules_2002CaptionLbl: Label 'Monthly Return under Rule 7 of the Cenvat Credit Rules,2002';
        INPUTSCaptionLbl: Label 'INPUTS';
        Qty_CaptionLbl: Label 'Qty.';
        SubheadingCaptionLbl: Label 'Subheading';
        DescriptionCaptionLbl: Label 'Description';
        OtherCaptionLbl: Label 'Other';
        For_the_main_item_in_the_documentCaptionLbl: Label 'For the main item in the document';
        Addl___DutyCaptionLbl: Label 'Addl.  Duty';
        SEDCaptionLbl: Label 'SED';
        AEDCaptionLbl: Label 'AED';
        Details_of_credit_takenCaptionLbl: Label 'Details of credit taken';
        CENVATCaptionLbl: Label 'CENVAT';
        ValueCaptionLbl: Label 'Value';
        Date_on_which_inputs_receivedCaptionLbl: Label 'Date on which inputs received';
        ECC_number_of_the_supplierCaptionLbl: Label 'ECC number of the supplier';
        Type_of_supplierCaptionLbl: Label 'Type of supplier';
        Name_of_the_supplierCaptionLbl: Label 'Name of the supplier';
        Date_of_documentCaptionLbl: Label 'Date of document';
        Number_of_DocumentCaptionLbl: Label 'Number of Document';
        Type_of_docu__mentCaptionLbl: Label 'Type of docu- ment';
        Sl__No_CaptionLbl: Label 'Sl. No.';
        InvoiceCaptionLbl: Label 'Invoice';
        Qty_Caption_Control1000000043Lbl: Label 'Qty.';
        SubheadingCaption_Control1000000042Lbl: Label 'Subheading';
        DescriptionCaption_Control1000000041Lbl: Label 'Description';
        OtherCaption_Control1000000085Lbl: Label 'Other';
        Addl__DutyCaptionLbl: Label 'Addl. Duty';
        For_the_main_item_in_the_documentCaption_Control1000000033Lbl: Label 'For the main item in the document';
        SEDCaption_Control1000000072Lbl: Label 'SED';
        AEDCaption_Control1000000070Lbl: Label 'AED';
        CENVATCaption_Control1000000068Lbl: Label 'CENVAT';
        ValueCaption_Control1000000078Lbl: Label 'Value';
        Deatils_of_credit_takenCaptionLbl: Label 'Deatils of credit taken';
        Date_on_which_capital_goods_receivedCaptionLbl: Label 'Date on which capital goods received';
        ECC_No__of_the_supplierCaptionLbl: Label 'ECC No. of the supplier';
        Type_of_supplierCaption_Control1000000031Lbl: Label 'Type of supplier';
        Name_of_the_supplierCaption_Control1000000082Lbl: Label 'Name of the supplier';
        Date_of_docu__mentCaptionLbl: Label 'Date of docu- ment';
        Number_of_DocumentCaption_Control1000000076Lbl: Label 'Number of Document';
        Type_of_docu__mentCaption_Control1000000080Lbl: Label 'Type of docu- ment';
        CAPITAL_GOODSCaptionLbl: Label 'CAPITAL GOODS';
        Sl__No_Caption_Control1000000062Lbl: Label 'Sl. No.';
        InvoiceCaption_Control1000000081Lbl: Label 'Invoice';
        A____INPUT_CREDITCaptionLbl: Label 'A.   INPUT CREDIT';
        Opening_BalanceCaptionLbl: Label 'Opening Balance';
        CENVATCaption_Control1000000143Lbl: Label 'CENVAT';
        Credit_taken_during_the_monthCaptionLbl: Label 'Credit taken during the month';
        SEDCaption_Control1000000148Lbl: Label 'SED';
        AEDCaption_Control1000000151Lbl: Label 'AED';
        Credit_utilized_during_the_monthCaptionLbl: Label 'Credit utilized during the month';
        ADDL__DUTYCaption_Control1000000159Lbl: Label 'ADDL. DUTY';
        OTHER_pl__specify_CaptionLbl: Label 'OTHER(pl. specify)';
        Closing_balanceCaptionLbl: Label 'Closing balance';
        B___CAPITAL_GOODS_CREDITCaptionLbl: Label 'B.  CAPITAL GOODS CREDIT';
        Opening_BalanceCaption_Control1000000172Lbl: Label 'Opening Balance';
        Credit_taken_during_the_monthCaption_Control1000000173Lbl: Label 'Credit taken during the month';
        Credit_utilized_during_the_monthCaption_Control1000000174Lbl: Label 'Credit utilized during the month';
        Closing_balanceCaption_Control1000000175Lbl: Label 'Closing balance';
        CENVATCaption_Control1000000176Lbl: Label 'CENVAT';
        SEDCaption_Control1000000181Lbl: Label 'SED';
        AEDCaption_Control1000000186Lbl: Label 'AED';
        ADDL__DUTYCaption_Control1000000191Lbl: Label 'ADDL. DUTY';
        OTHER_pl__specify_Caption_Control1000000196Lbl: Label 'OTHER(pl. specify)';
        Place__CaptionLbl: Label 'Place :';
        Date__CaptionLbl: Label 'Date :';
        Signature_of_the_assessee_or_the_authorised_signatoryCaptionLbl: Label 'Signature of the assessee or the authorised signatory';
        Name_in_capital_lettersCaptionLbl: Label 'Name in capital letters';
        Seal_of_the_assesseeCaptionLbl: Label 'Seal of the assessee';
        DesignationCaptionLbl: Label 'Designation';
        ABSTRACTCaptionLbl: Label 'ABSTRACT';

    (7203)]
    procedure Entercell(RowNo: Integer; ColumnNo: Integer; CellValue: Text[1000]; bold: Boolean);
    begin

        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.", RowNo);
        TempExcelbuffer.VALIDATE("Column No.", ColumnNo);
        TempExcelbuffer."Cell Value as Text" := CellValue;
        TempExcelbuffer.Bold := bold;

        TempExcelbuffer.INSERT;
    end;

    (7213)]
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

