pageextension 70160 PurchaseQuoteSubformExt extends "Purchase Quote Subform"
{
    layout
    {
        /* modify(Control1)
        {
            ShowCaption = false;
        } */
        modify("No.")
        {
            trigger OnAfterValidate()
            var
                Num: Code[20];
            begin
                PurchaseHeader.SETRANGE("No.", "Document No.");
                IF PurchaseHeader.FINDFIRST THEN
                    Num := PurchaseHeader."Buy-from Vendor No.";
                ItemVend.SETRANGE("Vendor No.", Num);
                ItemVend.SETRANGE("Item No.", "No.");
                IF NOT ItemVend.FINDFIRST THEN
                    ERROR('%1 is not the correct item number', "No.");
            end;
        }
    }
    actions
    {

    }

    var
        ItemVend: Record "Item Vendor";
        PurchaseHeader: Record "Purchase Header";

    procedure StrOrderLineDetailsPage();
    begin
    end;

<<<<<<< HEAD
=======

    //Unsupported feature: CodeModification on "ShowStrDetailsForm(PROCEDURE 1280000)". Please convert manually.

    //procedure ShowStrDetailsForm();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    StrOrderLineDetails.RESET;
    StrOrderLineDetails.SETCURRENTKEY("Document Type","Document No.",Type);
    StrOrderLineDetails.SETRANGE("Document Type","Document Type");
    StrOrderLineDetails.SETRANGE("Document No.","Document No.");
    StrOrderLineDetails.SETRANGE(Type,StrOrderLineDetails.Type::Purchase);
    StrOrderLineDetails.SETRANGE("Item No.","No.");
    StrOrderLineDetails.SETRANGE("Line No.","Line No.");
    StrOrderLineDetailsForm.SETTABLEVIEW(StrOrderLineDetails);
    StrOrderLineDetailsForm.RUNMODAL;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..7
    StrOrderLineDetailsPage.SETTABLEVIEW(StrOrderLineDetails);
    StrOrderLineDetailsPage.RUNMODAL;
    */
    //end;

    (8139)]
>>>>>>> 2cc8f1fea3184cdf038a92c8ef5fefc00ee958f1
    procedure "---B2B---"();
    begin
    end;

<<<<<<< HEAD

=======
    (8142)]
>>>>>>> 2cc8f1fea3184cdf038a92c8ef5fefc00ee958f1
    procedure OpenAttachments();
    var
        Attachment: Record Attachments;
    begin
        Attachment.RESET;
        Attachment.SETRANGE("Table ID", DATABASE::"Purchase Header");
        Attachment.SETRANGE("Document No.", "Document No.");
        Attachment.SETRANGE("Document Type", "Document Type");

        PAGE.RUN(PAGE::"ESPL Attachments", Attachment);
    end;
}

