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


        field(50001; "MSPT Code"; Code[20])
        {
            TableRelation = "MSPT Header".Code WHERE(Status = CONST(Released));
        }
        field(50002; "MSPT Applicable at Line Level"; Boolean)
        {
        }
        field(50003; "MSPT Balance Due"; Decimal)
        {
            CalcFormula = Sum("MSPT Dtld. Cust. Ledg. Entry"."MSPT Amount" WHERE("Customer No." = FIELD("No."),
                                                                                  "MSPT Due Date" = FIELD("Date Filter"),
                                                                                  "Posting Date" = FIELD(UPPERLIMIT("Date Filter")),
                                                                                  "Initial Entry Global Dim. 1" = FIELD("Global Dimension 1 Filter"),
                                                                                  "Initial Entry Global Dim. 2" = FIELD("Global Dimension 2 Filter"),
                                                                                  "Currency Code" = FIELD("Currency Filter")));
            FieldClass = FlowField;
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
    begin
        Rec.Created_Date_Time := Today;
        begin
            Subject := 'New Customer-' + Rec."No." + ' Created';
            Recipients := 'erp@efftronics.com';
            Recipients := 'erp@efftronics.com';
            Recipients := 'sitarajyam@efftronics.com';
            EmailMessage.Create(Recipients, Subject, Body);
            Body += ('<html><body><table>');
            Body += ('<th>Customer Details</th>');
            Body += ('<tr><td> Customer No: </td><td>' + Rec."No." + '</td></tr>');
            Body += ('<tr><td>Name: </td><td>' + Rec.Name + '</td></tr>');
            Body += ('<tr><td>Created Date: </td><td>' + Format(Rec.Created_Date_Time) + '</td></tr>');
            Body += ('<tr><td>Created By: </td><td>' + UserId + '</td></tr>');
            Body += ('</table>');
            Body += ('<br/><br/>*********** This is auto generated mail from ERP ************</body></html>');
            Email.Send();
        end;
    end;

    var
        Subject: Text[100];
        Email: Codeunit Email;
        Body: Text;
        EmailMessage: Codeunit "Email Message";
        Recipients: Text;
}

