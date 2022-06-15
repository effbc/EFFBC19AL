page 60095 "FDR Card"
{
    // version B2B1.0,DIM1.0,Rev01

    // PROJECT : Efftronics
    // *********************************************************************
    // SIGN
    // *********************************************************************
    // B2B     : B2B Softwarre Technologies
    // *********************************************************************
    // VER      SIGN      USERID          DATE          DESCRIPTION
    // *********************************************************************
    // 1.0       B2B    PallaJagadeesh    11-May-13     ->Code in OnAfterGetRecord() and added the functions(from "NoOnBeforeInput"
    //                                                    to "ReceiptAccountNoOnBeforeInput") to convey the OnBeforeInput()
    //                                                    trigger in Pages.

    PageType = Card;
    SourceTable = "FDR Master";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                }
                field("FDR Document No."; "FDR Document No.")
                {
                }
                field("Mode of Payment"; "Mode of Payment")
                {
                }
                field("Payment Account No."; "Payment Account No.")
                {
                }
                field(Description; Description)
                {
                }
                field("Issuing Bank"; "Issuing Bank")
                {
                }
                field("Date of Issue"; "Date of Issue")
                {
                }
                field("Expiry Date"; "Expiry Date")
                {
                }
                field("FDR Value"; "FDR Value")
                {
                }
                field("Mode of Receipt"; "Mode of Receipt")
                {
                }
                field("Receipt Account No."; "Receipt Account No.")
                {
                }
                field("FDR Posting Status"; "FDR Posting Status")
                {
                }
                field(Purpose; Purpose)
                {
                }
                field(Remarks; Remarks)
                {
                }
                field(Status; Status)
                {
                }
                field("Creation Date"; "Creation Date")
                {
                }
                field("Last Modified Date"; "Last Modified Date")
                {
                }
                field(Extended; Extended)
                {
                }
                field("FDR Surrended Date"; "FDR Surrended Date")
                {
                }
                field(Closed; Closed)
                {
                }
                field("Issued/Received"; "Issued/Received")
                {
                }
                field("Posting Account No."; "Posting Account No.")
                {
                }
                field("Tender No."; "Tender No.")
                {
                    Caption = 'Linked to Tender.';
                    Editable = false;
                }
                field("Customer Order No."; "Customer Order No.")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("&Attachments")
                {
                    Caption = '&Attachments';
                    Image = Attachments;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        FDRAttachments;
                    end;
                }
                separator(Action1102152059)
                {
                }
                action("FDR Re&lease")
                {
                    Caption = 'FDR Re&lease';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction();
                    begin
                        IF Status = Status::Released THEN
                            EXIT;
                        TESTFIELD("No.");
                        TESTFIELD("Issuing Bank");
                        TESTFIELD("FDR Value");
                        TESTFIELD("Payment Account No.");
                        IF CONFIRM('Do you want to Release?') THEN BEGIN
                            Status := Status::Released;
                            MESSAGE('The FDR has been Released.')
                        END ELSE
                            EXIT;
                        CurrPage.UPDATE;
                    end;
                }
                action("FDR Re&open")
                {
                    Caption = 'FDR Re&open';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        IF Status = Status::Open THEN
                            EXIT;
                        IF Status <> Status::"2" THEN
                            IF CONFIRM('Do you want to Reopen?') THEN
                                Status := Status::Open
                            ELSE
                                EXIT
                        ELSE
                            ERROR('You can not open the Closed FDR');
                        CurrPage.UPDATE;
                    end;
                }
                action("&Close FDR")
                {
                    Caption = '&Close FDR';
                    Image = Close;

                    trigger OnAction();
                    begin
                        IF Closed = TRUE THEN
                            EXIT;
                        TESTFIELD(Status, Status::Released);
                        IF CONFIRM('Do you want to close FDR?') THEN BEGIN
                            MESSAGE('The FDR has been closed.');
                            Closed := TRUE;
                        END ELSE
                            EXIT;
                        CurrPage.UPDATE;
                    end;
                }
                separator(Action1102152050)
                {
                }
                group(Post)
                {
                    Caption = 'Post';
                    Image = Post;
                    action(Purchase)
                    {
                        Caption = 'Purchase';
                        Image = Purchase;

                        trigger OnAction();
                        begin
                            IF NOT CONFIRM(Text001, FALSE, "No.") THEN
                                EXIT;

                            TESTFIELD("Posting Account No.");
                            TESTFIELD("No.");
                            TESTFIELD("FDR Value");
                            TESTFIELD(Status, Status::Released);
                            TESTFIELD(Posted, FALSE);
                            IF "Mode of Payment" = "Mode of Payment"::Cash THEN BEGIN
                                "AccountNo." := "Posting Account No.";
                                AccountType := AccountType::"G/L Account";
                                "BalAccountNo." := "Payment Account No.";
                                BalAccountType := BalAccountType::"G/L Account";
                                Amount := "FDR Value";
                                InitGenJnlLine(Rec, "AccountNo.", "BalAccountNo.", AccountType, BalAccountType, Amount);
                                Posted := TRUE;
                                MODIFY;
                            END ELSE
                                IF "Mode of Payment" = "Mode of Payment"::Bank THEN BEGIN
                                    "AccountNo." := "Posting Account No.";
                                    AccountType := AccountType::"G/L Account";
                                    "BalAccountNo." := "Payment Account No.";
                                    BalAccountType := BalAccountType::"Bank Account";
                                    Amount := "FDR Value";
                                    InitGenJnlLine(Rec, "AccountNo.", "BalAccountNo.", AccountType, BalAccountType, Amount);
                                    Posted := TRUE;
                                    MODIFY;
                                END;
                            "FDR Posting Status" := "FDR Posting Status"::Purchased;
                            MODIFY;
                            MESSAGE(Text002, "No.");
                        end;
                    }
                    action(Receipt)
                    {
                        Caption = 'Receipt';
                        Image = Receipt;

                        trigger OnAction();
                        begin
                            IF NOT CONFIRM(Text003, FALSE, "No.") THEN
                                EXIT;

                            TESTFIELD("Receipt Account No.");
                            TESTFIELD("No.");
                            TESTFIELD("FDR Value");
                            TESTFIELD(Status, Status::Released);
                            TESTFIELD(Posted, TRUE);
                            TESTFIELD("Issued/Received", "Issued/Received"::Received);
                            IF "Mode of Receipt" = "Mode of Receipt"::Cash THEN BEGIN
                                "AccountNo." := "Posting Account No.";
                                AccountType := AccountType::"G/L Account";
                                "BalAccountNo." := "Receipt Account No.";
                                BalAccountType := BalAccountType::"G/L Account";
                                Amount := -"FDR Value";
                                InitGenJnlLine(Rec, "AccountNo.", "BalAccountNo.", AccountType, BalAccountType, Amount);
                                Posted := FALSE;
                                MODIFY;
                            END ELSE
                                IF "Mode of Receipt" = "Mode of Receipt"::Bank THEN BEGIN
                                    "AccountNo." := "Posting Account No.";
                                    AccountType := AccountType::"G/L Account";
                                    "BalAccountNo." := "Receipt Account No.";
                                    BalAccountType := BalAccountType::"Bank Account";
                                    Amount := -"FDR Value";
                                    InitGenJnlLine(Rec, "AccountNo.", "BalAccountNo.", AccountType, BalAccountType, Amount);
                                    Posted := FALSE;
                                    MODIFY;
                                END;
                            "FDR Posting Status" := "FDR Posting Status"::Surrendered;
                            "FDR Surrended Date" := WORKDATE;
                            MODIFY;
                            MESSAGE(Text002, "No.");
                        end;
                    }
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        //B2b1.0>>
        NoOnBeforeInput;
        FDRDocumentNoOnBeforeInput;
        ModeofPaymentOnBeforeInput;
        DescriptionOnBeforeInput;
        IssuingBankOnBeforeInput;
        DateofIssueOnBeforeInput;
        ExpiryDateOnBeforeInput;
        FDRValueOnBeforeInput;
        RemarksOnBeforeInput;
        ExtendedOnBeforeInput;
        PaymentAccountNoOnBeforeInput;
        PostingAccountNoOnBeforeInput;
        ModeofReceiptOnBeforeInput;
        ReceiptAccountNoOnBeforeInput;
        //B2b1.0<<
    end;

    var
        "AccountNo.": Code[20];
        "BalAccountNo.": Code[20];
        AccountType: Option "G/L Account","Bank Account";
        BalAccountType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset";
        Amount: Decimal;
        GenJnlLine: Record "Gen. Journal Line";
        GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
        Text001: Label 'Do you want to Purchase the FDR No. %1?';
        Text002: Label 'FDR No. %1 Posted Successfully.';
        Text003: Label 'Do you want to Receive the FDR No. %1?';
        Text004: Label 'FDR No. %1 Posted Successfully.';
        [InDataSet]
        NoHideValue: Boolean;
        [InDataSet]
        FDRDocNoHidevalue: Boolean;
        [InDataSet]
        ModeofPayment: Boolean;
        [InDataSet]
        DescriptionHideValue: Boolean;
        [InDataSet]
        IssuingBankHideValue: Boolean;
        [InDataSet]
        DateofIssueHideValue: Boolean;
        [InDataSet]
        ExpiryDateHideValue: Boolean;
        [InDataSet]
        FDRHideValue: Boolean;
        [InDataSet]
        RemarksHideValue: Boolean;
        [InDataSet]
        ExtendedHideValue: Boolean;
        [InDataSet]
        PaymentAccNoHideValue: Boolean;
        [InDataSet]
        PostingAccNoHideValue: Boolean;
        [InDataSet]
        ModeofReceiptHidevalue: Boolean;
        [InDataSet]
        ReceiptAccNoHidevalue: Boolean;

    (10725)]
    procedure InitGenJnlLine(var Rec: Record "FDR Master"; "AccountNo.": Code[20]; "BalAccountNo.": Code[20]; AccountType: Option "G/L Account","Bank Account"; BalAccountType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset"; Amount: Decimal);
    var
        DimMgt: Codeunit DimensionManagement;
        DimBufMgt: Codeunit "Dimension Buffer Management";
        PostingGroups: Record "Tender Posting Groups";
    begin
        GenJnlLine.INIT;
        GenJnlLine."Account Type" := AccountType;
        GenJnlLine."Account No." := "AccountNo.";
        GenJnlLine."Posting Date" := WORKDATE;
        GenJnlLine."Document No." := Rec."No.";
        GenJnlLine."Document Type" := GenJnlLine."Document Type"::Payment;
        GenJnlLine.Description := Rec.Description;
        GenJnlLine."Bal. Account No." := "BalAccountNo.";
        GenJnlLine."Bal. Account Type" := BalAccountType;
        GenJnlLine.Amount := Amount;
        GenJnlLine.VALIDATE(Amount);
        //GenJnlLine."Cheque No." := TenderPostingLine."Cheque No.";
        //GenJnlLine."Cheque Date" := TenderPostingLine."Cheque Date.";
        GenJnlLine."Source Code" := 'GENJNL';

        //DIM1.0 Start
        //Code Comment
        /*
        TempJnlLineDim.DELETEALL;
        TempDocDim.RESET;
        TempDocDim.SETRANGE("Table ID",DATABASE::"Tender Posting Lines");
        DimMgt.CopyDocDimToJnlLineDim(TempDocDim,TempJnlLineDim);
        GenJnlPostLine.RunWithCheck(GenJnlLine,TempJnlLineDim);
        */
        // Rev01 >>


        // Rev01 <<

        GenJnlPostLine.RunWithCheck(GenJnlLine);

        //DIM1.0 End;

    end;

    (10759)]
    local procedure NoOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            NoHideValue := FALSE
        ELSE
            NoHideValue := TRUE;

        /* CurrPage."No.".UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage."No.".UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    (10771)]
    local procedure FDRDocumentNoOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            FDRDocNoHidevalue := FALSE
        ELSE
            FDRDocNoHidevalue := TRUE;

        /* CurrPage."FDR Document No.".UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage."FDR Document No.".UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    (10783)]
    local procedure ModeofPaymentOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            ModeofPayment := FALSE
        ELSE
            ModeofPayment := TRUE;

        /* CurrPage."Mode of Payment".UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage."Mode of Payment".UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    (10795)]
    local procedure DescriptionOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            DescriptionHideValue := FALSE
        ELSE
            DescriptionHideValue := TRUE;

        /* CurrPage.Description.UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage.Description.UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    (10807)]
    local procedure IssuingBankOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            IssuingBankHideValue := FALSE
        ELSE
            IssuingBankHideValue := TRUE;

        /* CurrPage."Issuing Bank".UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage."Issuing Bank".UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    (10819)]
    local procedure DateofIssueOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            DateofIssueHideValue := FALSE
        ELSE
            DateofIssueHideValue := TRUE;

        /* CurrPage."Date of Issue".UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage."Date of Issue".UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    (10831)]
    local procedure ExpiryDateOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            ExpiryDateHideValue := FALSE
        ELSE
            ExpiryDateHideValue := TRUE;

        /* CurrPage."Expiry Date".UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage."Expiry Date".UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    (10843)]
    local procedure FDRValueOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            FDRHideValue := FALSE
        ELSE
            FDRHideValue := TRUE;

        /* CurrPage."FDR Value".UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage."FDR Value".UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    (10855)]
    local procedure RemarksOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            RemarksHideValue := FALSE
        ELSE
            RemarksHideValue := TRUE;

        /* CurrPage.Remarks.UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage.Remarks.UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    (10867)]
    local procedure ExtendedOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            ExtendedHideValue := FALSE
        ELSE
            ExtendedHideValue := TRUE;

        /* CurrPage.Extended.UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage.Extended.UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    (10879)]
    local procedure PaymentAccountNoOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            PaymentAccNoHideValue := FALSE
        ELSE
            PaymentAccNoHideValue := TRUE;

        /* CurrPage."Payment Account No.".UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage."Payment Account No.".UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    (10891)]
    local procedure PostingAccountNoOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            PostingAccNoHideValue := FALSE
        ELSE
            PostingAccNoHideValue := TRUE;

        /*  CurrPage."Posting Account No.".UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage."Posting Account No.".UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    (10903)]
    local procedure ModeofReceiptOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            ModeofReceiptHidevalue := FALSE
        ELSE
            ModeofReceiptHidevalue := TRUE;

        /* CurrPage."Mode of Receipt".UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage."Mode of Receipt".UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;

    (10915)]
    local procedure ReceiptAccountNoOnBeforeInput();
    begin
        IF Status = Status::Released THEN
            //B2b1.0>>
            ReceiptAccNoHidevalue := FALSE
        ELSE
            ReceiptAccNoHidevalue := TRUE;

        /* CurrPage."Receipt Account No.".UPDATEEDITABLE(FALSE)
        ELSE
          CurrPage."Receipt Account No.".UPDATEEDITABLE(TRUE)
        *///B2b1.0<<

    end;
}

