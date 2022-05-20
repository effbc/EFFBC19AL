report 50097 "Returns pending list"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Returns pending list.rdlc';

    dataset
    {
        dataitem("Material Issues Header";"Material Issues Header")
        {
            DataItemTableView = SORTING(Released Date) ORDER(Ascending) WHERE(Status=FILTER(Released));
            RequestFilterFields = "Released Date","Transfer-to Code";
            column(Material_Issues_Header__Proj_Description_;"Proj Description")
            {
            }
            column(Material_Issues_Header__No__;"No.")
            {
            }
            column(Material_Issues_Header__Material_Issues_Header___Transfer_from_Code_;"Material Issues Header"."Transfer-from Code")
            {
            }
            column(Material_Issues_Header__Released_Date_;"Released Date")
            {
            }
            column(username;username)
            {
            }
            column(relesedusername;relesedusername)
            {
            }
            column(pending_Days_;"pending Days")
            {
            }
            column(sno;sno)
            {
            }
            column(Return_Material_Pending_ListCaption;Return_Material_Pending_ListCaptionLbl)
            {
            }
            column(Requisition_No_Caption;Requisition_No_CaptionLbl)
            {
            }
            column(Released_DateCaption;Released_DateCaptionLbl)
            {
            }
            column(Proj_DescriptionCaption;Proj_DescriptionCaptionLbl)
            {
            }
            column(DeptCaption;DeptCaptionLbl)
            {
            }
            column(Pending_DaysCaption;Pending_DaysCaptionLbl)
            {
            }
            column(User_NameCaption;User_NameCaptionLbl)
            {
            }
            column(Released_ByCaption;Released_ByCaptionLbl)
            {
            }
            column(SNO_Caption;SNO_CaptionLbl)
            {
            }

            trigger OnAfterGetRecord();
            begin
                    tot := "Material Issues Header".COUNT;

                //Rev01
                //Material Issues Header, Body (2) - OnPreSection()
                "pending Days":=0;
                IF "Material Issues Header"."Released Date">0D THEN
                "pending Days":=TODAY-"Material Issues Header"."Released Date";

                user.SETRANGE(user."User Name","Material Issues Header"."User ID");
                IF user.FIND('-') THEN
                 username:=user."User Name";
                 user.SETRANGE(user."User Name","Material Issues Header"."Released By");
                 IF user.FIND('-') THEN
                  relesedusername:=user."User Name";
                //Material Issues Header, Body (2) - OnPreSection()
                       sno+=1;
            end;
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

    var
        "pending Days" : Integer;
        tot : Integer;
        sno : Integer;
        username : Text[50];
        user : Record User;
        relesedusername : Text[50];
        Return_Material_Pending_ListCaptionLbl : Label 'Return Material Pending List';
        Requisition_No_CaptionLbl : Label 'Requisition No.';
        Released_DateCaptionLbl : Label 'Released Date';
        Proj_DescriptionCaptionLbl : Label 'Proj.Description';
        DeptCaptionLbl : Label 'Dept';
        Pending_DaysCaptionLbl : Label 'Pending Days';
        User_NameCaptionLbl : Label 'User Name';
        Released_ByCaptionLbl : Label 'Released By';
        SNO_CaptionLbl : Label 'SNO.';
}

