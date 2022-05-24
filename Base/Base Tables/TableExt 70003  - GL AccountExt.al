tableextension 70003 GLAccoountExt extends "G/L Account"
{


    fields
    {

      
    
        field(60001; "Cash Account"; Boolean)
        {
            Description = 'B2B';
        }
        field(60002; "TDS Account"; Boolean)
        {
            Description = 'B2B';
        }
        field(60003; "Work Tax Account"; Boolean)
        {
            Description = 'B2B';
        }
        field(60004; "Excise Prod. Posting Group2"; Code[10])
        {
            TableRelation = "Excise Prod. Posting Group".Code;
        }
        field(60005; "Excise Accounting Type"; Option)
        {
            OptionCaption = 'With CENTVAT,Without CENTVAT';
            OptionMembers = "With CENTVAT","Without CENTVAT";
        }
        field(60006; "PL Minor Head"; Text[60])
        {
        }
        field(60007; "PL Minor Head SNO"; Integer)
        {
        }
        field(60008; "PL IncomeType"; Text[30])
        {
        }
        field(60009; "PL IncomeType Sort"; Integer)
        {
        }
        field(60010; "PL Income Type Summary"; Text[30])
        {
        }
        field(60011; "PL Income Expenditure"; Text[30])
        {
        }
        field(60012; "PL Head"; Boolean)
        {

            trigger OnValidate();
            begin
                Reflected_in_pl_datetime := CurrentDateTime;
                Reflected_in_pl_userid := UserId;
            end;
        }
        field(60013; EntryType; Option)
        {
            OptionCaption = ',JounalVoucher,Purchase Inovice,Purchase Invocie/Journal voucher,Not Required,Payment Voucher';
            OptionMembers = ,JounalVoucher,"Purchase Inovice","Purchase Invocie/Journal voucher","Not Required","Payment Voucher";
        }
        field(60014; Created_Date_time; Date)
        {
            Description = 'added on 10-jul-18  by sujani';
        }
        field(60015; "Type of GL"; Text[70])
        {
        }
        field(60016; "Nature of GL"; Text[70])
        {
        }
        field(60017; "GL Group"; Text[70])
        {
        }
        field(60018; "GL Sub Group"; Text[70])
        {
        }
        field(60019; Reflected_in_pl_userid; Code[50])
        {
        }
        field(60020; Reflected_in_pl_datetime; DateTime)
        {
        }
        field(60021; "Reflect in P&L"; Option)
        {
            OptionCaption = '" ,Yes,No"';
            OptionMembers = " ",Yes,No;
        }
    }
 

   
    var
        Subject: Text[100];
        SMTP_MAIL: Codeunit "SMTP Mail";
}

