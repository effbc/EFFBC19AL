table 33000920 "CS Transaction Line"
{

    fields
    {
        field(1;"Transaction ID";Code[20])
        {
        }
        field(2;"Line No.";Integer)
        {
        }
        field(3;"Item No.";Code[20])
        {
            TableRelation = Item;

            trigger OnValidate();
            var
                Item : Record Item;
            begin
                checkStatus;
                if "Item No."<>'' then
                begin
                  ItemGRec.Reset;
                  ItemGRec.SetFilter(ItemGRec."No.","Item No.");
                  if ItemGRec.FindFirst then
                  begin
                //    Item.TESTFIELD(Blocked,FALSE);    //Added by Pranavi on 02-Jan-2016 for not allowing blocked items to pick
                    Description:=ItemGRec.Description;
                    UOM:= ItemGRec."Base Unit of Measure";
                    cardCalc.Cards_Calc(ItemGRec."No.",Status::Working);
                  end;
                end
                else
                begin
                  Description:='';
                  UOM:='';
                end;
            end;
        }
        field(4;Description;Code[100])
        {
        }
        field(5;Quantity;Decimal)
        {
        }
        field(6;UOM;Code[20])
        {
        }
        field(7;Status;Option)
        {
            OptionCaption = ',Working,Non Working';
            OptionMembers = ,Working,"Non Working";
        }
        field(8;Reason;Code[20])
        {
            TableRelation = "Reason Code";
        }
        field(9;Station;Code[20])
        {
            TableRelation = Station;
        }
        field(12;"Order No";Code[20])
        {
            TableRelation = "Sales Header" WHERE ("Document Type"=FILTER(Order),
                                                  "Document Type"=FILTER(Amc));
        }
        field(13;NonReturnable;Boolean)
        {
        }
        field(14;"Qty to be Receive";Decimal)
        {

            trigger OnValidate();
            begin
                Skip_Status:=10;
            end;
        }
        field(15;"Qty Received";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Transaction ID","Line No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
          checkStatus;
    end;

    trigger OnInsert();
    var
        CsTransLine : Record "CS Transaction Line";
    begin
         checkStatus;
         if CsTransHeader.Get("Transaction ID") then
         begin
           CsTransactionLine.Reset;
           CsTransactionLine.SetFilter("Transaction ID",CsTransHeader."Transaction ID");
           if CsTransactionLine.FindLast then
            "Line No." := CsTransactionLine."Line No." + 10000
          else
          "Line No." := 10000;
         end;
    end;

    trigger OnModify();
    begin
          checkStatus;
    end;

    trigger OnRename();
    begin
          checkStatus;
    end;

    var
        CsTransHeader : Record "CS Transaction Header";
        CsTransactionLine : Record "CS Transaction Line";
        cardCalc : Page "CS Transaction Card";
        Status : Option Working,"Non Working";
        ItemGRec : Record Item;
        Skip_Status : Decimal;

    [LineStart(8564)]
    procedure checkStatus();
    begin
        if not (UpperCase(UserId) in ['EFFTRONICS\SUJANI','EFFTRONICS\VISHNUPRIYA']) then
        begin
          if CsTransHeader.Get("Transaction ID") then
          begin
            if (CsTransHeader.Status<>CsTransHeader.Status::Open) and (CsTransHeader."Transaction Status"<>CsTransHeader."Transaction Status"::"In-Transit") then
            begin
           //   IF (Rec."Item No."<>xRec."Item No.") OR (Rec.Quantity<>xRec.Quantity) OR (Rec.Status<>xRec.Status) OR (xRec.Reason<>Rec.Reason)
            //    OR (xRec.Station<>Rec.Station) OR (xRec."Order No"<>Rec."Order No")  THEN
              Error('Transaction must be in Open state to modify');
            end;
          end;
        end;
    end;
}

