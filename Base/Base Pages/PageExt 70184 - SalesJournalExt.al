pageextension 70184 SalesJournalExt extends 253
{
    layout
    {
        /* modify(Control1)
        {
            ShowCaption = false;
        }
        modify(Control28)
        {
            ShowCaption = false;
        }
        modify(Control1902205001)
        {
            ShowCaption = false;
        } */
        modify("Debit Amount")
        {
            Visible = false;
        }
        modify("Credit Amount")
        {
            Visible = false;
        }
        modify("Shortcut Dimension 1 Code")
        {
            Visible = false;
        }
        modify("Applies-to Doc. Type")
        {
            Visible = false;
        }
        modify("Applies-to Doc. No.")
        {
            Visible = false;
        }
        addafter("Document No.")
        {
            field("Payment Type"; "Payment Type")
            {
                ApplicationArea = All;

                trigger OnValidate();
                begin
                    IF ("Payment Type" = "Payment Type"::Payment) OR ("Payment Type" = "Payment Type"::Receipt) OR
                       ("Payment Type" = "Payment Type"::Advance) THEN
                        "Cheque Date" := "Posting Date";
                end;
            }
            field("Sale Order No"; "Sale Order No")
            {
                ApplicationArea = All;

                trigger OnLookup(var Text: Text): Boolean;
                begin
                    Salinv.RESET;
                    IF PAGE.RUNMODAL(60219, Salinv) = ACTION::LookupOK THEN BEGIN
                        "Sale Order No" := Salinv."No.";
                        MODIFY;
                    END;
                end;
            }
            field("Final Bill Payment"; "Final Bill Payment")
            {
                ApplicationArea = All;
            }
            field("Sale invoice order no"; "Sale invoice order no")
            {
                Caption = 'Sale invoice no';
                Visible = false;
                ApplicationArea = All;

                trigger OnValidate();
                begin
                    "sales invoice header".RESET;
                    "sales invoice header".SETFILTER("sales invoice header"."No.", "Sale invoice order no");
                    IF "sales invoice header".FINDFIRST THEN BEGIN
                        "Customer Ord no" := "sales invoice header"."Customer OrderNo.";
                        "Sale Order No" := "sales invoice header"."Order No."
                    END;
                end;
            }
            field("Sale Invoice No"; "Sale Invoice No")
            {
                ApplicationArea = All;

                trigger OnValidate();
                begin
                    "sales invoice header".RESET;
                    "sales invoice header".SETFILTER("sales invoice header"."No.", "Sale Invoice No");
                    IF "sales invoice header".FINDFIRST THEN
                        "Invoice no" := "sales invoice header"."External Document No.";
                end;
            }
            field("Invoice no"; "Invoice no")
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("Customer Ord no"; "Customer Ord no")
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("Cheque No."; "Cheque No.")
            {
                ApplicationArea = All;
            }
            field("Cheque Date"; "Cheque Date")
            {
                ApplicationArea = All;
            }
        }
        addafter("Account No.")
        {
            field("Amount Percentage"; "Amount Percentage")
            {
                ApplicationArea = All;

                trigger OnValidate();
                begin
                    AmountPercentageOnAfterValidat;
                end;
            }
        }

        addbefore("Account Name")
        {
            field("GST on Advance Payment"; "GST on Advance Payment")
            {
                ApplicationArea = All;
            }
        }
        addafter("Total Balance")
        {
            group("Work Date")
            {
                Caption = 'Work Date';
                field(WorkDate; WORKDATE)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        modify(Dimensions)
        {
            Promoted = true;
        }
        modify(IncomingDoc)
        {
            Promoted = true;
        }
        modify("Ledger E&ntries")
        {
            Promoted = false;
        }
        modify("Apply Entries")
        {
            Promoted = true;
        }
        /* modify("Calculate GST")
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify("Update Reference Invoice No")
        {
            Promoted = true;
        } */
        modify(Post)
        {
            Promoted = true;
            PromotedIsBig = true;
            trigger OnBeforeAction()
            var
                JGE: Record "Gen. Journal Line";
                PrevDoc: Code[30];
                Temp_Jrnl_Line_Table: Record "Gen. Journal Line";
            begin
                GJL1.RESET;
                GJL1.DELETEALL;
                GJL1.RESET;
                FinalBill := FALSE;
                IF "Sale Order No" = '' THEN
                    ERROR('Please specify the Sale order no');
                SaleOrder := "Sale Order No";
                PostingDate := "Posting Date";
                // Added by Pranavi on 23-Jun-2016 for SD Status Tracking
                IF "Journal Batch Name" = 'BRV-SALES' THEN BEGIN
                    IF "Final Bill Payment" = FALSE THEN BEGIN
                        Selection := STRMENU(Text0001, 1);
                        CASE Selection OF
                            0:
                                EXIT;
                            2:
                                BEGIN
                                    "Final Bill Payment" := TRUE;
                                    MODIFY;
                                    FinalBill := TRUE;
                                END;
                        END
                    END;
                    GJL1.RESET;
                    /* IF "Payment Type" = "Payment Type"::Advance THEN  // added by pranavi on 09-09-2016 for adv payment entry to cf
                    BEGIN */
                    GJL.RESET;
                    GJL.SETRANGE(GJL."Journal Batch Name", "Journal Batch Name");
                    GJL.SETRANGE(GJL."Account Type", GJL."Account Type"::Customer);
                    IF GJL.FINDSET THEN BEGIN
                        IF GJL."Sale Order No" <> '' THEN BEGIN
                            GJL1 := GJL;
                            GJL1.INSERT;
                        END
                        ELSE
                            ERROR('Please specify the Sale order no');
                    END;
                    //END;
                END;
                // End by Pranavi
                //IF NOT(USERID IN['EFFTRONICS\PRANAVI']) THEN
                //BEGIN
                IF (FinalBill = TRUE) AND (SaleOrder <> '') THEN
                    SDStatusUpdate(SaleOrder, PostingDate);

                // >> Pranavi
                Temp_Jrnl_Line_Table.RESET;
                Temp_Jrnl_Line_Table.COPYFILTERS(Rec);
                IF Temp_Jrnl_Line_Table.FINDSET THEN
                    REPEAT
                        IF (Temp_Jrnl_Line_Table."Account Type" IN [Temp_Jrnl_Line_Table."Account Type"::Customer]) AND
                          (Temp_Jrnl_Line_Table."GST on Advance Payment") AND (Temp_Jrnl_Line_Table."Total GST Amount" <> 0) THEN BEGIN
                            IF PrevDoc <> Temp_Jrnl_Line_Table."Document No." THEN BEGIN
                                JGE.RESET;
                                JGE.SETRANGE("Journal Batch Name", Temp_Jrnl_Line_Table."Journal Batch Name");
                                JGE.SETRANGE("Journal Template Name", Temp_Jrnl_Line_Table."Journal Template Name");
                                JGE.SETRANGE("Document No.", Temp_Jrnl_Line_Table."Document No.");
                                IF JGE.FINDSET THEN BEGIN
                                    CLEAR(NoSeriesMgt);
                                    JGE.MODIFYALL(JGE."External Document No.", NoSeriesMgt.GetNextNo('ADV_VOUCH', WORKDATE, TRUE));
                                END;
                                //NoSeriesMgt.TryGetNextNo('ADV_VOUCH',TODAY);
                                //MESSAGE(NoSeriesMgt.GetNextNo('ADV_VOUCH',TODAY,TRUE));
                            END;
                            PrevDoc := Temp_Jrnl_Line_Table."Document No.";
                        END;
                    UNTIL Temp_Jrnl_Line_Table.NEXT = 0;
                // << Pranavi


                //IF NOT (USERID = 'EFFTRONICS\PRANAVI') THEN
            end;

            trigger OnAfterAction()
            begin
                //END;
                GJL1.RESET;
                IF GJL1.FINDSET THEN
                    REPEAT
                        IF GJL1."Payment Type" = GJL1."Payment Type"::Advance THEN BEGIN
                            SQLInt.PvtAdvOrderPaymentinCF_1(GJL1)  // added by pranavi on 09-09-2016 for adv payment entry to cf
                        END
                        ELSE
                            SQLInt.Pvt_Remaining_Adv_OrderPaymentinCF_1(GJL1);  // added by pranavi on 09-09-2016 for adv payment entry to cf
                    UNTIL GJL1.NEXT = 0;

                GJL1.RESET;
                GJL1.DELETEALL;
            end;
        }
        modify(Preview)
        {
            Promoted = true;
            PromotedCategory = Process;
        }
        modify("Post and &Print")
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        /* modify(Approve)
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify(Reject)
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify(Delegate)
        {
            Promoted = true;
        }
        modify(Comment)
        {
            Promoted = true;
        } */
        addafter("Insert Conv. LCY Rndg. Lines")
        {
            action(ForwardToCF)
            {
                Caption = 'Forward To Cashflow';
                ApplicationArea = All;

                trigger OnAction();
                begin
                    GJL1.RESET;
                    GJL1.DELETEALL;
                    GJL1.RESET;
                    FinalBill := FALSE;
                    IF "Sale Order No" = '' THEN
                        ERROR('Please specify the Sale order no');
                    SaleOrder := "Sale Order No";
                    PostingDate := "Posting Date";
                    // Added by Pranavi on 23-Jun-2016 for SD Status Tracking
                    IF "Journal Batch Name" = 'BRV-SALES' THEN BEGIN
                        GJL1.RESET;
                        /*IF "Payment Type" = "Payment Type"::Advance THEN  // added by pranavi on 09-09-2016 for adv payment entry to cf
                        BEGIN */
                        GJL.RESET;
                        GJL.SETRANGE(GJL."Journal Batch Name", "Journal Batch Name");
                        GJL.SETRANGE(GJL."Account Type", GJL."Account Type"::Customer);
                        IF GJL.FINDSET THEN BEGIN
                            IF GJL."Sale Order No" <> '' THEN BEGIN
                                GJL1 := GJL;
                                GJL1.INSERT;
                            END ELSE
                                ERROR('Please specify the Sale order no');
                        END;
                        /* END;*/
                    END;

                    GJL1.RESET;
                    IF GJL1.FINDSET THEN
                        REPEAT
                            IF GJL1."Payment Type" = GJL1."Payment Type"::Advance THEN BEGIN
                                SQLInt.PvtAdvOrderPaymentinCF_1(GJL1)  // added by pranavi on 09-09-2016 for adv payment entry to cf
                            END
                            ELSE
                                SQLInt.Pvt_Remaining_Adv_OrderPaymentinCF_1(GJL1);  // added by pranavi on 09-09-2016 for adv payment entry to cf
                        UNTIL GJL1.NEXT = 0;

                    GJL1.RESET;
                    GJL1.DELETEALL;

                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        /* IF ((COUNT = 1) AND ("Journal Batch Name" = 'BRV(CUST)')) OR ((COUNT = 1) AND ("Journal Batch Name" = 'BRV(EMP)')) THEN
            MESSAGE('POST RECEIPT IN SINGLE LINE'); */
        //srinivas
    end;


    var
        "sales invoice header": Record "Sales Invoice Header";
        "sales header": Record "Sales Header";
        Salinv: Record "Sales Invoice-Dummy";
        Text0001: Label '&Not a Final Bill Payment,&Final Bill Payment';
        Selection: Integer;
        FinalBill: Boolean;
        SaleOrder: Code[20];
        PostingDate: Date;
        GJL: Record "Gen. Journal Line";
        GJL1: Record "Gen. Journal Line" temporary;
        SQLInt: Codeunit SQLIntegration;
        NoSeriesMgt: Codeunit 396;



    local procedure AmountPercentageOnAfterValidat();
    begin
        "Credit Amount" := ("Credit Amount" * "Amount Percentage") / 100;
        Amount := -"Credit Amount";
        "Amount (LCY)" := -"Credit Amount";
        "Balance (LCY)" := -"Credit Amount";
        "VAT Base Amount" := -"Credit Amount";
        "Bal. VAT Base Amount" := "Credit Amount";
        "VAT Base Amount (LCY)" := -"Credit Amount";
        "Bal. VAT Base Amount (LCY)" := "Credit Amount";
    end;


    procedure SDStatusUpdate(SaleOrderNo: Code[20]; PostingDateVar: Date);
    var
        SIH: Record "Sales Invoice Header";
        SIDummy: Record "Sales Invoice-Dummy";
        SQLQuery: Text[1000];
        RowCount: Integer;
        ConnectionOpen: Integer;
        SQLConnection: Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000514-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Connection";
        RecordSet: Automation "'{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8:'{00000535-0000-0010-8000-00AA006D2EA4}':''{2A75196C-D9EB-4129-B803-931327F72D5C}' 2.8'.Recordset";
        SDId: Integer;
        Warranty: Code[10];
    begin
        // Added by Pranavi on 10-Aug-2016
        IF (SaleOrderNo <> '') THEN BEGIN
            SIH.RESET;
            SIH.SETRANGE(SIH."Order No.", SaleOrderNo);
            IF SIH.FINDSET THEN
                REPEAT
                    SIH.VALIDATE(SIH."Final Railway Bill Date", PostingDateVar);
                    IF COPYSTR(SIH."Order No.", 5, 3) = 'AMC' THEN
                        SIH.SecDepStatus := SIH.SecDepStatus::Due
                    ELSE BEGIN
                        IF (FORMAT(SIH."Warranty Period") <> '') THEN BEGIN
                            IF CALCDATE('+' + FORMAT(SIH."Warranty Period"), SIH."Final Railway Bill Date") <= TODAY() THEN
                                SIH.SecDepStatus := SIH.SecDepStatus::Due
                            ELSE
                                SIH.SecDepStatus := SIH.SecDepStatus::Warranty;
                        END;
                    END;
                    Warranty := FORMAT(SIH."Warranty Period");
                    SIH.MODIFY;
                UNTIL SIH.NEXT = 0;
            SIDummy.RESET;
            SIDummy.SETRANGE(SIDummy."No.", SaleOrderNo);
            IF SIDummy.FINDFIRST THEN BEGIN
                SIDummy.VALIDATE(SIDummy."Final Railway Bill Date", PostingDateVar);
                IF COPYSTR(SIDummy."No.", 5, 3) = 'AMC' THEN
                    SIDummy.SecDepStatus := SIDummy.SecDepStatus::Due
                ELSE BEGIN
                    IF (FORMAT(SIDummy."Warranty Period") <> '') THEN BEGIN
                        IF CALCDATE('+' + FORMAT(SIDummy."Warranty Period"), SIDummy."Final Railway Bill Date") <= TODAY() THEN
                            SIDummy.SecDepStatus := SIDummy.SecDepStatus::Due
                        ELSE
                            SIDummy.SecDepStatus := SIDummy.SecDepStatus::Warranty;
                    END;
                END;
                SIDummy.MODIFY;
            END;
        END;
        //Initialization start
        RowCount := 0;
        SQLQuery := '';
        SDId := 0;
        //Initializations end

        IF ISCLEAR(SQLConnection) THEN
            CREATE(SQLConnection, FALSE, TRUE);

        IF ISCLEAR(RecordSet) THEN
            CREATE(RecordSet, FALSE, TRUE);

        IF ConnectionOpen <> 1 THEN BEGIN
            SQLConnection.ConnectionString := 'DSN=CASHFLOW;UID=cashflowuser;PASSWORD=firewall123;SERVER=oracle_80;';
            SQLConnection.Open;
            SQLConnection.BeginTrans;
            ConnectionOpen := 1;
        END;
        SQLQuery := 'SELECT * FROM MRP_SECURITY_DEPOSIT WHERE INT_SAL_ORD_NO = ''' + FORMAT(SaleOrderNo) + ''' AND SD_STATUS = ''N''';
        //MESSAGE(SQLQuery);
        RecordSet := SQLConnection.Execute(SQLQuery, RowCount);
        IF NOT ((RecordSet.BOF) OR (RecordSet.EOF)) THEN
            RecordSet.MoveFirst;

        WHILE NOT RecordSet.EOF DO BEGIN
            SDId := RecordSet.Fields.Item('SD_ID').Value;
            RowCount := RowCount + 1;
            RecordSet.MoveNext;
        END;
        IF SDId <> 0 THEN BEGIN
            /*SQLQuery:='UPDATE  WARRANTY_PERIOD = '''+FORMAT(Warranty)+''', SD_FINAL_BILL_DATE = to_date('''+
            FORMAT(PostingDateVar,0,'<Day>-<Month Text,3>-<Year4>')+''',''dd-mon-yyyy'') WHERE INT_SAL_ORD_NO = '''+FORMAT(SaleOrderNo)+'''';*/
            SQLQuery := 'UPDATE MRP_SECURITY_DEPOSIT SET WARRANTY_PERIOD = ''' + FORMAT(SIH."Warranty Period") + ''', SD_FINAL_BILL_DATE = to_date(''' +
                  FORMAT(SIH."Final Railway Bill Date", 0, '<Day>-<Month Text,3>-<Year4>') + ''',''dd-mon-yyyy'') WHERE INT_SAL_ORD_NO = ''' + FORMAT(SIH."Order No.") + '''';
            SQLConnection.Execute(SQLQuery);
        END;
        SQLConnection.CommitTrans;
        RecordSet.Close;
        SQLConnection.Close;
        ConnectionOpen := 0;
        // End by Pranavi

    end;
}

