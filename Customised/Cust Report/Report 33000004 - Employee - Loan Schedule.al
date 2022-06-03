report 33000004 "Employee - Loan Schedule"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './Employee - Loan Schedule.rdlc';

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = SORTING(No.);
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";
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
            column(Employee_TABLECAPTION___________EmpFilter; Employee.TABLECAPTION + ' : ' + EmpFilter)
            {
            }
            column(Employee__No__; "No.")
            {
            }
            column(Title__________First_Name___________Last_Name_; Title + ' ' + "First Name" + ' ' + "Last Name")
            {
            }
            column(Employee__Department_Code_; "Department Code")
            {
            }
            column(Employee__Job_Title_Grade_; "Job Title/Grade")
            {
            }
            column(Employee___Loan_ScheduleCaption; Employee___Loan_ScheduleCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(No_Caption; No_CaptionLbl)
            {
            }
            column(NameCaption; NameCaptionLbl)
            {
            }
            column(Employee__Department_Code_Caption; FIELDCAPTION("Department Code"))
            {
            }
            column(Employee__Job_Title_Grade_Caption; FIELDCAPTION("Job Title/Grade"))
            {
            }
            column(DateCaption; DateCaptionLbl)
            {
            }
            column(Pay_Employee_Loan_Detail__Loan_Amount_Caption; "Pay Employee Loan Detail".FIELDCAPTION("Loan Amount"))
            {
            }
            column(Pay_Employee_Loan_Detail__Installment_Amount_Caption; "Pay Employee Loan Detail".FIELDCAPTION("Installment Amount"))
            {
            }
            column(Pay_Employee_Loan_Detail_InterestCaption; "Pay Employee Loan Detail".FIELDCAPTION(Interest))
            {
            }
            column(RepaymentCaption; RepaymentCaptionLbl)
            {
            }
            dataitem("Pay Employee Loan"; "Pay Employee Loan")
            {
                DataItemLink = Employee No.=FIELD(No.);
                DataItemTableView = SORTING(Employee No., Type, Code, Line No.);
                PrintOnlyIfDetail = true;
                column(Pay_Employee_Loan_Code; Code)
                {
                }
                column(Loan_CodeCaption; Loan_CodeCaptionLbl)
                {
                }
                column(Pay_Employee_Loan_Employee_No_; "Employee No.")
                {
                }
                column(Pay_Employee_Loan_Type; Type)
                {
                }
                column(Pay_Employee_Loan_Line_No_; "Line No.")
                {
                }
                dataitem("Pay Employee Loan Detail"; "Pay Employee Loan Detail")
                {
                    DataItemLink = Employee No.=FIELD(Employee No.),Code=FIELD(Code);
                    DataItemTableView = SORTING(Employee No.,Type,Code,Pay Date,Line No.);
                    column(Pay_Employee_Loan_Detail__Pay_Date_;"Pay Date")
                    {
                    }
                    column(Pay_Employee_Loan_Detail__Installment_Amount_;"Installment Amount")
                    {
                    }
                    column(Pay_Employee_Loan_Detail__Loan_Amount_;"Loan Amount")
                    {
                    }
                    column(Pay_Employee_Loan_Detail_Interest;Interest)
                    {
                    }
                    column(Pay_Employee_Loan_Detail__Principal_Repayment_;"Principal Repayment")
                    {
                    }
                    column(Pay_Employee_Loan_Detail_Employee_No_;"Employee No.")
                    {
                    }
                    column(Pay_Employee_Loan_Detail_Type;Type)
                    {
                    }
                    column(Pay_Employee_Loan_Detail_Code;Code)
                    {
                    }
                    column(Pay_Employee_Loan_Detail_Line_No_;"Line No.")
                    {
                    }

                    trigger OnPreDataItem();
                    begin
                        "Pay Employee Loan Detail".RESET;
                        "Pay Employee Loan Detail".SETRANGE("Pay Employee Loan Detail"."Employee No.",Employee."No.");
                        "Pay Employee Loan Detail".SETRANGE("Pay Employee Loan Detail".Code,"Pay Employee Loan".Code);
                    end;
                }
                dataitem("Pay Employee Loan Repayment";"Pay Employee Loan Repayment")
                {
                    DataItemLink = Employee No.=FIELD(Employee No.),Loan code=FIELD(Code);
                    DataItemTableView = SORTING(Employee No.,EntryNo);
                    column(Pay_Employee_Loan_Repayment__Repayment_Date_;"Repayment Date")
                    {
                    }
                    column(Pay_Employee_Loan_Repayment__Repayment_Amount_;"Repayment Amount")
                    {
                    }
                    column(DateCaption_Control1000000029;DateCaption_Control1000000029Lbl)
                    {
                    }
                    column(AmountCaption;AmountCaptionLbl)
                    {
                    }
                    column(RepaymentCaption_Control1000000032;RepaymentCaption_Control1000000032Lbl)
                    {
                    }
                    column(Pay_Employee_Loan_Repayment_Employee_No_;"Employee No.")
                    {
                    }
                    column(Pay_Employee_Loan_Repayment_EntryNo;EntryNo)
                    {
                    }
                    column(Pay_Employee_Loan_Repayment_Loan_code;"Loan code")
                    {
                    }
                }

                trigger OnPreDataItem();
                begin
                    "Pay Employee Loan".RESET;
                    "Pay Employee Loan".SETRANGE("Pay Employee Loan"."Employee No.",Employee."No.");
                end;
            }

            trigger OnPreDataItem();
            begin
                LastFieldNo := FIELDNO("No.");
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
        EmpFilter:= Employee.GETFILTERS;
    end;

    var
        LastFieldNo : Integer;
        FooterPrinted : Boolean;
        EmpFilter : Text[250];
        Employee___Loan_ScheduleCaptionLbl : Label 'Employee - Loan Schedule';
        CurrReport_PAGENOCaptionLbl : Label 'Page';
        No_CaptionLbl : Label 'No.';
        NameCaptionLbl : Label 'Name';
        DateCaptionLbl : Label 'Date';
        RepaymentCaptionLbl : Label 'Repayment';
        Loan_CodeCaptionLbl : Label 'Loan Code';
        DateCaption_Control1000000029Lbl : Label 'Date';
        AmountCaptionLbl : Label 'Amount';
        RepaymentCaption_Control1000000032Lbl : Label 'Repayment';
}

