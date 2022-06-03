pageextension 70190 SalesOrderListExt extends 9305
{


    layout
    {





        addafter("Sell-to Customer Name")
        {
            field(Product; Product)
            {
            }
            field("Shipment Type"; Rec."Shipment Type")
            {
            }
            field("Order Released Date"; Rec."Order Released Date")
            {
            }
            field("Call letters Status"; Rec."Call letters Status")
            {
            }
            field(CallLetterRecivedDate; REc.CallLetterRecivedDate)
            {
            }
            field("Customer OrderNo."; Rec."Customer OrderNo.")
            {
            }
            field(Vertical; Vertical)
            {
            }
        }
        addafter("Sell-to Country/Region Code")
        {
            field("Sell-to City"; Rec."Sell-to City")
            {
            }
        }
        addafter("Ship-to Post Code")
        {
            field("Ship-to City"; Rec."Ship-to City")
            {
            }
        }
        addafter("Job Queue Status")
        {
            field("Total Order(LOA)Value"; Rec."Total Order(LOA)Value")
            {
            }
            field("Pending(LOA)Value"; Rec."Pending(LOA)Value")
            {
            }
            field("Installation Amount"; Rec."Installation Amount")
            {
            }
            field("Software Amount"; Rec."Software Amount")
            {
            }
            field("Blanket Order No"; Rec."Blanket Order No")
            {
            }
            field("Sale Order Total Amount"; Rec."Sale Order Total Amount")
            {
            }
            field("Customer Posting Group"; Rec."Customer Posting Group")
            {
            }
            field("Security Deposit Amount"; Rec."Security Deposit Amount")
            {
            }
            field("SD Status"; Rec."SD Status")
            {
            }
            field("Tender No."; Rec."Tender No.")
            {
            }
            field("Warranty Period"; Rec."Warranty Period")
            {
            }
            field("Project Completion Date"; Rec."Project Completion Date")
            {
            }
            field(Order_After_CF_Integration; Rec.Order_After_CF_Integration)
            {
            }
            field("Customer Order Date"; Rec."Customer Order Date")
            {
            }
            field(Structure; Rec.Structure)
            {
            }
            field("Customer GST Reg. No."; Rec."Customer GST Reg. No.")
            {
            }
            field("Verification Status"; Rec."Verification Status")
            {
            }
            group(Control1102152005)
            {
                Editable = false;
                ShowCaption = false;
                grid(Control1102152004)
                {
                    ShowCaption = false;
                    group(Control1102152003)
                    {
                        ShowCaption = false;
                        field("TotalOrders+FORMAT(Rec.COUNT)"; TotalOrders + FORMAT(Rec.COUNT))
                        {
                            Editable = false;
                        }
                    }
                }
            }
        }
    }
    actions
    {

        // Name on "Action 1102601013". Please convert manually.

        modify(Statistics)
        {
            Promoted = true;
        }



        modify(Release)
        {
            Promoted = true;
        }
        modify(Reopen)
        {
            Promoted = true;
        }


        modify(Post)
        {


            Promoted = true;
            PromotedIsBig = true;
        }
        modify("Action 1102601004") //      Name="Post and &Print";
        {


            Promoted = true;
            PromotedIsBig = true;


        }


        modify("Post &Batch")
        {



            Promoted = true;


        }



        modify("Print Confirmation")
        {



            Promoted = true;


        }



        modify("Sales Reservation Avail.")
        {


            Promoted = true;



        }
        addafter(CancelApprovalRequest)
        {
            action(OMSDump)
            {
                Image = Export;

                trigger OnAction();
                begin

                    OCount := 0;
                    Orders := '';
                    SH.RESET;
                    SH.SETCURRENTKEY("Document Type", "No.");
                    SH.SETFILTER(SH."Document Type", '%1', SH."Document Type"::Order);
                    SH.SETFILTER(SH.Status, '%1', SH.Status::Released);
                    SH.SETFILTER(SH."No.", '<>%1', 'EFF/SAL/14-15/431');
                    MESSAGE('Total ' + FORMAT(SH.COUNT) + ' orders are Released!');
                    IF SH.FINDSET THEN
                        REPEAT
                            ChngLogEntry.RESET;
                            ChngLogEntry.SETCURRENTKEY("Entry No.");
                            ChngLogEntry.SETFILTER(ChngLogEntry."Primary Key Field 2 Value", FORMAT(SH."No."));
                            ChngLogEntry.SETFILTER(ChngLogEntry."Field No.", '<>%1|%2|%3', 60016, 60017, 60117);
                            IF ChngLogEntry.COUNT > 0 THEN BEGIN
                                SL.RESET;
                                SL.SETRANGE("Document Type", SH."Document Type");
                                SL.SETRANGE("Document No.", SH."No.");
                                IF SL.FINDFIRST THEN BEGIN
                                    IF (OMSIntegrateCode.SaleOrderCreationinOMS(SH)) = FALSE THEN BEGIN
                                        MESSAGE('Error occured in OMS integration and record is not posted for order' + FORMAT(SH."No."));
                                    END;
                                END;
                                OCount := OCount + 1;
                                //    Orders:=Orders+'\'+SH."No.";
                            END;
                        UNTIL SH.NEXT = 0;
                    MESSAGE('Total ' + FORMAT(OCount) + ' orders are forwarded to OMS!');
                    //MESSAGE('Orders are'+Orders);
                    //End by Pranavi
                end;
            }
            action(Private_PT_User_Manual)
            {
                Caption = 'Private_Payment  Terms_User_Manual';
                Image = Document;

                trigger OnAction();
                begin
                    HYPERLINK('\\erpserver\ErpAttachments\Private_Payment_Terms_User Manual.pdf');
                end;
            }
        }
    }



    var
        OCount: Integer;
        Orders: Text[1024];
        ChngLogEntry: Record "Change Log Entry";
        SH: Record "Sales Header";
        SL: Record "Sales Line";
        OMSIntegrateCode: Codeunit SQLIntegration;
        TotalOrders: Label '"Total Orders: "';




}

