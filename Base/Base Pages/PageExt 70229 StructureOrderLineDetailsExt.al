pageextension 70229 StructureOrderLineDetailsExt extends "Structure Order Line Details"
{
    // version NAVIN9.00.00.48067

    layout
    {

        //Unsupported feature: Change Name on "Control 1900000001". Please convert manually.

        modify("Control 1")
        {

            //Unsupported feature: Change Name on "Control 1". Please convert manually.

            ShowCaption = false;
        }

        //Unsupported feature: Change Name on "Control 2". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 2". Please convert manually.


        //Unsupported feature: Change Name on "Control 4". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 4". Please convert manually.


        //Unsupported feature: Change Name on "Control 6". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 6". Please convert manually.


        //Unsupported feature: Change Name on "Control 8". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 8". Please convert manually.


        //Unsupported feature: Change Name on "Control 10". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 10". Please convert manually.


        //Unsupported feature: Change Name on "Control 12". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 12". Please convert manually.


        //Unsupported feature: Change Name on "Control 14". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 14". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500000". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500000". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500002". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500002". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500004". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500004". Please convert manually.


        //Unsupported feature: Change Name on "Control 16". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 16". Please convert manually.


        //Unsupported feature: Change Name on "Control 18". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 18". Please convert manually.


        //Unsupported feature: Change Name on "Control 20". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 20". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280006". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280006". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280008". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280008". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280010". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280010". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280020". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280020". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280012". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280012". Please convert manually.


        //Unsupported feature: Change Name on "Control 40". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 40". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280000". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280000". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280002". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280002". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280014". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280014". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280016". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280016". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280018". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280018". Please convert manually.


        //Unsupported feature: Change Name on "Control 28". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 28". Please convert manually.


        //Unsupported feature: Change Name on "Control 32". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 32". Please convert manually.


        //Unsupported feature: Change Name on "Control 34". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 34". Please convert manually.


        //Unsupported feature: Change Name on "Control 36". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 36". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280022". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280022". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500006". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500006". Please convert manually.


        //Unsupported feature: Change Name on "Control 1500001". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1500001". Please convert manually.


        //Unsupported feature: Change Name on "Control 1280004". Please convert manually.


        //Unsupported feature: Change ImplicitType on "Control 1280004". Please convert manually.

        addafter("Control 34")
        {
            field("Third Party Name"; "Third Party Name")
            {
                Editable = false;
            }
        }
    }


    //Unsupported feature: CodeModification on "OnAfterGetRecord". Please convert manually.

    //trigger OnAfterGetRecord();
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF (("Header/Line" = "Header/Line"::Line) AND (("Tax/Charge Type" = "Tax/Charge Type"::Charges) OR
                                                   ("Tax/Charge Type" = "Tax/Charge Type"::"Other Taxes")))
    THEN BEGIN
      "Calculation TypeEditable" := TRUE;
      "Calculation ValueEditable" := TRUE;
      "Quantity PerEditable" := TRUE;
      "Include BaseEditable" := TRUE;
    END ELSE BEGIN
      "Calculation TypeEditable" := FALSE;
      "Calculation ValueEditable" := FALSE;
      "Quantity PerEditable" := FALSE;
      "Include BaseEditable" := FALSE;
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6
      //"Include BaseEditable" := TRUE; //commented by sujani
    #8..11
    //  "Include BaseEditable" := FALSE; //commented by sujani
    END;
    */
    //end;


    //Unsupported feature: CodeInsertion on "OnClosePage". Please convert manually.

    //trigger OnClosePage();
    //begin
    /*
    //added to restrict the LCY Amounts for Foreign Bills
    Rec.SETFILTER("Structure Code",'PUR_FR_GST');
    Rec.SETFILTER("Calculation Value",'>%1',0);
    IF FINDFIRST THEN BEGIN
      ERROR('Please Pick the LCY tick Mark');
      END;
    */
    //end;


    //Unsupported feature: CodeModification on "OnInit". Please convert manually.

    //trigger OnInit();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Include BaseEditable" := TRUE;
    "Quantity PerEditable" := TRUE;
    "Calculation ValueEditable" := TRUE;
    "Calculation TypeEditable" := TRUE;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Include BaseEditable" := FALSE; // set to false from True ON 21-09-2018 by sujani in the case structure reflection in g/l heads
    #2..4
    */
    //end;

    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

