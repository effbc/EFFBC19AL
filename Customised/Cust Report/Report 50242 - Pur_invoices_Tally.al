report 50242 Pur_invoices_Tally
{
    // version EFFUPG

    //   EnterHeadings(Row,1,'DATE',TRUE);
    //   EnterHeadings(Row,2,'DOCUMENT NO',TRUE);
    //   EnterHeadings(Row,3,'VOUCHER TYPE NAME',TRUE);
    //   EnterHeadings(Row,4,'REF NO',TRUE);
    //   EnterHeadings(Row,5,'PARTY NAME',TRUE);
    //   EnterHeadings(Row,6,'PUR LED NAME / TAXES / EXPENSES',TRUE);
    //   EnterHeadings(Row,7,'AMOUNT',TRUE);
    //   EnterHeadings(Row,8,'NARRATION',TRUE);
    //   EnterHeadings(Row,9,'NO OF CREDIT DAYS',TRUE);
    DefaultLayout = RDLC;
    RDLCLayout = './Pur_invoices_Tally.rdlc';


    dataset
    {
        dataitem("Purch. Inv. Header";"Purch. Inv. Header")
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending) WHERE(Payment Terms Code=FILTER(<>CASH));
            RequestFilterFields = "Posting Date","Buy-from Vendor No.";
            column(G_L_Entry__Posting_Date_Caption;"G/L Entry".FIELDCAPTION("Posting Date"))
            {
            }
            column(G_L_Entry__Document_No__Caption;"G/L Entry".FIELDCAPTION("Document No."))
            {
            }
            column(G_L_Entry__External_Document_No__Caption;"G/L Entry".FIELDCAPTION("External Document No."))
            {
            }
            column(Vendor_NameCaption;Vendor_NameCaptionLbl)
            {
            }
            column(G_L_Entry__G_L_Account_Name_Caption;"G/L Entry".FIELDCAPTION("G/L Account Name"))
            {
            }
            column(G_L_Entry_AmountCaption;"G/L Entry".FIELDCAPTION(Amount))
            {
            }
            column(Purch__Inv__Header_No_;"No.")
            {
            }
            dataitem("G/L Entry";"G/L Entry")
            {
                DataItemLink = Document No.=FIELD(No.);
                column(G_L_Entry__Posting_Date_;"Posting Date")
                {
                }
                column(G_L_Entry__Document_No__;"Document No.")
                {
                }
                column(G_L_Entry__External_Document_No__;"External Document No.")
                {
                }
                column(G_L_Entry__G_L_Account_Name_;"G/L Account Name")
                {
                }
                column(G_L_Entry_Amount;Amount)
                {
                }
                column(Vendor_Name;Vendor_Name)
                {
                }
                column(G_L_Entry_Entry_No_;"Entry No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                      Row+=1;
                      Entercell(Row,1,FORMAT("G/L Entry"."Posting Date"),FALSE);
                      Entercell(Row,2,FORMAT("G/L Entry"."Document No."),FALSE);
                      Entercell(Row,3,'PURCHASE',FALSE);
                      Entercell(Row,4,FORMAT("G/L Entry"."External Document No."),FALSE);
                      Entercell(Row,5,FORMAT(Vendor_Name),FALSE);
                      Entercell(Row,6,FORMAT("G/L Entry"."G/L Account Name"),FALSE);
                      Entercell(Row,7,FORMAT("G/L Entry".Amount),FALSE);
                      Entercell(Row,8,FORMAT(Narration),FALSE);
                    //  Entercell(Row,9,FORMAT(Serviced_QTY),FALSE);
                end;
            }

            trigger OnAfterGetRecord();
            begin
                Vendor_Name:='';
                Narration:='';
                Vend.RESET;
                Vend.SETFILTER(Vend."No.","Purch. Inv. Header"."Buy-from Vendor No.");
                IF Vend.FINDFIRST THEN
                  Vendor_Name:=Vend."Tally Reference";
                PIL.RESET;
                PIL.SETFILTER(PIL."Document No.","Purch. Inv. Header"."No.");
                PIL.SETFILTER(PIL."No.",'<>%1','');
                IF PIL.FINDLAST THEN
                BEGIN
                  Narration:='TOWARDS PURCHASE OF '+UPPERCASE(PIL.Description)+' AS PER BILL NO:'+"Purch. Inv. Header"."Vendor Invoice No."+' DT:';
                  Narration:=Narration+FORMAT("Purch. Inv. Header"."Vendor Invoice Date",0,'<Day>-<Month Text,2>-<Year4>');
                END;
            end;

            trigger OnPreDataItem();
            begin
                  Row:=1;
                  EnterHeadings(Row,1,'DATE',TRUE);
                  EnterHeadings(Row,2,'DOCUMENT NO',TRUE);
                  EnterHeadings(Row,3,'VOUCHER TYPE NAME',TRUE);
                  EnterHeadings(Row,4,'REF NO',TRUE);
                  EnterHeadings(Row,5,'PARTY NAME',TRUE);
                  EnterHeadings(Row,6,'PUR LED NAME / TAXES / EXPENSES',TRUE);
                  EnterHeadings(Row,7,'AMOUNT',TRUE);
                  EnterHeadings(Row,8,'NARRATION',TRUE);
                  EnterHeadings(Row,9,'NO OF CREDIT DAYS',TRUE);
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
          IF EXCEL THEN
          BEGIN
            Tempexcelbuffer.CreateBook('','');//B2B //EFFUPG
            //Tempexcelbuffer.CreateSheet('Tally','',COMPANYNAME,'');//B2B
            Tempexcelbuffer.GiveUserControl;
          END
    end;

    trigger OnPreReport();
    begin
          EXCEL:=TRUE;
          IF EXCEL THEN
          BEGIN
            CLEAR(Tempexcelbuffer);
            Tempexcelbuffer.DELETEALL;
          END;
    end;

    var
        Vend : Record Vendor;
        Vendor_Name : Text[100];
        Tempexcelbuffer : Record "Excel Buffer" temporary;
        EXCEL : Boolean;
        Row : Integer;
        Narration : Text[1024];
        PIL : Record "Purch. Inv. Line";
        Vendor_NameCaptionLbl : Label 'Vendor Name';

    [LineStart(11361)]
    procedure Entercell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[1000];bold : Boolean);
    begin

        Tempexcelbuffer.INIT;
        Tempexcelbuffer.VALIDATE("Row No.",RowNo);
        Tempexcelbuffer.VALIDATE("Column No.",ColumnNo);
        Tempexcelbuffer."Cell Value as Text" := CellValue;
        Tempexcelbuffer.Bold:=bold ;

        Tempexcelbuffer.INSERT;
    end;

    [LineStart(11371)]
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
}

