report 50200 "Modification Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Modification Report.rdlc';

    dataset
    {
        dataitem("Sales Invoice Header";"Sales Invoice Header")
        {
            RequestFilterFields = "No.";

            trigger OnAfterGetRecord();
            begin
                  totvatamt:=0;
                  IF USERID='SUPER' THEN
                  BEGIN
                      SIH.SETRANGE(SIH."No.","Sales Invoice Header"."No.");
                      SIH.SETRANGE(SIH."Sell-to Customer No.","Sales Invoice Header"."Sell-to Customer No.");
                       IF SIH.FINDFIRST THEN BEGIN
                         IF Structure1<>'' THEN
                         BEGIN
                          IF SIH."Tax Liable"=FALSE THEN
                          SIH."Tax Liable":=TRUE;
                          SIH.Structure:=Structure1;
                         END ELSE
                         BEGIN
                         SIH."Tax Liable":=TRUE;
                         END;
                         IF invoiceno<>'' THEN
                          BEGIN
                          SIH."External Document No.":=invoiceno;
                          SIH."Pre-Assigned No.":=invoiceno;
                          END;
                         IF postingdate<>0D THEN
                          BEGIN
                            SIH."Posting Date":=postingdate;
                            SIH."Shipment Date":=postingdate;
                            SIH."Document Date":=postingdate;
                          END;
                         IF WayBillNo<>'' THEN
                          SIH.WayBillNo:=WayBillNo;
                          SIH."User ID":="Sales Invoice Header"."User ID";
                        SIH.MODIFY;
                     END;
                    SIL.SETRANGE(SIL."Document No.","Sales Invoice Header"."No.");
                     IF SIL.FINDSET THEN
                      REPEAT
                          TaxBase:=0;
                          vatamt:=0;
                /*           IF Bed<>0 THEN
                           BEGIN
                           BEDBASE:=SIL."Line Amount";
                           Bedamt:=BEDBASE*Bed/100;
                           EcessAmt:=Bedamt*2/100;
                           SHECESSAmt:=Bedamt*1/100;
                           SIL."BED Amount":=Bedamt;
                           SIL."eCess Amount":=EcessAmt;
                           SIL."SHE Cess Amount":=SHECESSAmt;
                           ExciseAmt:=Bedamt+EcessAmt+SHECESSAmt;
                           SIL."Excise Amount":=ExciseAmt;
                           SIL."Amount Including Excise":=SIL."Line Amount"+ExciseAmt;
                           SIL."Excise Base Amount":=BEDBASE;
                           END;
                */
                           IF vat<>0 THEN
                           BEGIN
                            SIL."Tax %":=vat;
                            IF SIL."Excise Amount"<>0 THEN
                            TaxBase:=SIL."Excise Amount"+SIL."Line Amount"
                            ELSE
                            TaxBase:=SIL."Line Amount";
                            vatamt:=TaxBase*vat/100;
                            SIL."Tax Amount":=vatamt;
                            SIL."Amount Including Tax":=TaxBase+vatamt;
                            SIL."Amount To Customer":=TaxBase+vatamt;
                            totalinvoicedamt:=totalinvoicedamt+TaxBase+vatamt;
                           END;
                          IF invoiceno<>'' THEN
                            SIL."External Document No.":=invoiceno;
                          IF postingdate<>0D THEN
                            SIL."Shipment Date":=postingdate;
                           SIL.MODIFY;
                          totvatamt:=totvatamt+vatamt;
                      UNTIL SIL.NEXT=0;
                    GLACEXIST:=FALSE;
                    GL.SETCURRENTKEY(GL."Document No.",GL."Posting Date",GL.Amount);
                    GL.SETRANGE(GL."Document No.","Sales Invoice Header"."No.");
                     IF GL.FINDSET THEN
                      REPEAT
                        IF invoiceno<>'' THEN
                         GL."External Document No.":=invoiceno;
                        IF postingdate<>0D THEN
                        BEGIN
                         GL."Posting Date":=postingdate;
                         GL."Document Date":=postingdate;
                        END;
                        GL."User ID":="Sales Invoice Header"."User ID";
                        IF GL."G/L Account No."='38200' THEN
                        BEGIN
                        GL.Amount:=vatamt;
                        GLACEXIST:=TRUE;
                        END;
                        IF GL."G/L Account No."='51700' THEN
                        BEGIN
                        GL.Amount:=vatamt;
                        GLACEXIST:=TRUE;
                        END;
                        GL.MODIFY;
                      UNTIL GL.NEXT=0;
                      IF GLACEXIST=FALSE THEN
                      BEGIN
                          GL1.GET(GL1."Entry No.");
                          IF GL1.FINDLAST THEN
                          BEGIN
                            GLNEWENTRYNO:=GL1."Entry No."+1;
                            GL1."Entry No.":=GLNEWENTRYNO;
                            IF SIH."Tax Area Code"='SALES CST' THEN
                            GL1."G/L Account No.":='38200'
                            ELSE
                            GL1."G/L Account No.":='51700';
                            GL1."Posting Date":="Sales Invoice Header"."Posting Date";
                            GL1."Document Type":=GL1."Document Type"::Invoice;
                            GL1."Document No.":="Sales Invoice Header"."No.";
                            GL1.Amount:=-(vatamt);
                            GL1.Description:=GL.Description;
                            GL1."Global Dimension 1 Code":=SIH."Shortcut Dimension 1 Code";
                            GL1."User ID":=SIH."User ID";
                            GL1."Source Code":='SALES';
                            GL1."System-Created Entry":=TRUE;
                            GL1."Gen. Posting Type":=GL1."Gen. Posting Type"::Sale;
                            GL1."Gen. Bus. Posting Group":="Sales Invoice Header"."Gen. Bus. Posting Group";
                            GL1."Bal. Account No.":='G/L ACCOUNT';
                            GL1."Transaction No.":=GL."Transaction No.";
                            GL1."Credit Amount":=vatamt;
                            GL1."Document Date":=SIH."Posting Date";
                            GL1."External Document No.":=SIH."External Document No.";
                            GL1."Source Type":=GL1."Source Type"::Customer;
                            GL1."Source No.":=SIH."Sell-to Customer No.";
                            GL1."No. Series":=GL."No. Series";
                            GL1."Tax Area Code":="Sales Invoice Header"."Tax Area Code";
                            GL1."Tax Liable":=TRUE;
                            GL1."VAT Bus. Posting Group":='NO VAT';
                            GL1."VAT Prod. Posting Group":='NOVAT';
                            GL1."Tax Amount":=vatamt;
                            GL1."System Date":=TODAY;
                            GL1.INSERT;
                           END;
                      END;
                    EE.SETRANGE(EE."Document Type",EE."Document Type"::Invoice);
                    EE.SETRANGE(EE."Document No.","Sales Invoice Header"."No.");
                      IF EE.FINDSET THEN
                      REPEAT
                       IF invoiceno<>'' THEN
                       EE."External Document No.":=invoiceno;
                       IF postingdate<>0D THEN
                       EE."Posting Date":=postingdate;
                       EE."User ID":="Sales Invoice Header"."User ID";
                       IF Bed<>0 THEN
                       BEGIN
                         EE."BED %":=Bed;
                         EE.Amount:=ExciseAmt;
                       END;
                       EE.MODIFY;
                      UNTIL EE.NEXT=0;
                    TE.SETRANGE(TE."Document No.","Sales Invoice Header"."No.");
                      IF TE.FINDSET THEN
                      BEGIN
                        REPEAT
                          IF invoiceno<>'' THEN
                          TE."External Document No.":=invoiceno;
                          IF postingdate<>0D THEN
                          TE."Posting Date":=postingdate;
                /*          IF Bed<>0 THEN
                          TE.Base:=SIL."Line Amount";*/
                          TE."User ID":="Sales Invoice Header"."User ID";
                          TE.MODIFY;
                        UNTIL TE.NEXT=0
                      END ELSE
                     BEGIN
                       NEWTE.GET(NEWTE."Entry No.");
                       IF NEWTE.FINDLAST THEN
                         Entryno:=NEWTE."Entry No."+1;
                       TE."Entry No.":=Entryno;
                       TE."Posting Date":="Sales Invoice Header"."Posting Date";
                       TE."Document Type":=TE."Document Type"::Invoice;
                       TE."Document No.":="Sales Invoice Header"."No.";
                       TE.Type:=TE.Type::Sale;
                       TE."Gen. Bus. Posting Group":=SIL."Gen. Bus. Posting Group";
                       TE."Gen. Prod. Posting Group":=SIL."Gen. Prod. Posting Group";
                       TE.Base:=TaxBase;
                       TE.Amount:=vatamt;
                       TE."Sell-to/Buy-from No.":="Sales Invoice Header"."Sell-to Customer No.";
                       TE.INSERT;
                     END;
                    CLE.SETRANGE(CLE."Document No.","Sales Invoice Header"."No.");
                     IF CLE.FINDSET THEN
                     REPEAT
                     IF invoiceno<>'' THEN
                     CLE."External Document No.":=invoiceno;
                     IF postingdate<>0D THEN
                     BEGIN
                     CLE."Posting Date":=postingdate;
                     CLE."Document Date":=postingdate;
                     END;
                     CLE."User ID":="Sales Invoice Header"."User ID";
                     CLE.MODIFY;
                     UNTIL CLE.NEXT=0;
                
                    DCLE.SETRANGE(DCLE."Document No.","Sales Invoice Header"."No.");
                    IF DCLE.FINDSET THEN
                    REPEAT
                     IF postingdate<>0D THEN
                     DCLE."Posting Date":=postingdate;
                     DCLE."User ID":="Sales Invoice Header"."User ID";
                     DCLE.Amount:=totalinvoicedamt;
                     DCLE."Amount (LCY)":=totalinvoicedamt;
                     DCLE."Debit Amount":=totalinvoicedamt;
                     DCLE."Debit Amount (LCY)":=totalinvoicedamt;
                     DCLE.MODIFY;
                    UNTIL DCLE.NEXT=0;
                    VE.SETCURRENTKEY(VE."Document No.");
                    VE.SETRANGE(VE."Document No.","Sales Invoice Header"."No.");
                    IF VE.FINDSET THEN REPEAT
                     IF invoiceno<>'' THEN
                     VE."External Document No.":=invoiceno;
                     IF postingdate<>0D THEN
                     BEGIN
                     VE."Posting Date":=postingdate;
                     VE."Document Date":=postingdate;
                     VE."Valuation Date":=postingdate;
                     END;
                     VE."User ID":="Sales Invoice Header"."User ID";
                     VE.MODIFY;
                    UNTIL VE.NEXT=0;
                    DTE.SETRANGE(DTE."Document No.","Sales Invoice Header"."No.");
                    IF DTE.FINDSET THEN
                    BEGIN
                      REPEAT
                        IF postingdate<>0D THEN
                        DTE."Posting Date":=postingdate;
                        IF invoiceno<>'' THEN
                        DTE."External Document No.":=invoiceno;
                        DTE."User ID":="Sales Invoice Header"."User ID";
                        DTE.MODIFY;
                      UNTIL DTE.NEXT=0;
                     END ELSE
                     BEGIN
                     IF DTEExistorNot=TRUE THEN
                     BEGIN
                      NEWDTE.GET(NEWDTE."Entry No.");
                      IF FINDLAST THEN
                      DTEENNTRYNO:=DTEENNTRYNO+1;
                      NEWDTE."Entry No.":=DTEENNTRYNO;
                      NEWDTE."Entry Type":=NEWDTE."Entry Type"::"Initial Entry";
                      NEWDTE."Transaction Type":=NEWDTE."Transaction Type"::Sale;
                      NEWDTE."Document Type":=NEWDTE."Document Type"::Invoice;
                      NEWDTE."Document No.":="Sales Invoice Header"."No.";
                      NEWDTE."Posting Date":="Sales Invoice Header"."Posting Date";
                      SIL.RESET;
                      SIL.SETRANGE(SIL."Document No.","Sales Invoice Header"."No.");
                      SIL.SETFILTER(SIL.Quantity,'>%1',0);
                      IF SIL.FINDSET THEN
                      REPEAT
                      NEWDTE.Type:=NEWDTE.Type::Item;
                      NEWDTE."No.":=SIL."No.";
                      NEWDTE."Product Type":=NEWDTE."Product Type"::Item;
                      NEWDTE."Source Type":=NEWDTE."Source Type"::Customer;
                      NEWDTE."Source No.":=SIL."Sell-to Customer No.";
                      NEWDTE."Tax Base Amount":=SIL."Tax Base Amount";
                      NEWDTE."Tax %":=SIL."Tax %";
                      NEWDTE."Tax Amount":=SIL."Tax Amount";
                      NEWDTE."External Document No.":=SIL."External Document No.";
                      NEWDTE."Input Credit/Output Tax Amount":=-(SIL."Tax Amount");
                      NEWDTE."State Code":='ANP';
                      NEWDTE."Location Code":='STR';
                      NEWDTE."Tax Area Code":=SIL."Tax Area Code";
                      NEWDTE."Tax Jurisdiction Code":=SIL."Tax Area Code";
                      NEWDTE.Quantity:=-(SIL.Quantity);
                      NEWDTE."Remaining Tax Amount":=-(SIL."Tax Amount");
                      IF SIL."Tax Area Code"='SALES CST' THEN
                      NEWDTE."G/L Account No.":='38200'
                      ELSE
                      NEWDTE."G/L Account No.":='51700';
                      NEWDTE."Remaining Quantity":=-(SIL.Quantity);
                      NEWDTE."Tax Group Code":=SIL."Tax Group Code";
                      NEWDTE."Document Line No.":=SIL."Line No.";
                      UNTIL SIL.NEXT=0;
                     NEWDTE.INSERT;
                     END;
                    END;
                   END ELSE
                  ERROR('You Do Not Have Permission To Run This Report');

            end;

            trigger OnPostDataItem();
            begin
                  MESSAGE('ALL MODIFICATIONS HAS BEEN DONE');
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
        SIH : Record "Sales Invoice Header";
        SIL : Record "Sales Invoice Line";
        GL : Record "G/L Entry";
        EE : Record "Excise Entry";
        TE : Record "Tax Entry";
        CLE : Record "Cust. Ledger Entry";
        DCLE : Record "Detailed Cust. Ledg. Entry";
        VE : Record "Value Entry";
        DTE : Record "Detailed Tax Entry";
        invoiceno : Code[10];
        postingdate : Date;
        waybillno : Code[10];
        ModUser : Code[10];
        TEXT001 : Label '%1 INVOICE NO NOT UPDATED DUE TO FOLLOWING FIELD WAS NOT EDITABLE IN THE %2 TABLE';
        vat : Decimal;
        Structure1 : Text[30];
        TaxBase : Decimal;
        vatamt : Decimal;
        NEWTE : Record "Tax Entry";
        Entryno : Decimal;
        NEWDTE : Record "Detailed Tax Entry";
        DTEENNTRYNO : Decimal;
        totalinvoicedamt : Decimal;
        GLACEXIST : Boolean;
        GLNEWENTRYNO : Integer;
        GL1 : Record "G/L Entry";
        totvatamt : Decimal;
        Bed : Decimal;
        BEDBASE : Decimal;
        Bedamt : Decimal;
        DTEExistorNot : Boolean;
        EcessAmt : Decimal;
        SHECESSAmt : Decimal;
        ExciseAmt : Decimal;
        CompareExcise : Decimal;
}

