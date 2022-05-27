tableextension 70117 PurchasePriceExt extends "Purchase Price"
{

    fields
    {
        field(50001; "Maximum Quantity"; Decimal)
        {
        }
        field(50002; Make; Code[30])
        {
            TableRelation = Make;
        }
        field(50003; "Part Number"; Code[30])
        {
        }
        field(50004; Remarks; Text[100])
        {
        }
        field(50005; SPQ; Decimal)
        {
            Description = 'Standard Package Quantity';
        }
        field(50006; "Unit Cost with Charges"; Decimal)
        {
        }
        field(50007; "Dollar Cost"; Decimal)
        {
        }
        field(50008; Attachment; Boolean)
        {
        }
        field(50009; "Lead Time"; DateFormula)
        {
        }
        field(50010; "Quotation Type"; Enum QuotationType)
        {
           
        }
    }
    
}

