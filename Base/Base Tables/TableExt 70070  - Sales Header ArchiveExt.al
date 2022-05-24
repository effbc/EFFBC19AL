tableextension 70070 SalesHeaderArchiveExt extends "Sales Header Archive"
{
    fields
    {

        field(60001; "RDSO Charges Paid By"; Enum RDSOChargesPaidBy)
        {
            Description = 'B2B';
        }
        field(60002; "CA Number"; Code[20])
        {
            Description = 'B2B';
        }
        field(60003; "CA Date"; Date)
        {
            Description = 'B2B';
        }
        field(60004; "Type of Enquiry"; Enum TypeofEnquiry)
        {
            Description = 'B2B';
        }
        field(60005; "Type of Product"; Enum TypeofProduct)
        {
            Description = 'B2B';
        }
        field(60006; "Document Position"; Enum DocumentPosition)
        {
            Description = 'B2B';

        }
        field(60007; "Cancel / Short Close"; Enum CancelShortClose)
        {
            Caption = 'Cancel / Short Close';
            Description = 'B2B';
        }
        field(60008; "RDSO Inspection Required"; Boolean)
        {
            Description = 'B2B';
        }
        field(60009; "RDSO Inspection By"; Enum RDSOInspectionBy)
        {
            Description = 'B2B';
        }
        field(60010; "BG Required"; Boolean)
        {
            Description = 'B2B';
        }
        field(60011; "BG No."; Code[20])
        {
            Description = 'B2B';
        }
        field(60012; Territory; Code[20])
        {
            Description = 'B2B';
            TableRelation = Territory;
        }
        field(60013; "Security Status"; Code[20])
        {
            Description = 'B2B';
        }
        field(60014; "LD Amount"; Decimal)
        {
            Description = 'B2B';
        }
        field(60015; "RDSO Charges"; Decimal)
        {
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
        field(60018; "Security Deposit"; Enum SecurityDeposit)
        {
            Description = 'B2B';
        }
        field(60019; "RDSO Call Letter"; Enum RDSOCallLetter)
        {
            Description = 'B2B';

        }
        field(60020; "Enquiry Status"; Enum EnquiryStatus)
        {
            Description = 'B2B';
        }
        field(60021; "Project Completion Date"; Date)
        {
            Description = 'B2B';
        }
        field(60022; "Extended Date"; Date)
        {
            Description = 'B2B';
        }
        field(60041; "Security Deposit Amount"; Decimal)
        {
        }
        field(60050; "Tender No."; Code[20])
        {
            Description = 'B2B';
            TableRelation = "Tender Header";
        }
        field(60054; "Warranty Period"; DateFormula)
        {
        }
        field(60055; "SD status"; Enum SDstatus)
        {

        }
        field(60061; "Sale Order Total Amount"; Decimal)
        {
        }
        field(60065; CallLetterExpireDate; Date)
        {
        }
        field(60066; CallLetterRecivedDate; Date)
        {
        }
        field(60073; Remarks; Text[250])
        {
        }
        field(60074; "Call letters Status"; Enum CalllettersStatus)
        {

        }
        field(60075; "Call Letter Exp.Date"; Date)
        {
        }
        field(60087; Consignee; Text[50])
        {
        }
        field(60121; "Blanket Order No"; Text[30])
        {
        }
        field(60123; "BG Amount"; Decimal)
        {
        }
        field(60125; "EMD Amount"; Decimal)
        {
        }
        field(60127; "Order Status"; Enum OrderStatus)
        {

        }
        field(60128; "BG Date of Issue"; Date)
        {
        }
        field(60129; "BG Expiry Date"; Date)
        {
        }
        field(60130; "Warranty Completed"; Boolean)
        {
        }
        field(60131; "Converted to AMC"; Boolean)
        {
        }
        field(60132; "Bill Attached"; Boolean)
        {
        }
        field(60133; "Scope To AMC"; Enum ScopeToAMC)
        {

        }
        field(60134; "Reference Sale Order"; Code[30])
        {
            TableRelation = "Sales Header" WHERE("Document Type" = FILTER(Order),
                                                  "Customer Posting Group" = CONST('RAILWAYS'));
        }
        field(60135; "Converted AMC Order"; Code[30])
        {
            TableRelation = "Sales Header" WHERE("Document Type" = CONST(Amc),
                                                  "Customer Posting Group" = CONST('RAILWAYS'));
        }
        field(60136; "Warranty Exp Date"; Date)
        {
        }
        field(60137; "BG Status"; Enum BGStatus)
        {

        }
        field(60138; "EMD Status"; Enum EMDStatus)
        {

        }
        field(60139; "First Released Date Time"; DateTime)
        {
        }
        field(60140; SecDepStatus; Enum SecDepStatus)
        {
            Description = 'Added by Pranavi for sd tracking';

        }
        field(80010; "PT Release Auth Stutus"; Enum PTReleaseAuthStutus)
        {
            Description = 'Added by Pranavi for PT Authorizations';

        }
        field(80011; "PT Post Auth Stutus"; Enum PTPostAuthStutus)
        {
            Description = 'Added by Pranavi for PT Authorizations';

        }
        field(80012; Order_After_CF_Integration; Boolean)
        {
            Description = 'Added by Pranavi for PT Authorizations';
        }
        field(80020; "Dimension Corrected"; Boolean)
        {
            Description = 'added  by sujani for Dimension issue clearance (B2B Assistance)';
            Editable = false;
        }
        field(80021; "OLD Dim Set ID"; Integer)
        {
            Description = 'added  by sujani for Dimension issue clearance (B2B Assistance)';
            Editable = false;
            TableRelation = "Dimension Set Entry Backup2"."Dimension Set ID" WHERE("Dimension Set ID" = FIELD("OLD Dim Set ID"));

            trigger OnLookup();
            begin
                //ShowDimensionsOLD;
            end;
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
        field(80025; "BG Fin Status"; Enum BGFinStatus)
        {
            Description = 'Added By Vishnu for BG Status Confirmation';

        }
        field(80100; "Insurance Applicable"; Boolean)
        {
        }
    }
    keys
    {
        key(Key4; "Document Type", "No.", "Date Archived", "Time Archived")
        {
        }
    }
}

