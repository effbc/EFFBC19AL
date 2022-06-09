pageextension 70115 PostedPurchaseInvoiceExt extends "Posted Purchase Invoice"
{
    Editable = true;
    layout
    {
        modify("Vendor Invoice No.")
        {
            Editable = VendrInvVisible;
        }
        modify("Buy-from Post Code")
        {
            CaptionML = ENU = 'Buy-from Post Code/City';
        }
        modify("Pay-to Post Code")
        {
            CaptionML = ENU = 'Pay-to Post Code/City';
        }
        modify("Ship-to Post Code")
        {
            CaptionML = ENU = 'Ship-to Post Code/City';
        }
        addbefore("Posting Date")
        {
            field("User ID"; "User ID")
            {
                Editable = false;
            }
        }
        addafter("Vendor Order No.")
        {
            field("Vendor Invoice Date"; "Vendor Invoice Date")
            {
                Caption = 'Vendor Invoice Date';
                Editable = VendrInvVisible;
            }
        }
        addafter("Responsibility Center")
        {
            field("Dimension Set ID"; "Dimension Set ID")
            {
                Visible = false;
            }
            field("Tarrif Heading No"; "Tarrif Heading No")
            {
            }
        }
        addafter("Shortcut Dimension 1 Code")
        {
            field("Excise Not to Consider"; "Excise Not to Consider")
            {

                trigger OnValidate();
                begin
                    /*IF "Excise Not to Consider"=TRUE THEN
                    BEGIN
                    CurrPage."Excise Not to Consider".EDITABLE(FALSE);
                    END ELSE
                    CurrPage."Excise Not to Consider".EDITABLE(TRUE);
                    */
                    IF NOT (USERID IN ['EFFTRONICS\BRAHMAIAH', 'EFFTRONICS\RAMKUMARL', 'EFFTRONICS\PURNACHAND']) THEN
                        ERROR('You Do not Permission to Change the status');

                end;
            }
        }
        addafter("Payment Method Code")
        {
            field("Vendor Excise Invoice No."; "Vendor Excise Invoice No.")
            {
                Editable = true;
            }
            field("Vend. Excise Inv. Date"; "Vend. Excise Inv. Date")
            {
            }
            field("Actual Invoiced Date"; "Actual Invoiced Date")
            {
            }
        }
        addafter("Expected Receipt Date")
        {
            field("Additional Duty Value"; "Additional Duty Value")
            {
            }
            field("Invoiced Amount"; "Invoiced Amount")
            {
            }
            field("Vehicle Number"; "Vehicle Number")
            {
            }
        }
        addafter("Currency Code")
        {
            field("Currency Factor"; "Currency Factor")
            {
            }
            field(State; State)
            {
                Editable = false;
            }
            field("Vendor GST Reg. No."; "Vendor GST Reg. No.")
            {
            }
            field("Excise Claimed Date"; "Excise Claimed Date")
            {
                Caption = 'GST Claimed Date';
                Editable = GST_Claimed_Date_Edtbl_Flag;
                Importance = Promoted;
            }
            field(RCM_Paid_Date; RCM_Paid_Date)
            {
                Editable = GST_Claimed_Date_Edtbl_Flag;
                Importance = Promoted;
            }
        }
    }


    actions
    {
        modify(Statistics)
        {
            Promoted = true;
        }
        /* modify("Posted Reference Invoice No.")
        {
            Promoted = true;
        } */
        modify(Print)
        {
            Promoted = true;
        }
        modify("&Navigate")
        {
            Promoted = true;
        }
        addbefore(Print)
        {
            action("Update In Cash Flow")
            {
                Caption = 'Update In Cash Flow';
                Visible = false;

                trigger OnAction();
                begin
                    "Posted Structure Order Details".SETRANGE("Posted Structure Order Details".Type, "Posted Structure Order Details".Type::Purchase);
                    "Posted Structure Order Details".SETRANGE("Posted Structure Order Details"."Document Type",
                                                              "Posted Structure Order Details"."Document Type"::Invoice);
                    "Posted Structure Order Details".SETRANGE("Posted Structure Order Details"."No.", "No.");
                    "Posted Structure Order Details".SETRANGE("Posted Structure Order Details"."Tax/Charge Type",
                                                              "Posted Structure Order Details"."Tax/Charge Type"::Dummy);
                    "Posted Structure Order Details".SETRANGE("Posted Structure Order Details"."Tax/Charge Group", 'FREIGHT');
                    "Posted Structure Order Details".SETFILTER("Posted Structure Order Details"."Calculation Value", '>%1', 0);
                    IF "Posted Structure Order Details".FINDFIRST THEN BEGIN
                        VendorLedgerEntry.SETCURRENTKEY(VendorLedgerEntry."Document No.",
                                                        VendorLedgerEntry."Document Type",
                                                        VendorLedgerEntry."Vendor No.");
                        VendorLedgerEntry.SETRANGE(VendorLedgerEntry."Document No.", "No.");

                        IF VendorLedgerEntry.FINDFIRST THEN BEGIN
                            VendorLedgerEntry.CALCFIELDS(VendorLedgerEntry."Amount (LCY)");
                            Invoice_Value := ABS(VendorLedgerEntry."Amount (LCY)");
                        END;

                        "Purch.InvLine".SETRANGE("Purch.InvLine"."Document No.", "No.");
                        IF "Purch.InvLine".FINDSET THEN
                            REPEAT
                                "Posted Str Order Line Details".RESET;
                                "Posted Str Order Line Details".SETRANGE("Posted Str Order Line Details".Type, "Posted Str Order Line Details".Type::Purchase)
                           ;
                                "Posted Str Order Line Details".SETRANGE("Posted Str Order Line Details"."Document Type",
                                                                         "Posted Str Order Line Details"."Document Type"::Invoice);
                                "Posted Str Order Line Details".SETRANGE("Posted Str Order Line Details"."Invoice No.",
                                                                         "No.");
                                "Posted Str Order Line Details".SETRANGE("Posted Str Order Line Details"."Line No.",
                                                                         "Purch.InvLine"."Line No.");
                                "Posted Str Order Line Details".SETRANGE("Posted Str Order Line Details"."Tax/Charge Type",
                                                                         "Posted Str Order Line Details"."Tax/Charge Type"::Dummy);
                                "Posted Str Order Line Details".SETRANGE("Posted Str Order Line Details"."Tax/Charge Group", 'FREIGHT');

                                IF "Posted Str Order Line Details".FINDFIRST THEN BEGIN
                                    "Posted Str Order Line Details".Amount := ("Purch.InvLine"."Amount To Vendor" / Invoice_Value) * Invoice_Value;
                                    "Posted Str Order Line Details".VALIDATE("Posted Str Order Line Details".Amount,
                                                                             ("Purch.InvLine"."Amount To Vendor" / Invoice_Value) *
                                                                              "Posted Structure Order Details"."Calculation Value");
                                    "Posted Str Order Line Details"."Amount (LCY)" := ("Purch.InvLine"."Amount To Vendor" / Invoice_Value) *
                                                                                    "Posted Structure Order Details"."Calculation Value";
                                    "Posted Str Order Line Details".MODIFY;
                                END;
                            UNTIL "Purch.InvLine".NEXT = 0;
                        SQLQRY :=
                        'Insert into INVOICE_LINE (INVOICE_ID,VENDORID,ORDERNO,INVOICE_NUMBER,INVOICE_LINE_NO,RECEIPT_LINE_NO,ITEMNO' +
                                 ',INVOICED_DATE,ORDER_LINE_NO,BILLNO,FREIGHT_CHARGES ) VALUES ' +
                                 '(seq_Invoice_ID.NEXTVAL,''' + "Posted Structure Order Details"."Third Party Code" + ''',''' + "No." +
                                ''',''' + "No." + ''',0,0,''JOURNAL'',''' +
                                FORMAT(TODAY, 0, '<Day>-<Month Text,3>-<Year4>') + ''',0,''' + "Vendor Invoice No." + ''',''' +
                                CommaRemoval(FORMAT("Posted Structure Order Details"."Calculation Value")) + ''')';
                        MESSAGE(SQLQRY);

                        CashFlowconnection.ExecInOracle(
                        'Insert into INVOICE_LINE (INVOICE_ID,VENDORID,ORDERNO,INVOICE_NUMBER,INVOICE_LINE_NO,RECEIPT_LINE_NO,ITEMNO' +
                                 ',INVOICED_DATE,ORDER_LINE_NO,BILLNO,FREIGHT_CHARGES ) VALUES ' +
                                 '(seq_Invoice_ID.NEXTVAL,''' + "Posted Structure Order Details"."Third Party Code" + ''',''' + "No." +
                                ''',''' + "No." + ''',0,0,''JOURNAL'',''' +
                                FORMAT(TODAY, 0, '<Day>-<Month Text,3>-<Year4>') + ''',0,''' + "Vendor Invoice No." + ''',''' +
                                CommaRemoval(FORMAT("Posted Structure Order Details"."Calculation Value")) + ''')');
                    END;
                end;
            }
            separator(Action1102152006)
            {
            }
            action("MSPT Details")
            {
                Caption = 'MSPT Details';
                RunObject = Page "MSPT Posted Order Details";
                RunPageLink = Type = CONST(Purchase), "Document No." = FIELD("No.");
            }
            action("Forward To Cashlfow")
            {

                trigger OnAction();
                begin
                    IF USERID IN ['EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\SUJANI'] THEN BEGIN
                        SLQInt.Purch_Invoice_in_CF(Rec);
                    END ELSE BEGIN
                        ERROR('YOU DO NOT HAVE A RIGHTS TO PERFORM THIS OPERATION');
                    END;
                end;
            }
        }
        addafter(IncomingDocAttachFile)
        {
            action(BankPDFs)
            {
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction();
                begin
                    PurchInvHeader2.RESET;
                    PurchInvHeader2.SETRANGE("No.", Rec."No.");
                    IF PurchInvHeader2.FINDFIRST THEN BEGIN
                        REPORT.RUNMODAL(50033, TRUE, FALSE, PurchInvHeader2);
                        REPORT.RUNMODAL(50064, TRUE, FALSE, PurchInvHeader2);
                    END;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        GST_Claimed_Date_Edtbl_Flag := FALSE;
        /* IF USERID IN ['EFFTRONICS\SUJANI', 'EFFTRONICS\VIJAYA', 'EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\RAJANI', 'EFFTRONICS\SITARAJYAM']
                   THEN
            GST_Claimed_Date_Edtbl_Flag := TRUE
        ELSE
            GST_Claimed_Date_Edtbl_Flag := FALSE; */
        //RESET;

        /* PurchInvHeader.RESET;
        PurchInvHeader.SETRANGE(PurchInvHeader."No.","No.");
        IF FINDFIRST THEN
        BEGIN
        IF PurchInvHeader."Excise Not to Consider"=FALSE THEN
        CurrPage."Excise Not to Consider".EDITABLE:=TRUE
        ELSE
        CurrPage."Excise Not to Consider".EDITABLE:=FALSE;
        END; */

    end;

    trigger OnAfterGetRecord()
    begin
        IF "Form No." = '' THEN
            "Form No.Editable" := TRUE
        ELSE
            "Form No.Editable" := FALSE;

        SETRANGE("No.");

        /* PurchInvHeader.RESET;
        PurchInvHeader.SETRANGE(PurchInvHeader."No.", "No.");
        IF FINDFIRST THEN BEGIN
        IF PurchInvHeader."Excise Not to Consider" = FALSE THEN
        CurrPage."Excise Not to Consider".EDITABLE := TRUE
        ELSE
        CurrPage."Excise Not to Consider".EDITABLE := FALSE;
        END; */
    end;


    var
        Vend_Ledger_Entry: Record "Vendor Ledger Entry";
        "Posted Structure Order Details": Record "Posted Structure Order Details";
        CashFlowconnection: Codeunit "Cash Flow Connection";
        "Posted Str Order Line Details": Record "Posted Str Order Line Details";
        Invoice_Value: Decimal;
        VendorLedgerEntry: Record "Vendor Ledger Entry";
        "Purch.InvLine": Record "Purch. Inv. Line";
        SQLQRY: Text[1000];
        [InDataSet]
        "Form No.Editable": Boolean;
        fromEdit: Option Yes,No;
        VendrInvVisible: Boolean;
        SLQInt: Codeunit SQLIntegration;
        GST_Claimed_Date_Edtbl_Flag: Boolean;
        FieldsEditing: Boolean;
        EditControlling: Boolean;
        PurchInvHeader2: Record "Purch. Inv. Header";



    procedure CommaRemoval(Base: Text[30]) Converted: Text[30];
    var
        i: Integer;
    begin
        FOR i := 1 TO STRLEN(Base) DO BEGIN
            IF COPYSTR(Base, i, 1) <> ',' THEN
                Converted += COPYSTR(Base, i, 1);
        END;
        EXIT(Converted);
    end;
}

