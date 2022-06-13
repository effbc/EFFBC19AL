pageextension 70089 ItemVariantsExt extends 5401
{
    // version NAVW17.00

    layout
    {



        /*  modify("Control1")
          {



              ShowCaption = false;
          }*/



        addafter(Make)//control 2
        {
            field("Operating Temperature"; Rec."Operating Temperature")
            {
            }
            field("Storage Temperature"; Rec."Storage Temperature")
            {
            }
        }
        addafter("Control 4")
        {
            field(Package; Rec.Package)
            {
            }
            field(Priority; Rec.Priority)
            {
            }
        }
        addafter(Description)
        {
            field("Item Status"; Rec."Item Status")
            {
            }
        }
    }
    actions
    {



    }
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        /*{
              IF UPPERCASE(USERID) IN ['EFFTRONICS\PARVATHI', 'EFFTRONICS\VIJAYA', 'SUPER', 'EFFTRONICS\ANUSHAG', 'EFFTRONICS\RAMALAKSHMI', 'EFFTRONICS\KARUNA', 'EFFTRONICS\NAGAGAYATRI', 'EFFTRONICS\SUPRIYA'] THEN
         CurrPage.EDITABLE := TRUE
     ELSE
         CurrPage.EDITABLE := FALSE;
              }*/

        //added by Vishnu Priya on 10-08-2019
        IF NOT (SMTP_MAIL.Permission_Checking(USERID, 'ITEM-VARIENT-RIGHTS'))
          THEN
            CurrPage.EDITABLE := FALSE
        ELSE
            CurrPage.EDITABLE := TRUE;
        //end by Vishnu Priya on 10-08-2019
    end;

    var
        SMTP_MAIL: Codeunit "SMTP Mail";



}

