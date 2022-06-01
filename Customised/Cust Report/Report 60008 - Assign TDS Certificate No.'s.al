report 60008 "Assign TDS Certificate No.'s"
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

    trigger OnInitReport();
    begin
        AssignAmount := 0;
    end;

    trigger OnPreReport();
    begin
        Customer.TESTFIELD(Customer."No.");
        IF "CertificateNo." = '' THEN
            ERROR(Text001);
        IF CertificateAmount = 0.0 THEN
            ERROR(Text002);

        CASE Type OF
            Type::TDS:
                BEGIN
                    TDSCertificateDetails.SETRANGE("Customer Acc.No.", Customer."No.");
                    TDSCertificateDetails.SETFILTER("TDS Certificate No.", '=%1', '');
                    IF TDSCertificateDetails.FIND('-') THEN BEGIN
                        IF PAGE.RUNMODAL(60004, TDSCertificateDetails) = ACTION::LookupOK THEN;
                        CalculateAmount.SETRANGE(Assign, TRUE);
                        CalculateAmount.SETRANGE("Customer Acc.No.", Customer."No.");
                        IF CalculateAmount.FIND('-') THEN BEGIN
                            REPEAT
                                AssignAmount := AssignAmount + CalculateAmount."TDS / Work Tax Amount";
                            UNTIL CalculateAmount.NEXT = 0;
                        END;
                        IF CertificateAmount <> AssignAmount THEN
                            ERROR('Amounts r Not Equal')
                        ELSE BEGIN
                            AssignCertificateDetails.RESET;
                            AssignCertificateDetails.SETRANGE(Assign, TRUE);
                            IF AssignCertificateDetails.FIND('-') THEN
                                REPEAT
                                    AssignCertificateDetails."TDS Certificate No." := "CertificateNo.";
                                    AssignCertificateDetails."Certificate Date" := CertificateDate;
                                    AssignCertificateDetails."Receipt Date" := ReceiptDate;
                                    AssignCertificateDetails.Assign := FALSE;
                                    AssignCertificateDetails.MODIFY;
                                UNTIL AssignCertificateDetails.NEXT = 0;
                        END;
                    END ELSE
                        MESSAGE('No Entries Find');
                END;
            Type::"Work Tax":
                BEGIN
                    TDSCertificateDetails.SETRANGE("Customer Acc.No.", Customer."No.");
                    TDSCertificateDetails.SETFILTER("TDS Certificate No.", '=%1', '');
                    IF TDSCertificateDetails.FIND('-') THEN BEGIN
                        IF PAGE.RUNMODAL(60004, TDSCertificateDetails) = ACTION::LookupOK THEN;
                        CalculateAmount.SETRANGE(Assign, TRUE);
                        CalculateAmount.SETRANGE("Customer Acc.No.", Customer."No.");
                        IF CalculateAmount.FIND('-') THEN BEGIN
                            REPEAT
                                AssignAmount := AssignAmount + CalculateAmount."TDS / Work Tax Amount";
                            UNTIL CalculateAmount.NEXT = 0;
                        END;
                        IF CertificateAmount <> AssignAmount THEN
                            ERROR('Amounts r Not Equal')
                        ELSE BEGIN
                            AssignCertificateDetails.RESET;
                            AssignCertificateDetails.SETRANGE(Assign, TRUE);
                            IF AssignCertificateDetails.FIND('-') THEN
                                REPEAT
                                    AssignCertificateDetails."TDS Certificate No." := "CertificateNo.";
                                    AssignCertificateDetails."Certificate Date" := CertificateDate;
                                    AssignCertificateDetails."Receipt Date" := ReceiptDate;
                                    AssignCertificateDetails.Assign := FALSE;
                                    AssignCertificateDetails.MODIFY;
                                UNTIL AssignCertificateDetails.NEXT = 0;
                        END;
                    END ELSE
                        MESSAGE('No Entries Find');
                END;
        END;
    end;

    var
        Type: Option TDS,"Work Tax";
        Customer: Record Customer;
        "CertificateNo.": Code[30];
        CertificateDate: Date;
        CertificateAmount: Decimal;
        ReceiptDate: Date;
        TDSCertificateDetails: Record "TDS Certificate Details";
        AssignCertificateDetails: Record "TDS Certificate Details";
        AssignAmount: Decimal;
        CalculateAmount: Record "TDS Certificate Details";
        Text001: Label 'You have not specified Certificate No. Please Specify the Certificate No.';
        Text002: Label 'You have not specified Certificate Amount. Please Specify the Certificate Amount.';
}

