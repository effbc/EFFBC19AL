report 50148 "Group of Vouchers print"
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
    RDLCLayout = './Group of Vouchers print.rdlc';


    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            DataItemTableView = SORTING(Entry No.) ORDER(Ascending) WHERE(Check = CONST(Yes));
            RequestFilterFields = "Document No.", "Payment Type";
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
            column(FORMAT__Posting_Date__0_7_; FORMAT("Posting Date", 0, 7))
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
            column(cap1_____AccountName; cap1 + ' ' + AccountName)
            {
            }
            column(accdesc; accdesc)
            {
            }
            column(cap1_____AccountName_Control1102154019; cap1 + ' ' + AccountName)
            {
            }
            column(G_L_Entry___Credit_Amount___G_L_Entry___Debit_Amount_; "G/L Entry"."Credit Amount" + "G/L Entry"."Debit Amount")
            {
            }
            column(cap1_____AccountName_Control1102154002; cap1 + ' ' + AccountName)
            {
            }
            column(G_L_Entry___Credit_Amount___G_L_Entry___Debit_Amount__Control1102154004; "G/L Entry"."Credit Amount" + "G/L Entry"."Debit Amount")
            {
            }
            column(chetext________accdesc; chetext + '    ' + accdesc)
            {
            }
            column(NumberText_2_; NumberText[2])
            {
            }
            column(NumberText_1_; NumberText[1])
            {
            }
            column(chetext________accdesc_Control1102154026; chetext + '    ' + accdesc)
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
            column(accdesc_Control1280021; accdesc)
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

            trigger OnAfterGetRecord();
            begin
                cap1 := '';
                "G/L Account".RESET;

                /*GLdebit:=0;
                GLcredit:=0;
                GLdesc:='';
                GLdebitac:='';
                GLcreditac:='';  */

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
                    cap1 := 'SAL-ADV';
                IF ("G/L Entry"."G/L Account No." = '24000') THEN
                    cap1 := 'TA';
                IF ("G/L Entry"."G/L Account No." = '24300') THEN
                    cap1 := 'ADV-EXP';
                IF ("G/L Entry"."G/L Account No." = '24600') THEN
                    cap1 := 'ADV-PUR';
                IF ("G/L Entry"."G/L Account No." = '37200') THEN
                    cap1 := 'SAL-DEP';
                IF ("G/L Entry"."G/L Account No." = '25700') THEN
                    cap1 := 'SD-';


                "G/L Account".RESET;
                "G/L Account".SETRANGE("No.", "Bal. Account No.");
                IF "G/L Account".FIND('-') THEN
                    BalAccountName := "G/L Account".Name;

                IF ("G/L Entry"."G/L Account No." = '41000') OR ("G/L Entry"."G/L Account No." = '36200') OR ("G/L Entry"."G/L Account No." = '36300') THEN BEGIN
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
                acno := "G/L Entry"."G/L Account No.";
                IF (acno = '24200') OR (acno = '24000') OR (acno = '24100') OR (acno = '24300') OR (acno = '37200') OR (acno = '25700') OR (acno = '34200') THEN BEGIN
                    //DIM1.0 Start
                    //Code Commented
                    /*
                    LED.SETRANGE(LED."Entry No.","G/L Entry"."Entry No.");
                    IF LED.FIND('-') THEN
                    REPEAT
                    accode:=LED."Dimension Value Code";
                    DVL.SETRANGE(DVL.Code,accode);
                    IF DVL.FIND('-') THEN
                    AccountName:=DVL.Name;
                    UNTIL LED.NEXT=0;
                    */
                    DimSetEntryGRec.RESET;
                    DimSetEntryGRec.SETRANGE("Dimension Set ID", "Dimension Set ID");
                    IF DimSetEntryGRec.FINDSET THEN
                        REPEAT
                            accode := DimSetEntryGRec."Dimension Value Code";
                            AccountName := DimSetEntryGRec."Dimension Value Name";
                        UNTIL DimSetEntryGRec.NEXT = 0;
                    //DIM1.0 End


                END;
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
                /*IF "G/L Entry"."Document No."<>prevdocno THEN
                BEGIN
                GL.SETCURRENTKEY(GL."Entry No.");
                GL.SETRANGE(GL."Document No.","G/L Entry"."Document No.");
                GL.SETRANGE(GL."Posting Date","G/L Entry"."Posting Date");
                GL.SETRANGE(GL."Payment Type","G/L Entry"."Payment Type");
                IF GL.FIND('-') THEN
                REPEAT
                IF GL."Debit Amount"<>0 THEN
                GLdebitac:=GL."G/L Account No.";
                glac.SETRANGE(glac."No.",GLdebitac);
                IF glac.FIND('-') THEN
                GLdebitacname:=glac.Name;
                GLdebit+=GL."Debit Amount";
                IF GL."Credit Amount"<>0 THEN
                GLcreditac:=GL."G/L Account No.";
                glac.RESET;
                glac.SETRANGE(glac."No.",GLcreditac);
                IF glac.FIND('-') THEN
                GLcreditacname:=glac.Name;
                GLcredit+=GL."Credit Amount";
                GLdesc:=FORMAT(GL.Description);
                prevdocno:=GL."Document No.";
                UNTIL GL.NEXT=0;
                END;       */
                i := i + 1;

            end;

            trigger OnPreDataItem();
            begin
                prevdocno := '';
                CompanyInformation.FIND('-');
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
        GLtest.SETFILTER(GLtest.Check, 'Yes');
        IF GLtest.FIND('-') THEN
            REPEAT
                GLtest.Check := FALSE;
            UNTIL GLtest.NEXT = 0;
        GLtest.MODIFY;
    end;

    var
        "G/L Account": Record "G/L Account";
        CompanyInformation: Record "Company Information";
        AccountName: Text[100];
        BalAccountName: Text[30];
        NumberText: array[2] of Text[80];
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
        cap1: Text[8];
        captype: Text[30];
        textcap: Text[30];
        chetext: Text[30];
        potext: Text[100];
        CLE: Record "Cust. Ledger Entry";
        GL: Record "G/L Entry";
        GLdebit: Decimal;
        GLcredit: Decimal;
        GLdesc: Text[200];
        GLdebitac: Text[10];
        GLcreditac: Text[10];
        i: Integer;
        glac: Record "G/L Account";
        GLdebitacname: Text[50];
        GLcreditacname: Text[50];
        singleline: Boolean;
        prevdocno: Code[30];
        accdesc: Text[300];
        GLtest: Record "G/L Entry";
        Dated_____CaptionLbl: Label 'Dated    :';
        Credit_CaptionLbl: Label '"Credit "';
        Debit_CaptionLbl: Label '"Debit "';
        ParticularsCaptionLbl: Label 'Particulars';
        VoucherCaptionLbl: Label 'Voucher';
        Dated_____Caption_Control1102154003Lbl: Label 'Dated    :';
        AmountCaptionLbl: Label 'Amount';
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

    [LineStart(8050)]
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

    [LineStart(8126)]
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

    [LineStart(8162)]
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

