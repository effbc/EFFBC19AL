report 50162 "Dumping per 3 days"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Dumping per 3 days.rdlc';

    dataset
    {
        dataitem(Schedule2; Schedule2)
        {
            DataItemTableView = SORTING(Document Type, Document No., Document Line No., Line No.) ORDER(Ascending);

            trigger OnAfterGetRecord();
            begin
                SQLQuery1 := 'insert into ERP_SALES_SCHEDULE(DOCUMENT_NO,DOCUMENT_LINE_NO,LINE_NO,TYPE1,NO,QUANTITY' +
                ') values(''' + FORMAT("Document No.") + ''',' +
                '''' + FORMAT("Document Line No.") + ''',' +
                '''' + FORMAT("Line No.") + ''',' +
                '''' + FORMAT(Type) + ''',' +
                '''' + FORMAT("No.") + ''',' +
                '' + commaeli(FORMAT(ROUND(Quantity, 1))) + ')';
                //       MESSAGE(SQLQuery);
                //SQLConnection.Execute(SQLQuery1);//B2B
            end;

            trigger OnPostDataItem();
            begin
                MESSAGE('Data Posted for Schedule Table');
            end;

            trigger OnPreDataItem();
            begin
                IF datadump THEN BEGIN
                    sqlconnection1;
                    deletequery := 'DELETE FROM ERP_SALES_SCHEDULE';
                    //SQLConnection.Execute(deletequery);//B2B
                END;
            end;
        }
        dataitem("Production Order"; "Production Order")
        {
            DataItemTableView = SORTING(Status, No.) ORDER(Ascending) WHERE(Status = CONST(Released));

            trigger OnAfterGetRecord();
            begin
                SQLQuery1 := 'insert into ERP_PRODUCTION_ORDER(PRODUCTION_ORDER_NO,SALES_ORDER_NO,SOURCE_NO ' +
                ' ) values(''' + FORMAT("No.") + ''',' +  //''+CONVERTSTR("Description",'''',' ')+''''+
                '''' + FORMAT("Sales Order No.") + ''',' +
                '''' + FORMAT("Source No.") + ''')';
                //       MESSAGE(SQLQuery);
                //SQLConnection.Execute(SQLQuery1);//B2B
                SQLQuery1 := '';
                POL.SETRANGE(POL."Prod. Order No.", "Production Order"."No.");
                IF POL.FIND('-') THEN
                    REPEAT
                        SQLQuery1 := 'insert into ERP_PROD_ORDER_LINE(PROD_ORDER_NO,ITEM_NO,LINE_NO,DESCRIPTION,QUANTITY' +
                        ' ) values(''' + FORMAT(POL."Prod. Order No.") + ''',' +
                        '''' + FORMAT(POL."Item No.") + ''',' +
                        '''' + FORMAT(POL."Line No.") + ''',' +
                        '''' + FORMAT(POL.Description) + ''',' +
                        '''' + commaeli(FORMAT(POL.Quantity)) + ''')';
                        //       MESSAGE(SQLQuery);
                        //SQLConnection.Execute(SQLQuery1);//B2B
                        SQLQuery1 := '';
                    UNTIL POL.NEXT = 0;

                POC.SETRANGE(POC."Prod. Order No.", "Production Order"."No.");
                IF POC.FIND('-') THEN
                    REPEAT
                        SQLQuery1 := 'insert into ERP_PROD_ORDER_COMPONENT(PROD_ORDER_NO,ITEM_NO,QUANTITY,LINE_NO' +
                        ' ) values(''' + FORMAT(POC."Prod. Order No.") + ''',' +
                        '''' + FORMAT(POC."Item No.") + ''',' +
                        '''' + commaeli(FORMAT(POC.Quantity)) + ''',' +
                        '''' + FORMAT(POC."Line No.") + ''')';
                        //       MESSAGE(SQLQuery);
                        //SQLConnection.Execute(SQLQuery1);//B2B
                        SQLQuery1 := '';
                    UNTIL POC.NEXT = 0;
            end;

            trigger OnPostDataItem();
            begin
                MESSAGE('Data Posted for Production_order Productionorderline and production order component');
            end;

            trigger OnPreDataItem();
            begin
                IF datadump THEN BEGIN
                    sqlconnection1;
                    deletequery := 'DELETE FROM ERP_PRODUCTION_ORDER';
                    //SQLConnection.Execute(deletequery);//B2B
                    deletequery := 'DELETE FROM ERP_PROD_ORDER_LINE';
                    //SQLConnection.Execute(deletequery);//B2B
                    deletequery := 'DELETE FROM ERP_PROD_ORDER_COMPONENT';
                    //SQLConnection.Execute(deletequery);//B2B
                END;
            end;
        }
        dataitem("Production BOM Header"; "Production BOM Header")
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending);

            trigger OnAfterGetRecord();
            begin
                SQLQuery1 := 'insert into ERP_PRODUCTION_BOM_HEADER(NO,STATUS,DESCRIPTION' +
                ' ) values(''' + FORMAT("No.") + ''',' +  //''+CONVERTSTR("Description",'''',' ')+''''+
                '''' + FORMAT(Status) + ''',' +
                '''' + FORMAT(Description) + ''')';
                //       MESSAGE(SQLQuery);
                //SQLConnection.Execute(SQLQuery1);//B2B
                SQLQuery1 := '';
                PBL.SETRANGE(PBL."Production BOM No.", "Production BOM Header"."No.");
                IF PBL.FIND('-') THEN
                    REPEAT
                        SQLQuery1 := 'insert into ERP_PRODUCTION_BOM_LINE3(PRODUCTION_BOM_NO,NO,DESCRIPTION,UNIT_OF_MEASURE,QUANTITY,TYPE1,' +
                        'PROD_DAY,VERSION_CODE) values(''' + FORMAT(PBL."Production BOM No.") + ''',' +
                        '''' + FORMAT(PBL."No.") + ''',' +
                        '''' + FORMAT(PBL.Description) + ''',' +
                        '''' + FORMAT(PBL."Unit of Measure Code") + ''',' +
                        '''' + commaeli(FORMAT(PBL.Quantity)) + ''',' +
                        '''' + FORMAT(PBL.Type) + ''',' +
                        '''' + FORMAT(PBL."Material Reqired Day") + ''',' +
                        '''' + FORMAT(PBL."Version Code") + ''')';
                        //       MESSAGE(SQLQuery);
                        //SQLConnection.Execute(SQLQuery1);//B2B
                        SQLQuery1 := '';
                    UNTIL PBL.NEXT = 0;

                PBV.SETRANGE(PBV."Production BOM No.", "Production BOM Header"."No.");
                IF PBV.FIND('-') THEN
                    REPEAT
                        SQLQuery1 := 'insert into PRODUCTION_BOM_VERSION(PRODUCTION_BOM_NO,VERSION_CODE,STATUS' +
                        ' ) values(''' + FORMAT(PBV."Production BOM No.") + ''',' +
                        '''' + FORMAT(PBV."Version Code") + ''',' +
                        '''' + FORMAT(PBV.Status) + ''')';
                        //       MESSAGE(SQLQuery);
                        //SQLConnection.Execute(SQLQuery1);//B2B
                        SQLQuery1 := '';
                    UNTIL PBV.NEXT = 0;
            end;

            trigger OnPostDataItem();
            begin
                MESSAGE('Data Posted for Productionbom header, production_bom_line,production_bom_verison');
            end;

            trigger OnPreDataItem();
            begin
                IF datadump THEN BEGIN
                    sqlconnection1;
                    deletequery := 'DELETE FROM ERP_PRODUCTION_BOM_HEADER';
                    //SQLConnection.Execute(deletequery);//B2B
                    deletequery := 'DELETE FROM ERP_PRODUCTION_BOM_LINE3';
                    //SQLConnection.Execute(deletequery);//B2B
                    deletequery := 'DELETE FROM PRODUCTION_BOM_VERSION';
                    //SQLConnection.Execute(deletequery);//B2B
                END;
            end;
        }
        dataitem("Sales Line"; "Sales Line")
        {
            DataItemTableView = SORTING(Document Type, Document No., Line No.) ORDER(Ascending) WHERE(Document Type=CONST(Order));

            trigger OnAfterGetRecord();
            begin
                SQLQuery1 := 'insert into ERP_SALES_LINE(DOCUMENT_NO,NO,TYPE1,PRODUCT_GROUP_CODE,DESCRIPTION,UNIT_OF_MEASURE,QUANTITY,' +
                'RDSO_INSPECTION_BY,QTY_TO_SHIP,LINE_NO) values(''' + FORMAT("Document No.") + ''',' +
                '''' + FORMAT("No.") + ''',' +
                '''' + FORMAT(Type) + ''',' +
                '''' + FORMAT("Product Group Code") + ''',' +
                '''' + FORMAT(Description) + ''',' +
                '''' + FORMAT("Unit of Measure") + ''',' +
                '''' + commaeli(FORMAT(Quantity)) + ''',' +
                '''' + FORMAT("RDSO Inspection By") + ''',' +
                '''' + commaeli(FORMAT("Qty. to Ship")) + ''',' +
                '''' + FORMAT("Line No.") + ''')';
                //       MESSAGE(SQLQuery);
                //SQLConnection.Execute(SQLQuery1);//B2B
            end;

            trigger OnPostDataItem();
            begin
                MESSAGE('Data Posted for Sales line table');
            end;

            trigger OnPreDataItem();
            begin
                IF datadump THEN BEGIN
                    sqlconnection1;
                    deletequery := 'DELETE FROM ERP_SALES_LINE';
                    //SQLConnection.Execute(deletequery);//B2B
                END;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        PBL: Record "Production BOM Line";
        PBV: Record "Production BOM Version";
        POL: Record "Prod. Order Line";
        POC: Record "Prod. Order Component";
        SQLQuery: Text[1000];
        connectionopen: Integer;
        deletequery: Text[1000];
        datadump: Boolean;
        SQLQuery1: Text[1000];

    (8326)]
    procedure sqlconnection1();
    begin
        /*IF ISCLEAR(SQLConnection) THEN
          CREATE(SQLConnection);
        
        IF ISCLEAR(RecordSet) THEN
          CREATE(RecordSet);
        
        IF connectionopen<>1 THEN
        BEGIN
          SQLConnection.ConnectionString :='DSN=oms;UID=omsuser;PASSWORD=management;SERVER=oracle_80;';
          SQLConnection.Open;
          SQLConnection.BeginTrans;
          connectionopen:=1;
        //  MESSAGE('OMS Connected');
        END;
         *///B2B

    end;

    (8343)]
    procedure commaeli(Base: Text[30]) converted: Text[30];
    var
        i: Integer;
    begin
        FOR i := 1 TO STRLEN(Base) DO BEGIN
            IF COPYSTR(Base, i, 1) <> ',' THEN
                converted += COPYSTR(Base, i, 1);
        END;
        EXIT(converted);
    end;

    (8351)]
    procedure sqlconnection2();
    begin
        /*
        IF ISCLEAR(SQLConnection) THEN
          CREATE(SQLConnection);
        
        IF ISCLEAR(RecordSet) THEN
          CREATE(RecordSet);
        
        IF connectionopen<>1 THEN
        BEGIN
          SQLConnection.ConnectionString :='DSN=cashflowuser;UID=cashflowuser;PASSWORD=firewall123;SERVER=oracle_80;';
          SQLConnection.Open;
          SQLConnection.BeginTrans;
          connectionopen:=1;
        //  MESSAGE('OMS Connected');
        END;
         *///B2B

    end;
}

