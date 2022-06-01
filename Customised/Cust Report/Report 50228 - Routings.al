report 50228 Routings
{
    // version Rev01,EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './Routings.rdlc';

    dataset
    {
        dataitem("Prod. Order Routing Line"; "Prod. Order Routing Line")
        {
            RequestFilterFields = "Prod. Order No.", "Work Center No.";

            trigger OnAfterGetRecord();
            begin
                I := 0;
                POL.SETFILTER(POL."Prod. Order No.", "Prod. Order Routing Line"."Prod. Order No.");
                POL.SETFILTER(POL."Item No.", "Prod. Order Routing Line"."Routing No.");
                IF POL.FINDFIRST THEN
                    I := POL.Quantity;
                IF I > 0 THEN
                    REPEAT
                        PCBTYPE := '';
                        IF COPYSTR("Prod. Order Routing Line"."Routing No.", 1, 7) = 'ECPBPCB' THEN BEGIN
                            PCBTYPE := COPYSTR("Prod. Order Routing Line"."Item Description", 1, STRPOS("Prod. Order Routing Line"."Item Description", ' '));
                            PCBTYPE := 'EFF-' + PCBTYPE;
                        END;
                        Row += 1;
                        Entercell(Row, 1, FORMAT(TODAY), FALSE);
                        Entercell(Row, 4, 'Production', FALSE);
                        Entercell(Row, 5, "Prod. Order Routing Line"."Prod. Order No.", FALSE);
                        Entercell(Row, 6, "Prod. Order Routing Line"."Operation No.", FALSE);
                        Entercell(Row, 7, FORMAT("Prod. Order Routing Line"."Operation Description"), FALSE);
                        Entercell(Row, 8, PCBTYPE, FALSE);
                        Entercell(Row, 9, "Prod. Order Routing Line"."Routing No.", FALSE);
                        Entercell(Row, 10, "Prod. Order Routing Line"."Item Description", FALSE);
                        I := I - 1;
                    UNTIL I <= 0;
            end;

            trigger OnPreDataItem();
            begin
                Row := 1;
                EnterHeadings(Row, 1, 'DATE', TRUE);
                EnterHeadings(Row, 2, 'Person ID', TRUE);
                EnterHeadings(Row, 3, 'Person Name', TRUE);
                EnterHeadings(Row, 4, 'Group', TRUE);
                EnterHeadings(Row, 5, 'Project Code', TRUE);
                EnterHeadings(Row, 6, 'Work No', TRUE);
                EnterHeadings(Row, 7, 'Work Description', TRUE);
                EnterHeadings(Row, 8, 'PCB Type', TRUE);
                EnterHeadings(Row, 9, 'PCB', TRUE);
                EnterHeadings(Row, 10, 'PCB Description', TRUE);
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
        Tempexcelbuffer.CreateBook('', '');//B2B //EFFUPG
        //Tempexcelbuffer.CreateSheet('Issued Material Report','',COMPANYNAME,'');//B2b
        Tempexcelbuffer.GiveUserControl;
    end;

    trigger OnPreReport();
    begin
        CLEAR(Tempexcelbuffer);
        Tempexcelbuffer.DELETEALL;
    end;

    var
        PO: Record "Production Order";
        Tempexcelbuffer: Record "Excel Buffer";
        EXCEL: Boolean;
        Row: Integer;
        PCBTYPE: Code[30];
        I: Integer;
        POL: Record "Prod. Order Line";

    [LineStart(9759)]
    procedure Entercell(RowNo: Integer; ColumnNo: Integer; CellValue: Text[1000]; bold: Boolean);
    begin
        Tempexcelbuffer.INIT;
        Tempexcelbuffer.VALIDATE("Row No.", RowNo);
        Tempexcelbuffer.VALIDATE("Column No.", ColumnNo);
        Tempexcelbuffer."Cell Value as Text" := CellValue;
        Tempexcelbuffer.Bold := bold;

        Tempexcelbuffer.INSERT;
    end;

    [LineStart(9768)]
    procedure EnterHeadings(RowNo: Integer; ColumnNo: Integer; CellValue: Text[100]; Bold: Boolean);
    begin
        Tempexcelbuffer.INIT;
        Tempexcelbuffer.VALIDATE("Row No.", RowNo);
        Tempexcelbuffer.VALIDATE("Column No.", ColumnNo);
        Tempexcelbuffer."Cell Value as Text" := FORMAT(CellValue);
        Tempexcelbuffer.Bold := Bold;

        Tempexcelbuffer.Formula := '';
        Tempexcelbuffer.INSERT;
    end;
}

