page 60303 Sessions2
{
    // version SESSIONW13.10.01

    Editable = false;
    PageType = List;
    SourceTable = "Session Information";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("My Session"; "My Session")
                {
                }
                field("User ID"; "User ID")
                {
                }
                field("Connection ID"; "Connection ID")
                {
                }
                field("Records Scanned"; "Records Scanned")
                {
                }
                field("""Found/Scanned Ratio %"" * 100"; "Found/Scanned Ratio %" * 100)
                {
                    Caption = 'Found/Scanned Ratio %';
                    ExtendedDatatype = Ratio;
                }
                field("Disk Reads"; "Disk Reads")
                {
                }
                field("Disk Writes"; "Disk Writes")
                {
                }
                field(username; username)
                {
                }
                field("""Cache Hit Ratio %"" * 100"; "Cache Hit Ratio %" * 100)
                {
                    Caption = 'Cache Hit Ratio %';
                    ExtendedDatatype = Ratio;
                }
            }
        }
    }

    actions
    {
    }

    (21830)]
    procedure RefreshSessions();
    begin
        CurrPage.UPDATE(FALSE);
    end;
}

