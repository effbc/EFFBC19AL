report 50224 "To be returned DC Items"
{
    DefaultLayout = RDLC;
    RDLCLayout = './To be returned DC Items.rdlc';

    dataset
    {
        dataitem("DC Header";"DC Header")
        {
            DataItemTableView = WHERE(No.=FILTER(STR*|RND*),NonReturnable=FILTER(No),Returned=FILTER(No));
            RequestFilterFields = Indented;
            column(To_be_Received_DC_Items_ListCaption;To_be_Received_DC_Items_ListCaptionLbl)
            {
            }
            column(DC_Line_DescriptionCaption;"DC Line".FIELDCAPTION(Description))
            {
            }
            column(QTYCaption;QTYCaptionLbl)
            {
            }
            column(DC_sent_dateCaption;DC_sent_dateCaptionLbl)
            {
            }
            column(Indented_byCaption;Indented_byCaptionLbl)
            {
            }
            column(Dept_Caption;Dept_CaptionLbl)
            {
            }
            column(Unit_CostCaption;Unit_CostCaptionLbl)
            {
            }
            column(TotalCaption;TotalCaptionLbl)
            {
            }
            column(DC_Header_No_;"No.")
            {
            }
            dataitem("DC Line";"DC Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = WHERE(Non-Returnable=FILTER(No),Returned=FILTER(No),Quantity=FILTER(>0));
                column(DC_Line_Description;Description)
                {
                }
                column(DC_Line_Quantity;Quantity)
                {
                }
                column(DC_Header___To_Date_;"DC Header"."To Date")
                {
                }
                column(DC_Header___Indented_Name_;"DC Header"."Indented Name")
                {
                }
                column(DC_Header__SessionCode;"DC Header".SessionCode)
                {
                }
                column(UC;UC)
                {
                }
                column(ROUND_UC_Quantity_1_;ROUND(UC*Quantity,1))
                {
                }
                column(DC_Line_Document_No_;"Document No.")
                {
                }
                column(DC_Line_Line_No_;"Line No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    UC:=0;
                    IF Item.GET("DC Line"."No.") THEN
                      UC:=Item."Avg Unit Cost";
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

    trigger OnInitReport();
    begin
              //test
    end;

    var
        UC : Decimal;
        Item : Record Item;
        To_be_Received_DC_Items_ListCaptionLbl : Label 'To be Received DC Items List';
        QTYCaptionLbl : Label 'QTY';
        DC_sent_dateCaptionLbl : Label 'DC sent date';
        Indented_byCaptionLbl : Label 'Indented by';
        Dept_CaptionLbl : Label 'Dept.';
        Unit_CostCaptionLbl : Label 'Unit Cost';
        TotalCaptionLbl : Label 'Total';
}

