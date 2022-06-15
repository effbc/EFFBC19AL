pageextension 70164 PurchasesPayablesSetupExt extends "Purchases & Payables Setup"
{


    layout
    {



        addbefore("Default Posting Date")
        {
            field("RCM Exempt Start Date (Unreg)"; "RCM Exempt Start Date (Unreg)")
            {
            }
            field("RCM Exempt End Date (Unreg)"; "RCM Exempt End Date (Unreg)")
            {
            }
        }
        addbefore("Background Posting")
        {
            field("Purchase Indent Nos."; Rec."Purchase Indent Nos.")
            {
            }
            field("Enquiry Nos."; Rec."Enquiry Nos.")
            {
            }
            field("RFQ Nos."; Rec."RFQ Nos.")
            {
            }
            field("ICN Nos."; Rec."ICN Nos.")
            {
            }
            group(Weightages)
            {
                Caption = 'Weightages';
                field("Price Weightage"; Rec."Price Weightage")
                {
                    Caption = 'Price';
                }
                field("Quality Weightage"; Rec."Quality Weightage")
                {
                    Caption = 'Quality';
                }
                field("Delivery Weightage"; Rec."Delivery Weightage")
                {
                    Caption = 'Delivery';
                }
                field("Payment Terms Weightage"; Rec."Payment Terms Weightage")
                {
                    Caption = 'Payment Terms';
                }
                field("Default Delivery Rating"; Rec."Default Delivery Rating")
                {
                }
                field("Default Quality Rating"; Rec."Default Quality Rating")
                {
                }
            }
        }
    }

    var
        temp: Decimal;
        text000: Label 'Total weightage should be equal to hundred';




}

