report 50150 "products price variations"
{
    DefaultLayout = RDLC;
    RDLCLayout = './products price variations.rdlc';

    dataset
    {
        dataitem(Item; Item)
        {
            DataItemTableView = WHERE(Product Group Code=FILTER(FPRODUCT));
            column(Item_No_;"No.")
            {
            }
            dataitem("Production BOM Header";"Production BOM Header")
            {
                DataItemLink = No.=FIELD(No.);
                DataItemTableView = WHERE(Status=FILTER(Certified));
                column(Production_BOM_Header__No__;"No.")
                {
                }
                column(Production_BOM_Header_Description;Description)
                {
                }
                column(Production_BOM_Header__BOM_Cost_;"BOM Cost")
                {
                }
                column(Item__Item_Sub_Group_Code_;Item."Item Sub Group Code")
                {
                }
                column(Production_BOM_Header__BOM_Manufacturing_Cost_;"BOM Manufacturing Cost")
                {
                }
            }

            trigger OnPreDataItem();
            begin
                sqlconnection1;
                deletequery:='DELETE FROM ERP_LATEST_PROD_PRICE ' ;
                //SQLConnection.Execute(deletequery);//B2b
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
        SQLQuery : Text[1000];
        connectionopen : Integer;
        deletequery : Text[1000];

    (8173)]
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
        //  SQLConnection.BeginTrans;
          connectionopen:=1;
        //  MESSAGE('OMS Connected');
        END;
         *///B2B

    end;

    (8190)]
    procedure commaeli(Base : Text[30]) converted : Text[30];
    var
        i : Integer;
    begin
         FOR i:=1 TO STRLEN(Base) DO
         BEGIN
           IF COPYSTR(Base,i,1)<>',' THEN
             converted+=COPYSTR(Base,i,1);
         END;
         EXIT(converted);
    end;
}

