report 50049 "Vendor Statement - EFF"
{
    // version EFF,EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './Vendor Statement - EFF.rdlc';

    dataset
    {
        dataitem(Vendor;Vendor)
        {
            DataItemTableView = SORTING(Search Name) ORDER(Ascending);
            RequestFilterFields = "No.","Date Filter","Vendor Posting Group";
            column(Vendor_No_;"No.")
            {
            }
            column(Vendor_Date_Filter;"Date Filter")
            {
            }
            dataitem("Vendor Ledger Entry";"Vendor Ledger Entry")
            {
                DataItemLink = Vendor No.=FIELD(No.),Posting Date=FIELD(Date Filter);
                DataItemTableView = SORTING(Document No.,Document Type,Vendor No.);
                column(Statement_For_the_Vendor___Vendor__No_______Vendor_Name_______For_the_Period______DateFilterVar;'Statement For the Vendor '+Vendor."No."+' '+Vendor.Name + '\  For the Period :' + DateFilterVar)
                {
                }
                column(Vendor_Ledger_Entry__Posting_Date_;"Posting Date")
                {
                }
                column(Vendor_Ledger_Entry__Document_No__;"Document No.")
                {
                }
                column(Vendor_Ledger_Entry_Description;Description)
                {
                }
                column(Vendor_Ledger_Entry__Credit_Amount__LCY__;"Credit Amount (LCY)")
                {
                }
                column(Vendor_Ledger_Entry__Debit_Amount__LCY__;"Debit Amount (LCY)")
                {
                }
                column(Vendor_Ledger_Entry__Debit_Amount__LCY___Control1000000006;"Debit Amount (LCY)")
                {
                }
                column(Vendor_Ledger_Entry__Credit_Amount__LCY___Control1000000007;"Credit Amount (LCY)")
                {
                }
                column(Cr_____FORMAT_ABS__Debit_Amount__LCY______Credit_Amount__LCY____;'Cr ' + FORMAT(ABS("Debit Amount (LCY)" - "Credit Amount (LCY)")))
                {
                }
                column(Vendor_Name;Vendor.Name)
                {
                }
                column(Vendor_Ledger_Entry__Vendor_Posting_Group_;"Vendor Posting Group")
                {
                }
                column(Dr_____FORMAT_ABS__Debit_Amount__LCY______Credit_Amount__LCY____;'Dr ' + FORMAT(ABS("Debit Amount (LCY)" - "Credit Amount (LCY)")))
                {
                }
                column(Vendor_Name_Control1102154000;Vendor.Name)
                {
                }
                column(Vendor_Ledger_Entry__Vendor_Posting_Group__Control1102154004;"Vendor Posting Group")
                {
                }
                column(Vendor_Ledger_Entry__Posting_Date_Caption;FIELDCAPTION("Posting Date"))
                {
                }
                column(Vendor_Ledger_Entry__Document_No__Caption;FIELDCAPTION("Document No."))
                {
                }
                column(Vendor_Ledger_Entry_DescriptionCaption;FIELDCAPTION(Description))
                {
                }
                column(Debit_Amount__LCY_Caption;Debit_Amount__LCY_CaptionLbl)
                {
                }
                column(Credit_Amount__LCY_Caption;Credit_Amount__LCY_CaptionLbl)
                {
                }
                column(Vendor_Ledger_Entry_Entry_No_;"Entry No.")
                {
                }
                column(Vendor_Ledger_Entry_Vendor_No_;"Vendor No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    CLEAR(Description2Temp);
                    IF "Vendor Ledger Entry"."Document Type" = "Vendor Ledger Entry"."Document Type"::Payment THEN
                    //  Description2Temp := "Vendor Ledger Entry"."Cheque No." + '(' + FORMAT("Vendor Ledger Entry"."Cheque Date") + ')';
                end;

                trigger OnPreDataItem();
                begin
                    //SETFILTER("Posting Date",'<=%1',DateFilterVar);
                    DateFilterVar := Vendor.GETFILTER("Date Filter");
                    IF (prd=TRUE) AND (cs=FALSE) THEN
                    "Vendor Ledger Entry".SETFILTER("Vendor Ledger Entry"."Global Dimension 1 Code",'PRD-0010..PRD-026');
                    IF (cs=TRUE) AND (prd=FALSE) THEN
                    "Vendor Ledger Entry".SETFILTER("Vendor Ledger Entry"."Global Dimension 1 Code",'CUS-002..CUS-005');
                    IF (cs=TRUE) AND (prd=TRUE) THEN
                    "Vendor Ledger Entry".SETFILTER("Vendor Ledger Entry"."Global Dimension 1 Code",'CUS-002..CUS-005|PRD-0010..PRD-026');
                end;
            }

            trigger OnPreDataItem();
            begin
                TempExcelBuffer.DELETEALL;
                CLEAR(TempExcelBuffer);
                row:=0;
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
        IF Excel THEN
        BEGIN
          TempExcelBuffer.CreateBook('','');//B2B //EFFUPG
          //TempExcelBuffer.CreateSheet('test excel','',COMPANYNAME,'');//B2B
          TempExcelBuffer.GiveUserControl;
        END
    end;

    var
        DateFilterVar : Text[250];
        Description2Temp : Text[30];
        detailed : Boolean;
        consolidated : Boolean;
        TempExcelBuffer : Record "Excel Buffer" temporary;
        row : Integer;
        Excel : Boolean;
        cs : Boolean;
        prd : Boolean;
        Debit_Amount__LCY_CaptionLbl : Label 'Debit Amount (LCY)';
        Credit_Amount__LCY_CaptionLbl : Label 'Credit Amount (LCY)';

    [LineStart(3472)]
    procedure EnterCell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[250];Bold : Boolean);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.",RowNo);
        TempExcelBuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelBuffer."Cell Value as Text" := CellValue;
        TempExcelBuffer.Bold:=Bold ;
        TempExcelBuffer.INSERT;
    end;

    [LineStart(3480)]
    procedure EnterHeadings(RowNo : Integer;ColumnNo : Integer;CellValue : Text[250];Bold : Boolean);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.",RowNo);
        TempExcelBuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelBuffer."Cell Value as Text" := FORMAT(CellValue);
        TempExcelBuffer.Bold:=Bold ;
        TempExcelBuffer.Formula := '';
        TempExcelBuffer.INSERT;
    end;
}

