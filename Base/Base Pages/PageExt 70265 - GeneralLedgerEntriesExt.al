pageextension 70265 GeneralLedgerEntriesExt extends "General Ledger Entries"
{
    Editable = true;

    layout
    {
        addbefore(Control1)
        {
            group(Control1102152015)
            {
                Visible = "Totals_Visible";
                ShowCaption = false;
                field(FiscialYear; 9)
                {
                    Caption = 'Year';
                    trigger OnValidate()
                    begin
                        CASE FiscialYear OF
                            FiscialYear::"08-09":
                                BEGIN
                                    SETRANGE("Posting Date", DMY2DATE(1, 4, 2010), DMY2DATE(31, 3, 2011));
                                END;
                            FiscialYear::"09-10":
                                BEGIN
                                    SETRANGE("Posting Date", DMY2DATE(1, 4, 2010), DMY2DATE(31, 3, 2011));
                                END;
                            FiscialYear::"10-11":
                                BEGIN
                                    SETRANGE("Posting Date", DMY2DATE(1, 4, 2010), DMY2DATE(31, 3, 2011));
                                END;
                            FiscialYear::"11-12":
                                BEGIN
                                    SETRANGE("Posting Date", DMY2DATE(1, 4, 2011), DMY2DATE(31, 3, 2012));
                                END;
                            FiscialYear::"12-13":
                                BEGIN
                                    SETRANGE("Posting Date", DMY2DATE(1, 4, 2012), DMY2DATE(31, 3, 2013));
                                END;
                            FiscialYear::"13-14":
                                BEGIN
                                    SETRANGE("Posting Date", DMY2DATE(1, 4, 2013), DMY2DATE(31, 3, 2014));
                                END;
                            FiscialYear::"14-15":
                                BEGIN
                                    SETRANGE("Posting Date", DMY2DATE(1, 4, 2014), DMY2DATE(31, 3, 2015));
                                END;
                            FiscialYear::"15-16":
                                BEGIN
                                    SETRANGE("Posting Date", DMY2DATE(1, 4, 2015), DMY2DATE(31, 3, 2016));
                                END;
                            FiscialYear::"16-17":
                                BEGIN
                                    SETRANGE("Posting Date", DMY2DATE(1, 4, 2016), DMY2DATE(31, 3, 2017));
                                END;
                            FiscialYear::"17-18":
                                BEGIN
                                    SETRANGE("Posting Date", DMY2DATE(1, 4, 2017), DMY2DATE(31, 3, 2018));
                                END;
                            FiscialYear::"18-19":
                                BEGIN
                                    SETRANGE("Posting Date", DMY2DATE(1, 4, 2018), DMY2DATE(31, 3, 2019));
                                END;
                            FiscialYear::"19-20":
                                BEGIN
                                    SETRANGE("Posting Date", DMY2DATE(1, 4, 2019), DMY2DATE(31, 3, 2020));
                                END;
                            FiscialYear::"20-21":
                                BEGIN
                                    SETRANGE("Posting Date", DMY2DATE(1, 4, 2020), DMY2DATE(31, 3, 2021));
                                END;
                        END;
                        CNT := 0;
                        IF USERID IN ['EFFTRONICS\SUJANI', 'EFFTRONICS\DURGARAOV', 'EFFTRONICS\RAMKUMARL', 'EFFTRONICS\SITARAJYAM', 'EFFTRONICS\PURNACHAND', 'EFFTRONICS\PADMASRI', 'EFFTRONICS\20TE128',
                                      'EFFTRONICS\DSR', 'EFFTRONICS\RAJANI', 'EFFTRONICS\SUSMITHAL', 'EFFTRONICS\ASWINI', 'EFFTRONICS\ANILKUMAR', 'EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\SUJANI', 'EFFTRONICS\TPRIYANKA'] THEN BEGIN
                            GLE.RESET;
                            GLE.COPYFILTERS(Rec);
                            TotalCredit := 0;
                            TotalDebit := 0;
                            OpeningBal := 0;
                            ClosingBal := 0;
                            IF GETRANGEMIN(Rec."Posting Date") > DMY2DATE(1, 4, 2008) THEN BEGIN
                                GLE.SETRANGE(GLE."Posting Date", DMY2DATE(1, 4, 2008), GETRANGEMIN(Rec."Posting Date") - 1);
                                IF GLE.FINDSET THEN
                                    REPEAT
                                        OpeningBal += GLE."Debit Amount" - GLE."Credit Amount";
                                    UNTIL GLE.NEXT = 0;
                            END;

                            GLE.RESET;
                            GLE.COPYFILTERS(Rec);
                            IF GLE.FINDSET THEN
                                REPEAT
                                    TotalCredit += GLE."Credit Amount";
                                    TotalDebit += GLE."Debit Amount";
                                UNTIL GLE.NEXT = 0;
                            ClosingBal := OpeningBal + TotalDebit - TotalCredit;
                        END;
                        CurrPage.UPDATE;
                    end;
                }
            }
        }
        addafter(Control1)
        {
            field("No. Series"; "No. Series")
            {

            }
        }
        addafter("Posting Date")
        {
            field("System Date"; "System Date")
            {

            }
            field("Document Date"; "Document Date")
            {

            }
        }
        addafter("Document No.")
        {
            field("Tender No"; "Tender No")
            {

            }
            field("Journal Batch Name"; "Journal Batch Name")
            {

            }
            field("Vendor Invoice Date"; "Vendor Invoice Date")
            {

            }
        }
        addafter("G/L Account No.")
        {
            field("Payment Type"; "Payment Type")
            {

            }
            field(Control1102154008; Attachment)
            {

            }
            field("System-Created Entry"; "System-Created Entry")
            {

            }
        }
        addafter("Job No.")
        {
            field("Sale Order No."; "Sale Order No.")
            {

            }
        }
        addafter("VAT Amount")
        {
            field("Tax Amount"; "Tax Amount")
            {

            }
        }
        addafter("Entry No.")
        {
            field("Add.-Currency Debit Amount"; "Add.-Currency Debit Amount")
            {

            }
            field("Add.-Currency Credit Amount"; "Add.-Currency Credit Amount")
            {

            }
            field("Currency Amount"; "Currency Amount")
            {

            }
            group(Totals)
            {
                Caption = 'Totals';
            }
            group(Control1102152012)
            {
                ShowCaption = false;
            }
            group(Control1102152011)
            {
                ShowCaption = false;
            }
            field(OpeningBal; OpeningBal)
            {
                Caption = 'Opening Balance';
                Style = Favorable;
                StyleExpr = true;
            }
            group(Control1102152009)
            {
                ShowCaption = false;
            }
            field(TotalCredit; TotalCredit)
            {
                Caption = 'Credit';
                Style = StrongAccent;
                StyleExpr = true;
            }
            group(Control1102152008)
            {
                ShowCaption = false;
            }
            field(TotalDebit; TotalDebit)
            {
                Caption = 'Debit';
                StyleExpr = true;
                Style = StrongAccent;
            }
            group(Control1102152005)
            {
                ShowCaption = false;
            }
            field(ClosingBal; ClosingBal)
            {
                Width = 100;
                Caption = 'Closing Balance';
                Style = Favorable;
                StyleExpr = true;
            }
        }
    }

    actions
    {
        addafter(IncomingDocAttachFile)
        {
            action(Print)
            {
                Caption = 'Print';
                Image = Print;
                trigger OnAction()
                begin
                    //  CurrPage.SETSELECTIONFILTER(GLAcc);
                    REPORT.RUNMODAL(13772, TRUE, TRUE);
                end;
            }
            action(Attachment)
            {
                Caption = 'Attachment';
                trigger OnAction()
                begin
                    CustAttach.SETRANGE("Table ID", DATABASE::"G/L Entry");
                    CustAttach.SETRANGE("Document No.", "Document No.");

                    PAGE.RUN(PAGE::"ESPL Attachments", CustAttach);
                end;
            }
        }

    }

    trigger OnOpenPage()
    begin
        IF (("Document No.") = '') AND (GETFILTER("Document No.") = '') THEN BEGIN
            IF USERID IN ['EFFTRONICS\DURGARAOV', 'EFFTRONICS\RAMKUMARL', 'EFFTRONICS\SITARAJYAM', 'EFFTRONICS\VIJAYA', 'EFFTRONICS\PADMASRI',
                          'EFFTRONICS\DSR', 'EFFTRONICS\PURNACHAND', 'EFFTRONICS\20TE128', 'EFFTRONICS\20TE106', 'EFFTRONICS\TPRIYANKA',
                          'EFFTRONICS\RAJANI', 'EFFTRONICS\ASWINI', 'EFFTRONICS\ANILKUMAR', 'EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\SUSMITHAL'] THEN BEGIN
                FiscialYear := FiscialYear::"20-21";
                CurrPage.UPDATE;
                GLE.RESET;
                GLE.COPYFILTERS(Rec);
                IF DATE2DMY(TODAY, 2) > 3 THEN BEGIN
                    SETRANGE("Posting Date", DMY2DATE(1, 4, DATE2DMY(TODAY, 3)), DMY2DATE(31, 3, DATE2DMY(TODAY, 3) + 1));
                    GLE.SETRANGE(GLE."Posting Date", DMY2DATE(1, 4, 2008), DMY2DATE(31, 3, DATE2DMY(TODAY, 3)));
                END
                ELSE BEGIN
                    SETRANGE("Posting Date", DMY2DATE(1, 4, DATE2DMY(TODAY, 3) - 1), DMY2DATE(31, 3, DATE2DMY(TODAY, 3)));
                    GLE.SETRANGE(GLE."Posting Date", DMY2DATE(1, 4, 2010), DMY2DATE(31, 3, DATE2DMY(TODAY, 3) - 1));
                END;
                Totals_Visible := TRUE;
                TotalCredit := 0;
                TotalDebit := 0;
                OpeningBal := 0;
                ClosingBal := 0;
                IF GLE.FINDFIRST THEN
                    REPEAT
                        OpeningBal += GLE."Debit Amount" - GLE."Credit Amount";
                    UNTIL GLE.NEXT = 0;


                GLE.RESET;
                GLE.COPYFILTERS(Rec);
                IF GLE.FINDSET THEN
                    REPEAT
                        TotalCredit += GLE."Credit Amount";
                        TotalDebit += GLE."Debit Amount";

                    UNTIL GLE.NEXT = 0;
                ClosingBal := OpeningBal + TotalDebit - TotalCredit;
            END
            ELSE
                Totals_Visible := FALSE;
        END
        ELSE BEGIN
            IF "Posting Date" <> 0D THEN
                SETRANGE("Posting Date", "Posting Date", "Posting Date");
        END;
    end;

    trigger OnAfterGetRecord()
    begin
        //StyleTxt := SetStyle;

        IF ((USERID IN ['EFFTRONICS\DURGARAOV', 'EFFTRONICS\RAMKUMARL', 'EFFTRONICS\SITARAJYAM', 'EFFTRONICS\ASWINI', 'EFFTRONICS\ANILKUMAR',
          'EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\SUJANI', 'EFFTRONICS\PADMASRI', 'EFFTRONICS\20TE128', 'EFFTRONICS\TPRIYANKA',
                        'EFFTRONICS\DSR', 'EFFTRONICS\PURNACHAND', 'EFFTRONICS\RAJANI', 'EFFTRONICS\SUSMITHAL'])) THEN BEGIN
            IF FilterChanged THEN BEGIN
                GLE.RESET;
                GLE.COPYFILTERS(Rec);
                TotalCredit := 0;
                TotalDebit := 0;
                OpeningBal := 0;
                ClosingBal := 0;

                IF GETRANGEMIN(Rec."Posting Date") > DMY2DATE(1, 4, 2008) THEN BEGIN
                    GLE.SETRANGE(GLE."Posting Date", DMY2DATE(1, 4, 2008), GETRANGEMIN(Rec."Posting Date") - 1);
                    IF GLE.FINDSET THEN
                        REPEAT
                            OpeningBal += GLE."Debit Amount" - GLE."Credit Amount";
                        UNTIL GLE.NEXT = 0;
                END;

                GLE.RESET;
                GLE.COPYFILTERS(Rec);
                IF GLE.FINDSET THEN
                    REPEAT
                        TotalCredit += GLE."Credit Amount";
                        TotalDebit += GLE."Debit Amount";
                    UNTIL GLE.NEXT = 0;
                ClosingBal := OpeningBal + TotalDebit - TotalCredit;
                //CNT:=1;
            END;
        END;
    end;

    var
        CustAttach: Record Attachments;
        TotalCredit: Decimal;
        TotalDebit: Decimal;
        ClosingBal: Decimal;
        Totals_Visible: Boolean;
        OpeningBal: Decimal;
        FiscialYear: '"08-09","09-10","10-11","11-12","12-13","13-14","14-15","15-16","16-17","17-18","18-19","19-20","20-21"';
        GLE: Record "G/L Entry";
        CNT: Decimal;
        RecCount: Integer;
        LastRecFilter: Text;

    PROCEDURE FilterChanged(): Boolean;
    BEGIN
        IF LastRecFilter <> GETFILTERS THEN BEGIN
            LastRecFilter := GETFILTERS;
            EXIT(TRUE);
        END ELSE
            EXIT(FALSE);
    END;
}