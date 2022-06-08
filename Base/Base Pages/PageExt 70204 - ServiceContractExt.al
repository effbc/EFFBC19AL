pageextension 70204 ServiceContractExt extends "Service Contract"
{

    layout
    {


        modify("Post Code")
        {



            CaptionML = ENU = 'Post Code/City';


        }


        modify("Bill-to City")
        {


            CaptionML = ENU = 'Bill-to Post Code/City';


        }


        modify("Ship-to Post Code")
        {


            CaptionML = ENU = 'Ship-to Post Code/City';


        }


        modify("Service Period")
        {


            CaptionML = ENU = 'Prev.Maintainence Visits';


        }


    }
    actions
    {



        modify("Action178")
        {


            Promoted = true;


        }



        modify("&Print")
        {



            Promoted = true;


        }


        modify(CreateServiceInvoice)
        {
            Promoted = true;
        }


        modify(LockContract)
        {
            Promoted = true;
        }


        modify(SignContract)
        {
            Promoted = true;
        }


        modify("Copy &Document...")
        {
            Promoted = true;


        }



        modify("Contract Details")
        {


            Promoted = true;


        }
        modify("Contract Gain/Loss Entries")
        {


            Promoted = true;



        }
        modify("Contract Invoicing")
        {



            Promoted = true;


        }
        modify("Contract Price Update - Test")
        {



            Promoted = false;



        }
        modify("Prepaid Contract")
        {



            Promoted = false;


        }
        modify("Expired Contract Lines")
        {



            Promoted = true;


        }
    }




<<<<<<< HEAD
    //var
    //>>>> ORIGINAL VALUE:
    //Action 112.OnAction.DocPrint : 229;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Action 112.OnAction.DocPrint : "Document-Print";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "LockContract(Action 73).OnAction.LockOpenServContract(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //LockContract : 5943;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LockContract : "Lock-OpenServContract";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "OpenContract(Action 74).OnAction.LockOpenServContract(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //OpenContract : 5943;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //OpenContract : "Lock-OpenServContract";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "SignContract(Action 76).OnAction.SignServContractDoc(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //SignContract : 5944;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SignContract : SignServContractDoc;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CollectShpmntsByLineContractNo(PROCEDURE 4).ServShptHeader(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CollectShpmntsByLineContractNo : 5990;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CollectShpmntsByLineContractNo : "Service Shipment Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CollectShpmntsByLineContractNo(PROCEDURE 4).ServShptLine(Variable 1001)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CollectShpmntsByLineContractNo : 5991;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CollectShpmntsByLineContractNo : "Service Shipment Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "GetServItemLine(PROCEDURE 5).ContractLineSelection(Variable 1005)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //GetServItemLine : 6057;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GetServItemLine : "Contract Line Selection";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ServContractLine(Variable 1015)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ServContractLine : 5964;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ServContractLine : "Service Contract Line";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "FiledServContract(Variable 1017)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //FiledServContract : 5970;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //FiledServContract : "Filed Service Contract Header";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ChangeCustomerinContract(Variable 1000)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ChangeCustomerinContract : 6037;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ChangeCustomerinContract : "Change Customer in Contract";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "CopyServDoc(Variable 1021)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //CopyServDoc : 5979;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CopyServDoc : "Copy Service Document";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ServContractMgt(Variable 1018)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ServContractMgt : 5940;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ServContractMgt : ServContractManagement;
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "UserMgt(Variable 1019)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //UserMgt : 5700;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UserMgt : "User Setup Management";
    //Variable type has not been exported.


    //Unsupported feature: PropertyModification on "ServContractLine1(Variable 1024)". Please convert manually.

    //var
    //>>>> ORIGINAL VALUE:
    //ServContractLine1 : 5964;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ServContractLine1 : "Service Contract Line";
    //Variable type has not been exported.


    //Unsupported feature: CodeModification on "OnAfterGetRecord". Please convert manually.

    //trigger OnAfterGetRecord();
    //>>>> ORIGINAL CODE:
    //begin
    /*
    UpdateShiptoCode;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    UpdateShiptoCode;
    NextInvoicePeriodOnFormat(FORMAT("Next Invoice Period"));
    */
    //end;

    (28115)]
=======
>>>>>>> 75554976da0214e9ec70a45a874425238783b297
    local procedure NextInvoicePeriodOnFormat(Text: Text[1024]);
    begin
        Text := Rec.NextInvoicePeriod;
    end;


}

