report 33000018 "Pay ESI -  Form 7"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './Pay ESI -  Form 7.rdlc';
    UseSystemPrinter = true;

    dataset
    {
        dataitem("Pay Year"; "Pay Year")
        {
            DataItemTableView = SORTING(ID);
        }
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "No.", "Job Title/Grade", "Department Code";
            column(intMonth_1__1_; intMonth[1] [1])
            {
            }
            column(intMonth_2__1_; intMonth[2] [1])
            {
            }
            column(intMonth_3__1_; intMonth[3] [1])
            {
            }
            column(intMonth_4__1_; intMonth[4] [1])
            {
            }
            column(intMonth_5__1_; intMonth[5] [1])
            {
            }
            column(intMonth_6__1_; intMonth[6] [1])
            {
            }
            column(IntMontDate_1__1_; IntMontDate[1] [1])
            {
            }
            column(IntMontDate_6__1_; IntMontDate[6] [1])
            {
            }
            column(Employee__ESI_No_; "ESI No")
            {
            }
            column(Name; Name)
            {
            }
            column(Employee__ESI_Dispensary_; "ESI Dispensary")
            {
            }
            column(PaidDays1; PaidDays1)
            {
            }
            column(PaidDays2; PaidDays2)
            {
            }
            column(PaidDays3; PaidDays3)
            {
            }
            column(PaidDays4; PaidDays4)
            {
            }
            column(PaidDays5; PaidDays5)
            {
            }
            column(PaidDays6; PaidDays6)
            {
            }
            column(Wages1; Wages1)
            {
            }
            column(Payable1; Payable1)
            {
            }
            column(Payable2; Payable2)
            {
            }
            column(Wages2; Wages2)
            {
            }
            column(Wages3; Wages3)
            {
            }
            column(Payable3; Payable3)
            {
            }
            column(Wages4; Wages4)
            {
            }
            column(Payable4; Payable4)
            {
            }
            column(Wages5; Wages5)
            {
            }
            column(Payable5; Payable5)
            {
            }
            column(Wages6; Wages6)
            {
            }
            column(Payable6; Payable6)
            {
            }
            column(Employee__Department_Code_; "Department Code")
            {
            }
            column(DateofAppointment; DateofAppointment)
            {
            }
            column(Sl_Caption; Sl_CaptionLbl)
            {
            }
            column(No_Caption; No_CaptionLbl)
            {
            }
            column(Insur_Caption; Insur_CaptionLbl)
            {
            }
            column(No_Caption_Control71; No_Caption_Control71Lbl)
            {
            }
            column(anceCaption; anceCaptionLbl)
            {
            }
            column(Name_of_theCaption; Name_of_theCaptionLbl)
            {
            }
            column(Insured_PersonCaption; Insured_PersonCaptionLbl)
            {
            }
            column(in_block_letters_Caption; in_block_letters_CaptionLbl)
            {
            }
            column(V1Caption; V1CaptionLbl)
            {
            }
            column(V2Caption; V2CaptionLbl)
            {
            }
            column(V3Caption; V3CaptionLbl)
            {
            }
            column(Name_of_the__DispensaryCaption; Name_of_the__DispensaryCaptionLbl)
            {
            }
            column(Register_of_EmployeeesCaption; Register_of_EmployeeesCaptionLbl)
            {
            }
            column(Regulation_32_Caption; Regulation_32_CaptionLbl)
            {
            }
            column(V3_ACaption; V3_ACaptionLbl)
            {
            }
            column(FORM_7Caption; FORM_7CaptionLbl)
            {
            }
            column(OccupationCaption; OccupationCaptionLbl)
            {
            }
            column(V4Caption; V4CaptionLbl)
            {
            }
            column(DepartmentCaption; DepartmentCaptionLbl)
            {
            }
            column(and_shiftCaption; and_shiftCaptionLbl)
            {
            }
            column(if_anyCaption; if_anyCaptionLbl)
            {
            }
            column(V5Caption; V5CaptionLbl)
            {
            }
            column(If_appointedCaption; If_appointedCaptionLbl)
            {
            }
            column(ContributionCaption; ContributionCaptionLbl)
            {
            }
            column(during_the_Caption; during_the_CaptionLbl)
            {
            }
            column(Period__Caption; Period__CaptionLbl)
            {
            }
            column(appointmentCaption; appointmentCaptionLbl)
            {
            }
            column(Date_ofCaption; Date_ofCaptionLbl)
            {
            }
            column(FromCaption; FromCaptionLbl)
            {
            }
            column(Contribution_PeriodCaption; Contribution_PeriodCaptionLbl)
            {
            }
            column(V6Caption; V6CaptionLbl)
            {
            }
            column(toCaption; toCaptionLbl)
            {
            }
            column(No__ofCaption; No__ofCaptionLbl)
            {
            }
            column(days_forCaption; days_forCaptionLbl)
            {
            }
            column(which_Caption; which_CaptionLbl)
            {
            }
            column(wagesCaption; wagesCaptionLbl)
            {
            }
            column(paid__Caption; paid__CaptionLbl)
            {
            }
            column(payableCaption; payableCaptionLbl)
            {
            }
            column(V7Caption; V7CaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(amount_ofCaption; amount_ofCaptionLbl)
            {
            }
            column(wagesCaption_Control24; wagesCaption_Control24Lbl)
            {
            }
            column(paid__Caption_Control25; paid__Caption_Control25Lbl)
            {
            }
            column(payableCaption_Control26; payableCaption_Control26Lbl)
            {
            }
            column(V8Caption; V8CaptionLbl)
            {
            }
            column(Employee_sCaption; Employee_sCaptionLbl)
            {
            }
            column(share_ofCaption; share_ofCaptionLbl)
            {
            }
            column(contributionCaption_Control28; contributionCaption_Control28Lbl)
            {
            }
            column(V9Caption; V9CaptionLbl)
            {
            }
            column(No__ofCaption_Control29; No__ofCaption_Control29Lbl)
            {
            }
            column(days_forCaption_Control30; days_forCaption_Control30Lbl)
            {
            }
            column(which_Caption_Control31; which_Caption_Control31Lbl)
            {
            }
            column(wagesCaption_Control32; wagesCaption_Control32Lbl)
            {
            }
            column(paid__Caption_Control33; paid__Caption_Control33Lbl)
            {
            }
            column(payableCaption_Control34; payableCaption_Control34Lbl)
            {
            }
            column(V10Caption; V10CaptionLbl)
            {
            }
            column(paid__Caption_Control38; paid__Caption_Control38Lbl)
            {
            }
            column(wagesCaption_Control39; wagesCaption_Control39Lbl)
            {
            }
            column(amount_ofCaption_Control40; amount_ofCaption_Control40Lbl)
            {
            }
            column(TotalCaption_Control41; TotalCaption_Control41Lbl)
            {
            }
            column(payableCaption_Control37; payableCaption_Control37Lbl)
            {
            }
            column(V11Caption; V11CaptionLbl)
            {
            }
            column(contributionCaption_Control45; contributionCaption_Control45Lbl)
            {
            }
            column(share_ofCaption_Control46; share_ofCaption_Control46Lbl)
            {
            }
            column(Employee_sCaption_Control47; Employee_sCaption_Control47Lbl)
            {
            }
            column(V12Caption; V12CaptionLbl)
            {
            }
            column(No__ofCaption_Control48; No__ofCaption_Control48Lbl)
            {
            }
            column(days_forCaption_Control49; days_forCaption_Control49Lbl)
            {
            }
            column(which_Caption_Control50; which_Caption_Control50Lbl)
            {
            }
            column(wagesCaption_Control51; wagesCaption_Control51Lbl)
            {
            }
            column(paid__Caption_Control52; paid__Caption_Control52Lbl)
            {
            }
            column(payableCaption_Control53; payableCaption_Control53Lbl)
            {
            }
            column(V13Caption; V13CaptionLbl)
            {
            }
            column(paid__Caption_Control57; paid__Caption_Control57Lbl)
            {
            }
            column(wagesCaption_Control69; wagesCaption_Control69Lbl)
            {
            }
            column(amount_ofCaption_Control72; amount_ofCaption_Control72Lbl)
            {
            }
            column(TotalCaption_Control74; TotalCaption_Control74Lbl)
            {
            }
            column(payableCaption_Control56; payableCaption_Control56Lbl)
            {
            }
            column(V14Caption; V14CaptionLbl)
            {
            }
            column(contributionCaption_Control78; contributionCaption_Control78Lbl)
            {
            }
            column(share_ofCaption_Control79; share_ofCaption_Control79Lbl)
            {
            }
            column(Employee_sCaption_Control80; Employee_sCaption_Control80Lbl)
            {
            }
            column(V15Caption; V15CaptionLbl)
            {
            }
            column(No__ofCaption_Control82; No__ofCaption_Control82Lbl)
            {
            }
            column(days_forCaption_Control85; days_forCaption_Control85Lbl)
            {
            }
            column(which_Caption_Control86; which_Caption_Control86Lbl)
            {
            }
            column(wagesCaption_Control88; wagesCaption_Control88Lbl)
            {
            }
            column(paid__Caption_Control89; paid__Caption_Control89Lbl)
            {
            }
            column(payableCaption_Control90; payableCaption_Control90Lbl)
            {
            }
            column(V16Caption; V16CaptionLbl)
            {
            }
            column(payableCaption_Control94; payableCaption_Control94Lbl)
            {
            }
            column(paid__Caption_Control98; paid__Caption_Control98Lbl)
            {
            }
            column(wagesCaption_Control100; wagesCaption_Control100Lbl)
            {
            }
            column(amount_ofCaption_Control104; amount_ofCaption_Control104Lbl)
            {
            }
            column(TotalCaption_Control105; TotalCaption_Control105Lbl)
            {
            }
            column(V17Caption; V17CaptionLbl)
            {
            }
            column(contributionCaption_Control120; contributionCaption_Control120Lbl)
            {
            }
            column(share_ofCaption_Control125; share_ofCaption_Control125Lbl)
            {
            }
            column(Employee_sCaption_Control126; Employee_sCaption_Control126Lbl)
            {
            }
            column(V18Caption; V18CaptionLbl)
            {
            }
            column(No__ofCaption_Control127; No__ofCaption_Control127Lbl)
            {
            }
            column(days_forCaption_Control128; days_forCaption_Control128Lbl)
            {
            }
            column(which_Caption_Control129; which_Caption_Control129Lbl)
            {
            }
            column(wagesCaption_Control130; wagesCaption_Control130Lbl)
            {
            }
            column(paid__Caption_Control131; paid__Caption_Control131Lbl)
            {
            }
            column(payableCaption_Control132; payableCaption_Control132Lbl)
            {
            }
            column(V19Caption; V19CaptionLbl)
            {
            }
            column(payableCaption_Control135; payableCaption_Control135Lbl)
            {
            }
            column(paid__Caption_Control136; paid__Caption_Control136Lbl)
            {
            }
            column(wagesCaption_Control137; wagesCaption_Control137Lbl)
            {
            }
            column(amount_ofCaption_Control138; amount_ofCaption_Control138Lbl)
            {
            }
            column(TotalCaption_Control139; TotalCaption_Control139Lbl)
            {
            }
            column(V20Caption; V20CaptionLbl)
            {
            }
            column(contributionCaption_Control143; contributionCaption_Control143Lbl)
            {
            }
            column(share_ofCaption_Control144; share_ofCaption_Control144Lbl)
            {
            }
            column(Employee_sCaption_Control145; Employee_sCaption_Control145Lbl)
            {
            }
            column(V21Caption; V21CaptionLbl)
            {
            }
            column(No__ofCaption_Control151; No__ofCaption_Control151Lbl)
            {
            }
            column(days_forCaption_Control152; days_forCaption_Control152Lbl)
            {
            }
            column(which_Caption_Control153; which_Caption_Control153Lbl)
            {
            }
            column(wagesCaption_Control154; wagesCaption_Control154Lbl)
            {
            }
            column(paid__Caption_Control155; paid__Caption_Control155Lbl)
            {
            }
            column(payableCaption_Control156; payableCaption_Control156Lbl)
            {
            }
            column(V22Caption; V22CaptionLbl)
            {
            }
            column(payableCaption_Control160; payableCaption_Control160Lbl)
            {
            }
            column(paid__Caption_Control161; paid__Caption_Control161Lbl)
            {
            }
            column(wagesCaption_Control162; wagesCaption_Control162Lbl)
            {
            }
            column(amount_ofCaption_Control163; amount_ofCaption_Control163Lbl)
            {
            }
            column(TotalCaption_Control164; TotalCaption_Control164Lbl)
            {
            }
            column(V23Caption; V23CaptionLbl)
            {
            }
            column(contributionCaption_Control166; contributionCaption_Control166Lbl)
            {
            }
            column(share_ofCaption_Control167; share_ofCaption_Control167Lbl)
            {
            }
            column(Employee_sCaption_Control168; Employee_sCaption_Control168Lbl)
            {
            }
            column(V24Caption; V24CaptionLbl)
            {
            }
            column(Employee_No_; "No.")
            {
            }
            dataitem("Pay Employee Pay Details"; "Pay Employee Pay Details")
            {
                CalcFields = '';
                DataItemLink = Employee No=FIELD(No.);
                DataItemTableView = SORTING(Type);
            }
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

    trigger OnInitReport();
    begin
        slno := 0;
    end;

    trigger OnPreReport();
    begin
        "Pay Year".SETRANGE("Pay Year".ID, PAYYEARID);
        CTR := 1;
        STDATE := PAYYEAR."Year Start Date";
        ENDDATE := PAYYEAR."Year End Date";
        IF (STDATE = 0D) OR (ENDDATE = 0D) THEN
            ERROR(Text0001);
        WHILE STDATE <= ENDDATE DO BEGIN
            intMonth[CTR] [1] := FORMAT(STDATE, 0, '<Month Text>');
            IntMontDate[CTR] [1] := STDATE;
            STDATE := CALCDATE('+1M', STDATE);
            CTR := CTR + 1;
        END;
    end;

    var
        intMonth: array[7, 1] of Text[30];
        IntMontDate: array[7, 1] of Date;
        EmpPayDetails: Record "Pay Employee Pay Details";
        IntMonthStore: Integer;
        i: Integer;
        OptionHalf: Option " ","1","2";
        j: Integer;
        slno: Integer;
        NESIPayYearID: Integer;
        PAYYEAR: Record "Pay Year";
        STDATE: Date;
        ENDDATE: Date;
        CTR: Integer;
        PAYYEARID: Integer;
        Name: Text[50];
        PaidDays1: Integer;
        PaidDays2: Integer;
        PaidDays3: Integer;
        PaidDays4: Integer;
        PaidDays5: Integer;
        PaidDays6: Integer;
        Wages1: Integer;
        Wages2: Integer;
        Wages3: Integer;
        Wages4: Integer;
        Wages5: Integer;
        Wages6: Integer;
        Payable1: Integer;
        Payable2: Integer;
        Payable3: Integer;
        Payable4: Integer;
        Payable5: Integer;
        Payable6: Integer;
        VarDate: Date;
        Ok: Boolean;
        PaidDays: Decimal;
        SalSum: Decimal;
        PayableSum: Decimal;
        EmpPayYear: Record "Pay Year";
        DateofAppointment: Date;
        PayEmployee: Record Employee;
        PayCompPol: Record "Pay Company Policy";
        Text0001: Label 'No valid ESI Year has been choosen.';
        Sl_CaptionLbl: Label 'Sl.';
        No_CaptionLbl: Label 'No.';
        Insur_CaptionLbl: Label 'Insur-';
        No_Caption_Control71Lbl: Label 'No.';
        anceCaptionLbl: Label 'ance';
        Name_of_theCaptionLbl: Label 'Name of the';
        Insured_PersonCaptionLbl: Label 'Insured Person';
        in_block_letters_CaptionLbl: Label '(in block letters)';
        V1CaptionLbl: Label '1';
        V2CaptionLbl: Label '2';
        V3CaptionLbl: Label '3';
        Name_of_the__DispensaryCaptionLbl: Label 'Name of the  Dispensary';
        Register_of_EmployeeesCaptionLbl: Label 'Register of Employeees';
        Regulation_32_CaptionLbl: Label '(Regulation 32)';
        V3_ACaptionLbl: Label '3-A';
        FORM_7CaptionLbl: Label 'FORM 7';
        OccupationCaptionLbl: Label 'Occupation';
        V4CaptionLbl: Label '4';
        DepartmentCaptionLbl: Label 'Department';
        and_shiftCaptionLbl: Label 'and shift';
        if_anyCaptionLbl: Label 'if any';
        V5CaptionLbl: Label '5';
        If_appointedCaptionLbl: Label 'If appointed';
        ContributionCaptionLbl: Label 'Contribution';
        during_the_CaptionLbl: Label '"during the "';
        Period__CaptionLbl: Label '"Period, "';
        appointmentCaptionLbl: Label 'appointment';
        Date_ofCaptionLbl: Label 'Date of';
        FromCaptionLbl: Label 'From';
        Contribution_PeriodCaptionLbl: Label 'Contribution Period';
        V6CaptionLbl: Label '6';
        toCaptionLbl: Label 'to';
        No__ofCaptionLbl: Label 'No. of';
        days_forCaptionLbl: Label 'days for';
        which_CaptionLbl: Label '"which "';
        wagesCaptionLbl: Label 'wages';
        paid__CaptionLbl: Label 'paid /';
        payableCaptionLbl: Label 'payable';
        V7CaptionLbl: Label '7';
        TotalCaptionLbl: Label 'Total';
        amount_ofCaptionLbl: Label 'amount of';
        wagesCaption_Control24Lbl: Label 'wages';
        paid__Caption_Control25Lbl: Label 'paid /';
        payableCaption_Control26Lbl: Label 'payable';
        V8CaptionLbl: Label '8';
        Employee_sCaptionLbl: Label 'Employee''s';
        share_ofCaptionLbl: Label 'share of';
        contributionCaption_Control28Lbl: Label 'contribution';
        V9CaptionLbl: Label '9';
        No__ofCaption_Control29Lbl: Label 'No. of';
        days_forCaption_Control30Lbl: Label 'days for';
        which_Caption_Control31Lbl: Label '"which "';
        wagesCaption_Control32Lbl: Label 'wages';
        paid__Caption_Control33Lbl: Label 'paid /';
        payableCaption_Control34Lbl: Label 'payable';
        V10CaptionLbl: Label '10';
        paid__Caption_Control38Lbl: Label 'paid /';
        wagesCaption_Control39Lbl: Label 'wages';
        amount_ofCaption_Control40Lbl: Label 'amount of';
        TotalCaption_Control41Lbl: Label 'Total';
        payableCaption_Control37Lbl: Label 'payable';
        V11CaptionLbl: Label '11';
        contributionCaption_Control45Lbl: Label 'contribution';
        share_ofCaption_Control46Lbl: Label 'share of';
        Employee_sCaption_Control47Lbl: Label 'Employee''s';
        V12CaptionLbl: Label '12';
        No__ofCaption_Control48Lbl: Label 'No. of';
        days_forCaption_Control49Lbl: Label 'days for';
        which_Caption_Control50Lbl: Label '"which "';
        wagesCaption_Control51Lbl: Label 'wages';
        paid__Caption_Control52Lbl: Label 'paid /';
        payableCaption_Control53Lbl: Label 'payable';
        V13CaptionLbl: Label '13';
        paid__Caption_Control57Lbl: Label 'paid /';
        wagesCaption_Control69Lbl: Label 'wages';
        amount_ofCaption_Control72Lbl: Label 'amount of';
        TotalCaption_Control74Lbl: Label 'Total';
        payableCaption_Control56Lbl: Label 'payable';
        V14CaptionLbl: Label '14';
        contributionCaption_Control78Lbl: Label 'contribution';
        share_ofCaption_Control79Lbl: Label 'share of';
        Employee_sCaption_Control80Lbl: Label 'Employee''s';
        V15CaptionLbl: Label '15';
        No__ofCaption_Control82Lbl: Label 'No. of';
        days_forCaption_Control85Lbl: Label 'days for';
        which_Caption_Control86Lbl: Label '"which "';
        wagesCaption_Control88Lbl: Label 'wages';
        paid__Caption_Control89Lbl: Label 'paid /';
        payableCaption_Control90Lbl: Label 'payable';
        V16CaptionLbl: Label '16';
        payableCaption_Control94Lbl: Label 'payable';
        paid__Caption_Control98Lbl: Label 'paid /';
        wagesCaption_Control100Lbl: Label 'wages';
        amount_ofCaption_Control104Lbl: Label 'amount of';
        TotalCaption_Control105Lbl: Label 'Total';
        V17CaptionLbl: Label '17';
        contributionCaption_Control120Lbl: Label 'contribution';
        share_ofCaption_Control125Lbl: Label 'share of';
        Employee_sCaption_Control126Lbl: Label 'Employee''s';
        V18CaptionLbl: Label '18';
        No__ofCaption_Control127Lbl: Label 'No. of';
        days_forCaption_Control128Lbl: Label 'days for';
        which_Caption_Control129Lbl: Label '"which "';
        wagesCaption_Control130Lbl: Label 'wages';
        paid__Caption_Control131Lbl: Label 'paid /';
        payableCaption_Control132Lbl: Label 'payable';
        V19CaptionLbl: Label '19';
        payableCaption_Control135Lbl: Label 'payable';
        paid__Caption_Control136Lbl: Label 'paid /';
        wagesCaption_Control137Lbl: Label 'wages';
        amount_ofCaption_Control138Lbl: Label 'amount of';
        TotalCaption_Control139Lbl: Label 'Total';
        V20CaptionLbl: Label '20';
        contributionCaption_Control143Lbl: Label 'contribution';
        share_ofCaption_Control144Lbl: Label 'share of';
        Employee_sCaption_Control145Lbl: Label 'Employee''s';
        V21CaptionLbl: Label '21';
        No__ofCaption_Control151Lbl: Label 'No. of';
        days_forCaption_Control152Lbl: Label 'days for';
        which_Caption_Control153Lbl: Label '"which "';
        wagesCaption_Control154Lbl: Label 'wages';
        paid__Caption_Control155Lbl: Label 'paid /';
        payableCaption_Control156Lbl: Label 'payable';
        V22CaptionLbl: Label '22';
        payableCaption_Control160Lbl: Label 'payable';
        paid__Caption_Control161Lbl: Label 'paid /';
        wagesCaption_Control162Lbl: Label 'wages';
        amount_ofCaption_Control163Lbl: Label 'amount of';
        TotalCaption_Control164Lbl: Label 'Total';
        V23CaptionLbl: Label '23';
        contributionCaption_Control166Lbl: Label 'contribution';
        share_ofCaption_Control167Lbl: Label 'share of';
        Employee_sCaption_Control168Lbl: Label 'Employee''s';
        V24CaptionLbl: Label '24';
}

