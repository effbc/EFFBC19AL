xmlport 50191 Trail
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
                fieldelement(Zonecode; Division."Zone code")
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

