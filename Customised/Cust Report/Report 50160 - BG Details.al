report 50160 "BG Details"
{
    // version EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './BG Details.rdlc';

    dataset
    {
        dataitem("Bank Guarantee"; "Bank Guarantee")
        {
            DataItemTableView = WHERE(Status = CONST(Open), Closed = CONST(No));
            RequestFilterFields = "Confirmed BY", "Expiry Date", "Doc No.";
            column(GETFILTERS; GETFILTERS)
            {
            }
            column(Bank_Guarantee__BG_No__; "BG No.")
            {
            }
            column(Bank_Guarantee__Issuing_Bank_; "Issuing Bank")
            {
            }
            column(Bank_Guarantee__BG_Value_; "BG Value")
            {
            }
            column(Bank_Guarantee__Expiry_Date_; "Expiry Date")
            {
            }
            column(cusname; cusname)
            {
            }
            column(custordno; custordno)
            {
            }
            column(Bank_Guarantee__Bank_Guarantee___Claim_Date_; "Bank Guarantee"."Claim Date")
            {
            }
            column(BG_ExpireDateStatus; BG_ExpireDateStatus)
            {
            }
            column(BGExpiredAmounts; BGExpiredAmounts)
            {
            }
            column(BG_DetailsCaption; BG_DetailsCaptionLbl)
            {
            }
            column(Bank_Guarantee__BG_No__Caption; FIELDCAPTION("BG No."))
            {
            }
            column(Bank_Guarantee__Issuing_Bank_Caption; FIELDCAPTION("Issuing Bank"))
            {
            }
            column(Bank_Guarantee__BG_Value_Caption; FIELDCAPTION("BG Value"))
            {
            }
            column(Bank_Guarantee__Expiry_Date_Caption; FIELDCAPTION("Expiry Date"))
            {
            }
            column(Customer_NameCaption; Customer_NameCaptionLbl)
            {
            }
            column(Cust__Ord__No_Caption; Cust__Ord__No_CaptionLbl)
            {
            }
            column(Extension_DateCaption; Extension_DateCaptionLbl)
            {
            }
            column(Expired_Date_StatusCaption; Expired_Date_StatusCaptionLbl)
            {
            }
            column(BG_Details_ConsolidatedCaption; BG_Details_ConsolidatedCaptionLbl)
            {
            }
            column(Total_Expired_Date_BG_AmountsCaption; Total_Expired_Date_BG_AmountsCaptionLbl)
            {
            }

            trigger OnAfterGetRecord();
            begin
                cusname := '';
                customer.SETRANGE(customer."No.", "Bank Guarantee"."Issued to/Received from");
                IF customer.FIND('-') THEN BEGIN
                    cusname := customer.Name;
                END;
                IF ("Bank Guarantee"."Expiry Date" <= TODAY) AND (cusname <> '') THEN BEGIN
                    BGExpiredAmounts := BGExpiredAmounts + "Bank Guarantee"."BG Value";
                END;
                /*SIH.SETRANGE(SIH."No.","Bank Guarantee"."Order No.");
                IF SIH.FIND('-') THEN
                BEGIN
                custordno:=SIH."Customer OrderNo.";
                END;
                */
                IF "Bank Guarantee"."Customer Order No." = '' THEN
                    custordno := "Bank Guarantee"."Order No."
                ELSE
                    custordno := "Bank Guarantee"."Customer Order No.";

                IF ("Claim Date" < TODAY) AND ("Bank Guarantee"."Claim Date" <> 0D) THEN
                    BG_ExpireDateStatus := 'BG Expired'

            end;

            trigger OnPreDataItem();
            begin
                TempExcelBuffer.DELETEALL;
                CLEAR(TempExcelBuffer);
                row := 0;

                BGExpiredAmounts := 0;
                BG_ExpireDateStatus := '';
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
        IF Excel THEN BEGIN
            TempExcelBuffer.CreateBook('', '');//B2B //EFFUPG
                                               //TempExcelBuffer.CreateSheet('BG Details','',COMPANYNAME,'');//B2B
            TempExcelBuffer.GiveUserControl;
        END
    end;

    var
        customer: Record Customer;
        cusname: Text[60];
        BGExpiredAmounts: Decimal;
        SIH: Record "Sales Invoice Header";
        custordno: Text[100];
        TempExcelBuffer: Record "Excel Buffer";
        row: Integer;
        Excel: Boolean;
        BG_ExpireDateStatus: Text[10];
        BG_DetailsCaptionLbl: Label 'BG Details';
        Customer_NameCaptionLbl: Label 'Customer Name';
        Cust__Ord__No_CaptionLbl: Label 'Cust. Ord. No.';
        Extension_DateCaptionLbl: Label 'Extension Date';
        Expired_Date_StatusCaptionLbl: Label 'Expired Date Status';
        BG_Details_ConsolidatedCaptionLbl: Label 'BG Details Consolidated';
        Total_Expired_Date_BG_AmountsCaptionLbl: Label 'Total Expired Date BG Amounts';

    (8267)]
    procedure EnterCell(RowNo: Integer; ColumnNo: Integer; CellValue: Text[250]; Bold: Boolean);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.", RowNo);
        TempExcelBuffer.VALIDATE("Column No.", ColumnNo);
        TempExcelBuffer."Cell Value as Text" := CellValue;
        TempExcelBuffer.Bold := Bold;
        TempExcelBuffer.INSERT;
    end;

    (8275)]
    procedure EnterHeadings(RowNo: Integer; ColumnNo: Integer; CellValue: Text[250]; Bold: Boolean);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.", RowNo);
        TempExcelBuffer.VALIDATE("Column No.", ColumnNo);
        TempExcelBuffer."Cell Value as Text" := FORMAT(CellValue);
        TempExcelBuffer.Bold := Bold;
        TempExcelBuffer.Formula := '';
        TempExcelBuffer.INSERT;
    end;
}

