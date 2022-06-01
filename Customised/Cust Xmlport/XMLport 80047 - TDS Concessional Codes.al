xmlport 80047 "TDS Concessional Codes"
{
    Format = VariableText;

    schema
    {
        textelement(ConcessionalCodes)
        {
            tableelement("<concessionalcode>"; "Concessional Codes")
            {
                XmlName = 'ConcessionalCode';
                fieldelement(Code; "<ConcessionalCode>".Code)
                {
                }
                fieldelement(Description; "<ConcessionalCode>".Description)
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

