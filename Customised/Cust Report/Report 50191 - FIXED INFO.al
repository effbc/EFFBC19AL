report 50191 "FIXED INFO"
{
    // version DIM1.0

    // Project : EFFTRONICS
    // *************************************************************************************************************************
    // SIGN Name
    // ************************************************************************************************************************
    // DIM : Resolution of Dimension Issues after Upgarding.
    // ***********************************************************************************************************************
    // Version  sign     Date       USERID    Description
    // *************************************************************************************************************************
    // 1.0      DIM      28-May-13  SAIRAM    New Code has been added for the dimensions updation after upgarding.
    DefaultLayout = RDLC;
    RDLCLayout = './FIXED INFO.rdlc';


    dataset
    {
        dataitem("Purchase Header";"Purchase Header")
        {
            RequestFilterFields = "Posting Date";
            column(Purchase_Header_Document_Type;"Document Type")
            {
            }
            column(Purchase_Header_No_;"No.")
            {
            }
            dataitem("Purchase Line";"Purchase Line")
            {
                DataItemLink = Document Type=FIELD(Document Type),Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document Type,Document No.,Line No.) ORDER(Ascending) WHERE(Type=CONST(Fixed Asset));
                column(Purchase_Line__No__;"No.")
                {
                }
                column(EMPNAME;EMPNAME)
                {
                }
                column(Purchase_Header___No__;"Purchase Header"."No.")
                {
                }
                column(Purchase_Header___Posting_Date_;"Purchase Header"."Posting Date")
                {
                }
                column(Purchase_Line__Purchase_Line___Line_No__;"Purchase Line"."Line No.")
                {
                }
                column(Purchase_Line_Document_Type;"Document Type")
                {
                }
                column(Purchase_Line_Document_No_;"Document No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    //DIM1.0 Start
                    //Code commented
                    /*
                    EMPNAME:='';
                    dd.SETFILTER(dd."Document Type",'ORDER');
                    dd.SETRANGE(dd."Document No.","Purchase Header"."No.");
                    dd.SETRANGE(dd."Line No.","Purchase Line"."Line No.");
                    IF dd.FIND('-') THEN
                    REPEAT
                    IF dd."Dimension Code"='EMPLOYEE CODES' THEN
                    BEGIN
                    USER.SETRANGE(USER."User Security ID",dd."Dimension Value Code");
                    IF USER.FIND('-') THEN
                    BEGIN
                    EMPNAME:=USER."User Name";
                    END;
                    END;
                    UNTIL dd.NEXT=0;
                    */
                    EMPNAME:='';
                    DimSetEntryGRec.RESET;
                    DimSetEntryGRec.SETRANGE("Dimension Set ID","Dimension Set ID");
                    IF DimSetEntryGRec.FINDSET THEN
                      REPEAT
                        IF DimSetEntryGRec."Dimension Code" = 'EMPLOYEE CODES' THEN BEGIN
                          USER.RESET;
                          USER.SETRANGE(USER."User Security ID",DimSetEntryGRec."Dimension Value Code");
                          IF USER.FIND('-') THEN
                            EMPNAME:=USER."User Name";
                        END;
                      UNTIL DimSetEntryGRec.NEXT = 0;
                    //DIm1.0 End

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

    var
        USER : Record User;
        EMPNAME : Text[30];
        "-DIM1.0-" : Integer;
        DimSetEntryGRec : Record "Dimension Set Entry";
}

