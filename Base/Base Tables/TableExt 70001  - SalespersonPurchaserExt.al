tableextension 70001 SalespersonPurchaserExt extends "Salesperson/Purchaser"
{

    fields
    {





        field(60000; "Salesperson/Purchaser"; Option)
        {
            Description = 'B2B';
            OptionMembers = Sale,Purchase,CS;
        }
        field(60001; PastEmp; Boolean)
        {
        }
        field(60002; "Sales Person Signature"; BLOB)
        {
            DataClassification = ToBeClassified;
            SubType = Bitmap;
        }
    }
    keys
    {

       

        key(Key1; "Search E-Mail")
        {
        }
    }


   
}

