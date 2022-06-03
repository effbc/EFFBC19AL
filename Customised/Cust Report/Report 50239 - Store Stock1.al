report 50239 "Store Stock1"
{
    // version EFFUPG

    DefaultLayout = RDLC;
    RDLCLayout = './Store Stock1.rdlc';

    dataset
    {
        dataitem(Item; Item)
        {
            CalcFields = Qty. on Purch. Order, Quantity Under Inspection, Stock At MCH Location;
            DataItemTableView = SORTING(No.) ORDER(Descending) WHERE(Product Group Code=FILTER(<>FPRODUCT&<>CPCB));
            RequestFilterFields = "No.";
            column(Item__No__;"No.")
            {
            }
            dataitem("Item Ledger Entry";"Item Ledger Entry")
            {
                DataItemLink = Item No.=FIELD(No.);
                DataItemTableView = SORTING(Item No.,Lot No.,Serial No.) ORDER(Ascending) WHERE(Location Code=FILTER('R&D STR'|STR|CS STR|PRODSTR|MCH));

                trigger OnAfterGetRecord();
                begin
                      IF Test=FALSE THEN
                        Qty+="Item Ledger Entry".Quantity
                      ELSE
                        Qty+="Item Ledger Entry"."Remaining Quantity";
                end;

                trigger OnPostDataItem();
                begin
                      TempInvBuffer.RESET;
                      TempInvBuffer.SETFILTER(TempInvBuffer."Location Code",'STR');
                      TempInvBuffer.SETFILTER(TempInvBuffer.Quantity,'<>%1',0);
                      IF TempInvBuffer.FINDFIRST THEN
                      REPEAT
                        Total1:=0;
                        ILE.RESET;
                        ILE.SETRANGE(ILE."Item No.",TempInvBuffer."Item No.");
                        //ILE.SETRANGE(ILE."Serial No.",TempInvBuffer."Serial No.");
                        ILE.SETRANGE(ILE."Lot No.",TempInvBuffer."Lot No.");
                        ILE.SETFILTER(ILE."Document Type",'Purchase Receipt');
                        IF ILE.FIND('-') THEN
                        BEGIN
                          PIL.RESET;
                          PIL.SETCURRENTKEY(PIL."Receipt Document No.",PIL."No.");
                          PIL.SETFILTER(PIL."Receipt No.",ILE."Document No.");
                          PIL.SETFILTER(PIL."No.",ILE."Item No.");
                          IF PIL.FIND('-') THEN
                          BEGIN
                            PIH.RESET;
                            PIH.SETFILTER(PIH."No.",PIL."Document No.");
                            IF PIH.FINDFIRST THEN
                            BEGIN
                              IF PIH."Currency Code"='' THEN
                              BEGIN
                                UC :=PIL."Amount To Vendor"/PIL.Quantity;
                                Total1 += TempInvBuffer.Quantity*(PIL."Amount To Vendor"/PIL.Quantity);
                                Temp:=1;
                              END ELSE
                              BEGIN
                                SOD.RESET;
                                SOD.SETFILTER(SOD.Type,'Purchase');
                                SOD.SETFILTER(SOD."Document Type",'Invoice');
                                SOD.SETFILTER(SOD."Document No.",PIL."Document No.");
                                SOD.SETFILTER(SOD."Line No.",'%1',PIL."Line No.");
                                IF SOD.FINDFIRST THEN
                                REPEAT
                                  IF SOD."Tax/Charge Type"=SOD."Tax/Charge Type"::GST THEN
                                    Structure_Amount+=SOD."Calculation Value"
                                  ELSE
                                    Structure_Amount+=SOD."Amount (LCY)";
                                UNTIL SOD.NEXT=0;
                                UC:=(PIL."Unit Cost (LCY)")+(Structure_Amount/PIL.Quantity);
                                Total1 += TempInvBuffer.Quantity*((PIL."Unit Cost (LCY)")+(Structure_Amount/PIL.Quantity));
                                Temp:=1;
                              END;
                            END;
                          END
                          ELSE
                          BEGIN
                            PRH.RESET;
                            PRH.SETFILTER(PRH."No.",ILE."Document No.");
                            IF PRH.FIND('-') THEN
                            BEGIN
                              "Purchase line".RESET;
                              "Purchase line".SETFILTER("Purchase line"."Document No.",PRH."Order No.");
                              "Purchase line".SETFILTER("Purchase line"."No.",ILE."Item No.");
                              IF "Purchase line".FIND('-') THEN
                              BEGIN
                                UC:="Purchase line"."Unit Cost (LCY)";
                                Total1 += TempInvBuffer.Quantity*("Purchase line"."Unit Cost (LCY)");
                                Temp:=1;
                              END;
                            END;
                          END;
                        END;
                        IF Temp=0 THEN
                        BEGIN
                          UC:= Item."Avg Unit Cost";
                          Total1 += TempInvBuffer.Quantity*Item."Avg Unit Cost";
                        END;
                        IF excel THEN
                        BEGIN
                          Row+=1;
                          Entercell(Row,1,TempInvBuffer."Item No.",FALSE);
                          Entercell(Row,2,Item.Description,FALSE);
                          Entercell(Row,3,TempInvBuffer."Serial No.",FALSE);
                          Entercell(Row,4,TempInvBuffer."Lot No.",FALSE);
                          Entercell(Row,5,FORMAT(TempInvBuffer.Quantity),FALSE);
                          Entercell(Row,6,FORMAT(UC),FALSE);
                          Entercell(Row,7,FORMAT(Total1),FALSE);
                        END;
                      UNTIL TempInvBuffer.NEXT=0;
                end;

                trigger OnPreDataItem();
                begin
                      TempInvBuffer.DELETEALL;
                      IF ToDate< TODAY THEN
                        "Item Ledger Entry".SETFILTER("Item Ledger Entry"."Posting Date",'<=%1',ToDate)
                      ELSE
                      BEGIN
                        "Item Ledger Entry".SETFILTER("Item Ledger Entry"."Remaining Quantity",'>%1',0);
                        Test:=TRUE;
                      END;
                      //"Item Ledger Entry".SETFILTER("Item Ledger Entry"."Serial No.",'<>%1','*(*');
                end;
            }

            trigger OnPreDataItem();
            begin
                  Row:=1;
                  IF excel THEN
                  BEGIN
                    EnterHeadings(1,1,'Item No.',TRUE);
                    EnterHeadings(1,2,'Description',TRUE);
                    EnterHeadings(1,3,'Serial No',TRUE);
                    EnterHeadings(1,4,'Lot No',TRUE);
                    EnterHeadings(1,5,'Quantity',TRUE);
                    EnterHeadings(1,6,'Unit Cost',TRUE);
                    EnterHeadings(1,7,'Total Cost',TRUE);
                  END;
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

    trigger OnInitReport();
    begin
        ToDate:=TODAY;
        Test:=FALSE;
    end;

    trigger OnPostReport();
    begin
        IF excel THEN
        BEGIN
          TempExcelbuffer.CreateBook('','');//B2B //EFFUPG
          //TempExcelbuffer.CreateSheet('Stock','',COMPANYNAME,'');//B2B
          TempExcelbuffer.GiveUserControl;
        END;
    end;

    trigger OnPreReport();
    begin
           excel:=TRUE;
           IF excel THEN
           BEGIN
             CLEAR(TempExcelbuffer);
             TempExcelbuffer.DELETEALL;
           END;
    end;

    var
        TempInvBuffer : Record "Inventory Buffer" temporary;
        "Lot No" : Code[20];
        "Serial No" : Code[20];
        ItemNo : Code[20];
        Quantity : Decimal;
        ILE : Record "Item Ledger Entry";
        PIH : Record "Purch. Inv. Header";
        PIL : Record "Purch. Inv. Line";
        PRH : Record "Purch. Rcpt. Header";
        SOD : Record "Structure Order Line Details";
        Structure_Amount : Decimal;
        Temp : Integer;
        Total1 : Decimal;
        "Purchase line" : Record "Purchase Line";
        excel : Boolean;
        TempExcelbuffer : Record "Excel Buffer";
        Row : Integer;
        UC : Decimal;
        ToDate : Date;
        Test : Boolean;
        Qty : Decimal;

    [LineStart(11315)]
    procedure Entercell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[1000];bold : Boolean);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.",RowNo);
        TempExcelbuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelbuffer."Cell Value as Text" := CellValue;
        TempExcelbuffer.Bold:=bold ;

        TempExcelbuffer.INSERT;
    end;

    [LineStart(11324)]
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

