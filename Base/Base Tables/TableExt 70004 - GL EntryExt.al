tableextension 70004 GLEntryExt extends "G/L Entry"
{


    fields
    {
        modify("Posting Date")
        {
            ClosingDates = true;
        }
        modify("Document Type")
        {
            OptionCaptionML = ENU = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund,Balance Entry', ENN = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund,Balance Entry';

            //Unsupported feature: Change OptionString on ""Document Type"(Field 5)". Please convert manually.

        }


        field(50000; "Cheque No."; Code[20])
        {
        }
        field(50001; "Cheque Date"; Date)
        {
        }
        field(60019; "Vendor Invoice Date"; Date)
        {
        }
        field(60063; "customer Ord No"; Code[65])
        {
        }
        field(60064; "Payment Type"; Option)
        {
            OptionCaption = ',Supply Payment,AMC Amount,Final Payment,Inst.Payment,Advance,Receipt,Contra,payment,Journal,Excess';
            OptionMembers = ,"Supply Payment","AMC Amount","Final Payment","Inst.Payment",Advance,Receipt,Contra,payment,Journal,Excess;
        }
        field(60069; "From Date"; Date)
        {
        }
        field(60070; "To Date"; Date)
        {
        }
        field(60071; "System Date"; Date)
        {
        }
        field(60072; Attachment; Boolean)
        {
        }
        field(60073; "Apply Entry No"; Integer)
        {
        }
        field(60074; Check; Boolean)
        {
        }
        field(60075; "Sale Order No."; Code[20])
        {
        }
        field(60079; "DD/FDR No."; Code[20])
        {
            Description = 'Rev01';
        }
        field(60080; "Payment Through"; Option)
        {
            Description = 'Rev01';
            OptionCaption = '" ,Cheque,Cash,DD,FDR,RTGS,FTT,Credit-Card"';
            OptionMembers = " ",Cheque,Cash,DD,FDR,RTGS,FTT,"Credit-Card";
        }
        field(60081; "Tender No"; Code[20])
        {
        }
        field(60082; "Final Bill Payment"; Boolean)
        {
            Description = 'Added by Pranavi for SD Tracking';
        }
        field(60083; "Currency Amount"; Decimal)
        {
            Description = 'Added by Pranavi for foreign currency tracking';
        }
        field(60084; "Currency Rate"; Decimal)
        {
            Description = 'Added by Pranavi for foreign currency tracking';
        }
        field(60085; "Currency Code"; Code[10])
        {
            Description = 'Added by Pranavi for foreign currency tracking';
        }
        field(60086; "Old Order"; Boolean)
        {
        }
        field(60087; Vertical; Option)
        {
            Description = 'Added by vijaya for vertical expenditure';
            OptionCaption = '" ,Smart Signalling,Smart Cities,Smart Building,IOT,other,AMC"';
            OptionMembers = " ","Smart Signalling","Smart Cities","Smart Building",IOT,other,AMC;
        }
        field(60090; "Dimension Corrected"; Boolean)
        {
            Description = 'added  by sujani for Dimension issue clearance (B2B Assistance)';
            Editable = false;
        }
        field(60091; "OLD Dim Set ID"; Integer)
        {
            Description = 'added  by sujani for Dimension issue clearance (B2B Assistance)';
            Editable = false;
            TableRelation = "Dimension Set Entry Backup2"."Dimension Set ID" WHERE("Dimension Set ID" = FIELD("OLD Dim Set ID"));

            trigger OnLookup();
            begin
                ShowDimensionsOLD;
            end;
        }
        field(60092; "GST TDS Claimed Date"; Date)
        {
            Description = 'Added by Vishnu Priya for the TDS Claiming Process';
        }
    }



    var
        USER: Record User;
        Body: Text[250];
        Mail_From: Text[250];
        Mail_To: Text[250];
        Mail: Codeunit Email;
        Subject: Text[250];
        UserSetupGRec: Record "User Setup";
}

