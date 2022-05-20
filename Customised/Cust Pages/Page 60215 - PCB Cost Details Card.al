page 60215 "PCB Cost Details Card"
{
    // version Rev01

    PageType = Card;
    SourceTable = "PCB Cost Details";

    layout
    {
        area(content)
        {
            field("Vendor No.";"Vendor No.")
            {
                Lookup = true;
            }
            field(Name;Name)
            {
            }
            field("PCB Thickness";"PCB Thickness")
            {
            }
            field("Copper Clad Thickness";"Copper Clad Thickness")
            {
            }
            field("Min.Quantity";"Min.Quantity")
            {
            }
            field("Max.Quantity";"Max.Quantity")
            {
            }
            field("Min.Area";"Min.Area")
            {
            }
            field("Max.Area";"Max.Area")
            {
            }
            field(Cost;Cost)
            {
            }
            field("Area";Area)
            {
            }
            field(Date;Date)
            {
            }
            field("PCB TYPE";"PCB TYPE")
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Order")
            {
                Caption = 'Order';
                Image = "Order";
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction();
                begin
                      Newno:='';
                      PurchSetup.GET;
                      PurchaseHeader.INIT;
                      NoSeriesMgt.InitSeries(PurchSetup."Order Nos.",PurchSetup."Order Nos.",TODAY,Newno,series);
                      PurchaseHeader."No.":=Newno;
                      PurchaseHeader."Document Type":=PurchaseHeader."Document Type"::Order;
                      PurchaseHeader."Buy-from Vendor No.":="PCB Thickness";
                      CompanyInfo.GET;
                      PurchaseHeader.Trading := CompanyInfo."Trading Co.";
                      PurchaseHeader.InitRecord;
                      Vend.GET("PCB Thickness");
                      Vend.CheckBlockedVendOnDocs(Vend,FALSE);
                      Vend.TESTFIELD(Vend."Updated in Cashflow",TRUE);
                      Vend.TESTFIELD("Gen. Bus. Posting Group");
                      PurchaseHeader."Buy-from Vendor Name" := Vend.Name;
                      PurchaseHeader."Buy-from Vendor Name 2" := Vend."Name 2";
                      PurchaseHeader."Buy-from Address" := Vend.Address;
                      PurchaseHeader."Buy-from Address 2" := Vend."Address 2";
                      PurchaseHeader."Buy-from Address 3":=Vend."Address 3";
                      PurchaseHeader."Buy-from City" := Vend.City;
                      PurchaseHeader."Buy-from Post Code" := Vend."Post Code";
                      PurchaseHeader."Buy-from County" := Vend.County;
                      PurchaseHeader."Buy-from Country/Region Code" := Vend."Country/Region Code";
                      PurchaseHeader."Buy-from Contact" := Vend.Contact;
                      PurchaseHeader."Gen. Bus. Posting Group" := Vend."Gen. Bus. Posting Group";
                      PurchaseHeader."VAT Bus. Posting Group" := Vend."VAT Bus. Posting Group";
                      PurchaseHeader."Tax Liable" := Vend."Tax Liable";
                      PurchaseHeader."VAT Country/Region Code" := Vend."Country/Region Code";
                      PurchaseHeader."VAT Registration No." := Vend."VAT Registration No.";
                      PurchaseHeader."Responsibility Center" := UserMgt.GetRespCenter(1,Vend."Responsibility Center");
                      PurchaseHeader."Excise Bus. Posting Group" := Vend."Excise Bus. Posting Group";
                      PurchaseHeader.State := Vend."State Code";
                      PurchaseHeader."Purchaser Code":=Vend."Purchaser Code";

                      PurchaseHeader.INSERT;
                end;
            }
        }
    }

    trigger OnInit();
    begin
        CurrPage.LOOKUPMODE := TRUE;
    end;

    var
        Item : Record Item;
        Vendor : Record Vendor;
        pcb : Record "PCB Cost Details";
        NoSeriesMgt : Codeunit NoSeriesManagement;
        PurchaseHeader : Record "Purchase Header";
        Purchaseline : Record "Purchase Line";
        PurchSetup : Record "Purchases & Payables Setup";
        Newno : Code[20];
        series : Code[10];
        Vend : Record Vendor;
        UserMgt : Codeunit "User Setup Management";
        CompanyInfo : Record "Company Information";
}

