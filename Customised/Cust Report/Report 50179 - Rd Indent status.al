report 50179 "Rd Indent status"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Rd Indent status.rdlc';

    dataset
    {
        dataitem("Indent Header";"Indent Header")
        {
            DataItemTableView = WHERE(Delivery Location=FILTER('R&D STR'),Released Status=FILTER(Released));
            RequestFilterFields = "Person Code";
            column(name1;name1)
            {
            }
            column(Pending_Indents__Not_Ordered_DetailsCaption;Pending_Indents__Not_Ordered_DetailsCaptionLbl)
            {
            }
            column(Indented_DateCaption;Indented_DateCaptionLbl)
            {
            }
            column(Item_NameCaption;Item_NameCaptionLbl)
            {
            }
            column(QuantityCaption;QuantityCaptionLbl)
            {
            }
            column(Pending_DaysCaption;Pending_DaysCaptionLbl)
            {
            }
            column(Project_CodeCaption;Project_CodeCaptionLbl)
            {
            }
            column(Purchase_RemarksCaption;Purchase_RemarksCaptionLbl)
            {
            }
            column(Indent_Header_No_;"No.")
            {
            }
            dataitem("Indent Line";"Indent Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = WHERE(Indent Status=FILTER(Indent),Quantity=FILTER(>0));
                column(Indent_Line__Indent_Line__Description;"Indent Line".Description)
                {
                }
                column(Indent_Line__Indent_Line__Quantity;"Indent Line".Quantity)
                {
                }
                column(Indent_Line__Indent_Line___Due_Date_;"Indent Line"."Due Date")
                {
                }
                column(penday;penday)
                {
                }
                column(Indent_Header___Production_Order_Description_;"Indent Header"."Production Order Description")
                {
                }
                column(Indent_Line__Indent_Line___Purchase_Remarks_;"Indent Line"."Purchase Remarks")
                {
                }
                column(Indent_Line_Document_No_;"Document No.")
                {
                }
                column(Indent_Line_Line_No_;"Line No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    //Rev01

                    //Indent Line, Body (1) - OnPreSection()
                    penday:=TODAY-"Indent Line"."Due Date";
                    IF penday>2 THEN
                     CurrReport.SHOWOUTPUT:=TRUE
                    ELSE
                     CurrReport.SHOWOUTPUT:=FALSE;
                    //Indent Line, Body (1) - OnPreSection()
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

    trigger OnPreReport();
    begin
        name:="Indent Header".GETFILTER("Indent Header"."Person Code");
        user.SETRANGE(user."User Security ID",name);
        IF user.FIND('-') THEN
        name1:=user."User Name";
    end;

    var
        penday : Integer;
        user : Record User;
        name : Code[20];
        name1 : Text[50];
        Pending_Indents__Not_Ordered_DetailsCaptionLbl : Label 'Pending Indents (Not Ordered)Details';
        Indented_DateCaptionLbl : Label 'Indented Date';
        Item_NameCaptionLbl : Label 'Item Name';
        QuantityCaptionLbl : Label 'Quantity';
        Pending_DaysCaptionLbl : Label 'Pending Days';
        Project_CodeCaptionLbl : Label 'Project Code';
        Purchase_RemarksCaptionLbl : Label 'Purchase Remarks';
}

