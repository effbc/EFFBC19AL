report 50135 jvvatbills
{
    // version EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './jvvatbills.rdlc';

    dataset
    {
        dataitem("G/L Entry";"G/L Entry")
        {
            DataItemTableView = SORTING(G/L Account No.,Posting Date) ORDER(Ascending) WHERE(G/L Account No.=FILTER(23800|23801|23802),Amount=FILTER(>0));
            RequestFilterFields = "Global Dimension 1 Code";
            column(GLvatper;GLvatper)
            {
            }
            column(GLVATAmt_GLtot;GLVATAmt+GLtot)
            {
            }
            column(GLVATAmt;GLVATAmt)
            {
            }
            column(GLtot;GLtot)
            {
            }
            column(G_L_Entry__G_L_Entry___External_Document_No__;"G/L Entry"."External Document No.")
            {
            }
            column(VName;VName)
            {
            }
            column(G_L_Entry__G_L_Entry___Posting_Date_;"G/L Entry"."Posting Date")
            {
            }
            column(VName_Control1102154000;VName)
            {
            }
            column(G_L_Entry__G_L_Entry___Posting_Date__Control1102154001;"G/L Entry"."Posting Date")
            {
            }
            column(G_L_Entry__G_L_Entry___External_Document_No___Control1102154002;"G/L Entry"."External Document No.")
            {
            }
            column(GLtot_Control1102154003;GLtot)
            {
            }
            column(GLVATAmt_Control1102154004;GLVATAmt)
            {
            }
            column(GLVATAmt_GLtot_Control1102154005;GLVATAmt+GLtot)
            {
            }
            column(GLvatper_Control1102154006;GLvatper)
            {
            }
            column(VName_Control1102154007;VName)
            {
            }
            column(G_L_Entry__G_L_Entry___Posting_Date__Control1102154008;"G/L Entry"."Posting Date")
            {
            }
            column(G_L_Entry__G_L_Entry___External_Document_No___Control1102154009;"G/L Entry"."External Document No.")
            {
            }
            column(GLtot_Control1102154010;GLtot)
            {
            }
            column(GLVATAmt_Control1102154011;GLVATAmt)
            {
            }
            column(GLVATAmt_GLtot_Control1102154012;GLVATAmt+GLtot)
            {
            }
            column(GLvatper_Control1102154013;GLvatper)
            {
            }
            column(VName_Control1102154045;VName)
            {
            }
            column(G_L_Entry__G_L_Entry___Posting_Date__Control1102154046;"G/L Entry"."Posting Date")
            {
            }
            column(G_L_Entry__G_L_Entry___External_Document_No___Control1102154047;"G/L Entry"."External Document No.")
            {
            }
            column(GLtot_Control1102154048;GLtot)
            {
            }
            column(GLVATAmt_Control1102154049;GLVATAmt)
            {
            }
            column(GLVATAmt_GLtot_Control1102154050;GLVATAmt+GLtot)
            {
            }
            column(GLvatper_Control1102154051;GLvatper)
            {
            }
            column(ROUND_totass_1_;ROUND(totass,1))
            {
            }
            column(ROUND_totvatamt_1_;ROUND(totvatamt,1))
            {
            }
            column(ROUND_totamt_1_;ROUND(totamt,1))
            {
            }
            column(Vendor_NameCaption;Vendor_NameCaptionLbl)
            {
            }
            column(Invoice_NoCaption;Invoice_NoCaptionLbl)
            {
            }
            column(Asses__ValueCaption;Asses__ValueCaptionLbl)
            {
            }
            column(VAT_amountCaption;VAT_amountCaptionLbl)
            {
            }
            column(Invoiced_AmountCaption;Invoiced_AmountCaptionLbl)
            {
            }
            column(Posting_DateCaption;Posting_DateCaptionLbl)
            {
            }
            column(PercentageCaption;PercentageCaptionLbl)
            {
            }
            column(G_L_Entry_Entry_No_;"Entry No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                GLtot:=0;
                VNo:='';
                VName:='';
                GL.SETRANGE(GL."Journal Batch Name","G/L Entry"."Journal Batch Name");
                GL.SETRANGE(GL."Document No.","G/L Entry"."Document No.");
                GL.SETFILTER(GL.Amount,'>0');
                IF GL.FIND('-') THEN
                REPEAT
                IF (GL."G/L Account No."='23800') OR (GL."G/L Account No."='23801')OR (GL."G/L Account No."='23802')
                    OR (GL."G/L Account No."='23804') THEN
                GLVATAmt:=GL.Amount
                ELSE
                GLtot:=GLtot+GL.Amount;
                IF (GL."G/L Account No."='61400') OR (GL."G/L Account No."='61904') THEN
                GLtot:=GLtot-GL.Amount;

                totamt:=totamt+GL.Amount;
                UNTIL GL.NEXT=0;
                totvatamt:=totvatamt+GLVATAmt;
                totass:=totass+GLtot;
                IF GLtot<>0 THEN
                GLvatper:=ROUND(((GLVATAmt/GLtot)*100),1);
                VLE.SETRANGE(VLE."Document No.","G/L Entry"."Document No.");
                IF VLE.FIND('-') THEN
                REPEAT
                VNo:=VLE."Vendor No.";
                Vendor.SETRANGE(Vendor."No.",VNo);
                IF Vendor.FIND('-') THEN
                BEGIN
                VName:=Vendor.Name;
                END;
                UNTIL VLE.NEXT=0;
            end;

            trigger OnPreDataItem();
            begin
                TempExcelbuffer.DELETEALL;
                CLEAR(TempExcelbuffer);
                Row:=0;
                GLvatper:=0;
                GLVATAmt:=0;
                "G/L Entry".SETCURRENTKEY("G/L Entry"."Document No.","G/L Entry"."Posting Date");
                "G/L Entry".SETRANGE("G/L Entry"."Posting Date",fromdate,todate);
                "G/L Entry".SETFILTER("G/L Entry"."Document No.",'JV*|CPV*');
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
        IF Excel THEN
        BEGIN
        TempExcelbuffer.CreateBook('','');//B2B //EFFUPG
        //TempExcelbuffer.CreateSheet('Total Vat bills','',COMPANYNAME,'');//B2B
        TempExcelbuffer.GiveUserControl;
        END;
    end;

    var
        GL : Record "G/L Entry";
        GLvatper : Decimal;
        GLtot : Decimal;
        GLVATAmt : Decimal;
        VLE : Record "Vendor Ledger Entry";
        VName : Text[30];
        VNo : Text[10];
        Vendor : Record Vendor;
        jvvat4 : Boolean;
        fromdate : Date;
        todate : Date;
        jvvat12 : Boolean;
        TempExcelbuffer : Record "Excel Buffer" temporary;
        Row : Integer;
        Excel : Boolean;
        totamt : Decimal;
        totvatamt : Decimal;
        totass : Decimal;
        jvvat14 : Boolean;
        jvvat5 : Boolean;
        Vendor_NameCaptionLbl : Label 'Vendor Name';
        Invoice_NoCaptionLbl : Label 'Invoice No';
        Asses__ValueCaptionLbl : Label 'Asses. Value';
        VAT_amountCaptionLbl : Label 'VAT amount';
        Invoiced_AmountCaptionLbl : Label 'Invoiced Amount';
        Posting_DateCaptionLbl : Label 'Posting Date';
        PercentageCaptionLbl : Label 'Percentage';

    [LineStart(7312)]
    procedure Entercell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[1000];bold : Boolean);
    begin

        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.",RowNo);
        TempExcelbuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelbuffer."Cell Value as Text" := CellValue;
        TempExcelbuffer.Bold:=bold ;

        TempExcelbuffer.INSERT;
    end;

    [LineStart(7322)]
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

