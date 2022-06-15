pageextension 70188 SalesOrderArchiveExt extends "Sales Order Archive"
{


    layout
    {



        addafter("Sell-to Contact")
        {
            field("Document Type"; Rec."Document Type")
            {
            }
            field("Cancel / Short Close"; Rec."Cancel / Short Close")
            {
            }

        }
        addafter(Status)
        {
            field("Customer OrderNo."; Rec."Customer OrderNo.")
            {
            }
            field("Customer Order Date"; Rec."Customer Order Date")
            {
            }
            field("Sale Order Total Amount"; Rec."Sale Order Total Amount")
            {
            }

            field("First Released Date Time"; Rec."First Released Date Time")
            {
            }
            field(Remarks; Rec.Remarks)
            {
                MultiLine = true;
            }
        }
        addafter("Payment Terms Code")
        {
            field("Customer Posting Group"; Rec."Customer Posting Group")
            {
            }
        }
        addbefore(Shipping)
        {
            field("Tender No."; Rec."Tender No.")
            {
            }
            /*field("Archived By"; Rec."Archived By")
            {
            }*/
        }
        addafter(Version)
        {
            group(Others)
            {
                Caption = 'Others';
                field("RDSO Inspection By"; Rec."RDSO Inspection By")
                {
                }
                field("RDSO Charges"; Rec."RDSO Charges")
                {
                }
                field("RDSO Call Letter"; Rec."RDSO Call Letter")
                {
                }
                field("CA Date"; Rec."CA Date")
                {
                }
                field("RDSO Charges Paid By"; Rec."RDSO Charges Paid By")
                {
                }
                field("LD Amount"; Rec."LD Amount")
                {
                }
                field("Security Deposit"; Rec."Security Deposit")
                {
                }
                field("RDSO Inspection Required"; Rec."RDSO Inspection Required")
                {
                }
                field("CA Number"; Rec."CA Number")
                {
                }
                field("Document Position"; Rec."Document Position")
                {
                }
                field("Reason Code"; Rec."Reason Code")
                {
                }
                field("<Tender No.2>"; Rec."Tender No.")
                {
                }
            }
            group("Call Letter Status")
            {
                CaptionML = ENU = 'Call Letter Status',
                            ENN = 'Version';
                field(CallLetterExpireDate; Rec.CallLetterExpireDate)
                {
                }
                field(CallLetterRecivedDate; Rec.CallLetterRecivedDate)
                {
                }
                field("Call letters Status"; Rec."Call letters Status")
                {
                }
                field("Call Letter Exp.Date"; Rec."Call Letter Exp.Date")
                {
                }
            }
        }
    }
    actions
    {



        modify(Restore)
        {



            Promoted = true;
        }
        addafter(Restore)
        {
            action(Attachment)
            {

                trigger OnAction();
                begin
                    //added by pranavi on 06-03-2015 for attachments
                    CustAttachments;
                    //end by pranavi
                end;
            }
            action(Doc)
            {

                trigger OnAction();
                begin
                    //DOWNLOAD('eff-cpu-428\D:\Shortage_Doc.pdf');
                    HYPERLINK('\\erpserver\ErpAttachments\Authorisation.PDF');
                end;
            }
        }
    }



    procedure CustAttachments();
    var
        CustAttach: Record Attachments;
    begin
        //added by pranavi on 06-03-2015 for attachments
        CustAttach.RESET;
        CustAttach.SETRANGE("Table ID", DATABASE::"Sales Header");
        CustAttach.SETRANGE("Document No.", "No.");
        CustAttach.SETRANGE("Document Type", "Document Type");

        PAGE.RUN(PAGE::"ESPL Attachments", CustAttach);
        //end by pranavi
    end;



}

