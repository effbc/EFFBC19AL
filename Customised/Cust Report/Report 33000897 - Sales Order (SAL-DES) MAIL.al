report 33000897 "Sales Order (SAL-DES) MAIL"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Sales Order (SAL-DES) MAIL.rdlc';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = SORTING(Document Type, No.) ORDER(Ascending);
            RequestFilterFields = "No.";
            column(Sales_Header__Sales_Header___No__; "Sales Header"."No.")
            {
            }
            column(Sales_Header__Sales_Header___Sell_to_Customer_Name_; "Sales Header"."Sell-to Customer Name")
            {
            }
            column(Sales_Header__Bktord_Des_Approval_; "Bktord Des Approval")
            {
            }
            column(Sales_Header__SalOrd_Des_Approval_; "SalOrd Des Approval")
            {
            }
            column(SALE_ORDERCaption; SALE_ORDERCaptionLbl)
            {
            }
            column(To_Provide_Insight_For_Enhancing_WealthCaption; To_Provide_Insight_For_Enhancing_WealthCaptionLbl)
            {
            }
            column(ORDER_NO____Caption; ORDER_NO____CaptionLbl)
            {
            }
            column(CUSTOMER___Caption; CUSTOMER___CaptionLbl)
            {
            }
            column(BLK_DES_APPROVAL_Caption; BLK_DES_APPROVAL_CaptionLbl)
            {
            }
            column(SAL_ORD_APPROVAL_Caption; SAL_ORD_APPROVAL_CaptionLbl)
            {
            }
            column(Sales_Header_Document_Type; "Document Type")
            {
            }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document Type, Document No., Line No.) ORDER(Ascending) WHERE(Quantity = FILTER(> 0));
                column(Sales_Line__No__; "No.")
                {
                }
                column(Sales_Line_Description; Description)
                {
                }
                column(Sno; Sno)
                {
                }
                column(Sales_Line_Quantity; Quantity)
                {
                }
                column(Sales_Line__Unit_of_Measure_; "Unit of Measure")
                {
                }
                column(EmptyStringCaption; EmptyStringCaptionLbl)
                {
                }
                column(ScheduleCaption; ScheduleCaptionLbl)
                {
                }
                column(Sales_Line_Document_Type; "Document Type")
                {
                }
                column(Sales_Line_Document_No_; "Document No.")
                {
                }
                column(Sales_Line_Line_No_; "Line No.")
                {
                }
                dataitem(Schedule2; Schedule2)
                {
                    DataItemLink = Document No.=FIELD(Document No.),Document Line No.=FIELD(Line No.);
                    DataItemTableView = SORTING(Document Type,Document No.,Document Line No.,Line No.) ORDER(Ascending) WHERE(Quantity=FILTER(>0));
                    column(Schedule2__Design_Conclusions1_;"Design Conclusions1")
                    {
                    }
                    column(Schedule2__Design_Conclusion2_;"Design Conclusion2")
                    {
                    }
                    column(Schedule2__No__;"No.")
                    {
                    }
                    column(Schedule2_Description;Description)
                    {
                    }
                    column(Schedule2_Quantity;Quantity)
                    {
                    }
                    column(Schedule2__Sales_Description_;"Sales Description")
                    {
                    }
                    column(Schedule2__Design_Conclusions1_Caption;FIELDCAPTION("Design Conclusions1"))
                    {
                    }
                    column(Schedule2__Design_Conclusion2_Caption;FIELDCAPTION("Design Conclusion2"))
                    {
                    }
                    column(Schedule2__No__Caption;FIELDCAPTION("No."))
                    {
                    }
                    column(Schedule2_DescriptionCaption;FIELDCAPTION(Description))
                    {
                    }
                    column(Schedule2_QuantityCaption;FIELDCAPTION(Quantity))
                    {
                    }
                    column(Schedule2__Sales_Description_Caption;FIELDCAPTION("Sales Description"))
                    {
                    }
                    column(Schedule2_Document_Type;"Document Type")
                    {
                    }
                    column(Schedule2_Document_No_;"Document No.")
                    {
                    }
                    column(Schedule2_Document_Line_No_;"Document Line No.")
                    {
                    }
                    column(Schedule2_Line_No_;"Line No.")
                    {
                    }
                }

                trigger OnAfterGetRecord();
                begin
                    //Rev01

                    //Sales Line, Body (1) - OnPreSection()
                     Sno+=1;
                end;
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
        Sno : Integer;
        SALE_ORDERCaptionLbl : Label 'SALE ORDER';
        To_Provide_Insight_For_Enhancing_WealthCaptionLbl : Label 'To Provide Insight For Enhancing Wealth';
        ORDER_NO____CaptionLbl : Label 'ORDER NO.  :';
        CUSTOMER___CaptionLbl : Label 'CUSTOMER  :';
        BLK_DES_APPROVAL_CaptionLbl : Label 'BLK-DES APPROVAL:';
        SAL_ORD_APPROVAL_CaptionLbl : Label 'SAL-ORD APPROVAL:';
        EmptyStringCaptionLbl : Label ')';
        ScheduleCaptionLbl : Label 'Schedule';
}

