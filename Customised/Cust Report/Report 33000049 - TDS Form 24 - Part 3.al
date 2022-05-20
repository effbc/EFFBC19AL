report 33000049 "TDS Form 24 - Part 3"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './TDS Form 24 - Part 3.rdlc';

    dataset
    {
        dataitem("Pay Company Policy";"Pay Company Policy")
        {
            column(V7_Caption;V7_CaptionLbl)
            {
            }
            column(Details_of_tax_deducted_and_paid_to_the_credit_of_the_Central_GovermentCaption;Details_of_tax_deducted_and_paid_to_the_credit_of_the_Central_GovermentCaptionLbl)
            {
            }
            column(a_Caption;a_CaptionLbl)
            {
            }
            column(Gy_or_on_behalf_of_Central_GovermentCaption;Gy_or_on_behalf_of_Central_GovermentCaptionLbl)
            {
            }
            column(V8_Caption;V8_CaptionLbl)
            {
            }
            column(I_certify_that__Caption;I_certify_that__CaptionLbl)
            {
            }
            column(i_Caption;i_CaptionLbl)
            {
            }
            column(the_above_return_consists_of_Caption;the_above_return_consists_of_CaptionLbl)
            {
            }
            column(Pages_serially_numbered_from_Caption;Pages_serially_numbered_from_CaptionLbl)
            {
            }
            column(toCaption;toCaptionLbl)
            {
            }
            column(And_furnishes_the_prescribed_particulars_in_respect_of_Caption;And_furnishes_the_prescribed_particulars_in_respect_of_CaptionLbl)
            {
            }
            column(given_number__employees_Caption;given_number__employees_CaptionLbl)
            {
            }
            column(ii_Caption;ii_CaptionLbl)
            {
            }
            column(the_above_return_contains_complete_details_of_total_amount_chargeable_under_the_head__Salaries__paid_byCaption;the_above_return_contains_complete_details_of_total_amount_chargeable_under_the_head__Salaries__paid_byCaptionLbl)
            {
            }
            column(to_all_persons_whose_income_for_the_year_under_the_head__Salaries__exceeded_the_maximum_amountCaption;to_all_persons_whose_income_for_the_year_under_the_head__Salaries__exceeded_the_maximum_amountCaptionLbl)
            {
            }
            column(which_is_not_taxable_under_the_Finance_Act_of_the_year_Caption;which_is_not_taxable_under_the_Finance_Act_of_the_year_CaptionLbl)
            {
            }
            column(iii_Caption;iii_CaptionLbl)
            {
            }
            column(DataItem18;the_amount_of_tax_shown_in_column_28_has_been_paid_to_the_credit_of_Central_Goverment_vide_particulars_given_in_item_number_6Lbl)
            {
            }
            column(iv_Caption;iv_CaptionLbl)
            {
            }
            column(aall_the_particulars_furnished_in_the_return_and_the_Anexure_are_correct_Caption;aall_the_particulars_furnished_in_the_return_and_the_Anexure_are_correct_CaptionLbl)
            {
            }
            column(Place__Caption;Place__CaptionLbl)
            {
            }
            column(Date__Caption;Date__CaptionLbl)
            {
            }
            column(Name_and_signature_of_the_employer_person_responsible_for_paying_salaryCaption;Name_and_signature_of_the_employer_person_responsible_for_paying_salaryCaptionLbl)
            {
            }
            column(DesignationCaption;DesignationCaptionLbl)
            {
            }
            column(b_Caption;b_CaptionLbl)
            {
            }
            column(By_person_responsible_for_paying_other_than_Central_GovermentCaption;By_person_responsible_for_paying_other_than_Central_GovermentCaptionLbl)
            {
            }
            column(S__No_Caption;S__No_CaptionLbl)
            {
            }
            column(Amount_deductedCaption;Amount_deductedCaptionLbl)
            {
            }
            column(Transfer_Voucher_No_Caption;Transfer_Voucher_No_CaptionLbl)
            {
            }
            column(Date_of_Transfer_VoucherCaption;Date_of_Transfer_VoucherCaptionLbl)
            {
            }
            column(Date_of_Transfer_VoucherCaption_Control33;Date_of_Transfer_VoucherCaption_Control33Lbl)
            {
            }
            column(S__No_Caption_Control34;S__No_Caption_Control34Lbl)
            {
            }
            column(Amount_deductedCaption_Control35;Amount_deductedCaption_Control35Lbl)
            {
            }
            column(Transfer_Voucher_No_Caption_Control36;Transfer_Voucher_No_Caption_Control36Lbl)
            {
            }
            column(Name_and_address_of_the_bankCaption;Name_and_address_of_the_bankCaptionLbl)
            {
            }
            column(Total_Caption;Total_CaptionLbl)
            {
            }
            column(Total_Caption_Control44;Total_Caption_Control44Lbl)
            {
            }
            column(Pay_Company_Policy_Primary_Key;"Primary Key")
            {
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

    var
        V7_CaptionLbl : Label '7.';
        Details_of_tax_deducted_and_paid_to_the_credit_of_the_Central_GovermentCaptionLbl : Label 'Details of tax deducted and paid to the credit of the Central Goverment';
        a_CaptionLbl : Label '(a)';
        Gy_or_on_behalf_of_Central_GovermentCaptionLbl : Label 'Gy or on behalf of Central Goverment';
        V8_CaptionLbl : Label '8.';
        I_certify_that__CaptionLbl : Label 'I certify that :';
        i_CaptionLbl : Label '(i)';
        the_above_return_consists_of_CaptionLbl : Label '"the above return consists of "';
        Pages_serially_numbered_from_CaptionLbl : Label '"Pages serially numbered from "';
        toCaptionLbl : Label 'to';
        And_furnishes_the_prescribed_particulars_in_respect_of_CaptionLbl : Label '"And furnishes the prescribed particulars in respect of "';
        given_number__employees_CaptionLbl : Label '(given number) employees.';
        ii_CaptionLbl : Label '(ii)';
        the_above_return_contains_complete_details_of_total_amount_chargeable_under_the_head__Salaries__paid_byCaptionLbl : Label 'the above return contains complete details of total amount chargeable under the head "Salaries" paid by';
        to_all_persons_whose_income_for_the_year_under_the_head__Salaries__exceeded_the_maximum_amountCaptionLbl : Label 'to all persons whose income for the year under the head "Salaries" exceeded the maximum amount';
        which_is_not_taxable_under_the_Finance_Act_of_the_year_CaptionLbl : Label '" which is not taxable under the Finance Act of the year."';
        iii_CaptionLbl : Label '(iii)';
        the_amount_of_tax_shown_in_column_28_has_been_paid_to_the_credit_of_Central_Goverment_vide_particulars_given_in_item_number_6Lbl : Label 'the amount of tax shown in column 28 has been paid to the credit of Central Goverment vide particulars given in item number 6 above.';
        iv_CaptionLbl : Label '(iv)';
        aall_the_particulars_furnished_in_the_return_and_the_Anexure_are_correct_CaptionLbl : Label 'aall the particulars furnished in the return and the Anexure are correct.';
        Place__CaptionLbl : Label 'Place :';
        Date__CaptionLbl : Label 'Date :';
        Name_and_signature_of_the_employer_person_responsible_for_paying_salaryCaptionLbl : Label 'Name and signature of the employer/person responsible for paying salary';
        DesignationCaptionLbl : Label 'Designation';
        b_CaptionLbl : Label '(b)';
        By_person_responsible_for_paying_other_than_Central_GovermentCaptionLbl : Label 'By person responsible for paying other than Central Goverment';
        S__No_CaptionLbl : Label 'S. No.';
        Amount_deductedCaptionLbl : Label 'Amount deducted';
        Transfer_Voucher_No_CaptionLbl : Label 'Transfer Voucher No.';
        Date_of_Transfer_VoucherCaptionLbl : Label 'Date of Transfer Voucher';
        Date_of_Transfer_VoucherCaption_Control33Lbl : Label 'Date of Transfer Voucher';
        S__No_Caption_Control34Lbl : Label 'S. No.';
        Amount_deductedCaption_Control35Lbl : Label 'Amount deducted';
        Transfer_Voucher_No_Caption_Control36Lbl : Label 'Transfer Voucher No.';
        Name_and_address_of_the_bankCaptionLbl : Label 'Name and address of the bank';
        Total_CaptionLbl : Label '"Total "';
        Total_Caption_Control44Lbl : Label '"Total "';
}

