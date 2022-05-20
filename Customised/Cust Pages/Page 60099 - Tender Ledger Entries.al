page 60099 "Tender Ledger Entries"
{
    // version B2B1.0,Rev01

    PageType = List;
    SourceTable = "Tender Ledger Entries";

    layout
    {
        area(content)
        {
            field(SelectionFilter;SelectionFilter)
            {

                trigger OnValidate();
                begin
                    SelectionFilterOnAfterValidate;
                end;
            }
            repeater(Control1102152000)
            {
                Editable = false;
                ShowCaption = false;
                field("Posting Date";"Posting Date")
                {
                }
                field(Type;Type)
                {
                }
                field("Transaction Type";"Transaction Type")
                {
                }
                field("Mode of Receipt / Payment";"Mode of Receipt / Payment")
                {
                }
                field("No.";"No.")
                {
                }
                field(Description;Description)
                {
                }
                field(Amount;Amount)
                {
                }
            }
            field(Control1102152002;'')
            {
                CaptionClass = Text19012325;
                ShowCaption = false;
            }
        }
    }

    actions
    {
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
                    Navigate.SetDoc("Posting Date","Document No.");
                    Navigate.RUN;
                end;
            }
        }
    }

    trigger OnOpenPage();
    begin
        SelectionFilter := SelectionFilter :: All;
        CurrPage.UPDATE(FALSE);
    end;

    var
        SelectionFilter : Option All,Payment,Receipt,Adjustment,"Write off";
        TendLedgEntry : Record "Tender Ledger Entries";
        Text19012325 : Label 'Seclection Filter';
        Navigate : Page Navigate;

    [LineStart(10943)]
    procedure CurrentNo(SelectionFilter : Option All,Payment,Receipt,Adjustment,"Write off");
    begin
        CASE SelectionFilter OF
          SelectionFilter :: Payment:
          BEGIN
            SETRANGE("Transaction Type","Transaction Type"::Payment);
            CurrPage.UPDATE(FALSE);
          END;
          SelectionFilter :: Receipt:
          BEGIN
            SETRANGE("Transaction Type","Transaction Type"::Receipt);
            CurrPage.UPDATE(FALSE);
          END;
          SelectionFilter :: Adjustment:
          BEGIN
            SETRANGE("Transaction Type","Transaction Type"::Adjustment);
            CurrPage.UPDATE(FALSE);
          END;
          SelectionFilter :: "Write off":
          BEGIN
            SETRANGE("Transaction Type","Transaction Type"::"Write off");
            CurrPage.UPDATE(FALSE);
          END;
          SelectionFilter :: All:
          BEGIN
            CurrPage.UPDATE(FALSE);
          END;

        END;
    end;

    [LineStart(10972)]
    local procedure SelectionFilterOnAfterValidate();
    begin
        CurrentNo(SelectionFilter);
    end;
}

