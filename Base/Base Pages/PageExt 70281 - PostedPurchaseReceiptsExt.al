pageextension 70281 PostedPurchaseReceiptsExt extends 145
{
    layout
    {
        addfirst(Control1)
        {
            field(COUNT; COUNT)
            {

            }
        }
        addafter("No.")
        {
            field("Order No."; "Order No.")
            {

            }
            field("Vendor Shipment No."; "Vendor Shipment No.")
            {

            }
            field("Vendor Excise Invoice No."; "Vendor Excise Invoice No.")
            {

            }
            field("Vendor Invoice Date"; "Vendor Invoice Date")
            {

            }
        }

        addafter("Order Address Code")
        {
            field(Control1102152005; "QC Passed")
            {
                Editable = FALSE;
            }
            field("Bill Received"; "Bill Received")
            {

            }
            field("Bill Transfered"; "Bill Transfered")
            {

            }
            field("Bill Transfered Date"; "Bill Transfered Date")
            {

            }
        }
        addafter("Document Date")
        {
            field("User ID"; "User ID")
            {

            }
        }
    }

    actions
    {
        addafter("&Navigate")
        {
            action("<AutoMailToVendors>")
            {
                Caption = 'Pending Bills Auto &Mai Vendors';
                Promoted = true;
                PromotedIsBig = true;
                Image = MailSetup;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    // Added by Vijaya on 24-May-2016 for Sending Mail For Bill no recieved Vendors
                    Vendor.RESET;
                    IF Vendor.FINDFIRST THEN BEGIN
                        Vendor.MODIFYALL(Vendor."Mail Required", FALSE);
                        COMMIT;
                    END;
                    RESET;
                    SETCURRENTKEY("Buy-from Vendor No.", "No.");
                    SETRANGE("Bill Received", FALSE);
                    SETRANGE("Bill Transfered", FALSE);
                    SETRANGE(Pending, FALSE);

                    IF FINDFIRST THEN
                        REPEAT
                            PRL.RESET;
                            PRL.SETFILTER(PRL."Document No.", "No.");
                            PRL.SETFILTER(PRL."Qty. Rcd. Not Invoiced", '>%1', 0);
                            PRL.SETFILTER(PRL.Sample, '=%1', FALSE);
                            PRL.SETFILTER(PRL.Quantity, '>%1', 0);
                            IF PRL.FINDFIRST THEN BEGIN
                                Vendor.RESET;
                                Vendor.SETRANGE(Vendor."No.", "Buy-from Vendor No.");
                                IF Vendor.FINDFIRST THEN BEGIN
                                    Vendor."Mail Required" := TRUE;
                                    Vendor.MODIFY;
                                END;
                            END;
                        UNTIL NEXT = 0;
                    VendorList.MailPusposeAssignment('Bill');
                    VendorList.RUN;
                    //End by Vijaya
                end;
            }
            separator(Action1102152004)
            {

            }
            action("QC Passed")
            {
                Caption = 'QC Passed';
                trigger OnAction()
                begin
                    PRH.RESET;
                    PRH.SETCURRENTKEY("No.", "Posting Date");
                    PRH.SETFILTER("Bill Transfered", 'FALSE');
                    PRH.SETFILTER("Bill Received", 'TRUE');
                    PRH.SETFILTER("Vendor Order No.", '<>%1', '');
                    IF PRH.FINDSET THEN
                        REPEAT
                        BEGIN
                            PRL.RESET;
                            PRL.SETCURRENTKEY("Document No.", "Line No.");
                            PRL.SETFILTER("Document No.", PRH."No.");
                            //PRL.SETFILTER("QC Passed",'TRUE');
                            IF PRL.FINDSET THEN
                                REPEAT
                                BEGIN
                                    IF PRL."QC Passed" = TRUE THEN
                                        PRL_QC_PASSED_ALL := TRUE
                                    ELSE
                                        PRL_QC_PASSED_ALL := FALSE;
                                END;
                                UNTIL PRL.NEXT = 0;
                            IF PRL_QC_PASSED_ALL = TRUE THEN BEGIN
                                PRH."QC Passed" := TRUE;
                                PRH.MODIFY;
                                // MESSAGE('QC Passed Updated for ' +PRH."No.");
                            END;
                            //  ELSE
                            //MESSAGE(FORMAT(PRH.COUNT));

                        END
                        UNTIL PRH.NEXT = 0;

                    MESSAGE('QC Passed Updated');
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        qc_passed_color_flag := FALSE;
        IF Rec."QC Passed" = TRUE THEN
            qc_passed_color_flag := TRUE
        ELSE
            qc_passed_color_flag := FALSE;
    end;

    var
        Vendor: Record Vendor;
        VendorList: Page "Purchase Automail VendorsList";
        PRL: Record "Purch. Rcpt. Line";
        PRH: Record "Purch. Rcpt. Header";
        PRL_QC_PASSED_ALL: Boolean;
        qc_passed_color_flag: Boolean;
}