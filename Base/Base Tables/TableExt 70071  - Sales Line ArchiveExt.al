tableextension 70071 SalesLineArchiveExt extends "Sales Line Archive"
{
    fields
    {
        field(60012; "Schedule Type"; Enum ScheduleType)
        {
            Description = 'B2B';

        }
        field(60020; "Material Reuired Date"; Date)
        {
        }
        field(60024; "CL_CNSGN  rcvd Qty"; Integer)
        {
            Description = 'added  by sujani for renucha mam';
        }
        field(60025; "CL_CNSGN  rcvd Date1"; Date)
        {
        }
        field(60090; "Dimension Corrected"; Boolean)
        {
            Description = 'added  by sujani for Dimension issue clearance (B2B Assistance)';
            Editable = false;
        }
        field(60091; "OLD Dim Set ID"; Integer)
        {
            Description = 'added  by sujani for Dimension issue clearance (B2B Assistance)';
            Editable = false;
            TableRelation = "Dimension Set Entry Backup2"."Dimension Set ID" WHERE("Dimension Set ID" = FIELD("OLD Dim Set ID"));

            trigger OnLookup();
            begin
                //ShowDimensionsOLD;
            end;
        }
        field(60110; "Supply Portion"; Decimal)
        {
        }
        field(60111; "Retention Portion"; Decimal)
        {
        }
        field(60114; "Unitcost(LOA)"; Decimal)
        {
        }
        field(60118; MainCategory; Enum MainCategory)
        {
            Description = 'added by sujani on 2-11-2018 for analysis purpose';

        }
        field(60119; SubCategory; Enum SubCategory)
        {
            Description = 'added by sujani on 2-11-2018 for analysis purpose';
        }
        field(60120; Reason; Text[100])
        {
            Description = 'added by sujani on 2-11-2018 for analysis purpose';
        }
        field(60121; Remarks; Text[100])
        {
            Description = 'added by sujani on 2-11-2018 for analysis purpose';
        }
        field(60122; ProductGroup; Code[20])
        {
            Description = 'added by sujani on 2-11-2018 for analysis purpose';
        }
        field(60123; Main_CATEGORY; Enum MainCATEGORY1)
        {

        }
        field(60124; "Call Letter Status"; Enum CallLetterStatus)
        {
            Description = 'added by sujani on 30-11-2018 for pending orders analysis purpose';

        }
        field(60125; "RDSO Number"; Code[15])
        {
            Description = 'added by sujani on 30-11-2018 for pending orders analysis purpose';
        }
        field(60126; Vertical; Enum Vertical)
        {
            Description = 'added by sujani on 30-11-2018 for pending orders analysis purpose';
        }
        field(60127; "Deviated Dispatch Date"; DateTime)
        {
            Description = 'added by sujani on 30-11-2018 for pending orders analysis purpose';
        }
        field(60128; "Dispatch Date"; DateTime)
        {
            Description = 'added by sujani on 30-11-2018 for pending orders analysis purpose';
        }
        field(60131; "Tentative RDSO Date"; Date)
        {
            Description = 'Added by Vishnu Priya on 14-12-2018';
        }
    }

}

