report 50216 "Customer Statement-EFF"
{
    // version EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './Customer Statement-EFF.rdlc';

    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = SORTING(Customer Posting Group) ORDER(Ascending);
            RequestFilterFields = "No.", "Date Filter", "Customer Posting Group";
            column(CUSTOMER__NAMECaption; CUSTOMER__NAMECaptionLbl)
            {
            }
            column(POSTING_GROUPCaption; POSTING_GROUPCaptionLbl)
            {
            }
            column(Sal_BalanceCaption; Sal_BalanceCaptionLbl)
            {
            }
            column(CS_BalanceCaption; CS_BalanceCaptionLbl)
            {
            }
            column(BalanceCaption; BalanceCaptionLbl)
            {
            }
            column(Customer_No_; "No.")
            {
            }
            column(Customer_Date_Filter; "Date Filter")
            {
            }
            column(Customer_Currency_Filter; "Currency Filter")
            {
            }
            column(Customer_Global_Dimension_1_Filter; "Global Dimension 1 Filter")
            {
            }
            column(Customer_Global_Dimension_2_Filter; "Global Dimension 2 Filter")
            {
            }
            dataitem("Detailed Cust. Ledg. Entry"; "Detailed Cust. Ledg. Entry")
            {
                DataItemLink = Customer No.=FIELD(No.),Posting Date=FIELD(Date Filter),Currency Code=FIELD(Currency Filter),Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter);
                DataItemTableView = SORTING(Customer No.,Initial Document Type,Document Type,Entry Type,Posting Date) WHERE(Posting Date=FILTER(>=04/01/08),Entry Type=FILTER(Initial Entry));
                column(Customer_Name;Customer.Name)
                {
                }
                column(Customer__Customer_Posting_Group_;Customer."Customer Posting Group")
                {
                }
                column(Dr____FORMAT_ABS__Detailed_Cust__Ledg__Entry___Amount__LCY____;'Dr  '+FORMAT(ABS("Detailed Cust. Ledg. Entry"."Amount (LCY)")))
                {
                }
                column(FORMAT_ABS_X__;FORMAT(ABS(X)))
                {
                }
                column(FORMAT_ABS__Detailed_Cust__Ledg__Entry___Amount__LCY___X__;FORMAT(ABS("Detailed Cust. Ledg. Entry"."Amount (LCY)"-X)))
                {
                }
                column(Customer_Name_Control1102154000;Customer.Name)
                {
                }
                column(Customer__Customer_Posting_Group__Control1102154001;Customer."Customer Posting Group")
                {
                }
                column(Cr____FORMAT_ABS__Detailed_Cust__Ledg__Entry___Amount__LCY____;'Cr  '+FORMAT(ABS("Detailed Cust. Ledg. Entry"."Amount (LCY)")))
                {
                }
                column(FORMAT_ABS_X___Control1102154003;FORMAT(ABS(X)))
                {
                }
                column(FORMAT_ABS__Detailed_Cust__Ledg__Entry___Amount__LCY___X___Control1102154009;FORMAT(ABS("Detailed Cust. Ledg. Entry"."Amount (LCY)"-X)))
                {
                }
                column(Detailed_Cust__Ledg__Entry_Entry_No_;"Entry No.")
                {
                }
                column(Detailed_Cust__Ledg__Entry_Customer_No_;"Customer No.")
                {
                }
                column(Detailed_Cust__Ledg__Entry_Posting_Date;"Posting Date")
                {
                }
                column(Detailed_Cust__Ledg__Entry_Currency_Code;"Currency Code")
                {
                }
                column(Detailed_Cust__Ledg__Entry_Initial_Entry_Global_Dim__1;"Initial Entry Global Dim. 1")
                {
                }
                column(Detailed_Cust__Ledg__Entry_Initial_Entry_Global_Dim__2;"Initial Entry Global Dim. 2")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    IF ("Initial Entry Global Dim. 1"= 'CUS-002') OR ("Initial Entry Global Dim. 1"= 'CUS-003') OR
                       ("Initial Entry Global Dim. 1"= 'CUS-004') OR ("Initial Entry Global Dim. 1"= 'CUS-005') THEN
                    X:=X+"Detailed Cust. Ledg. Entry"."Amount (LCY)";
                    Y:= "Detailed Cust. Ledg. Entry"."Amount (LCY)";
                end;
            }

            trigger OnAfterGetRecord();
            begin
                X:=0;
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
         TempExcelbuffer.CreateBook('','');//B2B //EFFUPG
         //TempExcelbuffer.CreateSheet('Customer Statement','',COMPANYNAME,'');//B2B
         TempExcelbuffer.GiveUserControl;
        END;
    end;

    trigger OnPreReport();
    begin
           IF Excel THEN
           BEGIN
             CLEAR(TempExcelbuffer);
             TempExcelbuffer.DELETEALL;
           END;
        Row+=1;
        IF Excel THEN
        BEGIN
            EnterHeadings(Row,1,'CUSTOMER No.',TRUE);
            EnterHeadings(Row,2,'CUSTOMER NAME',TRUE);
            EnterHeadings(Row,3,'POSTING GROUP',TRUE);
            EnterHeadings(Row,4,'SALES BALANCE',TRUE);
            EnterHeadings(Row,5,'CS BALANCE',TRUE);
            EnterHeadings(Row,6,'BALANCE',TRUE);
        END;
    end;

    var
        X : Decimal;
        Excel : Boolean;
        TempExcelbuffer : Record "Excel Buffer";
        Row : Integer;
        Y : Decimal;
        CUSTOMER__NAMECaptionLbl : Label 'CUSTOMER  NAME';
        POSTING_GROUPCaptionLbl : Label 'POSTING GROUP';
        Sal_BalanceCaptionLbl : Label 'Sal Balance';
        CS_BalanceCaptionLbl : Label 'CS Balance';
        BalanceCaptionLbl : Label 'Balance';

    [LineStart(9622)]
    procedure Entercell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[1000];bold : Boolean);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.",RowNo);
        TempExcelbuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelbuffer."Cell Value as Text" := CellValue;
        TempExcelbuffer.Bold:=bold ;

        TempExcelbuffer.INSERT;
    end;

    [LineStart(9631)]
    procedure EnterHeadings(RowNo : Integer;ColumnNo : Integer;CellValue : Text[100];Bold : Boolean);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.",RowNo);
        TempExcelbuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelbuffer."Cell Value as Text" := FORMAT(CellValue);
        TempExcelbuffer.Bold:=Bold ;

        TempExcelbuffer.Formula := '';
        TempExcelbuffer.INSERT;
    end;
}

