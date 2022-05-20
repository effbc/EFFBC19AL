report 50152 "Payment Terms"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Payment Terms.rdlc';

    dataset
    {
        dataitem("Sales Header";"Sales Header")
        {
            DataItemTableView = ORDER(Ascending) WHERE(Document Type=FILTER(Order));
            column(Sales_Header__No__;"No.")
            {
            }
            column(Sales_Header__Payment_Terms_Code_;"Payment Terms Code")
            {
            }
            column(Sales_Header_Document_Type;"Document Type")
            {
            }

            trigger OnAfterGetRecord();
            begin
                    PT.SETRANGE(PT.Code,"Sales Header"."Payment Terms Code");
                  IF PT.FIND('-') THEN
                  PTcode:=FORMAT(PT."Due Date Calculation");
                  SQLQuery:='Insert into mrp_erp_payment_terms(Sale_order_no,payment_term,order_value)'+
                        ' values('''+FORMAT("Sales Header"."No.")+''','''+FORMAT(PTcode)+''' '+
                        ','''+commaeli(FORMAT(ROUND("Sales Header"."Sale Order Total Amount",1)))+''')';
                //    MESSAGE(SQLQuery);
                //  SQLConnection.Execute(SQLQuery);//B2B
                 SQLQuery:='';
            end;

            trigger OnPostDataItem();
            begin
                //SQLConnection.CommitTrans;//B2B
            end;

            trigger OnPreDataItem();
            begin
                sqlconnection2;
                deletequery:='DELETE FROM  mrp_erp_payment_terms' ;
                //SQLConnection.Execute(deletequery);//B2B
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
        PT : Record "Payment Terms";
        PTcode : Text[30];

    [LineStart(8198)]
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

    [LineStart(8206)]
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

