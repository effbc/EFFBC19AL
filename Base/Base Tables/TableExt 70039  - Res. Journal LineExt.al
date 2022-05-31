tableextension 70039 ResJournalLineExt extends "Res. Journal Line"
{
    fields
    {
        field(60000; Zones; Code[10])
        {
            Caption = 'Zones';
            //TableRelation = Zones;
        }
        field(60001; Division; Code[10])
        {
            Caption = 'Divsion';
            //TableRelation = Table50012.Field1 WHERE(Field2 = FIELD(Zones));
        }
        field(60002; Station; Code[10])
        {
            Caption = 'Station';
            //TableRelation = Table50013.Field1 WHERE(Field2 = FIELD(Division));
        }
        field(60003; "Product type"; Code[10])
        {
            Caption = 'Product type';
            TableRelation = "Service Item Group".Code;
        }
        field(60004; "Sale order no"; Code[30])
        {
            Caption = 'Sale order no';
            TableRelation = "Sales Header"."No.";
        }
        field(60005; Status; Enum Status3)
        {
            Caption = 'Status';

        }
        field(60006; "Work Description"; Text[250])
        {
        }
        field(60007; "Planned Hr's"; Decimal)
        {
        }
        field(60008; "Serial no"; Code[10])
        {
        }
        field(60009; State; Code[10])
        {
            //TableRelation = State.Code;
        }
        field(60010; District; Code[10])
        {
            //TableRelation = Table50014.Field1 WHERE(Field2 = FIELD(State));
        }
        field(60011; City; Code[10])
        {
            TableRelation = City."City Code" WHERE("District Code" = FIELD(District));
        }
        field(60012; Place; Code[10])
        {
            TableRelation = Place."Place Code";
        }
        field(60013; "Training/Demo"; Enum "Training Demo")
        {

        }
        field(60014; Location; Code[10])
        {
            Caption = 'Department';
            TableRelation = Location.Code;
        }
        field(60015; Designation; Code[10])
        {
            TableRelation = "Resource Group"."No.";
        }
        field(60016; "Action taken"; Text[250])
        {
        }
        field(60017; Remarks; Text[250])
        {
        }
        field(60018; Reason; Text[250])
        {
        }
        field(60019; "Service item"; Code[20])
        {
            TableRelation = "Service Item"."No." WHERE(Station = FIELD(Station));

            trigger OnValidate();
            begin
                TestField(Station);
                TestField("Service item");
                //if serviceitem."No."<>xRec."Service item" then
                //serviceitem.GET(xRec."Service item");
                //MESSAGE(Rec."Service item");
                //serviceitem.SETRANGE(serviceitem."No.",xRec."Service item");
                serviceitem.Get(Rec."Service item");
                "Serial no" := serviceitem."Serial No.";
                //xRec.MODIFY;
                //MESSAGE(xRec."Serial No");
            end;
        }
        field(60020; "AMC Order NO"; Code[30])
        {
            TableRelation = "Service Contract Header"."Contract No.";
        }
    }

    var
        serviceitem: Record "Service Item";
        machinecenter: Record "Machine Center";
}

