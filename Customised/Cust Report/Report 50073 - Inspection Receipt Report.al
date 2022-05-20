report 50073 "Inspection Receipt Report"
{
    // version QC1.0,B2B1.0,EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './Inspection Receipt Report.rdlc';

    dataset
    {
        dataitem("Inspection Receipt Header";"Inspection Receipt Header")
        {
            DataItemTableView = SORTING(Posted Date) ORDER(Ascending) WHERE(Status=FILTER(Yes),Source Type=FILTER(In Bound));
            RequestFilterFields = "Posting Date";
            column("filter";filter)
            {
            }
            column(SNOCaption;SNOCaptionLbl)
            {
            }
            column(Item_DescriptionCaption;Item_DescriptionCaptionLbl)
            {
            }
            column(Batch_CodeCaption;Batch_CodeCaptionLbl)
            {
            }
            column(QuantityCaption;QuantityCaptionLbl)
            {
            }
            column(Inspected_PersonCaption;Inspected_PersonCaptionLbl)
            {
            }
            column(RemarksCaption;RemarksCaptionLbl)
            {
            }
            column(IDS_Creation_DateCaption;IDS_Creation_DateCaptionLbl)
            {
            }
            column(Period_Wise_QC_Passes_List_Caption;Period_Wise_QC_Passes_List_CaptionLbl)
            {
            }
            column(Inspection_Receipt_Header_No_;"No.")
            {
            }
            dataitem("Inspection Receipt Line";"Inspection Receipt Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document No.,Line No.) ORDER(Ascending);
                column(Inspection_Receipt_Header___Lot_No__;"Inspection Receipt Header"."Lot No.")
                {
                }
                column(rem;rem)
                {
                }
                column(Inspection_Receipt_Line__Inspection_Receipt_Line___Inspection_Persons_;"Inspection Receipt Line"."Inspection Persons")
                {
                }
                column(Inspection_Receipt_Header__Quantity;"Inspection Receipt Header".Quantity)
                {
                }
                column(Inspection_Receipt_Header___Item_Description_;"Inspection Receipt Header"."Item Description")
                {
                }
                column(sno;sno)
                {
                }
                column(Inspection_Receipt_Header___IDS_creation_Date_;"Inspection Receipt Header"."IDS creation Date")
                {
                }
                column(Inspection_Receipt_Line_Document_No_;"Document No.")
                {
                }
                column(Inspection_Receipt_Line_Line_No_;"Line No.")
                {
                }
            }

            trigger OnAfterGetRecord();
            begin
                  rem:='';
            end;

            trigger OnPreDataItem();
            begin
                 IF excel THEN
                 BEGIN
                 CLEAR(Tempexcelbuffer);
                 Tempexcelbuffer.DELETEALL;
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

    trigger OnPostReport();
    begin
        IF excel THEN
        BEGIN
          Tempexcelbuffer.CreateBook('','');//B2B //EFFUPG
          //Tempexcelbuffer.CreateSheet('QC PASS','',COMPANYNAME,'');//B2B
          Tempexcelbuffer.GiveUserControl;
        END
    end;

    trigger OnPreReport();
    begin
        filter:="Inspection Receipt Header".GETFILTERS;
    end;

    var
        PurchRectHeader : Record "Purch. Rcpt. Header";
        ShipToName : Text[100];
        ShipToAddr : Text[30];
        ShipToCity : Text[30];
        ShipToPC : Text[30];
        InspectRecptAcceptLevel : Record "Inspect. Recpt. Accept Level";
        desc : Text[50];
        PostedIDS : Record "Posted Inspect DatasheetHeader";
        Inspdatasheetno : Code[20];
        LineNo : Integer;
        PurchRecptLine : Record "Purch. Rcpt. Line";
        DrawingNo : Code[20];
        IndentReference : Text[50];
        Item : Record Item;
        InspectionreceiptLine : Record "Inspection Receipt Line";
        sno : Integer;
        rem : Text[250];
        "filter" : Text[200];
        excel : Boolean;
        Tempexcelbuffer : Record "Excel Buffer";
        Row : Integer;
        MC : Record "Machine Center";
        person : Text[50];
        SNOCaptionLbl : Label 'SNO';
        Item_DescriptionCaptionLbl : Label 'Item Description';
        Batch_CodeCaptionLbl : Label 'Batch Code';
        QuantityCaptionLbl : Label 'Quantity';
        Inspected_PersonCaptionLbl : Label 'Inspected Person';
        RemarksCaptionLbl : Label 'Remarks';
        IDS_Creation_DateCaptionLbl : Label 'IDS Creation Date';
        Period_Wise_QC_Passes_List_CaptionLbl : Label '"Period Wise QC Passes List "';

    [LineStart(4893)]
    procedure Entercell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[1000];bold : Boolean);
    begin

        Tempexcelbuffer.INIT;
        Tempexcelbuffer.VALIDATE("Row No.",RowNo);
        Tempexcelbuffer.VALIDATE("Column No.",ColumnNo);
        Tempexcelbuffer."Cell Value as Text" := CellValue;
        Tempexcelbuffer.Bold:=bold ;

        Tempexcelbuffer.INSERT;
    end;

    [LineStart(4903)]
    procedure EnterHeadings(RowNo : Integer;ColumnNo : Integer;CellValue : Text[100];Bold : Boolean);
    begin
        Tempexcelbuffer.INIT;
        Tempexcelbuffer.VALIDATE("Row No.",RowNo);
        Tempexcelbuffer.VALIDATE("Column No.",ColumnNo);
        Tempexcelbuffer."Cell Value as Text" := FORMAT(CellValue);
        Tempexcelbuffer.Bold:=Bold ;

        Tempexcelbuffer.Formula := '';
        Tempexcelbuffer.INSERT;
    end;

    [LineStart(4913)]
    procedure "Entercell New"();
    begin
    end;
}

