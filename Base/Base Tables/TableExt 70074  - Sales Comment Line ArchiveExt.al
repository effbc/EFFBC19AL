tableextension 70074 SalesCommentLineArchiveExt extends "Sales Comment Line Archive"
{
    fields
    {
        field(60001; "User ID"; Code[40])
        {
            DataClassification = ToBeClassified;

            trigger OnLookup();
            begin
                User.Reset;
                if PAGE.RunModal(9800, User) = ACTION::LookupOK then
                    Rec."User ID" := User."User Name";
            end;
        }
        field(60002; "Responsible Person"; Code[40])
        {
            DataClassification = ToBeClassified;

            trigger OnLookup();
            begin
                User.Reset;
                if PAGE.RunModal(9800, User) = ACTION::LookupOK then
                    "Responsible Person" := User."User Name";
            end;
        }
        field(60003; Status; Enum Status)
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(60004; "Exp Completion Date"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(60005; Priority; Enum Priority)
        {
            DataClassification = ToBeClassified;
        }
        field(60006; Product; Code[50])
        {
            DataClassification = ToBeClassified;

            trigger OnLookup();
            begin
                ISGC.Reset;
                if PAGE.RunModal(60263, ISGC) = ACTION::LookupOK then
                    Rec.Product := ISGC.Code;
            end;
        }
        field(60007; "Customer Number"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Added by Vishnu Priya for the IREPS Purpose';
            TableRelation = Customer."No.";
        }
        field(60008; "Customer Name"; Text[60])
        {
            DataClassification = ToBeClassified;
            Description = 'Added by Vishnu Priya for the IREPS Purpose';
        }
        field(60009; "Remainder Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Added by Vishnu Priya for the IREPS Purpose';
        }
        field(60010; "Quote Status"; Enum QuoteStatus)
        {
            DataClassification = ToBeClassified;
            Description = 'Added by Vishnu Priya for the IREPS Purpose';
        }
        field(60011; Convert; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'Added by Vishnu Priya for the IREPS Purpose';
        }
        field(60012; "Converted Order Number"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Added by Vishnu Priya for the IREPS Purpose';
        }
    }
    var
        Itm: Record Item;
        ISGC: Record "Item Sub Group";
        User: Record User;
}

