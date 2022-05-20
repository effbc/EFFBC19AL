page 60064 "Posted RGP In"
{
    // version B2B1.0,Cal1.0

    Editable = false;
    PageType = Document;
    SourceTable = "RGP In Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("RGP In No.";"RGP In No.")
                {
                }
                field(Consignee;Consignee)
                {

                    trigger OnValidate();
                    var
                        Text050 : Label 'By changing consignee,all line will be be deleted,do you wish to proceed?';
                    begin
                        IF (xRec.Consignee<>Consignee) THEN BEGIN
                          RGPInLine.SETRANGE("Document No.","RGP In No.");
                          IF RGPInLine.FINDFIRST THEN BEGIN
                            IF CONFIRM(Text050,FALSE) THEN BEGIN
                              "Consignee No.":='';
                              "Consignee Name":='';
                              Address:='';
                              "Consignee City":='';
                              "Consignee Contact":='';
                              "Phone No.":='';
                              "Telex No.":='';
                              RGPInLine.DELETEALL;
                            END ELSE BEGIN
                              Consignee:=xRec.Consignee;
                            END;
                          END ELSE BEGIN
                            "Consignee No.":='';
                            "Consignee Name":='';
                            Address:='';
                            "Consignee City":='';
                            "Consignee Contact":='';
                            "Phone No.":='';
                            "Telex No.":='';
                          END;
                        END;
                          ConsigneeOnAfterValidate;
                    end;
                }
                field("Consignee No.";"Consignee No.")
                {
                }
                field("Consignee Name";"Consignee Name")
                {
                }
                field(Address;Address)
                {
                }
                field("Consignee City";"Consignee City")
                {
                }
                field("Consignee Contact";"Consignee Contact")
                {
                }
                field("RGP In Date";"RGP In Date")
                {
                }
                field("Phone No.";"Phone No.")
                {
                }
                field("Telex No.";"Telex No.")
                {
                }
                field(Results;Results)
                {
                }
                field(Recommendations;Recommendations)
                {
                }
                field("Created By";"Created By")
                {
                }
                field("Released By";"Released By")
                {
                }
            }
            part(RGPLines;"RGP In Lines")
            {
                SubPageLink = Document No.=FIELD(RGP In No.);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(RGP)
            {
                Caption = 'RGP';
                action("RGP Ledger Entries")
                {
                    Caption = 'RGP Ledger Entries';

                    trigger OnAction();
                    begin
                        CLEAR(RGPLedgerEntryForm);
                        RGPLedgerEntry.SETRANGE("Document No.","RGP In No.");
                        RGPLedgerEntry.SETRANGE("Document Type",RGPLedgerEntry."Document Type"::"In");
                        RGPLedgerEntryForm.SETTABLEVIEW(RGPLedgerEntry);
                        RGPLedgerEntryForm.RUNMODAL;
                    end;
                }
            }
        }
        area(processing)
        {
            action("&Print")
            {
                Caption = '&Print';
                Ellipsis = true;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    RGPInHead.SETRANGE(RGPInHead."RGP In No.","RGP In No.");
                    REPORT.RUN(50054,TRUE,FALSE,RGPInHead);
                    RGPInHead.SETRANGE("RGP In No.");
                end;
            }
        }
    }

    trigger OnClosePage();
    begin
        RGPApplied.SETRANGE("Consignee No.","Consignee No.");
        RGPApplied.DELETEALL;
    end;

    var
        RGPOut : Record "RGP Out Header";
        RGPOutLine : Record "RGP Out Line";
        RGPInLine : Record "RGP In Line";
        RGPInLineNo : Integer;
        RGPLedgerEntry : Record "RGP Ledger Entries";
        TempLedgerEntry : Record "Temp. RGP Ledger Entry";
        RGPApplied : Record "Temp. Applied RGPs";
        NextEntryNo : Integer;
        Text001 : Label 'There are no applied entries for Line No. %1';
        RGPLedgerEntry1 : Record "RGP Ledger Entries";
        RemainingQty : Decimal;
        Text002 : Label 'Do you want to post the Document No. %1?';
        RGPOutEntryNo : Integer;
        RGPInHead : Record "RGP In Header";
        RGPLedgerEntryForm : Page "RGP Type Ledger Entries";

    [LineStart(5867)]
    procedure TempLedgerEntrySave(var RGPInHeader : Record "RGP In Header";var RGPInLine : Record "RGP In Line");
    begin
        TempLedgerEntry.SETRANGE("Line No.",1);
        IF NOT TempLedgerEntry.FINDFIRST THEN BEGIN
          TempLedgerEntry."Line No.":=1;
          TempLedgerEntry.Consignee:=RGPInHeader.Consignee;
          TempLedgerEntry."Consignee No.":=RGPInHeader."Consignee No.";
          TempLedgerEntry.Type:=RGPInLine.Type;
          TempLedgerEntry."No.":=RGPInLine."No.";
          TempLedgerEntry.Quantity:=RGPInLine.Quantity;
          TempLedgerEntry."RGP In No.":=RGPInLine."Document No.";
          TempLedgerEntry."RGP Line No.":=RGPInLine."Line No.";
          TempLedgerEntry."RGP Document Date":=RGPInHeader."RGP In Date";
          TempLedgerEntry.INSERT;
          COMMIT;
        END;
    end;

    [LineStart(5883)]
    local procedure ConsigneeOnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;
}

