pageextension 70214 ServiceOrderExt extends 5900
{
    // version NAVW19.00.00.51685,NAVIN9.00.00.51685,B2B1.0

    layout
    {


        modify("Control 107")
        {



            CaptionML = ENU = 'Bill-to Post Code/City';


        }

        modify("Control 147")
        {


            CaptionML = ENU = 'Ship-to Post Code/City';


        }


        modify("Control 17")
        {
            Visible = false;
        }
        addafter("Control 34")
        {
            field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
            {
                Editable = false;
            }
        }
        addafter("Control 156")
        {
            field("Document Date"; "Document Date")
            {
                Caption = 'Order date';
                Editable = false;
            }
            field("Order Time"; "Order Time")
            {
                Caption = 'Order Time';
                Editable = false;

                trigger OnValidate();
                begin
                    OrderTimeC1000000005OnAfterVal;
                end;
            }
        }
        addafter("Control 97")
        {
            field("Order Date"; "Order Date")
            {
            }
            field("Posting Date"; "Posting Date")
            {
            }
        }
        addafter("Control 98")
        {
            field("No. of Archived Versions"; "No. of Archived Versions")
            {
            }
        }
        addafter("Control 217")
        {
            field(Purpose; Purpose)
            {
            }
            field("Material Issue no."; "Material Issue no.")
            {
            }
        }
        addafter("Control 1500780")
        {
            field("Customer Cards"; "Customer Cards")
            {
                Editable = false;
            }
            field("Transation ID"; "Transation ID")
            {
                Editable = false;
            }
        }
        addafter("Control 1500008")
        {
            field("<Service Order Type2>"; "Service Order Type")
            {
            }
        }
        addafter("Control 8")
        {
            field("Shipping No. Series"; "Shipping No. Series")
            {
            }
            field("Posting No. Series"; "Posting No. Series")
            {
            }
        }
    }
    actions
    {


        modify(Statistics)
        {
            Promoted = true;
        }

        //Unsupported feature: Change Name on "Action 49". Please convert manually.


        //Unsupported feature: Change Name on "Action 37". Please convert manually.

        modify("Action 41")
        {

            //Unsupported feature: Change RunObject on "Action 41". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 41". Please convert manually.

        }

        //Unsupported feature: Change RunObject on "Action 60". Please convert manually.


        //Unsupported feature: Change Name on "Action 60". Please convert manually.


        //Unsupported feature: Change Name on "Action 29". Please convert manually.

        modify("Action 11")
        {

            //Unsupported feature: Change RunObject on "Action 11". Please convert manually.


            //Unsupported feature: Change RunPageLink on "Action 11". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 11". Please convert manually.

        }

        //Unsupported feature: Change Name on "Action 35". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 155". Please convert manually.


        //Unsupported feature: Change Name on "Action 155". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 142". Please convert manually.


        //Unsupported feature: Change Name on "Action 142". Please convert manually.


        //Unsupported feature: Change RunObject on "Action 105". Please convert manually.


        //Unsupported feature: Change RunPageView on "Action 105". Please convert manually.


        //Unsupported feature: Change Name on "Action 105". Please convert manually.


        //Unsupported feature: Change Name on "Action 1900000004". Please convert manually.


        //Unsupported feature: Change Name on "Action 18". Please convert manually.


        //Unsupported feature: Change Name on "Action 130". Please convert manually.


        //Unsupported feature: Change Name on "Action 32". Please convert manually.

        modify("Update Reference Invoice No")
        {
            Promoted = true;
        }

        //Unsupported feature: Change Name on "Action 27". Please convert manually.

        modify("Action 12")
        {
            Promoted = true;

            //Unsupported feature: Change Name on "Action 12". Please convert manually.

        }
        modify(Reopen)
        {
            Promoted = true;
        }
        modify("Create Whse Shipment")
        {

            //Unsupported feature: Change AccessByPermission on ""Create Whse Shipment"(Action 14)". Please convert manually.

            Promoted = true;
        }

        //Unsupported feature: Change Name on "Action 209". Please convert manually.


        //Unsupported feature: Change Name on "Action 1500007". Please convert manually.


        //Unsupported feature: Change Name on "Action 33". Please convert manually.


        //Unsupported feature: Change Ellipsis on "TestReport(Action 86)". Please convert manually.

        modify(Post)
        {

            //Unsupported feature: Change Ellipsis on "Post(Action 87)". Please convert manually.

            Promoted = true;
            PromotedIsBig = true;
        }
        modify("Action 114")
        {

            //Unsupported feature: Change Ellipsis on "Action 114". Please convert manually.

            Promoted = true;
            PromotedIsBig = true;

            //Unsupported feature: Change Name on "Action 114". Please convert manually.

        }

        //Unsupported feature: Change Ellipsis on "Action 115". Please convert manually.


        //Unsupported feature: Change Name on "Action 115". Please convert manually.

        modify("Action 4")
        {

            //Unsupported feature: Change Ellipsis on "Action 4". Please convert manually.

            Promoted = true;

            //Unsupported feature: Change Name on "Action 4". Please convert manually.

        }
        addafter("Update Reference Invoice No")
        {
            action("Archi&ve Document")
            {
                Caption = 'Archi&ve Document';

                trigger OnAction();
                var
                    ArchiveManagement: Codeunit ArchiveManagement;
                    ServiceHeaderArchive: Record "Service Header Archive";
                begin
                    ArchiveManagement.ArchiveServiceDocument(Rec);
                    CurrPage.UPDATE(FALSE);
                end;
            }
        }
    }


    //Unsupported feature: PropertyModification on "Action 137.OnAction.DemandOverview(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 137.OnAction.DemandOverview : 5830;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 137.OnAction.DemandOverview : "Demand Overview";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on ""<Action7>"(Action 7).OnAction.OrderPromisingLine(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //"<Action7>" : 99000880;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //"<Action7>" : "Order Promising Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on ""<Action7>"(Action 7).OnAction.OrderPromisingLines(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //"<Action7>" : 99000959;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //"<Action7>" : "Order Promising Lines";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Action 20.OnAction.ServDocLog(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 20.OnAction.ServDocLog : 5912;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 20.OnAction.ServDocLog : "Service Document Log";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Statistics(Action 102).OnAction.SalesSetup(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Statistics : 311;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Statistics : "Sales & Receivables Setup";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Statistics(Action 102).OnAction.ServLine(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Statistics : 5902;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Statistics : "Service Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Statistics(Action 102).OnAction.ServLines(Variable 1003)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Statistics : 5905;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Statistics : "Service Lines";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on ""Update Reference Invoice No"(Action 1590029).OnAction.ReferenceInvoiceNo(Variable 1500000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //"Update Reference Invoice No" : 16470;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //"Update Reference Invoice No" : "Reference Invoice No.";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on ""Update Reference Invoice No"(Action 1590029).OnAction.UpdateReferenceInvoiceNo(Variable 1500001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //"Update Reference Invoice No" : 16627;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //"Update Reference Invoice No" : "Update Reference Invoice No";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Action 12.OnAction.ReleaseServiceDocument(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 12.OnAction.ReleaseServiceDocument : 416;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 12.OnAction.ReleaseServiceDocument : "Release Service Document";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Reopen(Action 13).OnAction.ReleaseServiceDocument(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Reopen : 416;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Reopen : "Release Service Document";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on ""Create Whse Shipment"(Action 14).OnAction.GetSourceDocOutbound(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //"Create Whse Shipment" : 5752;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //"Create Whse Shipment" : "Get Source Doc. Outbound";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "TestReport(Action 86).OnAction.ReportPrint(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //TestReport : 228;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TestReport : "Test Report-Print";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Post(Action 87).OnAction.ServPostYesNo(Variable 1002)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Post : 5981;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Post : "Service-Post (Yes/No)";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Preview(Action 30).OnAction.ServPostYesNo(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Preview : 5981;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Preview : "Service-Post (Yes/No)";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Action 114.OnAction.ServPostPrint(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 114.OnAction.ServPostPrint : 5982;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 114.OnAction.ServPostPrint : "Service-Post+Print";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "Action 4.OnAction.DocPrint(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //Action 4.OnAction.DocPrint : 229;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 4.OnAction.DocPrint : "Document-Print";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ServHeader(Variable 1004)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ServHeader : 5900;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ServHeader : "Service Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ChangeExchangeRate(Variable 1007)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ChangeExchangeRate : 511;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ChangeExchangeRate : "Change Exchange Rate";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ServOrderMgt(Variable 1008)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ServOrderMgt : 5900;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ServOrderMgt : ServOrderManagement;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ServLogMgt(Variable 1009)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ServLogMgt : 5906;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ServLogMgt : ServLogManagement;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "UserMgt(Variable 1013)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //UserMgt : 5700;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UserMgt : "User Setup Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GSTManagement(Variable 1500000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GSTManagement : 16401;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GSTManagement : "GST Management";
    //Variable type has not been exported.

    [LineStart(26988)]
    local procedure OrderTimeC1000000005OnAfterVal();
    begin
        UpdateResponseDateTime;
        CurrPage.UPDATE;
    end;

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

