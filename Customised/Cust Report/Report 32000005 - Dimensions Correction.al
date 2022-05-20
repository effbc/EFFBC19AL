report 32000005 "Dimensions Correction"
{
    // version ONETIME

    // //DimFilterID := '2|20|451|2729|3388|3634|5085|5334|5377|6787|8149|8347|8686|8756|9189|9474|9956|10406|10612|11401|12148|12199|12583|12777|13209';
    // //DimFilterID := '13341|13495|13665|13772|13932|14187|14188|14192..14314|14316|14326|14328|14329|14331|14333|14335|14336|14338|14341|14342|14343';
    // //DimFilterID := '14345|14347|14350|14351|14354..14361|14363|14364|14365|14369|14372|14376|14384|14405|14406|14407|14414|14419|14422|14434|14437';
    // //DimFilterID := '14442|14443|14444|14445|14446|14447|14448|14449|14452|14488|14489|14504|14511..14530|14532|14533|14534|14535|14545|14550|14551';
    // //DimFilterID := '14580|14598|14606|15111|16165|16910|17790|17877|18353|18710|18762|18953|18983|19601|19629|19643|19691|19698|19895|20272|20293';
    // //DimFilterID :='20343|20347|20438|20665|20724|22453|22719|22720|22835|22896|22898|22899|23217';
    DefaultLayout = RDLC;
    RDLCLayout = './Dimensions Correction.rdlc';

    Permissions = TableData "Posted Material Issues Line"=rm;

    dataset
    {
        dataitem("Posted Material Issues Line";"Posted Material Issues Line")
        {

            trigger OnAfterGetRecord();
            begin
                //WindowDia.UPDATE(1,"Entry No."); // verify
                //Dimension Set ID Updation >>
                CLEAR(DimensionMgt);
                CLEAR(DimensionValue);
                CLEAR(NewDimSetID);
                TempDimensionSetEntry.DELETEALL;

                DimensionSetEntryBackup.RESET;
                DimensionSetEntryBackup.SETRANGE("Dimension Set ID","OLD Dim Set ID");// verify
                IF DimensionSetEntryBackup.FINDSET THEN  BEGIN
                  REPEAT
                    DimensionValue.GET(DimensionSetEntryBackup."Dimension Code",DimensionSetEntryBackup."Dimension Value Code");
                    TempDimensionSetEntry.INIT;
                    TempDimensionSetEntry."Dimension Code" := DimensionValue."Dimension Code";
                    TempDimensionSetEntry."Dimension Value Code" := DimensionValue.Code;
                    TempDimensionSetEntry."Dimension Value ID" := DimensionValue."Dimension Value ID";
                    TempDimensionSetEntry.INSERT;
                  UNTIL  DimensionSetEntryBackup.NEXT = 0;
                END;

                //Dimension Set ID Updation <<
                NewDimSetID := DimensionMgt.GetDimensionSetID(TempDimensionSetEntry);

                IF NewDimSetID <> 0 THEN BEGIN
                  "Dimension Set ID" :=  NewDimSetID;
                  "Dimension Corrected"   := TRUE; // verify
                  MODIFY;
                END;
            end;

            trigger OnPostDataItem();
            begin
                WindowDia.CLOSE;
                MESSAGE(Text0000);
            end;

            trigger OnPreDataItem();
            begin
                SETFILTER("Dimension Corrected",'%1',FALSE);// verify
                SETFILTER("OLD Dim Set ID",'<>%1',0); // verify
                SETFILTER("Dimension Set ID",DimFilterID);
                /*SETFILTER("Purch. Cr. Memo Line"."Dimension Corrected",'%1',FALSE);// verify
                SETFILTER("Purch. Cr. Memo Line"."OLD Dim Set ID",'<>%1',0); // verify
                SETFILTER("Purch. Cr. Memo Line"."Dimension Set ID",DimFilterID);*/
                WindowDia.OPEN(Text0001);

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

    trigger OnPreReport();
    begin

        //DimFilterID := '2|20|451|2729|3388|3634|5085|5334|5377|6787|8149|8347|8686|8756|9189|9474|9956|10406|10612|11401|12148|12199|12583|12777|13209';
        //DimFilterID := '13341|13495|13665|13772|13932|14187|14188|14192..14314|14316|14326|14328|14329|14331|14333|14335|14336|14338|14341|14342|14343';
        //DimFilterID := '14345|14347|14350|14351|14354..14361|14363|14364|14365|14369|14372|14376|14384|14405|14406|14407|14414|14419|14422|14434|14437';
        //DimFilterID := '14442|14443|14444|14445|14446|14447|14448|14449|14452|14488|14489|14504|14511..14530|14532|14533|14534|14535|14545|14550|14551';
        //DimFilterID := '14580|14598|14606|15111|16165|16910|17790|17877|18353|18710|18762|18953|18983|19601|19629|19643|19691|19698|19895|20272|20293';
        DimFilterID :='20343|20347|20438|20665|20724|22453|22719|22720|22835|22896|22898|22899|23217';
        //ERROR('do not run');
        IF DimFilterID = '' THEN
          ERROR('Filter value must not be empty');
    end;

    var
        DimFilterID : Text;
        TempDimensionSetEntry : Record "Dimension Set Entry" temporary;
        DimensionValue : Record "Dimension Value";
        DimensionMgt : Codeunit DimensionManagement;
        NewDimSetID : Integer;
        Text0000 : Label 'Process Completed';
        Text0001 : Label 'Updating Dimension  Entry No. #1########';
        WindowDia : Dialog;
        DimensionSetEntryBackup : Record "Dimension Set Entry Backup2";
}

