report 50218 "R&D Indents"
{
    DefaultLayout = RDLC;
    RDLCLayout = './R&D Indents.rdlc';

    dataset
    {
        dataitem("Indent Line"; "Indent Line")
        {
            DataItemTableView = SORTING(Document No., Line No.) ORDER(Ascending) WHERE(Indent Status=FILTER(Indent),Delivery Location=FILTER('R&D STR'),Release Status=FILTER(Released));
            column(Indent_Line__Document_No__;"Document No.")
            {
            }
            column(Indent_Line__No__;"No.")
            {
            }
            column(Indent_Line_Description;Description)
            {
            }
            column(Indent_Line_Quantity;Quantity)
            {
            }
            column(Indent_Line__Due_Date_;"Due Date")
            {
            }
            column(Dept;Dept)
            {
            }
            column(Indent_Line__Purchase_Remarks_;"Purchase Remarks")
            {
            }
            column(R_D__Indents_that_are_not_OrderedCaption;R_D__Indents_that_are_not_OrderedCaptionLbl)
            {
            }
            column(Indent_NoCaption;Indent_NoCaptionLbl)
            {
            }
            column(Indent_Line__No__Caption;FIELDCAPTION("No."))
            {
            }
            column(Indent_Line_DescriptionCaption;FIELDCAPTION(Description))
            {
            }
            column(Indent_Line_QuantityCaption;FIELDCAPTION(Quantity))
            {
            }
            column(Indent_Line__Due_Date_Caption;FIELDCAPTION("Due Date"))
            {
            }
            column(DepartmentCaption;DepartmentCaptionLbl)
            {
            }
            column(Indent_Line__Purchase_Remarks_Caption;FIELDCAPTION("Purchase Remarks"))
            {
            }
            column(Indent_Line_Line_No_;"Line No.")
            {
            }
        }
        dataitem("Purchase Line";"Purchase Line")
        {
            DataItemTableView = WHERE(Indent No.=FILTER(<>''),Qty. to Receive=FILTER(>0),Document Type=FILTER(Order));
            column(Purchase_Line__Indent_No__;"Indent No.")
            {
            }
            column(Purchase_Line__No__;"No.")
            {
            }
            column(Purchase_Line_Description;Description)
            {
            }
            column(Purchase_Line__Qty__to_Receive_;"Qty. to Receive")
            {
            }
            column(Dev_Days;Dev_Days)
            {
            }
            column(Dept_Control1102154032;Dept)
            {
            }
            column(Deviated__R_D__IndentsCaption;Deviated__R_D__IndentsCaptionLbl)
            {
            }
            column(Purchase_Line__Indent_No__Caption;FIELDCAPTION("Indent No."))
            {
            }
            column(Purchase_Line__No__Caption;FIELDCAPTION("No."))
            {
            }
            column(Purchase_Line_DescriptionCaption;FIELDCAPTION(Description))
            {
            }
            column(Purchase_Line__Qty__to_Receive_Caption;FIELDCAPTION("Qty. to Receive"))
            {
            }
            column(Deviated_daysCaption;Deviated_daysCaptionLbl)
            {
            }
            column(DepartmentCaption_Control1102154033;DepartmentCaption_Control1102154033Lbl)
            {
            }
            column(Purchase_Line_Document_Type;"Document Type")
            {
            }
            column(Purchase_Line_Document_No_;"Document No.")
            {
            }
            column(Purchase_Line_Line_No_;"Line No.")
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
        IH : Record "Indent Header";
        Dept : Code[10];
        IL : Record "Indent Line";
        Item : Record Item;
        Dev_Days : Integer;
        R_D__Indents_that_are_not_OrderedCaptionLbl : Label '''R&D'' Indents that are not Ordered';
        Indent_NoCaptionLbl : Label 'Indent No';
        DepartmentCaptionLbl : Label 'Department';
        Deviated__R_D__IndentsCaptionLbl : Label 'Deviated ''R&D'' Indents';
        Deviated_daysCaptionLbl : Label 'Deviated days';
        DepartmentCaption_Control1102154033Lbl : Label 'Department';
}

