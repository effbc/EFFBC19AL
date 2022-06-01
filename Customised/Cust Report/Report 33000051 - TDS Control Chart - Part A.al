report 33000051 "TDS Control Chart - Part A"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './TDS Control Chart - Part A.rdlc';
    Caption = 'TDS Control Chart - Part A';

    dataset
    {
        dataitem("Pay Company Policy"; "Pay Company Policy")
        {
            DataItemTableView = SORTING(Primary Key);
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            column(USERID; USERID)
            {
            }
            column(FORMAT_StDate____________FORMAT_EndDate_; FORMAT(StDate) + ' - ' + FORMAT(EndDate))
            {
            }
            column(CoName; CoName)
            {
            }
            column(CoAdd; CoAdd)
            {
            }
            column(CoAdd2; CoAdd2)
            {
            }
            column(CoCity; CoCity)
            {
            }
            column(CoPostCode; CoPostCode)
            {
            }
            column(OffDesignation; OffDesignation)
            {
            }
            column(FillingDate; FillingDate)
            {
            }
            column(MediumType; MediumType)
            {
            }
            column(MediumTypeUnits; MediumTypeUnits)
            {
            }
            column(NoOfEmp; NoOfEmp)
            {
            }
            column(CoTAN; CoTAN)
            {
            }
            column(Control_Chart_For_Bulk_ReturnCaption; Control_Chart_For_Bulk_ReturnCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Assesment_YearCaption; Assesment_YearCaptionLbl)
            {
            }
            column(Part_A___Particulars_of_eligible_employer_DDOCaption; Part_A___Particulars_of_eligible_employer_DDOCaptionLbl)
            {
            }
            column(TAN_number_allotted_to_the_employer_DDOCaption; TAN_number_allotted_to_the_employer_DDOCaptionLbl)
            {
            }
            column(Name_of_the_employer_DDOCaption; Name_of_the_employer_DDOCaptionLbl)
            {
            }
            column(V1_Caption; V1_CaptionLbl)
            {
            }
            column(Name_and_address_of_the_DDOCaption; Name_and_address_of_the_DDOCaptionLbl)
            {
            }
            column(Area_LocalityCaption; Area_LocalityCaptionLbl)
            {
            }
            column(StreetCaption; StreetCaptionLbl)
            {
            }
            column(CityCaption; CityCaptionLbl)
            {
            }
            column(PINCaption; PINCaptionLbl)
            {
            }
            column(V2_Caption; V2_CaptionLbl)
            {
            }
            column(Address_of_the_employer_DDO_for_correspondenceCaption; Address_of_the_employer_DDO_for_correspondenceCaptionLbl)
            {
            }
            column(V3_Caption; V3_CaptionLbl)
            {
            }
            column(Designation_of_Assessing_Officer_before_whom_Annual_TDS_return__FORM_24__is_filedCaption; Designation_of_Assessing_Officer_before_whom_Annual_TDS_return__FORM_24__is_filedCaptionLbl)
            {
            }
            column(V4_Caption; V4_CaptionLbl)
            {
            }
            column(Date_of_filling_FORM_24_for_the_F_YCaption; Date_of_filling_FORM_24_for_the_F_YCaptionLbl)
            {
            }
            column(No__of_employees_for_whom_the_bulk_return_is_being_furnishedCaption; No__of_employees_for_whom_the_bulk_return_is_being_furnishedCaptionLbl)
            {
            }
            column(Name_of_the_specified_cityCaption; Name_of_the_specified_cityCaptionLbl)
            {
            }
            column(Type_of_computer_readable_medium_used_for_Bulk_ReturnCaption; Type_of_computer_readable_medium_used_for_Bulk_ReturnCaptionLbl)
            {
            }
            column(No__of_units_of_computer_readable_medium_usedCaption; No__of_units_of_computer_readable_medium_usedCaptionLbl)
            {
            }
            column(V5_Caption; V5_CaptionLbl)
            {
            }
            column(V6_Caption; V6_CaptionLbl)
            {
            }
            column(V7_Caption; V7_CaptionLbl)
            {
            }
            column(V8_Caption; V8_CaptionLbl)
            {
            }
            column(V9_Caption; V9_CaptionLbl)
            {
            }
            column(Area_LocalityCaption_Control22; Area_LocalityCaption_Control22Lbl)
            {
            }
            column(StreetCaption_Control23; StreetCaption_Control23Lbl)
            {
            }
            column(CityCaption_Control24; CityCaption_Control24Lbl)
            {
            }
            column(PINCaption_Control25; PINCaption_Control25Lbl)
            {
            }
            column(Pay_Company_Policy_Primary_Key; "Primary Key")
            {
            }

            trigger OnPreDataItem();
            begin
                LastFieldNo := FIELDNO("Primary Key");
                PayTaxPolicy.GET(PAYYEARID);
                PayPayrollEmployee.RESET;
                PayPayrollEmployee.SETFILTER("Consent For Bulk Return", 'Yes');
                PayPayrollEmployee.SETFILTER("PAN No", '<>%1', '');
                IF PayPayrollEmployee.COUNT < PayTaxPolicy."Min. of emp for bulk return" THEN
                    ERROR(Text0002)
                ELSE
                    NoOfEmp := PayPayrollEmployee.COUNT;
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

    trigger OnPreReport();
    begin
        CompanyInformation.GET;
    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        CompanyInformation: Record "Company Information";
        PAYYEARID: Integer;
        StDate: Date;
        EndDate: Date;
        PayYear: Record "Pay Year";
        OffDesignation: Text[30];
        FillingDate: Date;
        MediumType: Text[30];
        MediumTypeUnits: Integer;
        PayPayrollEmployee: Record Employee;
        NoOfEmp: Integer;
        Text0001: Label 'Please setup assessment year';
        Text0002: Label 'No of employees is less than minimum no of employees';
        CoName: Text[30];
        CoAdd: Text[30];
        CoAdd2: Text[30];
        CoCity: Text[30];
        CoPostCode: Text[30];
        CoTAN: Text[30];
        PayBranchPolicyLineNo: Integer;
        BranchCode: Code[10];
        PayTaxPolicy: Record "Pay Tax Policy";
        Control_Chart_For_Bulk_ReturnCaptionLbl: Label 'Control Chart For Bulk Return';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Assesment_YearCaptionLbl: Label 'Assesment Year';
        Part_A___Particulars_of_eligible_employer_DDOCaptionLbl: Label 'Part A - Particulars of eligible employer/DDO';
        TAN_number_allotted_to_the_employer_DDOCaptionLbl: Label 'TAN number allotted to the employer/DDO';
        Name_of_the_employer_DDOCaptionLbl: Label 'Name of the employer/DDO';
        V1_CaptionLbl: Label '1.';
        Name_and_address_of_the_DDOCaptionLbl: Label 'Name and address of the DDO';
        Area_LocalityCaptionLbl: Label 'Area/Locality';
        StreetCaptionLbl: Label 'Street';
        CityCaptionLbl: Label 'City';
        PINCaptionLbl: Label 'PIN';
        V2_CaptionLbl: Label '2.';
        Address_of_the_employer_DDO_for_correspondenceCaptionLbl: Label 'Address of the employer/DDO for correspondence';
        V3_CaptionLbl: Label '3.';
        Designation_of_Assessing_Officer_before_whom_Annual_TDS_return__FORM_24__is_filedCaptionLbl: Label 'Designation of Assessing Officer before whom Annual TDS return (FORM 24) is filed';
        V4_CaptionLbl: Label '4.';
        Date_of_filling_FORM_24_for_the_F_YCaptionLbl: Label 'Date of filling FORM 24 for the F.Y';
        No__of_employees_for_whom_the_bulk_return_is_being_furnishedCaptionLbl: Label 'No. of employees for whom the bulk return is being furnished';
        Name_of_the_specified_cityCaptionLbl: Label 'Name of the specified city';
        Type_of_computer_readable_medium_used_for_Bulk_ReturnCaptionLbl: Label 'Type of computer readable medium used for Bulk Return';
        No__of_units_of_computer_readable_medium_usedCaptionLbl: Label 'No. of units of computer readable medium used';
        V5_CaptionLbl: Label '5.';
        V6_CaptionLbl: Label '6.';
        V7_CaptionLbl: Label '7.';
        V8_CaptionLbl: Label '8.';
        V9_CaptionLbl: Label '9.';
        Area_LocalityCaption_Control22Lbl: Label 'Area/Locality';
        StreetCaption_Control23Lbl: Label 'Street';
        CityCaption_Control24Lbl: Label 'City';
        PINCaption_Control25Lbl: Label 'PIN';
}

