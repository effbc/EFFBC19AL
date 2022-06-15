xmlport 50032 division
{
    Format = VariableText;

    schema
    {
        textelement(Divisions)
        {
            tableelement(Division; Division)
            {
                XmlName = 'Division';
                fieldelement(DivisionCode; Division."Division Code")
                {
                }
                fieldelement(DivisionName; Division."Division Name")
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

