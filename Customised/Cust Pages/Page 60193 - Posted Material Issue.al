page 60193 "Posted Material Issue"
{
    // version MI1.0,Rev01

    Editable = true;
    PageType = Document;
    SourceTable = "Posted Material Issues Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No.";"No.")
                {
                    Editable = false;
                }
                field("Transfer-from Code";"Transfer-from Code")
                {
                }
                field("Transfer-to Code";"Transfer-to Code")
                {
                }
                field("Resource Name";"Resource Name")
                {
                }
                field("User ID";"User ID")
                {
                }
                field("Released Date";"Released Date")
                {
                    Editable = false;
                }
                field("Released Time";"Released Time")
                {
                    Editable = false;
                }
                field("Released By";"Released By")
                {
                }
                field("Posted By";"Posted By")
                {
                    Editable = true;
                    Enabled = true;
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Required Date";"Required Date")
                {
                }
                field("Issued DateTime";"Issued DateTime")
                {
                }
                field("Receipt Date";"Receipt Date")
                {
                }
                field("Reason Code";"Reason Code")
                {
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                }
                field("Material Issue No.";"Material Issue No.")
                {
                }
                field("Prod. Order No.";"Prod. Order No.")
                {
                }
                field("Prod. Order Line No.";"Prod. Order Line No.")
                {
                }
                field("Prod. BOM No.";"Prod. BOM No.")
                {
                }
                field("Sales Order No.";"Sales Order No.")
                {
                }
                field("Service Order No.";"Service Order No.")
                {
                }
                field("Service Item Description";"Service Item Description")
                {
                }
                field("Service Item Serial No.";"Service Item Serial No.")
                {
                    Editable = true;
                }
                field("Transaction ID";"Transaction ID")
                {
                    Editable = false;
                }
                field("Customer No";"Customer No")
                {
                    Editable = true;
                }
                field("Material Picked";"Material Picked")
                {
                    Visible = true;
                }
                field("Material Picked Date";"Material Picked Date")
                {
                }
                field(Remarks;Remarks)
                {
                }
                field("Auto Post";"Auto Post")
                {
                    Editable = false;
                    Enabled = false;
                }
            }
            part(MaterialIssueLines;"Posted Material Issue Subform")
            {
                SubPageLink = Document No.=FIELD(No.);
            }
            group("Issue-from")
            {
                Caption = 'Issue-from';
                field("Transfer-from Name";"Transfer-from Name")
                {
                }
                field("Transfer-from Name 2";"Transfer-from Name 2")
                {
                }
                field("Transfer-from Address";"Transfer-from Address")
                {
                }
                field("Transfer-from Address 2";"Transfer-from Address 2")
                {
                }
                field("Transfer-from Post Code";"Transfer-from Post Code")
                {
                }
                field("Transfer-from City";"Transfer-from City")
                {
                }
                field("Transfer-from County";"Transfer-from County")
                {
                }
                field("Transfer-from Contact";"Transfer-from Contact")
                {
                }
                field(Stores;Stores)
                {
                }
            }
            group("Issue-to")
            {
                Caption = 'Issue-to';
                field("Transfer-to Name";"Transfer-to Name")
                {
                }
                field("Transfer-to Name 2";"Transfer-to Name 2")
                {
                }
                field("Transfer-to Address";"Transfer-to Address")
                {
                }
                field("Transfer-to Address 2";"Transfer-to Address 2")
                {
                }
                field("Transfer-to Post Code";"Transfer-to Post Code")
                {
                }
                field("Transfer-to City";"Transfer-to City")
                {
                }
                field("Transfer-to County";"Transfer-to County")
                {
                }
                field("Transfer-to Country Code";"Transfer-to Country Code")
                {
                }
                field("Transfer-to Contact";"Transfer-to Contact")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Receipt")
            {
                Caption = '&Receipt';
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = Comment;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Inventory Comment Sheet";
                    RunPageLink = Document Type=CONST(Posted Material Issues),No.=FIELD(No.);
                }
                action(Statistics)
                {
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Material Issue Statistics";
                    ShortCutKey = 'F9';
                }
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Process;
                }
            }
        }
        area(processing)
        {
            action("&Navigate")
            {
                Caption = '&Navigate';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    Navigate;
                end;
            }
            action("&Print")
            {
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction();
                var
                    PostedMaterialIssuesHeader : Record "Posted Material Issues Header";
                begin
                    PostedMaterialIssuesHeader.SETRANGE("No.","No.");
                    REPORT.RUN(50053,TRUE,FALSE,PostedMaterialIssuesHeader);
                end;
            }
        }
    }

    trigger OnOpenPage();
    begin
        IF NOT(USERID IN ['EFFTRONICS\SUJANI','EFFTRONICS\VISHNUPRIYA'])  THEN
        CurrPage.EDITABLE := FALSE;
    end;
}

