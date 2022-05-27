tableextension 70122 StopExt extends Stop
{
    fields
    {
        field(60001; Department; Code[10])
        {
            //TableRelation = Location WHERE("Use As In-Transit" = CONST(false),"Subcontracting Location" = CONST(false));
        }
    }
}

