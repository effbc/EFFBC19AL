report 33000012 "Pay Employee - Labels"
{
    // version NEOGYNPAY13.70.00.06

    DefaultLayout = RDLC;
    RDLCLayout = './Pay Employee - Labels.rdlc';

    dataset
    {
        dataitem(Employee;Employee)
        {
            DataItemTableView = SORTING(No.);
            RequestFilterFields = "No.","Phone No.","Birth Date";
            column(Addr_1__1_;Addr[1][1])
            {
            }
            column(Addr_1__2_;Addr[1][2])
            {
            }
            column(Addr_1__3_;Addr[1][3])
            {
            }
            column(Addr_1__4_;Addr[1][4])
            {
            }
            column(Addr_2__1_;Addr[2][1])
            {
            }
            column(Addr_2__2_;Addr[2][2])
            {
            }
            column(Addr_2__3_;Addr[2][3])
            {
            }
            column(Addr_2__4_;Addr[2][4])
            {
            }
            column(Addr_3__1_;Addr[3][1])
            {
            }
            column(Addr_3__2_;Addr[3][2])
            {
            }
            column(Addr_3__3_;Addr[3][3])
            {
            }
            column(Addr_3__4_;Addr[3][4])
            {
            }
            column(Employee_No_;"No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                RecordNo := RecordNo + 1;
                ColumnNo := ColumnNo + 1;

                Addr[ColumnNo][1] := FORMAT(Title) + ' ' + FORMAT("First Name") +' ' +FORMAT("Last Name");
                Addr[ColumnNo][2] := FORMAT(Address);
                Addr[ColumnNo][3] := FORMAT("Address 2");
                Addr[ColumnNo][4] := FORMAT("Post Code") + ' ' + FORMAT("Post Code");

                COMPRESSARRAY(Addr[ColumnNo]);

                IF RecordNo = NoOfRecords THEN BEGIN
                  FOR i := ColumnNo + 1 TO NoOfColumns DO
                    CLEAR(Addr[i]);
                  ColumnNo := 0;
                END ELSE BEGIN
                  IF ColumnNo = NoOfColumns THEN
                    ColumnNo := 0;
                END;
            end;

            trigger OnPreDataItem();
            begin
                NoOfRecords := COUNT;
                NoOfColumns := 3;
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
        Addr : array [3,4] of Text[250];
        NoOfRecords : Integer;
        RecordNo : Integer;
        NoOfColumns : Integer;
        ColumnNo : Integer;
        i : Integer;
}

