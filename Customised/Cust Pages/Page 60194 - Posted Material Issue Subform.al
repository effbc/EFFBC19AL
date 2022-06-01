page 60194 "Posted Material Issue Subform"
{
    // version MI1.0,DIM1.0

    // PROJECT : Efftronics
    // *****************************************************************************************************************************
    // SIGN
    // *****************************************************************************************************************************
    // B2B     : B2B Software Technologies
    // *****************************************************************************************************************************
    // VER      SIGN   USERID                 DATE                              DESCRIPTION
    // *****************************************************************************************************************************
    // 1.0       DIM   Sivaramakrishna.A      24-May-13           ->Code has been Commented in the ShowDimensions() because Dimension Tables does not exist in the
    //                                                              NAV 2013 Instead of that code new Code is added for shows the data from the database against the Dimension Set ID.

    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Posted Material Issues Line";

    layout
    {
        area(content)
        {
            field("xRec.COUNT"; xRec.COUNT)
            {
            }
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Document No."; "Document No.")
                {
                }
                field("Material Issue No."; "Material Issue No.")
                {
                }
                field("Item No."; "Item No.")
                {
                }
                field(Description; Description)
                {
                }
                field("Receipt Date"; "Receipt Date")
                {
                }
                field("Issued DateTime"; "Issued DateTime")
                {
                }
                field(Remarks; Remarks)
                {
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    Editable = Visibility;
                }
                field("Station Name"; "Station Name")
                {
                }
                field("Avg. unit cost"; "Avg. unit cost")
                {
                }
                field(Quantity; Quantity)
                {
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                }
                field("Transfer-from Code"; "Transfer-from Code")
                {
                    Editable = false;
                }
                field("Transfer-to Code"; "Transfer-to Code")
                {
                    Editable = Visibility;
                }
                field("Prod. Order No."; "Prod. Order No.")
                {
                }
                field("Prod. Order Line No."; "Prod. Order Line No.")
                {
                }
                field("Prod. Order Comp. Line No."; "Prod. Order Comp. Line No.")
                {
                }
                field("Operation No."; "Operation No.")
                {
                }
                field(Dept; Dept)
                {
                }
                field("Material Requisition Date"; "Material Requisition Date")
                {
                }
                field("Material Picked"; "Material Picked")
                {
                }
                field("Non-Returnable"; "Non-Returnable")
                {
                }
                field("Material Picked Date"; "Material Picked Date")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #60193. Unsupported part was commented. Please check it.
                        /*
                        CurrPage.MaterialIssueLines.FORM.
                        */
                        ShowDimensions;

                    end;
                }
                action("Item &Tracking Lines")
                {
                    Caption = 'Item &Tracking Lines';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #60193. Unsupported part was commented. Please check it.
                        /*CurrPage.MaterialIssueLines.FORM.*/
                        ShowItemTrackingLines;

                    end;
                }
            }
        }
    }

    trigger OnOpenPage();
    begin

        IF USERID IN ['EFFTRONICS\VISHNUPRIYA', 'EFFTRONICS\ANILKUMAR'] THEN
            Visibility := TRUE
        ELSE
            Visibility := FALSE;
    end;

    var
        "-DIM1.0": Integer;
        DimMgt: Codeunit DimensionManagement;
        Visibility: Boolean;

    [LineStart(15639)]
    procedure ShowItemTrackingLines();
    var
        ItemTrackingDocMgt: Codeunit "Item Tracking Doc. Management";
    begin
        ItemTrackingDocMgt.ShowItemTrackingForShptRcptLine(DATABASE::"Posted Material Issues Line", 0, "Document No.", '', 0, "Line No.");
    end;

    [LineStart(15642)]
    procedure ShowDimensions();
    begin
        TESTFIELD("Document No.");
        TESTFIELD("Line No.");
        //DIM1.0 Start
        //Code Commented
        /*
        PostedDocDim.SETRANGE("Table ID",DATABASE::"Posted Material Issues Line");
        PostedDocDim.SETRANGE("Document No.","Document No.");
        PostedDocDim.SETRANGE("Line No.","Line No.");
        PostedDocDimensions.SETTABLEVIEW(PostedDocDim);
        PostedDocDimensions.RUNMODAL;
        */

        DimMgt.ShowDimensionSet("Dimension Set ID", STRSUBSTNO('%1 %2', "Document No.", "Line No."));
        //DIM1.0 End

    end;
}

