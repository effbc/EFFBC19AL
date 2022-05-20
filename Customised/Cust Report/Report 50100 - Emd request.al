report 50100 "Emd request"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Emd request.rdlc';

    dataset
    {
        dataitem("Tender Header";"Tender Header")
        {
            RequestFilterFields = "Tender No.";
            column(user__User_Name_;user."User Name")
            {
            }
            column(USERID;USERID)
            {
            }
            column(TODAY;TODAY)
            {
            }
            column(Tender_Header__Tender_Header___Customer_Name_;"Tender Header"."Customer Name")
            {
            }
            column(Tender_Header__Tender_Header__Product;"Tender Header".Product)
            {
            }
            column(Tender_Header__Tender_Header___Minimum_Bid_Amount_;"Tender Header"."Minimum Bid Amount")
            {
            }
            column(Tender_Header__Tender_Header___EMD_Amount_;"Tender Header"."EMD Amount")
            {
            }
            column(desc_1_;desc[1])
            {
            }
            column(Tender_Header__Tender_Header___Tender_Doc_Cost_in_form_of_;"Tender Header"."Tender Doc Cost in form of")
            {
            }
            column(Tender_Header__Tender_Header___InFavour_of_;"Tender Header"."InFavour of")
            {
            }
            column(user__User_Name__Control1102154031;user."User Name")
            {
            }
            column(Tender_Header__EMD_Required_Date_;"EMD Required Date")
            {
            }
            column(Tender_Header__Tender_Document_Cost_;"Tender Document Cost")
            {
            }
            column(desc1_1_;desc1[1])
            {
            }
            column(Tender_Header__EMD_in_form_of_;"EMD in form of")
            {
            }
            column(Tender_Header__Tender_No__;"Tender No.")
            {
            }
            column(EMD_MONEY_REQUISITION_FORMCaption;EMD_MONEY_REQUISITION_FORMCaptionLbl)
            {
            }
            column(Name_Caption;Name_CaptionLbl)
            {
            }
            column(Emp__Code_Caption;Emp__Code_CaptionLbl)
            {
            }
            column(Date_Caption;Date_CaptionLbl)
            {
            }
            column(Dept_Caption;Dept_CaptionLbl)
            {
            }
            column(SalesCaption;SalesCaptionLbl)
            {
            }
            column(Purpose____Towords_EMD__for___Caption;Purpose____Towords_EMD__for___CaptionLbl)
            {
            }
            column(Tender____Value_of_the_Tender__Caption;Tender____Value_of_the_Tender__CaptionLbl)
            {
            }
            column(EMD_Amount_Caption;EMD_Amount_CaptionLbl)
            {
            }
            column(Amount_in_Words_Caption;Amount_in_Words_CaptionLbl)
            {
            }
            column(Cheque_DD_Cash_Caption;Cheque_DD_Cash_CaptionLbl)
            {
            }
            column(In_favour_of_Caption;In_favour_of_CaptionLbl)
            {
            }
            column(Payable_at_Caption;Payable_at_CaptionLbl)
            {
            }
            column(Signature_Caption;Signature_CaptionLbl)
            {
            }
            column(Section_In_ChargeCaption;Section_In_ChargeCaptionLbl)
            {
            }
            column(Director_MDCaption;Director_MDCaptionLbl)
            {
            }
            column(Tender_Header__EMD_Required_Date_Caption;FIELDCAPTION("EMD Required Date"))
            {
            }
            column(Tender_Document_Cost__Caption;Tender_Document_Cost__CaptionLbl)
            {
            }
            column(Amount_in_Words_Caption_Control1102154036;Amount_in_Words_Caption_Control1102154036Lbl)
            {
            }
            column(Payable_at_Caption_Control1102154038;Payable_at_Caption_Control1102154038Lbl)
            {
            }
            column(Cheque_DD_Cash_Caption_Control1102154037;Cheque_DD_Cash_Caption_Control1102154037Lbl)
            {
            }
            column(Tender_Header__Tender_No__Caption;FIELDCAPTION("Tender No."))
            {
            }
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
        user : Record User;
        check : Report Check;
        desc : array [2] of Text[250];
        emdamount : Decimal;
        desc1 : array [2] of Text[250];
        EMD_MONEY_REQUISITION_FORMCaptionLbl : Label 'EMD MONEY REQUISITION FORM';
        Name_CaptionLbl : Label 'Name:';
        Emp__Code_CaptionLbl : Label 'Emp. Code:';
        Date_CaptionLbl : Label 'Date:';
        Dept_CaptionLbl : Label 'Dept:';
        SalesCaptionLbl : Label 'Sales';
        Purpose____Towords_EMD__for___CaptionLbl : Label '"Purpose :  Towords EMD  for   "';
        Tender____Value_of_the_Tender__CaptionLbl : Label '"Tender .  Value of the Tender  "';
        EMD_Amount_CaptionLbl : Label 'EMD Amount:';
        Amount_in_Words_CaptionLbl : Label 'Amount in Words:';
        Cheque_DD_Cash_CaptionLbl : Label 'Cheque/DD/Cash:';
        In_favour_of_CaptionLbl : Label 'In favour of:';
        Payable_at_CaptionLbl : Label 'Payable at:';
        Signature_CaptionLbl : Label 'Signature:';
        Section_In_ChargeCaptionLbl : Label 'Section-In-Charge';
        Director_MDCaptionLbl : Label 'Director/MD';
        Tender_Document_Cost__CaptionLbl : Label 'Tender Document Cost :';
        Amount_in_Words_Caption_Control1102154036Lbl : Label 'Amount in Words:';
        Payable_at_Caption_Control1102154038Lbl : Label 'Payable at:';
        Cheque_DD_Cash_Caption_Control1102154037Lbl : Label 'Cheque/DD/Cash:';
}

