page 50015 "CS Stock Adjustment Card"
{
    PageType = Card;
    SourceTable = "CS Stock Ledger";
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("User ID";"User ID")
                {

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        User.RESET;
                        User.SETRANGE(levels,TRUE);
                        IF PAGE.RUNMODAL(9800,User) = ACTION :: LookupOK THEN
                        BEGIN
                          "User ID" := User."User Name";

                          User.RESET;
                          User.SETRANGE("User Name","User ID");
                          IF User.FINDFIRST THEN
                          BEGIN
                            IF NOT SP.GET(User.EmployeeID) THEN
                              ERROR('You can select Only CS Managers!');
                          END ELSE
                            ERROR('Ther User %1 do not have ERP Login!',"User ID");

                          Location:='';
                          "Item No" := '';
                          Item_Desc:='';
                          Clear_Values;
                        END;
                    end;

                    trigger OnValidate();
                    begin

                        User.RESET;
                        User.SETRANGE("User Name","User ID");
                        IF User.FINDFIRST THEN
                        BEGIN
                          IF NOT SP.GET(User.EmployeeID) THEN
                            ERROR('You can select Only CS Managers!');
                        END ELSE
                          ERROR('Ther User %1 do not have ERP Login!',"User ID");

                        Location:='';
                        "Item No" := '';
                        Item_Desc:='';
                        Clear_Values;
                    end;
                }
                field(Location;Location)
                {

                    trigger OnValidate();
                    begin
                        IF Location <> '' THEN
                          IF "User ID" <> '' THEN
                          BEGIN
                            IF Division.GET(Location) THEN
                            BEGIN
                              User.RESET;
                              User.SETRANGE(EmployeeID,Division."Project Manager");
                              IF User.FINDFIRST THEN
                                IF User."User Name" <> "User ID" THEN
                                  ERROR('Please select your Division code only!');
                            END;
                          END ELSE
                            ERROR('Please Enter User ID First!');

                        "Item No" := '';
                        Item_Desc:='';
                        Clear_Values;
                    end;
                }
                field("Card Status";"Card Status")
                {

                    trigger OnValidate();
                    begin
                        IF ("User ID" <> '') AND (Location <> '') AND ("Item No" <> '') THEN
                          Find_Card;
                    end;
                }
                field("Item No";"Item No")
                {

                    trigger OnValidate();
                    begin
                        IF "User ID" = '' THEN
                          ERROR('Please enter USER ID first!');
                        IF Location = '' THEN
                          ERROR('Please enter Location first!');
                        Clear_Values;
                        IF "Item No" <> '' THEN
                        BEGIN
                          IF Item.GET("Item No") THEN
                            Item_Desc := Item.Description;
                          Find_Card;
                        END ELSE
                        BEGIN
                          Item_Desc:='';
                          Quantity:=0;
                          CC_Qty:=0;
                        END;
                    end;
                }
                field(Item_Desc;Item_Desc)
                {
                    Caption = 'Description';
                    Editable = false;
                }
                field(Wrkng_Cards;Wrkng_Cards)
                {
                    Caption = 'Working Cards';
                    Editable = false;
                }
                field("Non-Wrkng_Cards";"Non-Wrkng_Cards")
                {
                    Caption = 'Non-Working Cards';
                    Editable = false;
                }
                field(Quantity;Quantity)
                {
                    Caption = 'Present_Tot_Cards';
                    Editable = false;
                }
                field(InT_Qty;InT_Qty)
                {
                    Caption = 'In-Transit Cards';
                    Editable = false;
                }
                field(To_Be_Recv_Qty;To_Be_Recv_Qty)
                {
                    Caption = 'To Be Received Cards';
                    Editable = false;
                }
                field(CC_Wrkng_Cards;CC_Wrkng_Cards)
                {
                    Caption = 'Cust Working Cards';
                    Editable = false;
                }
                field("CC_Non-Wrkng_Cards";"CC_Non-Wrkng_Cards")
                {
                    Caption = 'Cust. Non-Working Cards';
                    Editable = false;
                }
                field(CC_Qty;CC_Qty)
                {
                    Caption = 'Cust. Tot Cards';
                    Editable = false;
                }
                field(CC_InT_Qty;CC_InT_Qty)
                {
                    Caption = 'Cust. In-Transit Cards';
                    Editable = false;
                }
                field(CC_To_Be_Recv_Qty;CC_To_Be_Recv_Qty)
                {
                    Caption = 'Cust. To Be Received Cards';
                    Editable = false;
                }
                field(New_Qty;New_Qty)
                {
                    Caption = 'Adjust Quantity';

                    trigger OnValidate();
                    begin
                        IF New_Qty <> 0 THEN
                        BEGIN
                          IF "User ID" = '' THEN
                            ERROR('Please enter USER ID first!');
                          IF Location = '' THEN
                            ERROR('Please enter Location first!');
                          IF "Item No" = '' THEN
                            ERROR('Please enter Item No. first!');
                        END;
                        IF New_Qty < 0 THEN
                        BEGIN
                          IF "Card Status" = "Card Status"::"Non Working" THEN
                          BEGIN
                            IF "Non-Wrkng_Cards"+New_Qty < 0 THEN
                              ERROR('You Can not Remove More than %1',"Non-Wrkng_Cards");
                          END ELSE BEGIN
                            IF Wrkng_Cards+New_Qty < 0 THEN
                              ERROR('You Can not Remove More than %1',Wrkng_Cards);
                          END;
                        END;
                    end;
                }
                field(Remarks;Remarks)
                {
                    Caption = 'Remarks *';

                    trigger OnValidate();
                    begin
                        IF Remarks <> '' THEN
                        BEGIN
                          IF "User ID" = '' THEN
                            ERROR('Please enter USER ID first!');
                          IF Location = '' THEN
                            ERROR('Please enter Location first!');
                          IF "Item No" = '' THEN
                            ERROR('Please enter Item No. first!');
                          IF New_Qty = 0 THEN
                            ERROR('Please enter Adjust Quantity first!');
                        END;
                    end;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Update Stock")
            {
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin

                    IF "User ID" = '' THEN
                      ERROR('Please Enter USER ID!');
                    IF Location = '' THEN
                      ERROR('Please Enter Location!');
                    IF "Item No" = '' THEN
                      ERROR('Please Enter Item No.!');
                    IF New_Qty = 0 THEN
                      ERROR('Please Enter New Adjustable Quantity!');
                    IF Remarks IN['',' '] THEN
                      ERROR('Please Enter Remarks!');

                    CS_Stock_Led.INIT;

                    CSLG_L.RESET;
                    IF CSLG_L.FINDLAST THEN
                      CS_Stock_Led."Entry No.":=CSLG_L."Entry No."+1
                    ELSE
                      CS_Stock_Led."Entry No.":=1;

                    CS_Stock_Led."Posted By":=USERID;
                    CS_Stock_Led."Posting Date":=TODAY;
                    CS_Stock_Led.Received:=TRUE;
                    CS_Stock_Led."Transaction Type":=CS_Stock_Led."Transaction Type"::Open;
                    CS_Stock_Led.Location:=Location;
                    CS_Stock_Led."User ID":=USERID;
                    CS_Stock_Led.Remarks:=Remarks;
                    CS_Stock_Led."Line No.":=10000;
                    CS_Stock_Led."Item No":="Item No";
                    CS_Stock_Led.Quantity:=New_Qty;
                    CS_Stock_Led."Card Status":="Card Status";
                    CS_Stock_Led."Received By":=USERID;
                    CS_Stock_Led."Received Date":=TODAY;
                    CS_Stock_Led."Responsible Persion":="Responsible Persion";
                    CS_Stock_Led.Reason := 'Stock Adjustment';
                    CS_Stock_Led.Stock_Adjusted:=TRUE;
                    CS_Stock_Led.INSERT;

                    MESSAGE('%1 Qty stock adjusted for Item : %2 with Card Status : %3',FORMAT(New_Qty),Item_Desc,FORMAT("Card Status"));
                    Find_Card;
                end;
            }
            action("Process Document")
            {
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    HYPERLINK('\\erpserver\ErpAttachments\CS_Stock_Adjustment_Process.pdf');
                end;
            }
        }
    }

    trigger OnInit();
    begin
        CurrPage.EDITABLE := TRUE;
    end;

    trigger OnOpenPage();
    begin
        CurrPage.EDITABLE := TRUE;
        "User ID" := USERID;
        IF USERID = 'EFFTRONICS\VISHNUPRIYA' THEN
          "User ID" := 'EFFTRONICS\BHASKAR';

        User.RESET;
        User.SETRANGE("User Name","User ID");
        IF ( USERID <> 'EFFTRONICS\VISHNUPRIYA') THEN
        BEGIN
          IF User.FINDFIRST THEN
          BEGIN
            IF  (NOT SP.GET(User.EmployeeID))  THEN
                ERROR('You Do not have rights to open this Page!');
        END ELSE
          ERROR('You do not have ERP Login!');
        END;

        "Card Status":="Card Status"::Working;
        Rec.INSERT;
    end;

    var
        User : Record User;
        Item_Desc : Code[100];
        New_Qty : Decimal;
        Item : Record Item;
        CC_Qty : Decimal;
        Division : Record Division;
        InT_Qty : Decimal;
        To_Be_Recv_Qty : Decimal;
        Wrkng_Cards : Decimal;
        "Non-Wrkng_Cards" : Decimal;
        CC_InT_Qty : Decimal;
        CC_To_Be_Recv_Qty : Decimal;
        CC_Wrkng_Cards : Decimal;
        "CC_Non-Wrkng_Cards" : Decimal;
        CS_Stock_Led : Record "CS Stock Ledger";
        CSLG_L : Record "CS Stock Ledger";
        SP : Record "Salesperson/Purchaser";

    [LineStart(2603)]
    local procedure Find_Card();
    var
        CSLG : Record "CS Stock Ledger";
        CSTH : Record "CS Transaction Header";
    begin
        Quantity:=0;
        InT_Qty:=0;
        To_Be_Recv_Qty:=0;
        "Non-Wrkng_Cards":=0;
        Wrkng_Cards:=0;
        CC_Qty:=0;
        CC_Wrkng_Cards:=0;
        "CC_Non-Wrkng_Cards":=0;
        CC_To_Be_Recv_Qty:=0;
        CC_InT_Qty:=0;
        New_Qty:=0;
        Remarks:='';

        CSLG.RESET;
        CSLG.SETRANGE(CSLG.Location,Location);
        CSLG.SETRANGE(CSLG."Item No","Item No");
        CSLG.SETRANGE(CSLG."Card Status",CSLG."Card Status"::Working);
        CSLG.SETRANGE(CSLG.Received,TRUE);
        CSLG.SETFILTER(CSLG."Transaction Type",'<>%1',CSLG."Transaction Type"::"Custmer card Transfer");
        IF CSLG.FINDSET THEN
        REPEAT
          Wrkng_Cards+=CSLG.Quantity;
        UNTIL CSLG.NEXT=0;

        CSLG.RESET;
        CSLG.SETRANGE(CSLG.Location,Location);
        CSLG.SETRANGE(CSLG."Item No","Item No");
        CSLG.SETRANGE(CSLG."Card Status",CSLG."Card Status"::"Non Working");
        CSLG.SETRANGE(CSLG.Received,TRUE);
        CSLG.SETFILTER(CSLG."Transaction Type",'<>%1',CSLG."Transaction Type"::"Custmer card Transfer");
        IF CSLG.FINDSET THEN
        REPEAT
          "Non-Wrkng_Cards"+=CSLG.Quantity;
        UNTIL CSLG.NEXT=0;

        Quantity:=Wrkng_Cards+"Non-Wrkng_Cards";

        CSLG.RESET;
        CSLG.SETRANGE(CSLG.Location,Location);
        CSLG.SETRANGE(CSLG."Item No","Item No");
        CSLG.SETRANGE(CSLG."Card Status",CSLG."Card Status"::Working);
        CSLG.SETRANGE(CSLG.Received,TRUE);
        CSLG.SETFILTER(CSLG."Transaction Type",'%1',CSLG."Transaction Type"::"Custmer card Transfer");
        IF CSLG.FINDSET THEN
        REPEAT
          CC_Wrkng_Cards+=CSLG.Quantity;
        UNTIL CSLG.NEXT=0;

        IF CC_Wrkng_Cards < 0 THEN
          CC_Wrkng_Cards:=0;

        CSLG.RESET;
        CSLG.SETRANGE(CSLG.Location,Location);
        CSLG.SETRANGE(CSLG."Item No","Item No");
        CSLG.SETRANGE(CSLG."Card Status",CSLG."Card Status"::"Non Working");
        CSLG.SETRANGE(CSLG.Received,TRUE);
        CSLG.SETFILTER(CSLG."Transaction Type",'%1',CSLG."Transaction Type"::"Custmer card Transfer");
        IF CSLG.FINDSET THEN
        REPEAT
          "CC_Non-Wrkng_Cards"+=CSLG.Quantity;
        UNTIL CSLG.NEXT=0;

        IF "CC_Non-Wrkng_Cards" < 0 THEN
          "CC_Non-Wrkng_Cards":=0;

        CSLG.RESET;
        CSLG.SETRANGE(CSLG.Location,Location);
        CSLG.SETRANGE(CSLG."Item No","Item No");
        CSLG.SETRANGE(CSLG.Received,TRUE);
        CSLG.SETFILTER(CSLG."Transaction Type",'%1',CSLG."Transaction Type"::"Custmer card Transfer");
        IF CSLG.FINDSET THEN
        REPEAT
          CC_Qty+=CSLG.Quantity;
        UNTIL CSLG.NEXT=0;

        IF CC_Qty < 0 THEN
          CC_Qty:=0;

        CSLG.RESET;
        CSLG.SETRANGE(CSLG.Location,Location);
        CSLG.SETRANGE(CSLG."Item No","Item No");
        CSLG.SETRANGE(CSLG.Received,FALSE);
        CSLG.SETFILTER(Quantity,'<%1',0);
        CSLG.SETFILTER(CSLG."Transaction Type",'<>%1',CSLG."Transaction Type"::"Custmer card Transfer");
        IF CSLG.FINDSET THEN
        REPEAT
          InT_Qty+=ABS(CSLG.Quantity);
        UNTIL CSLG.NEXT=0;

        CSLG.RESET;
        CSLG.SETRANGE(CSLG.Location,Location);
        CSLG.SETRANGE(CSLG."Item No","Item No");
        CSLG.SETRANGE(CSLG.Received,FALSE);
        CSLG.SETFILTER(Quantity,'>%1',0);
        CSLG.SETFILTER(CSLG."Transaction Type",'<>%1',CSLG."Transaction Type"::"Custmer card Transfer");
        IF CSLG.FINDSET THEN
        REPEAT
          To_Be_Recv_Qty+=CSLG.Quantity;
        UNTIL CSLG.NEXT=0;

        CSLG.RESET;
        CSLG.SETRANGE(CSLG.Location,Location);
        CSLG.SETRANGE(CSLG."Item No","Item No");
        CSLG.SETRANGE(CSLG.Received,FALSE);
        CSLG.SETFILTER(Quantity,'<%1',0);
        CSLG.SETFILTER(CSLG."Transaction Type",'%1',CSLG."Transaction Type"::"Custmer card Transfer");
        IF CSLG.FINDSET THEN
        REPEAT
          CC_InT_Qty+=ABS(CSLG.Quantity);
        UNTIL CSLG.NEXT=0;

        CSLG.RESET;
        CSLG.SETRANGE(CSLG.Location,Location);
        CSLG.SETRANGE(CSLG."Item No","Item No");
        CSLG.SETRANGE(CSLG.Received,FALSE);
        CSLG.SETFILTER(Quantity,'>%1',0);
        CSLG.SETFILTER(CSLG."Transaction Type",'%1',CSLG."Transaction Type"::"Custmer card Transfer");
        IF CSLG.FINDSET THEN
        REPEAT
          CC_To_Be_Recv_Qty+=CSLG.Quantity;
        UNTIL CSLG.NEXT=0;
    end;

    [LineStart(2726)]
    local procedure Clear_Values();
    begin
        Quantity:=0;
        InT_Qty:=0;
        To_Be_Recv_Qty:=0;
        "Non-Wrkng_Cards":=0;
        Wrkng_Cards:=0;
        CC_Qty:=0;
        CC_Wrkng_Cards:=0;
        "CC_Non-Wrkng_Cards":=0;
        CC_To_Be_Recv_Qty:=0;
        CC_InT_Qty:=0;
        New_Qty:=0;
        Remarks:='';
    end;
}

