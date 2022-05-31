tableextension 70023 SalesShipmentHeaderExt extends "Sales Shipment Header"
{

    fields
    {



        field(60001; "RDSO Charges Paid By."; Enum "Sales Shipment Enum3")
        {
            Editable = false;

        }
        field(60002; "CA Number"; Code[20])
        {
            Description = 'B2B';
            Editable = false;
            TableRelation = "CA Number";
        }
        field(60003; "CA Date"; Date)
        {
            Description = 'B2B';
            Editable = false;
        }
        field(60004; "Type of Enquiry"; Enum "Sales Shipment Enum2")
        {
            Description = 'B2B';

        }
        field(60005; "Type of Product"; Enum "Sales Shipment Enum3")
        {
            Description = 'B2B';
            Editable = false;

        }
        field(60006; "Document Position"; Enum "Sales Shipment Enum5")
        {
            Description = 'B2B';
            Editable = false;

        }
        field(60007; "Cancel Short Close"; Enum "Sales Shipment Enum6")
        {
            Description = 'B2B';
            Editable = false;

        }
        field(60008; "RDSO Inspection Required"; Boolean)
        {
            Description = 'B2B';
            Editable = false;
        }
        field(60009; "RDSO Inspection By"; Enum "Sales Shipment Enum7")
        {
            Description = 'B2B';
            Editable = false;

        }
        field(60010; "BG Required"; Boolean)
        {
            Description = 'B2B';
            Editable = false;
        }
        field(60011; "BG No."; Code[20])
        {
            Description = 'B2B';
            Editable = false;
        }
        field(60012; Territory; Code[20])
        {
            Description = 'B2B';
            Editable = false;
            TableRelation = Territory;
        }
        field(60013; "Security Status"; Code[20])
        {
            Description = 'B2B';
            Editable = false;
        }
        field(60014; "LD Amount"; Decimal)
        {
            Description = 'B2B';
            Editable = false;
        }
        field(60015; "RDSO Charges"; Decimal)
        {
            Description = 'B2B';
            Editable = false;
        }
        field(60016; "Customer OrderNo."; Code[65])
        {
            Description = 'B2B';
        }
        field(60017; "Customer Order Date"; Date)
        {
            Description = 'B2B';
        }
        field(60018; "Security Deposit"; Enum "Sales Shipment Enum8")
        {
            Description = 'B2B';

        }
        field(60019; "RDSO Call Letter"; Enum "Sales Shipment Enum9")
        {
            Description = 'B2B';

        }
        field(60020; "Enquiry Status"; Enum "Sales Shipment Enum10")
        {
            Description = 'B2B';

        }
        field(60021; "Project Completion Date"; Date)
        {
            Description = 'B2B';
        }
        field(60022; "Extended Date"; Date)
        {
            Description = 'B2B';
        }
        field(60034; "Manufacturing Item Amount"; Decimal)
        {
            Description = 'B2B';
        }
        field(60035; "Bought out Items Amount"; Decimal)
        {
            Description = 'B2B';
        }
        field(60036; "Software Amount"; Decimal)
        {
            Description = 'B2B';
        }
        field(60037; "Total Order Amount"; Decimal)
        {
            Description = 'B2B';
        }
        field(60041; "Security Deposit Amount"; Decimal)
        {
            Description = 'B2B';
        }
        field(60042; "Deposit Payment Due Date"; Date)
        {
            Description = 'B2B';
        }
        field(60043; "Deposit Payment Date"; Date)
        {
            Description = 'B2B';
        }
        field(60044; "Security Deposit Status"; Code[20])
        {
            Description = 'B2B';
        }
        field(60045; "SD Requested Date"; Date)
        {
            Description = 'B2B';
        }
        field(60046; "SD Required Date"; Date)
        {
            Description = 'B2B';
        }
        field(60047; "SecurityDeposit Exp. Rcpt Date"; Date)
        {
            Description = 'B2B';
        }
        field(60048; "Adjusted from EMD"; Decimal)
        {
            CalcFormula = Sum("Tender Ledger Entries".Amount WHERE("Tender No." = FIELD("Tender No."),
                                                                    "Transaction Type" = CONST(Adjustment),
                                                                    "Mode of Receipt / Payment" = FILTER(<> Customer)));
            Description = 'B2B';
            Editable = false;
            Enabled = false;
            FieldClass = FlowField;
        }
        field(60049; "Adjusted from Running Bills"; Decimal)
        {
            CalcFormula = Sum("Tender Ledger Entries".Amount WHERE("Tender No." = FIELD("Tender No."),
                                                                    "Transaction Type" = FILTER(Adjustment),
                                                                    "Mode of Receipt / Payment" = FILTER(Customer)));
            Description = 'B2B';
            Editable = false;
            Enabled = false;
            FieldClass = FlowField;
        }
        field(60050; "Tender No."; Code[20])
        {
            Description = 'B2B';
            Editable = false;
            TableRelation = "Tender Header";
        }
        field(60051; "SD Paid Amount"; Decimal)
        {
            CalcFormula = Sum("Tender Ledger Entries".Amount WHERE("Tender No." = FIELD("Tender No."),
                                                                    Type = CONST(SD),
                                                                    "Transaction Type" = CONST(Payment)));
            Description = 'B2B';
            Editable = false;
            Enabled = false;
            FieldClass = FlowField;
        }
        field(60052; "SD Received Amount"; Decimal)
        {
            CalcFormula = Sum("Tender Ledger Entries".Amount WHERE("Tender No." = FIELD("Tender No."),
                                                                    Type = CONST(SD),
                                                                    "Transaction Type" = CONST(Receipt)));
            Description = 'B2B';
            Editable = false;
            Enabled = false;
            FieldClass = FlowField;
        }
        field(60053; "Final Bill Date"; Date)
        {
            Description = 'B2B';
        }
        field(60054; "Warranty Period"; DateFormula)
        {
            Description = 'B2B';
        }
        field(60055; "SD Status"; Enum "Sales Shipment Enum11")
        {
            Description = 'B2B';

        }
        field(60087; Consignee; Text[50])
        {
        }
        field(60115; "SD Running Bills Percent"; Decimal)
        {
            Enabled = false;
        }
        field(80020; "Dimension Corrected"; Boolean)
        {
            Description = 'added  by sujani for Dimension issue clearance (B2B Assistance)';
            Editable = false;
        }
        field(80021; "OLD Dim Set ID"; Integer)
        {
            Description = 'added  by sujani for Dimension issue clearance (B2B Assistance)';
            Editable = false;
            TableRelation = "Dimension Set Entry Backup2"."Dimension Set ID" WHERE("Dimension Set ID" = FIELD("OLD Dim Set ID"));

            trigger OnLookup();
            begin
                //ShowDimensionsOLD;
            end;
        }
        field(80100; "Insurance Applicable"; Boolean)
        {
        }
        field(80101; Customer_PAN_No; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(80102; Location_PAN_No; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
    trigger OnAfterInsert()
    var
        myInt: Integer;
    begin
        Subject := 'Shipement -' + Rec."No." + ' -Done';
        //CreateMessage('ERP', 
        Recpitients += 'erp@efftronics.com';
        Recpitients += 'vishnupriya@efftronics.com';

        Body += ('<html><body><table>');
        Body += ('<th>Shipped Details</th>');
        Body += ('<tr><td>Shipment No</td><td>' + Rec."No." + '</td></tr>');
        Body += ('</table>');
        Email.Send(EmailMessage);
        //AppendBody('<br/><br/>*********** This is auto generated mail from ERP ************</body></html>');

    end;






    var
        Email: Codeunit Email;
        Subject: Text[100];
        //Codeunit "SMTP Mail";
        Body: Text;
        Recpitients: Text;
        EmailMessage: Codeunit "Email Message";
}

