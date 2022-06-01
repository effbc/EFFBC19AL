report 50222 testtt
{
    DefaultLayout = RDLC;
    RDLCLayout = './testtt.rdlc';

    dataset
    {
        dataitem("Production BOM Header"; "Production BOM Header")
        {
            DataItemTableView = WHERE(Status = FILTER(Certified));
            dataitem("Production BOM Line"; "Production BOM Line")
            {
                DataItemLink = Production BOM No.=FIELD(No.);

                trigger OnAfterGetRecord();
                begin
                    IF (("Production BOM Line"."Production BOM No." = 'ECPBPCB00788') AND ("Production BOM Line"."No." = 'ECRESSD00013')) OR
                       (("Production BOM Line"."Production BOM No." = 'ECPBPCB01192') AND ("Production BOM Line"."No." = 'ECRESMF00122')) THEN BEGIN
                    END
                    ELSE BEGIN
                        //"Production BOM Line".VALIDATE("Production BOM Line".Position);
                        //"Production BOM Line".VALIDATE("Production BOM Line"."Position 2");
                        "Production BOM Line".VALIDATE("Production BOM Line"."Position 3");
                        "Production BOM Line".VALIDATE("Production BOM Line"."Position 4");
                    END;
                end;
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

    labels
    {
    }
}

