page 60268 "Quote Lookup"
{
    // version B2BQTO

    PageType = Worksheet;
    SourceTable = "Quote Lookup";

    layout
    {
        area(content)
        {
            field("LookUp Type";TemplateNameGlobal)
            {
                Caption = 'LookUp Type';
                Editable = false;
                Importance = Promoted;

                trigger OnLookup(Text : Text) : Boolean;
                begin
                    IF PAGE.RUNMODAL(0,LookUpType) = ACTION::LookupOK THEN BEGIN
                      TemplateNumber := LookUpType.ID;
                      TemplateNameGlobal := LookUpType.Name;
                    END;
                    
                    
                    // For Taxes
                    IF TemplateNumber = 1 THEN BEGIN
                      TaxesColumVisible := TRUE;
                      NotesColumVisible := FALSE;
                      SchedulesColumVisible := FALSE;
                      TermsConditionsColumVisible := FALSE;
                      SpecificationsColumVisible := FALSE;
                    END ELSE
                       TaxesColumVisible := FALSE;
                    //For Notes
                    IF TemplateNumber = 2 THEN BEGIN
                      TaxesColumVisible := FALSE;
                      NotesColumVisible := TRUE;
                      SchedulesColumVisible := FALSE;
                      TermsConditionsColumVisible := FALSE;
                      SpecificationsColumVisible := FALSE;
                    END ELSE
                       NotesColumVisible := FALSE;
                    
                    //Terms & Conditions
                    IF TemplateNumber = 3 THEN BEGIN
                      TaxesColumVisible := FALSE;
                      NotesColumVisible := FALSE;
                      SchedulesColumVisible := FALSE;
                      TermsConditionsColumVisible := TRUE;
                      SpecificationsColumVisible := FALSE;
                    END ELSE
                       TermsConditionsColumVisible := FALSE;
                    
                    //Specifications
                    IF TemplateNumber = 4 THEN BEGIN
                      TaxesColumVisible := FALSE;
                      NotesColumVisible := FALSE;
                      SchedulesColumVisible := FALSE;
                      TermsConditionsColumVisible := FALSE;
                      SpecificationsColumVisible := TRUE;
                    END ELSE
                       SpecificationsColumVisible := FALSE;
                    
                    //Schedules
                    
                    IF TemplateNumber = 5 THEN BEGIN
                      TaxesColumVisible := FALSE;
                      NotesColumVisible := FALSE;
                      SchedulesColumVisible := TRUE;
                      TermsConditionsColumVisible := FALSE;
                      SpecificationsColumVisible := FALSE;
                    END ELSE
                       SchedulesColumVisible := FALSE;
                    
                    // Frieght
                    IF TemplateNumber = 6 THEN BEGIN
                      TaxesColumVisible := FALSE;
                      NotesColumVisible := FALSE;
                      FrieghtColumnsVisible := TRUE;
                      SchedulesColumVisible := FALSE;
                      TermsConditionsColumVisible := FALSE;
                      SpecificationsColumVisible := FALSE;
                    END ELSE
                       FrieghtColumnsVisible := FALSE;
                    
                    // Transit Insurance
                    IF TemplateNumber = 7 THEN BEGIN
                      TaxesColumVisible := FALSE;
                      NotesColumVisible := FALSE;
                      FrieghtColumnsVisible := FALSE;
                      TransitInsurancevisible := TRUE;
                      SchedulesColumVisible := FALSE;
                      TermsConditionsColumVisible := FALSE;
                      SpecificationsColumVisible := FALSE;
                    END ELSE
                       TransitInsurancevisible := FALSE;
                    
                    // delivery of material
                    
                    // Transit Insurance
                    IF TemplateNumber = 8 THEN BEGIN
                      TaxesColumVisible := FALSE;
                      NotesColumVisible := FALSE;
                      FrieghtColumnsVisible := FALSE;
                      TransitInsurancevisible := FALSE;
                      SchedulesColumVisible := FALSE;
                      DeliveryMaterial := TRUE;
                      TermsConditionsColumVisible := FALSE;
                      SpecificationsColumVisible := FALSE;
                    END ELSE
                       DeliveryMaterial := FALSE;
                    
                    // OFFER VALIDITY
                    IF TemplateNumber = 9 THEN BEGIN
                      TaxesColumVisible := FALSE;
                      NotesColumVisible := FALSE;
                      FrieghtColumnsVisible := FALSE;
                      TransitInsurancevisible := FALSE;
                      SchedulesColumVisible := FALSE;
                      DeliveryMaterial := FALSE;
                      OffervalidityVisibility := TRUE;
                      TermsConditionsColumVisible := FALSE;
                      SpecificationsColumVisible := FALSE;
                    END ELSE
                       OffervalidityVisibility := FALSE;
                    
                    //Inspection charges
                    
                    IF TemplateNumber = 10 THEN BEGIN
                      TaxesColumVisible := FALSE;
                      NotesColumVisible := FALSE;
                      FrieghtColumnsVisible := FALSE;
                      TransitInsurancevisible := FALSE;
                      SchedulesColumVisible := FALSE;
                      DeliveryMaterial := FALSE;
                      OffervalidityVisibility := FALSE;
                      InspChargesVisibility := TRUE;
                      TermsConditionsColumVisible := FALSE;
                      SpecificationsColumVisible := FALSE;
                    END ELSE
                       InspChargesVisibility := FALSE;
                    
                    // Special Conditions
                    IF TemplateNumber = 11 THEN BEGIN
                      TaxesColumVisible := FALSE;
                      NotesColumVisible := FALSE;
                      FrieghtColumnsVisible := FALSE;
                      TransitInsurancevisible := FALSE;
                      SchedulesColumVisible := FALSE;
                      DeliveryMaterial := FALSE;
                      OffervalidityVisibility := FALSE;
                      InspChargesVisibility := FALSE;
                      SpecialConditionsVisibility := TRUE;
                      TermsConditionsColumVisible := FALSE;
                      SpecificationsColumVisible := FALSE;
                    END ELSE
                       SpecialConditionsVisibility := FALSE;
                    
                    /*
                    //For ADDITIONS AND DEDUCTIONS
                    IF TemplateNumber = 16 THEN BEGIN
                       SkillsetColumnsVisible := FALSE;
                       AddAndDeduColumnsVisible := TRUE;
                       LoanTypesColumnsVisible := FALSE;
                       PayrollYearsColumnsVisible := FALSE;
                       ComputationTypeColumnsVisible := FALSE;
                       PayCadreColumnsVisible := FALSE;
                       OutStationColumnsVisible := FALSE;
                       OTGroupsColumnsVisible := FALSE;
                       GenaralColumnsVisible := FALSE;
                       PerformanceScaleVisisble := FALSE;
                    END ELSE
                       AddAndDeduColumnsVisible := FALSE;
                    
                    
                    //For LOAN TYPES
                    IF TemplateNumber = 18 THEN BEGIN
                       SkillsetColumnsVisible := FALSE;
                       AddAndDeduColumnsVisible := FALSE;
                       LoanTypesColumnsVisible := TRUE;
                       PayrollYearsColumnsVisible := FALSE;
                       ComputationTypeColumnsVisible := FALSE;
                       PayCadreColumnsVisible := FALSE;
                       OutStationColumnsVisible := FALSE;
                       OTGroupsColumnsVisible := FALSE;
                       GenaralColumnsVisible := FALSE;
                       PerformanceScaleVisisble := FALSE;
                    END ELSE BEGIN
                       LoanTypesColumnsVisible := FALSE;
                    END;
                    
                    
                    //For PAYROLL YEARS
                    IF TemplateNumber = 19 THEN BEGIN
                       SkillsetColumnsVisible := FALSE;
                       AddAndDeduColumnsVisible := FALSE;
                       LoanTypesColumnsVisible := FALSE;
                       PayrollYearsColumnsVisible := TRUE;
                       ComputationTypeColumnsVisible := FALSE;
                       PayCadreColumnsVisible := FALSE;
                       OutStationColumnsVisible := FALSE;
                       OTGroupsColumnsVisible := FALSE;
                       GenaralColumnsVisible := FALSE;
                       PerformanceScaleVisisble := FALSE;
                    END ELSE BEGIN
                      PayrollYearsColumnsVisible := FALSE;
                    END;
                    
                    //For PAYROLL YEARS
                    IF TemplateNumber = 19 THEN BEGIN
                       PayYearVisible := TRUE;
                    END ELSE BEGIN
                       PayYearVisible := FALSE;
                    END;
                    
                    
                    //For COMPUTATION TYPE
                    IF TemplateNumber = 17 THEN BEGIN
                       SkillsetColumnsVisible := FALSE;
                       AddAndDeduColumnsVisible := FALSE;
                       LoanTypesColumnsVisible := FALSE;
                       PayrollYearsColumnsVisible := FALSE;
                       ComputationTypeColumnsVisible := TRUE;
                       PayCadreColumnsVisible := FALSE;
                       OutStationColumnsVisible := FALSE;
                       OTGroupsColumnsVisible := FALSE;
                       GenaralColumnsVisible := FALSE;
                       PerformanceScaleVisisble := FALSE;
                    END ELSE BEGIN
                       ComputationTypeColumnsVisible := FALSE;
                    END;
                    
                    
                    //For PAY CADRE
                    IF TemplateNumber = 20 THEN BEGIN
                       SkillsetColumnsVisible := FALSE;
                       AddAndDeduColumnsVisible := FALSE;
                       LoanTypesColumnsVisible := FALSE;
                       PayrollYearsColumnsVisible := FALSE;
                       ComputationTypeColumnsVisible := FALSE;
                       PayCadreColumnsVisible := TRUE;
                       OutStationColumnsVisible := FALSE;
                       OTGroupsColumnsVisible := FALSE;
                       GenaralColumnsVisible := FALSE;
                       PerformanceScaleVisisble := FALSE;
                    END ELSE BEGIN
                       PayCadreColumnsVisible := FALSE;
                    END;
                    //Scale
                    
                    IF TemplateNumber = 9 THEN BEGIN
                       SkillsetColumnsVisible := FALSE;
                       AddAndDeduColumnsVisible := FALSE;
                       LoanTypesColumnsVisible := FALSE;
                       PayrollYearsColumnsVisible := FALSE;
                       ComputationTypeColumnsVisible := FALSE;
                       PayCadreColumnsVisible := FALSE;
                       OutStationColumnsVisible := FALSE;
                       OTGroupsColumnsVisible := FALSE;
                       GenaralColumnsVisible := FALSE;
                       PerformanceScaleVisisble := TRUE;
                    END ELSE BEGIN
                       PerformanceScaleVisisble := FALSE;
                    END;
                    
                    
                    //For PAY CADRE
                    //Paycadrepayelents
                    IF TemplateNumber = 20 THEN BEGIN
                       DefinePayEleVisisble := TRUE;
                    END ELSE BEGIN
                       DefinePayEleVisisble := FALSE;
                    END;
                    
                    // Code Commeted as these lookups are not system defined
                    {
                    IF TemplateNameGlobal = 'OUT STATION ALLOWANCE' THEN BEGIN
                       SkillsetColumnsVisible := FALSE;
                       AddAndDeduColumnsVisible := FALSE;
                       LoanTypesColumnsVisible := FALSE;
                       PayrollYearsColumnsVisible := FALSE;
                       ComputationTypeColumnsVisible := FALSE;
                       PayCadreColumnsVisible := FALSE;
                       OutStationColumnsVisible := TRUE;
                       OTGroupsColumnsVisible := FALSE;
                       GenaralColumnsVisible := FALSE;
                    END ELSE BEGIN
                       OutStationColumnsVisible := FALSE;
                    END;
                    
                    IF TemplateNameGlobal = 'OT GROUPS' THEN BEGIN
                       SkillsetColumnsVisible := FALSE;
                       AddAndDeduColumnsVisible := FALSE;
                       LoanTypesColumnsVisible := FALSE;
                       PayrollYearsColumnsVisible := FALSE;
                       ComputationTypeColumnsVisible := FALSE;
                       PayCadreColumnsVisible := FALSE;
                       OutStationColumnsVisible := FALSE;
                       OTGroupsColumnsVisible := TRUE;
                       GenaralColumnsVisible := FALSE;
                    END ELSE BEGIN
                       OTGroupsColumnsVisible := FALSE;
                    END;
                    }
                    
                    
                    //For PayCadre,Compuation Type,Payrol Years,Loan Types,Additions & Deductions,Skill Set
                    IF NOT (TemplateNumber IN[20,17,19,18,16,1,9]) THEN BEGIN
                       SkillsetColumnsVisible := FALSE;
                       AddAndDeduColumnsVisible := FALSE;
                       LoanTypesColumnsVisible := FALSE;
                       PayrollYearsColumnsVisible := FALSE;
                       ComputationTypeColumnsVisible := FALSE;
                       PayCadreColumnsVisible := FALSE;
                       OutStationColumnsVisible := FALSE;
                       OTGroupsColumnsVisible := FALSE;
                       GenaralColumnsVisible := TRUE;
                       PerformanceScaleVisisble := FALSE;
                    END ELSE BEGIN
                       GenaralColumnsVisible := FALSE;
                    END;
                    
                    */
                    
                    SETRANGE("Lookup Type ID",TemplateNumber);
                    CurrPage.UPDATE(FALSE);

                end;
            }
            repeater(Taxes)
            {
                Caption = 'Taxes';
                Visible = TaxesColumVisible;
                field("Lookup Code";"Lookup Code")
                {

                    trigger OnValidate();
                    begin
                        "Lookup Type ID":=TemplateNumber;
                    end;
                }
                field("Lookup Type ID";"Lookup Type ID")
                {
                }
                field("Lookup Type Name";"Lookup Type Name")
                {
                }
                field(Description;Description)
                {
                }
                field(Select;Select)
                {
                }
            }
            repeater(Notes)
            {
                Caption = 'Notes';
                Visible = NotesColumVisible;
                field("Notes Lookup Code";"Lookup Code")
                {
                    Caption = 'Notes Lookup Code';

                    trigger OnValidate();
                    begin
                        "Lookup Type ID":=TemplateNumber;
                    end;
                }
                field("Notes Lookup Type ID";"Lookup Type ID")
                {
                    Caption = 'Notes Lookup Type ID';
                    Visible = false;
                }
                field("Notes Lookup Type Name";"Lookup Type Name")
                {
                    Caption = 'Notes Lookup Type Name';
                    Visible = false;
                }
                field("Notes Description";Description)
                {
                    Caption = 'Notes Description';
                }
                field("Notes Select";Select)
                {
                    Caption = 'Notes Select';
                }
            }
            repeater("Terms & Conditions")
            {
                Caption = 'Terms & Conditions';
                Visible = TermsConditionsColumVisible;
                field("T&C Lookup Code";"Lookup Code")
                {
                    Caption = 'T&C Lookup Code';

                    trigger OnValidate();
                    begin
                        "Lookup Type ID":=TemplateNumber;
                    end;
                }
                field("T&C Lookup Type ID";"Lookup Type ID")
                {
                    Caption = '" T&C Lookup Type ID"';
                    Visible = false;
                }
                field("T&C Lookup Type Name";"Lookup Type Name")
                {
                    Caption = 'T&C Lookup Type Name';
                    Visible = false;
                }
                field("T&C Description";Description)
                {
                    Caption = 'T&C Description';
                }
                field("T&C Select";Select)
                {
                    Caption = 'T&C Select';
                }
                field("Terms LookUp";"Terms LookUp")
                {
                }
            }
            repeater(Specifications)
            {
                Caption = 'Specifications';
                Visible = SpecificationsColumVisible;
                field("Spe Lookup Code";"Lookup Code")
                {
                    Caption = 'Spe Lookup Code';

                    trigger OnValidate();
                    begin
                        "Lookup Type ID":=TemplateNumber;
                    end;
                }
                field("Spe Lookup Type ID";"Lookup Type ID")
                {
                    Caption = 'Spe Lookup Type ID';
                    Visible = false;
                }
                field("Spe Lookup Type Name";"Lookup Type Name")
                {
                    Caption = 'Spe Lookup Type Name';
                    Visible = false;
                }
                field("Spe Description";Description)
                {
                    Caption = 'Spe Description';
                }
                field("Spec Select";Select)
                {
                    Caption = 'Spec Select';
                }
            }
            repeater(Schedules)
            {
                Caption = 'Schedules';
                Visible = SchedulesColumVisible;
                field("Schedule LookUp";"Schedule LookUp")
                {
                }
                field("Sch Lookup Code";"Lookup Code")
                {
                    Caption = 'Sch Lookup Code';
                    Visible = false;

                    trigger OnValidate();
                    begin
                        "Lookup Type ID":=TemplateNumber;
                    end;
                }
                field("Sch Lookup Type ID";"Lookup Type ID")
                {
                    Caption = 'Sch Lookup Type ID';
                    Visible = false;
                }
                field("Sch Lookup Type Name";"Lookup Type Name")
                {
                    Caption = 'Sch Lookup Type Name';
                    Visible = false;
                }
                field("Sch Description";Description)
                {
                    Caption = 'Sch Description';
                }
                field("Sch Select";Select)
                {
                    Caption = 'Sch Select';
                }
                field(FieldNo1;FieldNo1)
                {
                    Caption = 'FieldNo1';
                }
                field(FieldNo2;FieldNo2)
                {
                    Caption = 'FieldNo2';
                }
                field(FieldNo3;FieldNo3)
                {
                    Caption = 'FieldNo3';
                }
                field(FieldNo4;FieldNo4)
                {
                    Caption = 'FieldNo4';
                }
                field(FieldNo5;FieldNo5)
                {
                    Caption = 'FieldNo5';
                }
                field(FieldNo6;FieldNo6)
                {
                    Caption = 'FieldNo6';
                }
                field(Qty;Qty)
                {
                    Caption = 'Qty';
                }
                field(Rate;Rate)
                {
                    Caption = 'Rate';
                }
                field(Amount;Amount)
                {
                    Caption = 'Amount';
                }
                field(Remarks;Remarks)
                {
                    Caption = 'Remarks';
                }
            }
            repeater(FREIGHT)
            {
                Caption = 'FREIGHT';
                Visible = FrieghtColumnsVisible;
                field("Frieght Lookup Code";"Lookup Code")
                {
                    Caption = 'Frieght Lookup Code';

                    trigger OnValidate();
                    begin
                        "Lookup Type ID":=TemplateNumber;
                    end;
                }
                field("Frieght Lookup Type ID";"Lookup Type ID")
                {
                    Caption = 'Frieght Lookup Type ID';
                    Visible = false;
                }
                field("Frieght Lookup Type Name";"Lookup Type Name")
                {
                    Caption = 'Frieght Lookup Type Name';
                    Visible = false;
                }
                field("Frieght Description";Description)
                {
                    Caption = 'Frieght Description';
                }
                field("Frieght Select";Select)
                {
                    Caption = 'Frieght Select';
                }
            }
            repeater("Transit Insurance")
            {
                Caption = 'Transit Insurance';
                Visible = TransitInsurancevisible;
                field("Transit Insurance  Lookup Code";"Lookup Code")
                {
                    Caption = 'Transit Insurance Lookup Code';

                    trigger OnValidate();
                    begin
                        "Lookup Type ID":=TemplateNumber;
                    end;
                }
                field("Transit Insurance Lookup Type ID";"Lookup Type ID")
                {
                    Caption = 'Transit Insurance Lookup Type ID';
                    Visible = false;
                }
                field("Transit Insurance Type Name";"Lookup Type Name")
                {
                    Caption = 'Transit Insurance Type Name';
                    Visible = false;
                }
                field("Transit Insurance  Description";Description)
                {
                    Caption = 'Transit Insurance  Description';
                }
                field("Transit Insurance Select";Select)
                {
                    Caption = 'Transit Insurance Select';
                }
            }
            repeater("DELIVERY OF MATERIAL")
            {
                Caption = 'DELIVERY OF MATERIAL';
                Visible = DeliveryMaterial;
                field("Delivery Material Lookup Code";"Lookup Code")
                {
                    Caption = 'Delivery Material Lookup Code';

                    trigger OnValidate();
                    begin
                        "Lookup Type ID":=TemplateNumber;
                    end;
                }
                field("Delivery Material Lookup Type ID";"Lookup Type ID")
                {
                    Caption = 'Delivery Material Lookup Type ID';
                    Visible = false;
                }
                field("Delivery Material Type Name";"Lookup Type Name")
                {
                    Caption = 'Delivery Material Type Name';
                    Visible = false;
                }
                field("Delivery Material Description";Description)
                {
                    Caption = 'Delivery Material Description';
                }
                field("Delivery Material Select";Select)
                {
                    Caption = 'Delivery Material Select';
                }
            }
            repeater("OFFER VALIDITY")
            {
                Caption = 'OFFER VALIDITY';
                Visible = OffervalidityVisibility;
                field("Offer Validity Lookup Code";"Lookup Code")
                {
                    Caption = 'Offer Validity Lookup Code';

                    trigger OnValidate();
                    begin
                        "Lookup Type ID":=TemplateNumber;
                    end;
                }
                field("Offer Validity Lookup Type ID";"Lookup Type ID")
                {
                    Caption = 'Offer Validity Lookup Type ID';
                    Visible = false;
                }
                field("Offer Validity Type Name";"Lookup Type Name")
                {
                    Caption = 'Offer Validity Type Name';
                    Visible = false;
                }
                field("Offer Validity Description";Description)
                {
                    Caption = 'Offer Validity Description';
                }
                field("Offer Validity Select";Select)
                {
                    Caption = 'Offer Validity Select';
                }
            }
            repeater("Inspection Charges")
            {
                Caption = 'Inspection Charges';
                Visible = InspChargesVisibility;
                field("Inspection Charges Lookup Code";"Lookup Code")
                {
                    Caption = 'Inspection Charges Lookup Code';
                    Visible = true;

                    trigger OnValidate();
                    begin
                        "Lookup Type ID":=TemplateNumber;
                    end;
                }
                field("Insp Chrages Lookup Type ID";"Lookup Type ID")
                {
                    Caption = 'Insp Chrages Lookup Type ID';
                    Visible = false;
                }
                field("Insp Charges Type Name";"Lookup Type Name")
                {
                    Caption = 'Insp Charges Type Name';
                    Visible = false;
                }
                field("Insp Charges Description";Description)
                {
                    Caption = 'Insp Charges Description';
                }
                field("Insp Charges  Select";Select)
                {
                    Caption = 'Insp Charges Select';
                }
            }
            repeater("Special Conditions")
            {
                Caption = 'Special Conditions';
                Visible = SpecialConditionsVisibility;
                field("Special Condition Lookup Code";"Lookup Code")
                {
                    Caption = 'Special Condition Lookup Code';
                    Visible = true;

                    trigger OnValidate();
                    begin
                        "Lookup Type ID":=TemplateNumber;
                    end;
                }
                field("Special Condition Lookup Type ID";"Lookup Type ID")
                {
                    Caption = 'Special Condition Lookup Type ID';
                    Visible = false;
                }
                field("Special Condition Type Name";"Lookup Type Name")
                {
                    Caption = 'Special Condition Type Name';
                    Visible = false;
                }
                field("Special Condition Description";Description)
                {
                    Caption = 'Special Condition Description';
                }
                field("Special Condition  Select";Select)
                {
                    Caption = 'Special Condition  Select';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Action1102152028)
            {
                action(QuoteSpecification)
                {
                    Caption = 'Quote Specification';
                    Image = ShowWarning;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page Page70003;
                    RunPageLink = Field1=FIELD(Lookup Code);
                    Visible = SpecificationsColumVisible;
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    begin
        "Lookup Type ID":=TemplateNumber;
    end;

    trigger OnOpenPage();
    begin
        //Setting the Initial Values when the page is loaded to LookupTypes.
        TemplateNumber := 1;
        TemplateNameGlobal:='Taxes';
        SETRANGE("Lookup Type ID",1);
        TaxesColumVisible := TRUE;
        NotesColumVisible := FALSE;
        SchedulesColumVisible := FALSE;
        TermsConditionsColumVisible := FALSE;
        SpecificationsColumVisible := FALSE;
    end;

    var
        TemplateNameGlobal : Code[50];
        TemplateNumber : Integer;
        LookUpType : Record "Quote LookUp Type";
        Lookup : Record "Quote Lookup";
        TaxesColumVisible : Boolean;
        NotesColumVisible : Boolean;
        TermsConditionsColumVisible : Boolean;
        SpecificationsColumVisible : Boolean;
        SchedulesColumVisible : Boolean;
        SchecVisible : Boolean;
        FrieghtColumnsVisible : Boolean;
        TransitInsurancevisible : Boolean;
        DeliveryMaterial : Boolean;
        OffervalidityVisibility : Boolean;
        InspChargesVisibility : Boolean;
        SpecialConditionsVisibility : Boolean;
}

