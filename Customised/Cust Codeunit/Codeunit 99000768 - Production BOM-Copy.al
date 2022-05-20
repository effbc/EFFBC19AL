codeunit 99000768 "Production BOM-Copy"
{
    // version NAVW19.00.00.45778,B2B1.0

    TableNo = "Production BOM Header";

    trigger OnRun();
    begin
    end;

    var
        Text000 : TextConst ENU='The %1 cannot be copied to itself.',ENN='The %1 cannot be copied to itself.';
        Text001 : TextConst ENU='%1 on %2 %3 must not be %4',ENN='%1 on %2 %3 must not be %4';
        Text002 : TextConst ENU='%1 on %2 %3 %4 must not be %5',ENN='%1 on %2 %3 %4 must not be %5';

    [LineStart(51762)]
    procedure CopyBOM(BOMHeaderNo : Code[20];FromVersionCode : Code[20];CurrentBOMHeader : Record "Production BOM Header";ToVersionCode : Code[20]);
    var
        FromProdBOMComponent : Record "Production BOM Line";
        ToProdBOMComponent : Record "Production BOM Line";
        FromProdBOMCompComment : Record "Production BOM Comment Line";
        ToProdBOMCompComment : Record "Production BOM Comment Line";
        ProdBomVersion : Record "Production BOM Version";
        LineNo1 : Integer;
        LineNo2 : Integer;
        Item : Record Item;
    begin
        IF (CurrentBOMHeader."No." = BOMHeaderNo) AND
           (FromVersionCode = ToVersionCode)
        THEN
          ERROR(Text000,CurrentBOMHeader.TABLECAPTION);

        IF ToVersionCode = '' THEN BEGIN
          IF CurrentBOMHeader.Status = CurrentBOMHeader.Status::Certified THEN
            ERROR(
              Text001,
              CurrentBOMHeader.FIELDCAPTION(Status),
              CurrentBOMHeader.TABLECAPTION,
              CurrentBOMHeader."No.",
              CurrentBOMHeader.Status);
        END ELSE BEGIN
          ProdBomVersion.GET(
            CurrentBOMHeader."No.",ToVersionCode);
          IF ProdBomVersion.Status = ProdBomVersion.Status::Certified THEN
            ERROR(
              Text002,
              ProdBomVersion.FIELDCAPTION(Status),
              ProdBomVersion.TABLECAPTION,
              ProdBomVersion."Production BOM No.",
              ProdBomVersion."Version Code",
              ProdBomVersion.Status);
        END;

        FromProdBOMComponent.SETRANGE("Production BOM No.",BOMHeaderNo);
        FromProdBOMComponent.SETRANGE("Version Code",FromVersionCode);

        IF FromProdBOMComponent.FINDFIRST THEN
          REPEAT
            IF Item.GET(FromProdBOMComponent."No.") THEN
            BEGIN
              IF FORMAT(Item."Item Status") IN ['NRND','Obsolete'] THEN// added by sundar to prevent obsolete items selection in new boms
                 ERROR('The item %1 cannot be picked as its status is %2',Item.Description,FORMAT(Item."Item Status"));
            END;
            //B2B
            ToProdBOMComponent.SETRANGE("Production BOM No.",CurrentBOMHeader."No.");
            ToProdBOMComponent.SETRANGE("Version Code",ToVersionCode);
            IF ToProdBOMComponent.FINDLAST THEN
              LineNo1 := ToProdBOMComponent."Line No."
            ELSE
              LineNo1 := 0;
            //B2B
            ToProdBOMComponent := FromProdBOMComponent;
            ToProdBOMComponent."Production BOM No." := CurrentBOMHeader."No.";
            ToProdBOMComponent."Version Code" := ToVersionCode;
            //B2B
            ToProdBOMComponent."Line No." := LineNo1 + 10000;
            ToProdBOMComponent.INSERT;
          UNTIL FromProdBOMComponent.NEXT = 0;

        FromProdBOMCompComment.SETRANGE("Production BOM No.",BOMHeaderNo);
        FromProdBOMCompComment.SETRANGE("Version Code",FromVersionCode);

        IF FromProdBOMCompComment.FINDFIRST THEN
          REPEAT
            //B2B
            ToProdBOMCompComment.SETRANGE("Production BOM No.",CurrentBOMHeader."No.");
            ToProdBOMCompComment.SETRANGE("Version Code",ToVersionCode);
            IF ToProdBOMCompComment.FINDLAST THEN
              LineNo2 := ToProdBOMCompComment."Line No."
            ELSE
              LineNo2 := 0;
            //B2B
            ToProdBOMCompComment := FromProdBOMCompComment;
            ToProdBOMCompComment."Production BOM No." := CurrentBOMHeader."No.";
            ToProdBOMCompComment."Version Code" := ToVersionCode;
            //B2B
            ToProdBOMCompComment."Line No." := LineNo2 + 10000;
            ToProdBOMCompComment.INSERT;
          UNTIL FromProdBOMCompComment.NEXT = 0;
    end;

    [LineStart(51836)]
    procedure CopyFromVersion(var ProdBOMVersionList2 : Record "Production BOM Version");
    var
        BOMHeader : Record "Production BOM Header";
        OldProdBOMVersionList : Record "Production BOM Version";
    begin
        OldProdBOMVersionList := ProdBOMVersionList2;

        BOMHeader."No." := ProdBOMVersionList2."Production BOM No.";
        IF PAGE.RUNMODAL(0,ProdBOMVersionList2) = ACTION::LookupOK THEN BEGIN
          IF OldProdBOMVersionList.Status = OldProdBOMVersionList.Status::Certified THEN
            ERROR(
              Text002,
              OldProdBOMVersionList.FIELDCAPTION(Status),
              OldProdBOMVersionList.TABLECAPTION,
              OldProdBOMVersionList."Production BOM No.",
              OldProdBOMVersionList."Version Code",
              OldProdBOMVersionList.Status);
          CopyBOM(BOMHeader."No.",ProdBOMVersionList2."Version Code",BOMHeader,OldProdBOMVersionList."Version Code");
        END;

        ProdBOMVersionList2 := OldProdBOMVersionList;
    end;

    [LineStart(51854)]
    procedure "---B2B---"();
    begin
    end;

    [LineStart(51857)]
    procedure CopyBomVersion(BOMHeaderNo : Code[20];FromVersionCode : Code[10];CurrentBOMHeader : Record "Production BOM Version";ToVersionCode : Code[10]);
    var
        FromProdBOMComponent : Record "Production BOM Line";
        ToProdBOMComponent : Record "Production BOM Line";
        FromProdBOMCompComment : Record "Production BOM Comment Line";
        ToProdBOMCompComment : Record "Production BOM Comment Line";
        ProdBomVersion : Record "Production BOM Version";
        LineNo1 : Integer;
        LineNo2 : Integer;
    begin
        IF (CurrentBOMHeader."Production BOM No." = BOMHeaderNo) AND
          (FromVersionCode = ToVersionCode)
        THEN
          ERROR(Text000,CurrentBOMHeader.TABLECAPTION);

        IF ToVersionCode = '' THEN BEGIN
          IF CurrentBOMHeader.Status = CurrentBOMHeader.Status::Certified THEN
            ERROR(
              Text001,
              CurrentBOMHeader.FIELDCAPTION(Status),
              CurrentBOMHeader.TABLECAPTION,
              CurrentBOMHeader."Production BOM No.",
              CurrentBOMHeader.Status);
        END ELSE BEGIN
          ProdBomVersion.GET(
            CurrentBOMHeader."Production BOM No.",ToVersionCode);
          IF ProdBomVersion.Status = ProdBomVersion.Status::Certified THEN
            ERROR(
              Text002,
              ProdBomVersion.FIELDCAPTION(Status),
              ProdBomVersion.TABLECAPTION,
              ProdBomVersion."Production BOM No.",
              ProdBomVersion."Version Code",
              ProdBomVersion.Status);
        END;

        FromProdBOMComponent.SETRANGE("Production BOM No.",BOMHeaderNo);
        FromProdBOMComponent.SETRANGE("Version Code",FromVersionCode);

        IF FromProdBOMComponent.FINDFIRST THEN
          REPEAT
            ToProdBOMComponent.SETRANGE("Production BOM No.",CurrentBOMHeader."Production BOM No.");
            ToProdBOMComponent.SETRANGE("Version Code",ToVersionCode);
            IF ToProdBOMComponent.FINDLAST THEN
              LineNo1 := ToProdBOMComponent."Line No."
            ELSE
              LineNo1 := 0;
            ToProdBOMComponent := FromProdBOMComponent;
            ToProdBOMComponent."Production BOM No." := CurrentBOMHeader."Production BOM No.";
            ToProdBOMComponent."Version Code" := ToVersionCode;
            ToProdBOMComponent."Line No." := LineNo1 + 10000;
            ToProdBOMComponent.INSERT;
          UNTIL FromProdBOMComponent.NEXT = 0;

        FromProdBOMCompComment.SETRANGE("Production BOM No.",BOMHeaderNo);
        FromProdBOMCompComment.SETRANGE("Version Code",FromVersionCode);

        IF FromProdBOMCompComment.FINDFIRST THEN
          REPEAT
            ToProdBOMCompComment.SETRANGE("Production BOM No.",CurrentBOMHeader."Production BOM No.");
            ToProdBOMCompComment.SETRANGE("Version Code",ToVersionCode);
            IF ToProdBOMCompComment.FINDLAST THEN
              LineNo2 := ToProdBOMCompComment."Line No."
            ELSE
              LineNo2 := 0;
            ToProdBOMCompComment := FromProdBOMCompComment;
            ToProdBOMCompComment."Production BOM No." := CurrentBOMHeader."Production BOM No.";
            ToProdBOMCompComment."Version Code" := ToVersionCode;
            ToProdBOMCompComment."Line No." := LineNo2 + 10000;
            ToProdBOMCompComment.INSERT;
          UNTIL FromProdBOMCompComment.NEXT = 0;
    end;
}

