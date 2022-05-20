report 80012 "Purchase - Invoice3"
{
    // version NAVW17.00,NAVIN7.00,KKC

    // <changelog>
    //  <change id="IN0090" dev="AUGMENTUM" date="2008-05-28" area="Purchase"
    //    baseversion="IN6.00" releaseversion="IN6.00" feature="NAVCORS20363">
    //    Report transformation.
    //  </change>
    // </changelog>
    DefaultLayout = RDLC;
    RDLCLayout = './Purchase - Invoice3.rdlc';

    CaptionML = ENU='Purchase - Invoice',
                ENN='Purchase - Invoice';

    dataset
    {
        dataitem("Purch. Inv. Header";"Purch. Inv. Header")
        {
            DataItemTableView = SORTING(No.);
            RequestFilterFields = "No.","Buy-from Vendor No.","No. Printed";
            ReqFilterHeading = 'Posted Purchase Invoice';
            column(No_PurchInvHeader;"No.")
            {
            }
            column(InvDiscountAmountCaption;InvDiscountAmountCaptionLbl)
            {
            }
            column(ServiceTaxSBCAmount;ServiceTaxSBCAmount)
            {
            }
            column(ApplServiceTaxSBCAmount;AppliedServiceTaxSBCAmount)
            {
            }
            column(ServTaxSBCAmtCaption;ServTaxSBCAmtCaptionLbl)
            {
            }
            column(SvcTaxSBCAmtAppliedCaption;SvcTaxSBCAmtAppliedCaptionLbl)
            {
            }
            column(KKCessAmtCaption;KKCessAmtCaptionLbl)
            {
            }
            column(KKCessAmtAppliedCaption;KKCessAmtAppliedCaptionLbl)
            {
            }

            trigger OnAfterGetRecord();
            begin
                CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");

                //CompanyInfo.GET; //Rev01

                IF RespCenter.GET("Responsibility Center") THEN BEGIN
                  FormatAddr.RespCenter(CompanyAddr,RespCenter);
                  CompanyInfo."Phone No." := RespCenter."Phone No.";
                  CompanyInfo."Fax No." := RespCenter."Fax No.";
                END ELSE BEGIN
                  FormatAddr.Company(CompanyAddr,CompanyInfo);
                END;

                DimSetEntry1.SETRANGE("Dimension Set ID","Purch. Inv. Header"."Dimension Set ID");

                IF "Order No." = '' THEN
                  OrderNoText := ''
                ELSE
                  OrderNoText := FIELDCAPTION("Order No.");
                IF "Purchaser Code" = '' THEN BEGIN
                  CLEAR(SalesPurchPerson);
                  PurchaserText := '';
                END ELSE BEGIN
                  SalesPurchPerson.GET("Purchaser Code");
                  PurchaserText := Text000
                END;
                IF "Your Reference" = '' THEN
                  ReferenceText := ''
                ELSE
                  ReferenceText := FIELDCAPTION("Your Reference");
                IF "VAT Registration No." = '' THEN
                  VATNoText := ''
                ELSE
                  VATNoText := FIELDCAPTION("VAT Registration No.");
                IF "Currency Code" = '' THEN BEGIN
                  GLSetup.TESTFIELD("LCY Code");
                  TotalText := STRSUBSTNO(Text001,GLSetup."LCY Code");
                  TotalInclVATText := STRSUBSTNO(Text002,GLSetup."LCY Code");
                  TotalExclVATText := STRSUBSTNO(Text006,GLSetup."LCY Code");
                END ELSE BEGIN
                  TotalText := STRSUBSTNO(Text001,"Currency Code");
                  TotalInclVATText := STRSUBSTNO(Text002,"Currency Code");
                  TotalExclVATText := STRSUBSTNO(Text006,"Currency Code");
                END;
                FormatAddr.PurchInvPayTo(VendAddr,"Purch. Inv. Header");

                IF "Payment Terms Code" = '' THEN
                  PaymentTerms.INIT
                ELSE
                  PaymentTerms.GET("Payment Terms Code");
                IF "Shipment Method Code" = '' THEN
                  ShipmentMethod.INIT
                ELSE
                  ShipmentMethod.GET("Shipment Method Code");

                FormatAddr.PurchInvShipTo(ShipToAddr,"Purch. Inv. Header");

                IF LogInteraction THEN
                  IF NOT CurrReport.PREVIEW THEN
                    SegManagement.LogDocument(
                      14,"No.",0,0,DATABASE::Vendor,"Buy-from Vendor No.","Purchaser Code",'',"Posting Description",'');

                i:=0;
                GlEntryGRec.RESET;
                GlEntryGRec.SETCURRENTKEY("G/L Account No.","Posting Date");
                GlEntryGRec.SETFILTER(GlEntryGRec."Document No.","Purch. Inv. Header"."No.");
                GlEntryGRec.SETFILTER(GlEntryGRec.Amount,'>%1',0);
                IF GlEntryGRec.FINDFIRST THEN
                REPEAT
                  i:=i+1;
                  "Account Head"[i]:='';
                  IF GlEntryGRec."G/L Account No." IN ['18100','18200','18300','18400'] THEN
                  BEGIN
                    IF Old_track=1 THEN BEGIN
                      i:=i-1;
                      AccountAmount[i]+=GlEntryGRec.Amount;
                    END ELSE
                    BEGIN
                      "G/L".GET(FORMAT(18000));
                      "Account Head"[i]:="G/L".Name+' ( '+GlEntryGRec."G/L Account No."+' )';
                      AccountAmount[i]:=GlEntryGRec.Amount;
                      Old_track:=1;
                    END;
                  END
                  ELSE
                  IF GlEntryGRec."G/L Account No." IN ['12951','12952','12953','12954'] THEN
                  BEGIN
                    IF Old_track=2 THEN BEGIN
                      i:=i-1;
                      AccountAmount[i]+=GlEntryGRec.Amount;
                    END ELSE BEGIN
                      "G/L".GET(FORMAT(12950));
                      "Account Head"[i]:="G/L".Name+' ( '+GlEntryGRec."G/L Account No."+' )';
                      AccountAmount[i]:=GlEntryGRec.Amount;
                      Old_track:=2;
                    END;
                  END
                  ELSE
                  IF GlEntryGRec."G/L Account No." IN ['15100','15200','15300','15400'] THEN
                  BEGIN
                    IF Old_track=3 THEN  BEGIN
                      i:=i-1;
                      AccountAmount[i]+=GlEntryGRec.Amount;
                    END ELSE BEGIN
                      "G/L".GET(FORMAT(15000));
                      "Account Head"[i]:="G/L".Name+' ( '+GlEntryGRec."G/L Account No."+' )';
                      AccountAmount[i]:=GlEntryGRec.Amount;
                      Old_track:=3;
                    END;
                  END
                  ELSE
                  IF GlEntryGRec."G/L Account No." IN ['13100','13200','13300','13400'] THEN
                  BEGIN
                    IF Old_track=4 THEN BEGIN
                      i:=i-1;
                      AccountAmount[i]+=GlEntryGRec.Amount;
                    END ELSE BEGIN
                      "G/L".GET(FORMAT(13000));
                      "Account Head"[i]:="G/L".Name+' ( '+GlEntryGRec."G/L Account No."+' )';
                      AccountAmount[i]:=GlEntryGRec.Amount;
                      Old_track:=4
                    END;
                  END
                  ELSE
                  BEGIN
                  IF Account_OLD=GlEntryGRec."G/L Account No." THEN
                  BEGIN
                    i:=i-1;
                    AccountAmount[i]+=GlEntryGRec.Amount;
                  END ELSE
                  BEGIN
                  Account_OLD:=GlEntryGRec."G/L Account No.";
                  IF "G/L".GET(GlEntryGRec."G/L Account No.") THEN
                    "Account Head"[i]:="G/L".Name+' ( '+GlEntryGRec."G/L Account No."+' )';
                    AccountAmount[i]:=GlEntryGRec.Amount;
                  END;
                  END;
                UNTIL GlEntryGRec.NEXT=0;


                GlEntryGRec.RESET;
                GlEntryGRec.SETFILTER(GlEntryGRec."Document No.","Purch. Inv. Header"."No.");
                GlEntryGRec.SETFILTER(GlEntryGRec.Amount,'<%1',0);
                GlEntryGRec.SETFILTER(GlEntryGRec."G/L Account No.",'<>%1','48400');
                IF GlEntryGRec.FINDFIRST THEN
                REPEAT
                  TotalAmount+=-1*GlEntryGRec.Amount;
                UNTIL GlEntryGRec.NEXT=0;

                GlEntryGRec.RESET;
                GlEntryGRec.SETFILTER(GlEntryGRec."Document No.","Purch. Inv. Header"."No.");
                GlEntryGRec.SETFILTER(GlEntryGRec.Amount,'<%1',0);
                GlEntryGRec.SETFILTER(GlEntryGRec."G/L Account No.",'48400');
                IF GlEntryGRec.FINDFIRST THEN
                BEGIN
                  i:=i+1;
                REPEAT
                  IF "G/L".GET(GlEntryGRec."G/L Account No.") THEN
                    "Account Head"[i]:="G/L".Name+' ( '+GlEntryGRec."G/L Account No."+' )';
                    AccountAmount[i]+=GlEntryGRec.Amount;
                UNTIL GlEntryGRec.NEXT=0;
                END;
            end;

            trigger OnPostDataItem();
            begin
                //Rev01 Code copied from // Purch. Inv. Header, Footer (1) - OnPreSection()
                
                IF Choice=Choice::Jnl THEN
                BEGIN
                  "Dimension Value".SETRANGE("Dimension Value"."Dimension Code",'DEPARTMENTS');
                  "Dimension Value".SETRANGE("Dimension Value".Code,"Purch. Inv. Header"."Shortcut Dimension 1 Code");
                  IF "Dimension Value".FIND('-') THEN
                    Dept:="Dimension Value".Name;
                  PaymentTerms.RESET;
                  Payment_Terms.GET("Purch. Inv. Header"."Payment Terms Code");
                  PurchLine.RESET;
                  PurchLine.SETRANGE(PurchLine."Document No.","Purch. Inv. Header"."No.");
                  PurchLine.SETFILTER(PurchLine."No.",'<>%1','');
                  IF PurchLine.FIND('-') THEN
                  BEGIN
                    IF PurchLine."Tax Area Code"='PUCH CST' THEN
                    BEGIN
                      TAX_TYPE:='CST';
                    END ELSE
                    BEGIN
                      TAX_TYPE:='VAT';
                    END;
                
                    IF PurchLine.Type=PurchLine.Type::Item THEN
                    BEGIN
                      Item_Desc:=PurchLine.Description;
                      /*GPS.SETRANGE(GPS."Gen. Prod. Posting Group",PurchLine."Gen. Prod. Posting Group");
                      GPS.SETFILTER(GPS."Gen. Bus. Posting Group",PurchLine."Gen. Bus. Posting Group");
                      IF GPS.FIND('-') THEN
                      BEGIN
                        "G\L".SETRANGE("G\L"."No.",GPS."Purch. Account");
                        IF "G\L".FIND('-') THEN
                        //"Account Head":="G\L".Name+'('+GPS."Purch. Account"+')';
                
                      END;*/
                    END ELSE
                    IF PurchLine.Type=PurchLine.Type::"G/L Account" THEN
                    BEGIN
                      /*"G\L".SETRANGE("G\L"."No.",PurchLine."No.");
                      IF "G\L".FIND('-') THEN
                        //"Account Head":="G\L".Name+'('+PurchLine."No."+')';
                
                    END ELSE
                    BEGIN
                      FA.SETRANGE(FA."No.",PurchLine."No.");
                      IF FA.FIND('-') THEN                      */
                        //"Account Head":=FA."FA Subclass Code";
                    END;
                  END;
                END;// ELSE
                  //CurrReport.SHOWOUTPUT(FALSE);
                //Rev01 Code copied from // Purch. Inv. Header, Footer (1) - OnPreSection()

            end;

            trigger OnPreDataItem();
            begin
                CompanyInfo.GET;
                CompanyInfo.CALCFIELDS(Picture);
            end;
        }
        dataitem("Integer";"Integer")
        {
            column(AccountHead;AccountHead)
            {
            }
            column(PaytoName_PurchInvHeader;"Purch. Inv. Header"."Pay-to Name")
            {
            }
            column(PaytoCity_PurchInvHeader;"Purch. Inv. Header"."Pay-to City")
            {
            }
            column(VendorInvoiceNo_PurchInvHeader;"Purch. Inv. Header"."Vendor Invoice No.")
            {
            }
            column(VendorInvoiceDate_PurchInvHeader;"Purch. Inv. Header"."Vendor Invoice Date")
            {
            }
            column(Item_Desc;Item_Desc)
            {
            }
            column(Title_Purchase_Footer;Title)
            {
            }
            column(Dept_Purchase_Footer;Dept)
            {
            }
            column(Picture_CompanyInfo;CompanyInfo.Picture)
            {
            }
            column(TotalAmt;TotalAmount)
            {
            }
            column(Choice;Choice)
            {
            }
            column(Round_LineAmount_1;ROUND((LineTotAmt),1))
            {
            }
            column(Form_Code_PurchInvHeader;"Purch. Inv. Header"."Form Code")
            {
            }
            column(Posting_DatePurchInvHeader;"Purch. Inv. Header"."Posting Date")
            {
            }
            column(Description_PaymentTerms;Payment_Terms.Description)
            {
            }
            column(Account_Amount;Account_Amount)
            {
            }
            column(Due_Date_Calculation_PaymentTerms;Payment_Terms."Due Date Calculation")
            {
            }
            column(TAX_TYPE;TAX_TYPE)
            {
            }
            column(Purchase_Header_Form_Code;"Purch. Inv. Header"."Form Code")
            {
            }
            column(Payment_Terms_Due_Date_Calculation;PaymentTerms."Due Date Calculation")
            {
            }

            trigger OnAfterGetRecord();
            begin
                  J:=J+1;
                  IF J>i THEN
                    CurrReport.BREAK;
                  AccountHead:= "Account Head"[J];
                  Account_Amount:=AccountAmount[J];
            end;

            trigger OnPreDataItem();
            begin
                 J:=0;
                PaymentTerms.RESET;
                PaymentTerms.GET("Purch. Inv. Header"."Payment Terms Code");
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    CaptionML = ENU='Options',
                                ENN='Options';
                    field(NoOfCopies;NoOfCopies)
                    {
                        CaptionML = ENU='No. of Copies',
                                    ENN='No. of Copies';
                    }
                    field(ShowInternalInfo;ShowInternalInfo)
                    {
                        CaptionML = ENU='Show Internal Information',
                                    ENN='Show Internal Information';
                    }
                    field(LogInteraction;LogInteraction)
                    {
                        CaptionML = ENU='Log Interaction',
                                    ENN='Log Interaction';
                        Enabled = LogInteractionEnable;
                    }
                    field(Choice;Choice)
                    {
                        Caption = 'Choice';
                    }
                    field(jV;jV)
                    {
                        Caption = 'Journal Voucher';

                        trigger OnValidate();
                        begin

                             IF jV THEN
                               Title:='Journal Voucher'
                             ELSE
                               Title:='Purchase Journal'
                        end;
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit();
        begin
            LogInteractionEnable := TRUE;
        end;

        trigger OnOpenPage();
        begin
            LogInteraction := SegManagement.FindInteractTmplCode(14) <> '';
            LogInteractionEnable := LogInteraction;
        end;
    }

    labels
    {
    }

    trigger OnInitReport();
    begin
        GLSetup.GET;
    end;

    var
        Text000 : TextConst ENU='Purchaser',ENN='Purchaser';
        Text001 : TextConst ENU='Total %1',ENN='Total %1';
        Text002 : TextConst ENU='Total %1 Incl. VAT',ENN='Total %1 Incl. VAT';
        Text003 : TextConst ENU='COPY',ENN='COPY';
        Text004 : TextConst ENU='Purchase - Invoice %1',ENN='Purchase - Invoice %1';
        Text005 : TextConst ENU='Page %1',ENN='Page %1';
        Text006 : TextConst ENU='Total %1 Excl. VAT',ENN='Total %1 Excl. VAT';
        GLSetup : Record "General Ledger Setup";
        SalesSetup : Record "Sales & Receivables Setup";
        CompanyInfo : Record "Company Information";
        ShipmentMethod : Record "Shipment Method";
        PaymentTerms : Record "Payment Terms";
        SalesPurchPerson : Record "Salesperson/Purchaser";
        VATAmountLine : Record "VAT Amount Line" temporary;
        DimSetEntry1 : Record "Dimension Set Entry";
        DimSetEntry2 : Record "Dimension Set Entry";
        RespCenter : Record "Responsibility Center";
        Language : Record Language;
        CurrExchRate : Record "Currency Exchange Rate";
        PurchInvCountPrinted : Codeunit "Purch. Inv.-Printed";
        FormatAddr : Codeunit "Format Address";
        SegManagement : Codeunit SegManagement;
        VendAddr : array [8] of Text[50];
        ShipToAddr : array [8] of Text[50];
        CompanyAddr : array [8] of Text[50];
        PurchaserText : Text[30];
        VATNoText : Text[80];
        ReferenceText : Text[80];
        OrderNoText : Text[80];
        TotalText : Text[50];
        TotalInclVATText : Text[50];
        TotalExclVATText : Text[50];
        MoreLines : Boolean;
        NoOfCopies : Integer;
        NoOfLoops : Integer;
        CopyText : Text[10];
        DimText : Text[120];
        OldDimText : Text[75];
        ShowInternalInfo : Boolean;
        Continue : Boolean;
        LogInteraction : Boolean;
        VALVATBaseLCY : Decimal;
        VALVATAmountLCY : Decimal;
        VALSpecLCYHeader : Text[80];
        VALExchRate : Text[50];
        Text007 : TextConst ENU='VAT Amount Specification in ',ENN='VAT Amount Specification in ';
        Text008 : TextConst ENU='Local Currency',ENN='Local Currency';
        Text009 : TextConst ENU='Exchange rate: %1/%2',ENN='Exchange rate: %1/%2';
        CalculatedExchRate : Decimal;
        Text010 : TextConst ENU='Purchase - Prepayment Invoice %1',ENN='Purchase - Prepayment Invoice %1';
        OutputNo : Integer;
        PricesInclVATtxt : Text[30];
        AllowVATDisctxt : Text[30];
        VATAmountText : Text[30];
        Text011 : TextConst ENU='%1% VAT',ENN='%1% VAT';
        Text012 : TextConst ENU='VAT Amount',ENN='VAT Amount';
        PurchInLineTypeNo : Integer;
        OtherTaxesAmount : Decimal;
        ChargesAmount : Decimal;
        Text13700 : TextConst ENU='Total %1 Incl. Taxes',ENN='Total %1 Incl. Taxes';
        Text13701 : TextConst ENU='Total %1 Excl. Taxes',ENN='Total %1 Excl. Taxes';
        SupplementaryText : Text[30];
        Text16500 : TextConst ENU='Supplementary Invoice',ENN='Supplementary Invoice';
        ServiceTaxEntry : Record "Service Tax Entry";
        ServiceTaxAmt : Decimal;
        ServiceTaxECessAmt : Decimal;
        AppliedServiceTaxAmt : Decimal;
        AppliedServiceTaxECessAmt : Decimal;
        ServiceTaxSHECessAmt : Decimal;
        AppliedServiceTaxSHECessAmt : Decimal;
        i : Integer;
        NewServiceTaxAmt : Decimal;
        NewServiceTaxECessAmt : Decimal;
        NewServiceTaxSHECessAmt : Decimal;
        NewAppliedServiceTaxAmt : Decimal;
        NewAppliedServiceTaxECessAmt : Decimal;
        NewAppliedServiceTaxSHECessAmt : Decimal;
        SumServiceTaxAmt : Decimal;
        SumServiceTaxECessAmt : Decimal;
        SumServiceTaxSHECessAmt : Decimal;
        [InDataSet]
        LogInteractionEnable : Boolean;
        TotalSubTotal : Decimal;
        TotalAmount : Decimal;
        TotalAmountInclVAT : Decimal;
        TotalAmountVAT : Decimal;
        TotalInvoiceDiscountAmount : Decimal;
        TotalPaymentDiscountOnVAT : Decimal;
        CompanyInfoPhoneNoCaptionLbl : TextConst ENU='Phone No.',ENN='Phone No.';
        CompanyInfoEMailCaptionLbl : TextConst ENU='E-Mail',ENN='E-Mail';
        CompanyInfoHomePageCaptionLbl : TextConst ENU='Home Page',ENN='Home Page';
        CompanyInfoVATRegistrationNoCaptionLbl : TextConst ENU='VAT Reg. No.',ENN='VAT Reg. No.';
        CompanyInfoGiroNoCaptionLbl : TextConst ENU='Giro No.',ENN='Giro No.';
        CompanyInfoBankNameCaptionLbl : TextConst ENU='Bank',ENN='Bank';
        CompanyInfoBankAccountNoCaptionLbl : TextConst ENU='Account No.',ENN='Account No.';
        PurchInvHeaderDueDateCaptionLbl : TextConst ENU='Due Date',ENN='Due Date';
        InvoiceNoCaptionLbl : TextConst ENU='Invoice No.',ENN='Invoice No.';
        PurchInvHeaderPostingDateCaptionLbl : TextConst ENU='Posting Date',ENN='Posting Date';
        PageCaptionLbl : TextConst ENU='Page',ENN='Page';
        PaymentTermsDescriptionCaptionLbl : TextConst ENU='Payment Terms',ENN='Payment Terms';
        ShipmentMethodDescriptionCaptionLbl : TextConst ENU='Shipment Method',ENN='Shipment Method';
        DocumentDateCaptionLbl : TextConst ENU='Document Date',ENN='Document Date';
        HeaderDimensionsCaptionLbl : TextConst ENU='Header Dimensions',ENN='Header Dimensions';
        DirectUnitCostCaptionLbl : TextConst ENU='Direct Unit Cost',ENN='Direct Unit Cost';
        PurchInvLineLineDiscountCaptionLbl : TextConst ENU='Discount %',ENN='Discount %';
        AmountCaptionLbl : TextConst ENU='Amount',ENN='Amount';
        SubtotalCaptionLbl : TextConst ENU='Subtotal',ENN='Subtotal';
        PurchInvLineExciseAmountCaptionLbl : TextConst ENU='Excise Amount',ENN='Excise Amount';
        PurchInvLineTaxAmountCaptionLbl : TextConst ENU='Tax Amount',ENN='Tax Amount';
        ServiceTaxAmountCaptionLbl : TextConst ENU='Service Tax Amount',ENN='Service Tax Amount';
        TotalTDSIncludingSHECESSCaptionLbl : TextConst ENU='Total TDS Inclluding eCess',ENN='Total TDS Inclluding eCess';
        WorkTaxAmountCaptionLbl : TextConst ENU='Work Tax Amount',ENN='Work Tax Amount';
        OtherTaxesAmountCaptionLbl : TextConst ENU='Other Taxes Amount',ENN='Other Taxes Amount';
        ChargesAmountCaptionLbl : TextConst ENU='Charges Amount',ENN='Charges Amount';
        ServiceTaxeCessAmountCaptionLbl : TextConst ENU='Service Tax eCess Amount',ENN='Service Tax eCess Amount';
        SvcTaxAmtAppliedCaptionLbl : TextConst ENU='Svc Tax Amt (Applied)',ENN='Svc Tax Amt (Applied)';
        SvcTaxeCessAmtAppliedCaptionLbl : TextConst ENU='Svc Tax eCess Amt (Applied)',ENN='Svc Tax eCess Amt (Applied)';
        ServiceTaxSHECessAmountCaptionLbl : TextConst ENU='Service Tax SHECess Amount',ENN='Service Tax SHECess Amount';
        LineAmtInvDiscountAmtAmtInclVATCaptionLbl : TextConst ENU='Payment Discount on VAT',ENN='Payment Discount on VAT';
        AllowInvDiscountCaptionLbl : TextConst ENU='Allow Invoice Discount',ENN='Allow Invoice Discount';
        LineDimensionsCaptionLbl : TextConst ENU='Line Dimensions',ENN='Line Dimensions';
        VATAmountLineVATCaptionLbl : TextConst ENU='VAT %',ENN='VAT %';
        VATAmountLineVATBaseVTCCaptionLbl : TextConst ENU='VAT Base',ENN='VAT Base';
        VATAmtLineVATAmtVTCCaptionLbl : TextConst ENU='VAT Amount',ENN='VAT Amount';
        VATAmountSpecificationCaptionLbl : TextConst ENU='VAT Amount Specification',ENN='VAT Amount Specification';
        VATAmtLineInvDiscBaseAmtVTCCaptionLbl : TextConst ENU='Inv. Disc. Base Amount',ENN='Inv. Disc. Base Amount';
        VATAmtLineLineAmtVTCCaptionLbl : TextConst ENU='Line Amount',ENN='Line Amount';
        VATAmountLineVATIdentifierCaptionLbl : TextConst ENU='VAT Identifier',ENN='VAT Identifier';
        VATAmountLineVATBaseVTC1CaptionLbl : TextConst ENU='Total',ENN='Total';
        ShiptoAddressCaptionLbl : TextConst ENU='Ship-to Address',ENN='Ship-to Address';
        InvDiscountAmountCaptionLbl : TextConst ENU='Invoice Discount Amount',ENN='Invoice Discount Amount';
        "-NAVIN-" : Integer;
        StructureLineDetails : Record "Posted Str Order Line Details";
        TotalTaxAmount : Decimal;
        LineAmt : Decimal;
        LineTotAmt : Decimal;
        ExciseAmount : Decimal;
        Charges : Decimal;
        Othertaxes : Decimal;
        SalesTax : Decimal;
        VATAmount : Decimal;
        ServiceTax : Decimal;
        Inward_Date : Date;
        Choice : Option Inv,Jnl;
        Dept : Text[30];
        "Dimension Value" : Record "Dimension Value";
        "Fixed Asset" : Record "Fixed Asset";
        jV : Boolean;
        Title : Text[30];
        PurchLine : Record "Purch. Inv. Line";
        Payment_Terms : Record "Payment Terms";
        GPS : Record "General Posting Setup";
        "Account Head" : array [10] of Text[75];
        Item_Desc : Text[50];
        FA : Record "Fixed Asset";
        "G/L" : Record "G/L Account";
        SUPPLIER_NAME_M_s__CaptionLbl : Label 'SUPPLIER NAME M/s .';
        STATIONCaptionLbl : Label 'STATION';
        BILL_No_CaptionLbl : Label 'BILL No.';
        BILL_DATECaptionLbl : Label 'BILL DATE';
        BILL_AMT__Rs_CaptionLbl : Label 'BILL AMT. Rs.';
        ACCOUNT_HEADCaptionLbl : Label 'ACCOUNT HEAD';
        ITEM_DESCRIPTIONCaptionLbl : Label 'ITEM DESCRIPTION';
        FORM_S_DUECaptionLbl : Label 'FORM''S DUE';
        PAYMENT_DETAILSCaptionLbl : Label 'PAYMENT DETAILS';
        CREDIT_DAYSCaptionLbl : Label 'CREDIT DAYS';
        FRIEGHT_PAID_BY_USCaptionLbl : Label 'FRIEGHT PAID BY US';
        MANAGER_CaptionLbl : Label '"MANAGER "';
        DatedCaptionLbl : Label 'Dated';
        EmptyStringCaptionLbl : Label '.............................';
        CompanyInfo__Phone_No__CaptionLbl : Label 'Phone No.';
        CompanyInfo__Fax_No__CaptionLbl : Label 'Fax No.';
        CompanyInfo__Bank_Name_CaptionLbl : Label 'Bank';
        CompanyInfo__Bank_Account_No__CaptionLbl : Label 'Account No.';
        Invoice_No_CaptionLbl : Label 'Invoice No.';
        Header_DimensionsCaptionLbl : Label 'Header Dimensions';
        Direct_Unit_CostCaptionLbl : Label 'Direct Unit Cost';
        Purch__Inv__Line__Line_Discount___CaptionLbl : Label 'Disc. %';
        GlEntryGRec : Record "G/L Entry";
        "G\L" : Record "G/L Account";
        J : Integer;
        "-----Sundar-----" : Integer;
        AccountHead : Text[75];
        AccountAmount : array [10] of Decimal;
        Account_Amount : Decimal;
        Old_track : Integer;
        Account_OLD : Code[10];
        TAX_TYPE : Text[20];
        ServiceTaxSBCAmount : Decimal;
        AppliedServiceTaxSBCAmount : Decimal;
        SumServiceTaxSBCAmount : Decimal;
        ServTaxSBCAmtCaptionLbl : Label 'SBC Amount';
        SvcTaxSBCAmtAppliedCaptionLbl : Label 'SBC Amt (Applied)';
        KKCessAmount : Decimal;
        AppliedKKCessAmount : Decimal;
        SumKKCessAmount : Decimal;
        KKCessAmtCaptionLbl : Label 'KK Cess Amount';
        KKCessAmtAppliedCaptionLbl : Label 'KK Cess Amt (Applied)';

    [LineStart(13972)]
    local procedure DocumentCaption() : Text[250];
    begin
        IF "Purch. Inv. Header"."Prepayment Invoice" THEN
          EXIT(Text010);
        EXIT(Text004);
    end;

    [LineStart(13977)]
    procedure InitializeRequest(NewNoOfCopies : Integer;NewShowInternalInfo : Boolean;NewLogInteraction : Boolean);
    begin
        NoOfCopies := NewNoOfCopies;
        ShowInternalInfo := NewShowInternalInfo;
        LogInteraction := NewLogInteraction;
    end;
}

