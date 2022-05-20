report 33000037 "Pay Revision"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './Pay Revision.rdlc';

    dataset
    {
        dataitem("Pay General Journal Line";"Pay General Journal Line")
        {
            DataItemTableView = SORTING(Employee No,Pay Element Code,Pay Journal Batch,Document No,Pay Journal Template);
            RequestFilterFields = "Employee No","Pay Element Code","Pay Journal Batch","Document No","Pay Journal Template";
            column(FORMAT_TODAY_0_4_;FORMAT(TODAY,0,4))
            {
            }
            column(COMPANYNAME;COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO;CurrReport.PAGENO)
            {
            }
            column(USERID;USERID)
            {
            }
            column(Pay_General_Journal_Line__Pay_Journal_Batch_;"Pay Journal Batch")
            {
            }
            column(Pay_General_Journal_Line__Document_No_;"Document No")
            {
            }
            column(Pay_General_Journal_Line__Department_Code_;"Department Code")
            {
            }
            column(Pay_General_Journal_Line_Grade;Grade)
            {
            }
            column(Pay_General_Journal_Line__Employee_No_;"Employee No")
            {
            }
            column(Pay_General_Journal_Line__Pay_Journal_Template_;"Pay Journal Template")
            {
            }
            column(Pay_General_Journal_Line__Employee_No__Control1000000008;"Employee No")
            {
            }
            column(Pay_General_Journal_Line__Pay_Element_Code_;"Pay Element Code")
            {
            }
            column(Pay_General_Journal_Line__Pay_Structure_Date_;"Pay Structure Date")
            {
            }
            column(Pay_General_Journal_Line__Effective_Date_;"Effective Date")
            {
            }
            column(Pay_General_Journal_Line_Amount;Amount)
            {
            }
            column(Pay_General_Journal_Line__Revised_Amount_;"Revised Amount")
            {
            }
            column(Pay_General_Journal_Line_Arrear;Arrear)
            {
            }
            column(Pay_General_Journal_LineCaption;Pay_General_Journal_LineCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Pay_General_Journal_Line__Employee_No__Control1000000008Caption;FIELDCAPTION("Employee No"))
            {
            }
            column(Pay_Element_CodeCaption;Pay_Element_CodeCaptionLbl)
            {
            }
            column(Pay_Structure_DateCaption;Pay_Structure_DateCaptionLbl)
            {
            }
            column(Effective_DateCaption;Effective_DateCaptionLbl)
            {
            }
            column(AmountCaption;AmountCaptionLbl)
            {
            }
            column(Revised_AmountCaption;Revised_AmountCaptionLbl)
            {
            }
            column(ArrearCaption;ArrearCaptionLbl)
            {
            }
            column(Batch_NameCaption;Batch_NameCaptionLbl)
            {
            }
            column(Document_NoCaption;Document_NoCaptionLbl)
            {
            }
            column(Department_CodeCaption;Department_CodeCaptionLbl)
            {
            }
            column(Employee_NoCaption;Employee_NoCaptionLbl)
            {
            }
            column(GradeCaption;GradeCaptionLbl)
            {
            }
            column(Template_No_Caption;Template_No_CaptionLbl)
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
        Pay_General_Journal_LineCaptionLbl : Label 'Pay General Journal Line';
        CurrReport_PAGENOCaptionLbl : Label 'Page';
        Pay_Element_CodeCaptionLbl : Label 'Pay Element Code';
        Pay_Structure_DateCaptionLbl : Label 'Pay Structure Date';
        Effective_DateCaptionLbl : Label 'Effective Date';
        AmountCaptionLbl : Label 'Amount';
        Revised_AmountCaptionLbl : Label 'Revised Amount';
        ArrearCaptionLbl : Label 'Arrear';
        Batch_NameCaptionLbl : Label 'Batch Name';
        Document_NoCaptionLbl : Label 'Document No';
        Department_CodeCaptionLbl : Label 'Department Code';
        Employee_NoCaptionLbl : Label 'Employee No';
        GradeCaptionLbl : Label 'Grade';
        Template_No_CaptionLbl : Label 'Template No.';
}

