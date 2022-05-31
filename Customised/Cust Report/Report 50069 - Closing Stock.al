report 50069 "Closing Stock"
{
    // version Rev01

    ProcessingOnly = true;

    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "Inventory Posting Group";

            trigger OnAfterGetRecord();
            begin
                ILE.RESET;
                ILE.SETCURRENTKEY("Posting Date", "Item No.");
                ILE.SETRANGE("Posting Date", FromDate, ToDate);
                ILE.SETRANGE("Item No.", Item."No.");
                ILE.SETRANGE(Open, TRUE);
                IF ILE.FIND('+') THEN BEGIN
                    Sno += 1;
                    Value := ILE."Remaining Quantity" * Item."Last Direct Cost";
                    Sheet.Range('a' + j).Value := Sno;
                    Sheet.Range('b' + j).Value := Item."No.";
                    Sheet.Range('c' + j).Value := Item.Description;
                    Sheet.Range('d' + j).Value := FORMAT(ILE."Remaining Quantity");
                    Sheet.Range('e' + j).Value := FORMAT(Item."Last Direct Cost");
                    Sheet.Range('f' + j).Value := FORMAT(Value);
                    j := INCSTR(j);
                END ELSE
                    CurrReport.SKIP;
            end;

            trigger OnPreDataItem();
            begin
                SETRANGE("Inventory Posting Group", PostingGroup);
                j := '4';
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
        PostingGroup := Item.GETFILTER(Item."Inventory Posting Group");
        IF InventoryPostingGroup.GET(PostingGroup) THEN;
        /*CREATE(Excel);
        Excel.Visible(TRUE);
        Excel.Workbooks.Add();
        Sheet := Excel.ActiveSheet;*///B2B
        Sheet.Name := InventoryPostingGroup.Description;
        Sheet.Range('c2').Value := 'CLOSING STOCK FOR THE PERIOD  ' + FORMAT(FromDate) + ' TO ' + FORMAT(ToDate);
        Sheet.Range('A3').Value := 'SNo';
        Sheet.Range('b3').Value := 'ITEM NO';
        Sheet.Range('c3').Value := 'DESCRIPTION';
        Sheet.Range('d3').Value := 'STOCK';
        Sheet.Range('e3').Value := 'PRICE';
        Sheet.Range('f3').Value := 'VALUE';

    end;

    var
        PostingGroup: Code[10];
        ILE: Record "Item Ledger Entry";
        FromDate: Date;
        ToDate: Date;
        Range: Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Range";
        Sheet: Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        SheetName: Text[30];
        Value: Decimal;
        j: Text[30];
        Sno: Integer;
        InventoryPostingGroup: Record "Inventory Posting Group";

    //event Sheet(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Range");
    //begin
    /*
    */
    //end;

    //event Sheet(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Range";var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event Sheet(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Range";var Cancel : Boolean);
    //begin
    /*
    */
    //end;

    //event Sheet();
    //begin
    /*
    */
    //end;

    //event Sheet();
    //begin
    /*
    */
    //end;

    //event Sheet();
    //begin
    /*
    */
    //end;

    //event Sheet(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Range");
    //begin
    /*
    */
    //end;

    //event Sheet(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Hyperlink");
    //begin
    /*
    */
    //end;

    //event Sheet(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.PivotTable");
    //begin
    /*
    */
    //end;
}

