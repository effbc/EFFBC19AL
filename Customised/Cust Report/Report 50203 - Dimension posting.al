report 50203 "Dimension posting"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Dimension posting.rdlc';

    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            DataItemTableView = SORTING(Entry No.) ORDER(Ascending) WHERE(Global Dimension 1 Code=FILTER(''));
            column(G_L_Entry__Entry_No__;"Entry No.")
            {
            }
            column(G_L_Entry__G_L_Account_No__;"G/L Account No.")
            {
            }
            column(G_L_Entry__Document_No__;"Document No.")
            {
            }
            column(G_L_Entry_Description;Description)
            {
            }
            column(dimensionvalue;dimensionvalue)
            {
            }
            column(G_L_Entry__Entry_No__Caption;FIELDCAPTION("Entry No."))
            {
            }
            column(G_L_Entry__G_L_Account_No__Caption;FIELDCAPTION("G/L Account No."))
            {
            }
            column(G_L_Entry__Document_No__Caption;FIELDCAPTION("Document No."))
            {
            }
            column(G_L_Entry_DescriptionCaption;FIELDCAPTION(Description))
            {
            }
            column(Updated_DimensionCaption;Updated_DimensionCaptionLbl)
            {
            }

            trigger OnAfterGetRecord();
            begin
                dimensionvalue:='';
                GL.SETCURRENTKEY(GL."Document No.",GL."Posting Date");
                GL.SETRANGE(GL."Document No.","G/L Entry"."Document No.");
                GL.SETRANGE(GL."Posting Date","G/L Entry"."Posting Date");
                IF GL.FIND('-') THEN
                REPEAT
                IF GL."Global Dimension 1 Code"<>'' THEN
                dimensionvalue:=GL."Global Dimension 1 Code";
                UNTIL GL.NEXT=0;
                "G/L Entry"."Global Dimension 1 Code":=dimensionvalue;
                "G/L Entry".MODIFY;
            end;

            trigger OnPostDataItem();
            begin
                MESSAGE('DATA Updated');
            end;

            trigger OnPreDataItem();
            begin
                "G/L Entry".SETCURRENTKEY("G/L Entry"."G/L Account No.","G/L Entry"."Posting Date");
                "G/L Entry".SETRANGE("G/L Entry"."Posting Date",fromdate,todate);
                //"G/L Entry".SETFILTER("G/L Entry"."Global Dimension 1 Code",'');
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
        GL : Record "G/L Entry";
        dimensionvalue : Text[30];
        fromdate : Date;
        todate : Date;
        Updated_DimensionCaptionLbl : Label 'Updated Dimension';
}

