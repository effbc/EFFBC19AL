xmlport 80217 "location ECC Numbers"
{
    Format = VariableText;

    schema
    {
        textelement(Locations)
        {
            tableelement(Location; Location)
            {
                XmlName = 'Location';
                fieldelement(Code; Location.Code)
                {
                }
                fieldelement(ECCNo; Location."E.C.C. No.")
                {
                }
            }
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
}

