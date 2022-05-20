codeunit 99000756 VersionManagement
{
    // version NAVW19.00.00.45778


    trigger OnRun();
    begin
    end;

    [LineStart(51721)]
    procedure GetBOMVersion(BOMHeaderNo : Code[20];Date : Date;OnlyCertified : Boolean) : Code[20];
    var
        ProdBOMVersion : Record "Production BOM Version";
    begin
        ProdBOMVersion.SETCURRENTKEY("Production BOM No.","Starting Date");
        ProdBOMVersion.SETRANGE("Production BOM No.",BOMHeaderNo);
        ProdBOMVersion.SETFILTER("Starting Date",'%1|..%2',0D,Date);
        IF OnlyCertified THEN
          ProdBOMVersion.SETRANGE(Status,ProdBOMVersion.Status::Certified)
        ELSE
          ProdBOMVersion.SETFILTER(Status,'<>%1',ProdBOMVersion.Status::Closed);
        IF NOT ProdBOMVersion.FIND('+') THEN
          CLEAR(ProdBOMVersion);

        EXIT(ProdBOMVersion."Version Code");
    end;

    [LineStart(51734)]
    procedure GetBOMUnitOfMeasure(BOMHeaderNo : Code[20];VersionCode : Code[20]) : Code[10];
    var
        ProdBOMHeader : Record "Production BOM Header";
        ProdBOMVersion : Record "Production BOM Version";
    begin
        IF BOMHeaderNo = ''THEN
          EXIT('');

        IF VersionCode = '' THEN BEGIN
          ProdBOMHeader.GET(BOMHeaderNo);
          EXIT(ProdBOMHeader."Unit of Measure Code");
        END;

        ProdBOMVersion.GET(BOMHeaderNo,VersionCode);
        EXIT(ProdBOMVersion."Unit of Measure Code");
    end;

    [LineStart(51746)]
    procedure GetRtngVersion(RoutingNo : Code[20];Date : Date;OnlyCertified : Boolean) : Code[20];
    var
        RtngVersion : Record "Routing Version";
    begin
        RtngVersion.SETCURRENTKEY("Routing No.","Starting Date");
        RtngVersion.SETRANGE("Routing No.",RoutingNo);
        RtngVersion.SETFILTER("Starting Date",'%1|..%2',0D,Date);
        IF OnlyCertified THEN
          RtngVersion.SETRANGE(Status,RtngVersion.Status::Certified)
        ELSE
          RtngVersion.SETFILTER(Status,'<>%1',RtngVersion.Status::Closed);

        IF NOT RtngVersion.FINDLAST THEN
          CLEAR(RtngVersion);

        EXIT(RtngVersion."Version Code");
    end;
}

