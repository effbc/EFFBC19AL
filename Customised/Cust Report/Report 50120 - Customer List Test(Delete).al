report 50120 "Customer List Test(Delete)"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Customer List Test(Delete).rdlc';

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(No_Customer; Customer."No.")
            {
            }
            column(Name_Customer; Customer.Name)
            {
            }
            column(SearchName_Customer; Customer."Search Name")
            {
            }
            column(Name2_Customer; Customer."Name 2")
            {
            }
            column(Address_Customer; Customer.Address)
            {
            }
            column(Address2_Customer; Customer."Address 2")
            {
            }
            column(City_Customer; Customer.City)
            {
            }
            column(Contact_Customer; Customer.Contact)
            {
            }
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Control1102152002)
                {
                    ShowCaption = false;
                    field("Customer.""No."""; Customer."No.")
                    {
                        ShowCaption = false;
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }
}

