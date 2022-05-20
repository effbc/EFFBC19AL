page 99000768 "Manufacturing Setup"
{
    // version NAVW17.00

    CaptionML = ENU='Manufacturing Setup',
                ENN='Manufacturing Setup';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Manufacturing Setup";

    layout
    {
        area(content)
        {
            group(General)
            {
                CaptionML = ENU='General',
                            ENN='General';
                field("Normal Starting Time";"Normal Starting Time")
                {
                }
                field("Normal Ending Time";"Normal Ending Time")
                {
                }
                field("Preset Output Quantity";"Preset Output Quantity")
                {
                }
                field("Show Capacity In";"Show Capacity In")
                {
                }
                field("Planning Warning";"Planning Warning")
                {
                }
                field("Doc. No. Is Prod. Order No.";"Doc. No. Is Prod. Order No.")
                {
                }
                field("Dynamic Low-Level Code";"Dynamic Low-Level Code")
                {
                }
                field("Cost Incl. Setup";"Cost Incl. Setup")
                {
                }
                field("Total Fixing Points Time";"Total Fixing Points Time")
                {
                }
                field("Production Location";"Production Location")
                {
                }
                field("Soldering Time Req.for DIP";"Soldering Time Req.for DIP")
                {
                }
                field("Soldering Time Req.for BID";"Soldering Time Req.for BID")
                {
                    Caption = 'Soldering Time Req.for SMD';
                }
                field("Soldering Cost per Hour";"Soldering Cost per Hour")
                {
                }
                field("Development Cost Per Hour";"Development Cost Per Hour")
                {
                }
                field("MI Transfer From Code";"MI Transfer From Code")
                {
                }
            }
            group(Numbering)
            {
                CaptionML = ENU='Numbering',
                            ENN='Numbering';
                field("Simulated Order Nos.";"Simulated Order Nos.")
                {
                }
                field("Planned Order Nos.";"Planned Order Nos.")
                {
                }
                field("Firm Planned Order Nos.";"Firm Planned Order Nos.")
                {
                }
                field("Released Order Nos.";"Released Order Nos.")
                {
                }
                field("Work Center Nos.";"Work Center Nos.")
                {
                }
                field("Machine Center Nos.";"Machine Center Nos.")
                {
                }
                field("Production BOM Nos.";"Production BOM Nos.")
                {
                }
                field("Routing Nos.";"Routing Nos.")
                {
                }
            }
            group(Planning)
            {
                CaptionML = ENU='Planning',
                            ENN='Planning';
                field("Current Production Forecast";"Current Production Forecast")
                {
                }
                field("Use Forecast on Locations";"Use Forecast on Locations")
                {
                }
                field("Default Safety Lead Time";"Default Safety Lead Time")
                {
                }
                field("Blank Overflow Level";"Blank Overflow Level")
                {
                }
                field("No. of Units/Day";"No. of Units/Day")
                {
                }
                field("Consider Exp. Order Material";"Consider Exp. Order Material")
                {
                }
                field("Combined MPS/MRP Calculation";"Combined MPS/MRP Calculation")
                {
                }
                field("Components at Location";"Components at Location")
                {
                }
                field("Default Dampener Period";"Default Dampener Period")
                {
                }
                field("Default Dampener Quantity";"Default Dampener Quantity")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207;Links)
            {
                Visible = false;
            }
            systempart(Control1905767507;Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage();
    begin
        RESET;
        IF NOT GET THEN BEGIN
          INIT;
          INSERT;
        END;
    end;
}

