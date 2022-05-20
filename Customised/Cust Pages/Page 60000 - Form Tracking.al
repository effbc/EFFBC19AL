page 60000 "Form Tracking"
{
    // version B2B1.0,Rev01

    Editable = false;
    PageType = List;
    SourceTable = "Form Tracking";

    layout
    {
        area(content)
        {
            repeater(Control1102152000)
            {
                ShowCaption = false;
                field("Form Code";"Form Code")
                {
                }
                field("Form No.";"Form No.")
                {
                }
                field(State;State)
                {
                }
                field("Document Type";"Document Type")
                {
                }
                field("Document No.";"Document No.")
                {
                }
                field("Vendor / Customer No.";"Vendor / Customer No.")
                {
                }
                field("Invoice Base Amount";"Invoice Base Amount")
                {
                }
                field("Sales Tax Base Amount";"Sales Tax Base Amount")
                {
                }
                field(Status;Status)
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field(Type;Type)
                {
                }
                field("Sales Tax Amount";"Sales Tax Amount")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Release Forms")
            {
                Caption = '&Release Forms';
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    TaxFormsDetails : Record "Tax Forms Details";
                    FormTracking : Record "Form Tracking";
                    Text001 : Label 'Do you want to release the Form?';
                begin
                    IF NOT CONFIRM(Text001,FALSE) THEN
                      EXIT;
                    TESTFIELD(Status,Status :: Open);
                    TESTFIELD(Type,Type::Purchase);
                    TESTFIELD("Form No.");
                    FormTracking.SETRANGE("Form No.","Form No.");
                    IF FormTracking.FINDFIRST THEN
                      REPEAT
                        FormTracking.Status := FormTracking.Status::Released;
                        FormTracking.MODIFY;
                      UNTIL FormTracking.NEXT = 0;
                    CurrPage.UPDATE;

                    //TaxFormsDetails.SETRANGE("Vendor No.","Vendor / Customer No."); B2B Commented
                    TaxFormsDetails.SETRANGE("Form Code","Form Code");
                    TaxFormsDetails.SETRANGE("Form No.","Form No.");
                    IF TaxFormsDetails.FINDFIRST THEN BEGIN
                      TaxFormsDetails.Issued := TRUE;
                      TaxFormsDetails.MODIFY;
                    END;
                end;
            }
        }
    }
}

