report 90046 "TO SHIPMENT"
{
    DefaultLayout = RDLC;
    RDLCLayout = './TO SHIPMENT.rdlc';

    dataset
    {
        dataitem("Transfer Shipment Header"; "Transfer Shipment Header")
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";
            column(companyinfo_Picture; companyinfo.Picture)
            {
            }
            column(companyaddr_1_; companyaddr[1])
            {
            }
            column(companyaddr_2_; companyaddr[2])
            {
            }
            column(companyaddr_3_; companyaddr[3])
            {
            }
            column(companyinfo__Fax_No__; companyinfo."Fax No.")
            {
            }
            column(companyinfo__Phone_No__; companyinfo."Phone No.")
            {
            }
            column(companyinfo__E_Mail_; companyinfo."E-Mail")
            {
            }
            column(companyinfo__Home_Page_; companyinfo."Home Page")
            {
            }
            column(FAX_Caption; FAX_CaptionLbl)
            {
            }
            column(Ph_Caption; Ph_CaptionLbl)
            {
            }
            column(E__Mail_Caption; E__Mail_CaptionLbl)
            {
            }
            column(To_Provide_Insight_For_Enhancing_WealthCaption; To_Provide_Insight_For_Enhancing_WealthCaptionLbl)
            {
            }
            column(URL_Caption; URL_CaptionLbl)
            {
            }
            column(Transfer_Shipment_Header_No_; "No.")
            {
            }
            dataitem("Transfer Shipment Line"; "Transfer Shipment Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                column(Transfer_Shipment_Line__Item_No__; "Item No.")
                {
                }
                column(Transfer_Shipment_Line_Quantity; Quantity)
                {
                }
                column(Transfer_Shipment_Line__Unit_of_Measure_; "Unit of Measure")
                {
                }
                column(Transfer_Shipment_Line__Item_No__Caption; FIELDCAPTION("Item No."))
                {
                }
                column(Transfer_Shipment_Line_QuantityCaption; FIELDCAPTION(Quantity))
                {
                }
                column(Transfer_Shipment_Line__Unit_of_Measure_Caption; FIELDCAPTION("Unit of Measure"))
                {
                }
                column(Transfer_Shipment_Line_Document_No_; "Document No.")
                {
                }
                column(Transfer_Shipment_Line_Line_No_; "Line No.")
                {
                }
                dataitem("Reservation Entry"; "Reservation Entry")
                {
                    DataItemLink = Item No.=FIELD(Item No.),Source Ref. No.=FIELD(Line No.),Source ID=FIELD(Document No.);
                    column(Reservation_Entry__Reservation_Entry___Serial_No__;"Reservation Entry"."Serial No.")
                    {
                    }
                    column(Reservation_Entry__Reservation_Entry___Item_No__;"Reservation Entry"."Item No.")
                    {
                    }
                    column(S_No__Caption;S_No__CaptionLbl)
                    {
                    }
                    column(Item_No__Caption;Item_No__CaptionLbl)
                    {
                    }
                    column(Reservation_Entry_Entry_No_;"Entry No.")
                    {
                    }
                    column(Reservation_Entry_Positive;Positive)
                    {
                    }
                    column(Reservation_Entry_Source_Ref__No_;"Source Ref. No.")
                    {
                    }
                    column(Reservation_Entry_Source_ID;"Source ID")
                    {
                    }
                }

                trigger OnAfterGetRecord();
                begin
                    MESSAGE('%1',ReservationEntry."Source Ref. No.");
                    //ReservationEntry.SETRANGE("Source Type",DATABASE::"Transfer Shipment Line");
                    ReservationEntry.SETRANGE("Source ID","Document No.");
                    ReservationEntry.SETRANGE("Source Ref. No.","Line No.");
                    MESSAGE('%1',ReservationEntry."Source Type");
                    MESSAGE('%1',ReservationEntry."Source Ref. No.");
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
        companyinfo : Record "Company Information";
        companyaddr : array [8] of Text[30];
        ReservationEntry : Record "Reservation Entry";
        FAX_CaptionLbl : Label 'FAX:';
        Ph_CaptionLbl : Label 'Ph:';
        E__Mail_CaptionLbl : Label 'E- Mail:';
        To_Provide_Insight_For_Enhancing_WealthCaptionLbl : Label 'To Provide Insight For Enhancing Wealth';
        URL_CaptionLbl : Label 'URL:';
        S_No__CaptionLbl : Label 'S No :';
        Item_No__CaptionLbl : Label 'Item No :';
}

