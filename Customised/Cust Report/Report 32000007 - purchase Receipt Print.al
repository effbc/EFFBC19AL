report 32000007 "purchase Receipt Print"
{
    DefaultLayout = RDLC;
    RDLCLayout = './purchase Receipt Print.rdlc';
    EnableExternalAssemblies = 'true';
    EnableExternalImages = true;
    EnableHyperlinks = true;

    dataset
    {
        dataitem("Inspection Receipt Header"; "Inspection Receipt Header")
        {
            RequestFilterFields = "No.";
            ReqFilterHeading = 'QC Rejection Note';
            column(IR_NO; "Inspection Receipt Header"."No.")
            {
            }
            column(ItemNo; "Inspection Receipt Header"."Item No.")
            {
            }
            column(Item_Desc; "Inspection Receipt Header"."Item Description")
            {
            }
            column(Po_No; "Inspection Receipt Header"."Order No.")
            {
            }
            column(Vendor_Name; "Inspection Receipt Header"."Vendor Name")
            {
            }
            column(Make; "Inspection Receipt Header".Make)
            {
            }
            column(Lot; "Inspection Receipt Header"."Lot No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                prh.RESET;
                prh.SETFILTER("No.", "Inspection Receipt Header"."Receipt No.");
                IF prh.FINDSET THEN BEGIN
                    Supplied_Dc_no := prh."Vendor Shipment No.";
                    invoice_no := prh."Vendor Order No.";
                END;
                filepath := 'file:\\erpserver\ErpAttachments\' + "Inspection Receipt Header"."No." + '.jpg';
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }

        trigger OnOpenPage();
        begin
            //"Inspection Receipt Header".SETFILTER("No.",'<>%1','');
        end;
    }

    labels
    {
    }

    var
        filepath: Text;
        prh: Record "Purch. Rcpt. Header";
        Supplied_Dc_no: Code[40];
        attachments: Record Attachments;
        Fname: Text[250];
        invoice_no: Code[40];
}

