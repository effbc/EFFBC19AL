report 80023 "Service Items3"
{
    // version NAVW17.00

    DefaultLayout = RDLC;
    RDLCLayout = './Service Items3.rdlc';
    Caption = 'Service Items';

    dataset
    {
        dataitem("Material Issues Header"; "Material Issues Header")
        {
            DataItemTableView = SORTING(Field1) ORDER(Ascending) WHERE(Field11 = CONST(SITE), Field22 = CONST(1));
            RequestFilterFields = Field44;
            column(Pending_Site_Material_Caption; Pending_Site_Material_CaptionLbl)
            {
            }
            column(StationCaption; StationCaptionLbl)
            {
            }
            column(ItemCaption; ItemCaptionLbl)
            {
            }
            column(Requested_QuantityCaption; Requested_QuantityCaptionLbl)
            {
            }
            column(Issued_QuantityCaption; Issued_QuantityCaptionLbl)
            {
            }
            column(Pending_QuantityCaption; Pending_QuantityCaptionLbl)
            {
            }
            column(Requested_PersonCaption; Requested_PersonCaptionLbl)
            {
            }
            column(Reason_Caption; Reason_CaptionLbl)
            {
            }
            column(Requested_DateCaption; Requested_DateCaptionLbl)
            {
            }
            column(LocationCaption; LocationCaptionLbl)
            {
            }
            column(Stock_at_CSCaption; Stock_at_CSCaptionLbl)
            {
            }
            column(Pending_DaysCaption; Pending_DaysCaptionLbl)
            {
            }
            column(S_NoCaption; S_NoCaptionLbl)
            {
            }
            column(Request_No_Caption; Request_No_CaptionLbl)
            {
            }
            column(Material_Issues_Header_No_; "No.")
            {
            }
            dataitem("Material Issues Line"; "Material Issues Line")
            {
                DataItemLink = Field1 = FIELD(Field1);
                DataItemTableView = SORTING(Field1, Field2) WHERE(Field4 = FILTER(> 0), Field7 = FILTER(> 0));
                column(Location; Location)
                {
                }
                column(Material_Issues_Header___Released_Date_; Table50001."Released Date")
                {
                }
                column(Material_Issues_Line__Station_Name_; "Station Name")
                {
                }
                column(Material_Issues_Line_Description; Description)
                {
                }
                column(Material_Issues_Line_Quantity; Quantity)
                {
                }
                column(Material_Issues_Line__Quantity_Received_; "Quantity Received")
                {
                }
                column(Material_Issues_Line__Qty__to_Receive_; "Qty. to Receive")
                {
                }
                column(Material_Issues_Header___Resource_Name_; Table50001."Resource Name")
                {
                }
                column(Material_Issues_Header___Reason_Code_; Table50001."Reason Code")
                {
                }
                column(TODAY__Material_Issues_Header___Released_Date_; TODAY - Table50001."Released Date")
                {
                }
                column(StockAtStore; StockAtStore)
                {
                }
                column(SNO; SNO)
                {
                }
                column(Material_Issues_Line__Document_No__; "Document No.")
                {
                }
                column(Material_Issues_Line_Line_No_; "Line No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    //Rev01

                    //Material Issues Line, Body (1) - OnPreSection()
                    "Dimension Value".SETRANGE("Dimension Value"."Dimension Code", 'LOCATIONS');
                    "Dimension Value".SETRANGE("Dimension Value".Code, Table50001."Shortcut Dimension 2 Code");
                    IF "Dimension Value".FIND('-') THEN
                        Location := "Dimension Value".Name;

                    SNO += 1;
                    StockAtStore := 0;
                    IF Table50001."Transfer-from Code" = 'CS STR' THEN BEGIN
                        IF Item.GET(Table50002."Item No.") THEN BEGIN
                            Item.CALCFIELDS(Item."Stock at CS Stores");
                            StockAtStore := Item."Stock at CS Stores";
                        END;
                    END ELSE BEGIN
                        "Item Ledger Entry".RESET;
                        "Item Ledger Entry".SETCURRENTKEY("Item Ledger Entry"."Item No.",
                                                          "Item Ledger Entry"."Location Code",
                                                          "Item Ledger Entry"."Global Dimension 1 Code",
                                                          "Item Ledger Entry"."Global Dimension 2 Code",
                                                          "Item Ledger Entry".Open,
                                                          "Item Ledger Entry"."Remaining Quantity");
                        "Item Ledger Entry".SETRANGE("Item Ledger Entry"."Item No.", Table50002."Item No.");
                        "Item Ledger Entry".SETRANGE("Item Ledger Entry"."Location Code", 'CS');
                        "Item Ledger Entry".SETRANGE("Item Ledger Entry"."Global Dimension 2 Code", 'H-OFF');
                        "Item Ledger Entry".SETFILTER("Item Ledger Entry"."Remaining Quantity", '>%1', 0);
                        "Item Ledger Entry".CALCSUMS("Item Ledger Entry"."Remaining Quantity");
                        StockAtStore := "Item Ledger Entry"."Remaining Quantity";
                    END;

                    IF Excel THEN BEGIN
                        Row += 1;
                        Entercell(Row, 1, FORMAT(SNO), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 2, FORMAT(TODAY - Table50001."Released Date"), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 3, FORMAT(Table50001."Released Date"), FALSE, TempExcelbuffer."Cell Type"::Date);
                        Entercell(Row, 4, Location, FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 5, Table50002."Station Name", FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 6, Table50002.Description, FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 7, FORMAT(Table50002.Quantity), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 8, FORMAT(Table50002."Quantity Received"), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 9, FORMAT(Table50002."Qty. to Receive"), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 10, FORMAT(StockAtStore), FALSE, TempExcelbuffer."Cell Type"::Number);
                        Entercell(Row, 11, FORMAT(Table50001."Resource Name"), FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 12, FORMAT(Table50001."Reason Code"), FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 13, FORMAT(Table50002.Remarks), FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 14, FORMAT(Table50002."Document No."), FALSE, TempExcelbuffer."Cell Type"::Text);
                        Entercell(Row, 15, FORMAT(Table50001."Mode of Transport"), FALSE, TempExcelbuffer."Cell Type"::Text);
                    END;
                    //Material Issues Line, Body (1) - OnPreSection()
                end;
            }

            trigger OnPreDataItem();
            begin
                //Material Issues Header, Header (2) - OnPreSection()
                IF Excel THEN BEGIN
                    Row := 1;
                    EnterHeadings(Row, 1, 'SERIAL NO.', TRUE, TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 2, 'PENDING DAYS', TRUE, TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 3, 'REQUESTED DATE', TRUE, TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 4, 'LOCATION', TRUE, TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 5, 'STATION', TRUE, TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 6, 'ITEM', TRUE, TempExcelbuffer."Cell Type"::Text);

                    EnterHeadings(Row, 7, 'REQUESTED QUANTITY', TRUE, TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 8, 'ISSUED QUANTITY', TRUE, TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 9, 'PENDING QUANTITY', TRUE, TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 10, 'STOCK AT CS', TRUE, TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 11, 'REQUESTED PERSON', TRUE, TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 12, 'REASON', TRUE, TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 13, 'REMARKS', TRUE, TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 14, 'MATERIAL REQUEST', TRUE, TempExcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 15, 'MODE OF TRANSPORT', TRUE, TempExcelbuffer."Cell Type"::Text);
                END;
                //Material Issues Header, Header (2) - OnPreSection()
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    field(Excel; Excel)
                    {
                    }
                }
            }
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
            /*
             TempExcelbuffer.CreateBook('Stock As on');//B2B
             {
             IF Choice=Choice::Stock THEN
              TempExcelbuffer.CreateSheet('Stock As on',COMPANYNAME,USERID)
             ELSE
             }


             TempExcelbuffer.WriteSheet('Stock',COMPANYNAME,USERID);//B2B
             TempExcelbuffer.OpenExcel;
             TempExcelbuffer.CloseBook;
             TempExcelbuffer.GiveUserControl;
            */
            TempExcelbuffer.CreateBookAndOpenExcel('Stock', 'Stock', COMPANYNAME, USERID); //Rev01;
        END;

    end;

    trigger OnPreReport();
    begin
        IF Excel THEN BEGIN
            CLEAR(TempExcelbuffer);
            TempExcelbuffer.DELETEALL;
        END;
    end;

    var
        StockAtStore: Decimal;
        Location: Text[30];
        "Dimension Value": Record "Dimension Value";
        SNO: Integer;
        Item: Record Item;
        TempExcelbuffer: Record "Excel Buffer" temporary;
        Row: Integer;
        "Item Ledger Entry": Record "Item Ledger Entry";
        Excel: Boolean;
        Pending_Site_Material_CaptionLbl: Label '"Pending Site Material "';
        StationCaptionLbl: Label 'Station';
        ItemCaptionLbl: Label 'Item';
        Requested_QuantityCaptionLbl: Label 'Requested Quantity';
        Issued_QuantityCaptionLbl: Label 'Issued Quantity';
        Pending_QuantityCaptionLbl: Label 'Pending Quantity';
        Requested_PersonCaptionLbl: Label 'Requested Person';
        Reason_CaptionLbl: Label '"Reason "';
        Requested_DateCaptionLbl: Label 'Requested Date';
        LocationCaptionLbl: Label 'Location';
        Stock_at_CSCaptionLbl: Label 'Stock at CS';
        Pending_DaysCaptionLbl: Label 'Pending Days';
        S_NoCaptionLbl: Label 'S No';
        Request_No_CaptionLbl: Label 'Request No.';

    [LineStart(17896)]
    procedure Entercell(RowNo: Integer; ColumnNo: Integer; CellValue: Text[1000]; bold: Boolean; CellType: Option);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.", RowNo);
        TempExcelbuffer.VALIDATE("Column No.", ColumnNo);
        TempExcelbuffer."Cell Value as Text" := CellValue;
        TempExcelbuffer.Bold := bold;
        TempExcelbuffer."Cell Type" := CellType;

        TempExcelbuffer.INSERT;
    end;

    [LineStart(17906)]
    procedure EnterHeadings(RowNo: Integer; ColumnNo: Integer; CellValue: Text[100]; Bold: Boolean; CellType: Option);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.", RowNo);
        TempExcelbuffer.VALIDATE("Column No.", ColumnNo);
        TempExcelbuffer."Cell Value as Text" := FORMAT(CellValue);
        TempExcelbuffer.Bold := Bold;
        TempExcelbuffer."Cell Type" := CellType;

        TempExcelbuffer.Formula := '';
        TempExcelbuffer.INSERT;
    end;

    [LineStart(17917)]
    procedure "Entercell New"();
    begin
    end;
}

