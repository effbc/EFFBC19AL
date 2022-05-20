report 32000001 "Sale Schedule Item Change Log_"
{
    // version UPG1.3

    // No. sign   Description
    // ---------------------------------------------------
    // 1.3 UPG    BOM Replacement process created this object.

    ProcessingOnly = true;

    dataset
    {
        dataitem("Sale/ Schedule Item Change Log";"Sale/ Schedule Item Change Log")
        {

            trigger OnAfterGetRecord();
            begin
                IF NOT SalesHeader.GET(SalesHeader."Document Type"::Order,"Sale/ Schedule Item Change Log"."Sales Order No.") THEN
                  CLEAR(SalesHeader);
                IF NOT ProductionOrder.GET(ProductionOrder.Status::Released,"Sale/ Schedule Item Change Log"."RPO No.") THEN
                  CLEAR(ProductionOrder);
                ExcelBody;
            end;

            trigger OnPreDataItem();
            begin
                ExcelHeader;
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

    trigger OnPostReport();
    begin
        ExcelBuffer.CreateBookAndOpenExcel('','Sales Schedule','Sales Schedule Item Charge',COMPANYNAME,USERID);
    end;

    trigger OnPreReport();
    begin
        ExcelBuffer.DELETEALL;
    end;

    var
        ExcelBuffer : Record "Excel Buffer" temporary;
        SalesHeader : Record "Sales Header";
        ProductionOrder : Record "Production Order";

    [LineStart(19867)]
    local procedure ExcelHeader();
    begin
        ExcelBuffer.NewRow;
        ExcelBuffer.AddColumn('Sales Order No.',FALSE,'',TRUE,FALSE,FALSE,'',ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Sales Order Line No.',FALSE,'',TRUE,FALSE,FALSE,'',ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Customer No.',FALSE,'',TRUE,FALSE,FALSE,'',ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Customer Name',FALSE,'',TRUE,FALSE,FALSE,'',ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('RPO No',FALSE,'',TRUE,FALSE,FALSE,'',ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('RPO Description',FALSE,'',TRUE,FALSE,FALSE,'',ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Old BOM',FALSE,'',TRUE,FALSE,FALSE,'',ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Replaced BOM',FALSE,'',TRUE,FALSE,FALSE,'',ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Schedule No.',FALSE,'',TRUE,FALSE,FALSE,'',ExcelBuffer."Cell Type"::Text);

    end;

    [LineStart(19880)]
    local procedure ExcelBody();
    begin
        ExcelBuffer.NewRow;
        ExcelBuffer.AddColumn("Sale/ Schedule Item Change Log"."Sales Order No.",FALSE,'',FALSE,FALSE,FALSE,'',ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn("Sale/ Schedule Item Change Log"."Sales Order Line No.",FALSE,'',FALSE,FALSE,FALSE,'',ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(SalesHeader."Sell-to Customer No.",FALSE,'',FALSE,FALSE,FALSE,'',ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(SalesHeader."Sell-to Customer Name",FALSE,'',FALSE,FALSE,FALSE,'',ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn("Sale/ Schedule Item Change Log"."RPO No.",FALSE,'',FALSE,FALSE,FALSE,'',ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(ProductionOrder.Description,FALSE,'',FALSE,FALSE,FALSE,'',ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn("Sale/ Schedule Item Change Log"."Old Item No.",FALSE,'',FALSE,FALSE,FALSE,'',ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn("Sale/ Schedule Item Change Log"."New Item No.",FALSE,'',FALSE,FALSE,FALSE,'',ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn("Sale/ Schedule Item Change Log"."Schedule Line No.",FALSE,'',FALSE,FALSE,FALSE,'',ExcelBuffer."Cell Type"::Text);
    end;
}

