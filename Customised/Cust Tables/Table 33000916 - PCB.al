table 33000916 PCB
{
    // sten.RESET;
    // sten.SETRANGE(sten."No.",Stencil);
    // IF PAGE.RUNMODAL(60239,sten) = ACTION:: LookupOK THEN
    //  Stencil:= sten."No.";
    // 2.0      UPGREV                        Code Reviewed and Field validate "Master PCB" record more than once retrived issue resolved.


    fields
    {
        field(1;"PCB No.";Code[20])
        {
            TableRelation = Item."No." WHERE ("Product Group Code"=FILTER('PCB'|'CPCB'|'MPCB'));

            trigger OnValidate();
            begin
                if Item.Get("PCB No.") then
                Description:=Item.Description;
            end;
        }
        field(2;Description;Text[50])
        {
        }
        field(3;"PCB Thickness";Decimal)
        {
        }
        field(4;"Copper Clad Thinkness";Decimal)
        {
        }
        field(5;"PCB Area";Decimal)
        {
        }
        field(6;Length;Decimal)
        {
        }
        field(7;Width;Decimal)
        {
        }
        field(8;"PCB Shape";Option)
        {
            OptionMembers = ,Rectangle,Circular;
        }
        field(9;"On C-side";Option)
        {
            OptionMembers = "0",Green,White,Black,Blue;
        }
        field(10;"On D-side";Option)
        {
            OptionMembers = "0",Green,White,Black,Blue;
        }
        field(11;"On S-side";Option)
        {
            OptionMembers = "0",Green,White,Black,Blue;
        }
        field(12;Stencil;Code[20])
        {
            TableRelation = Stencil."No.";

            trigger OnLookup();
            begin
                sten.Reset;
                if PAGE.RunModal(60238,sten) = ACTION:: LookupOK then
                Validate(Stencil,sten."No.");
            end;

            trigger OnValidate();
            begin
                Item.Reset;
                Item.SetFilter(Item."No.","PCB No.");
                if Item.FindFirst then
                begin
                  if Item."Product Group Code"='MPCB' then
                  begin
                    PcbGRec.Reset;
                    PcbGRec.SetFilter(PcbGRec."Master PCB","PCB No.");
                    if PcbGRec.FindSet then
                    repeat
                      PcbGRec.Stencil:=Stencil;
                      PcbGRec.Modify;
                    until PcbGRec.Next=0;
                  end else if Item."Product Group Code"='PCB' then
                  begin
                    PBL.Reset;
                    PBL.SetFilter(PBL."No.","PCB No.");
                    if PBL.FindFirst then
                    repeat
                      PcbGRec.Reset;
                      PcbGRec.SetFilter(PcbGRec."PCB No.",PBL."Production BOM No.");
                      if PcbGRec.FindFirst then
                      begin
                        PcbGRec.Stencil:=Stencil;
                        PcbGRec.Modify;
                      end;
                    until PBL.Next=0;
                  end;
                end;
            end;
        }
        field(13;"Soldering Area";Decimal)
        {
        }
        field(14;"Master PCB";Code[20])
        {
            TableRelation = Item."No." WHERE ("Product Group Code"=FILTER('MPCB'));

            trigger OnValidate();
            begin
                PcbGRec.Reset;
                //IF PcbGRec.GET("Master PCB") THEN //UPGREV2.0
                 PcbGRec.SetRange(PcbGRec."PCB No.","Master PCB");
                 if PcbGRec.FindFirst then
                  Stencil:=PcbGRec.Stencil;
            end;
        }
        field(15;Multiples_Per_Stencil;Decimal)
        {
        }
        field(16;"Double Side Stencil";Code[20])
        {
            TableRelation = Stencil."No.";

            trigger OnLookup();
            begin
                sten.Reset;
                if PAGE.RunModal(60238,sten) = ACTION:: LookupOK then
                Validate(Stencil,sten."No.");
            end;

            trigger OnValidate();
            begin
                Item.Reset;
                Item.SetFilter(Item."No.","PCB No.");
                if Item.FindFirst then
                begin
                  if Item."Product Group Code"='MPCB' then
                  begin
                    PcbGRec.Reset;
                    PcbGRec.SetFilter(PcbGRec."Master PCB","PCB No.");
                    if PcbGRec.FindSet then
                    repeat
                      PcbGRec.Stencil:=Stencil;
                      PcbGRec.Modify;
                    until PcbGRec.Next=0;
                  end else if Item."Product Group Code"='PCB' then
                  begin
                    PBL.Reset;
                    PBL.SetFilter(PBL."No.","PCB No.");
                    if PBL.FindFirst then
                    repeat
                      PcbGRec.Reset;
                      PcbGRec.SetFilter(PcbGRec."PCB No.",PBL."Production BOM No.");
                      if PcbGRec.FindFirst then
                      begin
                        PcbGRec.Stencil:=Stencil;
                        PcbGRec.Modify;
                      end;
                    until PBL.Next=0;
                  end;
                end;
            end;
        }
    }

    keys
    {
        key(Key1;"PCB No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        sten : Record Stencil;
        Item : Record Item;
        PcbGRec : Record PCB;
        PBL : Record "Production BOM Line";
}

