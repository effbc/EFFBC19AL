codeunit 60027 "Modifiy All User Ids"
{
    // version UserId

    // EFFUPG    11-Apr-2017    Table record WorkflowLine-16341,AlternativeUsers-16342,
    //                          UserTasks-16345,BOMRegister variable removed in this
    //                          object as they are removed by Microsoft.

    Permissions = TableData "G/L Entry"=rm,
                  TableData "Cust. Ledger Entry"=rm,
                  TableData "Vendor Ledger Entry"=rm,
                  TableData "Item Ledger Entry"=rm,
                  TableData "G/L Register"=rm,
                  TableData "Item Register"=rm,
                  TableData "User Time Register"=rm,
                  TableData "Gen. Journal Line"=rm,
                  TableData "Date Compr. Register"=rm,
                  TableData "G/L Budget Entry"=rm,
                  TableData "Sales Shipment Header"=rm,
                  TableData "Sales Invoice Header"=rm,
                  TableData "Sales Cr.Memo Header"=rm,
                  TableData "Purch. Rcpt. Header"=rm,
                  TableData "Purch. Inv. Header"=rm,
                  TableData "Purch. Cr. Memo Hdr."=rm,
                  TableData "Job Ledger Entry"=rm,
                  TableData "Res. Ledger Entry"=rm,
                  TableData TableData239=rm,
                  TableData "Resource Register"=rm,
                  TableData "Job Register"=rm,
                  TableData "Requisition Line"=rm,
                  TableData "VAT Entry"=rm,
                  TableData "Bank Account Ledger Entry"=rm,
                  TableData "Check Ledger Entry"=rm,
                  TableData "Phys. Inventory Ledger Entry"=rm,
                  TableData "Issued Reminder Header"=rm,
                  TableData "Reminder/Fin. Charge Entry"=rm,
                  TableData "Issued Fin. Charge Memo Header"=rm,
                  TableData "Reservation Entry"=rm,
                  TableData "Item Application Entry"=rm,
                  TableData "Item Application Entry History"=rm,
                  TableData "Detailed Cust. Ledg. Entry"=rm,
                  TableData "CV Ledger Entry Buffer"=rm,
                  TableData "Approval Entry"=rm,
                  TableData "Approval Comment Line"=rm,
                  TableData "Posted Approval Entry"=rm,
                  TableData "Posted Approval Comment Line"=rm,
                  TableData "Overdue Approval Entry"=rm,
                  TableData "DO Payment Trans. Log Entry"=rm,
                  TableData "Cash Flow Forecast"=rm,
                  TableData "Cash Flow Forecast Entry"=rm,
                  TableData "Posted Assembly Header"=rm,
                  TableData "Job Planning Line"=rm,
                  TableData "Cost Type"=rm,
                  TableData "Cost Entry"=rm,
                  TableData "Cost Register"=rm,
                  TableData "Cost Allocation Source"=rm,
                  TableData "Cost Allocation Target"=rm,
                  TableData "Cost Budget Entry"=rm,
                  TableData "Cost Budget Register"=rm,
                  TableData "Cost Center"=rm,
                  TableData "Interaction Log Entry"=rm,
                  TableData "Campaign Entry"=rm,
                  TableData "Logged Segment"=rm,
                  TableData "Saved Segment Criteria"=rm,
                  TableData "Sales Header Archive"=rm,
                  TableData "Purchase Header Archive"=rm,
                  TableData "Outlook Synch. Link"=rm,
                  TableData "Outlook Synch. User Setup"=rm,
                  TableData "FA Ledger Entry"=rm,
                  TableData "FA Journal Setup"=rm,
                  TableData "FA Register"=rm,
                  TableData "Maintenance Ledger Entry"=rm,
                  TableData "Ins. Coverage Ledger Entry"=rm,
                  TableData "Insurance Register"=rm,
                  TableData "Transfer Header"=rm,
                  TableData "Transfer Shipment Header"=rm,
                  TableData "Transfer Receipt Header"=rm,
                  TableData "Value Entry"=rm,
                  TableData "Inventory Period Entry"=rm,
                  TableData "Capacity Ledger Entry"=rm,
                  TableData "Service Ledger Entry"=rm,
                  TableData "Service Document Log"=rm,
                  TableData "Service Register"=rm,
                  TableData "Service Item Log"=rm,
                  TableData "Contract Change Log"=rm,
                  TableData "Contract Gain/Loss Entry"=rm,
                  TableData "Filed Service Contract Header"=rm,
                  TableData "Service Shipment Header"=rm;

    trigger OnRun();
    begin
        //Done
        /*{
        UserSetup.RESET;
        IF UserSetup.FINDFIRST THEN
          REPEAT
            IF UserSetup."Current UserId" <> UserSetup."User ID" THEN BEGIN
              UserSetup."Current UserId" := UserSetup."User ID";
              //UserSetup."Employee ID" := UserSetup."User ID";
              UserSetup.MODIFY;
            END;
          UNTIL UserSetup.NEXT = 0;
        }*///Done
        /*{
        TempUserTable.RESET;
        IF TempUserTable.FINDFIRST THEN
          REPEAT
            UserSetup.RESET;
            UserSetup.SETRANGE("Current UserId",TempUserTable."Current UserID/Emp ID");
            IF UserSetup.FINDFIRST THEN BEGIN
              IF UserSetup."User ID" <> TempUserTable."Windows UserID" THEN BEGIN
                UserSetup.RENAME(TempUserTable."Windows UserID");
              END;
            END ELSE BEGIN
              UserSetup.INIT;
              UserSetup."User ID" := TempUserTable."Windows UserID";
              UserSetup."Current UserId" := TempUserTable."Current UserID/Emp ID";
              UserSetup."E-Mail" := TempUserTable."Mail Id";
              IF NOT UserSetupVerify.GET(UserSetup."User ID") THEN
                UserSetup.INSERT;
            END;
          UNTIL TempUserTable.NEXT = 0;
        MESSAGE('Renamed');
        }*/
        /*
        Window.OPEN('Modifing Tables\'+'User ID : #1#######\'+'Table Name : #2##################\'+'Tables Completed : #3#########');
        UserSetup.RESET;
        //UserSetup.SETFILTER(UserSetup."Current UserId",'07CM002|05PD008|13CM001');
        IF UserSetup.FINDFIRST THEN
          REPEAT
            I := 0;
            IF (UserSetup."Current UserId" <> '') AND (UserSetup."Current UserId" <> UserSetup."User ID") THEN BEGIN
             I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(GLEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              GLEntry.RESET;
              GLEntry.SETRANGE("User ID",UserSetup."Current UserId");
              GLEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(Customer.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              Customer.RESET;
              Customer.SETRANGE("User Id",UserSetup."Current UserId");
              Customer.MODIFYALL("User Id",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(CustLedgerEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              CustLedgerEntry.RESET;
              CustLedgerEntry.SETRANGE("User ID",UserSetup."Current UserId");
              CustLedgerEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(VendorLedgerEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              VendorLedgerEntry.RESET;
              VendorLedgerEntry.SETRANGE("User ID",UserSetup."Current UserId");
              VendorLedgerEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(Item.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              Item.RESET;
              Item.SETRANGE("User ID",UserSetup."Current UserId");
              Item.MODIFYALL("User ID",UserSetup."User ID");
              //-----------------------------------------------------
              {
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ItemLedgerEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ItemLedgerEntry.RESET;
              ItemLedgerEntry.SETRANGE("User ID",UserSetup."Current UserId");
              ItemLedgerEntry.MODIFYALL("User ID",UserSetup."User ID");
              }
              //-----------------------------------------------------
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(SalesHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              SalesHeader.RESET;
              SalesHeader.SETRANGE(userid1,UserSetup."Current UserId");
              SalesHeader.MODIFYALL(userid1,UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(SalesHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              SalesHeader.RESET;
              SalesHeader.SETRANGE("Released to Sales User ID",UserSetup."Current UserId");
              SalesHeader.MODIFYALL("Released to Sales User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(SalesHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              SalesHeader.RESET;
              SalesHeader.SETRANGE("Released to Design User ID",UserSetup."Current UserId");
              SalesHeader.MODIFYALL("Released to Design User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(PurchaseHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              PurchaseHeader.RESET;
              PurchaseHeader.SETRANGE("OrderCreated by",UserSetup."Current UserId");
              PurchaseHeader.MODIFYALL("OrderCreated by",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(PurchaseHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              PurchaseHeader.RESET;
              PurchaseHeader.SETRANGE("Released By",UserSetup."Current UserId");
              PurchaseHeader.MODIFYALL("Released By",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(GLRegister.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              GLRegister.RESET;
              GLRegister.SETRANGE("User ID",UserSetup."Current UserId");
              GLRegister.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ItemRegister.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ItemRegister.RESET;
              ItemRegister.SETRANGE("User ID",UserSetup."Current UserId");
              ItemRegister.MODIFYALL("User ID",UserSetup."User ID");
              //-----------------------------------------------------
              {
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(UserTimeRegister.TABLENAME));
              Window.UPDATE(3,Format(I));
              UserTimeRegister.RESET;
              UserTimeRegister.SETRANGE("User ID",UserSetup."Current UserId");
              UserTimeRegister.MODIFYALL("User ID",UserSetup."User ID");
              }
              //-----------------------------------------------------Not Needed
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ItemJournalLine.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ItemJournalLine.RESET;
              ItemJournalLine.SETRANGE("User ID",UserSetup."Current UserId");
              ItemJournalLine.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(DateComprRegister.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              DateComprRegister.RESET;
              DateComprRegister.SETRANGE("User ID",UserSetup."Current UserId");
              DateComprRegister.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(GLBudgetEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              GLBudgetEntry.RESET;
              GLBudgetEntry.SETRANGE("User ID",UserSetup."Current UserId");
              GLBudgetEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(SalesShipmentHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              SalesShipmentHeader.RESET;
              SalesShipmentHeader.SETRANGE("User ID",UserSetup."Current UserId");
              SalesShipmentHeader.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(SalesInvoiceHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              SalesInvoiceHeader.RESET;
              SalesInvoiceHeader.SETRANGE("User ID",UserSetup."Current UserId");
              SalesInvoiceHeader.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(SalesCrMemoHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              SalesCrMemoHeader.RESET;
              SalesCrMemoHeader.SETRANGE("User ID",UserSetup."Current UserId");
              SalesCrMemoHeader.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(PurchRcptHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              PurchRcptHeader.RESET;
              PurchRcptHeader.SETRANGE("User ID",UserSetup."Current UserId");
              PurchRcptHeader.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(PurchInvHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              PurchInvHeader.RESET;
              PurchInvHeader.SETRANGE("User ID",UserSetup."Current UserId");
              PurchInvHeader.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(PurchCrMemoHdr.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              PurchCrMemoHdr.RESET;
              PurchCrMemoHdr.SETRANGE("User ID",UserSetup."Current UserId");
              PurchCrMemoHdr.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(PurchCrMemoHdr.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              PurchCrMemoHdr.RESET;
              PurchCrMemoHdr.SETRANGE("Authorized User ID",UserSetup."Current UserId");
              PurchCrMemoHdr.MODIFYALL("Authorized User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(JobLedgerEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              JobLedgerEntry.RESET;
              JobLedgerEntry.SETRANGE("User ID",UserSetup."Current UserId");
              JobLedgerEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ResLedgerEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ResLedgerEntry.RESET;
              ResLedgerEntry.SETRANGE("User ID",UserSetup."Current UserId");
              ResLedgerEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(BOMRegister.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              BOMRegister.RESET;
              BOMRegister.SETRANGE("User ID",UserSetup."Current UserId");
              BOMRegister.MODIFYALL("User ID",UserSetup."User ID");
        
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ResourceRegister.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ResourceRegister.RESET;
              ResourceRegister.SETRANGE("User ID",UserSetup."Current UserId");
              ResourceRegister.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(JobRegister.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              JobRegister.RESET;
              JobRegister.SETRANGE("User ID",UserSetup."Current UserId");
              JobRegister.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(RequisitionLine.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              RequisitionLine.RESET;
              RequisitionLine.SETRANGE("Requester ID",UserSetup."Current UserId");
              RequisitionLine.MODIFYALL("Requester ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(RequisitionLine.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              RequisitionLine.RESET;
              RequisitionLine.SETRANGE("User ID",UserSetup."Current UserId");
              RequisitionLine.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(VATEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              VATEntry.RESET;
              VATEntry.SETRANGE("User ID",UserSetup."Current UserId");
              VATEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(BankAccountLedgerEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              BankAccountLedgerEntry.RESET;
              BankAccountLedgerEntry.SETRANGE("User ID",UserSetup."Current UserId");
              BankAccountLedgerEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(CheckLedgerEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              CheckLedgerEntry.RESET;
              CheckLedgerEntry.SETRANGE("User ID",UserSetup."Current UserId");
              CheckLedgerEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(PhysInventoryLedgerEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              PhysInventoryLedgerEntry.RESET;
              PhysInventoryLedgerEntry.SETRANGE("User ID",UserSetup."Current UserId");
              PhysInventoryLedgerEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(IssuedReminderHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              IssuedReminderHeader.RESET;
              IssuedReminderHeader.SETRANGE("User ID",UserSetup."Current UserId");
              IssuedReminderHeader.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ReminderFinChargeEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ReminderFinChargeEntry.RESET;
              ReminderFinChargeEntry.SETRANGE("User ID",UserSetup."Current UserId");
              ReminderFinChargeEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(IssuedFinChargeMemoHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              IssuedFinChargeMemoHeader.RESET;
              IssuedFinChargeMemoHeader.SETRANGE("User ID",UserSetup."Current UserId");
              IssuedFinChargeMemoHeader.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ReservationEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ReservationEntry.RESET;
              ReservationEntry.SETRANGE("Created By",UserSetup."Current UserId");
              ReservationEntry.MODIFYALL("Created By",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ReservationEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ReservationEntry.RESET;
              ReservationEntry.SETRANGE("Changed By",UserSetup."Current UserId");
              ReservationEntry.MODIFYALL("Changed By",UserSetup."User ID");
              //-----------------------------------------------------
              {
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ItemApplicationEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ItemApplicationEntry.RESET;
              ItemApplicationEntry.SETRANGE("Created By User",UserSetup."Current UserId");
              ItemApplicationEntry.MODIFYALL("Created By User",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ItemApplicationEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ItemApplicationEntry.RESET;
              ItemApplicationEntry.SETRANGE("Last Modified By User",UserSetup."Current UserId");
              ItemApplicationEntry.MODIFYALL("Last Modified By User",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ItemApplicationEntryHistory.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ItemApplicationEntryHistory.RESET;
              ItemApplicationEntryHistory.SETRANGE("Created By User",UserSetup."Current UserId");
              ItemApplicationEntryHistory.MODIFYALL("Created By User",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ItemApplicationEntryHistory.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ItemApplicationEntryHistory.RESET;
              ItemApplicationEntryHistory.SETRANGE("Last Modified By User",UserSetup."Current UserId");
              ItemApplicationEntryHistory.MODIFYALL("Last Modified By User",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ItemApplicationEntryHistory.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ItemApplicationEntryHistory.RESET;
              ItemApplicationEntryHistory.SETRANGE("Deleted By User",UserSetup."Current UserId");
              ItemApplicationEntryHistory.MODIFYALL("Deleted By User",UserSetup."User ID");
              }
              //-----------------------------------------------------
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(SelectedDimension.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              SelectedDimension.RESET;
              SelectedDimension.SETRANGE("User ID",UserSetup."Current UserId");
              IF SelectedDimension.FINDFIRST THEN
                REPEAT
                  SelectedDimension.RENAME(UserSetup."User ID",SelectedDimension."Object Type",
                          SelectedDimension."Object ID",SelectedDimension."Analysis View Code",SelectedDimension."Dimension Code");
                UNTIL SelectedDimension.NEXT = 0;
              //SelectedDimension.MODIFYALL("User ID",UserSetup."User ID"); //Rename
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(DetailedCustLedgEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              DetailedCustLedgEntry.RESET;
              DetailedCustLedgEntry.SETRANGE("User ID",UserSetup."Current UserId");
              DetailedCustLedgEntry.MODIFYALL("User ID",UserSetup."User ID");
              {
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(DetailedVendorLedgEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              DetailedVendorLedgEntry.RESET;
              DetailedVendorLedgEntry.SETRANGE("User ID",UserSetup."Current UserId");
              DetailedVendorLedgEntry.MODIFYALL("User ID",UserSetup."User ID");
              }
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(CVLedgerEntryBuffer.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              CVLedgerEntryBuffer.RESET;
              CVLedgerEntryBuffer.SETRANGE("User ID",UserSetup."Current UserId");
              CVLedgerEntryBuffer.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(DetailedCVLedgEntryBuffer.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              DetailedCVLedgEntryBuffer.RESET;
              DetailedCVLedgEntryBuffer.SETRANGE("User ID",UserSetup."Current UserId");
              DetailedCVLedgEntryBuffer.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ApprovalEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ApprovalEntry.RESET;
              ApprovalEntry.SETRANGE("Sender ID",UserSetup."Current UserId");
              ApprovalEntry.MODIFYALL("Sender ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ApprovalEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ApprovalEntry.RESET;
              ApprovalEntry.SETRANGE("Approver ID",UserSetup."Current UserId");
              ApprovalEntry.MODIFYALL("Approver ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ApprovalEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ApprovalEntry.RESET;
              ApprovalEntry.SETRANGE("Last Modified By ID",UserSetup."Current UserId");
              ApprovalEntry.MODIFYALL("Last Modified By ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ApprovalCommentLine.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ApprovalCommentLine.RESET;
              ApprovalCommentLine.SETRANGE("User ID",UserSetup."Current UserId");
              ApprovalCommentLine.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(PostedApprovalEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              PostedApprovalEntry.RESET;
              PostedApprovalEntry.SETRANGE("Sender ID",UserSetup."Current UserId");
              ApprovalEntry.MODIFYALL("Sender ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(PostedApprovalEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              PostedApprovalEntry.RESET;
              PostedApprovalEntry.SETRANGE("Approver ID",UserSetup."Current UserId");
              PostedApprovalEntry.MODIFYALL("Approver ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(PostedApprovalEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              PostedApprovalEntry.RESET;
              PostedApprovalEntry.SETRANGE("Last Modified By ID",UserSetup."Current UserId");
              PostedApprovalEntry.MODIFYALL("Last Modified By ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(PostedApprovalCommentLine.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              PostedApprovalCommentLine.RESET;
              PostedApprovalCommentLine.SETRANGE("User ID",UserSetup."Current UserId");
              PostedApprovalCommentLine.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(OverdueNotificationEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              OverdueNotificationEntry.RESET;
              OverdueNotificationEntry.SETRANGE("Approver ID",UserSetup."Current UserId");
              OverdueNotificationEntry.MODIFYALL("Approver ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(DOPaymentTransLogEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              DOPaymentTransLogEntry.RESET;
              DOPaymentTransLogEntry.SETRANGE("User ID",UserSetup."Current UserId");
              DOPaymentTransLogEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(CashFlowForecast.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              CashFlowForecast.RESET;
              CashFlowForecast.SETRANGE("Created By",UserSetup."Current UserId");
              CashFlowForecast.MODIFYALL("Created By",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(CashFlowForecastEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              CashFlowForecastEntry.RESET;
              CashFlowForecastEntry.SETRANGE("User ID",UserSetup."Current UserId");
              CashFlowForecastEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(PostedAssemblyHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              PostedAssemblyHeader.RESET;
              PostedAssemblyHeader.SETRANGE("User ID",UserSetup."Current UserId");
              PostedAssemblyHeader.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(JobPlanningLine.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              JobPlanningLine.RESET;
              JobPlanningLine.SETRANGE("User ID",UserSetup."Current UserId");
              JobPlanningLine.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(CostType.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              CostType.RESET;
              CostType.SETRANGE("Modified By",UserSetup."Current UserId");
              CostType.MODIFYALL("Modified By",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(CostEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              CostEntry.RESET;
              CostEntry.SETRANGE("User ID",UserSetup."Current UserId");
              CostEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(CostRegister.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              CostRegister.RESET;
              CostRegister.SETRANGE("User ID",UserSetup."Current UserId");
              CostRegister.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(CostAllocationSource.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              CostAllocationSource.RESET;
              CostAllocationSource.SETRANGE("User ID",UserSetup."Current UserId");
              CostAllocationSource.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(CostAllocationTarget.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              CostAllocationTarget.RESET;
              CostAllocationTarget.SETRANGE("User ID",UserSetup."Current UserId");
              CostAllocationTarget.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(CostBudgetEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              CostBudgetEntry.RESET;
              CostBudgetEntry.SETRANGE("Last Modified By User",UserSetup."Current UserId");
              CostBudgetEntry.MODIFYALL("Last Modified By User",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(CostBudgetRegister.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              CostBudgetRegister.RESET;
              CostBudgetRegister.SETRANGE("User ID",UserSetup."Current UserId");
              CostBudgetRegister.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(CostCenter.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              CostCenter.RESET;
              CostCenter.SETRANGE("Responsible Person",UserSetup."Current UserId");
              CostCenter.MODIFYALL("Responsible Person",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(InteractionLogEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              InteractionLogEntry.RESET;
              InteractionLogEntry.SETRANGE("User ID",UserSetup."Current UserId");
              InteractionLogEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(CampaignEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              CampaignEntry.RESET;
              CampaignEntry.SETRANGE("User ID",UserSetup."Current UserId");
              CampaignEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(LoggedSegment.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              LoggedSegment.RESET;
              LoggedSegment.SETRANGE("User ID",UserSetup."Current UserId");
              LoggedSegment.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(SavedSegmentCriteria.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              SavedSegmentCriteria.RESET;
              SavedSegmentCriteria.SETRANGE("User ID",UserSetup."Current UserId");
              SavedSegmentCriteria.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(SalesHeaderArchive.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              SalesHeaderArchive.RESET;
              SalesHeaderArchive.SETRANGE("Archived By",UserSetup."Current UserId");
              SalesHeaderArchive.MODIFYALL("Archived By",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(PurchaseHeaderArchive.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              PurchaseHeaderArchive.RESET;
              PurchaseHeaderArchive.SETRANGE("Archived By",UserSetup."Current UserId");
              PurchaseHeaderArchive.MODIFYALL("Archived By",UserSetup."User ID");
              {
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(OutlookSynchLink.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              OutlookSynchLink.RESET;
              OutlookSynchLink.SETRANGE("User ID",UserSetup."Current UserId");
              OutlookSynchLink.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(OutlookSynchUserSetup.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              OutlookSynchUserSetup.RESET;
              OutlookSynchUserSetup.SETRANGE("User ID",UserSetup."Current UserId");
              OutlookSynchUserSetup.MODIFYALL("User ID",UserSetup."User ID");
              }// To be done.
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ManufacturingUserTemplate.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ManufacturingUserTemplate.RESET;
              ManufacturingUserTemplate.SETRANGE("User ID",UserSetup."Current UserId");
              IF ManufacturingUserTemplate.FINDFIRST THEN
                REPEAT
                  ManufacturingUserTemplate.RENAME(UserSetup."User ID");
                UNTIL ManufacturingUserTemplate.NEXT=0;
              //ManufacturingUserTemplate.MODIFYALL("User ID",UserSetup."User ID"); //Rename
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(FALedgerEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              FALedgerEntry.RESET;
              FALedgerEntry.SETRANGE("User ID",UserSetup."Current UserId");
              FALedgerEntry.MODIFYALL("User ID",UserSetup."User ID");
              // No data ---------------------------------------------
              {
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(FAJournalSetup.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              FAJournalSetup.RESET;
              FAJournalSetup.SETRANGE("User ID",UserSetup."Current UserId");
              FAJournalSetup.MODIFYALL("User ID",UserSetup."User ID");
              }// No data ---------------------------------------------
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(FARegister.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              FARegister.RESET;
              FARegister.SETRANGE("User ID",UserSetup."Current UserId");
              FARegister.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(MaintenanceLedgerEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              MaintenanceLedgerEntry.RESET;
              MaintenanceLedgerEntry.SETRANGE("User ID",UserSetup."Current UserId");
              MaintenanceLedgerEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(InsCoverageLedgerEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              InsCoverageLedgerEntry.RESET;
              InsCoverageLedgerEntry.SETRANGE("User ID",UserSetup."Current UserId");
              InsCoverageLedgerEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(InsuranceRegister.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              InsuranceRegister.RESET;
              InsuranceRegister.SETRANGE("User ID",UserSetup."Current UserId");
              InsuranceRegister.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(TransferHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              TransferHeader.RESET;
              TransferHeader.SETRANGE("User ID",UserSetup."Current UserId");
              TransferHeader.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(TransferHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              TransferHeader.RESET;
              TransferHeader.SETRANGE("Released By",UserSetup."Current UserId");
              TransferHeader.MODIFYALL("Released By",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(TransferShipmentHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              TransferShipmentHeader.RESET;
              TransferShipmentHeader.SETRANGE("User ID",UserSetup."Current UserId");
              TransferShipmentHeader.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(TransferHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              TransferShipmentHeader.RESET;
              TransferShipmentHeader.SETRANGE("Released By",UserSetup."Current UserId");
              TransferShipmentHeader.MODIFYALL("Released By",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(TransferReceiptHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              TransferReceiptHeader.RESET;
              TransferReceiptHeader.SETRANGE("User ID",UserSetup."Current UserId");
              TransferReceiptHeader.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(TransferReceiptHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              TransferReceiptHeader.RESET;
              TransferReceiptHeader.SETRANGE("Released By",UserSetup."Current UserId");
              TransferReceiptHeader.MODIFYALL("Released By",UserSetup."User ID");
              // To be Done ----------------------------------
              {
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ValueEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ValueEntry.RESET;
              ValueEntry.SETRANGE("User ID",UserSetup."Current UserId");
              ValueEntry.MODIFYALL("User ID",UserSetup."User ID");
              } // To be Done ----------------------------------
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(InventoryPeriodEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              InventoryPeriodEntry.RESET;
              InventoryPeriodEntry.SETRANGE("User ID",UserSetup."Current UserId");
              InventoryPeriodEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ServiceLedgerEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ServiceLedgerEntry.RESET;
              ServiceLedgerEntry.SETRANGE("User ID",UserSetup."Current UserId");
              ServiceLedgerEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ServiceDocumentLog.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ServiceDocumentLog.RESET;
              ServiceDocumentLog.SETRANGE("User ID",UserSetup."Current UserId");
              ServiceDocumentLog.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ServiceRegister.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ServiceRegister.RESET;
              ServiceRegister.SETRANGE("User ID",UserSetup."Current UserId");
              ServiceRegister.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ServiceItemLog.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ServiceItemLog.RESET;
              ServiceItemLog.SETRANGE("User ID",UserSetup."Current UserId");
              ServiceItemLog.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ContractChangeLog.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ContractChangeLog.RESET;
              ContractChangeLog.SETRANGE("User ID",UserSetup."Current UserId");
              ContractChangeLog.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ContractGainLossEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ContractGainLossEntry.RESET;
              ContractGainLossEntry.SETRANGE("User ID",UserSetup."Current UserId");
              ContractGainLossEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(FiledServiceContractHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              FiledServiceContractHeader.RESET;
              FiledServiceContractHeader.SETRANGE("Filed By",UserSetup."Current UserId");
              FiledServiceContractHeader.MODIFYALL("Filed By",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ServiceShipmentHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ServiceShipmentHeader.RESET;
              ServiceShipmentHeader.SETRANGE("User ID",UserSetup."Current UserId");
              ServiceShipmentHeader.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ServiceInvoiceHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ServiceInvoiceHeader.RESET;
              ServiceInvoiceHeader.SETRANGE("User ID",UserSetup."Current UserId");
              ServiceInvoiceHeader.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ServiceCrMemoHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ServiceCrMemoHeader.RESET;
              ServiceCrMemoHeader.SETRANGE("User ID",UserSetup."Current UserId");
              ServiceCrMemoHeader.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ItemTracingBuffer.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ItemTracingBuffer.RESET;
              ItemTracingBuffer.SETRANGE("Created by",UserSetup."Current UserId");
              ItemTracingBuffer.MODIFYALL("Created by",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ReturnShipmentHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ReturnShipmentHeader.RESET;
              ReturnShipmentHeader.SETRANGE("User ID",UserSetup."Current UserId");
              ReturnShipmentHeader.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ReturnShipmentHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ReturnShipmentHeader.RESET;
              ReturnShipmentHeader.SETRANGE("Authorized User ID",UserSetup."Current UserId");
              ReturnShipmentHeader.MODIFYALL("Authorized User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ReturnReceiptHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ReturnReceiptHeader.RESET;
              ReturnReceiptHeader.SETRANGE("User ID",UserSetup."Current UserId");
              ReturnReceiptHeader.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ReturnReceiptHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ReturnReceiptHeader.RESET;
              ReturnReceiptHeader.SETRANGE("Authorized User ID",UserSetup."Current UserId");
              ReturnReceiptHeader.MODIFYALL("Authorized User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ItemBudgetEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ItemBudgetEntry.RESET;
              ItemBudgetEntry.SETRANGE("User ID",UserSetup."Current UserId");
              ItemBudgetEntry.MODIFYALL("User ID",UserSetup."User ID");
              // No Data ---------------
              {
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(AnalysisSelectedDimension.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              AnalysisSelectedDimension.RESET;
              AnalysisSelectedDimension.SETRANGE("User ID",UserSetup."Current UserId");
              AnalysisSelectedDimension.MODIFYALL("User ID",UserSetup."User ID");
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(WarehouseEmployee.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              WarehouseEmployee.RESET;
              WarehouseEmployee.SETRANGE("User ID",UserSetup."Current UserId");
              WarehouseEmployee.MODIFYALL("User ID",UserSetup."User ID");
              }
              // No Data ---------------
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(WarehouseJournalLine.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              WarehouseJournalLine.RESET;
              WarehouseJournalLine.SETRANGE("User ID",UserSetup."Current UserId");
              WarehouseJournalLine.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(WarehouseEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              WarehouseEntry.RESET;
              WarehouseEntry.SETRANGE("User ID",UserSetup."Current UserId");
              WarehouseEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(WarehouseRegister.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              WarehouseRegister.RESET;
              WarehouseRegister.SETRANGE("User ID",UserSetup."Current UserId");
              WarehouseRegister.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(BinCreationWorksheetLine.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              BinCreationWorksheetLine.RESET;
              BinCreationWorksheetLine.SETRANGE("User ID",UserSetup."Current UserId");
              BinCreationWorksheetLine.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(TaxEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              TaxEntry.RESET;
              TaxEntry.SETRANGE("User ID",UserSetup."Current UserId");
              TaxEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ExciseEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ExciseEntry.RESET;
              ExciseEntry.SETRANGE("User ID",UserSetup."Current UserId");
              ExciseEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(PLAEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              PLAEntry.RESET;
              PLAEntry.SETRANGE("User ID",UserSetup."Current UserId");
              PLAEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(TDSEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              TDSEntry.RESET;
              TDSEntry.SETRANGE("User ID",UserSetup."Current UserId");
              TDSEntry.MODIFYALL("User ID",UserSetup."User ID");
        
             I +=1;
             Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
             Window.UPDATE(2,FORMAT(WorkflowLine.TABLENAME));
             Window.UPDATE(3,FORMAT(I));
             WorkflowLine.RESET;
             WorkflowLine.SETRANGE("User ID",UserSetup."Current UserId");
             WorkflowLine.MODIFYALL("User ID",UserSetup."User ID");
        
             I +=1;
             Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
             Window.UPDATE(2,FORMAT(AlternativeUsers.TABLENAME));
             Window.UPDATE(3,FORMAT(I));
             AlternativeUsers.RESET;
             AlternativeUsers.SETRANGE("User ID",UserSetup."Current UserId");
             AlternativeUsers.MODIFYALL("User ID",UserSetup."User ID");
        
             I +=1;
             Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
             Window.UPDATE(2,FORMAT(UserTasks.TABLENAME));
             Window.UPDATE(3,FORMAT(I));
             UserTasks.RESET;
             UserTasks.SETRANGE("Received From",UserSetup."Current UserId");
             UserTasks.MODIFYALL("Received From",UserSetup."User ID");
        
             I +=1;
             Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
             Window.UPDATE(2,FORMAT(UserTasks.TABLENAME));
             Window.UPDATE(3,FORMAT(I));
             UserTasks.RESET;
             UserTasks.SETRANGE("User ID",UserSetup."Current UserId");
             UserTasks.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(SubCompRcptHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              SubCompRcptHeader.RESET;
              SubCompRcptHeader.SETRANGE("User ID",UserSetup."Current UserId");
              SubCompRcptHeader.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(BatchHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              BatchHeader.RESET;
              BatchHeader.SETRANGE("User ID",UserSetup."Current UserId");
              BatchHeader.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ChallanRegister.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ChallanRegister.RESET;
              ChallanRegister.SETRANGE("User ID",UserSetup."Current UserId");
              ChallanRegister.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(Form26Q27QEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              Form26Q27QEntry.RESET;
              Form26Q27QEntry.SETRANGE("User ID",UserSetup."Current UserId");
              Form26Q27QEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(TCSEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              TCSEntry.RESET;
              TCSEntry.SETRANGE("User ID",UserSetup."Current UserId");
              TCSEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(TCSBatchHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              TCSBatchHeader.RESET;
              TCSBatchHeader.SETRANGE("User ID",UserSetup."Current UserId");
              TCSBatchHeader.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(TCSChallanRegister.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              TCSChallanRegister.RESET;
              TCSChallanRegister.SETRANGE("User ID",UserSetup."Current UserId");
              TCSChallanRegister.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(Form27EQEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              Form27EQEntry.RESET;
              Form27EQEntry.SETRANGE("User ID",UserSetup."Current UserId");
              Form27EQEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(DetailedTaxEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              DetailedTaxEntry.RESET;
              DetailedTaxEntry.SETRANGE("User ID",UserSetup."Current UserId");
              DetailedTaxEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(RetrospectiveEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              RetrospectiveEntry.RESET;
              RetrospectiveEntry.SETRANGE("User ID",UserSetup."Current UserId");
              RetrospectiveEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(BOMReasonCodeLine.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              BOMReasonCodeLine.RESET;
              BOMReasonCodeLine.SETRANGE("User ID",UserSetup."Current UserId");
              BOMReasonCodeLine.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(FBTEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              FBTEntry.RESET;
              FBTEntry.SETRANGE("User ID",UserSetup."Current UserId");
              FBTEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(GateEntryHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              GateEntryHeader.RESET;
              GateEntryHeader.SETRANGE("User ID",UserSetup."Current UserId");
              GateEntryHeader.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(PostedGateEntryHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              PostedGateEntryHeader.RESET;
              PostedGateEntryHeader.SETRANGE("User ID",UserSetup."Current UserId");
              PostedGateEntryHeader.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(VATOpeningJournal.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              VATOpeningJournal.RESET;
              VATOpeningJournal.SETRANGE("User ID",UserSetup."Current UserId");
              VATOpeningJournal.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(DistributionHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              DistributionHeader.RESET;
              DistributionHeader.SETRANGE("User ID",UserSetup."Current UserId");
              DistributionHeader.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(PostedDistributionHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              PostedDistributionHeader.RESET;
              PostedDistributionHeader.SETRANGE("User ID",UserSetup."Current UserId");
              PostedDistributionHeader.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(CapitalizeCWIPHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              CapitalizeCWIPHeader.RESET;
              CapitalizeCWIPHeader.SETRANGE("User ID",UserSetup."Current UserId");
              CapitalizeCWIPHeader.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(PostedCapitalizeCWIPHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              PostedCapitalizeCWIPHeader.RESET;
              PostedCapitalizeCWIPHeader.SETRANGE("User ID",UserSetup."Current UserId");
              PostedCapitalizeCWIPHeader.MODIFYALL("User ID",UserSetup."User ID");
        
              //Hack
              //Customized Tables
              //Modified by kirang
              //Material Issues Header and Posted Material Issues Header table user ids changed as per the code
              {
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(MaterialIssuesHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              MaterialIssuesHeader.RESET;
              MaterialIssuesHeader.SETRANGE("User ID",UserSetup."Current UserId");
              MaterialIssuesHeader.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(MaterialIssuesHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              MaterialIssuesHeader.RESET;
              MaterialIssuesHeader.SETRANGE("Released By",UserSetup."Current UserId");
              MaterialIssuesHeader.MODIFYALL("Released By",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(MaterialIssuesHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              MaterialIssuesHeader.RESET;
              MaterialIssuesHeader.SETRANGE("Request for Authorization",UserSetup."Current UserId");
              MaterialIssuesHeader.MODIFYALL("Request for Authorization",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(PostedMaterialIssuesHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              PostedMaterialIssuesHeader.RESET;
              PostedMaterialIssuesHeader.SETRANGE("User ID",UserSetup."Current UserId");
              PostedMaterialIssuesHeader.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(PostedMaterialIssuesHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              PostedMaterialIssuesHeader.RESET;
              PostedMaterialIssuesHeader.SETRANGE("Released By",UserSetup."Current UserId");
              PostedMaterialIssuesHeader.MODIFYALL("Released By",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(PostedMaterialIssuesHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              PostedMaterialIssuesHeader.RESET;
              PostedMaterialIssuesHeader.SETRANGE("Posted By",UserSetup."Current UserId");
              PostedMaterialIssuesHeader.MODIFYALL("Posted By",UserSetup."User ID");
              }//Commented by kirang on 09-Aug-2013
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ServiceHeaderArchive.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ServiceHeaderArchive.RESET;
              ServiceHeaderArchive.SETRANGE("Archived by",UserSetup."Current UserId");
              ServiceHeaderArchive.MODIFYALL("Archived by",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(IndentHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              IndentHeader.RESET;
              IndentHeader.SETRANGE("User Id",UserSetup."Current UserId");
              IndentHeader.MODIFYALL("User Id",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(IndentHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              IndentHeader.RESET;
              IndentHeader.SETRANGE("Released By",UserSetup."Current UserId");
              IndentHeader.MODIFYALL("Released By",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(IndentHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              IndentHeader.RESET;
              IndentHeader.SETRANGE("Cancelled By",UserSetup."Current UserId");
              IndentHeader.MODIFYALL("Cancelled By",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(IndentHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              IndentHeader.RESET;
              IndentHeader.SETRANGE("Closed By",UserSetup."Current UserId");
              IndentHeader.MODIFYALL("Closed By",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(SpecificationParameters.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              SpecificationParameters.RESET;
              SpecificationParameters.SETRANGE("User Id",UserSetup."Current UserId");
              SpecificationParameters.MODIFYALL("User Id",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(RGPOutHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              RGPOutHeader.RESET;
              RGPOutHeader.SETRANGE("Created By",UserSetup."Current UserId");
              RGPOutHeader.MODIFYALL("Created By",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(RGPOutHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              RGPOutHeader.RESET;
              RGPOutHeader.SETRANGE("Released By",UserSetup."Current UserId");
              RGPOutHeader.MODIFYALL("Released By",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(RGPInHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              RGPInHeader.RESET;
              RGPInHeader.SETRANGE("Created By",UserSetup."Current UserId");
              RGPInHeader.MODIFYALL("Created By",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(RGPInHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              RGPInHeader.RESET;
              RGPInHeader.SETRANGE("Released By",UserSetup."Current UserId");
              RGPInHeader.MODIFYALL("Released By",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(DCHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              DCHeader.RESET;
              DCHeader.SETRANGE("User Id",UserSetup."Current UserId");
              DCHeader.MODIFYALL("User Id",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(DCHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              DCHeader.RESET;
              DCHeader.SETRANGE("Prepared By",UserSetup."Current UserId");
              DCHeader.MODIFYALL("Prepared By",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(DCHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              DCHeader.RESET;
              DCHeader.SETRANGE(Reciver,UserSetup."Current UserId");
              DCHeader.MODIFYALL(Reciver,UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(TenderHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              TenderHeader.RESET;
              TenderHeader.SETRANGE("USER ID",UserSetup."Current UserId");
              TenderHeader.MODIFYALL("USER ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(TenderHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              TenderHeader.RESET;
              TenderHeader.SETRANGE("Released to Sales User ID",UserSetup."Current UserId");
              TenderHeader.MODIFYALL("Released to Sales User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(TenderHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              TenderHeader.RESET;
              TenderHeader.SETRANGE("Released to Design User ID",UserSetup."Current UserId");
              TenderHeader.MODIFYALL("Released to Design User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(TenderHeaderArchive.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              TenderHeaderArchive.RESET;
              TenderHeaderArchive.SETRANGE("Archived By",UserSetup."Current UserId");
              TenderHeaderArchive.MODIFYALL("Archived By",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(MaterialIssueHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              MaterialIssueHeader.RESET;
              MaterialIssueHeader.SETRANGE("User ID",UserSetup."Current UserId");
              MaterialIssueHeader.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(MaterialIssueHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              MaterialIssueHeader.RESET;
              MaterialIssueHeader.SETRANGE("Released By",UserSetup."Current UserId");
              MaterialIssueHeader.MODIFYALL("Released By",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(MSPTVendorLedgerEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              MSPTVendorLedgerEntry.RESET;
              MSPTVendorLedgerEntry.SETRANGE("User ID",UserSetup."Current UserId");
              MSPTVendorLedgerEntry.MODIFYALL("User ID",UserSetup."User ID");
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(MSPTCustomerLedgerEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              MSPTCustomerLedgerEntry.RESET;
              MSPTCustomerLedgerEntry.SETRANGE("User ID",UserSetup."Current UserId");
              MSPTCustomerLedgerEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(MSPTDtldCustLedgEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              MSPTDtldCustLedgEntry.RESET;
              MSPTDtldCustLedgEntry.SETRANGE("User ID",UserSetup."Current UserId");
              MSPTDtldCustLedgEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(MSPTDtldVendorLedgEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              MSPTDtldVendorLedgEntry.RESET;
              MSPTDtldVendorLedgEntry.SETRANGE("User ID",UserSetup."Current UserId");
              MSPTDtldVendorLedgEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(SalesInvoiceDummy.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              SalesInvoiceDummy.RESET;
              SalesInvoiceDummy.SETRANGE(userid1,UserSetup."Current UserId");
              SalesInvoiceDummy.MODIFYALL(userid1,UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(SalesInvoiceDummy.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              SalesInvoiceDummy.RESET;
              SalesInvoiceDummy.SETRANGE("Released to Sales User ID",UserSetup."Current UserId");
              SalesInvoiceDummy.MODIFYALL("Released to Sales User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(SalesInvoiceDummy.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              SalesInvoiceDummy.RESET;
              SalesInvoiceDummy.SETRANGE("Released to Design User ID",UserSetup."Current UserId");
              SalesInvoiceDummy.MODIFYALL("Released to Design User ID",UserSetup."User ID");
              {
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ReservationEntryKNR.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ReservationEntryKNR.RESET;
              ReservationEntryKNR.SETRANGE("Created By",UserSetup."Current UserId");
              ReservationEntryKNR.MODIFYALL("Created By",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ReservationEntryKNR.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ReservationEntryKNR.RESET;
              ReservationEntryKNR.SETRANGE("Changed By",UserSetup."Current UserId");
              ReservationEntryKNR.MODIFYALL("Changed By",UserSetup."User ID");
              }
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(VATApplicableEntries.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              VATApplicableEntries.RESET;
              VATApplicableEntries.SETRANGE("User ID",UserSetup."Current UserId");
              VATApplicableEntries.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(CalibrationLineswithdata.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              CalibrationLineswithdata.RESET;
              CalibrationLineswithdata.SETRANGE("User ID",UserSetup."Current UserId");
              CalibrationLineswithdata.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(CalibrationLineswithdata.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              CalibrationLineswithdata.RESET;
              CalibrationLineswithdata.SETRANGE("Released By",UserSetup."Current UserId");
              CalibrationLineswithdata.MODIFYALL("Released By",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(EmployeeLedgerEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              EmployeeLedgerEntry.RESET;
              EmployeeLedgerEntry.SETRANGE("User ID",UserSetup."Current UserId");
              EmployeeLedgerEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(DetailedEmployeeLedgEntry.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              DetailedEmployeeLedgEntry.RESET;
              DetailedEmployeeLedgEntry.SETRANGE("User ID",UserSetup."Current UserId");
              DetailedEmployeeLedgEntry.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(EmpLedgerEntryBuffer.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              EmpLedgerEntryBuffer.RESET;
              EmpLedgerEntryBuffer.SETRANGE("User ID",UserSetup."Current UserId");
              EmpLedgerEntryBuffer.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(DtldEmpLedgEntryBuffer.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              DtldEmpLedgEntryBuffer.RESET;
              DtldEmpLedgEntryBuffer.SETRANGE("User ID",UserSetup."Current UserId");
              DtldEmpLedgEntryBuffer.MODIFYALL("User ID",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(InspectionDatasheetHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              InspectionDatasheetHeader.RESET;
              InspectionDatasheetHeader.SETRANGE("Created By",UserSetup."Current UserId");
              InspectionDatasheetHeader.MODIFYALL("Created By",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(InspectionDatasheetHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              InspectionDatasheetHeader.RESET;
              InspectionDatasheetHeader.SETRANGE("Posted By",UserSetup."Current UserId");
              InspectionDatasheetHeader.MODIFYALL("Posted By",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(InspectionDatasheetHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              InspectionDatasheetHeader.RESET;
              InspectionDatasheetHeader.SETRANGE("Data Entered By",UserSetup."Current UserId");
              InspectionDatasheetHeader.MODIFYALL("Data Entered By",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(PostedInspectDatasheetHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              PostedInspectDatasheetHeader.RESET;
              PostedInspectDatasheetHeader.SETRANGE("Created By",UserSetup."Current UserId");
              PostedInspectDatasheetHeader.MODIFYALL("Created By",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(PostedInspectDatasheetHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              PostedInspectDatasheetHeader.RESET;
              PostedInspectDatasheetHeader.SETRANGE("Posted By",UserSetup."Current UserId");
              PostedInspectDatasheetHeader.MODIFYALL("Posted By",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(PostedInspectDatasheetHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              PostedInspectDatasheetHeader.RESET;
              PostedInspectDatasheetHeader.SETRANGE("Data Entered By",UserSetup."Current UserId");
              PostedInspectDatasheetHeader.MODIFYALL("Data Entered By",UserSetup."User ID");
        
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(InspectionReceiptHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              InspectionReceiptHeader.RESET;
              InspectionReceiptHeader.SETRANGE("Data Entered By",UserSetup."Current UserId");
              InspectionReceiptHeader.MODIFYALL("Data Entered By",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(InspectionReceiptHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              InspectionReceiptHeader.RESET;
              InspectionReceiptHeader.SETRANGE("Posted By",UserSetup."Current UserId");
              InspectionReceiptHeader.MODIFYALL("Posted By",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ProductionBOMHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ProductionBOMHeader.RESET;
              ProductionBOMHeader.SETRANGE("User Id",UserSetup."Current UserId");
              ProductionBOMHeader.MODIFYALL("User Id",UserSetup."User ID");
        
              I +=1;
              Window.UPDATE(1,FORMAT(UserSetup."Current UserId"));
              Window.UPDATE(2,FORMAT(ProductionBOMHeader.TABLENAME));
              Window.UPDATE(3,FORMAT(I));
              ProductionBOMHeader.RESET;
              ProductionBOMHeader.SETRANGE("Modified User ID",UserSetup."Current UserId");
              ProductionBOMHeader.MODIFYALL("Modified User ID",UserSetup."User ID");
        
              UserSetup.Executed := TRUE;
              UserSetup.MODIFY;
              COMMIT;
            END;
          UNTIL UserSetup.NEXT = 0;
        Window.CLOSE;
        */
        /*
        UserSetup.RESET;
        UserSetup.SETFILTER(UserSetup."Current UserId",'<>%1','');
        UserSetup.SETFILTER(UserSetup."User ID",'EFFTRONICS\*');
        IF UserSetup.FINDFIRST THEN
        REPEAT
          PostedMaterialIssuesHeader.RESET;
          PostedMaterialIssuesHeader.SETRANGE("User ID",UserSetup."Current UserId");
          PostedMaterialIssuesHeader.MODIFYALL("User ID",UserSetup."User ID");
        UNTIL UserSetup.NEXT = 0;
        MESSAGE('COMPLETED');
        */
        /*
        User.RESET;
        User.SETFILTER(User.EmployeeID,'<>%1','');
        IF User.FINDFIRST THEN
        REPEAT
        */
        
          PostedMaterialIssuesHeader.RESET;
          PostedMaterialIssuesHeader.SETRANGE("User ID",'EFFTRONICS\RAMESHBABU');
          PostedMaterialIssuesHeader.MODIFYALL("User ID",UPPERCASE('EFFTRONICS\RAMESHBABUA'));
        MESSAGE('OK');
        /*
        UNTIL User.NEXT=0;
        
        MESSAGE('COMPLETED');
        */

    end;

    var
        TempUserTable : Record "Temp User Table";
        UserSetupVerify : Record "User Setup";
        Window : Dialog;
        I : Integer;
        UserSetup : Record "User Setup";
        GLEntry : Record "G/L Entry";
        Customer : Record Customer;
        CustLedgerEntry : Record "Cust. Ledger Entry";
        VendorLedgerEntry : Record "Vendor Ledger Entry";
        Item : Record Item;
        ItemLedgerEntry : Record "Item Ledger Entry";
        SalesHeader : Record "Sales Header";
        PurchaseHeader : Record "Purchase Header";
        GLRegister : Record "G/L Register";
        ItemRegister : Record "Item Register";
        UserTimeRegister : Record "User Time Register";
        ItemJournalLine : Record "Item Journal Line";
        DateComprRegister : Record "Date Compr. Register";
        GLBudgetEntry : Record "G/L Budget Entry";
        SalesShipmentHeader : Record "Sales Shipment Header";
        SalesInvoiceHeader : Record "Sales Invoice Header";
        SalesCrMemoHeader : Record "Sales Cr.Memo Header";
        PurchRcptHeader : Record "Purch. Rcpt. Header";
        PurchInvHeader : Record "Purch. Inv. Header";
        PurchCrMemoHdr : Record "Purch. Cr. Memo Hdr.";
        JobLedgerEntry : Record "Job Ledger Entry";
        ResLedgerEntry : Record "Res. Ledger Entry";
        ResourceRegister : Record "Resource Register";
        JobRegister : Record "Job Register";
        RequisitionLine : Record "Requisition Line";
        VATEntry : Record "VAT Entry";
        BankAccountLedgerEntry : Record "Bank Account Ledger Entry";
        CheckLedgerEntry : Record "Check Ledger Entry";
        PhysInventoryLedgerEntry : Record "Phys. Inventory Ledger Entry";
        IssuedReminderHeader : Record "Issued Reminder Header";
        ReminderFinChargeEntry : Record "Reminder/Fin. Charge Entry";
        IssuedFinChargeMemoHeader : Record "Issued Fin. Charge Memo Header";
        ReservationEntry : Record "Reservation Entry";
        ItemApplicationEntry : Record "Item Application Entry";
        ItemApplicationEntryHistory : Record "Item Application Entry History";
        SelectedDimension : Record "Selected Dimension";
        DetailedCustLedgEntry : Record "Detailed Cust. Ledg. Entry";
        DetailedVendorLedgEntry : Record "Detailed Vendor Ledg. Entry";
        CVLedgerEntryBuffer : Record "CV Ledger Entry Buffer";
        DetailedCVLedgEntryBuffer : Record "Detailed CV Ledg. Entry Buffer";
        ApprovalEntry : Record "Approval Entry";
        ApprovalCommentLine : Record "Approval Comment Line";
        PostedApprovalEntry : Record "Posted Approval Entry";
        PostedApprovalCommentLine : Record "Posted Approval Comment Line";
        OverdueNotificationEntry : Record "Overdue Approval Entry";
        DOPaymentTransLogEntry : Record "DO Payment Trans. Log Entry";
        CashFlowForecast : Record "Cash Flow Forecast";
        CashFlowForecastEntry : Record "Cash Flow Forecast Entry";
        PostedAssemblyHeader : Record "Posted Assembly Header";
        JobPlanningLine : Record "Job Planning Line";
        CostType : Record "Cost Type";
        CostEntry : Record "Cost Entry";
        CostRegister : Record "Cost Register";
        CostAllocationSource : Record "Cost Allocation Source";
        CostAllocationTarget : Record "Cost Allocation Target";
        CostBudgetEntry : Record "Cost Budget Entry";
        CostBudgetRegister : Record "Cost Budget Register";
        CostCenter : Record "Cost Center";
        InteractionLogEntry : Record "Interaction Log Entry";
        SavedSegmentCriteria : Record "Saved Segment Criteria";
        CampaignEntry : Record "Campaign Entry";
        LoggedSegment : Record "Logged Segment";
        SalesHeaderArchive : Record "Sales Header Archive";
        PurchaseHeaderArchive : Record "Purchase Header Archive";
        OutlookSynchLink : Record "Outlook Synch. Link";
        OutlookSynchUserSetup : Record "Outlook Synch. User Setup";
        ManufacturingUserTemplate : Record "Manufacturing User Template";
        FALedgerEntry : Record "FA Ledger Entry";
        FAJournalSetup : Record "FA Journal Setup";
        FARegister : Record "FA Register";
        MaintenanceLedgerEntry : Record "Maintenance Ledger Entry";
        InsCoverageLedgerEntry : Record "Ins. Coverage Ledger Entry";
        InsuranceRegister : Record "Insurance Register";
        TransferHeader : Record "Transfer Header";
        TransferShipmentHeader : Record "Transfer Shipment Header";
        TransferReceiptHeader : Record "Transfer Receipt Header";
        ValueEntry : Record "Value Entry";
        InventoryPeriodEntry : Record "Inventory Period Entry";
        ServiceLedgerEntry : Record "Service Ledger Entry";
        ServiceDocumentLog : Record "Service Document Log";
        ServiceRegister : Record "Service Register";
        ServiceItemLog : Record "Service Item Log";
        ContractChangeLog : Record "Contract Change Log";
        ContractGainLossEntry : Record "Contract Gain/Loss Entry";
        FiledServiceContractHeader : Record "Filed Service Contract Header";
        ServiceShipmentHeader : Record "Service Shipment Header";
        ServiceInvoiceHeader : Record "Service Invoice Header";
        ServiceCrMemoHeader : Record "Service Cr.Memo Header";
        ItemTracingBuffer : Record "Item Tracing Buffer";
        ReturnShipmentHeader : Record "Return Shipment Header";
        ReturnReceiptHeader : Record "Return Receipt Header";
        ItemBudgetEntry : Record "Item Budget Entry";
        AnalysisSelectedDimension : Record "Analysis Selected Dimension";
        WarehouseEmployee : Record "Warehouse Employee";
        WarehouseJournalLine : Record "Warehouse Journal Line";
        WarehouseEntry : Record "Warehouse Entry";
        WarehouseRegister : Record "Warehouse Register";
        BinCreationWorksheetLine : Record "Bin Creation Worksheet Line";
        TaxEntry : Record "Tax Entry";
        ExciseEntry : Record "Excise Entry";
        PLAEntry : Record "PLA Entry";
        TDSEntry : Record "TDS Entry";
        SubCompRcptHeader : Record "Sub. Comp. Rcpt. Header";
        BatchHeader : Record "Batch Header";
        ChallanRegister : Record "Challan Register";
        Form26Q27QEntry : Record "Form 26Q/27Q Entry";
        TCSEntry : Record "TCS Entry";
        TCSBatchHeader : Record "TCS Batch Header";
        TCSChallanRegister : Record "TCS Challan Register";
        Form27EQEntry : Record "Form 27EQ Entry";
        DetailedTaxEntry : Record "Detailed Tax Entry";
        RetrospectiveEntry : Record "Retrospective Entry";
        BOMReasonCodeLine : Record "BOM Reason Code Line";
        FBTEntry : Record "FBT Entry";
        GateEntryHeader : Record "Gate Entry Header";
        PostedGateEntryHeader : Record "Posted Gate Entry Header";
        VATOpeningJournal : Record "VAT Opening Journal";
        DistributionHeader : Record "Distribution Header";
        PostedDistributionHeader : Record "Posted Distribution Header";
        CapitalizeCWIPHeader : Record "Capitalize CWIP Header";
        PostedCapitalizeCWIPHeader : Record "Posted Capitalize CWIP Header";
        MaterialIssuesHeader : Record "Material Issues Header";
        PostedMaterialIssuesHeader : Record "Posted Material Issues Header";
        ServiceHeaderArchive : Record "Service Header Archive";
        IndentHeader : Record "Indent Header";
        SpecificationParameters : Record "Specification Parameters";
        RGPOutHeader : Record "RGP Out Header";
        RGPInHeader : Record "RGP In Header";
        DCHeader : Record "DC Header";
        TenderHeader : Record "Tender Header";
        TenderHeaderArchive : Record "Tender Header Archive";
        MaterialIssueHeader : Record "Material Issue Header";
        MSPTVendorLedgerEntry : Record "MSPT Vendor Ledger Entry";
        MSPTCustomerLedgerEntry : Record "MSPT Customer Ledger Entry";
        MSPTDtldCustLedgEntry : Record "MSPT Dtld. Cust. Ledg. Entry";
        MSPTDtldVendorLedgEntry : Record "MSPT Dtld. Vendor Ledg. Entry";
        SalesInvoiceDummy : Record "Sales Invoice-Dummy";
        ReservationEntryKNR : Record "Reservation Entry-KNR";
        VATApplicableEntries : Record "VAT Applicable Entries";
        CalibrationLineswithdata : Record "Calibration Lines-with data";
        EmployeeLedgerEntry : Record "Employee Ledger Entry";
        DetailedEmployeeLedgEntry : Record "Detailed Employee Ledg. Entry";
        EmpLedgerEntryBuffer : Record "Emp Ledger Entry Buffer";
        DtldEmpLedgEntryBuffer : Record "Dtld Emp Ledg. Entry Buffer";
        InspectionDatasheetHeader : Record "Inspection Datasheet Header";
        PostedInspectDatasheetHeader : Record "Posted Inspect DatasheetHeader";
        InspectionReceiptHeader : Record "Inspection Receipt Header";
        ProductionBOMHeader : Record "Production BOM Header";
        User : Record User;
}

