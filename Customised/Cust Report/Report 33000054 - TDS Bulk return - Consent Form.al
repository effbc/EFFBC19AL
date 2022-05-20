report 33000054 "TDS Bulk return - Consent Form"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './TDS Bulk return - Consent Form.rdlc';

    dataset
    {
        dataitem(Employee;Employee)
        {
            DataItemTableView = SORTING(No.) WHERE(Consent For Bulk Return=CONST(Yes),Consent For ECS=CONST(Yes));
            column(Employee__First_Name__________Employee__Last_Name_______;'(' + Employee."First Name" + ' ' + Employee."Last Name" + ')')
            {
            }
            column(Line6;Line6)
            {
            }
            column(Line5;Line5)
            {
            }
            column(Line4;Line4)
            {
            }
            column(Line3;Line3)
            {
            }
            column(Line2;Line2)
            {
            }
            column(Line1;Line1)
            {
            }
            column(Name_and_signature_of_the_assesseCaption;Name_and_signature_of_the_assesseCaptionLbl)
            {
            }
            column(above_return_from_Income_tax_Department_on_my_behalfCaption;above_return_from_Income_tax_Department_on_my_behalfCaptionLbl)
            {
            }
            column(V2__I_also_authorize_my_above_employer_DDO_toreceive_any_intimation_letter__challan__notice_etc__in_respect_of_Caption;V2__I_also_authorize_my_above_employer_DDO_toreceive_any_intimation_letter__challan__notice_etc__in_respect_of_CaptionLbl)
            {
            }
            column(designated_Assessing_Officer_under_the_scheme_for_Bulk_Filling_of_Returns_by_Salaried_Employees__2002Caption;designated_Assessing_Officer_under_the_scheme_for_Bulk_Filling_of_Returns_by_Salaried_Employees__2002CaptionLbl)
            {
            }
            column(employer_DDO__to_furnish_my_return_of_income_for_the_Assessment_Year___Caption;employer_DDO__to_furnish_my_return_of_income_for_the_Assessment_Year___CaptionLbl)
            {
            }
            column(Place_Caption;Place_CaptionLbl)
            {
            }
            column(Date_Caption;Date_CaptionLbl)
            {
            }
            column(V1__I__Caption;V1__I__CaptionLbl)
            {
            }
            column(Consent_FormCaption;Consent_FormCaptionLbl)
            {
            }
            column(Employee_No_;"No.")
            {
            }

            trigger OnAfterGetRecord();
            begin

                  NoOfEmp := Employee.COUNT;
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

    trigger OnPostReport();
    begin
        IF PayTaxPolicy.GET(PayYearID) THEN
              BEGIN
               IF NoOfEmp < PayTaxPolicy."Min. of emp for bulk return" THEN
                  ERROR(Text0002);
              END
           ELSE
              ERROR(Text0003);
    end;

    trigger OnPreReport();
    begin
        Slno := 0;
        CompanyInformation.GET;
        Employee.SETFILTER("Consent For Bulk Return",'Yes');
        Employee.SETFILTER("Consent For ECS",'Yes');
        Employee.SETFILTER("PAN No",'<>%1','');
        Employee.SETFILTER("Leave Date",'>%1|%2',CALCDATE('-1Y',StDate),0D);
        Employee.SETFILTER("Employment Date",'<%1',CALCDATE('-1Y',EndDate));
        IF NOT Employee.FIND('-') THEN
          ERROR(Text0004);
    end;

    var
        Text0001 : Label 'Please setup assessment year';
        Text0002 : Label 'Less than min. required employees';
        Text0003 : Label 'Please setup tax policy';
        PayYear : Record "Pay Year";
        PayYearID : Integer;
        StDate : Date;
        EndDate : Date;
        EmpName : Text[250];
        Line1 : Text[250];
        Line2 : Text[250];
        Line3 : Text[250];
        Line4 : Text[250];
        Line5 : Text[250];
        Line6 : Text[250];
        CompanyInformation : Record "Company Information";
        PayCompanyPolicy : Record "Pay Company Policy";
        PayTaxPolicy : Record "Pay Tax Policy";
        NoOfEmp : Integer;
        Slno : Integer;
        Text0004 : Label 'No Records';
        Name_and_signature_of_the_assesseCaptionLbl : Label 'Name and signature of the assesse';
        above_return_from_Income_tax_Department_on_my_behalfCaptionLbl : Label 'above return from Income-tax Department on my behalf';
        V2__I_also_authorize_my_above_employer_DDO_toreceive_any_intimation_letter__challan__notice_etc__in_respect_of_CaptionLbl : Label '"2. I also authorize my above employer/DDO toreceive any intimation letter, challan, notice etc. in respect of "';
        designated_Assessing_Officer_under_the_scheme_for_Bulk_Filling_of_Returns_by_Salaried_Employees__2002CaptionLbl : Label 'designated Assessing Officer under the scheme for Bulk Filling of Returns by Salaried Employees, 2002';
        employer_DDO__to_furnish_my_return_of_income_for_the_Assessment_Year___CaptionLbl : Label '"employer/DDO, to furnish my return of income for the Assessment Year ( "';
        Place_CaptionLbl : Label 'Place:';
        Date_CaptionLbl : Label 'Date:';
        V1__I__CaptionLbl : Label '1. I (';
        Consent_FormCaptionLbl : Label 'Consent Form';
}

