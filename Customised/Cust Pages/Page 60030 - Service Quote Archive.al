page 60030 "Service Quote Archive"
{
    // version B2B1.0,Rev01

    Caption = 'Service Quote Archive';
    Editable = false;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Service Header Archive";
    SourceTableView = WHERE(Document Type=FILTER(Quote));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No.";"No.")
                {
                }
                field(Description;Description)
                {
                }
                field("Customer No.";"Customer No.")
                {

                    trigger OnValidate();
                    begin
                        CustomerNoOnAfterValidate;
                    end;
                }
                field("Contact No.";"Contact No.")
                {
                }
                field(Name;Name)
                {
                }
                field(Address;Address)
                {
                }
                field("Address 2";"Address 2")
                {
                }
                field("Post Code";"Post Code")
                {
                    Caption = 'Post Code/City';
                }
                field("Contact Name";"Contact Name")
                {
                }
                field("Phone No.";"Phone No.")
                {
                    Caption = 'Phone No./Phone No. 2';
                }
                field(City;City)
                {
                }
                field("Phone No. 2";"Phone No. 2")
                {
                }
                field("E-Mail";"E-Mail")
                {
                }
                field("Notify Customer";"Notify Customer")
                {
                }
                field("Service Order Type";"Service Order Type")
                {
                }
                field("Contract No.";"Contract No.")
                {
                }
                field("Response Date";"Response Date")
                {
                }
                field("Response Time";"Response Time")
                {
                }
                field(Priority;Priority)
                {
                }
                field(Status;Status)
                {
                }
                field("Responsibility Center";"Responsibility Center")
                {
                }
            }
            part(ServItemLine;"Service Quote Archive Subform")
            {
                Editable = false;
                SubPageLink = Document No.=FIELD(No.),Doc. No. Occurrence=FIELD(Doc. No. Occurrence),Version No.=FIELD(Version No.);
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field("Bill-to Customer No.";"Bill-to Customer No.")
                {

                    trigger OnValidate();
                    begin
                        BilltoCustomerNoOnAfterValidat;
                    end;
                }
                field("Bill-to Contact No.";"Bill-to Contact No.")
                {
                }
                field("Bill-to Name";"Bill-to Name")
                {
                }
                field("Bill-to Address";"Bill-to Address")
                {
                }
                field("Bill-to Address 2";"Bill-to Address 2")
                {
                }
                field("Bill-to Post Code";"Bill-to Post Code")
                {
                    Caption = 'Bill-to Post Code/City';
                }
                field("Bill-to City";"Bill-to City")
                {
                }
                field("Bill-to Contact";"Bill-to Contact")
                {
                }
                field("Your Reference";"Your Reference")
                {
                }
                field("Salesperson Code";"Salesperson Code")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Document Date";"Document Date")
                {
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                }
                field("Job No.";"Job No.")
                {
                    Caption = 'Job No.';
                }
                field("Max. Labor Unit Price";"Max. Labor Unit Price")
                {
                }
            }
            group(Shipping)
            {
                Caption = 'Shipping';
                field("Ship-to Code";"Ship-to Code")
                {

                    trigger OnValidate();
                    begin
                        ShiptoCodeOnAfterValidate;
                    end;
                }
                field("Ship-to Name";"Ship-to Name")
                {
                }
                field("Ship-to Address";"Ship-to Address")
                {
                }
                field("Ship-to Address 2";"Ship-to Address 2")
                {
                }
                field("Ship-to Post Code";"Ship-to Post Code")
                {
                    Caption = 'Ship-to Post Code/City';
                }
                field("Ship-to City";"Ship-to City")
                {
                }
                field("Ship-to Contact";"Ship-to Contact")
                {
                }
                field("Ship-to Phone";"Ship-to Phone")
                {
                    Caption = 'Ship-to Phone/Phone 2';
                }
                field("Ship-to Phone 2";"Ship-to Phone 2")
                {
                }
                field("Ship-to E-Mail";"Ship-to E-Mail")
                {
                }
            }
            group(Details)
            {
                Caption = 'Details';
                field("Warning Status";"Warning Status")
                {
                }
                field("Link Service to Service Item";"Link Service to Service Item")
                {
                }
                field("Allocated Hours";"Allocated Hours")
                {
                }
                field("No. of Allocations";"No. of Allocations")
                {
                }
                field("No. of Unallocated Items";"No. of Unallocated Items")
                {
                }
                field("Service Zone Code";"Service Zone Code")
                {
                }
                field("Order Date";"Order Date")
                {
                }
                field("Order Time";"Order Time")
                {
                }
                field("Starting Date";"Starting Date")
                {
                }
                field("Starting Time";"Starting Time")
                {
                }
                field("Actual Response Time (Hours)";"Actual Response Time (Hours)")
                {
                }
                field("Finishing Date";"Finishing Date")
                {
                }
                field("Finishing Time";"Finishing Time")
                {

                    trigger OnValidate();
                    begin
                        FinishingTimeOnAfterValidate;
                    end;
                }
            }
            group(" Foreign Trade")
            {
                Caption = '" Foreign Trade"';
                field("Currency Code";"Currency Code")
                {

                    trigger OnAssistEdit();
                    begin
                        ChangeExchangeRate.SetParameter("Currency Code","Currency Factor","Posting Date");
                        IF ChangeExchangeRate.RUNMODAL = ACTION::OK THEN BEGIN
                          VALIDATE("Currency Factor",ChangeExchangeRate.GetParameter);
                          CurrPage.UPDATE;
                        END;
                        CLEAR(ChangeExchangeRate);
                    end;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Restore")
            {
                Caption = '&Restore';
                Ellipsis = true;
                Image = Restore;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    ArchiveManagement : Codeunit ArchiveManagement;
                begin
                    ArchiveManagement.RestoreServiceDocument(Rec);
                end;
            }
        }
    }

    var
        Text004 : Label 'You cannot open the form because %1 is %2 in the %3 table.';
        ServMgtSetup : Record "Service Mgt. Setup";
        ServItemLine : Record "Service Item Line";
        RepairStatus : Record "Repair Status";
        ServOrderMgt : Codeunit ServOrderManagement;
        ServLogMgt : Codeunit ServLogManagement;
        Mail : Codeunit Mail;
        ServItemMgt : Codeunit ServItemManagement;
        UserMgt : Codeunit "User Setup Management";
        CreateServiceOrder : Codeunit "Serv-Quote to Order (Yes/No)";
        ChangeExchangeRate : Page "Change Exchange Rate";
                                 FaultResolutionRelation : Page "Fault/Resol. Cod. Relationship";

    [LineStart(5420)]
    local procedure CustomerNoOnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;

    [LineStart(5423)]
    local procedure BilltoCustomerNoOnAfterValidat();
    begin
        CurrPage.UPDATE;
    end;

    [LineStart(5426)]
    local procedure ShiptoCodeOnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;

    [LineStart(5429)]
    local procedure FinishingTimeOnAfterValidate();
    begin
        CurrPage.UPDATE(TRUE);
    end;
}

