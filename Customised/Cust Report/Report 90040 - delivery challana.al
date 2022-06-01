report 90040 "delivery challana"
{
    // version B2B 1.0

    DefaultLayout = RDLC;
    RDLCLayout = './delivery challana.rdlc';

    dataset
    {
        dataitem("DC Header"; "DC Header")
        {
            DataItemTableView = SORTING(No.);
            RequestFilterFields = "No.", "Document Date";
            column(CompanyAddr_1_; CompanyAddr[1])
            {
            }
            column(CompanyAddr_2_; CompanyAddr[2])
            {
            }
            column(CompanyAddr_3_; CompanyAddr[3])
            {
            }
            column(STRSUBSTNO_Text005_FORMAT_CurrReport_PAGENO__; STRSUBSTNO(Text005, FORMAT(CurrReport.PAGENO)))
            {
            }
            column(CompanyInfo__Phone_No__; CompanyInfo."Phone No.")
            {
            }
            column(CompanyInfo__Fax_No__; CompanyInfo."Fax No.")
            {
            }
            column(CompanyInfo__E_Mail_; CompanyInfo."E-Mail")
            {
            }
            column(CompanyInfo__Home_Page_; CompanyInfo."Home Page")
            {
            }
            column(DC_Header__DC_Header___Sales_Order_No__; "DC Header"."Sales Order No.")
            {
            }
            column(DC_Header__DC_Header___Document_Date_; "DC Header"."Document Date")
            {
            }
            column(DC_Header__DC_Header___Ship_to_Name_; "DC Header"."Ship-to Name")
            {
            }
            column(DC_Header__DC_Header___Ship_to_City_; "DC Header"."Ship-to City")
            {
            }
            column(DC_Header__DC_Header___Ship_to_Address_; "DC Header"."Ship-to Address")
            {
            }
            column(Text1; Text1)
            {
            }
            column(Text2; Text2)
            {
            }
            column(Ph_Caption; Ph_CaptionLbl)
            {
            }
            column(FAX_Caption; FAX_CaptionLbl)
            {
            }
            column(E__Mail_Caption; E__Mail_CaptionLbl)
            {
            }
            column(Visit_us_Caption; Visit_us_CaptionLbl)
            {
            }
            column(Delivery_Challan_Cum_Packing_ListCaption; Delivery_Challan_Cum_Packing_ListCaptionLbl)
            {
            }
            column(Section_CodeCaption; Section_CodeCaptionLbl)
            {
            }
            column(Order_No__Caption; Order_No__CaptionLbl)
            {
            }
            column(Date__Caption; Date__CaptionLbl)
            {
            }
            column(Date__Caption_Control1102152009; Date__Caption_Control1102152009Lbl)
            {
            }
            column(M_SCaption; M_SCaptionLbl)
            {
            }
            column(Please_Receive_The_Following__goods_in_good_order_and_conditionCaption; Please_Receive_The_Following__goods_in_good_order_and_conditionCaptionLbl)
            {
            }
            column(DC_Header_No_; "No.")
            {
            }
            dataitem("DC Line"; "DC Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document No., Line No.);
                column(SlNo; SlNo)
                {
                }
                column(DC_Line__DC_Line__Description; "DC Line".Description)
                {
                }
                column(DC_Line__DC_Line__Quantity; "DC Line".Quantity)
                {
                }
                column(DC_Line__DC_Line__Remarks; "DC Line".Remarks)
                {
                }
                column(CompanyInfo__L_S_T__No__; CompanyInfo."L.S.T. No.")
                {
                }
                column(CompanyInfo__C_S_T_No__; CompanyInfo."C.S.T No.")
                {
                }
                column(Sl_noCaption; Sl_noCaptionLbl)
                {
                }
                column(ParticularsCaption; ParticularsCaptionLbl)
                {
                }
                column(QtyCaption; QtyCaptionLbl)
                {
                }
                column(Rate_Per_Unit_Caption; Rate_Per_Unit_CaptionLbl)
                {
                }
                column(PurposeCaption; PurposeCaptionLbl)
                {
                }
                column(Signature_Of_the_ReceiverCaption; Signature_Of_the_ReceiverCaptionLbl)
                {
                }
                column(With_rubbers_tamp_Caption; With_rubbers_tamp_CaptionLbl)
                {
                }
                column(SignatureCaption; SignatureCaptionLbl)
                {
                }
                column(Receptionist_Caption; Receptionist_CaptionLbl)
                {
                }
                column(SignatureCaption_Control1102152055; SignatureCaption_Control1102152055Lbl)
                {
                }
                column(Indented_By_Caption; Indented_By_CaptionLbl)
                {
                }
                column(SignatureCaption_Control1102152057; SignatureCaption_Control1102152057Lbl)
                {
                }
                column(Stores_Incharge_Caption; Stores_Incharge_CaptionLbl)
                {
                }
                column(Return_the_copy_duly_signed___stamped_immediately_after_receiving_the_materialCaption; Return_the_copy_duly_signed___stamped_immediately_after_receiving_the_materialCaptionLbl)
                {
                }
                column(Any_complaint_regarding_goods_you_received_must_be_made_with_in_24_hours_after_deliveryCaption; Any_complaint_regarding_goods_you_received_must_be_made_with_in_24_hours_after_deliveryCaptionLbl)
                {
                }
                column(APGST_NO_Caption; APGST_NO_CaptionLbl)
                {
                }
                column(CST_NOCaption; CST_NOCaptionLbl)
                {
                }
                column(DC_Line_Document_No_; "Document No.")
                {
                }
                column(DC_Line_Line_No_; "Line No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    SlNo := SlNo + 1;
                end;

                trigger OnPreDataItem();
                begin
                    SlNo := 0;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                CompanyInfo.GET;
                //IF RespCenter.GET("Responsibility Center") THEN BEGIN
                //  FormatAddr.RespCenter(CompanyAddr,RespCenter);
                FormatAddr.Company(CompanyAddr, CompanyInfo);
                IF check THEN
                    Text1 := 'Returnable';
                IF Check1 THEN
                    Text2 := 'Non-Returnable';
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
    }

    labels
    {
    }

    var
        CompanyInfo: Record "Company Information";
        SlNo: Integer;
        Customer: Record Customer;
        PrintLogo: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        ShipToCode: Record "Ship-to Address";
        SlNotxt: Text[30];
        FormatAddr: Codeunit "Format Address";
        CompanyInfo2: Record "Company Information";
        RespCenter: Record "Responsibility Center";
        CompanyAddr: array[8] of Text[50];
        check: Boolean;
        Check1: Boolean;
        Text1: Text[30];
        Text2: Text[30];
        Text005: Label 'Page %1';
        Ph_CaptionLbl: Label 'Ph:';
        FAX_CaptionLbl: Label 'FAX:';
        E__Mail_CaptionLbl: Label 'E- Mail:';
        Visit_us_CaptionLbl: Label 'Visit us:';
        Delivery_Challan_Cum_Packing_ListCaptionLbl: Label 'Delivery Challan Cum Packing List';
        Section_CodeCaptionLbl: Label 'Section Code';
        Order_No__CaptionLbl: Label 'Order No :';
        Date__CaptionLbl: Label 'Date :';
        Date__Caption_Control1102152009Lbl: Label 'Date :';
        M_SCaptionLbl: Label 'M/S';
        Please_Receive_The_Following__goods_in_good_order_and_conditionCaptionLbl: Label 'Please Receive The Following  goods in good order and condition';
        Sl_noCaptionLbl: Label 'Sl.no';
        ParticularsCaptionLbl: Label 'Particulars';
        QtyCaptionLbl: Label 'Qty';
        Rate_Per_Unit_CaptionLbl: Label '"Rate Per Unit "';
        PurposeCaptionLbl: Label 'Purpose';
        Signature_Of_the_ReceiverCaptionLbl: Label 'Signature Of the Receiver';
        With_rubbers_tamp_CaptionLbl: Label '(With rubbers tamp)';
        SignatureCaptionLbl: Label 'Signature';
        Receptionist_CaptionLbl: Label '(Receptionist)';
        SignatureCaption_Control1102152055Lbl: Label 'Signature';
        Indented_By_CaptionLbl: Label '(Indented By)';
        SignatureCaption_Control1102152057Lbl: Label 'Signature';
        Stores_Incharge_CaptionLbl: Label '(Stores Incharge)';
        Return_the_copy_duly_signed___stamped_immediately_after_receiving_the_materialCaptionLbl: Label 'Return the copy duly signed & stamped immediately after receiving the material';
        Any_complaint_regarding_goods_you_received_must_be_made_with_in_24_hours_after_deliveryCaptionLbl: Label 'Any complaint regarding goods you received must be made with in 24 hours after delivery';
        APGST_NO_CaptionLbl: Label 'APGST NO.';
        CST_NOCaptionLbl: Label 'CST NO';
}

