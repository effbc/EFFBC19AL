table 33000901 "Production Order Shortage Item"
{
    LookupPageID = "Production Order Shortage Item";

    fields
    {
        field(1;"Production Order";Code[20])
        {
            TableRelation = "Production Order"."No." WHERE (Status=CONST(Released));
        }
        field(2;Item;Code[30])
        {
            TableRelation = Item;

            trigger OnValidate();
            begin
                if Item = 'BOICHAR00036' then
                  Message('test');
            end;
        }
        field(3;Shortage;Decimal)
        {

            trigger OnValidate();
            begin
                if Item = 'BOICHAR00036' then
                  Message('test');
            end;
        }
        field(4;Description;Text[50])
        {
        }
        field(5;"Qty. in Purchase Orders";Decimal)
        {
            CalcFormula = Sum("Purchase Line"."Qty. to Receive" WHERE ("Document Type"=CONST(Order),
                                                                       "Location Code"=CONST('STR'),
                                                                       "Qty. to Receive"=FILTER(>0),
                                                                       "No."=FIELD(Item)));
            FieldClass = FlowField;
        }
        field(6;"Qty. Under Inspection";Decimal)
        {
            CalcFormula = Sum("Quality Item Ledger Entry"."Remaining Quantity" WHERE ("Inspection Status"=CONST("Under Inspection"),
                                                                                      "Sent for Rework"=CONST(false),
                                                                                      "Location Code"=CONST('STR'),
                                                                                      "Remaining Quantity"=FILTER(>0),
                                                                                      Accept=CONST(true),
                                                                                      "Item No."=FIELD(Item)));
            FieldClass = FlowField;
        }
        field(7;"Earliest Material Arrival Date";Date)
        {
            CalcFormula = Min("Purchase Line"."Deviated Receipt Date" WHERE ("Document Type"=CONST(Order),
                                                                             "No."=FIELD(Item),
                                                                             "Location Code"=CONST('STR'),
                                                                             "Outstanding Quantity"=FILTER(>0)));
            FieldClass = FlowField;
        }
        field(8;"Shortage At";Code[10])
        {
        }
        field(9;"Prod. Order Line";Integer)
        {
        }
        field(10;CreateReq_STR;Boolean)
        {
        }
        field(11;CreateReq_CS;Boolean)
        {
        }
        field(12;CreateReq_RD;Boolean)
        {
        }
        field(13;CreateReq_MCH;Boolean)
        {
        }
        field(14;Req_created;Boolean)
        {
        }
        field(15;Remarks;Text[100])
        {
        }
        field(16;"Total Shortage";Decimal)
        {
        }
        field(17;"Prod. Start Date";Date)
        {
        }
        field(18;"Lead Time";DateFormula)
        {
            CalcFormula = Lookup(Item."Safety Lead Time" WHERE ("No."=FIELD(Item)));
            FieldClass = FlowField;
        }
        field(19;"Total Shortage Inc Purch Qty";Decimal)
        {
        }
        field(20;"Alt Item Qty. in Purch Orders";Decimal)
        {
        }
        field(21;"Earliest Material Arrival Qty";Decimal)
        {
            CalcFormula = Sum("Purchase Line"."Qty. to Receive" WHERE ("Document Type"=CONST(Order),
                                                                       "No."=FIELD(Item),
                                                                       "Location Code"=CONST('STR'),
                                                                       "Qty. to Receive"=FILTER(>0),
                                                                       "Deviated Receipt Date"=FIELD("Earliest Material Arrival Date")));
            FieldClass = FlowField;
        }
        field(22;"Earliest Material Shortage Dat";Date)
        {
        }
        field(23;"Earliest Material Shortage Qty";Decimal)
        {
        }
        field(24;"Alt Item Qty. at STR";Decimal)
        {
        }
        field(25;"Alt Item Qty. at MCH";Decimal)
        {
        }
        field(26;"Alt Item PO No";Text[100])
        {
        }
        field(27;"Alt Item Vendor No";Text[50])
        {
        }
    }

    keys
    {
        key(Key1;"Production Order",Item,"Shortage At")
        {
        }
        key(Key2;Item,"Shortage At")
        {
        }
        key(Key3;"Prod. Start Date")
        {
        }
        key(Key4;Item,"Prod. Start Date")
        {
        }
        key(Key5;Item,"Shortage At","Prod. Start Date")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        if Item = 'BOICHAR00036' then
          Message('test');
    end;

    trigger OnModify();
    begin
        if Item = 'BOICHAR00036' then
          Message('test');
    end;
}

