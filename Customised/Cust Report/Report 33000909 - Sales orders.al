report 33000909 "Sales orders"
{
    // version Rev01,Eff02

    DefaultLayout = RDLC;
    RDLCLayout = './Sales orders.rdlc';

    dataset
    {
        dataitem("Sales Invoice Header";"Sales Invoice Header")
        {

            trigger OnAfterGetRecord();
            begin
                SO.RESET;
                SO.SETFILTER(SO."No.","Sales Invoice Header"."Order No.");
                IF NOT SO.FINDFIRST THEN
                BEGIN
                  SO.INIT;
                  IF COPYSTR("Sales Invoice Header"."Order No.",1,7) ='EFF/SAL' THEN
                     SO."Document Type":=1
                  ELSE IF COPYSTR("Sales Invoice Header"."Order No.",1,7) ='EFF/AMC' THEN
                     SO."Document Type":=6
                  ELSE
                    CurrReport.SKIP;

                  SO."No.":="Sales Invoice Header"."Order No.";
                  SO."Sell-to Customer No.":="Sales Invoice Header"."Sell-to Customer No.";
                  SO."Customer OrderNo.":="Sales Invoice Header"."Customer OrderNo.";
                  SO."Bill-to Name":="Sales Invoice Header"."Bill-to Name";
                  SO."Bill-to Customer No.":="Sales Invoice Header"."Bill-to Customer No.";
                  SO."Customer Posting Group":="Sales Invoice Header"."Customer Posting Group";

                  SO.INSERT;
                END
                // added by Vishnu Priya on 2018 Aug-10th for the Sales Invoice Dummy Modification
                ELSE
                  BEGIN
                    SO."Sell-to Customer No.":="Sales Invoice Header"."Sell-to Customer No.";
                    SO."Customer OrderNo.":="Sales Invoice Header"."Customer OrderNo.";
                    SO."Bill-to Name":="Sales Invoice Header"."Bill-to Name";
                    SO."Bill-to Customer No.":="Sales Invoice Header"."Bill-to Customer No.";
                    SO."Customer Posting Group":="Sales Invoice Header"."Customer Posting Group";
                    SO.MODIFY;
                  END;
            end;
        }
        dataitem("Sales Header";"Sales Header")
        {

            trigger OnAfterGetRecord();
            begin
                SO.RESET;
                SO.SETFILTER(SO."No.","Sales Header"."No.");
                IF NOT SO.FINDFIRST THEN
                BEGIN
                  SO.INIT;
                  IF COPYSTR("Sales Header"."No.",1,7) ='EFF/SAL' THEN
                     SO."Document Type":=1
                  ELSE IF COPYSTR("Sales Header"."No.",1,7) ='EFF/AMC' THEN
                     SO."Document Type":=6
                  ELSE
                    CurrReport.SKIP;

                  SO."No.":="Sales Header"."No.";
                  SO."Sell-to Customer No.":="Sales Header"."Sell-to Customer No.";
                  SO."Customer OrderNo.":="Sales Header"."Customer OrderNo.";
                  SO."Bill-to Name":="Sales Header"."Bill-to Name";
                  SO."Bill-to Customer No.":="Sales Header"."Bill-to Customer No.";
                  SO."Customer Posting Group":="Sales Header"."Customer Posting Group";
                  SO.INSERT;
                END;
            end;
        }
        dataitem("Tender Header";"Tender Header")
        {

            trigger OnAfterGetRecord();
            begin
                SO.RESET;
                SO.SETFILTER(SO."No.","Tender Header"."Tender No.");
                IF NOT SO.FINDFIRST THEN
                BEGIN
                  SO.INIT;
                  SO."Document Type":=7;
                  SO."No.":="Tender Header"."Tender No.";
                  SO."Sell-to Customer No.":="Tender Header"."Customer No.";
                  SO."Customer OrderNo.":="Tender Header"."Customer Tender No.";
                  SO."Bill-to Name":="Tender Header"."Customer Name";
                  SO."Bill-to Customer No.":="Tender Header"."Customer No.";
                  SO.INSERT;
                END;
            end;

            trigger OnPostDataItem();
            begin
                MESSAGE('Report Completed');
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
        SO : Record "Sales Invoice-Dummy";
}

