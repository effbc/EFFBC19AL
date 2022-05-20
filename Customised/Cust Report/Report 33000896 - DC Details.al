report 33000896 "DC Details"
{
    DefaultLayout = RDLC;
    RDLCLayout = './DC Details.rdlc';

    dataset
    {
        dataitem("DC Header";"DC Header")
        {
            RequestFilterFields = "No.";
            column(DC_Header__No__;"No.")
            {
            }
            column(DC_Header__Location_Name_;Location_name)
            {
            }
            column(DC_Header__L_R_Number_;"L.R Number")
            {
            }
            column(DC_Header__Mode_Of_Transport_;"Mode Of Transport")
            {
            }
            column(DC_Header__Reciver_Name_;"Reciver Name")
            {
            }
            column(DC_Header__Indented_Name_;"DC Header".Indented)
            {
            }
            column(DC_Header_Remarks;Remarks)
            {
            }
            column(DC_Header__StoreIncharge_Name_;"StoreIncharge Name")
            {
            }
            column(Vendor_name;Vendor_name)
            {
            }
            column(caption;caption)
            {
            }
            column(FORMAT__Created_Date__0___Day___Month_Text_3___Year___;FORMAT("Created Date",0,'<Day>-<Month Text,3>-<Year>'))
            {
            }
            column(DC_InformationCaption;DC_InformationCaptionLbl)
            {
            }
            column(DC_No_Caption;DC_No_CaptionLbl)
            {
            }
            column(DC_Header__Location_Name_Caption;FIELDCAPTION("Location Name"))
            {
            }
            column(DC_Header__L_R_Number_Caption;FIELDCAPTION("L.R Number"))
            {
            }
            column(DC_Header__Mode_Of_Transport_Caption;FIELDCAPTION("Mode Of Transport"))
            {
            }
            column(DC_Header__Reciver_Name_Caption;FIELDCAPTION("Reciver Name"))
            {
            }
            column(Authorized_ByCaption;Authorized_ByCaptionLbl)
            {
            }
            column(CS_Proj_ManageCaption;CS_Proj_ManageCaptionLbl)
            {
            }
            column(DC_Header_RemarksCaption;FIELDCAPTION(Remarks))
            {
            }
            column(DC_Generated_DateCaption;DC_Generated_DateCaptionLbl)
            {
            }
            dataitem("DC Line";"DC Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                column(DC_Line__No__;"No.")
                {
                }
                column(DC_Line_Description;Description)
                {
                }
                column(DC_Line_Quantity;Quantity)
                {
                }
                column(Item_No_Caption;Item_No_CaptionLbl)
                {
                }
                column(DC_Line_DescriptionCaption;FIELDCAPTION(Description))
                {
                }
                column(DC_Line_QuantityCaption;FIELDCAPTION(Quantity))
                {
                }
                column(DC_Line_Document_No_;"Document No.")
                {
                }
                column(DC_Line_Line_No_;"Line No.")
                {
                }
            }

            trigger OnAfterGetRecord();
            begin
                 Location_name:='';
                 DVGRec.RESET;
                 DVGRec.SETFILTER(DVGRec."Dimension Code",'LOCATIONS');
                 DVGRec.SETFILTER(DVGRec.Code,"DC Header"."Location Code");
                 IF DVGRec.FINDFIRST THEN
                 BEGIN
                   Location_name:=DVGRec.Name;
                 END;
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
        caption : Text[10];
        Vendor_name : Text[50];
        DC_InformationCaptionLbl : Label 'DC Information';
        DC_No_CaptionLbl : Label 'DC No:';
        Authorized_ByCaptionLbl : Label 'Authorized By';
        CS_Proj_ManageCaptionLbl : Label '" CS Proj.Manage"';
        DC_Generated_DateCaptionLbl : Label 'DC Generated Date';
        Item_No_CaptionLbl : Label 'Item No.';
        Location_name : Text[50];
        DVGRec : Record "Dimension Value";
}

