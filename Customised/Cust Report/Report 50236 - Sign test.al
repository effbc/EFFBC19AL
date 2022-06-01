report 50236 "Sign test"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Sign test.rdlc';

    dataset
    {
        dataitem("DC Header"; "DC Header")
        {
            column(companyinfo_Name; companyinfo.Name)
            {
            }
            column(companyinfo_Address; companyinfo.Address)
            {
            }
            column(companyinfo__Address_2_; companyinfo."Address 2")
            {
            }
            column(DC_Header_Returnable; Returnable)
            {
            }
            column(FORMAT__To_Date__0___Day_2___Month_Text_3___Year_2___; FORMAT("To Date", 0, '<Day,2>-<Month Text,3>-<Year,2>'))
            {
            }
            column(DC_Header___Sell_to_Customer_Name__________DC_Header___Location_Name_________DC_Header___Mode_Of_Transport_; "DC Header"."Sell-to Customer Name" + ' ,  ' + "DC Header"."Location Name" + ' , ' + "DC Header"."Mode Of Transport")
            {
            }
            column(DC_Header__No__; "No.")
            {
            }
            column(DC_Header_SessionCode; SessionCode)
            {
            }
            column(DC_Header__Sell_to_Customer_Name_; "Sell-to Customer Name")
            {
            }
            column(DC_Header__To_Date_; "To Date")
            {
            }
            column(DC_Header__No___Control1102152019; "No.")
            {
            }
            column(DC_Header__DC_Header___Location_Name_; "DC Header"."Location Name")
            {
            }
            column(DC_Header_Returnable_Control1102152022; Returnable)
            {
            }
            column(companyinfo__Address_2__Control1102152036; companyinfo."Address 2")
            {
            }
            column(companyinfo_Address_Control1102152037; companyinfo.Address)
            {
            }
            column(companyinfo_Name_Control1102152038; companyinfo.Name)
            {
            }
            column(DC_Header__Receptionist_Name_; "Receptionist Name")
            {
            }
            column(DC_Header__StoreIncharge_Name_; "StoreIncharge Name")
            {
            }
            column(EMP_Picture; EMP.Picture)
            {
            }
            column(EMP1_Signature; EMP1.Signature)
            {
            }
            column(DELIVERY_CHALLANCaption; DELIVERY_CHALLANCaptionLbl)
            {
            }
            column(SYSTEMS_PVT__LTD_Caption; SYSTEMS_PVT__LTD_CaptionLbl)
            {
            }
            column(Ph____91_866__249_3375___FAX____91_866_247_4097Caption; Ph____91_866__249_3375___FAX____91_866_247_4097CaptionLbl)
            {
            }
            column(e_mail__info_efftronics_netCaption; e_mail__info_efftronics_netCaptionLbl)
            {
            }
            column(Website__efftronics_comCaption; Website__efftronics_comCaptionLbl)
            {
            }
            column(TIN_No__28350166764Caption; TIN_No__28350166764CaptionLbl)
            {
            }
            column(CST_No__28350166764Caption; CST_No__28350166764CaptionLbl)
            {
            }
            column(Returnable__Caption; Returnable__CaptionLbl)
            {
            }
            column(Challan_No_Caption; Challan_No_CaptionLbl)
            {
            }
            column(Section_Code__Caption; Section_Code__CaptionLbl)
            {
            }
            column(M_s_Caption; M_s_CaptionLbl)
            {
            }
            column(Please_receive_the_following_goods_in_good_order_and_condition_Caption; Please_receive_the_following_goods_in_good_order_and_condition_CaptionLbl)
            {
            }
            column(Date__Caption; Date__CaptionLbl)
            {
            }
            column(Please_receive_the_following_goods_in_good_order_and_condition_Caption_Control1102152006; Please_receive_the_following_goods_in_good_order_and_condition_Caption_Control1102152006Lbl)
            {
            }
            column(Date_MM_DD_YY__Caption; Date_MM_DD_YY__CaptionLbl)
            {
            }
            column(Challan_No_Caption_Control1102152018; Challan_No_Caption_Control1102152018Lbl)
            {
            }
            column(Returnable__Caption_Control1102152020; Returnable__Caption_Control1102152020Lbl)
            {
            }
            column(DELIVERY_CHALLANCaption_Control1102152023; DELIVERY_CHALLANCaption_Control1102152023Lbl)
            {
            }
            column(Section_Code__Caption_Control1102152026; Section_Code__Caption_Control1102152026Lbl)
            {
            }
            column(M_s_Caption_Control1102152028; M_s_Caption_Control1102152028Lbl)
            {
            }
            column(TIN_No__28350166764Caption_Control1102152030; TIN_No__28350166764Caption_Control1102152030Lbl)
            {
            }
            column(CST_No__28350166764Caption_Control1102152031; CST_No__28350166764Caption_Control1102152031Lbl)
            {
            }
            column(Website__efftronics_comCaption_Control1102152032; Website__efftronics_comCaption_Control1102152032Lbl)
            {
            }
            column(e_mail__info_efftronics_netCaption_Control1102152033; e_mail__info_efftronics_netCaption_Control1102152033Lbl)
            {
            }
            column(SYSTEMS_PVT__LTD_Caption_Control1102152034; SYSTEMS_PVT__LTD_Caption_Control1102152034Lbl)
            {
            }
            column(Ph____91_866__249_3375___FAX____91_866_247_4097Caption_Control1102152035; Ph____91_866__249_3375___FAX____91_866_247_4097Caption_Control1102152035Lbl)
            {
            }
            column(S_NoCaption; S_NoCaptionLbl)
            {
            }
            column(PARTICULARSCaption; PARTICULARSCaptionLbl)
            {
            }
            column(QTYCaption; QTYCaptionLbl)
            {
            }
            column(UOMCaption; UOMCaptionLbl)
            {
            }
            column(PURPOSECaption; PURPOSECaptionLbl)
            {
            }
            column(SERIAL_LOT_NO_Caption; SERIAL_LOT_NO_CaptionLbl)
            {
            }
            column(DataItem1102152083; N_B___Any_complaint_regarding_goods_you_received_must_be_made_within_24_hours__after_delivery__Return_the_Red_Copy_duly_SigneLbl)
            {
            }
            column(Stores_Incharge_Caption; Stores_Incharge_CaptionLbl)
            {
            }
            column(Authorized_By_Caption; Authorized_By_CaptionLbl)
            {
            }
            column(Receptionist_Caption; Receptionist_CaptionLbl)
            {
            }
            column(with_Rubber_stamp_Caption; with_Rubber_stamp_CaptionLbl)
            {
            }
            column(SignatureCaption; SignatureCaptionLbl)
            {
            }
            column(SignatureCaption_Control1102152089; SignatureCaption_Control1102152089Lbl)
            {
            }
            column(SignatureCaption_Control1102152090; SignatureCaption_Control1102152090Lbl)
            {
            }
            column(Signature_of_ReceiverCaption; Signature_of_ReceiverCaptionLbl)
            {
            }
            dataitem("DC Line"; "DC Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                column(DC_Line_Description; Description)
                {
                }
                column(DC_Line_Quantity; Quantity)
                {
                }
                column(DC_Line__DC_Line___Unit_Of_Measure_; "DC Line"."Unit Of Measure")
                {
                }
                column(i; i)
                {
                }
                column(Tra_Info; Tra_Info)
                {
                }
                column(Purpose; Purpose)
                {
                }
                column(DC_Header___StoreIncharge_Name_; "DC Header"."StoreIncharge Name")
                {
                }
                column(DC_Header___Authorized_name_; "DC Header"."Authorized name")
                {
                }
                column(EMP_Signature; EMP.Signature)
                {
                }
                column(EMP1_Signature_Control1102152071; EMP1.Signature)
                {
                }
                column(DC_Header___Reciver_Name_; "DC Header"."Reciver Name")
                {
                }
                column(EMP2_Signature; EMP2.Signature)
                {
                }
                column(d1_1__1_; d1[1] [1])
                {
                }
                column(d1_1__2_; d1[1] [2])
                {
                }
                column(d1_1__3_; d1[1] [3])
                {
                }
                column(d1_1__5_; d1[1] [5])
                {
                }
                column(d1_2__1_; d1[2] [1])
                {
                }
                column(d1_3__1_; d1[3] [1])
                {
                }
                column(d1_4__1_; d1[4] [1])
                {
                }
                column(d1_5__1_; d1[5] [1])
                {
                }
                column(d1_6__1_; d1[6] [1])
                {
                }
                column(d1_7__1_; d1[7] [1])
                {
                }
                column(d1_8__1_; d1[8] [1])
                {
                }
                column(d1_2__2_; d1[2] [2])
                {
                }
                column(d1_3__2_; d1[3] [2])
                {
                }
                column(d1_4__2_; d1[4] [2])
                {
                }
                column(d1_5__2_; d1[5] [2])
                {
                }
                column(d1_6__2_; d1[6] [2])
                {
                }
                column(d1_7__2_; d1[7] [2])
                {
                }
                column(d1_8__2_; d1[8] [2])
                {
                }
                column(d1_2__3_; d1[2] [3])
                {
                }
                column(d1_3__3_; d1[3] [3])
                {
                }
                column(d1_4__3_; d1[4] [3])
                {
                }
                column(d1_5__3_; d1[5] [3])
                {
                }
                column(d1_6__3_; d1[6] [3])
                {
                }
                column(d1_7__3_; d1[7] [3])
                {
                }
                column(d1_8__3_; d1[8] [3])
                {
                }
                column(d1_8__4_; d1[8] [4])
                {
                }
                column(d1_7__4_; d1[7] [4])
                {
                }
                column(d1_6__4_; d1[6] [4])
                {
                }
                column(d1_5__4_; d1[5] [4])
                {
                }
                column(d1_4__4_; d1[4] [4])
                {
                }
                column(d1_3__4_; d1[3] [4])
                {
                }
                column(d1_2__4_; d1[2] [4])
                {
                }
                column(d1_1__4_; d1[1] [4])
                {
                }
                column(d1_1__6_; d1[1] [6])
                {
                }
                column(d1_2__6_; d1[2] [6])
                {
                }
                column(d1_3__6_; d1[3] [6])
                {
                }
                column(d1_4__6_; d1[4] [6])
                {
                }
                column(d1_5__6_; d1[5] [6])
                {
                }
                column(d1_6__6_; d1[6] [6])
                {
                }
                column(d1_7__6_; d1[7] [6])
                {
                }
                column(d1_8__6_; d1[8] [6])
                {
                }
                column(PURPOSECaption_Control1102152042; PURPOSECaption_Control1102152042Lbl)
                {
                }
                column(UOMCaption_Control1102152045; UOMCaption_Control1102152045Lbl)
                {
                }
                column(QTYCaption_Control1102152046; QTYCaption_Control1102152046Lbl)
                {
                }
                column(PARTICULARSCaption_Control1102152049; PARTICULARSCaption_Control1102152049Lbl)
                {
                }
                column(S_NoCaption_Control1102152051; S_NoCaption_Control1102152051Lbl)
                {
                }
                column(SERIAL_LOT_NO_Caption_Control1102152010; SERIAL_LOT_NO_Caption_Control1102152010Lbl)
                {
                }
                column(N_B___Any_complaint_regarding_goods_you_received_must_be_made_within_24_hours__after_delivery_Caption; N_B___Any_complaint_regarding_goods_you_received_must_be_made_within_24_hours__after_delivery_CaptionLbl)
                {
                }
                column(Stores_Incharge_Caption_Control1102152065; Stores_Incharge_Caption_Control1102152065Lbl)
                {
                }
                column(Authorized_By_Caption_Control1102152066; Authorized_By_Caption_Control1102152066Lbl)
                {
                }
                column(Receptionist_Caption_Control1102152067; Receptionist_Caption_Control1102152067Lbl)
                {
                }
                column(with_Rubber_stamp_Caption_Control1102152073; with_Rubber_stamp_Caption_Control1102152073Lbl)
                {
                }
                column(To_be_Continued___Caption; To_be_Continued___CaptionLbl)
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
                    i := i + 1;
                end;

                trigger OnPreDataItem();
                begin
                    i := 0;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                EMP.RESET;
                EMP.SETFILTER(EMP."No.", "DC Header".Authorized);
                IF EMP.FINDFIRST THEN BEGIN
                    EMP.CALCFIELDS(EMP.Signature);
                END;

                EMP1.RESET;
                EMP1.SETFILTER(EMP1."No.", "DC Header".Reciver);
                IF EMP1.FINDFIRST THEN BEGIN
                    EMP1.CALCFIELDS(EMP1.Signature);
                END;

                EMP2.RESET;
                EMP2.SETFILTER(EMP2."No.", "DC Header".StoreIncharge);
                IF EMP2.FINDFIRST THEN BEGIN
                    EMP2.CALCFIELDS(EMP2.Signature);
                END;
            end;

            trigger OnPreDataItem();
            begin
                Len := 0;
                cnt := 0;
                Purpose := '';
            end;
        }
        dataitem("Integer"; "Integer")
        {
            column(DC_Header___StoreIncharge_Name__Control1102152115; "DC Header"."StoreIncharge Name")
            {
            }
            column(DC_Header___Authorized_name__Control1102152116; "DC Header"."Authorized name")
            {
            }
            column(DC_Header___Reciver_Name__Control1102152117; "DC Header"."Reciver Name")
            {
            }
            column(EMP_Signature_Control1102152119; EMP.Signature)
            {
            }
            column(EMP1_Signature_Control1102152120; EMP1.Signature)
            {
            }
            column(EMP2_Signature_Control1102152121; EMP2.Signature)
            {
            }
            column(N_B___Any_complaint_regarding_goods_you_received_must_be_made_within_24_hours__after_delivery_Caption_Control1102152000; N_B___Any_complaint_regarding_goods_you_received_must_be_made_within_24_hours__after_delivery_Caption_Control1102152000Lbl)
            {
            }
            column(Stores_Incharge_Caption_Control1102152112; Stores_Incharge_Caption_Control1102152112Lbl)
            {
            }
            column(Authorized_By_Caption_Control1102152113; Authorized_By_Caption_Control1102152113Lbl)
            {
            }
            column(Receptionist_Caption_Control1102152114; Receptionist_Caption_Control1102152114Lbl)
            {
            }
            column(with_Rubber_stamp_Caption_Control1102152118; with_Rubber_stamp_Caption_Control1102152118Lbl)
            {
            }
            column(Integer_Number; Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF (i <= 0) AND (K = 0) THEN
                    CurrReport.BREAK;
                i := i - 1;
                K := 0;
            end;

            trigger OnPreDataItem();
            begin
                IF CurrReport.PAGENO = 1 THEN
                    i := ((CurrReport.PAGENO) * 13) - i
                ELSE
                    i := ((CurrReport.PAGENO) * 13) - i;
                K := 5;
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
        d1: array[10, 10] of Text[60];
        i: Integer;
        companyinfo: Record "Company Information";
        sr: Text[30];
        "Total Cost": Decimal;
        MITH: Record "Mat.Issue Track. Specification";
        Auth_Name: Text[50];
        MIH: Record "Material Issues Header";
        User: Record User;
        EMP: Record Employee;
        EMP1: Record Employee;
        EMP2: Record Employee;
        EMP3: Record Employee;
        K: Integer;
        Tra_Info: Text[200];
        Len: Integer;
        cnt: Integer;
        Purpose: Text[250];
        DELIVERY_CHALLANCaptionLbl: Label 'DELIVERY CHALLAN';
        SYSTEMS_PVT__LTD_CaptionLbl: Label 'SYSTEMS PVT. LTD.';
        Ph____91_866__249_3375___FAX____91_866_247_4097CaptionLbl: Label 'Ph:  +91(866) 249-3375,  FAX:  +91(866)247-4097';
        e_mail__info_efftronics_netCaptionLbl: Label 'e-mail: info@efftronics.net';
        Website__efftronics_comCaptionLbl: Label 'Website: efftronics.com';
        TIN_No__28350166764CaptionLbl: Label 'TIN No. 28350166764';
        CST_No__28350166764CaptionLbl: Label 'CST.No. 28350166764';
        Returnable__CaptionLbl: Label 'Returnable :';
        Challan_No_CaptionLbl: Label 'Challan No.';
        Section_Code__CaptionLbl: Label 'Section Code :';
        M_s_CaptionLbl: Label 'M/s.';
        Please_receive_the_following_goods_in_good_order_and_condition_CaptionLbl: Label 'Please receive the following goods in good order and condition.';
        Date__CaptionLbl: Label 'Date :';
        Please_receive_the_following_goods_in_good_order_and_condition_Caption_Control1102152006Lbl: Label 'Please receive the following goods in good order and condition.';
        Date_MM_DD_YY__CaptionLbl: Label '" Date(MM/DD/YY):"';
        Challan_No_Caption_Control1102152018Lbl: Label 'Challan No.';
        Returnable__Caption_Control1102152020Lbl: Label 'Returnable :';
        DELIVERY_CHALLANCaption_Control1102152023Lbl: Label 'DELIVERY CHALLAN';
        Section_Code__Caption_Control1102152026Lbl: Label 'Section Code :';
        M_s_Caption_Control1102152028Lbl: Label 'M/s.';
        TIN_No__28350166764Caption_Control1102152030Lbl: Label 'TIN No. 28350166764';
        CST_No__28350166764Caption_Control1102152031Lbl: Label 'CST.No. 28350166764';
        Website__efftronics_comCaption_Control1102152032Lbl: Label 'Website: efftronics.com';
        e_mail__info_efftronics_netCaption_Control1102152033Lbl: Label 'e-mail: info@efftronics.net';
        SYSTEMS_PVT__LTD_Caption_Control1102152034Lbl: Label 'SYSTEMS PVT. LTD.';
        Ph____91_866__249_3375___FAX____91_866_247_4097Caption_Control1102152035Lbl: Label 'Ph:  +91(866) 249-3375,  FAX:  +91(866)247-4097';
        S_NoCaptionLbl: Label 'S.No';
        PARTICULARSCaptionLbl: Label 'PARTICULARS';
        QTYCaptionLbl: Label 'QTY';
        UOMCaptionLbl: Label 'UOM';
        PURPOSECaptionLbl: Label 'PURPOSE';
        SERIAL_LOT_NO_CaptionLbl: Label 'SERIAL/LOT NO.';
        N_B___Any_complaint_regarding_goods_you_received_must_be_made_within_24_hours__after_delivery__Return_the_Red_Copy_duly_SigneLbl: Label 'N.B : Any complaint regarding goods you received must be made within 24 hours  after delivery. Return the Red Copy duly Signed & Stamped Immediately after receiving the material.';
        Stores_Incharge_CaptionLbl: Label '(Stores Incharge)';
        Authorized_By_CaptionLbl: Label '(Authorized By)';
        Receptionist_CaptionLbl: Label '(Receptionist)';
        with_Rubber_stamp_CaptionLbl: Label '(with Rubber stamp)';
        SignatureCaptionLbl: Label 'Signature';
        SignatureCaption_Control1102152089Lbl: Label 'Signature';
        SignatureCaption_Control1102152090Lbl: Label 'Signature';
        Signature_of_ReceiverCaptionLbl: Label 'Signature of Receiver';
        PURPOSECaption_Control1102152042Lbl: Label 'PURPOSE';
        UOMCaption_Control1102152045Lbl: Label 'UOM';
        QTYCaption_Control1102152046Lbl: Label 'QTY';
        PARTICULARSCaption_Control1102152049Lbl: Label 'PARTICULARS';
        S_NoCaption_Control1102152051Lbl: Label 'S.No';
        SERIAL_LOT_NO_Caption_Control1102152010Lbl: Label 'SERIAL/LOT NO.';
        N_B___Any_complaint_regarding_goods_you_received_must_be_made_within_24_hours__after_delivery_CaptionLbl: Label 'N.B : Any complaint regarding goods you received must be made within 24 hours  after delivery.';
        Stores_Incharge_Caption_Control1102152065Lbl: Label '(Stores Incharge)';
        Authorized_By_Caption_Control1102152066Lbl: Label '(Authorized By)';
        Receptionist_Caption_Control1102152067Lbl: Label '(Receptionist)';
        with_Rubber_stamp_Caption_Control1102152073Lbl: Label '(with Rubber stamp)';
        To_be_Continued___CaptionLbl: Label 'To be Continued...';
        N_B___Any_complaint_regarding_goods_you_received_must_be_made_within_24_hours__after_delivery_Caption_Control1102152000Lbl: Label 'N.B : Any complaint regarding goods you received must be made within 24 hours  after delivery.';
        Stores_Incharge_Caption_Control1102152112Lbl: Label '(Stores Incharge)';
        Authorized_By_Caption_Control1102152113Lbl: Label '(Authorized By)';
        Receptionist_Caption_Control1102152114Lbl: Label '(Receptionist)';
        with_Rubber_stamp_Caption_Control1102152118Lbl: Label '(with Rubber stamp)';
}

