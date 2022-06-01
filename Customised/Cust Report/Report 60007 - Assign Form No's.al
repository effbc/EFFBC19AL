report 60007 "Assign Form No's"
{
    ProcessingOnly = true;

    dataset
    {
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport();
    begin
        CASE Type OF
            Type::Purchase:
                PurchaseForm;
            Type::Sale:
                SalesForm;
        END;
    end;

    var
        TaxFormDetails: Record "Tax Forms Details";
        FormTracking: Record "Form Tracking";
        Vendor: Record Vendor;
        AssignFormTracking: Record "Form Tracking";
        PurchInvHeader: Record "Purch. Inv. Header";
        FormCodes: Record "Form Codes";
        TaxFormDetailsModifiy: Record "Tax Forms Details";
        TaxFormDetailsVendor: Record "Tax Forms Details";
        Customer: Record Customer;
        SalesInvoiceHeader: Record "Sales Invoice Header";
        Type: Option Purchase,Sale;
        "VendorNo.": Code[20];
        "FormNo.": Code[20];
        Activity: Option Assignment,Modification;
        "Cust/VendorNo.": Code[20];
        "SalesFormNo.": Code[20];

    [LineStart(11798)]
    procedure PurchaseForm();
    begin
        //Vendor.TESTFIELD(Vendor."No.");
        Vendor.GET("Cust/VendorNo.");
        FormCodes.TESTFIELD(FormCodes.Code);
        CASE Activity OF
            Activity::Assignment:
                BEGIN
                    TaxFormDetails.TESTFIELD(TaxFormDetails."Form No.");
                    AssignFormTracking.SETRANGE(Status, AssignFormTracking.Status::Open);
                    AssignFormTracking.SETRANGE("Vendor / Customer No.", Vendor."No.");
                    AssignFormTracking.SETFILTER("Form No.", '=%1', '');
                    IF AssignFormTracking.FIND('-') THEN BEGIN
                        IF PAGE.RUNMODAL(60003, AssignFormTracking) = ACTION::LookupOK THEN BEGIN
                            AssignFormTracking.RESET;
                            AssignFormTracking.SETRANGE("Assign Form No.", TRUE);
                            AssignFormTracking.SETRANGE("Vendor / Customer No.", Vendor."No.");
                            IF AssignFormTracking.FIND('-') THEN
                                REPEAT
                                    AssignFormTracking."Form No." := TaxFormDetails."Form No.";
                                    AssignFormTracking."Assign Form No." := FALSE;
                                    AssignFormTracking.MODIFY;
                                    PurchInvHeader.SETRANGE("No.", AssignFormTracking."Document No.");
                                    IF PurchInvHeader.FIND('-') THEN
                                        REPEAT
                                            PurchInvHeader."Form No." := AssignFormTracking."Form No.";
                                            PurchInvHeader.MODIFY;
                                        UNTIL PurchInvHeader.NEXT = 0
                                UNTIL AssignFormTracking.NEXT = 0;
                            /*   TaxFormDetails.SETRANGE("Form No.",AssignFormTracking."Form No.");
                               IF TaxFormDetails.FIND('-') THEN
                                 REPEAT
                                   TaxFormDetails."Vendor No." := Vendor."No.";
                                   TaxFormDetails.VALIDATE(TaxFormDetails."Vendor No.");
                                   TaxFormDetails.MODIFY;
                                 UNTIL TaxFormDetails.NEXT = 0;*/ // commented for navision upgradation
                        END;
                        MESSAGE('Tax Forms No.' + ' s ' + 'Assigned');
                    END ELSE
                        MESSAGE('No entries Exists for this Vendor : %1', Vendor."No.");
                END;
            Activity::Modification:
                BEGIN
                    TaxFormDetailsModifiy.TESTFIELD(TaxFormDetailsModifiy."Form No.");
                    AssignFormTracking.SETRANGE(Status, AssignFormTracking.Status::Open);
                    AssignFormTracking.SETRANGE("Vendor / Customer No.", Vendor."No.");
                    AssignFormTracking.SETFILTER("Form No.", '<>%1', '');
                    IF AssignFormTracking.FIND('-') THEN BEGIN
                        TaxFormDetailsVendor.SETRANGE("Form No.", AssignFormTracking."Form No.");
                        IF PAGE.RUNMODAL(60003, AssignFormTracking) = ACTION::LookupOK THEN BEGIN
                            AssignFormTracking.RESET;
                            AssignFormTracking.SETRANGE("Assign Form No.", TRUE);
                            AssignFormTracking.SETRANGE("Vendor / Customer No.", Vendor."No.");
                            IF AssignFormTracking.FIND('-') THEN
                                REPEAT
                                    AssignFormTracking."Form No." := TaxFormDetailsModifiy."Form No.";
                                    AssignFormTracking."Assign Form No." := FALSE;
                                    AssignFormTracking.MODIFY;
                                    PurchInvHeader.SETRANGE("No.", AssignFormTracking."Document No.");
                                    IF PurchInvHeader.FIND('-') THEN
                                        REPEAT
                                            PurchInvHeader."Form No." := AssignFormTracking."Form No.";
                                            PurchInvHeader.MODIFY;
                                        UNTIL PurchInvHeader.NEXT = 0
                                UNTIL AssignFormTracking.NEXT = 0;
                            TaxFormDetails.SETRANGE("Form No.", AssignFormTracking."Form No.");
                            /*  IF TaxFormDetails.FIND('-') THEN
                                REPEAT
                                  TaxFormDetails."Vendor No." := Vendor."No.";
                                  TaxFormDetails.VALIDATE(TaxFormDetails."Vendor No.");
                                  TaxFormDetails.MODIFY;
                                UNTIL TaxFormDetails.NEXT = 0;  */ // commented for navision upgradation
                        END;
                        /*      IF TaxFormDetailsVendor.FIND('-') THEN
                                REPEAT
                                  TaxFormDetailsVendor."Vendor No." := '';
                                  TaxFormDetailsVendor.MODIFY;
                                UNTIL TaxFormDetailsVendor.NEXT = 0; */ // commented for navsion upgradation
                        MESSAGE('Tax Forms Modified');
                    END ELSE
                        MESSAGE('No entries Exists for this Vendor : %1', Vendor."No.");
                END;
        END;

    end;

    [LineStart(11879)]
    procedure SalesForm();
    var
        Text001: Label 'You have not specified Sales Form No. Please Specify the Sales Form No.';
        Text002: Label 'Activity Type should be Assignment..!';
    begin
        Customer.GET("Cust/VendorNo.");
        FormCodes.TESTFIELD(FormCodes.Code);
        IF "SalesFormNo." = '' THEN
            ERROR(Text001);
        IF Activity <> Activity::Assignment THEN
            ERROR(Text002);

        AssignFormTracking.SETRANGE(Type, AssignFormTracking.Type::Sale);
        AssignFormTracking.SETRANGE("Vendor / Customer No.", "Cust/VendorNo.");
        AssignFormTracking.SETFILTER("Form No.", '=%1', '');
        IF AssignFormTracking.FIND('-') THEN BEGIN
            IF PAGE.RUNMODAL(60003, AssignFormTracking) = ACTION::LookupOK THEN BEGIN
                AssignFormTracking.RESET;
                AssignFormTracking.SETRANGE("Assign Form No.", TRUE);
                AssignFormTracking.SETRANGE("Vendor / Customer No.", "Cust/VendorNo.");
                IF AssignFormTracking.FIND('-') THEN
                    REPEAT
                        AssignFormTracking."Form No." := "SalesFormNo.";
                        AssignFormTracking."Assign Form No." := FALSE;
                        AssignFormTracking.MODIFY;
                        SalesInvoiceHeader.SETRANGE("No.", AssignFormTracking."Document No.");
                        IF SalesInvoiceHeader.FIND('-') THEN
                            REPEAT
                                SalesInvoiceHeader."Form No." := AssignFormTracking."Form No.";
                                SalesInvoiceHeader.MODIFY;
                            UNTIL SalesInvoiceHeader.NEXT = 0
                    UNTIL AssignFormTracking.NEXT = 0;
                MESSAGE('Tax Forms No.' + ' s ' + 'Assigned');
            END ELSE
                MESSAGE('No entries Exists for this Vendor : %1', Vendor."No.");
        END;
    end;
}

