xmlport 50008 "Users B2B"
{
    Format = VariableText;

    schema
    {
        textelement(Users)
        {
            tableelement(User;User)
            {
                XmlName = 'User';
                fieldelement(UserSecurityID;User."User Security ID")
                {
                }
                fieldelement(UserName;User."User Name")
                {
                }
                fieldelement(FullName;User."Full Name")
                {
                }
                fieldelement(WindowsSecurityID;User."Windows Security ID")
                {
                }
                fieldelement(LicType;User."License Type")
                {
                }
                fieldelement(Dept;User.Field60100)
                {
                }
                fieldelement(Mail;User.Field60101)
                {
                }
                fieldelement(Levels;User.Field60102)
                {
                }
                fieldelement(Blocked;User.Field60103)
                {
                }
                fieldelement(Dim;User.Field60104)
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

