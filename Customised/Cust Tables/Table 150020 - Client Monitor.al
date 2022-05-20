table 150020 "Client Monitor"
{
    // version DEBUGW13.10.01,Rev01


    fields
    {
        field(1;"Entry No.";Integer)
        {
        }
        field(2;"Function No.";Integer)
        {
        }
        field(3;"Function Name";Text[30])
        {
        }
        field(4;"Table ID";Integer)
        {
        }
        field(5;"Table Name";Text[80])
        {
        }
        field(6;"Search Method";Text[10])
        {
        }
        field(7;"Search Result";Text[10])
        {
        }
        field(8;"Key";Text[200])
        {
        }
        field(9;"Filter";Text[200])
        {
        }
        field(10;"Records Read";Integer)
        {
        }
        field(11;"Record Found";Text[200])
        {
        }
        field(12;"Order";Text[200])
        {
        }
        field(13;"Record";Text[200])
        {
        }
        field(14;"Elapsed Time (ms)";Integer)
        {
        }
        field(15;"Server Time (ms)";Integer)
        {
        }
        field(17;"Sum Intervals";Integer)
        {
        }
        field(18;"Records Deleted";Integer)
        {
        }
        field(19;"Disk Reads";Integer)
        {
        }
        field(20;"Disk Writes";Integer)
        {
        }
        field(21;Wait;Integer)
        {
        }
        field(22;Commit;Integer)
        {
        }
        field(23;Date;Date)
        {
        }
        field(24;Time;Time)
        {
        }
        field(25;"SQL Statement";Text[250])
        {
        }
        field(26;"SQL Status";Text[250])
        {
        }
        field(27;"SQL Plan";Text[250])
        {
        }
        field(28;"SQL Error";Text[250])
        {
        }
        field(29;"Table Size (Current)";Integer)
        {
        }
        field(30;"Connection ID";Integer)
        {
        }
        field(31;"User ID";Code[50])
        {
            Description = 'Rev01';
            TableRelation = User;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(32;Locking;Boolean)
        {
        }
        field(33;SumIndexFields;Text[250])
        {
        }
        field(34;"Sum";Text[100])
        {
        }
        field(35;"Source Object";Text[50])
        {
        }
        field(36;"Source Function/Trigger";Text[132])
        {
        }
        field(37;"Source Text";Text[132])
        {
        }
        field(38;"Source Line No.";Integer)
        {
        }
        field(39;"Problem Description";Text[80])
        {
        }
        field(40;"Login Date";Date)
        {
        }
        field(41;"Login Time";Time)
        {
        }
        field(42;"SQL Index";Text[200])
        {
        }
        field(43;"SQL Index Conflict";Boolean)
        {
        }
        field(50;"Blocking Checked";Boolean)
        {
        }
        field(51;"Check Blocking";Boolean)
        {
        }
        field(60;"Cache Usage Checked";Boolean)
        {
        }
        field(61;"Check Cache Usage";Boolean)
        {
        }
        field(101;"Good Filtered Start of Key";Text[200])
        {
        }
        field(102;"Key Candidate Fields";Text[250])
        {
        }
        field(105;"No. of Fil. Order By Fields";Integer)
        {
        }
        field(106;"Key Remainder";Text[200])
        {
        }
        field(107;"Check Key Usage";Boolean)
        {
        }
        field(108;"Optimistic Read";Boolean)
        {
        }
        field(109;"Transaction No.";Integer)
        {
        }
        field(110;"Potential Deadlocks Checked";Boolean)
        {
        }
        field(111;"Transactions Updated";Boolean)
        {
        }
        field(112;"Locking Rules Checked";Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Login Date","Login Time","Connection ID","Entry No.")
        {
        }
        key(Key2;"Login Date","Login Time","Connection ID","Transaction No.")
        {
        }
        key(Key3;"Login Date","Login Time","Connection ID","Table Name")
        {
        }
        key(Key4;"Login Date","Login Time","Connection ID","Elapsed Time (ms)")
        {
        }
        key(Key5;"Login Date","Login Time","Connection ID","Source Object","Table Name")
        {
        }
        key(Key6;Date,Time)
        {
        }
    }

    fieldgroups
    {
    }

    var
        Session1 : Record Session;

    [LineStart(5864)]
    procedure SetConditionalConnectionFilter();
    var
        ClientMonitor : Record "Client Monitor";
    begin
        ClientMonitor.SetConnectionFilter;
        if ClientMonitor.Find('-') then
          SetConnectionFilter
        else begin
          ClientMonitor.Reset;
          ClientMonitor.SetCurrentKey(Date,Time);
          if ClientMonitor.Find('+') then begin
            SetRange("Login Date",ClientMonitor."Login Date");
            SetRange("Login Time",ClientMonitor."Login Time");
            SetRange("Connection ID",ClientMonitor."Connection ID");
          end;
        end;
    end;

    [LineStart(5878)]
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

