table 33000027 "Pay Employee Perks"
{
    // version NEOGYNPAY13.70.00.06

    // //B2B Commented code at Perk Code - OnLookup()

    DrillDownPageID = 33000048;
    LookupPageID = 33000048;
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Employee No."; Code[20])
        {
            NotBlank = true;
            TableRelation = Employee."No.";
            DataClassification = CustomerContent;
        }
        field(3; "Perk Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Pay Perks".Code;
            DataClassification = CustomerContent;

            trigger OnLookup();
            begin
                //Deleted Var(PayGradePerksListFormPagePage33000026), commented code B2B
                /*
                IF RvEmp.GET("Employee No.") THEN
                  BEGIN
                    RVPERKS.SETRANGE(RVPERKS."Pay Designation",RvEmp."Job Title/Grade");
                
                    CLEAR(PayGradePerksListForm);
                    PayGradePerksListForm.CALLINGASLOOKUP(TRUE);
                    PayGradePerksListForm.SETTABLEVIEW(RVPERKS);
                    PayGradePerksListForm.SETRECORD(RVPERKS);
                    IF PayGradePerksListForm.RUNMODAL = ACTION::LookupOK THEN
                      BEGIN
                        PayGradePerksListForm.GETRECORD(RVPERKS);
                
                        IF PerkCodeFind THEN
                          ERROR(Text003,RVPERKS."Pay Perks Code",PayEmployeePerks."Employee No.");
                
                        //Validate whether Perk Code already transfered, if yes then can't allocate.
                        PerkCodeValidate;
                
                        "Perk Code" := RVPERKS."Pay Perks Code";
                        Description := RVPERKS.Description;
                        Type := RVPERKS.Type;
                      END;
                  END;
                 *///B2B

            end;

            trigger OnValidate();
            begin
                RvEmp.Get("Employee No.");
                if RVPERKS.Get(RvEmp."Job Title/Grade", "Perk Code") then begin
                    if PerkCodeFind then
                        Error(Text003, RVPERKS."Pay Perks Code", PayEmployeePerks."Employee No.");

                    //Validate whether Perk Code already transfered, if yes then can't allocate.
                    PerkCodeValidate;

                    "Perk Code" := RVPERKS."Pay Perks Code";
                    Description := RVPERKS.Description;
                    Type := RVPERKS.Type;
                end
                else
                    Error(Text007, FieldCaption("Perk Code"), "Perk Code", RvEmp."Job Title/Grade", "Perk Code");


                //if Perk Code already allocated with ToDate = 0 then cann't allocate again
                //if Perk Code already allocated with ToDate <> 0 then can allocate again but with Date Validation.
                if PerkCodeFind then
                    Error(Text003, "Perk Code", PayEmployeePerks."Employee No.");

                //Validate whether Perk Code already transfered, if yes then can't allocate.
                PerkCodeValidate;
            end;
        }
        field(5; "From Date"; Date)
        {
            NotBlank = true;
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if "From Date" = 0D then
                    Error(Text000);

                if "From Date" > WorkDate then
                    Error(Text009, FieldCaption("From Date"), "From Date", WorkDate);

                GetAYID;

                FromDateCheck;

                PerkCodeFind;

                Validate(Amount);

                //if transfer then entry must be closed
                TransferClosed;
            end;
        }
        field(7; "To Date"; Date)
        {
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if "To Date" <> 0D then
                    if "To Date" < "From Date" then
                        Error(Text001);

                if "To Date" > WorkDate then
                    Error(Text009, FieldCaption("To Date"), "To Date", WorkDate);

                if Amount <> 0 then
                    if "To Date" <> 0D then
                        if Confirm(Text004) = true then
                            Closed := true
                        else
                            Error(Text005);

                ToDateCheck;

                Validate(Amount);
            end;
        }
        field(8; Rate; Decimal)
        {
            Enabled = false;
            DataClassification = CustomerContent;
        }
        field(12; Description; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(14; "No. Of Unit"; Integer)
        {
            Enabled = false;
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                "Amount Per Month" := RVPERKS."Monthly Rate" * "No. Of Unit";
            end;
        }
        field(16; "Amount Per Month"; Decimal)
        {
            Enabled = false;
            DataClassification = CustomerContent;
        }
        field(50010; "Perk Allot"; Option)
        {
            OptionMembers = Allocation,Transfer;
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                GetAYID;

                if "From Date" <> 0D then
                    Validate(Amount);

                //if transfer then entry must be closed
                if "From Date" <> 0D then
                    TransferClosed;
            end;
        }
        field(50020; "Normal Wear and Tear Value"; Decimal)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50030; Amount; Decimal)
        {
            DataClassification = CustomerContent;

            trigger OnValidate();
            var
                FromDate: Date;
                AsOnDate: Date;
                PayYear1: Record "Pay Year";
                PayTaxPolicy: Record "Pay Tax Policy";
                FromYear: Integer;
                ToYear: Integer;
                FromMonth: Integer;
                ToMonth: Integer;
                "No.OfMonth": Integer;
                NormalWearandTearValue: Decimal;
            begin
                TestField("From Date");

                //TransferClosed;

                FromDate := "From Date";

                if ("Perk Allot" = "Perk Allot"::Allocation) and ("To Date" = 0D) then
                    AsOnDate := WorkDate
                else
                    if ("Perk Allot" = "Perk Allot"::Transfer) and ("To Date" = 0D) then
                        AsOnDate := "From Date"
                    else
                        AsOnDate := "To Date";


                PayYear.Reset;
                PayYear.SetRange(Type, PayYear.Type::FinYear);
                if PayYear.Find('-') then
                    repeat
                        if FromDate >= PayYear."Year Start Date" then
                            if AsOnDate <= PayYear."Year End Date" then begin
                                FromYear := Date2DMY(FromDate, 3);
                                ToYear := Date2DMY(AsOnDate, 3);

                                FromMonth := Date2DMY(FromDate, 2);
                                ToMonth := Date2DMY(AsOnDate, 2);

                                "No.OfMonth" := ((ToYear - FromYear) * 12) + (ToMonth - FromMonth + 1);

                                PayYear1.Reset;
                                PayYear1.SetRange(Type, PayYear.Type::AsstYear);
                                PayYear1.SetRange("Year Start Date", CalcDate('1Y', PayYear."Year Start Date"));
                                PayYear1.SetRange("Year End Date", CalcDate('1Y', PayYear."Year End Date"));
                                if PayYear1.Find('-') then begin
                                    PayTaxPolicy.Get(PayYear1.ID);

                                    case Type of
                                        Type::Electronic:
                                            NormalWearandTearValue := NormalWearandTearValue + (("No.OfMonth") / 12) *
                                              ((Amount * PayTaxPolicy."Transfer assets elect %") / 100);
                                        Type::Motars:
                                            NormalWearandTearValue := NormalWearandTearValue + (("No.OfMonth") / 12) *
                                              ((Amount * PayTaxPolicy."Transfer assets motor %") / 100);
                                        Type::Others:
                                            NormalWearandTearValue := NormalWearandTearValue + (("No.OfMonth") / 12) *
                                              ((Amount * PayTaxPolicy."Transfer assets others %") / 100);
                                    end;
                                end
                                else
                                    Error(Text010);
                                AsOnDate := 0D;
                            end
                            else begin
                                FromYear := Date2DMY(FromDate, 3);
                                ToYear := Date2DMY(PayYear."Year End Date", 3);

                                FromMonth := Date2DMY(FromDate, 2);
                                ToMonth := Date2DMY(PayYear."Year End Date", 2);

                                "No.OfMonth" := ((ToYear - FromYear) * 12) + (ToMonth - FromMonth + 1);

                                PayYear1.Reset;
                                PayYear1.SetRange(Type, PayYear.Type::AsstYear);
                                PayYear1.SetRange("Year Start Date", CalcDate('1Y', PayYear."Year Start Date"));
                                PayYear1.SetRange("Year End Date", CalcDate('1Y', PayYear."Year End Date"));
                                if PayYear1.Find('-') then begin
                                    PayTaxPolicy.Get(PayYear1.ID);

                                    case Type of
                                        Type::Electronic:
                                            NormalWearandTearValue := NormalWearandTearValue + (("No.OfMonth") / 12) *
                                              ((Amount * PayTaxPolicy."Transfer assets elect %") / 100);
                                        Type::Motars:
                                            NormalWearandTearValue := NormalWearandTearValue + (("No.OfMonth") / 12) *
                                              ((Amount * PayTaxPolicy."Transfer assets motor %") / 100);
                                        Type::Others:
                                            NormalWearandTearValue := NormalWearandTearValue + (("No.OfMonth") / 12) *
                                              ((Amount * PayTaxPolicy."Transfer assets others %") / 100);
                                    end;
                                end
                                else
                                    Error(Text010);

                                AsOnDate := AsOnDate;
                                FromDate := CalcDate('1Y', PayYear."Year Start Date");
                            end;

                    until (PayYear.Next = 0) or (AsOnDate = 0D);

                "Normal Wear and Tear Value" := NormalWearandTearValue;

                /*
                FromMonth := 0;
                ToMonth := 0;
                
                IF "To Date" = 0D THEN
                  AsOnDate := WORKDATE
                ELSE
                  AsOnDate := "To Date";
                
                PayYear.RESET;
                PayYear.SETRANGE(Type,PayYear.Type::FinYear);
                PayYear.SETRANGE(Closed,FALSE);
                IF PayYear.FIND('-') THEN
                  BEGIN
                    IF AsOnDate < PayYear."Year End Date" THEN
                      BEGIN
                        AsOnDate := AsOnDate;
                        PayYear1.RESET;
                        PayYear1.SETRANGE(Type,PayYear.Type::AsstYear);
                        PayYear1.SETRANGE("Year Start Date",CALCDATE('1Y',PayYear."Year Start Date"));
                        PayYear1.SETRANGE("Year End Date",CALCDATE('1Y',PayYear."Year End Date"));
                        IF PayYear1.FIND('-') THEN
                          begin
                            PayTaxPolicy.GET(PayYear1.ID);
                            FromMonth := DATE2DMY("From Date",2);
                            ToMonth := DATE2DMY("To Date",2);
                
                            case type of
                              type :: Electronic
                              "Normal Wear and Tear Value" := ( (ToMonth - FromMonth + 1)/12 ) *
                                ((Amount * PayTaxPolicy."Transfer assets elect %") / 100)
                              type :: Motors
                              "Normal Wear and Tear Value" := ( (ToMonth - FromMonth + 1)/12 ) *
                                ((Amount * PayTaxPolicy."Transfer assets motor %") / 100)
                              type :: Others
                              "Normal Wear and Tear Value" := ( (ToMonth - FromMonth + 1)/12 ) *
                                ((Amount * PayTaxPolicy."Transfer assets others %") / 100)
                            end;
                
                          end;
                
                      END
                
                    ELSE
                      begin
                        repeat
                            FromMonth := DATE2DMY("From Date",2);
                            ToMonth := DATE2DMY(PayYear."Year End Date",2);
                        PayYear1.RESET;
                        PayYear1.SETRANGE(Type,PayYear.Type::AsstYear);
                        PayYear1.SETRANGE("Year Start Date",CALCDATE('1Y',PayYear."Year Start Date"));
                        PayYear1.SETRANGE("Year End Date",CALCDATE('1Y',PayYear."Year End Date"));
                        IF PayYear1.FIND('-') THEN
                            PayTaxPolicy.GET(PayYear1.ID);
                
                            case type of
                              type :: Electronic
                              "Normal Wear and Tear Value" := "Normal Wear and Tear Value"  + ( (ToMonth - FromMonth + 1)/12 ) *
                                ((Amount * PayTaxPolicy."Transfer assets elect %") / 100)
                              type :: Motors
                              "Normal Wear and Tear Value" := "Normal Wear and Tear Value"  + ( (ToMonth - FromMonth + 1)/12 ) *
                                ((Amount * PayTaxPolicy."Transfer assets motor %") / 100)
                              type :: Others
                              "Normal Wear and Tear Value" := "Normal Wear and Tear Value"  + ( (ToMonth - FromMonth + 1)/12 ) *
                                ((Amount * PayTaxPolicy."Transfer assets others %") / 100)
                            end;
                
                
                        until
                      end;
                  END;
                */

            end;
        }
        field(50040; Closed; Boolean)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50050; Type; Option)
        {
            Editable = false;
            OptionMembers = Electronic,Motars,Others;
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                //if transfer then entry must be closed
                TransferClosed;
            end;
        }
        field(50060; AYID; Integer)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Employee No.", "Perk Code", "Perk Allot", "From Date")
        {
        }
        key(Key2; AYID, "Employee No.", "Perk Allot", Type)
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        //closed entry cann't delete
        if Closed then Error(Text008);
    end;

    var
        PayEmployeePerks: Record "Pay Employee Perks";
        Text000: Label 'From Date can not be blank.';
        Text001: Label 'To date should always be greater or equal to From Date.';
        Text002: Label '%1 already Transferred.';
        RVPERKS: Record "Pay Grade Perks";
        RvEmp: Record Employee;
        Text003: Label '%1 already Allocated to Employee No. %2 with Open Entry.';
        Text004: Label 'It will Closed and you cann''t edit.\\Do you want continue?';
        Text005: Label 'Aborted.';
        Text006: Label '%1 cann''t be less than or equal to %2 OR greater than or equal to %3 Employee No. %4.';
        Text007: Label '%1 %2 doesn''t exist with Grade %3.';
        Text008: Label 'Closed Entry cann''t delete.';
        Text009: Label '%1 %2 cann''t greater than WORKDATE %3';
        Text010: Label 'Assessment Year does not exist.';
        PayYear: Record "Pay Year";
        Text011: Label '%1 %2 should be in between FY %3 - %4.';


    procedure PerkCodeValidate();
    begin
        //Validate whether Perk Code already transfered, if yes then cann't allocate.
        PayEmployeePerks.Reset;
        PayEmployeePerks.SetFilter("Perk Code", "Perk Code");
        PayEmployeePerks.SetRange("Perk Allot", PayEmployeePerks."Perk Allot"::Transfer);
        if PayEmployeePerks.Find('-') then
            Error(Text002, "Perk Code");
    end;


    procedure PerkCodeFind(): Boolean;
    begin
        //PerkCodeFind
        //Validate whether Perk Code already exist, if yes then Amount cann't enter it should be auto calculate
        PayEmployeePerks.Reset;
        if RVPERKS."Pay Perks Code" = '' then
            PayEmployeePerks.SetFilter("Perk Code", "Perk Code");
        if "Perk Code" = '' then
            PayEmployeePerks.SetFilter("Perk Code", RVPERKS."Pay Perks Code");

        if (RVPERKS."Pay Perks Code" <> '') and ("Perk Code" <> '') then
            PayEmployeePerks.SetFilter("Perk Code", "Perk Code");

        PayEmployeePerks.SetRange("To Date", 0D);
        if PayEmployeePerks.Find('-') then
            exit(true)
        else begin
            PayEmployeePerks.SetFilter("To Date", '<>%1', 0D);
            if PayEmployeePerks.Find('+') then begin
                if ("From Date" <> 0D) and ("From Date" = PayEmployeePerks."To Date") then begin
                    if ("From Date" < PayEmployeePerks."From Date") or ("From Date" < PayEmployeePerks."To Date") then begin
                        Error(Text006, FieldCaption("From Date"), PayEmployeePerks."Employee No.", PayEmployeePerks."From Date");
                        //Amount := PayEmployeePerks."Normal Wear and Tear Value";
                    end;
                end else
                    if (("From Date" <> 0D) and ("From Date" <= PayEmployeePerks."From Date")) or
             (("From Date" <> 0D) and ("From Date" <= PayEmployeePerks."To Date")) then begin
                        Error(Text006, FieldCaption("From Date"), PayEmployeePerks."From Date",
                          PayEmployeePerks."To Date", PayEmployeePerks."Employee No.");
                        //Amount := PayEmployeePerks."Normal Wear and Tear Value";
                    end;
            end;
            Amount := PayEmployeePerks.Amount - PayEmployeePerks."Normal Wear and Tear Value";
            exit(false);
        end;
    end;


    procedure TransferClosed();
    begin
        //Transferclosed

        //if transfer then entry must be closed
        if "Perk Allot" = "Perk Allot"::Transfer then
            if ("From Date" <> 0D) and (Amount <> 0) then
                if Confirm(Text004) = true then begin
                    "To Date" := "From Date"; //WORKDATE;
                    Closed := true;
                end
                else
                    Error(Text005);
    end;


    procedure FromDateCheck();
    begin
        //FromDateCheck

        PayYear.Reset;
        PayYear.SetRange(Type, PayYear.Type::FinYear);
        PayYear.SetRange(Closed, false);
        if PayYear.Find('-') then begin
            if "From Date" <> 0D then
                if ("From Date" < PayYear."Year Start Date") or ("From Date" > PayYear."Year End Date") then
                    Error(Text011, FieldCaption("From Date"), "From Date", PayYear."Year Start Date", PayYear."Year End Date");
        end;
    end;


    procedure GetAYID();
    var
        AsstYearID: Integer;
    begin
        //GetAYID
        //store the AYID for Transfer based on From Date
        if ("From Date" <> 0D) then begin
            if "Perk Allot" = "Perk Allot"::Transfer then begin
                PayYear.Reset;
                PayYear.SetRange(Type, PayYear.Type::AsstYear);
                if PayYear.Find('-') then
                    repeat
                        if (CalcDate('1Y', "From Date") >= PayYear."Year Start Date") and
                          (CalcDate('1Y', "From Date") <= PayYear."Year End Date") then
                            AsstYearID := PayYear.ID
                        else
                            AsstYearID := 0;

                    until (PayYear.Next = 0) or (AsstYearID <> 0);

                if AsstYearID <> 0 then AYID := AsstYearID;
            end;
        end;
    end;


    procedure ToDateCheck();
    begin
        //ToDateCheck

        PayYear.Reset;
        PayYear.SetRange(Type, PayYear.Type::FinYear);
        PayYear.SetRange(Closed, false);
        if PayYear.Find('-') then begin
            if "To Date" <> 0D then
                if ("To Date" < PayYear."Year Start Date") or ("To Date" > PayYear."Year End Date") then
                    Error(Text011, FieldCaption("To Date"), "To Date", PayYear."Year Start Date", PayYear."Year End Date");
        end;
    end;
}

