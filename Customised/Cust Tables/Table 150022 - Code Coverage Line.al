table 150022 "Code Coverage Line"
{
    // version DEBUGW13.10.01,Rev01


    fields
    {
        field(1;"Object Type";Option)
        {
            OptionMembers = " ","Table",Form,"Report",Dataport,"Codeunit";
        }
        field(2;"Object ID";Integer)
        {
        }
        field(3;"Line No.";Integer)
        {
        }
        field(4;"Line Type";Option)
        {
            OptionMembers = "Object","Function/Trigger",Empty,"Code";
        }
        field(5;Line;Text[131])
        {
        }
        field(6;"No. of Hits";Integer)
        {
        }
        field(50000;"In Use";Boolean)
        {
        }
        field(50001;"Function In Use";Boolean)
        {
        }
        field(50002;"Object In Use";Boolean)
        {
        }
        field(50003;"Object Name";Text[30])
        {
            CalcFormula = Lookup(AllObj."Object Name" WHERE ("Object Type"=FIELD("Object Type"),
                                                             "Object ID"=FIELD("Object ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50004;"Function/Trigger Name";Text[131])
        {
        }
        field(50030;"Connection ID";Integer)
        {
        }
        field(50031;"User ID";Code[50])
        {
            Description = 'Rev01';
            TableRelation = Table2000000002;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(50040;"Login Date";Date)
        {
        }
        field(50041;"Login Time";Time)
        {
        }
    }

    keys
    {
        key(Key1;"Login Date","Login Time","Connection ID","Object Type","Object ID","Line No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        Session1 : Record Session;

    [LineStart(5889)]
    procedure SetConditionalConnectionFilter();
    var
        CodeCoverage : Record "Code Coverage Line";
    begin
        CodeCoverage.SetConnectionFilter;
        if CodeCoverage.Find('-') then
          SetConnectionFilter
        else
          if CodeCoverage.Find('+') then begin
            SetRange("Login Date",CodeCoverage."Login Date");
            SetRange("Login Time",CodeCoverage."Login Time");
            SetRange("Connection ID",CodeCoverage."Connection ID");
          end;
    end;

    [LineStart(5900)]
    procedure SetConnectionFilter();
    var
        ClientMonitor2 : Record "Client Monitor";
    begin
        //Changed Var(Session to Session1) as it was defined more than once)
        //B2B

        if Session1."Connection ID" = 0 then begin
          Session1.SetRange("My Session",true);
          Session1.Find('-');
        end;
        SetRange("Login Date",Session1."Login Date");
        SetRange("Login Time",000000T + Round(Session1."Login Time" - 000000T,1000));
        SetRange("Connection ID",Session1."Connection ID");
    end;
}

