tableextension 70011 SalesHeaderExt extends "Sales Header"
{
    // version NAVW19.00.00.51947,NAVIN9.00.00.51947,TFS225680,B2B1.0,Rev01,B2BQTO,CR1.0

    fields
    {
        modify("Document Type")
        {
            OptionCaptionML = ENU = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Amc', ENN = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Amc';

         
        }

      
        field(50000; "MSPT Date"; Date)
        {
            Description = 'MSPT1.0';

            trigger OnValidate();
            begin
                TestField(Status, Status::Open);

                MSPTOrderDetails.SetRange(Type, MSPTOrderDetails.Type::Sale);
                MSPTOrderDetails.SetRange("Document Type", "Document Type");
                MSPTOrderDetails.SetRange("Document No.", "No.");
                if MSPTOrderDetails.Find('-') then begin
                    repeat
                        MSPTOrderDetails."Due Date" := CalcDate(MSPTOrderDetails."Calculation Period", Rec."MSPT Date");
                        MSPTOrderDetails.Modify;
                    until MSPTOrderDetails.Next = 0;
                end;
            end;
        }
        field(50001; "MSPT Code"; Code[20])
        {
            Description = 'MSPT1.0';
            TableRelation = "MSPT Header".Code WHERE(Status = CONST(Released));

            trigger OnValidate();
            begin
                TestField(Status, Status::Open);

                MSPTOrderDetails.SetRange(Type, MSPTOrderDetails.Type::Sale);
                MSPTOrderDetails.SetRange("Document Type", "Document Type");
                MSPTOrderDetails.SetRange("Document No.", "No.");
                if MSPTOrderDetails.Find('-') then begin
                    MSPTOrderDetails.DeleteAll;
                end;

                MSPTHeader.SetRange(MSPTHeader.Code, "MSPT Code");
                if MSPTHeader.Find('-') then begin
                    "MSPT Details".SetRange("MSPT Details"."MSPT Header Code", "MSPT Code");
                    if "MSPT Details".Find('-') then begin
                        repeat
                            MSPTOrderDetails.Type := MSPTOrderDetails.Type::Sale;
                            MSPTOrderDetails."Document Type" := "Document Type";
                            MSPTOrderDetails."Document No." := "No.";
                            MSPTOrderDetails."Party Type" := MSPTOrderDetails."Party Type"::Customer;
                            MSPTOrderDetails."Party No." := "Sell-to Customer No.";
                            MSPTOrderDetails."MSPT Header Code" := "MSPT Code";
                            //MSPTOrderDetails."Calculation Type" := MSPTHeader.Type;
                            MSPTOrderDetails."MSPT Code" := "MSPT Details".Code;
                            MSPTOrderDetails."MSPT Line No." := "MSPT Details"."Line No.";
                            MSPTOrderDetails.Percentage := "MSPT Details".Percentage;
                            //MSPTOrderDetails.Amount:="MSPT Details".Amount;
                            MSPTOrderDetails.Description := "MSPT Details".Description;
                            MSPTOrderDetails."Calculation Period" := "MSPT Details"."Calculation Period";
                            MSPTOrderDetails.Remarks := "MSPT Details".Remarks;
                            SalesHeader.Get(MSPTOrderDetails."Document Type", MSPTOrderDetails."Document No.");
                            MSPTOrderDetails."Due Date" := CalcDate(MSPTOrderDetails."Calculation Period", "MSPT Date");
                            MSPTOrderDetails.Insert;
                        until "MSPT Details".Next = 0;
                    end;
                end;
            end;
        }
        field(50002; "MSPT Applicable at Line Level"; Boolean)
        {
            Description = 'MSPT1.0';
        }
        field(50003; WayBillNo; Text[30])
        {
        }
        field(50004; "posting time"; Time)
        {
            Enabled = false;
        }
        field(50005; userid1; Code[50])
        {
            Description = 'Rev01';
            Enabled = false;
            TableRelation = User;
        }
        field(50006; "Work Order Number"; Text[30])
        {
            Enabled = false;
        }
        field(60001; "RDSO Charges Paid By"; Option)
        {
            Description = 'B2B';
            OptionMembers = " ","By Customer","By Railways";
        }
        field(60002; "CA Number"; Code[20])
        {
            Description = 'B2B';
            Enabled = false;

            trigger OnLookup();
            begin
                CANumber.SetFilter("Customer No.", '=%1 | %2', '', "Sell-to Customer No.");
                if PAGE.RunModal(60008, CANumber) = ACTION::LookupOK then begin
                    "CA Number" := CANumber.Code;
                    CANumber."Customer No." := "Sell-to Customer No.";
                    CANumber.Modify;
                end;
            end;
        }
        field(60003; "CA Date"; Date)
        {
            Description = 'B2B';
        }
        field(60004; "Type of Enquiry"; Option)
        {
            Description = 'B2B';
            OptionMembers = Direct,Indirect;
        }
        field(60005; "Type of Product"; Option)
        {
            Description = 'B2B';
            OptionMembers = Standard,Customized;
        }
        field(60006; "Document Position"; Option)
        {
            Description = 'B2B';
            Editable = false;
            OptionMembers = Sales,Design,CRM;
        }
        field(60007; "Cancel Short Close"; Option)
        {
            Description = 'B2B';
            OptionCaption = '" ,Cancelled,Short Closed"';
            OptionMembers = " ",Cancelled,"Short Closed";
        }
        field(60008; "RDSO Inspection Required"; Boolean)
        {
            Description = 'B2B';
        }
        field(60009; "RDSO Inspection By"; Option)
        {
            Description = 'B2B';
            OptionMembers = " ","By RDSO","By Consignee";
        }
        field(60010; "BG Required"; Boolean)
        {
            Description = 'B2B';
        }
        field(60011; "BG No."; Code[20])
        {
            Description = 'B2B';
            Enabled = false;
        }
        field(60012; Territory; Code[20])
        {
            Description = 'B2B';
            TableRelation = Territory;
        }
        field(60013; "Security Status"; Code[20])
        {
            Description = 'B2B';
            Enabled = false;
        }
        field(60014; "LD Amount"; Decimal)
        {
            BlankZero = true;
            Description = 'B2B';
            Enabled = false;
        }
        field(60015; "RDSO Charges"; Decimal)
        {
            BlankZero = true;
            Description = 'B2B';
        }
        field(60016; "Customer OrderNo."; Code[65])
        {
            Description = 'B2B';
        }
        field(60017; "Customer Order Date"; Date)
        {
            Description = 'B2B';
        }
        field(60018; "Security Deposit"; Option)
        {
            Description = 'B2B';
            OptionCaption = '" ,BG,FDR,DD,Running Bills"';
            OptionMembers = " ",BG,FDR,DD,"Running Bills";
        }
        field(60019; "RDSO Call Letter"; Option)
        {
            Description = 'B2B';
            OptionCaption = '" ,Customer,RDSO"';
            OptionMembers = " ",Customer,RDSO;
        }
        field(60020; "Enquiry Status"; Option)
        {
            Description = 'B2B';
            OptionCaption = 'Open,Closed,Order Received';
            OptionMembers = Open,Closed,"Order Received";
        }
        field(60021; "Project Completion Date"; Date)
        {
            Description = 'B2B';

            trigger OnValidate();
            begin
                if "Document Type" = "Document Type"::Order then begin
                    if "Project Completion Date" < "Promised Delivery Date" then
                        Error('Project Completion Date must be Greater than Promised Delivery Date');
                end;
            end;
        }
        field(60022; "Extended Date"; Date)
        {
            Description = 'B2B';
        }
        field(60023; "Bktord Des Approval"; Boolean)
        {
        }
        field(60024; "SalOrd Des Approval"; Boolean)
        {
        }
        field(60030; "Type of Customer"; Option)
        {
            Description = 'B2B';
            OptionCaption = 'Existing,New';
            OptionMembers = Existing,New;
        }
        field(60031; "Nature of Enquiry"; Option)
        {
            Description = 'B2B';
            OptionCaption = 'Single,Multiple';
            OptionMembers = Single,Multiple;
        }
        field(60032; Product; Code[10])
        {
            Description = 'B2B';
            TableRelation = "Service Item Group";

            trigger OnValidate();
            begin
                //ADDED BY PRANAVI ON 01-01-2016
                if (Product = 'SPARES') and ("Sell-to Customer No." = 'CUST00536') then begin
                    "Order Completion Period" := 45;
                    Validate("Shortcut Dimension 1 Code", 'CUS-005');
                    "Customer OrderNo." := 'NILL';
                    if "Order Date" <> 0D then
                        "Customer Order Date" := "Order Date"
                    else
                        "Customer Order Date" := Today();
                    "RDSO Inspection Req" := "RDSO Inspection Req"::NA;
                    "Call letters Status" := "Call letters Status"::NA;
                    "BG Status" := "BG Status"::NA;
                    Validate("Payment Terms Code", '100-I');
                end;
                //end by pranavi
            end;
        }
        field(60033; "Quote Value"; Decimal)
        {
            CalcFormula = Sum("Sales Line"."Line Amount" WHERE("Document Type" = CONST(Quote),
                                                                "Document No." = FIELD("No.")));
            Description = 'B2B';
            FieldClass = FlowField;
        }
        field(60034; "Installation Amount"; Decimal)
        {
            CalcFormula = Sum("Sales Line"."Line Amount(LOA)" WHERE("Document No." = FIELD("No."),
                                                                     "No." = FILTER('47300')));
            Description = 'B2B';
            FieldClass = FlowField;
        }
        field(60035; "Bought out Items Amount"; Decimal)
        {
            CalcFormula = Sum("Sales Line"."Line Amount(LOA)" WHERE("Document No." = FIELD("No."),
                                                                     "Gen. Prod. Posting Group" = FILTER('BOI' | 'RAW-MAT')));
            Description = 'B2B';
            FieldClass = FlowField;
        }
        field(60036; "Software Amount"; Decimal)
        {
            CalcFormula = Sum("Sales Line"."Line Amount(LOA)" WHERE("Document No." = FIELD("No."),
                                                                     "No." = FILTER('46400' | '18100' | '47505')));
            Description = 'B2B';
            FieldClass = FlowField;
        }
        field(60037; "Total Order Amount"; Decimal)
        {
            CalcFormula = Sum("Sales Line"."Line Amount" WHERE("Document No." = FIELD("No.")));
            Description = 'B2B';
            FieldClass = FlowField;
        }
        field(60038; "Total Order Amount(With Taxes)"; Decimal)
        {
            CalcFormula = Sum("Sales Line"."Amount Including Tax" WHERE("Document No." = FIELD("No.")));
            Description = 'EFF';
            FieldClass = FlowField;
        }
        field(60041; "Security Deposit Amount"; Decimal)
        {
            Description = 'B2B';
        }
        field(60042; "Deposit Payment Due Date"; Date)
        {
            Description = 'B2B';
        }
        field(60043; "Deposit Payment Date"; Date)
        {
            Description = 'B2B';
        }
        field(60044; "Security Deposit Status"; Code[20])
        {
            Description = 'B2B';
            Enabled = false;
        }
        field(60045; "SD Requested Date"; Date)
        {
            Description = 'B2B';
        }
        field(60046; "SD Required Date"; Date)
        {
            Description = 'B2B';
        }
        field(60047; "SecurityDeposit Exp. Rcpt Date"; Date)
        {
            Description = 'B2B';
        }
        field(60048; "Adjusted from EMD"; Decimal)
        {
            CalcFormula = Sum("Tender Ledger Entries".Amount WHERE("Tender No." = FIELD("Tender No."),
                                                                    "Transaction Type" = CONST(Adjustment),
                                                                    "Mode of Receipt / Payment" = FILTER(<> Customer)));
            Description = 'B2B';
            Editable = false;
            Enabled = false;
            FieldClass = FlowField;
        }
        field(60049; "Adjusted from Running Bills"; Decimal)
        {
            CalcFormula = Sum("Tender Ledger Entries".Amount WHERE("Tender No." = FIELD("Tender No."),
                                                                    "Transaction Type" = FILTER(Adjustment),
                                                                    "Mode of Receipt / Payment" = FILTER(Customer)));
            Description = 'B2B';
            Editable = false;
            Enabled = false;
            FieldClass = FlowField;
        }
        field(60050; "Tender No."; Code[20])
        {
            Description = 'B2B';
            TableRelation = "Tender Header";
        }
        field(60051; "SD Paid Amount"; Decimal)
        {
            CalcFormula = Sum("Tender Ledger Entries".Amount WHERE("Tender No." = FIELD("Tender No."),
                                                                    Type = CONST(SD),
                                                                    "Transaction Type" = CONST(Payment)));
            Description = 'B2B';
            Editable = false;
            Enabled = false;
            FieldClass = FlowField;
        }
        field(60052; "SD Received Amount"; Decimal)
        {
            CalcFormula = Sum("Tender Ledger Entries".Amount WHERE("Tender No." = FIELD("Tender No."),
                                                                    Type = CONST(SD),
                                                                    "Transaction Type" = CONST(Receipt)));
            Description = 'B2B';
            Editable = false;
            Enabled = false;
            FieldClass = FlowField;
        }
        field(60053; "Final Bill Date"; Date)
        {
            Description = 'B2B';

            trigger OnValidate();
            begin
                "Due Date" := CalcDate("Warranty Period", "Final Bill Date");
            end;
        }
        field(60054; "Warranty Period"; DateFormula)
        {
            Description = 'B2B';

            trigger OnValidate();
            begin
                if "Final Bill Date" <> 0D then
                    "Due Date" := CalcDate("Warranty Period", "Final Bill Date");
            end;
        }
        field(60055; "SD Status"; Option)
        {
            Description = 'B2B';
            OptionCaption = 'Not Received,Received,NA';
            OptionMembers = "Not Received",Received,NA;
        }
        field(60056; "Released to Sales User ID"; Code[50])
        {
            Description = 'Rev01';
            Editable = false;
            Enabled = false;
            TableRelation = User."User Name";
        }
        field(60057; "Released to Sales Date"; Date)
        {
            Editable = false;
        }
        field(60058; "Released to Design User ID"; Code[40])
        {
            Description = 'Rev01';
            Editable = false;
            Enabled = false;
            TableRelation = User;
        }
        field(60059; "Released to Design Date"; Date)
        {
            Editable = false;
        }
        field(60060; "Quote No 2."; Code[20])
        {
            Description = 'B2B';
            Editable = false;
            Enabled = false;
        }
        field(60061; "Sale Order Total Amount"; Decimal)
        {
        }
        field(60062; "Reason For Pending"; Text[230])
        {
            Enabled = false;
        }
        field(60063; "Order Status"; Option)
        {
            OptionMembers = ,Dispatched,Inprogress,"Ready For Dispatch","Ready For RDSO","Under RDSO Inspection","Yet to Start","Order Pending","   ","Temporary Close";
        }
        field(60064; Inspection; Code[50])
        {
            Enabled = false;
        }
        field(60065; CallLetterExpireDate; Date)
        {
        }
        field(60066; CallLetterRecivedDate; Date)
        {

            trigger OnValidate();
            begin
                SalesLine.Reset;
                SalesLine.SetRange("Document No.", Rec."No.");
                SalesLine.SetFilter(Quantity, '>%1', 0);
                if SalesLine.FindSet then
                    repeat
                        SalesLine."Material Reuired Date" := Rec.CallLetterRecivedDate;
                        SalesLine.Modify;
                    until SalesLine.Next = 0;
            end;
        }
        field(60067; "Payments Date"; Date)
        {
            Enabled = false;
        }
        field(60068; Installation; Option)
        {
            OptionMembers = " ",RlyInstallation,EffInstallation,"RLY&EFF";
        }
        field(60069; "Inst.Status"; Option)
        {
            OptionMembers = ," Raliway Pending","Railway Inprogress",Inprogress,Planned,"To Be Planned",Completed," ";
        }
        field(60070; "Base PLan Comp. Date"; Date)
        {
            Enabled = false;
        }
        field(60071; "Revised Target Date"; Date)
        {
            Enabled = false;
        }
        field(60072; "Sales Date"; Date)
        {
            Enabled = false;
        }
        field(60073; Remarks; Text[230])
        {
        }
        field(60074; "Call letters Status"; Option)
        {
            OptionMembers = " ",Received,Pending,NA,"Cust.Pending";

            trigger OnValidate();
            begin
                SalesLine.Reset;
                SalesLine.SetRange("Document No.", Rec."No.");
                SalesLine.SetFilter(Quantity, '>%1', 0);
                if SalesLine.FindSet then
                    repeat
                        SalesLine."Call Letter Status" := Rec."Call letters Status";
                        SalesLine.Modify;
                    until SalesLine.Next = 0;
            end;
        }
        field(60075; "Call Letter Exp.Date"; Date)
        {

            trigger OnValidate();
            begin
                //Commented by Vishnu Priya on 18-07-2020  as per the Mail from Sales Dept.
                /*SalesLine.RESET;
                SalesLine.SETRANGE("Document No.",Rec."No.");
                SalesLine.SETFILTER(Quantity,'>%1',0);
                IF SalesLine.FINDSET THEN
                  REPEAT
                    SalesLine."Call Letter Exp Date" := Rec."Call Letter Exp.Date";
                    SalesLine.MODIFY;
                  UNTIL SalesLine.NEXT =0;
                  */
                //Commented by Vishnu Priya on 18-07-2020

            end;
        }
        field(60076; "BG Status"; Option)
        {
            OptionMembers = " ",Submitted,Pending,NA;
        }
        field(60077; "Inst.Start Date"; Date)
        {
        }
        field(60078; "Exp.Payment"; Decimal)
        {
        }
        field(60080; "Revised Comp.Date"; Date)
        {
            Enabled = false;
        }
        field(60081; "Assured Date"; Date)
        {
        }
        field(60082; "Deviated Days"; Code[10])
        {
            Enabled = false;
        }
        field(60083; "Product 1"; Text[30])
        {
            Enabled = false;
        }
        field(60084; "Product 2"; Text[30])
        {
            Enabled = false;
        }
        field(60085; "Product 3"; Text[30])
        {
            Enabled = false;
        }
        field(60086; "Product 4"; Text[30])
        {
            Enabled = false;
        }
        field(60087; Consignee; Text[50])
        {
            Description = 'modified from station name to consignee by sujani';
        }
        field(60088; "Shortage Calculation"; Boolean)
        {
        }
        field(60089; "Sale Order No."; Code[20])
        {
            TableRelation = "Sales Header"."No." WHERE("Document Type" = CONST(Order));
        }
        field(60090; "RDSO Inspection Req"; Option)
        {
            OptionMembers = " ",YES,NA;
        }
        field(60095; "Order Assurance"; Boolean)
        {
        }
        field(60096; "Expected Order Month"; Option)
        {
            OptionMembers = "  ",APR,MAY,JUN,JUL,AUG,SEP,OCT,NOV,DEC,JAN,FEB,MAR,"     ";
        }
        field(60097; "Sale Order Created"; Boolean)
        {
        }
        field(60098; "Purchase Value"; Decimal)
        {
            CalcFormula = Sum("Item Lot Numbers".Total WHERE("Sales Order No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(60099; "Request for Authorisation"; Boolean)
        {
        }
        field(60110; "Shipment Type"; Option)
        {
            Description = 'added by sujani';
            OptionMembers = "  ","Partially Allowed","Partially Not Allowed","No issue in Shipment";
        }
        field(60115; "SD Running Bill Percent"; Decimal)
        {
            Enabled = false;
        }
        field(60116; "Order Completion Period"; Integer)
        {
            MaxValue = 360;
            MinValue = 1;
        }
        field(60117; "Expecting Week"; Date)
        {
        }
        field(60119; "Total Order(LOA)Value"; Decimal)
        {
            CalcFormula = Sum("Sales Line"."Line Amount(LOA)" WHERE("Document No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(60120; "Pending(LOA)Value"; Decimal)
        {
            CalcFormula = Sum("Sales Line"."OutStanding(LOA)" WHERE("Document No." = FIELD("No."),
                                                                     "Document Type" = FILTER(Quote | Order)));
            FieldClass = FlowField;
        }
        field(60121; "Blanket Order No"; Text[30])
        {
        }
        field(60122; "Installation Amount(CS)"; Decimal)
        {
        }
        field(60139; "First Released Date Time"; DateTime)
        {
        }
        field(80000; "Order Released Date"; Date)
        {
            Caption = 'Order Released Date';
        }
        field(80001; "Payment Received"; Boolean)
        {
            Description = 'Pranavi';

            trigger OnValidate();
            begin
                //Added by pranavi on 18-Jun-2015
                SHA.Reset;
                SHA.SetFilter(SHA."No.", "No.");
                if "Payment Received" = true then begin
                    if "Customer Posting Group" <> 'PRIVATE' then
                        Error('Allowed Only for PRIVATE Customers!')
                    else begin
                        if Order_After_CF_Integration = true then
                            Error('Not Allowed for Orders after Cashflow Payment Terms Integration!');
                    end;
                    if not SHA.FindFirst then
                        Error('Order Must be released at least one time!');
                end;
                //end by pranavi
            end;
        }
        field(80002; "Order Verified"; Boolean)
        {
            Description = 'Pranavi';
        }
        field(80003; "Calculate Tax Structure"; Boolean)
        {
            Description = 'Pranavi';
        }
        field(80004; "RDSO No"; Option)
        {
            Description = 'Added by Vijaya';
            OptionMembers = ,Pending,"RDSO 01","RDSO 02","RDSO 03","RDSO 04","RDSO 05","RDSO 06","RDSO 07","RDSO 08","RDSO 09","RDSO 10";
        }
        field(80005; "EMD Amount"; Decimal)
        {
        }
        field(80006; "Verfication Req MailID"; Text[30])
        {
            Description = 'Added by Vijaya';
            Enabled = false;
        }
        field(80007; "Verification Status"; Option)
        {
            Description = 'Added by Vijaya';
            OptionMembers = " ",Accept,Reject,Request;
        }
        field(80008; SecDepStatus; Option)
        {
            Description = 'Added by Pranavi for sd tracking';
            OptionCaption = 'Running,Warranty,Due,Received';
            OptionMembers = Running,Warranty,Due,Received;
        }
        field(80009; "Remarks for Sales Status"; Text[20])
        {
            Enabled = false;

            trigger OnValidate();
            begin
                if (UserId in ['EFFTRONICS\VIJAYA', 'EFFTRONICS\PRANAVI', 'EFFTRONICS\ANILKUMAR', 'EFFTRONICS\SPURTHI', 'EFFTRONICS\BSATISH', 'EFFTRONICS\SARDHAR']) then begin
                    Modify;
                    FlagValue := true;
                end;
            end;
        }
        field(80010; "PT Release Auth Stutus"; Option)
        {
            Description = 'Added by Pranavi for PT Authorizations';
            OptionMembers = " ","Sent For Auth",Authorized,Rejected;
        }
        field(80011; "PT Post Auth Stutus"; Option)
        {
            Description = 'Added by Pranavi for PT Authorizations';
            OptionMembers = " ","Sent For Auth",Authorized,Rejected;
        }
        field(80012; Order_After_CF_Integration; Boolean)
        {
            Description = 'Added by Pranavi for PT Authorizations';
        }
        field(80013; "Order Confirmed"; Boolean)
        {
        }
        field(80014; "SD Fin Verification"; Option)
        {
            Description = 'Added by Vijaya for Finance Verification';
            OptionCaption = '" ,Released,Order Verified, Final Payment,Final Verified,Need Data Correction"';
            OptionMembers = " ",Released,"Order Verified"," Final Payment","Final Verified","Need Data Correction";
        }
        field(80017; Vertical; Option)
        {
            Description = 'Added by Vijaya for Vertical information';
            OptionMembers = " ","Smart Signalling","Smart Cities","Smart Building",IOT,other;
        }
        field(80022; "Tender Published Date"; Date)
        {
            Description = 'added by sujani for Pre Expected orderes';
        }
        field(80023; "Tender Due Date"; Date)
        {
            Description = 'added by sujani for Pre Expected orderes';
        }
        field(80024; "Railway Division"; Code[10])
        {
            TableRelation = Division."Division Code";
        }
        field(80025; "BG Fin Status"; Option)
        {
            Description = 'Added By Vishnu for BG Status Confirmation';
            OptionCaption = '" ,Final Payment"';
            OptionMembers = " ","Final Payment";
        }
        field(80100; "Insurance Applicable"; Boolean)
        {
        }
        field(80101; Customer_PAN_No; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(80102; Location_PAN_No; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
   
      
    var
        CANumber: Record "CA Number";
        "--MSPT---": Integer;
        MSPTOrderDetails: Record "MSPT Order Details";
        MSPTHeader: Record "MSPT Header";
        "MSPT Details": Record "MSPT Line";
        "No. of Days": Integer;
        TransShptHeader: Record "Transfer Shipment Header";
        TO_doc: Text;
        temp1: Integer;
        SHA: Record "Sales Header Archive";
        SalesPersonOrPurchsr: Record "Salesperson/Purchaser";
        FlagValue: Boolean;
        ArchiveManagement: Codeunit ArchiveManagement;
}

