tableextension 70005 CustomerExt extends Customer
{


    fields
    {


        modify(Balance)
        {


            CaptionML = ENU = 'Balance';


        }
        modify("Balance (LCY)")
        {


            CaptionML = ENU = 'Balance (LCY)';




        }



        field(50010; "Make A Quote"; Boolean)
        {
            Description = 'B2BQTO';
        }
        field(60090; "User Id"; Code[50])
        {
            Description = 'Rev01';
            Editable = false;
            TableRelation = User."User Name";
        }
        field(60091; "Customer Type"; Option)
        {
            OptionMembers = " ",Railway,Private;
        }
        field(60093; CSBalance; Decimal)
        {
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Customer No." = FIELD("No."),
                                                                                 "Initial Entry Global Dim. 2" = FIELD("Global Dimension 2 Filter"),
                                                                                 "Currency Code" = FIELD("Currency Filter"),
                                                                                 "Posting Date" = FILTER(>= 20080401D),
                                                                                 "Initial Entry Global Dim. 1" = FILTER('CUS*'),
                                                                                 "Entry Type" = CONST("Initial Entry")));
            FieldClass = FlowField;
        }
        field(60094; SalBalance; Decimal)
        {
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Customer No." = FIELD("No."),
                                                                                 "Initial Entry Global Dim. 2" = FIELD("Global Dimension 2 Filter"),
                                                                                 "Currency Code" = FIELD("Currency Filter"),
                                                                                 "Posting Date" = FILTER(> 20080331D),
                                                                                 "Initial Entry Global Dim. 1" = FILTER('PRD-001' .. 'PRD-999'),
                                                                                 "Entry Type" = CONST("Initial Entry")));
            FieldClass = FlowField;
        }
        field(60095; "Tally Ref"; Text[50])
        {
        }
        field(60096; "TAN Number"; Code[10])
        {
        }
        field(60097; "Payment Realization Period"; DateFormula)
        {
        }
        field(60098; "Payment Term Auth"; Option)
        {
            Description = 'added for credit PT Auth Status';
            OptionMembers = " ","Sent For Authorization",Authorized,Rejected;
        }
        field(60099; Created_Date_Time; Date)
        {
            Description = 'added by sujani on 10-jul-18';
        }
        field(60100; "GST TDS Number"; Code[40])
        {
            Description = 'Added By Vishnu Priya for TDS Claiming Process';
        }
    }
    trigger OnInsert()
    var
        myInt: Integer;
        Body: Text;
        Subject: Text[100];
        EmailMessage: Codeunit "Email Message";

    begin
        Rec.Created_Date_Time := Today;
        begin
            Subject := 'New Customer-' + Rec."No." + ' Created';

            EmailMessage.Create('ERP', 'erp@efftronics.com', 'erp@efftronics.com,sitarajyam@efftronics.com', Subject, '', true);
            BODY += '<html><body><table>';
            Body += '<th>Customer Details</th>';
            BODY += '<tr><td> Customer No: </td><td>' + Rec."No." + '</td></tr>';
            BODY += '<tr><td>Name: </td><td>' + Rec.Name + '</td></tr>';
            BODY += '<tr><td>Created Date: </td><td>' + Format(Rec.Created_Date_Time) + '</td></tr>';
            BODY += '<tr><td>Created By: </td><td>' + UserId + '</td></tr>';
            BODY += '</table>';
            BODY += '<br/><br/>*********** This is auto generated mail from ERP ************</body></html>';

        end;




    var
        Subject: Text[100];
        SMTP_MAIL: Codeunit "SMTP Mail";
}

