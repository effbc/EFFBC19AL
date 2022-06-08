report 50117 "Semi-finished goods details"
{
    // version EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './Semi-finished goods details.rdlc';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            RequestFilterFields = "No.";
            column(heading; heading)
            {
            }
            column(s1; s1)
            {
            }
            column(s2; s2)
            {
            }
            column(Order_NoCaption; Order_NoCaptionLbl)
            {
            }
            column(Order_ValueCaption; Order_ValueCaptionLbl)
            {
            }
            column(AmountCaption; AmountCaptionLbl)
            {
            }
            column(Customer_NameCaption; Customer_NameCaptionLbl)
            {
            }
            column(Name_of_The_ItemsCaption; Name_of_The_ItemsCaptionLbl)
            {
            }
            column(TotalsCaption; TotalsCaptionLbl)
            {
            }
            column(Sales_Header_Document_Type; "Document Type")
            {
            }
            column(Sales_Header_No_; "No.")
            {
            }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document Type, Document No., Line No.) ORDER(Ascending);
                column(Sales_Line__Sales_Line___Document_No__; "Sales Line"."Document No.")
                {
                }
                column(ROUND_TEMP_1_; ROUND(TEMP, 1))
                {
                }
                column(ROUND__TEMP_0_85__1_; ROUND((TEMP * 0.85), 1))
                {
                }
                column(Sales_Header___Sell_to_Customer_Name_; "Sales Header"."Sell-to Customer Name")
                {
                }
                column(caption1; caption1)
                {
                }
                column(Sales_Line_Document_Type; "Document Type")
                {
                }
                column(Sales_Line_Line_No_; "Line No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    count1 := 0;
                    //cap:='';
                    PO.SETRANGE(PO."Sales Order No.", "Sales Header"."No.");
                    PO.SETRANGE(PO."Source No.", "Sales Line"."No.");
                    PO.SETFILTER(PO.Status, 'Released');
                    IF (finish <> TRUE) AND (semi <> TRUE) THEN
                        ERROR('You need to select one of the Check Boxes');
                    IF finish = TRUE THEN
                        PO.SETFILTER(PO."Production Order Status", 'Ready For Dispatch');
                    IF semi = TRUE THEN
                        PO.SETFILTER(PO."Production Order Status", 'Inprogress|Ready For RDSO');
                    IF PO.FIND('-') THEN
                        detail();
                    IF TEMP = 0 THEN
                        CurrReport.SKIP;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                TEMP := 0;
                cap := '';
                cap1 := '';
                cap2 := '';
            end;

            trigger OnPreDataItem();
            begin
                //  "Sales Header".SETFILTER("Sales Header"."No.",'EFF/SAL/08-09/*');
                //Amount:=0;
                TempExcelBuffer.DELETEALL;
                CLEAR(TempExcelBuffer);
                row := 0;
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
                                               //TempExcelBuffer.CreateSheet('test excel','',COMPANYNAME,'');//B2B
            TempExcelBuffer.GiveUserControl;
        END
    end;

    var
        amt: Decimal;
        itemno: Code[30];
        count1: Integer;
        PO: Record "Production Order";
        count2: Integer;
        TEMP: Decimal;
        cap: Text[20];
        cap1: Text[20];
        cap2: Text[20];
        caption1: Text[100];
        cap3: Text[30];
        cap4: Text[30];
        cap5: Text[30];
        cap6: Text[30];
        cap7: Text[30];
        cap8: Text[30];
        cap9: Text[30];
        cap10: Text[30];
        cap11: Text[30];
        cap12: Text[30];
        cap13: Text[30];
        cap14: Text[30];
        semi: Boolean;
        finish: Boolean;
        TempExcelBuffer: Record "Excel Buffer" temporary;
        row: Integer;
        Excel: Boolean;
        heading: Text[50];
        s1: Decimal;
        s2: Decimal;
        Order_NoCaptionLbl: Label 'Order No';
        Order_ValueCaptionLbl: Label 'Order Value';
        AmountCaptionLbl: Label 'Amount';
        Customer_NameCaptionLbl: Label 'Customer Name';
        Name_of_The_ItemsCaptionLbl: Label 'Name of The Items';
        TotalsCaptionLbl: Label 'Totals';

    (6962)]
    procedure detail();
    begin
        REPEAT
            IF (PO."Item Sub Group Code" = 'DL') OR (PO."Item Sub Group Code" = 'MFEP') OR (PO."Item Sub Group Code" = 'TLC') THEN BEGIN
                count1 := count1 + PO.Quantity;
                IF PO."Item Sub Group Code" = 'DL' THEN
                    cap := 'DATALOGGER,';
                IF PO."Item Sub Group Code" = 'MFEP' THEN
                    cap1 := 'MFEP,';
                IF PO."Item Sub Group Code" = 'TLC' THEN
                    cap2 := 'TLC PROCESSING UNIT,';
                IF PO."Item Sub Group Code" = 'DB' THEN
                    cap3 := 'DISPLAY BAORDS,';
                IF PO."Item Sub Group Code" = 'ERTU' THEN
                    cap4 := 'EURO RTU,';
                IF PO."Item Sub Group Code" = 'FEP' THEN
                    cap5 := 'FEP,';
                IF PO."Item Sub Group Code" = 'IDLC' THEN
                    cap6 := 'IDLC,';
                IF PO."Item Sub Group Code" = 'PML' THEN
                    cap7 := 'POINT MACHINE,';
                IF PO."Item Sub Group Code" = 'RLY.SIG LAMP' THEN
                    cap8 := 'RLY.SIG LAMP,';
                IF PO."Item Sub Group Code" = 'RTU' THEN
                    cap9 := 'REMOTE TERMINAL UNIT,';
                IF PO."Item Sub Group Code" = 'SIM' THEN
                    cap10 := 'SIMULATION,';
                IF PO."Item Sub Group Code" = 'SPARES' THEN
                    cap11 := 'SPARES,';
                IF PO."Item Sub Group Code" = 'SSI' THEN
                    cap12 := 'SOLID STATE INTERLOCKING,';
                IF PO."Item Sub Group Code" = 'UPG,' THEN
                    cap13 := 'UPGRDATIONS ';
                IF PO."Item Sub Group Code" = 'USFD,' THEN
                    cap14 := 'USFD DL,';
                caption1 := cap + cap1 + cap2 + cap3 + cap4 + cap5 + cap6 + cap7 + cap8 + cap9 + cap10 + cap11 + cap12 + cap13 + cap14;
            END;
        UNTIL (PO.NEXT = 0);
        //amt+=(count1*"Sales Line"."Unit Price");  //need to gather bed from excise posting setup
        //TEMP:=TEMP+((count1*"Sales Line"."Unit Price")+((count1*"Sales Line"."Unit Price")*("Sales Line"."BED %"/100)));
        s1 := s1 + TEMP;
        IF semi = TRUE THEN
            s2 := s2 + (TEMP * 0.7)
        ELSE
            s2 := s2 + (TEMP * 0.85);
    end;

    (7008)]
    procedure EnterCell(RowNo: Integer; ColumnNo: Integer; CellValue: Text[250]; Bold: Boolean);
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.", RowNo);
        TempExcelBuffer.VALIDATE("Column No.", ColumnNo);
        TempExcelBuffer."Cell Value as Text" := CellValue;
        TempExcelBuffer.Bold := Bold;
        TempExcelBuffer.INSERT;
    end;

    (7016)]
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

