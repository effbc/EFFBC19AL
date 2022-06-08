report 50106 "Ta Pending"
{
    // version sreenivas

    DefaultLayout = RDLC;
    RDLCLayout = './Ta Pending.rdlc';

    dataset
    {
        dataitem("Analysis View Entry"; "Analysis View Entry")
        {
            RequestFilterFields = "Dimension 1 Value Code";
            column(Analysis_View_Entry__Dimension_1_Value_Code_; "Dimension 1 Value Code")
            {
            }
            column(amt_1_; amt[1])
            {
            }
            column(amt_2_; amt[2])
            {
            }
            column(amt_3_; amt[3])
            {
            }
            column(amt_4_; amt[4])
            {
            }
            column(amt_5_; amt[5])
            {
            }
            column(amt_6_; amt[6])
            {
            }
            column(amt_7_; amt[7])
            {
            }
            column(amt_8_; amt[8])
            {
            }
            column(amt_9_; amt[9])
            {
            }
            column(amt_10_; amt[10])
            {
            }
            column(days_1_; days[1])
            {
            }
            column(days_2_; days[2])
            {
            }
            column(days_3_; days[3])
            {
            }
            column(days_4_; days[4])
            {
            }
            column(days_5_; days[5])
            {
            }
            column(days_6_; days[6])
            {
            }
            column(days_7_; days[7])
            {
            }
            column(days_8_; days[8])
            {
            }
            column(days_9_; days[9])
            {
            }
            column(days_10_; days[10])
            {
            }
            column(temp_1_; temp[1])
            {
            }
            column(temp_2_; temp[2])
            {
            }
            column(temp_3_; temp[3])
            {
            }
            column(temp_4_; temp[4])
            {
            }
            column(temp_5_; temp[5])
            {
            }
            column(temp_6_; temp[6])
            {
            }
            column(temp_7_; temp[7])
            {
            }
            column(temp_8_; temp[8])
            {
            }
            column(temp_9_; temp[9])
            {
            }
            column(temp_10_; temp[10])
            {
            }
            column(days_11_; days[11])
            {
            }
            column(days_12_; days[12])
            {
            }
            column(days_13_; days[13])
            {
            }
            column(days_14_; days[14])
            {
            }
            column(days_15_; days[15])
            {
            }
            column(days_16_; days[16])
            {
            }
            column(days_17_; days[17])
            {
            }
            column(days_18_; days[18])
            {
            }
            column(days_19_; days[19])
            {
            }
            column(days_20_; days[20])
            {
            }
            column(amt_11_; amt[11])
            {
            }
            column(amt_12_; amt[12])
            {
            }
            column(amt_13_; amt[13])
            {
            }
            column(amt_14_; amt[14])
            {
            }
            column(amt_15_; amt[15])
            {
            }
            column(amt_16_; amt[16])
            {
            }
            column(amt_17_; amt[17])
            {
            }
            column(amt_18_; amt[18])
            {
            }
            column(amt_19_; amt[19])
            {
            }
            column(amt_20_; amt[20])
            {
            }
            column(temp_11_; temp[11])
            {
            }
            column(temp_12_; temp[12])
            {
            }
            column(temp_13_; temp[13])
            {
            }
            column(temp_14_; temp[14])
            {
            }
            column(temp_15_; temp[15])
            {
            }
            column(temp_16_; temp[16])
            {
            }
            column(temp_17_; temp[17])
            {
            }
            column(temp_18_; temp[18])
            {
            }
            column(temp_19_; temp[19])
            {
            }
            column(temp_20_; temp[20])
            {
            }
            column(Analysis_View_Entry_Amount; Amount)
            {
            }
            column(Emp_No_Caption; Emp_No_CaptionLbl)
            {
            }
            column(AmountCaption; AmountCaptionLbl)
            {
            }
            column(Bills_Submitted__AfterCaption; Bills_Submitted__AfterCaptionLbl)
            {
            }
            column(Amount_Taken_DateCaption; Amount_Taken_DateCaptionLbl)
            {
            }
            column(Travelling_Dues_ReportCaption; Travelling_Dues_ReportCaptionLbl)
            {
            }
            column(Analysis_View_Entry_Analysis_View_Code; "Analysis View Code")
            {
            }
            column(Analysis_View_Entry_Account_No_; "Account No.")
            {
            }
            column(Analysis_View_Entry_Account_Source; "Account Source")
            {
            }
            column(Analysis_View_Entry_Dimension_2_Value_Code; "Dimension 2 Value Code")
            {
            }
            column(Analysis_View_Entry_Dimension_3_Value_Code; "Dimension 3 Value Code")
            {
            }
            column(Analysis_View_Entry_Dimension_4_Value_Code; "Dimension 4 Value Code")
            {
            }
            column(Analysis_View_Entry_Business_Unit_Code; "Business Unit Code")
            {
            }
            column(Analysis_View_Entry_Posting_Date; "Posting Date")
            {
            }
            column(Analysis_View_Entry_Entry_No_; "Entry No.")
            {
            }
            column(Analysis_View_Entry_Cash_Flow_Forecast_No_; "Cash Flow Forecast No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                CurrReport.CREATETOTALS("Analysis View Entry".Amount);
            end;

            trigger OnPreDataItem();
            begin
                i := 1;
                j := 1;
                "Analysis View Entry".SETFILTER("Analysis View Entry"."Account No.", '24000');//B2B Changed "Analysis View Entry".G/L Account No.
                "Analysis View Entry".SETRANGE("Analysis View Entry"."Posting Date", fromdate, todate);
                //"Analysis View Entry".setfilter("Analysis View Entry"."Debit Amount",'>0');
                WHILE ("Analysis View Entry".NEXT <> 0) DO BEGIN
                    IF "Analysis View Entry".Amount > 0 THEN BEGIN
                        temp[i] := "Analysis View Entry"."Posting Date";
                        amt[i] := "Analysis View Entry"."Debit Amount";
                        i := i + 1;
                    END;
                    IF "Analysis View Entry".Amount < 0 THEN BEGIN
                        temp1[j] := "Analysis View Entry"."Posting Date";
                        amt1[j] := "Analysis View Entry"."Credit Amount";
                        j := j + 1;
                    END;
                END;
                i := 1;
                j := 1;
                l := 1;
                m := 1;
                c := 1;
                WHILE (temp[i] <> 0D) AND (temp1[j] <> 0D) DO BEGIN
                    k := amt1[j];
                    k1 := k1 + amt[i];
                    WHILE (k1 < k) DO BEGIN
                        days[m] := temp1[j] - temp[i];
                        k1 := k1 + sum(amt[i], amt[i + 1]);
                        c := c + 1;
                        i := i + 1;
                        m := m + 1;
                    END;
                    days[m] := temp1[j] - temp[i];
                    m := m + 1;
                    //IF c>1 THEN
                    l := c;
                    /*  WHILE (l>=1) DO
                      BEGIN
                      days[m]:=temp1[j]-temp[l];
                      l:=l-1;
                      m:=m+1;
                     // c:=c-1;
                     END;
                     */
                    pending[i] := k1 - k;

                    k1 := pending[i];
                    IF (temp[i] <> 0D) AND (k > k1) THEN BEGIN
                        negitive := amt[i] + (k - k1);
                    END;
                    /* days[i]:=temp1[j]-temp[i];
                    IF days[i]>=30 THEN
                     pending[i]:=days[i];*/

                    j := j + 1;
                    i := i + 1;
                    // m:=m+1;
                END;
                /*   IF negitive>=0 THEN
                      MESSAGE('need to pay');
                 */

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

    trigger OnPreReport();
    begin
        empcode := "Analysis View Entry".GETFILTER("Analysis View Entry"."Dimension 1 Value Code");
    end;

    var
        empcode: Code[20];
        fromdate: Date;
        todate: Date;
        temp: array[100] of Date;
        i: Integer;
        temp1: array[100] of Date;
        days: array[50] of Integer;
        j: Integer;
        amt: array[100] of Decimal;
        amt1: array[100] of Decimal;
        pending: array[25] of Decimal;
        k: Decimal;
        l: Decimal;
        k1: Decimal;
        negitive: Decimal;
        m: Decimal;
        c: Integer;
        x: Integer;
        Emp_No_CaptionLbl: Label 'Emp No.';
        AmountCaptionLbl: Label 'Amount';
        Bills_Submitted__AfterCaptionLbl: Label 'Bills Submitted  After';
        Amount_Taken_DateCaptionLbl: Label 'Amount Taken Date';
        Travelling_Dues_ReportCaptionLbl: Label 'Travelling Dues Report';

    (6783)]
    procedure "sum"(var i: Decimal; var j: Decimal) k1: Decimal;
    begin
        k1 := i + j;
    end;
}

