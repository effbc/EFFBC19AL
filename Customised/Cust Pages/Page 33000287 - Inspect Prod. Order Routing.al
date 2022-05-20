page 33000287 "Inspect Prod. Order Routing"
{
    // version WIP1.0

    Caption = 'Prod. Order Routing';
    DataCaptionExpression = Caption;
    PageType = ListPart;
    SourceTable = "Ins Prod. Order Routing Line";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Schedule Manually";"Schedule Manually")
                {
                    Visible = false;
                }
                field("Operation No.";"Operation No.")
                {
                }
                field("Previous Operation No.";"Previous Operation No.")
                {
                    Visible = false;
                }
                field("Next Operation No.";"Next Operation No.")
                {
                    Visible = false;
                }
                field(Type;Type)
                {
                }
                field("No.";"No.")
                {
                }
                field(Description;Description)
                {
                }
                field("Starting Date-Time";"Starting Date-Time")
                {
                }
                field("Starting Time";"Starting Time")
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        StartingTimeOnAfterValidate;
                    end;
                }
                field("Starting Date";"Starting Date")
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        StartingDateOnAfterValidate;
                    end;
                }
                field("Ending Date-Time";"Ending Date-Time")
                {
                }
                field("Ending Time";"Ending Time")
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        EndingTimeOnAfterValidate;
                    end;
                }
                field("Ending Date";"Ending Date")
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        EndingDateOnAfterValidate;
                    end;
                }
                field("Setup Time";"Setup Time")
                {
                }
                field("Run Time";"Run Time")
                {
                }
                field("Wait Time";"Wait Time")
                {
                }
                field("Move Time";"Move Time")
                {
                }
                field("Fixed Scrap Quantity";"Fixed Scrap Quantity")
                {
                    Visible = false;
                }
                field("Scrap Factor %";"Scrap Factor %")
                {
                    Visible = false;
                }
                field("Send-Ahead Quantity";"Send-Ahead Quantity")
                {
                    Visible = false;
                }
                field("Concurrent Capacities";"Concurrent Capacities")
                {
                    Visible = false;
                }
                field("Unit Cost per";"Unit Cost per")
                {
                    Visible = false;
                }
                field("Expected Operation Cost Amt.";"Expected Operation Cost Amt.")
                {
                    Visible = false;
                }
                field("Expected Capacity Ovhd. Cost";"Expected Capacity Ovhd. Cost")
                {
                    Visible = false;
                }
                field("Expected Capacity Need";"Expected Capacity Need")
                {
                    Visible = false;
                }
                field("Routing Status";"Routing Status")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }

    [LineStart(23625)]
    local procedure StartingTimeOnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;

    [LineStart(23628)]
    local procedure StartingDateOnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;

    [LineStart(23631)]
    local procedure EndingTimeOnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;

    [LineStart(23634)]
    local procedure EndingDateOnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;
}

