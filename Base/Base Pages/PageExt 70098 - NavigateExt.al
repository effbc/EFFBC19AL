pageextension 70098 NavigateExt extends Navigate
{
    // version NAVW19.00.00.51640,NAVIN9.00.00.51640,TFS223871,MI1.0

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.


        //Unsupported feature: Change Name on "Control 3". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 3". Please convert manually.


        //Unsupported feature: Change Name on "Control 1". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1". Please convert manually.


        //Unsupported feature: Change Name on "Control 18". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 18". Please convert manually.


        //Unsupported feature: Change Name on "Control 11". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 11". Please convert manually.


        //Unsupported feature: Change Name on "Control 13". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 13". Please convert manually.


        //Unsupported feature: Change ImplicitType on "SerialNoFilter(Control 5)". Please convert manually.


        //Unsupported feature: Change ImplicitType on "LotNoFilter(Control 6)". Please convert manually.

        modify("Control 16")
        {

            //Unsupported feature: Change Name on "Control 16". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 24". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 24". Please convert manually.


        //Unsupported feature: Change Name on "Control 22". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 22". Please convert manually.


        //Unsupported feature: Change Name on "Control 17". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 17". Please convert manually.


        //Unsupported feature: Change DrillDown on "Control 19". Please convert manually.


        //Unsupported feature: Change Name on "Control 19". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 19". Please convert manually.


        //Unsupported feature: Change Name on "Control 7". Please convert manually.


        //Unsupported feature: Change ImplicitType on "DocType(Control 8)". Please convert manually.


        //Unsupported feature: Change ImplicitType on "SourceType(Control 10)". Please convert manually.


        //Unsupported feature: Change ImplicitType on "SourceNo(Control 12)". Please convert manually.


        //Unsupported feature: Change ImplicitType on "SourceName(Control 14)". Please convert manually.

    }
    actions
    {

        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.

        modify(Show)
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify(Find)
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify(Print)
        {

            //Unsupported feature: Change Ellipsis on "Print(Action 34)". Please convert manually.

            Promoted = true;
            PromotedIsBig = true;
        }
        modify(FindByDocument)
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify(FindByBusinessContact)
        {
            Promoted = true;
            PromotedIsBig = true;
        }
        modify(FindByItemReference)
        {
            Promoted = true;
            PromotedIsBig = true;
        }
    }

    //Unsupported feature: PropertyModification on "Print(Action 34).OnAction.ItemTrackingNavigate(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Print : 6529;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Print : "Item Tracking Navigate";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Print(Action 34).OnAction.DocumentEntries(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Print : 35;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Print : "Document Entries";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Control 11.OnLookup.Vend(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Control 11.OnLookup.Vend : 23;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Control 11.OnLookup.Vend : Vendor;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Control 11.OnLookup.Cust(Variable 1003)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Control 11.OnLookup.Cust : 18;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Control 11.OnLookup.Cust : Customer;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SerialNoFilter(Control 5).OnLookup.SerialNoInformationList(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SerialNoFilter : 6509;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SerialNoFilter : "Serial No. Information List";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "LotNoFilter(Control 6).OnLookup.LotNoInformationList(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //LotNoFilter : 6508;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LotNoFilter : "Lot No. Information List";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "FindExtRecords(PROCEDURE 8).VendLedgEntry2(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //FindExtRecords : 25;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //FindExtRecords : "Vendor Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GetPageId(PROCEDURE 29).MiniPagesMapping(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GetPageId : 1305;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GetPageId : "Mini Pages Mapping";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Cust(Variable 1023)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Cust : 18;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Cust : Customer;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Vend(Variable 1024)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Vend : 23;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Vend : Vendor;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SOSalesHeader(Variable 1083)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SOSalesHeader : 36;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SOSalesHeader : "Sales Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SISalesHeader(Variable 1084)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SISalesHeader : 36;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SISalesHeader : "Sales Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SROSalesHeader(Variable 1086)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SROSalesHeader : 36;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SROSalesHeader : "Sales Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SCMSalesHeader(Variable 1085)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SCMSalesHeader : 36;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SCMSalesHeader : "Sales Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SalesShptHeader(Variable 1025)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SalesShptHeader : 110;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SalesShptHeader : "Sales Shipment Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SalesInvHeader(Variable 1026)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SalesInvHeader : 112;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SalesInvHeader : "Sales Invoice Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReturnRcptHeader(Variable 1027)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReturnRcptHeader : 6660;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReturnRcptHeader : "Return Receipt Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SalesCrMemoHeader(Variable 1028)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SalesCrMemoHeader : 114;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SalesCrMemoHeader : "Sales Cr.Memo Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SOServHeader(Variable 1091)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SOServHeader : 5900;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SOServHeader : "Service Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SIServHeader(Variable 1090)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SIServHeader : 5900;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SIServHeader : "Service Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SCMServHeader(Variable 1059)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SCMServHeader : 5900;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SCMServHeader : "Service Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ServShptHeader(Variable 1058)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ServShptHeader : 5990;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ServShptHeader : "Service Shipment Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ServInvHeader(Variable 1057)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ServInvHeader : 5992;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ServInvHeader : "Service Invoice Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ServCrMemoHeader(Variable 1022)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ServCrMemoHeader : 5994;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ServCrMemoHeader : "Service Cr.Memo Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "IssuedReminderHeader(Variable 1029)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //IssuedReminderHeader : 297;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //IssuedReminderHeader : "Issued Reminder Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "IssuedFinChrgMemoHeader(Variable 1030)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //IssuedFinChrgMemoHeader : 304;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //IssuedFinChrgMemoHeader : "Issued Fin. Charge Memo Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "PurchRcptHeader(Variable 1031)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PurchRcptHeader : 120;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PurchRcptHeader : "Purch. Rcpt. Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "PurchInvHeader(Variable 1032)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PurchInvHeader : 122;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PurchInvHeader : "Purch. Inv. Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReturnShptHeader(Variable 1033)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReturnShptHeader : 6650;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReturnShptHeader : "Return Shipment Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "PurchCrMemoHeader(Variable 1034)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PurchCrMemoHeader : 124;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PurchCrMemoHeader : "Purch. Cr. Memo Hdr.";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ProductionOrderHeader(Variable 1035)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ProductionOrderHeader : 5405;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ProductionOrderHeader : "Production Order";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "PostedAssemblyHeader(Variable 1065)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PostedAssemblyHeader : 910;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PostedAssemblyHeader : "Posted Assembly Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TransShptHeader(Variable 1037)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TransShptHeader : 5744;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TransShptHeader : "Transfer Shipment Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TransRcptHeader(Variable 1038)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TransRcptHeader : 5746;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TransRcptHeader : "Transfer Receipt Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "PostedWhseRcptLine(Variable 1087)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PostedWhseRcptLine : 7319;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PostedWhseRcptLine : "Posted Whse. Receipt Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "PostedWhseShptLine(Variable 1088)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PostedWhseShptLine : 7323;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PostedWhseShptLine : "Posted Whse. Shipment Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GLEntry(Variable 1039)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GLEntry : 17;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GLEntry : "G/L Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "VATEntry(Variable 1040)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //VATEntry : 254;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //VATEntry : "VAT Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CustLedgEntry(Variable 1041)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CustLedgEntry : 21;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CustLedgEntry : "Cust. Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "DtldCustLedgEntry(Variable 1042)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //DtldCustLedgEntry : 379;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DtldCustLedgEntry : "Detailed Cust. Ledg. Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "VendLedgEntry(Variable 1043)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //VendLedgEntry : 25;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //VendLedgEntry : "Vendor Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "DtldVendLedgEntry(Variable 1044)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //DtldVendLedgEntry : 380;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DtldVendLedgEntry : "Detailed Vendor Ledg. Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ItemLedgEntry(Variable 1045)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ItemLedgEntry : 32;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ItemLedgEntry : "Item Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "PhysInvtLedgEntry(Variable 1046)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PhysInvtLedgEntry : 281;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PhysInvtLedgEntry : "Phys. Inventory Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ResLedgEntry(Variable 1047)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ResLedgEntry : 203;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ResLedgEntry : "Res. Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "JobLedgEntry(Variable 1048)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //JobLedgEntry : 169;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //JobLedgEntry : "Job Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "JobWIPEntry(Variable 1099)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //JobWIPEntry : 1004;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //JobWIPEntry : "Job WIP Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "JobWIPGLEntry(Variable 1100)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //JobWIPGLEntry : 1005;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //JobWIPGLEntry : "Job WIP G/L Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ValueEntry(Variable 1049)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ValueEntry : 5802;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ValueEntry : "Value Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "BankAccLedgEntry(Variable 1050)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //BankAccLedgEntry : 271;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //BankAccLedgEntry : "Bank Account Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CheckLedgEntry(Variable 1051)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CheckLedgEntry : 272;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CheckLedgEntry : "Check Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ReminderEntry(Variable 1052)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ReminderEntry : 300;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReminderEntry : "Reminder/Fin. Charge Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "FALedgEntry(Variable 1053)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //FALedgEntry : 5601;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //FALedgEntry : "FA Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "MaintenanceLedgEntry(Variable 1054)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //MaintenanceLedgEntry : 5625;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //MaintenanceLedgEntry : "Maintenance Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "InsuranceCovLedgEntry(Variable 1055)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //InsuranceCovLedgEntry : 5629;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //InsuranceCovLedgEntry : "Ins. Coverage Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CapacityLedgEntry(Variable 1056)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CapacityLedgEntry : 5832;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CapacityLedgEntry : "Capacity Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ServLedgerEntry(Variable 1063)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ServLedgerEntry : 5907;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ServLedgerEntry : "Service Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "WarrantyLedgerEntry(Variable 1064)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //WarrantyLedgerEntry : 5908;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //WarrantyLedgerEntry : "Warranty Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "WhseEntry(Variable 1089)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //WhseEntry : 7312;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //WhseEntry : "Warehouse Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TempRecordBuffer(Variable 1060)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TempRecordBuffer : 6529;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TempRecordBuffer : "Record Buffer";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CostEntry(Variable 1098)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CostEntry : 1104;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CostEntry : "Cost Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "IncomingDocument(Variable 1101)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //IncomingDocument : 130;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //IncomingDocument : "Incoming Document";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GSTTdsTcsEntry(Variable 1500024)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GSTTdsTcsEntry : 16469;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GSTTdsTcsEntry : "GST TDS/TCS Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ProvisionalEntry(Variable 1500025)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ProvisionalEntry : 16427;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ProvisionalEntry : "Provisional Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ApplicationManagement(Variable 1066)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ApplicationManagement : 1;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ApplicationManagement : ApplicationManagement;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ItemTrackingNavigateMgt(Variable 1159)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ItemTrackingNavigateMgt : 6529;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ItemTrackingNavigateMgt : "Item Tracking Navigate Mgt.";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ContactType(Variable 1078)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ContactType :  ,Vendor,Customer;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ContactType : " ",Vendor,Customer;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TaxEntry(Variable 1500013)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TaxEntry : 13700;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TaxEntry : "Tax Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ExciseEntry(Variable 1500012)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ExciseEntry : 13712;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ExciseEntry : "Excise Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "RG23APartI(Variable 1500011)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //RG23APartI : 13719;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RG23APartI : "RG 23 A Part I";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "RG23CPartI(Variable 1500010)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //RG23CPartI : 13721;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RG23CPartI : "RG 23 C Part I";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TDSEntry(Variable 1500009)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TDSEntry : 13729;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TDSEntry : "TDS Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "RG23APartII(Variable 1500008)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //RG23APartII : 13720;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RG23APartII : "RG 23 A Part II";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "RG23CPartII(Variable 1500007)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //RG23CPartII : 13722;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RG23CPartII : "RG 23 C Part II";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ServiceTaxEntry(Variable 1500006)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ServiceTaxEntry : 16473;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ServiceTaxEntry : "Service Tax Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "PLA(Variable 1500005)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PLA : 13723;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PLA : "PLA Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TCSEntry(Variable 1500004)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TCSEntry : 16514;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TCSEntry : "TCS Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "DetailedTaxEntry(Variable 1500003)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //DetailedTaxEntry : 16522;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DetailedTaxEntry : "Detailed Tax Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "RG23D(Variable 1500002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //RG23D : 16537;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RG23D : "RG 23 D";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "FBTEntry(Variable 1500001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //FBTEntry : 16541;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //FBTEntry : "FBT Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SvcTaxDistribution(Variable 1500000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SvcTaxDistribution : 16576;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SvcTaxDistribution : "Service Tax Distribution";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "PostedCapitalizeCWIPHeader(Variable 1500014)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PostedCapitalizeCWIPHeader : 16599;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PostedCapitalizeCWIPHeader : "Posted Capitalize CWIP Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GSTLedgerEntry(Variable 1500015)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GSTLedgerEntry : 16418;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GSTLedgerEntry : "GST Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "DetailedGSTLedgerEntry(Variable 1500016)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //DetailedGSTLedgerEntry : 16419;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DetailedGSTLedgerEntry : "Detailed GST Ledger Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ServiceTransferShptHeader(Variable 1500017)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ServiceTransferShptHeader : 16439;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ServiceTransferShptHeader : "Service Transfer Shpt. Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ServiceTransferRcptHeader(Variable 1500018)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ServiceTransferRcptHeader : 16441;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ServiceTransferRcptHeader : "Service Transfer Rcpt. Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "DetailedCrAdjstmntEntry(Variable 1500019)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //DetailedCrAdjstmntEntry : 16451;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DetailedCrAdjstmntEntry : "Detailed Cr. Adjstmnt. Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "PostedGSTDistributionHeader(Variable 1500021)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PostedGSTDistributionHeader : 16452;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PostedGSTDistributionHeader : "Posted GST Distribution Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "DetailedGSTDistEntry(Variable 1500020)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //DetailedGSTDistEntry : 16454;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DetailedGSTDistEntry : "Detailed GST Dist. Entry";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "PostedJnlBankCharges(Variable 1500022)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PostedJnlBankCharges : 13735;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PostedJnlBankCharges : "Posted Jnl. Bank Charges";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "PostedGSTLiabilityAdj(Variable 1500023)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //PostedGSTLiabilityAdj : 16457;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PostedGSTLiabilityAdj : "Posted GST Liability Adj.";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "FindBasedOn(Variable 1102)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //FindBasedOn : Document,Business Contact,Item Reference;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //FindBasedOn : Document,"Business Contact","Item Reference";
    //Variable type has not been exported.

    var
        QualityItemLedgEntry: Record "Quality Item Ledger Entry";
        QualityLedgEntry: Record "Quality Ledger Entry";
        PostedMaterialIssueHeader: Record "Posted Material Issues Header";


    //Unsupported feature: CodeModification on "FindRecords(PROCEDURE 2)". Please convert manually.

    //procedure FindRecords();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    Window.OPEN(Text002);
    RESET;
    DELETEALL;
    "Entry No." := 0;
    FindIncomingDocumentRecords;
    CheckReadPermissionToInsertDocEntry;;
    DocExists := FINDFIRST;

    SetSource(0D,'','',0,'');
    #10..156
            PostedWhseRcptLine."Posting Date",FORMAT("Table Name"),PostedWhseRcptLine."No.",
            2,'');
        END;
      END ELSE BEGIN
        IF DocNoFilter <> '' THEN
          IF PostingDateFilter = '' THEN
    #163..172
    IF UpdateForm THEN
      UpdateFormAfterFindRecords;
    Window.CLOSE;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
    IF SalesShptHeader.READPERMISSION THEN BEGIN
      SalesShptHeader.RESET;
      SalesShptHeader.SETFILTER("No.",DocNoFilter);
      SalesShptHeader.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Sales Shipment Header",0,Text005,SalesShptHeader.COUNT);
    END;
    IF SalesInvHeader.READPERMISSION THEN BEGIN
      SalesInvHeader.RESET;
      SalesInvHeader.SETFILTER("No.",DocNoFilter);
      SalesInvHeader.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Sales Invoice Header",0,Text003,SalesInvHeader.COUNT);
    END;
    IF ReturnRcptHeader.READPERMISSION THEN BEGIN
      ReturnRcptHeader.RESET;
      ReturnRcptHeader.SETFILTER("No.",DocNoFilter);
      ReturnRcptHeader.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Return Receipt Header",0,Text017,ReturnRcptHeader.COUNT);
    END;
    IF SalesCrMemoHeader.READPERMISSION THEN BEGIN
      SalesCrMemoHeader.RESET;
      SalesCrMemoHeader.SETFILTER("No.",DocNoFilter);
      SalesCrMemoHeader.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Sales Cr.Memo Header",0,Text004,SalesCrMemoHeader.COUNT);
    END;
    IF ServShptHeader.READPERMISSION THEN BEGIN
      ServShptHeader.RESET;
      ServShptHeader.SETFILTER("No.",DocNoFilter);
      ServShptHeader.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Service Shipment Header",0,sText005,ServShptHeader.COUNT);
    END;
    IF ServInvHeader.READPERMISSION THEN BEGIN
      ServInvHeader.RESET;
      ServInvHeader.SETFILTER("No.",DocNoFilter);
      ServInvHeader.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Service Invoice Header",0,sText003,ServInvHeader.COUNT);
    END;
    IF ServCrMemoHeader.READPERMISSION THEN BEGIN
      ServCrMemoHeader.RESET;
      ServCrMemoHeader.SETFILTER("No.",DocNoFilter);
      ServCrMemoHeader.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Service Cr.Memo Header",0,sText004,ServCrMemoHeader.COUNT);
    END;
    IF IssuedReminderHeader.READPERMISSION THEN BEGIN
      IssuedReminderHeader.RESET;
      IssuedReminderHeader.SETFILTER("No.",DocNoFilter);
      IssuedReminderHeader.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Issued Reminder Header",0,Text006,IssuedReminderHeader.COUNT);
    END;
    IF IssuedFinChrgMemoHeader.READPERMISSION THEN BEGIN
      IssuedFinChrgMemoHeader.RESET;
      IssuedFinChrgMemoHeader.SETFILTER("No.",DocNoFilter);
      IssuedFinChrgMemoHeader.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Issued Fin. Charge Memo Header",0,Text007,
        IssuedFinChrgMemoHeader.COUNT);
    END;
    IF PurchRcptHeader.READPERMISSION THEN BEGIN
      PurchRcptHeader.RESET;
      PurchRcptHeader.SETFILTER("No.",DocNoFilter);
      PurchRcptHeader.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Purch. Rcpt. Header",0,Text010,PurchRcptHeader.COUNT);
    END;
    IF PurchInvHeader.READPERMISSION THEN BEGIN
      PurchInvHeader.RESET;
      PurchInvHeader.SETFILTER("No.",DocNoFilter);
      PurchInvHeader.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Purch. Inv. Header",0,Text008,PurchInvHeader.COUNT);
    END;
    IF ReturnShptHeader.READPERMISSION THEN BEGIN
      ReturnShptHeader.RESET;
      ReturnShptHeader.SETFILTER("No.",DocNoFilter);
      ReturnShptHeader.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Return Shipment Header",0,Text018,ReturnShptHeader.COUNT);
    END;
    IF PurchCrMemoHeader.READPERMISSION THEN BEGIN
      PurchCrMemoHeader.RESET;
      PurchCrMemoHeader.SETFILTER("No.",DocNoFilter);
      PurchCrMemoHeader.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Purch. Cr. Memo Hdr.",0,Text009,PurchCrMemoHeader.COUNT);
    END;
    IF ProductionOrderHeader.READPERMISSION THEN BEGIN
      ProductionOrderHeader.RESET;
      ProductionOrderHeader.SETRANGE(
        Status,
        ProductionOrderHeader.Status::Released,
        ProductionOrderHeader.Status::Finished);
      ProductionOrderHeader.SETFILTER("No.",DocNoFilter);
      InsertIntoDocEntry(
        DATABASE::"Production Order",0,Text99000000,ProductionOrderHeader.COUNT);
    END;
    IF PostedAssemblyHeader.READPERMISSION THEN BEGIN
      PostedAssemblyHeader.RESET;
      PostedAssemblyHeader.SETFILTER("No.",DocNoFilter);
      InsertIntoDocEntry(
        DATABASE::"Posted Assembly Header",0,Text025,PostedAssemblyHeader.COUNT);
    END;
    IF TransShptHeader.READPERMISSION THEN BEGIN
      TransShptHeader.RESET;
      TransShptHeader.SETFILTER("No.",DocNoFilter);
      TransShptHeader.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Transfer Shipment Header",0,Text019,TransShptHeader.COUNT);
    END;
    IF TransRcptHeader.READPERMISSION THEN BEGIN
      TransRcptHeader.RESET;
      TransRcptHeader.SETFILTER("No.",DocNoFilter);
      TransRcptHeader.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Transfer Receipt Header",0,Text020,TransRcptHeader.COUNT);
    END;
      //MI1.0 >> BEGIN
      IF PostedMaterialIssueHeader.READPERMISSION THEN BEGIN
        PostedMaterialIssueHeader.RESET;
        PostedMaterialIssueHeader.SETFILTER("No.",DocNoFilter);
        PostedMaterialIssueHeader.SETFILTER("Posting Date",PostingDateFilter);
        InsertIntoDocEntry(
          DATABASE::"Posted Material Issues Header",0,Text020,PostedMaterialIssueHeader.COUNT);
      END;
      //MI1.0 << END
    IF PostedWhseShptLine.READPERMISSION THEN BEGIN
      PostedWhseShptLine.RESET;
      PostedWhseShptLine.SETCURRENTKEY("Posted Source No.","Posting Date");
      PostedWhseShptLine.SETFILTER("Posted Source No.",DocNoFilter);
      PostedWhseShptLine.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Posted Whse. Shipment Line",0,
        PostedWhseShptLine.TABLECAPTION,PostedWhseShptLine.COUNT);
    END;
    IF PostedWhseRcptLine.READPERMISSION THEN BEGIN
      PostedWhseRcptLine.RESET;
      PostedWhseRcptLine.SETCURRENTKEY("Posted Source No.","Posting Date");
      PostedWhseRcptLine.SETFILTER("Posted Source No.",DocNoFilter);
      PostedWhseRcptLine.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Posted Whse. Receipt Line",0,
        PostedWhseRcptLine.TABLECAPTION,PostedWhseRcptLine.COUNT);
    END;
    IF PostedCapitalizeCWIPHeader.READPERMISSION THEN BEGIN
      PostedCapitalizeCWIPHeader.RESET;
      PostedCapitalizeCWIPHeader.SETFILTER("No.",DocNoFilter);
      PostedCapitalizeCWIPHeader.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Posted Capitalize CWIP Header",0,PostedCapitalizeCWIPHeader.TABLECAPTION,PostedCapitalizeCWIPHeader.COUNT);
    END;
    IF GLEntry.READPERMISSION THEN BEGIN
      GLEntry.RESET;
      GLEntry.SETCURRENTKEY("Document No.","Posting Date");
      GLEntry.SETFILTER("Document No.",DocNoFilter);
      GLEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"G/L Entry",0,GLEntry.TABLECAPTION,GLEntry.COUNT);
    END;
    IF VATEntry.READPERMISSION THEN BEGIN
      VATEntry.RESET;
      VATEntry.SETCURRENTKEY("Document No.","Posting Date");
      VATEntry.SETFILTER("Document No.",DocNoFilter);
      VATEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"VAT Entry",0,VATEntry.TABLECAPTION,VATEntry.COUNT);
    END;
    IF ExciseEntry.READPERMISSION THEN BEGIN
      ExciseEntry.RESET;
      ExciseEntry.SETCURRENTKEY("Document No.","Posting Date");
      ExciseEntry.SETFILTER("Document No.",DocNoFilter);
      ExciseEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Excise Entry",0,ExciseEntry.TABLENAME,ExciseEntry.COUNT);
    END;
    IF TaxEntry.READPERMISSION THEN BEGIN
      TaxEntry.RESET;
      TaxEntry.SETCURRENTKEY("Document No.","Posting Date");
      TaxEntry.SETFILTER("Document No.",DocNoFilter);
      TaxEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Tax Entry",0,TaxEntry.TABLENAME,TaxEntry.COUNT);
    END;

    IF TDSEntry.READPERMISSION THEN BEGIN
      TDSEntry.RESET;
      TDSEntry.SETCURRENTKEY("Document No.","Posting Date");
      TDSEntry.SETFILTER("Document No.",DocNoFilter);
      TDSEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"TDS Entry",0,TDSEntry.TABLENAME,TDSEntry.COUNT);
    END;

    IF TCSEntry.READPERMISSION THEN BEGIN
      TCSEntry.RESET;
      TCSEntry.SETCURRENTKEY("Document No.","Posting Date");
      TCSEntry.SETFILTER("Document No.",DocNoFilter);
      TCSEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"TCS Entry",0,TCSEntry.TABLENAME,TCSEntry.COUNT);
    END;

    IF FBTEntry.READPERMISSION THEN BEGIN
      FBTEntry.RESET;
      FBTEntry.SETCURRENTKEY("Document No.","Posting Date");
      FBTEntry.SETFILTER("Document No.",DocNoFilter);
      FBTEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"FBT Entry",0,FBTEntry.TABLENAME,FBTEntry.COUNT);
    END;

    IF RG23APartI.READPERMISSION THEN BEGIN
      RG23APartI.RESET;
      RG23APartI.SETCURRENTKEY("Document No.","Posting Date");
      RG23APartI.SETFILTER("Document No.",DocNoFilter);
      RG23APartI.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"RG 23 A Part I",0,RG23APartI.TABLENAME,RG23APartI.COUNT);
    END;

    IF RG23CPartI.READPERMISSION THEN BEGIN
      RG23CPartI.RESET;
      RG23CPartI.SETCURRENTKEY("Document No.","Posting Date");
      RG23CPartI.SETFILTER("Document No.",DocNoFilter);
      RG23CPartI.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"RG 23 C Part I",0,RG23CPartI.TABLENAME,RG23CPartI.COUNT);
    END;

    IF RG23APartII.READPERMISSION THEN BEGIN
      RG23APartII.RESET;
      RG23APartII.SETCURRENTKEY("Document No.","Posting Date");
      RG23APartII.SETFILTER("Document No.",DocNoFilter);
      RG23APartII.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"RG 23 A Part II",0,RG23APartII.TABLENAME,RG23APartII.COUNT);
    END;
    IF RG23CPartII.READPERMISSION THEN BEGIN
      RG23CPartII.RESET;
      RG23CPartII.SETCURRENTKEY("Document No.","Posting Date");
      RG23CPartII.SETFILTER("Document No.",DocNoFilter);
      RG23CPartII.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"RG 23 C Part II",0,RG23CPartII.TABLENAME,RG23CPartII.COUNT);
    END;
    IF PLA.READPERMISSION THEN BEGIN
      PLA.RESET;
      PLA.SETCURRENTKEY("Document No.","Posting Date");
      PLA.SETFILTER("Document No.",DocNoFilter);
      PLA.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"PLA Entry",0,PLA.TABLENAME,PLA.COUNT);
    END;
    IF ServiceTaxEntry.READPERMISSION THEN BEGIN
      ServiceTaxEntry.RESET;
      ServiceTaxEntry.SETCURRENTKEY("Document No.","Posting Date");
      ServiceTaxEntry.SETFILTER("Document No.",DocNoFilter);
      ServiceTaxEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Service Tax Entry",0,ServiceTaxEntry.TABLENAME,ServiceTaxEntry.COUNT);
    END;
    IF CustLedgEntry.READPERMISSION THEN BEGIN
      CustLedgEntry.RESET;
      CustLedgEntry.SETCURRENTKEY("Document No.");
      CustLedgEntry.SETFILTER("Document No.",DocNoFilter);
      CustLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Cust. Ledger Entry",0,CustLedgEntry.TABLECAPTION,CustLedgEntry.COUNT);
    END;
    IF DtldCustLedgEntry.READPERMISSION THEN BEGIN
      DtldCustLedgEntry.RESET;
      DtldCustLedgEntry.SETCURRENTKEY("Document No.");
      DtldCustLedgEntry.SETFILTER("Document No.",DocNoFilter);
      DtldCustLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Detailed Cust. Ledg. Entry",0,DtldCustLedgEntry.TABLECAPTION,DtldCustLedgEntry.COUNT);
    END;
    IF ReminderEntry.READPERMISSION THEN BEGIN
      ReminderEntry.RESET;
      ReminderEntry.SETCURRENTKEY(Type,"No.");
      ReminderEntry.SETFILTER("No.",DocNoFilter);
      ReminderEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Reminder/Fin. Charge Entry",0,ReminderEntry.TABLECAPTION,ReminderEntry.COUNT);
    END;
    IF VendLedgEntry.READPERMISSION THEN BEGIN
      VendLedgEntry.RESET;
      VendLedgEntry.SETCURRENTKEY("Document No.");
      VendLedgEntry.SETFILTER("Document No.",DocNoFilter);
      VendLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Vendor Ledger Entry",0,VendLedgEntry.TABLECAPTION,VendLedgEntry.COUNT);
    END;
    IF DtldVendLedgEntry.READPERMISSION THEN BEGIN
      DtldVendLedgEntry.RESET;
      DtldVendLedgEntry.SETCURRENTKEY("Document No.");
      DtldVendLedgEntry.SETFILTER("Document No.",DocNoFilter);
      DtldVendLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Detailed Vendor Ledg. Entry",0,DtldVendLedgEntry.TABLECAPTION,DtldVendLedgEntry.COUNT);
    END;
    IF ItemLedgEntry.READPERMISSION THEN BEGIN
      ItemLedgEntry.RESET;
      ItemLedgEntry.SETCURRENTKEY("Document No.");
      ItemLedgEntry.SETFILTER("Document No.",DocNoFilter);
      ItemLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Item Ledger Entry",0,ItemLedgEntry.TABLECAPTION,ItemLedgEntry.COUNT);
    END;
    IF ValueEntry.READPERMISSION THEN BEGIN
      ValueEntry.RESET;
      ValueEntry.SETCURRENTKEY("Document No.");
      ValueEntry.SETFILTER("Document No.",DocNoFilter);
      ValueEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Value Entry",0,ValueEntry.TABLECAPTION,ValueEntry.COUNT);
    END;
    IF PhysInvtLedgEntry.READPERMISSION THEN BEGIN
      PhysInvtLedgEntry.RESET;
      PhysInvtLedgEntry.SETCURRENTKEY("Document No.","Posting Date");
      PhysInvtLedgEntry.SETFILTER("Document No.",DocNoFilter);
      PhysInvtLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Phys. Inventory Ledger Entry",0,PhysInvtLedgEntry.TABLECAPTION,PhysInvtLedgEntry.COUNT);
    END;
    IF ResLedgEntry.READPERMISSION THEN BEGIN
      ResLedgEntry.RESET;
      ResLedgEntry.SETCURRENTKEY("Document No.","Posting Date");
      ResLedgEntry.SETFILTER("Document No.",DocNoFilter);
      ResLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Res. Ledger Entry",0,ResLedgEntry.TABLECAPTION,ResLedgEntry.COUNT);
    END;
    FindJobRecords;
    IF BankAccLedgEntry.READPERMISSION THEN BEGIN
      BankAccLedgEntry.RESET;
      BankAccLedgEntry.SETCURRENTKEY("Document No.","Posting Date");
      BankAccLedgEntry.SETFILTER("Document No.",DocNoFilter);
      BankAccLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Bank Account Ledger Entry",0,BankAccLedgEntry.TABLECAPTION,BankAccLedgEntry.COUNT);
    END;
    IF CheckLedgEntry.READPERMISSION THEN BEGIN
      CheckLedgEntry.RESET;
      CheckLedgEntry.SETCURRENTKEY("Document No.","Posting Date");
      CheckLedgEntry.SETFILTER("Document No.",DocNoFilter);
      CheckLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Check Ledger Entry",0,CheckLedgEntry.TABLECAPTION,CheckLedgEntry.COUNT);
    END;
    IF FALedgEntry.READPERMISSION THEN BEGIN
      FALedgEntry.RESET;
      FALedgEntry.SETCURRENTKEY("Document No.","Posting Date");
      FALedgEntry.SETFILTER("Document No.",DocNoFilter);
      FALedgEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"FA Ledger Entry",0,FALedgEntry.TABLECAPTION,FALedgEntry.COUNT);
    END;
    IF MaintenanceLedgEntry.READPERMISSION THEN BEGIN
      MaintenanceLedgEntry.RESET;
      MaintenanceLedgEntry.SETCURRENTKEY("Document No.","Posting Date");
      MaintenanceLedgEntry.SETFILTER("Document No.",DocNoFilter);
      MaintenanceLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Maintenance Ledger Entry",0,MaintenanceLedgEntry.TABLECAPTION,MaintenanceLedgEntry.COUNT);
    END;
    IF InsuranceCovLedgEntry.READPERMISSION THEN BEGIN
      InsuranceCovLedgEntry.RESET;
      InsuranceCovLedgEntry.SETCURRENTKEY("Document No.","Posting Date");
      InsuranceCovLedgEntry.SETFILTER("Document No.",DocNoFilter);
      InsuranceCovLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Ins. Coverage Ledger Entry",0,InsuranceCovLedgEntry.TABLECAPTION,InsuranceCovLedgEntry.COUNT);
    END;
    IF CapacityLedgEntry.READPERMISSION THEN BEGIN
      CapacityLedgEntry.RESET;
      CapacityLedgEntry.SETCURRENTKEY("Document No.","Posting Date");
      CapacityLedgEntry.SETFILTER("Document No.",DocNoFilter);
      CapacityLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Capacity Ledger Entry",0,CapacityLedgEntry.TABLECAPTION,CapacityLedgEntry.COUNT);
    END;
    IF WhseEntry.READPERMISSION THEN BEGIN
      WhseEntry.RESET;
      WhseEntry.SETCURRENTKEY("Reference No.","Registering Date");
      WhseEntry.SETFILTER("Reference No.",DocNoFilter);
      WhseEntry.SETFILTER("Registering Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Warehouse Entry",0,WhseEntry.TABLECAPTION,WhseEntry.COUNT);
    END;

    IF ServLedgerEntry.READPERMISSION THEN BEGIN
      ServLedgerEntry.RESET;
      ServLedgerEntry.SETCURRENTKEY("Document No.","Posting Date");
      ServLedgerEntry.SETFILTER("Document No.",DocNoFilter);
      ServLedgerEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Service Ledger Entry",0,ServLedgerEntry.TABLECAPTION,ServLedgerEntry.COUNT);
    END;
    IF WarrantyLedgerEntry.READPERMISSION THEN BEGIN
      WarrantyLedgerEntry.RESET;
      WarrantyLedgerEntry.SETCURRENTKEY("Document No.","Posting Date");
      WarrantyLedgerEntry.SETFILTER("Document No.",DocNoFilter);
      WarrantyLedgerEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Warranty Ledger Entry",0,WarrantyLedgerEntry.TABLECAPTION,WarrantyLedgerEntry.COUNT);
    END;

    IF CostEntry.READPERMISSION THEN BEGIN
      CostEntry.RESET;
      CostEntry.SETCURRENTKEY("Document No.","Posting Date");
      CostEntry.SETFILTER("Document No.",DocNoFilter);
      CostEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Cost Entry",0,CostEntry.TABLECAPTION,CostEntry.COUNT);
    END;

    IF DetailedTaxEntry.READPERMISSION THEN BEGIN
      DetailedTaxEntry.RESET;
      DetailedTaxEntry.SETFILTER("Document No.",DocNoFilter);
      InsertIntoDocEntry(
        DATABASE::"Detailed Tax Entry",0,DetailedTaxEntry.TABLECAPTION,DetailedTaxEntry.COUNT);
    END;
    IF RG23D.READPERMISSION THEN BEGIN
      RG23D.RESET;
      RG23D.SETCURRENTKEY("Document No.","Posting Date");
      RG23D.SETFILTER("Document No.",DocNoFilter);
      RG23D.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"RG 23 D",0,RG23D.TABLECAPTION,RG23D.COUNT);
    END;
    IF SvcTaxDistribution.READPERMISSION THEN BEGIN
      SvcTaxDistribution.RESET;
      SvcTaxDistribution.SETCURRENTKEY("Distributor Challan No","Distribution Date");
      SvcTaxDistribution.SETFILTER("Distributor Challan No",DocNoFilter);
      SvcTaxDistribution.SETFILTER("Distribution Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Service Tax Distribution",0,SvcTaxDistribution.TABLECAPTION,SvcTaxDistribution.COUNT);
    END;

    // >>Pranavi
    IF GSTLedgerEntry.READPERMISSION THEN BEGIN
      GSTLedgerEntry.RESET;
      GSTLedgerEntry.SETCURRENTKEY("Document No.","Posting Date");
      GSTLedgerEntry.SETFILTER("Document No.",DocNoFilter);
      GSTLedgerEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"GST Ledger Entry",0,GSTLedgerEntry.TABLECAPTION,GSTLedgerEntry.COUNT);
    END;
    IF DetailedGSTLedgerEntry.READPERMISSION THEN BEGIN
      DetailedGSTLedgerEntry.RESET;
      DetailedGSTLedgerEntry.SETCURRENTKEY("Document No.","Posting Date");
      DetailedGSTLedgerEntry.SETFILTER("Document No.",DocNoFilter);
      DetailedGSTLedgerEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Detailed GST Ledger Entry",0,DetailedGSTLedgerEntry.TABLECAPTION,DetailedGSTLedgerEntry.COUNT);
    END;
    // <<Pranavi

      //QCB2B2.0
      IF QualityItemLedgEntry.READPERMISSION THEN BEGIN
        QualityItemLedgEntry.RESET;
        QualityItemLedgEntry.SETCURRENTKEY("Document No.","Posting Date");
        QualityItemLedgEntry.SETFILTER("Document No.",DocNoFilter);
        QualityItemLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
        InsertIntoDocEntry(DATABASE::"Quality Item Ledger Entry",0,QualityItemLedgEntry.TABLECAPTION,QualityItemLedgEntry.COUNT);
      END;

      IF QualityLedgEntry.READPERMISSION THEN BEGIN
        QualityLedgEntry.SETCURRENTKEY("Source No.","Posting Date");
        QualityLedgEntry.SETFILTER("Source No.",DocNoFilter);
        QualityLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
        InsertIntoDocEntry(DATABASE::"Quality Ledger Entry",0,QualityLedgEntry.TABLECAPTION,QualityLedgEntry.COUNT);
      END;

      //QCB2B2.0

    #7..159
           //QCB2B2.0
          IF NoOfRecords(DATABASE::"Quality Item Ledger Entry") = 1 THEN
            BEGIN
              QualityItemLedgEntry.FINDFIRST;
              SetSource(QualityItemLedgEntry."Posting Date",FORMAT(QualityItemLedgEntry."Entry Type"),
                         QualityItemLedgEntry."Document No.", 3,QualityItemLedgEntry."Source No.");
            END;
          IF NoOfRecords(DATABASE::"Quality Ledger Entry") = 1 THEN
            BEGIN
              QualityLedgEntry.FINDFIRST;
              SetSource(QualityLedgEntry."Posting Date",FORMAT(QualityLedgEntry."Entry Type"),
                         QualityLedgEntry."Source No.", 3,QualityLedgEntry."Document No.");
            END;
            //QCB2B2.0

    #160..175
    */
    //end;


    //Unsupported feature: CodeModification on "ShowRecords(PROCEDURE 6)". Please convert manually.

    //procedure ShowRecords();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF ItemTrackingSearch THEN
      ItemTrackingNavigateMgt.Show("Table ID")
    ELSE
    #4..72
            PAGE.RUN(PAGE::"Posted Transfer Receipt",TransRcptHeader)
          ELSE
            PAGE.RUN(0,TransRcptHeader);
        DATABASE::"Posted Whse. Shipment Line":
          PAGE.RUN(0,PostedWhseShptLine);
        DATABASE::"Posted Whse. Receipt Line":
    #79..204
          PAGE.RUN(PAGE::"Posted Jnl. Bank Charges",PostedJnlBankCharges);
        DATABASE::"Posted GST Liability Adj.":
          PAGE.RUN(PAGE::"Posted GST Liability Adj.",PostedGSTLiabilityAdj);
      END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..75
        //MI1.0 >> BEGIN
        DATABASE::"Posted Material Issues Header":
          PAGE.RUN(0,PostedMaterialIssueHeader);
        //MI1.0 << END

    #76..207
          //QCB2B2.0
        DATABASE::"Quality Item Ledger Entry":
          PAGE.RUN(0,QualityItemLedgEntry);
        DATABASE::"Quality Ledger Entry":
          PAGE.RUN(0,QualityLedgEntry);
        //QCB2B2.0
      END;
    */
    //end;


    //Unsupported feature: CodeModification on "CheckReadPermissionToInsertDocEntry(PROCEDURE 1500000)". Please convert manually.

    //procedure CheckReadPermissionToInsertDocEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF SalesShptHeader.READPERMISSION THEN BEGIN
      SalesShptHeader.RESET;
      SalesShptHeader.SETFILTER("No.",DocNoFilter);
    #4..119
      InsertIntoDocEntry(
        DATABASE::"Transfer Receipt Header",0,Text020,TransRcptHeader.COUNT);
    END;
    IF PostedWhseShptLine.READPERMISSION THEN BEGIN
      PostedWhseShptLine.RESET;
      PostedWhseShptLine.SETCURRENTKEY("Posted Source No.","Posting Date");
    #126..289
      InsertIntoDocEntry(
        DATABASE::"Warehouse Entry",0,WhseEntry.TABLECAPTION,WhseEntry.COUNT);
    END;
    IF ServLedgerEntry.READPERMISSION THEN BEGIN
      ServLedgerEntry.RESET;
      ServLedgerEntry.SETCURRENTKEY("Document No.","Posting Date");
    #296..305
      InsertIntoDocEntry(
        DATABASE::"Warranty Ledger Entry",0,WarrantyLedgerEntry.TABLECAPTION,WarrantyLedgerEntry.COUNT);
    END;
    IF CostEntry.READPERMISSION THEN BEGIN
      CostEntry.RESET;
      CostEntry.SETCURRENTKEY("Document No.","Posting Date");
    #312..316

    CheckTaxReadPermissionToInsertDocEntry;
    CheckGSTReadPermissionToInsertDocEntry;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..122
    //MI1.0 >> BEGIN
    IF PostedMaterialIssueHeader.READPERMISSION THEN BEGIN
      PostedMaterialIssueHeader.RESET;
      PostedMaterialIssueHeader.SETFILTER("No.",DocNoFilter);
      PostedMaterialIssueHeader.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(
        DATABASE::"Posted Material Issues Header",0,Text020,PostedMaterialIssueHeader.COUNT);
    END;
    //MI1.0 << END
    #123..292

    #293..308

    #309..319
    */
    //end;


    //Unsupported feature: CodeModification on "CheckGSTReadPermissionToInsertDocEntry(PROCEDURE 1170000000)". Please convert manually.

    //procedure CheckGSTReadPermissionToInsertDocEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF GSTLedgerEntry.READPERMISSION THEN BEGIN
      GSTLedgerEntry.RESET;
      GSTLedgerEntry.SETCURRENTKEY("Document No.","Posting Date");
    #4..89
      InsertIntoDocEntry(
        DATABASE::"Provisional Entry",0,ProvisionalEntry.TABLECAPTION,ProvisionalEntry.COUNT);
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..92
    //QCB2B2.0
    IF QualityItemLedgEntry.READPERMISSION THEN BEGIN
      QualityItemLedgEntry.RESET;
      QualityItemLedgEntry.SETCURRENTKEY("Document No.","Posting Date");
      QualityItemLedgEntry.SETFILTER("Document No.",DocNoFilter);
      QualityItemLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(DATABASE::"Quality Item Ledger Entry",0,QualityItemLedgEntry.TABLECAPTION,QualityItemLedgEntry.COUNT);
    END;

    IF QualityLedgEntry.READPERMISSION THEN BEGIN
      QualityLedgEntry.SETCURRENTKEY("Source No.","Posting Date");
      QualityLedgEntry.SETFILTER("Source No.",DocNoFilter);
      QualityLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
      InsertIntoDocEntry(DATABASE::"Quality Ledger Entry",0,QualityLedgEntry.TABLECAPTION,QualityLedgEntry.COUNT);
    END;
    //QCB2B2.0
    */
    //end;

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

