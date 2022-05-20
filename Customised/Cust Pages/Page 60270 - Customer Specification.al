page 60270 "Customer Specification"
{
    // version B2BQTO

    Caption = 'Customer Specification';
    PageType = Worksheet;
    SourceTable = "Customer Specification";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                }
                field("Lookup Code";"Lookup Code")
                {
                }
                field("Lookup Type ID";"Lookup Type ID")
                {
                }
                field("Lookup Type Name";"Lookup Type Name")
                {
                }
                field(Description;Description)
                {
                }
                field("Customer No.";"Customer No.")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Action1102152006)
            {
                action(Specification)
                {
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        LookUpType.RESET;
                        //temporarily commented by vishnu priya on 22-09-2020
                        //LookUpType.SETRANGE("Lookup Type ID",3);
                        //LookUpType.SETRANGE("Lookup Type Name",'TERMS & CONDITIONS');
                        CLEAR(QuoteLookUpList);
                        QuoteLookUpList.SETRECORD(LookUpType);
                        QuoteLookUpList.SETTABLEVIEW(LookUpType);
                        QuoteLookUpList.LOOKUPMODE(TRUE);
                        QuoteLookUpList.CarryCustomer(Rec."Customer No.");
                        IF QuoteLookUpList.RUNMODAL = ACTION ::LookupOK THEN;

                    end;
                }
            }
        }
    }

    var
        LookUpType : Record "Quote Lookup";
        QuoteLookUpList : Page "Quote LookUp List";
}

