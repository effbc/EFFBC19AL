report 50001 "Inward details"
{
    // version ESPL 1.0

    DefaultLayout = RDLC;
    RDLCLayout = './Inward details.rdlc';

    dataset
    {
        dataitem("Purch. Rcpt. Header";"Purch. Rcpt. Header")
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending);
            RequestFilterFields = "Posting Date","No.","Pay-to Vendor No.","Order No.","Vendor Order No.","Vendor Shipment No.","Location Code";
            column(compinfo_Name;compinfo.Name)
            {
            }
            column(FIlt;FIlt)
            {
            }
            column(Totalamt;Totalamt)
            {
            }
            column(Amtwithtaxes;Amtwithtaxes)
            {
            }
            column("sum";sum)
            {
            }
            column(INWARD_DETAILSCaption;INWARD_DETAILSCaptionLbl)
            {
            }
            column(Vendor_Caption;Vendor_CaptionLbl)
            {
            }
            column(ORDER_NOCaption;ORDER_NOCaptionLbl)
            {
            }
            column(DESCRIPTIONCaption;DESCRIPTIONCaptionLbl)
            {
            }
            column(DC_No_Caption;DC_No_CaptionLbl)
            {
            }
            column(QuantityCaption;QuantityCaptionLbl)
            {
            }
            column(Lot_No_Caption;Lot_No_CaptionLbl)
            {
            }
            column(Serial_No_Caption;Serial_No_CaptionLbl)
            {
            }
            column(Unit_Cost__With_Taxes_Caption;Unit_Cost__With_Taxes_CaptionLbl)
            {
            }
            column(Unit_Cost__With_Out_Taxes_Caption;Unit_Cost__With_Out_Taxes_CaptionLbl)
            {
            }
            column(UOMCaption;UOMCaptionLbl)
            {
            }
            column(Purch__Rcpt__Header_No_;"No.")
            {
            }
            dataitem("Purch. Rcpt. Line";"Purch. Rcpt. Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document No.,Line No.) ORDER(Ascending) WHERE(Quantity=FILTER(>0));
                RequestFilterFields = Type,"No.","Document No.";
                column(PIL__Direct_Unit_Cost;PIL."Direct Unit Cost")
                {
                }
                column(compinfo_Name_Control1000000017;compinfo.Name)
                {
                }
                column(CurrReport_PAGENO;CurrReport.PAGENO)
                {
                }
                column(Purch__Rcpt__Header___Posting_Date_;"Purch. Rcpt. Header"."Posting Date")
                {
                }
                column(Purch__Rcpt__Header___No__;"Purch. Rcpt. Header"."No.")
                {
                }
                column(Purch__Rcpt__Header___Buy_from_Vendor_Name_;"Purch. Rcpt. Header"."Buy-from Vendor Name")
                {
                }
                column(Purch__Rcpt__Header___Order_No__;"Purch. Rcpt. Header"."Order No.")
                {
                }
                column(Purch__Rcpt__Line__Purch__Rcpt__Line__Description;"Purch. Rcpt. Line".Description)
                {
                }
                column(Purch__Rcpt__Header___Vendor_Shipment_No__;"Purch. Rcpt. Header"."Vendor Shipment No.")
                {
                }
                column(Purch__Rcpt__Line_Quantity;Quantity)
                {
                }
                column(Purch__Rcpt__Line__Unit_Cost__LCY__;"Unit Cost (LCY)")
                {
                }
                column(UC;UC)
                {
                }
                column(DESCRIPTIONCaption_Control1000000015;DESCRIPTIONCaption_Control1000000015Lbl)
                {
                }
                column(Page_No_Caption;Page_No_CaptionLbl)
                {
                }
                column(EmptyStringCaption;EmptyStringCaptionLbl)
                {
                }
                column(Lot_No_Caption_Control1000000012;Lot_No_Caption_Control1000000012Lbl)
                {
                }
                column(Serial_No_Caption_Control1000000013;Serial_No_Caption_Control1000000013Lbl)
                {
                }
                column(ORDER_NOCaption_Control1000000024;ORDER_NOCaption_Control1000000024Lbl)
                {
                }
                column(DC_No_Caption_Control1000000038;DC_No_Caption_Control1000000038Lbl)
                {
                }
                column(VendorCaption;VendorCaptionLbl)
                {
                }
                column(Unit_Cost__With_Taxes_Caption_Control1102154003;Unit_Cost__With_Taxes_Caption_Control1102154003Lbl)
                {
                }
                column(Unit_Cost__With_Out_Taxes_Caption_Control1102154004;Unit_Cost__With_Out_Taxes_Caption_Control1102154004Lbl)
                {
                }
                column(QuantityCaption_Control1102154010;QuantityCaption_Control1102154010Lbl)
                {
                }
                column(UOMCaption_Control1102154019;UOMCaption_Control1102154019Lbl)
                {
                }
                column(Purch__Rcpt__Line_Document_No_;"Document No.")
                {
                }
                column(Purch__Rcpt__Line_Line_No_;"Line No.")
                {
                }
                column(Purch__Rcpt__Line_No_;"No.")
                {
                }
                column(test;Test)
                {
                }
                column(Type;"Purch. Rcpt. Line".Type)
                {
                }
                dataitem("Item Ledger Entry";"Item Ledger Entry")
                {
                    DataItemLink = Document No.=FIELD(Document No.),Item No.=FIELD(No.);
                    DataItemTableView = SORTING(Document No.,Item No.,Posting Date) ORDER(Ascending) WHERE(Quantity=FILTER(>0));
                    RequestFilterFields = "Lot No.";
                    column(Purch__Rcpt__Header___No___Control1102154000;"Purch. Rcpt. Header"."No.")
                    {
                    }
                    column(Purch__Rcpt__Header___Posting_Date__Control1102154002;"Purch. Rcpt. Header"."Posting Date")
                    {
                    }
                    column(UC_Control1000000027;UC)
                    {
                    }
                    column(Item_Ledger_Entry__Item_Ledger_Entry___Serial_No__;"Item Ledger Entry"."Serial No.")
                    {
                    }
                    column(Item_Ledger_Entry__Item_Ledger_Entry___Lot_No__;"Item Ledger Entry"."Lot No.")
                    {
                    }
                    column(Item_Ledger_Entry__Item_Ledger_Entry__Quantity;"Item Ledger Entry".Quantity)
                    {
                    }
                    column(Purch__Rcpt__Header___Vendor_Shipment_No___Control1000000041;"Purch. Rcpt. Header"."Vendor Shipment No.")
                    {
                    }
                    column(Purch__Rcpt__Line__Description;"Purch. Rcpt. Line".Description)
                    {
                    }
                    column(Purch__Rcpt__Header___Order_No___Control1000000051;"Purch. Rcpt. Header"."Order No.")
                    {
                    }
                    column(Purch__Rcpt__Header___Buy_from_Vendor_Name__Control1000000052;"Purch. Rcpt. Header"."Buy-from Vendor Name")
                    {
                    }
                    column(Purch__Rcpt__Line___Unit_Cost__LCY__;"Purch. Rcpt. Line"."Unit Cost (LCY)")
                    {
                    }
                    column(Item_Ledger_Entry__Unit_of_Measure_Code_;"Unit of Measure Code")
                    {
                    }
                    column(Item_Ledger_Entry_Entry_No_;"Entry No.")
                    {
                    }
                    column(Item_Ledger_Entry_Document_No_;"Document No.")
                    {
                    }
                    column(Item_Ledger_Entry_Item_No_;"Item No.")
                    {
                    }
                    column(NewOrder;"New Order")
                    {
                    }

                    trigger OnAfterGetRecord();
                    begin
                        //Hack
                        /*ItemEntryRelation.SETCURRENTKEY("Source ID","Source Type");
                        ItemEntryRelation.SETRANGE("Source Type",DATABASE::"Purch. Rcpt. Line");
                        ItemEntryRelation.SETRANGE("Source Subtype",0);
                        ItemEntryRelation.SETRANGE("Source ID","Purch. Rcpt. Line"."Document No.");
                        ItemEntryRelation.SETRANGE("Source Batch Name",'');
                        ItemEntryRelation.SETRANGE("Source Prod. Order Line",0);
                        ItemEntryRelation.SETRANGE("Source Ref. No.","Purch. Rcpt. Line"."Line No.");
                        IF ItemEntryRelation.FINDSET THEN BEGIN
                           IF ("Item Ledger Entry"."Entry No." <> ItemEntryRelation."Item Entry No.") THEN
                            CurrReport.SKIP;
                        END;*/
                        
                        //Hack
                        
                        
                        //Item Ledger Entry, Body (3) - OnPreSection()
                        "Invoiced Date":=0D;
                        AMT:=0;
                        UC:=0;
                        AMT:=PIL."Amount To Vendor";
                        
                        PIH.SETRANGE(PIH."Buy-from Vendor No.","Purch. Rcpt. Header"."Pay-to Vendor No.");     // Find the Purchase Invoice header
                        PIH.SETRANGE(PIH."Vendor Invoice No.","Purch. Rcpt. Header"."Vendor Order No.");
                        IF PIH.FIND('-') THEN
                            "Invoiced Date":=PIH."Posting Date";
                        PIL.SETCURRENTKEY(PIL.Type,PIL."No.",PIL."Variant Code");
                        PIL.SETRANGE(PIL."No.","Purch. Rcpt. Line"."No.");
                        PIL.SETRANGE(PIL."Buy-from Vendor No.","Purch. Rcpt. Header"."Buy-from Vendor No.");
                        PIL.SETRANGE(PIL.Quantity,"Purch. Rcpt. Line".Quantity);
                        PIL.SETRANGE(PIL."Receipt No.","Purch. Rcpt. Header"."No.");
                        IF PIL.FIND('-') THEN BEGIN
                          IF PIL."Gen. Bus. Posting Group"<>'FOREIGN' THEN
                             UC:=PIL."Amount To Vendor"/PIL.Quantity
                          ELSE BEGIN
                            Structure_Amount:=0;
                            StrOrdLineDetails.SETRANGE(StrOrdLineDetails.Type,StrOrdLineDetails.Type::Purchase);
                            StrOrdLineDetails.SETRANGE(StrOrdLineDetails."Document Type",StrOrdLineDetails."Document Type"::Invoice);
                            StrOrdLineDetails.SETRANGE(StrOrdLineDetails."Invoice No.",PIL."Document No.");
                            StrOrdLineDetails.SETRANGE(StrOrdLineDetails."Line No.",PIL."Line No.");
                            IF StrOrdLineDetails.FIND('-') THEN
                            REPEAT
                              IF StrOrdLineDetails."Tax/Charge Type"<>StrOrdLineDetails."Tax/Charge Type"::Dummy THEN
                                 Structure_Amount+=StrOrdLineDetails."Amount (LCY)"
                              ELSE
                                 Structure_Amount+=StrOrdLineDetails."Calculation Value";
                            UNTIL StrOrdLineDetails.NEXT=0;
                            UC:=((PIL."Unit Cost (LCY)"*PIL.Quantity)+Structure_Amount)/
                                                    PIL.Quantity;
                          END;
                        END;
                        
                          IF "Item Ledger Entry"."Serial No." <>'' THEN
                              AMT:=UC;
                          Line_Total:="Purch. Rcpt. Line".Quantity*UC;
                          "TOT AMT"+=Line_Total;
                         "New Order":=FALSE;
                         sum := sum+"Item Ledger Entry".Quantity;
                        //Item Ledger Entry, Body (3) - OnPreSection()

                    end;

                    trigger OnPostDataItem();
                    begin
                         //MESSAGE('%1',"TOT AMT")
                    end;

                    trigger OnPreDataItem();
                    begin
                        //Rev01

                        //Item Ledger Entry, Body (2) - OnPreSection()
                        //CurrReport.SHOWOUTPUT("New Order");
                        //Item Ledger Entry, Body (2) - OnPreSection()
                    end;
                }

                trigger OnAfterGetRecord();
                begin
                     Line_Total:=0;
                    //Rev01
                    
                    /*
                    //Purch. Rcpt. Line, Header (1) - OnPreSection()
                    IF  "Item Ledger Entry".COUNT = 0  THEN
                      CurrReport.SHOWOUTPUT :=FALSE
                    ELSE BEGIN
                      CurrReport.SHOWOUTPUT:=TRUE;
                    END;
                    //Purch. Rcpt. Line, Header (1) - OnPreSection()
                    */
                    
                    Test:=0;
                    //Purch. Rcpt. Line, GroupHeader (3) - OnPreSection()
                     //CurrReport.SHOWOUTPUT("Purch. Rcpt. Line".Type<>"Purch. Rcpt. Line".Type::Item);
                    //Purch. Rcpt. Line, GroupHeader (3) - OnPreSection()
                    
                    //Purch. Rcpt. Line, Body (4) - OnPreSection()
                    IF "Purch. Rcpt. Line".Type<>"Purch. Rcpt. Line".Type::Item THEN
                    BEGIN
                    Test:=10;
                    PIL.SETCURRENTKEY(PIL.Type,PIL."No.",PIL."Variant Code");
                    PIL.SETRANGE(PIL."No.","Purch. Rcpt. Line"."No.");
                    PIL.SETRANGE(PIL."Buy-from Vendor No.","Purch. Rcpt. Header"."Buy-from Vendor No.");
                    PIL.SETRANGE(PIL.Quantity,"Purch. Rcpt. Line".Quantity);
                    PIL.SETRANGE(PIL."Receipt No.","Purch. Rcpt. Header"."No.");
                    IF PIL.FIND('-') THEN BEGIN
                      IF PIL."Gen. Bus. Posting Group"<>'FOREIGN' THEN
                         UC:=PIL."Amount To Vendor"/PIL.Quantity
                      ELSE BEGIN
                        Structure_Amount:=0;
                        StrOrdLineDetails.SETRANGE(StrOrdLineDetails.Type,StrOrdLineDetails.Type::Purchase);
                        StrOrdLineDetails.SETRANGE(StrOrdLineDetails."Document Type",StrOrdLineDetails."Document Type"::Invoice);
                        StrOrdLineDetails.SETRANGE(StrOrdLineDetails."Invoice No.",PIL."Document No.");
                        StrOrdLineDetails.SETRANGE(StrOrdLineDetails."Line No.",PIL."Line No.");
                        IF StrOrdLineDetails.FIND('-') THEN
                        REPEAT
                          IF StrOrdLineDetails."Tax/Charge Type"<>StrOrdLineDetails."Tax/Charge Type"::Dummy THEN
                             Structure_Amount+=StrOrdLineDetails."Amount (LCY)"
                          ELSE
                             Structure_Amount+=StrOrdLineDetails."Calculation Value";
                        UNTIL StrOrdLineDetails.NEXT=0;
                        UC:=((PIL."Unit Cost (LCY)"*PIL.Quantity)+Structure_Amount)/
                                                PIL.Quantity;
                      END;
                    
                     Totalamt := Totalamt+PIL."Direct Unit Cost";
                     Amtwithtaxes := Amtwithtaxes+UC;
                    
                    END;
                    END;
                    //Purch. Rcpt. Line, Body (4) - OnPreSection()

                end;

                trigger OnPreDataItem();
                begin
                    
                    //Purch. Rcpt. Line, Header (1) - OnPreSection()
                    /*IF  "Item Ledger Entry".COUNT = 0  THEN
                      CurrReport.SHOWOUTPUT :=FALSE
                    ELSE BEGIN
                      CurrReport.SHOWOUTPUT:=TRUE;
                    END;
                    */
                    //Purch. Rcpt. Line, Header (1) - OnPreSection()
                    
                     //aded by swathi on 26-sep-13

                end;
            }

            trigger OnAfterGetRecord();
            begin
                "TOT AMT":=0;
                "New Order":=TRUE;
            end;

            trigger OnPreDataItem();
            begin
                sum:=0;
                FIlt:="Purch. Rcpt. Header".GETFILTERS;
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
        counter : Integer;
        compinfo : Record "Company Information";
        PIL : Record "Purch. Inv. Line";
        PIH : Record "Purch. Inv. Header";
        UC : Decimal;
        AMT : Decimal;
        "Invoiced Date" : Date;
        "Inward date" : Date;
        "TOT AMT" : Decimal;
        Line_Total : Decimal;
        "New Order" : Boolean;
        FIlt : Text[250];
        Totalamt : Decimal;
        Amtwithtaxes : Decimal;
        StrOrdLineDetails : Record "Posted Str Order Line Details";
        Structure_Amount : Decimal;
        "sum" : Decimal;
        INWARD_DETAILSCaptionLbl : Label 'INWARD DETAILS';
        Vendor_CaptionLbl : Label '"Vendor "';
        ORDER_NOCaptionLbl : Label 'ORDER NO';
        DESCRIPTIONCaptionLbl : Label 'DESCRIPTION';
        DC_No_CaptionLbl : Label '" DC No."';
        QuantityCaptionLbl : Label 'Quantity';
        Lot_No_CaptionLbl : Label 'Lot No.';
        Serial_No_CaptionLbl : Label 'Serial No.';
        Unit_Cost__With_Taxes_CaptionLbl : Label 'Unit Cost (With Taxes)';
        Unit_Cost__With_Out_Taxes_CaptionLbl : Label 'Unit Cost (With Out Taxes)';
        UOMCaptionLbl : Label 'UOM';
        DESCRIPTIONCaption_Control1000000015Lbl : Label 'DESCRIPTION';
        Page_No_CaptionLbl : Label 'Page No.';
        EmptyStringCaptionLbl : Label ':';
        Lot_No_Caption_Control1000000012Lbl : Label 'Lot No.';
        Serial_No_Caption_Control1000000013Lbl : Label 'Serial No.';
        ORDER_NOCaption_Control1000000024Lbl : Label 'ORDER NO';
        DC_No_Caption_Control1000000038Lbl : Label '" DC No."';
        VendorCaptionLbl : Label 'Vendor';
        Unit_Cost__With_Taxes_Caption_Control1102154003Lbl : Label 'Unit Cost (With Taxes)';
        Unit_Cost__With_Out_Taxes_Caption_Control1102154004Lbl : Label 'Unit Cost (With Out Taxes)';
        QuantityCaption_Control1102154010Lbl : Label 'Quantity';
        UOMCaption_Control1102154019Lbl : Label 'UOM';
        ItemEntryRelation : Record "Item Entry Relation";
        Test : Decimal;
}

