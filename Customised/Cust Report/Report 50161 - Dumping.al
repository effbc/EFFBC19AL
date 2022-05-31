report 50161 Dumping
{
    DefaultLayout = RDLC;
    RDLCLayout = './Dumping.rdlc';

    dataset
    {
        dataitem(Item; Item)
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending);

            trigger OnAfterGetRecord();
            begin
                min := 100;
                max := 100;
                SQLQuery1 := 'insert into ERP_ITEM(ITEM_NO,INVENTORY_AT_STORE,SAFETY_LEAD_TIME,AVERAGE_UNIT_COST,' +
                'QUANTITY_UNDER_INSPECTION,PRODUCTION_BOM_NO,PRODUCT_GROUP_CODE,DESCRIPTION,UNIT_OF_MEASURE,' +
                'DESCRIPTION2,ITEM_SUB_GROUP_CODE,DEADSTOCK,USED_IN_DL,USED_IN_FEP,USED_IN_RTU)' +
                'values(''' + FORMAT("No.") + ''',' +
                'NVL(to_number(replace(''' + FORMAT(ROUND("Stock at Stores" + "Stock At MCH Location", 1)) + ''',''' + ',' + ''',''' + '' + ''')),0),' +
                '''' + FORMAT("Safety Lead Time", 0, '<Day>-<Month Text,3>-<Year4>') + ''',' +
                'NVL(to_number(replace(''' + FORMAT(ROUND("Avg Unit Cost", 1)) + ''',''' + ',' + ''',''' + '' + ''')),0),' +
                'NVL(to_number(replace(''' + FORMAT(ROUND("Quantity Under Inspection", 1)) + ''',''' + ',' + ''',''' + '' + ''')),0),' +
                '''' + FORMAT("Production BOM No.") + ''',' +
                '''' + FORMAT("Product Group Code") + ''',' +
                '''' + FORMAT(Description) + ''',' +
                '''' + FORMAT("Base Unit of Measure") + ''',' +
                '''' + FORMAT("Description 2") + ''',' +
                '''' + FORMAT("Item Sub Group Code") + ''',' +
                '''' + FORMAT(PROD_USED) + ''',' +
                '''' + FORMAT("Used In DL") + ''',' +
                '''' + FORMAT("Used In MFEP") + ''',' +
                '''' + FORMAT("Used In RTU") + ''')';
                //       ''+'100'+','+
                //        ''+'100'+')';
                MESSAGE(SQLQuery);
                //SQLConnection.Execute(SQLQuery1);//B2B
            end;

            trigger OnPreDataItem();
            begin
                IF datadump THEN BEGIN
                    sqlconnection1;
                    deletequery := 'DELETE FROM  ERP_ITEM';
                    //SQLConnection.Execute(deletequery);//B2B
                END;
            end;
        }
        dataitem("Purchase Line"; "Purchase Line")
        {
            DataItemTableView = SORTING(Document Type, Document No., Line No.) ORDER(Ascending);

            trigger OnAfterGetRecord();
            begin
                IF ("Purchase Line"."Location Code" = 'STR') AND ("Purchase Line"."Document Type" = "Purchase Line"."Document Type"::Order)
                AND ("Purchase Line".Type = "Purchase Line".Type::Item) THEN BEGIN
                    SQLQuery1 := 'insert into ERP_PURCHASE_LINE(ITEM_NO,QUANTITY,UNIT_OF_MEASURE,' +
                    'EXPECTED_INVOICE_DATE,PURCHASE_ORDER_NO,DEVIATED_EXPECTEDDATE,OUTSTANDING_QUANTITY,' +
                    'UNIT_COST,REMARKS' +
                    ' ) values(''' + FORMAT("No.") + ''',' +  //''+CONVERTSTR("Description",'''',' ')+''''+
                    'NVL(to_number(replace(''' + FORMAT(ROUND(Quantity, 1)) + ''',''' + ',' + ''',''' + '' + ''')),0),' +
                    '''' + FORMAT("Unit of Measure") + ''',' +
                    '''' + FORMAT("Expected Receipt Date", 0, '<Day>-<Month Text,3>-<Year4>') + ''',' +
                    ',''' + FORMAT("Document No.") + ''',' +
                    '''' + FORMAT("Deviated Receipt Date", 0, '<Day>-<Month Text,3>-<Year4>') + ''',' +
                    '''' + FORMAT("Outstanding Quantity") + ''',' +
                    '''' + FORMAT("Unit Cost (LCY)") + ''',' +
                    '''' + FORMAT(Remarks) + ''')';
                    //       MESSAGE(SQLQuery);
                    //SQLConnection.Execute(SQLQuery1);//B2B
                END;
            end;

            trigger OnPreDataItem();
            begin
                IF datadump THEN BEGIN
                    sqlconnection1;
                    deletequery := 'DELETE FROM  ERP_PURCHASE_LINE';
                    //SQLConnection.Execute(deletequery);//B2B
                END;
            end;
        }
        dataitem("Inspection Datasheet Header"; "Inspection Datasheet Header")
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending);

            trigger OnAfterGetRecord();
            begin
                IF ("Inspection Datasheet Header"."Source Type" = "Inspection Datasheet Header"."Source Type"::"In Bound")
                AND ("Inspection Datasheet Header".Location = 'STR') THEN BEGIN
                    SQLQuery1 := 'insert into ERP_UNDER_QC(ITEM_NO,QUANTITY' +
                    ' ) values(''' + FORMAT("No.") + ''',' +  //''+CONVERTSTR("Description",'''',' ')+''''+
                    'NVL(to_number(replace(''' + FORMAT(ROUND(Quantity, 1)) + ''',''' + ',' + ''',''' + '' + ''')),0))';
                    //       MESSAGE(SQLQuery);
                    //SQLConnection.Execute(SQLQuery1);//B2B
                END;
            end;

            trigger OnPreDataItem();
            begin
                IF datadump THEN BEGIN
                    sqlconnection1;
                    deletequery := 'DELETE FROM ERP_UNDER_QC';
                    //SQLConnection.Execute(deletequery);//B2B
                END;
            end;
        }
        dataitem("Material Issues Header"; "Material Issues Header")
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending);

            trigger OnAfterGetRecord();
            begin
                IF "Material Issues Header".Status = "Material Issues Header".Status::Released THEN BEGIN
                    MIL.SETRANGE(MIL."Document No.", "Material Issues Header"."No.");
                    MIL.SETRANGE(MIL."Transfer-to Code", 'PROD');
                    IF MIL.FIND('-') THEN
                        REPEAT
                            IF MIL."Qty. to Receive" > 0 THEN BEGIN
                                SQLQuery1 := 'insert into ERP_MATERIAL_ISSUES_LINE(ITEM_NO,QUANTITY,QUANTITY_TO_RECEIVE,' +
                                'RELEASED_DATE,PROD_BOM_NO,SALE_DESC,PROD_ORD_NO' +
                                ' ) values(''' + FORMAT(MIL."Item No.") + ''',' +  //''+CONVERTSTR("Description",'''',' ')+''''+
                                'NVL(to_number(replace(''' + FORMAT(ROUND(MIL.Quantity, 1)) + ''',''' + ',' + ''',''' + '' + ''')),0),' +
                                'NVL(to_number(replace(''' + FORMAT(ROUND(MIL."Qty. to Receive", 1)) + ''',''' + ',' + ''',''' + '' + ''')),0),' +
                                '''' + FORMAT("Released Date", 0, '<Day>-<Month Text,3>-<Year4>') + ''',' +
                                ',''' + FORMAT("Material Issues Header"."Production BOM No.") + ''',' +
                                '''' + FORMAT("Material Issues Header"."Sales Order No.") + ''',' +
                                '''' + FORMAT("Material Issues Header"."Prod. Order No.") + ''')';
                                //       MESSAGE(SQLQuery);
                                //SQLConnection.Execute(SQLQuery1);//B2B
                            END;
                        UNTIL MIL.NEXT = 0;
                END;
            end;

            trigger OnPreDataItem();
            begin
                IF datadump THEN BEGIN
                    sqlconnection1;
                    deletequery := 'DELETE FROM  ERP_MATERIAL_ISSUES_LINE';
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
        SQLQuery: Text[1000];
        connectionopen: Integer;
        deletequery: Text[1000];
        datadump: Boolean;
        SQLQuery1: Text[1000];
        MIL: Record "Material Issues Line";
        val: Decimal;
        "min": Integer;
        "max": Integer;

    [LineStart(8284)]
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

    [LineStart(8301)]
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

    [LineStart(8309)]
    procedure sqlconnection2();
    begin
        /*IF ISCLEAR(SQLConnection) THEN
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

