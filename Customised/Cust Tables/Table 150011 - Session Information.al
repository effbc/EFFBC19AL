table 150011 "Session Information"
{
    // version SESSIONW13.10.01,Rev01

    DrillDownPageID = 150013;
    LookupPageID = 150013;

    fields
    {
        field(1;"Connection ID";Integer)
        {
        }
        field(2;"User ID";Code[50])
        {
            Description = 'Rev01';
            TableRelation = User."User Name";
        }
        field(3;"My Session";Boolean)
        {
            CalcFormula = Exist(Session WHERE ("My Session"=CONST(true),
                                               "Connection ID"=FIELD("Connection ID"),
                                               "User ID"=FIELD("User ID"),
                                               "Login Date"=FIELD("Login Date"),
                                               "Login Time"=FIELD("Login Time")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(5;"Login Time";Time)
        {
        }
        field(6;"Login Date";Date)
        {
        }
        field(100;"Cache Reads";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(101;"Disk Reads";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(102;"Disk Writes";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(103;"Records Found";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(104;"Records Scanned";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(105;"Records Inserted";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(106;"Records Deleted";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(107;"Records Modified";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(108;"Sum Intervals";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(109;"Cache Hit Ratio %";Decimal)
        {
            DecimalPlaces = 2:2;
        }
        field(110;"Found/Scanned Ratio %";Decimal)
        {
            DecimalPlaces = 2:2;
        }
        field(200;"Total Cache Reads";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(201;"Total Disk Reads";Decimal)
        {
        }
        field(202;"Total Disk Writes";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(203;"Total Records Found";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(204;"Total Records Scanned";Decimal)
        {
        }
        field(205;"Total Records Inserted";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(206;"Total Records Deleted";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(207;"Total Records Modified";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(208;"Total Sum Intervals";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(50012;username;Text[30])
        {
        }
    }

    keys
    {
        key(Key1;"User ID","Connection ID","Login Date","Login Time")
        {
            SumIndexFields = "Disk Reads","Cache Reads","Disk Writes","Records Found","Records Scanned","Records Inserted","Records Modified","Records Deleted","Sum Intervals";
        }
        key(Key2;"Records Scanned")
        {
        }
        key(Key3;"Disk Reads")
        {
        }
        key(Key4;"Disk Writes")
        {
        }
    }

    fieldgroups
    {
    }

    [LineStart(5853)]
    procedure UpdateRatios();
    begin
        if "Records Scanned" <> 0 then
          "Found/Scanned Ratio %" := Round("Records Found" / "Records Scanned" * 100)
        else
          "Found/Scanned Ratio %" := 100;

        if "Cache Reads" <> 0 then
          "Cache Hit Ratio %" := Round("Cache Reads" / ("Disk Reads" + "Cache Reads") * 100)
        else
          "Cache Hit Ratio %" := 0;
    end;
}

