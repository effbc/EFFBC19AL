report 50057 "Issued Material Report_Costing"
{
    // version santhosh,Eff02,EFFUPG

    //      EnterHeadings(Row,21,'Vendor Name',TRUE);
    //      EnterHeadings(Row,22,'Inward Date',TRUE);
    //      EnterHeadings(Row,23,'Purchase Order No.',TRUE);
    //      EnterHeadings(Row,24, 'Vendor Shipment No.',TRUE);
    DefaultLayout = RDLC;
    RDLCLayout = './Issued Material Report_Costing.rdlc';


    dataset
    {
        dataitem("Posted Material Issues Header"; "Posted Material Issues Header")
        {
            DataItemTableView = SORTING(Prod. Order No., Prod. Order Line No.);
            RequestFilterFields = "Material Issue No.", "Posting Date", "Resource Name", "Reason Code", "Transfer-to Code", "Transfer-from Code", "Prod. Order No.";
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(USERID; USERID)
            {
            }
            column(TODAY; TODAY)
            {
            }
            column(COMPANYNAME_Control1102154003; COMPANYNAME)
            {
            }
            column(USERID_Control1102154016; USERID)
            {
            }
            column(TODAY_Control1102154017; TODAY)
            {
            }
            column(Posted_Material_Issues_Header__Prod__Order_No__; "Prod. Order No.")
            {
            }
            column(Project_Desc; Project_Desc)
            {
            }
            column(Project_Total_; "Project Total")
            {
            }
            column(R_D_total_; "R&D total")
            {
            }
            column(Total; Total)
            {
            }
            column(Total_Qty; Total_Qty)
            {
            }
            column(Material_IssuesCaption; Material_IssuesCaptionLbl)
            {
            }
            column(Project_CodeCaption; Project_CodeCaptionLbl)
            {
            }
            column(Requisition_NoCaption; Requisition_NoCaptionLbl)
            {
            }
            column(Item_Caption; Item_CaptionLbl)
            {
            }
            column(UOMCaption; UOMCaptionLbl)
            {
            }
            column(Employee_NameCaption; Employee_NameCaptionLbl)
            {
            }
            column(Reqested_DateCaption; Reqested_DateCaptionLbl)
            {
            }
            column(DeptCaption; DeptCaptionLbl)
            {
            }
            column(Quantity_RequestedCaption; Quantity_RequestedCaptionLbl)
            {
            }
            column(Quantity_ReceivedCaption; Quantity_ReceivedCaptionLbl)
            {
            }
            column(Unit_costCaption; Unit_costCaptionLbl)
            {
            }
            column(LOT_No_Caption; LOT_No_CaptionLbl)
            {
            }
            column(Serial_No_Caption; Serial_No_CaptionLbl)
            {
            }
            column(Bench_MarkCaption; Bench_MarkCaptionLbl)
            {
            }
            column(Vendor_NameCaption; Vendor_NameCaptionLbl)
            {
            }
            column(Bill_No_Caption; Bill_No_CaptionLbl)
            {
            }
            column(Bill_DateCaption; Bill_DateCaptionLbl)
            {
            }
            column(Issued_Date_TimeCaption; Issued_Date_TimeCaptionLbl)
            {
            }
            column(Material_IssuesCaption_Control1102154002; Material_IssuesCaption_Control1102154002Lbl)
            {
            }
            column(Project_CodeCaption_Control1102154004; Project_CodeCaption_Control1102154004Lbl)
            {
            }
            column(ValueCaption; ValueCaptionLbl)
            {
            }
            column(Project_DescriptionCaption; Project_DescriptionCaptionLbl)
            {
            }
            column(Posted_Material_Issues_Header_No_; "No.")
            {
            }
            column(Choice3; Choice3)
            {
            }
            dataitem("Posted Material Issues Line"; "Posted Material Issues Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document No., Item No.) WHERE(Quantity = FILTER(> 0));
                RequestFilterFields = "Item No.";
                column(Posted_Material_Issues_Header___Reason_Code_; "Posted Material Issues Header"."Reason Code")
                {
                }
                column(Posted_Material_Issues_Line__Material_Issue_No__; "Material Issue No.")
                {
                }
                column(Posted_Material_Issues_Line__Posted_Material_Issues_Line__Description; "Posted Material Issues Line".Description)
                {
                }
                column(Posted_Material_Issues_Line__Unit_of_Measure_; "Unit of Measure")
                {
                }
                column(Posted_Material_Issues_Header___Resource_Name_; "Posted Material Issues Header"."Resource Name")
                {
                }
                column(Posted_Material_Issues_Line__Posted_Material_Issues_Line___Issued_DateTime_; "Posted Material Issues Line"."Issued DateTime")
                {
                }
                column(Posted_Material_Issues_Header___Transfer_from_Code_; "Posted Material Issues Header"."Transfer-from Code")
                {
                }
                column(QTY; QTY)
                {
                }
                column(Posted_Material_Issues_Line__Posted_Material_Issues_Line__Quantity; "Posted Material Issues Line".Quantity)
                {
                }
                column(UC; UC)
                {
                }
                column(Posted_Material_Issues_Header___Released_Date_; "Posted Material Issues Header"."Released Date")
                {
                }
                column(Lot; Lot)
                {
                }
                column(Serial_no_; "Serial no")
                {
                }
                column(Bench_Mark_; "Bench-Mark")
                {
                }
                column(Reason; Reason)
                {
                }
                column(Posted_Material_Issues_Line__Material_Issue_No___Control1000000025; "Material Issue No.")
                {
                }
                column(Posted_Material_Issues_Line__Posted_Material_Issues_Line__Description_Control1000000026; "Posted Material Issues Line".Description)
                {
                }
                column(Posted_Material_Issues_Line__Unit_of_Measure__Control1000000027; "Unit of Measure")
                {
                }
                column(Posted_Material_Issues_Header___Resource_Name__Control1000000028; "Posted Material Issues Header"."Resource Name")
                {
                }
                column(Posted_Material_Issues_Line__Posted_Material_Issues_Line___Issued_DateTime__Control1000000029; "Posted Material Issues Line"."Issued DateTime")
                {
                }
                column(Posted_Material_Issues_Line__Transfer_to_Code_; "Transfer-to Code")
                {
                }
                column(QTY_Control1000000031; QTY)
                {
                }
                column(Posted_Material_Issues_Line__Posted_Material_Issues_Line__Quantity_Control1000000032; "Posted Material Issues Line".Quantity)
                {
                }
                column(UC_Control1000000033; UC)
                {
                }
                column(Make; Make)
                {
                }
                column(Posted_Material_Issues_Header___Released_Date__Control1000000036; "Posted Material Issues Header"."Released Date")
                {
                }
                column(Lot_Control1000000041; Lot)
                {
                }
                column(Serial_no__Control1000000042; "Serial no")
                {
                }
                column(Bench_Mark__Control1102154010; "Bench-Mark")
                {
                }
                column(Reason_Control1000000054; Reason)
                {
                }
                column(Posted_Material_Issues_Line__Material_Issue_No___Control1000000055; "Material Issue No.")
                {
                }
                column(Posted_Material_Issues_Line__Posted_Material_Issues_Line__Description_Control1000000056; "Posted Material Issues Line".Description)
                {
                }
                column(Posted_Material_Issues_Line__Unit_of_Measure__Control1000000057; "Unit of Measure")
                {
                }
                column(Posted_Material_Issues_Header___Resource_Name__Control1000000058; "Posted Material Issues Header"."Resource Name")
                {
                }
                column(Posted_Material_Issues_Line__Posted_Material_Issues_Line___Issued_DateTime__Control1000000059; "Posted Material Issues Line"."Issued DateTime")
                {
                }
                column(Posted_Material_Issues_Header___Transfer_from_Code__Control1000000060; "Posted Material Issues Header"."Transfer-from Code")
                {
                }
                column(QTY_Control1000000061; QTY)
                {
                }
                column(Posted_Material_Issues_Line__Posted_Material_Issues_Line__Quantity_Control1000000062; "Posted Material Issues Line".Quantity)
                {
                }
                column(UC_Control1000000063; UC)
                {
                }
                column(Posted_Material_Issues_Header___Released_Date__Control1000000037; "Posted Material Issues Header"."Released Date")
                {
                }
                column(Lot_Control1000000045; Lot)
                {
                }
                column(Serial_no__Control1000000046; "Serial no")
                {
                }
                column(Bench_Mark__Control1102154012; "Bench-Mark")
                {
                }
                column(Posted_Material_Issues_Line__Material_Issue_No___Control1000000015; "Material Issue No.")
                {
                }
                column(Posted_Material_Issues_Line__Posted_Material_Issues_Line__Description_Control1000000013; "Posted Material Issues Line".Description)
                {
                }
                column(Posted_Material_Issues_Line__Unit_of_Measure__Control1000000012; "Unit of Measure")
                {
                }
                column(Posted_Material_Issues_Header___Resource_Name__Control1000000016; "Posted Material Issues Header"."Resource Name")
                {
                }
                column(Posted_Material_Issues_Line__Posted_Material_Issues_Line___Issued_DateTime__Control1000000017; "Posted Material Issues Line"."Issued DateTime")
                {
                }
                column(Posted_Material_Issues_Line__Transfer_to_Code__Control1000000011; "Transfer-to Code")
                {
                }
                column(QTY_Control1000000018; QTY)
                {
                }
                column(Posted_Material_Issues_Line__Posted_Material_Issues_Line__Quantity_Control1000000010; "Posted Material Issues Line".Quantity)
                {
                }
                column(UC_Control1000000019; UC)
                {
                }
                column(Posted_Material_Issues_Header___Released_Date__Control1000000038; "Posted Material Issues Header"."Released Date")
                {
                }
                column(Lot_Control1000000047; Lot)
                {
                }
                column(Serial_no__Control1000000048; "Serial no")
                {
                }
                column(Posted_Material_Issues_Header___Prod__Order_No__; "Posted Material Issues Header"."Prod. Order No.")
                {
                }
                column(Bench_Mark__Control1102154015; "Bench-Mark")
                {
                }
                column(vendor; vendor)
                {
                }
                column(BILLNO__; "BILLNO.")
                {
                }
                column(BillDate; BillDate)
                {
                }
                column(DaysCaption; DaysCaptionLbl)
                {
                }
                column(DaysCaption_Control1102154011; DaysCaption_Control1102154011Lbl)
                {
                }
                column(DaysCaption_Control1102154013; DaysCaption_Control1102154013Lbl)
                {
                }
                column(DaysCaption_Control1102154018; DaysCaption_Control1102154018Lbl)
                {
                }
                column(Posted_Material_Issues_Line_Document_No_; "Document No.")
                {
                }
                column(Posted_Material_Issues_Line_Line_No_; "Line No.")
                {
                }
                column(Posted_Material_Issues_Line_Item_No_; "Item No.")
                {
                }
                column(Choice1; Choice1)
                {
                }
                column(GrpFVisible1; GrpFVisible1)
                {
                }
                column(GrpFVisible2; GrpFVisible2)
                {
                }
                column(GrpFVisible3; GrpFVisible3)
                {
                }
                column(GrpFVisible4; GrpFVisible4)
                {
                }
                column(GrpFVisible5; GrpFVisible5)
                {
                }
                column(UNIT_COST; UNIT_COST)
                {
                }
                column(ADD_DUTY; ADD_DUTY)
                {
                }
                column(BC; BC)
                {
                }
                column(CUSTOMS_DU; CUSTOMS_DU)
                {
                }
                column(E_CESS; E_CESS)
                {
                }
                column(E_CESS_1; E_CESS_1)
                {
                }
                column(E_CESS_2; E_CESS_2)
                {
                }
                column(E_CESS_3; E_CESS_3)
                {
                }
                column(E_CESS_4; E_CESS_4)
                {
                }
                column(E_CESS_5; E_CESS_5)
                {
                }
                column(FORWARDING; FORWARDING)
                {
                }
                column(FREIGHT_G; FREIGHT_G)
                {
                }
                column(FREIGHT_1; FREIGHT_1)
                {
                }
                column(FREIGHT_2; FREIGHT_2)
                {
                }
                column(HANDLING; HANDLING)
                {
                }
                column(INSTAL_CHA; INSTAL_CHA)
                {
                }
                column(INSURANCE; INSURANCE)
                {
                }
                column(PACKING; PACKING)
                {
                }
                column(ROUNDING_G; ROUNDING_G)
                {
                }
                column(SERV_TAX; SERV_TAX)
                {
                }
                column(SERVICETAX_G; SERVICETAX_G)
                {
                }
                column(EXCISE; EXCISE)
                {
                }
                column(FREIGHT_C1; FREIGHT_C1)
                {
                }
                column(ROUNDING_C; ROUNDING_C)
                {
                }
                column(SALES_TAX; SALES_TAX)
                {
                }
                column(SERVICE_TA; SERVICE_TA)
                {
                }
                column(SERVICETAX_C; SERVICETAX_C)
                {
                }
                column(ST; ST)
                {
                }
                column(VAT; VAT)
                {
                }
                column(taxStructure; taxStructure)
                {
                }
                column(PurchOrder; PurchOrder)
                {
                }
                column(invoice; invoice)
                {
                }
                column(unitCostwithTax; unitCostwithTax)
                {
                }
                column(unitCostwithoutexcise; unitCostwithoutexcise)
                {
                }
                column(TotalCost; TotalCost)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    GrpFVisible1 := TRUE;
                    GrpFVisible2 := TRUE;
                    GrpFVisible3 := TRUE;
                    GrpFVisible4 := TRUE;
                    GrpFVisible5 := TRUE;

                    UC := 0;
                    IF Choice1 = Choice1::Damage THEN BEGIN
                        IF NOT (("Posted Material Issues Header"."Reason Code" = 'Damage') OR ("Posted Material Issues Header"."Transfer-to Code" = 'DAMAGE')) THEN
                            CurrReport.SKIP;
                    END ELSE
                        IF Choice1 = Choice1::Normal THEN BEGIN
                            IF "Posted Material Issues Line"."Transfer-to Code" = 'DAMAGE' THEN BEGIN
                                CurrReport.SKIP;
                                //  MESSAGE("Posted Material Issues Line"."Item No.");
                            END;
                        END;
                    // copy code from Posted Material Issues Line, GroupHeader - OnPostSection() >>
                    IF PrevItemNo <> "Posted Material Issues Line"."Item No." THEN BEGIN
                        "Bench-Mark" := 0;
                        PrevItemNo := "Posted Material Issues Line"."Item No.";
                        QTY_Received := 0;
                    END;
                    // copy code from // Posted Material Issues Line, GroupHeader - OnPostSection() <<



                    // copy code from // Posted Material Issues Line, Body (2) - OnPostSection() >>
                    ILE.RESET;//Rev01
                    ILE.SETCURRENTKEY(ILE."Document No.", ILE."Item No.", ILE."Posting Date");
                    ILE.SETRANGE(ILE."Document No.", "Posted Material Issues Line"."Document No.");
                    ILE.SETRANGE(ILE."Item No.", "Posted Material Issues Line"."Item No.");
                    ILE.SETRANGE(ILE."Entry Type", ILE."Entry Type"::Transfer);
                    IF ILE.FIND('-') THEN
                        Lot := ILE."Lot No."
                    ELSE
                        Lot := 'no';
                    QTY_Received += "Posted Material Issues Line".Quantity;
                    // copy code from // Posted Material Issues Line, Body (2) - OnPostSection() <<
                    // copy code from // Posted Material Issues Line, GroupFooter - OnPostSection() >>
                    IF Choice3 = Choice3::Issue THEN BEGIN
                        IF Choice1 = Choice1::Damage THEN BEGIN
                            IF Choice2 = Choice2::Used THEN BEGIN
                                "Serial no" := '';
                                "material issues line".RESET;//Rev01
                                "material issues line".SETRANGE("material issues line"."Document No.", "Posted Material Issues Line"."Material Issue No.");
                                "material issues line".SETRANGE("material issues line"."Item No.", "Posted Material Issues Line"."Item No.");
                                IF "material issues line".FIND('-') THEN
                                    QTY := "material issues line".Quantity
                                ELSE
                                    QTY := "Posted Material Issues Line".Quantity;
                                IF "Posted Material Issues Header"."Reason Code" = '' THEN
                                    Reason := "Posted Material Issues Header"."Prod. Order No."
                                ELSE
                                    Reason := "Posted Material Issues Header"."Reason Code";
                                Item.RESET;//Rev01
                                Item.SETRANGE(Item."No.", "Posted Material Issues Line"."Item No.");
                                IF Item.FIND('-') THEN BEGIN
                                    UC := Item."Avg Unit Cost";
                                    //Make:= Item.Make;
                                END;
                                //UC:="Posted Material Issues Line"."Avg. unit cost";
                                Total += "Posted Material Issues Line"."Quantity (Base)" * UC;
                                Lot := '';
                                "Issued Date" := DT2DATE("Posted Material Issues Header"."Issued DateTime");
                                IF ("Posted Material Issues Header"."Released Date" > 0D) AND ("Issued Date" > 0D) THEN
                                    "Bench-Mark" := "Issued Date" - "Posted Material Issues Header"."Released Date";
                                ILE.RESET;//Rev01
                                ILE.SETCURRENTKEY(ILE."Document No.", ILE."Item No.", ILE."Posting Date");
                                ILE.SETFILTER(ILE."Location Code", 'STR');
                                ILE.SETRANGE(ILE."Document No.", "Posted Material Issues Line"."Document No.");
                                ILE.SETRANGE(ILE."Item No.", "Posted Material Issues Line"."Item No.");
                                IF ILE.FIND('-') THEN BEGIN
                                    Lot := ILE."Lot No.";
                                    "Serial no" := ILE."Serial No.";
                                END;
                                GrpFVisible1 := TRUE; //Hack
                                Total_Qty += "Posted Material Issues Line".Quantity;
                            END ELSE
                                GrpFVisible1 := FALSE;
                        END ELSE
                            GrpFVisible1 := FALSE;
                    END ELSE
                        GrpFVisible1 := FALSE;
                    // copy code from // Posted Material Issues Line, GroupFooter - OnPostSection() <<

                    // copy code from // Posted Material Issues Line, GroupFooter - OnPostSection() >>
                    IF Choice3 = Choice3::Issue THEN BEGIN
                        IF Choice1 = Choice1::Return THEN BEGIN
                            "Posted Material Issues Header".SETRANGE("Posted Material Issues Header"."Transfer-to Code", 'STR');//Hack
                            "material issues line".RESET;//Rev01
                            "material issues line".SETRANGE("material issues line"."Document No.", "Posted Material Issues Line"."Material Issue No.");
                            "material issues line".SETRANGE("material issues line"."Item No.", "Posted Material Issues Line"."Item No.");
                            IF "material issues line".FIND('-') THEN
                                QTY := "material issues line".Quantity
                            ELSE
                                QTY := "Posted Material Issues Line".Quantity;
                            IF "Posted Material Issues Header"."Reason Code" = '' THEN
                                Reason := "Posted Material Issues Header"."Prod. Order No."
                            ELSE
                                Reason := "Posted Material Issues Header"."Reason Code";
                            /*
                            Item.SETRANGE(Item."No.","Posted Material Issues Line"."Item No.") ;
                            IF Item.FIND('-') THEN
                            UC:=Item."Avg Unit Cost";
                            */
                            UC := "Posted Material Issues Line"."Avg. unit cost";
                            Lot := '';
                            "Serial no" := '';
                            Total += "Posted Material Issues Line"."Quantity (Base)" * UC;
                            ILE.RESET;//Rwev01
                            ILE.SETCURRENTKEY(ILE."Document No.", ILE."Item No.", ILE."Posting Date");
                            ILE.SETFILTER(ILE."Location Code", 'STR');
                            ILE.SETRANGE(ILE."Document No.", "Posted Material Issues Line"."Document No.");
                            ILE.SETRANGE(ILE."Item No.", "Posted Material Issues Line"."Item No.");
                            IF ILE.FIND('-') THEN BEGIN
                                Lot := ILE."Lot No.";
                                "Serial no" := ILE."Serial No.";
                            END;
                            Total_Qty += "Posted Material Issues Line".Quantity;
                            GrpFVisible2 := TRUE;
                        END ELSE
                            GrpFVisible2 := FALSE;
                    END ELSE
                        GrpFVisible2 := FALSE;
                    // copy code from // Posted Material Issues Line, GroupFooter - OnPostSection() <<

                    // copy code from // Posted Material Issues Line, GroupFooter - OnPostSection() >>
                    IF Choice3 = Choice3::Issue THEN BEGIN
                        IF Choice1 = Choice1::Damage THEN BEGIN
                            IF Choice2 = Choice2::NotUsed THEN BEGIN
                                GrpFVisible3 := TRUE;
                                "material issues line".RESET;//Rev01
                                "material issues line".SETRANGE("material issues line"."Document No.", "Posted Material Issues Line"."Material Issue No.");
                                "material issues line".SETRANGE("material issues line"."Item No.", "Posted Material Issues Line"."Item No.");
                                IF "material issues line".FIND('-') THEN
                                    QTY := "material issues line".Quantity
                                ELSE
                                    QTY := "Posted Material Issues Line".Quantity;
                                IF "Posted Material Issues Header"."Reason Code" = '' THEN
                                    Reason := "Posted Material Issues Header"."Prod. Order No."
                                ELSE
                                    Reason := "Posted Material Issues Header"."Reason Code";

                                UC := "Posted Material Issues Line"."Avg. unit cost";

                                IF UC = 0 THEN BEGIN
                                    IF Item.GET("Posted Material Issues Line"."Item No.") THEN
                                        UC := Item."Avg Unit Cost";
                                END;

                                Total += "Posted Material Issues Line"."Quantity (Base)" * UC;
                                "Project Total" += "Posted Material Issues Line"."Quantity (Base)" * UC;
                                Lot := '';
                                "Serial no" := '';
                                ILE.RESET;//Rev01
                                ILE.SETCURRENTKEY(ILE."Document No.", ILE."Item No.", ILE."Posting Date");
                                ILE.SETFILTER(ILE."Location Code", 'STR');
                                ILE.SETRANGE(ILE."Document No.", "Posted Material Issues Line"."Document No.");
                                ILE.SETRANGE(ILE."Item No.", "Posted Material Issues Line"."Item No.");
                                IF ILE.FIND('-') THEN BEGIN
                                    Lot := ILE."Lot No.";
                                    "Serial no" := ILE."Serial No.";
                                END;
                                Total_Qty += "Posted Material Issues Line".Quantity;
                            END ELSE
                                GrpFVisible3 := FALSE;
                        END ELSE
                            GrpFVisible3 := FALSE;
                    END ELSE
                        GrpFVisible3 := FALSE;
                    // copy code from // Posted Material Issues Line, GroupFooter - OnPostSection() <<

                    // copy code from // Posted Material Issues Line, GroupFooter - OnPostSection() <<
                    IF Choice1 = Choice1::Normal THEN BEGIN
                        IF ("Posted Material Issues Header"."Transfer-to Code" = 'STR') OR ("Posted Material Issues Header"."Transfer-to Code" = 'DAMAGE') THEN BEGIN
                            GrpFVisible4 := FALSE
                        END ELSE BEGIN
                            "material issues line".RESET;//Rev01
                            "material issues line".SETRANGE("material issues line"."Document No.", "Posted Material Issues Line"."Material Issue No.");
                            "material issues line".SETRANGE("material issues line"."Item No.", "Posted Material Issues Line"."Item No.");
                            IF "material issues line".FIND('-') THEN
                                QTY := "material issues line".Quantity
                            ELSE
                                QTY := "Posted Material Issues Line".Quantity;


                            IF "Posted Material Issues Header"."Prod. Order No." = '' THEN
                                Reason := "Posted Material Issues Header"."Prod. Order No."
                            ELSE
                                Reason := "Posted Material Issues Header"."Reason Code";

                            Issued_Qty := 0;
                            Ret_Qty := 0;
                            Issued_Qty := "Posted Material Issues Line".Quantity;
                            // Total+="Posted Material Issues Line"."Quantity (Base)"*UC;
                            // ileref:='';
                            Lot := '';
                            "Serial no" := '';
                            "Prod. Order Description" := '';


                            PO.RESET;
                            PO.SETRANGE(PO."No.", "Posted Material Issues Line"."Prod. Order No.");
                            IF PO.FINDFIRST THEN
                                "Prod. Order Description" := PO.Description;
                            ILE.RESET;//Rev01
                            ILE.SETCURRENTKEY(ILE."Document No.", ILE."Item No.", ILE."Posting Date");
                            ILE.SETFILTER(ILE."Entry Type", 'Transfer');
                            //ILE.SETFILTER(ILE."Location Code","Posted Material Issues Line"."Transfer-to Code");
                            ILE.SETFILTER(ILE.Quantity, '>%1', 0);
                            ILE.SETFILTER(ILE."Document No.", "Posted Material Issues Line"."Document No.");
                            ILE.SETFILTER(ILE."Item No.", "Posted Material Issues Line"."Item No.");
                            IF ILE.FIND('-') THEN
                                REPEAT
                                    Lot := ILE."Lot No.";
                                    "Serial no" := ILE."Serial No.";
                                    IF Consider_Return THEN BEGIN
                                        Ret_Qty += ILE.Quantity - ILE."Remaining Quantity";
                                    END;
                                UNTIL ILE.NEXT = 0;
                            IF Consider_Return THEN BEGIN
                                Issued_Qty := Issued_Qty - Ret_Qty;
                            END;

                            UC := 0;

                            IF UC = 0 THEN BEGIN
                                IF Item.GET("Posted Material Issues Line"."Item No.") THEN
                                    UC := Item."Avg Unit Cost";
                            END;     //cometed by anil

                            amount := 0;
                            vendor := '';
                            "BILLNO." := '';
                            BillDate := 0D;
                            UC := 0;
                            PurchOrder := '';
                            invoice := '';
                            ADD_DUTY := 0;
                            BC := 0;
                            CUSTOMS_DU := 0;
                            E_CESS := 0;
                            E_CESS_1 := 0;
                            E_CESS_2 := 0;
                            E_CESS_3 := 0;
                            E_CESS_4 := 0;
                            E_CESS_5 := 0;
                            FORWARDING := 0;
                            FREIGHT_G := 0;
                            FREIGHT_1 := 0;
                            FREIGHT_2 := 0;
                            HANDLING := 0;
                            INSTAL_CHA := 0;
                            INSURANCE := 0;
                            PACKING := 0;
                            ROUNDING_G := 0;
                            SERV_TAX := 0;
                            SERVICETAX_G := 0;
                            EXCISE := 0;
                            FREIGHT_C1 := 0;
                            ROUNDING_C := 0;
                            SALES_TAX := 0;
                            SERVICE_TA := 0;
                            SERVICETAX_C := 0;
                            ST := 0;
                            VAT := 0;
                            UNIT_COST := 0;
                            unitCostwithTax := 0;
                            unitCostwithoutexcise := 0;
                            TotalCost := 0;
                            taxStructure := '';
                            vendor := '';


                            Item_Batch.RESET;
                            Item_Batch.SETFILTER(Item_Batch."Item No.", "Posted Material Issues Line"."Item No.");
                            Item_Batch.SETFILTER(Item_Batch."Lot No.", Lot);
                            IF Item_Batch.FINDFIRST THEN BEGIN
                                UC := Item_Batch."Unit Cost";
                            END ELSE BEGIN
                                BillDate := 0D;
                                ileref := '';
                                TESTINV := 0;
                                IF STRPOS(Lot, '\') > 0 THEN
                                    lotL := COPYSTR(Lot, 1, STRPOS(Lot, '\') - 1);
                                ITEMLED.RESET;
                                ITEMLED.SETCURRENTKEY(ITEMLED."Item No.", ITEMLED."Lot No.", ITEMLED."ITL Doc No.");
                                ITEMLED.SETFILTER(ITEMLED."Entry Type", 'Purchase');
                                ITEMLED.SETRANGE(ITEMLED."Item No.", "Posted Material Issues Line"."Item No.");
                                //IF Lot <> '' THEN //Rev01
                                ITEMLED.SETRANGE(ITEMLED."Lot No.", Lot);
                                //IF "Serial no" <> '' THEN //Rev01
                                ITEMLED.SETRANGE(ITEMLED."Serial No.", "Serial no");
                                IF ITEMLED.FINDLAST
                                 THEN BEGIN
                                    PRL.RESET;
                                    PRL.SETRANGE(PRL."Document No.", ITEMLED."Document No.");
                                    PRL.SETRANGE(PRL."No.", ITEMLED."Item No.");
                                    IF PRL.FINDLAST THEN BEGIN
                                        ileref := ITEMLED."Document No.";//anil aded
                                                                         // IF "Posted Material Issues Line"."Item No."='BOIGENR00232' THEN
                                                                         //  MESSAGE(PRL."Document No.");

                                        PRH.RESET;//Rev01
                                        PRH.SETRANGE(PRH."No.", PRL."Document No.");
                                        IF PRH.FINDLAST THEN BEGIN
                                            vendor := PRH."Buy-from Vendor Name";
                                            PurchOrder := PRH."Order No.";
                                            // "BILLNO.":=PRH."Vendor Shipment No.";
                                            // BillDate:=PRH."Posting Date";

                                            PIL.RESET;
                                            PIL.SETCURRENTKEY(PIL.Type, PIL."No.", PIL."Variant Code");
                                            PIL.SETRANGE(PIL."No.", PRL."No.");
                                            PIL.SETRANGE(PIL."Receipt No.", PRL."Document No.");
                                            IF PIL.FINDLAST THEN BEGIN
                                                UC := PIL."Amount To Vendor" / PIL.Quantity;
                                                IF PIL."Gen. Bus. Posting Group" = 'FOREIGN' THEN
                                                    UC := PIL."Unit Cost (LCY)"; //WRITEN BY ANIL

                                                TESTINV := 10;
                                                IF "BILLNO." = '' THEN
                                                    PIH.RESET;


                                                PIH.SETFILTER(PIH."No.", PIL."Document No.");
                                                IF PIH.FINDFIRST THEN BEGIN
                                                    "BILLNO." := PIH."Vendor Invoice No.";
                                                    BillDate := PIH."Posting Date";
                                                    taxStructure := PIH.Structure;

                                                    invoice := PIH."No.";
                                                END;
                                                UNIT_COST := PIL."Unit Cost (LCY)";
                                                //mnraju for cost breakdown
                                                StrDetails.RESET;
                                                StrDetails.SETFILTER(StrDetails."Invoice No.", PIL."Document No.");
                                                StrDetails.SETFILTER(StrDetails."Line No.", '%1', PIL."Line No.");
                                                StrDetails.SETFILTER(StrDetails."Document Type", '%1', StrDetails."Document Type"::Invoice);
                                                unitCostwithTax := unitCostwithTax + UNIT_COST;
                                                IF StrDetails.FINDSET THEN
                                                    REPEAT
                                                        amount := StrDetails."Amount (LCY)" / PIL.Quantity;
                                                        CASE StrDetails."Tax/Charge Group" OF

                                                            'ADD.DUTY':
                                                                BEGIN
                                                                    ADD_DUTY := amount;
                                                                    unitCostwithTax := unitCostwithTax + amount;
                                                                END;
                                                            'BC':
                                                                BEGIN
                                                                    BC := amount;
                                                                    unitCostwithTax := unitCostwithTax + amount;
                                                                END;
                                                            'CUSTOMS DU':
                                                                BEGIN
                                                                    CUSTOMS_DU := amount;
                                                                    unitCostwithTax := unitCostwithTax + amount;
                                                                END;
                                                            'E.CESS':
                                                                BEGIN
                                                                    E_CESS := amount;
                                                                    unitCostwithTax := unitCostwithTax + amount;
                                                                END;
                                                            'E.CESS 1':
                                                                BEGIN
                                                                    E_CESS_1 := amount;
                                                                    unitCostwithTax := unitCostwithTax + amount;
                                                                END;
                                                            'E.CESS 2':
                                                                BEGIN
                                                                    E_CESS_2 := amount;
                                                                    unitCostwithTax := unitCostwithTax + amount;
                                                                END;
                                                            'E.CESS 3':
                                                                BEGIN
                                                                    E_CESS_3 := amount;
                                                                    unitCostwithTax := unitCostwithTax + amount;
                                                                END;
                                                            'E.CESS 4':
                                                                BEGIN
                                                                    E_CESS_4 := amount;
                                                                    unitCostwithTax := unitCostwithTax + amount;
                                                                END;
                                                            'E.CESS 5':
                                                                BEGIN
                                                                    E_CESS_5 := amount;
                                                                    unitCostwithTax := unitCostwithTax + amount;
                                                                END;
                                                            'FORWARDING':
                                                                BEGIN
                                                                    FORWARDING := amount;
                                                                    unitCostwithTax := unitCostwithTax + amount;
                                                                END;
                                                            'FREIGHT':
                                                                BEGIN
                                                                    FREIGHT_G := amount;
                                                                    unitCostwithTax := unitCostwithTax + amount;
                                                                END;
                                                            'FREIGHT 1':
                                                                BEGIN
                                                                    FREIGHT_1 := amount;
                                                                    unitCostwithTax := unitCostwithTax + amount;
                                                                END;
                                                            'FREIGHT 2':
                                                                BEGIN
                                                                    FREIGHT_2 := amount;
                                                                    unitCostwithTax := unitCostwithTax + amount;
                                                                END;
                                                            'HANDLING':
                                                                BEGIN
                                                                    HANDLING := amount;
                                                                    unitCostwithTax := unitCostwithTax + amount;
                                                                END;
                                                            'INSTAL CHA':
                                                                BEGIN
                                                                    INSTAL_CHA := amount;
                                                                    unitCostwithTax := unitCostwithTax + amount;
                                                                END;
                                                            'INSURANCE':
                                                                BEGIN
                                                                    INSURANCE := amount;
                                                                    unitCostwithTax := unitCostwithTax + amount;
                                                                END;
                                                            'PACKING':
                                                                BEGIN
                                                                    PACKING := amount;
                                                                    unitCostwithTax := unitCostwithTax + amount;
                                                                END;
                                                            'ROUNDING':
                                                                BEGIN
                                                                    ROUNDING_G := amount;
                                                                    unitCostwithTax := unitCostwithTax + amount;
                                                                END;
                                                            'SERV TAX':
                                                                BEGIN
                                                                    SERV_TAX := amount;
                                                                    unitCostwithTax := unitCostwithTax + amount;
                                                                END;
                                                            'SERVICETAX':
                                                                BEGIN
                                                                    SERVICETAX_G := amount;
                                                                    unitCostwithTax := unitCostwithTax + amount;
                                                                END;

                                                        END;

                                                        CASE StrDetails."Tax/Charge Code" OF

                                                            'EXCISE':
                                                                BEGIN
                                                                    EXCISE := amount;
                                                                    unitCostwithTax := unitCostwithTax + amount;
                                                                END;
                                                            'FREIGHT':
                                                                BEGIN
                                                                    FREIGHT_C1 := amount;
                                                                    unitCostwithTax := unitCostwithTax + amount;
                                                                END;
                                                            'ROUNDING':
                                                                BEGIN
                                                                    ROUNDING_C := amount;
                                                                    unitCostwithTax := unitCostwithTax + amount;
                                                                END;
                                                            'SALES TAX':
                                                                BEGIN
                                                                    SALES_TAX := amount;
                                                                    unitCostwithTax := unitCostwithTax + amount;
                                                                END;
                                                            'SERVICE TA':
                                                                BEGIN
                                                                    SERVICE_TA := amount;
                                                                    unitCostwithTax := unitCostwithTax + amount;
                                                                END;
                                                            'SERVICETAX':
                                                                BEGIN
                                                                    SERVICETAX_C := amount;
                                                                    unitCostwithTax := unitCostwithTax + amount;
                                                                END;
                                                            'ST':
                                                                BEGIN
                                                                    ST := amount;
                                                                    unitCostwithTax := unitCostwithTax + amount;
                                                                END;
                                                            'VAT':
                                                                BEGIN
                                                                    VAT := amount;
                                                                    unitCostwithTax := unitCostwithTax + amount;
                                                                END;

                                                        END;

                                                    UNTIL StrDetails.NEXT = 0;
                                                unitCostwithoutexcise := unitCostwithTax - (EXCISE + E_CESS + E_CESS_1 + E_CESS_2 + E_CESS_3 + E_CESS_4 + E_CESS_5);
                                                TotalCost := unitCostwithoutexcise * "Posted Material Issues Line".Quantity;
                                            END;
                                        END;
                                    END;
                                END
                                ELSE//sundar
                                BEGIN
                                    ITEMLED.RESET;
                                    ITEMLED.SETCURRENTKEY(ITEMLED."Item No.", ITEMLED."Lot No.", ITEMLED."ITL Doc No.");
                                    ITEMLED.SETFILTER(ITEMLED."Entry Type", 'Positive Adjmt.');
                                    ITEMLED.SETRANGE(ITEMLED."Item No.", "Posted Material Issues Line"."Item No.");
                                    ITEMLED.SETRANGE(ITEMLED."Lot No.", Lot);
                                    ITEMLED.SETRANGE(ITEMLED."Serial No.", "Serial no");
                                    IF ITEMLED.FIND('-') THEN BEGIN
                                        ileref := ITEMLED."Document No.";
                                        PIL.RESET;
                                        PIL.SETRANGE(PIL."No.", ITEMLED."Item No.");
                                        PIL.SETFILTER(PIL."Posting Date", '<%1', ITEMLED."Posting Date");
                                        PIL.SETFILTER(PIL.Quantity, '>%1', 0);
                                        IF PIL.FINDLAST THEN BEGIN
                                            UC := PIL."Amount To Vendor" / PIL.Quantity;
                                            IF PIL."Gen. Bus. Posting Group" = 'FOREIGN' THEN
                                                UC := PIL."Unit Cost (LCY)";

                                        END;
                                    END;
                                    UC := 0.01;
                                END;   //sundar
                            END;
                            "Issued Date" := DT2DATE("Posted Material Issues Header"."Issued DateTime");
                            IF ("Posted Material Issues Header"."Released Date" > 0D) AND ("Issued Date" > 0D) THEN
                                "Bench-Mark" := "Issued Date" - "Posted Material Issues Header"."Released Date";



                            // MESSAGE('%1',"Serial no");
                            IF EXCEL AND (Issued_Qty > 0) THEN BEGIN
                                Row += 1;
                                Entercell(Row, 1, "Posted Material Issues Header"."Prod. Order No.", FALSE, Tempexcelbuffer."Cell Type"::Text);
                                Entercell(Row, 2, "Prod. Order Description", FALSE, Tempexcelbuffer."Cell Type"::Text);
                                Entercell(Row, 3, "Posted Material Issues Line"."Material Issue No.", FALSE, Tempexcelbuffer."Cell Type"::Text);
                                Entercell(Row, 4, "Posted Material Issues Line"."Item No.", FALSE, Tempexcelbuffer."Cell Type"::Text);
                                Entercell(Row, 5, "Posted Material Issues Line".Description, FALSE, Tempexcelbuffer."Cell Type"::Text);
                                Entercell(Row, 6, "Posted Material Issues Line"."Unit of Measure Code", FALSE, Tempexcelbuffer."Cell Type"::Text);
                                Entercell(Row, 7, "Posted Material Issues Header"."User ID", FALSE, Tempexcelbuffer."Cell Type"::Text);
                                Entercell(Row, 8, FORMAT("Posted Material Issues Header"."Released Date"), FALSE, Tempexcelbuffer."Cell Type"::Date);
                                Entercell(Row, 9, FORMAT("Posted Material Issues Header"."Issued DateTime"), FALSE, Tempexcelbuffer."Cell Type"::Date);
                                Entercell(Row, 10, "Posted Material Issues Header"."Transfer-to Code", FALSE, Tempexcelbuffer."Cell Type"::Text);
                                Entercell(Row, 11, FORMAT(QTY), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 12, FORMAT(Issued_Qty), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 13, FORMAT(UC), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 14, FORMAT(UC * Issued_Qty), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 15, Lot, FALSE, Tempexcelbuffer."Cell Type"::Text);
                                Entercell(Row, 16, "Serial no", FALSE, Tempexcelbuffer."Cell Type"::Text);
                                Entercell(Row, 17, FORMAT("Bench-Mark"), FALSE, Tempexcelbuffer."Cell Type"::Text);
                                // Entercell(Row,40,FORMAT(TESTINV),FALSE,Tempexcelbuffer."Cell Type"::Number);
                                IF UC <> 0 THEN BEGIN
                                    Entercell(Row, 18, vendor, FALSE, Tempexcelbuffer."Cell Type"::Text);
                                    Entercell(Row, 19, FORMAT("BILLNO."), FALSE, Tempexcelbuffer."Cell Type"::Text);
                                    Entercell(Row, 20, FORMAT(BillDate), FALSE, Tempexcelbuffer."Cell Type"::Date);
                                END;
                                //  IF ITEMLED."Document No."<>'' THEN
                                Entercell(Row, 21, ileref, FALSE, Tempexcelbuffer."Cell Type"::Text);
                                // Entercell(Row,20,ITEMLED."Document No.",FALSE);
                                PRH.RESET;
                                PRH.SETRANGE(PRH."No.", ileref);
                                IF PRH.FIND('-') THEN BEGIN
                                    // Entercell(Row,21,PRH."Pay-to Name",FALSE,Tempexcelbuffer."Cell Type"::Text);
                                    Entercell(Row, 23, FORMAT(PRH."Posting Date"), FALSE, Tempexcelbuffer."Cell Type"::Date);
                                    Entercell(Row, 24, FORMAT(PRH."Order No."), FALSE, Tempexcelbuffer."Cell Type"::Text);
                                    Entercell(Row, 25, FORMAT(PRH."Vendor Shipment No."), FALSE, Tempexcelbuffer."Cell Type"::Text);
                                END;
                                IF ("Posted Material Issues Header"."Transfer-from Code" = 'CS STR') AND
                                   ("Posted Material Issues Header"."Transfer-to Code" = 'CST') THEN BEGIN
                                    Entercell(Row, 29, FORMAT("Posted Material Issues Header"."Service Order No."), FALSE, Tempexcelbuffer."Cell Type"::Text);
                                    Entercell(Row, 30, FORMAT("Posted Material Issues Header"."Service Item Description"), FALSE, Tempexcelbuffer."Cell Type"::Text);
                                    Entercell(Row, 31, FORMAT("Posted Material Issues Header"."Service Item Serial No."), FALSE, Tempexcelbuffer."Cell Type"::Text);
                                END;
                                IF ("Posted Material Issues Header"."Transfer-to Code" IN ['SITE', 'CST', 'CS']) THEN BEGIN
                                    DV.RESET;
                                    DV.SETFILTER(DV."Dimension Code", 'LOCATIONS');
                                    DV.SETFILTER(DV.Code, "Posted Material Issues Header"."Shortcut Dimension 2 Code");
                                    IF DV.FINDFIRST THEN
                                        Entercell(Row, 28, FORMAT(DV.Name), FALSE, Tempexcelbuffer."Cell Type"::Text);
                                END;
                                temp1 := FREIGHT_2 + HANDLING + INSTAL_CHA + INSURANCE + PACKING + ROUNDING_G + SERV_TAX + SERVICETAX_G + SALES_TAX + SERVICE_TA + SERVICETAX_C + ST + VAT;
                                UCinctax := UC + ADD_DUTY + BC + CUSTOMS_DU + EXCISE + E_CESS + E_CESS_1 + E_CESS_2 + E_CESS_3 + E_CESS_4 + E_CESS_5 + FORWARDING + FREIGHT_G + FREIGHT_1 + temp1;
                                UClesexcise := UCinctax - (EXCISE + E_CESS + E_CESS_1 + E_CESS_2 + E_CESS_3 + E_CESS_4 + E_CESS_5);

                                IF (taxStructure <> 'FORIEGN') AND (taxStructure <> '') THEN BEGIN
                                    strr := COPYSTR(taxStructure, 6, STRLEN(taxStructure) - 1);
                                    strr1 := COPYSTR(taxStructure, 1, 4);
                                    strr2 := COPYSTR(taxStructure, STRLEN(taxStructure) - 2, STRLEN(taxStructure) - 1);
                                END
                                ELSE BEGIN
                                    strr1 := taxStructure;
                                    strr := '';
                                END;
                                IF strr2 = 'VAT' THEN
                                    UClesExcsVat := UClesexcise - SALES_TAX
                                ELSE
                                    UClesExcsVat := UClesexcise;
                                IssdMatCst := UClesExcsVat * Issued_Qty;
                                //iled place
                                Item.RESET;
                                Item.SETFILTER(Item."No.", "Posted Material Issues Line"."Item No.");
                                IF Item.FIND('-') THEN
                                    Entercell(Row, 26, Item."Item Category Code", FALSE, Tempexcelbuffer."Cell Type"::Text);
                                Entercell(Row, 27, FORMAT("Posted Material Issues Header"."Posting Date"), FALSE, Tempexcelbuffer."Cell Type"::Date);
                                //by pranavi
                                Entercell(Row, 28, FORMAT(ROUND(ADD_DUTY, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 29, FORMAT(ROUND(BC, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 30, FORMAT(ROUND(CUSTOMS_DU, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 31, FORMAT(ROUND(EXCISE, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 32, FORMAT(ROUND(E_CESS, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 33, FORMAT(ROUND(E_CESS_1, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 34, FORMAT(ROUND(E_CESS_2, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 35, FORMAT(ROUND(E_CESS_3, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 36, FORMAT(ROUND(E_CESS_4, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 37, FORMAT(ROUND(E_CESS_5, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 38, FORMAT(ROUND(FORWARDING, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 39, FORMAT(ROUND(FREIGHT_G, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 40, FORMAT(ROUND(FREIGHT_1, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 41, FORMAT(ROUND(FREIGHT_2, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 42, FORMAT(ROUND(HANDLING, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 43, FORMAT(ROUND(INSTAL_CHA, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 44, FORMAT(ROUND(INSURANCE, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 45, FORMAT(ROUND(PACKING, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 46, FORMAT(ROUND(ROUNDING_G, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 47, FORMAT(ROUND(SERV_TAX, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 48, FORMAT(ROUND(SERVICETAX_G, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 49, FORMAT(ROUND(SALES_TAX, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 50, FORMAT(ROUND(SERVICE_TA, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 51, FORMAT(ROUND(SERVICETAX_C, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 52, FORMAT(ROUND(ST, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 53, FORMAT(ROUND(VAT, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                //Entercell(Row,54,FORMAT(ROUND(unitCostwithTax,0.001)),FALSE,Tempexcelbuffer."Cell Type"::Number);
                                //Entercell(Row,55,FORMAT(ROUND(unitCostwithoutexcise,0.001)),FALSE,Tempexcelbuffer."Cell Type"::Number);
                                //Entercell(Row,56,FORMAT(ROUND(TotalCost,0.001)),FALSE,Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 22, taxStructure, FALSE, Tempexcelbuffer."Cell Type"::Text);
                                Entercell(Row, 54, FORMAT(ROUND(UCinctax, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 55, FORMAT(ROUND(UClesexcise, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 56, FORMAT(ROUND(UClesExcsVat, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 57, FORMAT(ROUND(IssdMatCst, 0.001)), FALSE, Tempexcelbuffer."Cell Type"::Number);
                                Entercell(Row, 58, strr1, FALSE, Tempexcelbuffer."Cell Type"::Text);
                                Entercell(Row, 59, strr, FALSE, Tempexcelbuffer."Cell Type"::Text);
                                Entercell(Row, 60, Make, FALSE, Tempexcelbuffer."Cell Type"::Text);


                                //end by pranavi
                            END;

                            "Project Total" += Issued_Qty * UC;
                            Total_Qty += Issued_Qty;
                            Total += Issued_Qty * UC;
                        END;

                    END ELSE
                        GrpFVisible4 := FALSE;
                    GrpFVisible4 := ((Choice3 = Choice3::Issue) AND (Choice1 = Choice1::Normal) AND (Issued_Qty > 0));
                    // copy code from // Posted Material Issues Line, GroupFooter - OnPostSection() <<

                end;

                trigger OnPreDataItem();
                begin
                    PrevItemNo := '';
                end;
            }

            trigger OnAfterGetRecord();
            begin
                // Copy code from //Posted Material Issues Header, GroupHead - OnPreSection() >>
                IF PrevProdOrderNo <> "Posted Material Issues Header"."Prod. Order No." THEN BEGIN
                    "Project Total" := 0;
                    PrevProdOrderNo := "Posted Material Issues Header"."Prod. Order No."
                END;
                // Copy code from //Posted Material Issues Header, GroupHead - OnPreSection() <<
            end;

            trigger OnPostDataItem();
            begin

                // copy code from // Posted Material Issues header, GroupFooter - OnPostSection() >>
                IF Choice3 = Choice3::Project THEN BEGIN
                    Project_Desc := '';
                    PO.SETRANGE(PO."No.", "Posted Material Issues Header"."Prod. Order No.");
                    IF PO.FIND('-') THEN
                        Project_Desc := PO.Description;
                    "R&D total" += "Project Total";
                END ELSE
                    GrpFVisible5 := FALSE;
                // copy code from // Posted Material Issues header, GroupFooter - OnPostSection() <<
            end;

            trigger OnPreDataItem();
            begin
                //IF Choice3<>Choice3::Issue THEN
                //  CurrReport.BREAK;
                IF (Choice3 = Choice3::Summary) OR (Choice3 = Choice3::WRET) THEN
                    CurrReport.BREAK;

                IF Choice3 = Choice3::Issue THEN BEGIN
                    "Posted Material Issues Header".SETCURRENTKEY("Material Issue No.", "Posting Date", "Resource Name", "Reason Code",
                    "Prod. Order No.", "Transfer-to Code", "Transfer-from Code");
                    IF Choice1 = Choice1::Return THEN BEGIN
                        "Posted Material Issues Header".SETFILTER("Posted Material Issues Header"."Transfer-to Code", 'STR|DAMAGE|MCH|CS STR|''R&D STR''');
                        // "Posted Material Issues Header".SETFILTER("Posted Material Issues Header"."Reason Code",'<>%1','DAMAGE');
                    END ELSE
                        IF Choice1 = Choice1::Normal THEN BEGIN
                            IF "Posted Material Issues Header".GETFILTER("Posted Material Issues Header"."Transfer-from Code") = '' THEN
                                "Posted Material Issues Header".SETFILTER("Posted Material Issues Header"."Transfer-from Code", 'STR|MCH|CS STR|''R&D STR''');
                            IF "Posted Material Issues Header".GETFILTER("Posted Material Issues Header"."Transfer-to Code") = '' THEN
                                "Posted Material Issues Header".SETFILTER("Posted Material Issues Header"."Transfer-to Code", '<>%1', 'DAMAGE');
                        END ELSE
                            IF Choice1 = Choice1::Damage THEN BEGIN
                                "Posted Material Issues Header".SETRANGE("Posted Material Issues Header"."Transfer-to Code", 'DAMAGE');
                            END;
                END ELSE
                    SETCURRENTKEY("Prod. Order No.", "Prod. Order Line No.");

                // Copy code from // Posted Material Issues Header, Header (1 - OnPostSection() >>
                //CurrReport.SHOWOUTPUT(Choice3=Choice3::Issue);
                IF EXCEL THEN BEGIN
                    Row += 1;
                    EnterHeadings(Row, 1, 'Production Order', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 2, 'Project', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 3, 'Request No.', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 4, 'Item No', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 5, 'Item Desc', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 6, 'Unit Of Measure', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 7, 'Requested Employee', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 8, 'Requested Date', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 9, 'Issued Date', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 10, 'Department', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 11, 'Quantity Requested', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 12, 'Quantity Received', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 13, 'Basic Unit Cost', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 14, 'Basic Total Amount.', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 15, 'Lot No.', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 16, 'Serial No.', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 17, 'Bench Mark', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 18, 'Vendor', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 19, 'Bill No.', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 20, 'Bill Date', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 21, 'Reference No.', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 22,/*'Vendor Name'*/'Tax Structure', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 23, 'Inward Date', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 24, 'Purchase Order No.', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 25, 'Vendor Shipment No.', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 26, 'Item Category Code', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 27, 'Posting Date', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    //by pranavi on 11-04-2015
                    EnterHeadings(Row, 28, 'ADD DUTY', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 29, 'BC', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 30, 'CUSTOMS DU', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 31, 'Excise', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 32, 'ECESS', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 33, 'ECESS1', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 34, 'ECESS2', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 35, 'ECESS3', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 36, 'ECESS4', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 37, 'ECESS5', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 38, 'FORWARDING', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 39, 'FREIGHT', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 40, 'FREIGHT1', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 41, 'FREIGHT2', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 42, 'HANDLING', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 43, 'INSTAL CHARG', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 44, 'INSURANCE', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 45, 'PACKING', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 46, 'ROUNDING', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 47, 'SERV TAX', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 48, 'SERVICETAX G', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 49, 'SALES TAX', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 50, 'SERVICE TA', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 51, 'SERVICETAX C', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 52, 'ST', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 53, 'VAT', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    //EnterHeadings(Row,54, 'Final Unit Cost',TRUE,Tempexcelbuffer."Cell Type"::Number);
                    //EnterHeadings(Row,55, 'Unit Cost without Tax',TRUE,Tempexcelbuffer."Cell Type"::Number);
                    //EnterHeadings(Row,56, 'Total Cost',TRUE,Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 54, 'Unit Cost inc of all taxes', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 55, 'Unit Cost(Less excise)', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 56, 'Unit Cost(Less excise & VAT)', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 57, 'Issued Material Tot Cost', TRUE, Tempexcelbuffer."Cell Type"::Number);
                    EnterHeadings(Row, 58, 'Tax Break UP1', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 59, 'Tax Break Up2', TRUE, Tempexcelbuffer."Cell Type"::Text);
                    EnterHeadings(Row, 60, 'Make', TRUE, Tempexcelbuffer."Cell Type"::Text);



                    //end by pranavi
                    // EnterHeadings(Row,26, 'Posting Date',TRUE,Tempexcelbuffer."Cell Type"::Text);
                    Row += 1;
                END;
                // Copy code from // Posted Material Issues Header, Header (1 - OnPostSection() <<

                PrevProdOrderNo := '';

            end;
        }
        dataitem("Production Order"; "Production Order")
        {
            DataItemTableView = SORTING(Status, No.) WHERE(Location Code=CONST(R&D));
            column(Production_Order_Status; Status)
            {
            }
            column(Production_Order_No_; "No.")
            {
            }
            dataitem("<Posted Material Issues Line1>"; "Posted Material Issues Line")
            {
                DataItemLink = Prod. Order No.=FIELD(No.);
                DataItemTableView = SORTING(Prod. Order No., Item No.) ORDER(Ascending) WHERE(Transfer-from Code=FILTER(STR|'R&D STR'),Quantity=FILTER(>0));
                ReqFilterHeading = 'Summerised Project wise Issues';
                column(COMPANYNAME_Control1102154031;COMPANYNAME)
                {
                }
                column(USERID_Control1102154035;USERID)
                {
                }
                column(TODAY_Control1102154036;TODAY)
                {
                }
                column(Posted_Material_Issues_Line1___Unit_of_Measure_Code_;"Unit of Measure Code")
                {
                }
                column(Posted_Material_Issues_Line1___Item_No__;"Item No.")
                {
                }
                column(Ret_Qty;Ret_Qty)
                {
                }
                column(Value;Value)
                {
                }
                column(Posted_Material_Issues_Line1__Quantity;Quantity)
                {
                }
                column(Posted_Material_Issues_Line1__Description;Description)
                {
                }
                column(Total_Value_;"Total Value")
                {
                }
                column(Material_IssuesCaption_Control1102154030;Material_IssuesCaption_Control1102154030Lbl)
                {
                }
                column(Item_No_Caption;Item_No_CaptionLbl)
                {
                }
                column(ValueCaption_Control1102154033;ValueCaption_Control1102154033Lbl)
                {
                }
                column(DescriptionCaption;DescriptionCaptionLbl)
                {
                }
                column(Issued_QtyCaption;Issued_QtyCaptionLbl)
                {
                }
                column(Return_QtyCaption;Return_QtyCaptionLbl)
                {
                }
                column(Posted_Material_Issues_Line1___Unit_of_Measure_Code_Caption;FIELDCAPTION("Unit of Measure Code"))
                {
                }
                column(Posted_Material_Issues_Line1__Document_No_;"Document No.")
                {
                }
                column(Posted_Material_Issues_Line1__Line_No_;"Line No.")
                {
                }
                column(Posted_Material_Issues_Line1__Prod__Order_No_;"Prod. Order No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    PMIH.SETRANGE(PMIH."No.","<Posted Material Issues Line1>"."Document No.");
                    IF PMIH.FIND('-') THEN
                    BEGIN
                      IF PMIH."Posting Date"<040108D THEN
                        CurrReport.SKIP;
                    END;
                end;

                trigger OnPreDataItem();
                begin
                    //IF Choice3<>Choice3::WRET THEN
                    //CurrReport.BREAK;
                end;
            }

            trigger OnPreDataItem();
            begin
                //IF Choice3<>Choice3::Project THEN
                //CurrReport.BREAK;
                 IF Choice3=Choice3::Summary THEN
                    CurrReport.BREAK;


                "Production Order".SETFILTER("Production Order"."No.",
                                             "Posted Material Issues Header".GETFILTER("Prod. Order No."));
            end;
        }
        dataitem("Integer";"Integer")
        {
            DataItemTableView = SORTING(Number);

            trigger OnAfterGetRecord();
            begin

                IF BREAKVAR THEN
                   CurrReport.BREAK;
                IF ItemLotNumbers.NEXT=0 THEN
                  CurrReport.BREAK;//BREAK:=TRUE;
            end;

            trigger OnPreDataItem();
            begin
                 IF Choice3<>Choice3::Summary THEN
                    CurrReport.BREAK;
                "Str Rdso report".DELETEALL;
                IF (Sales_Order_No<>'') AND (Item_No<>'') AND ((Posting_From_Date=0D) AND (Posting_To_Date=0D)) AND (Lot='') THEN
                BEGIN
                  "Posted Material Issues Line".SETCURRENTKEY("Posted Material Issues Line"."Item No.",
                                                              "Posted Material Issues Line"."Transfer-from Code",
                                                              "Posted Material Issues Line"."Issued DateTime");
                  "Posted Material Issues Line".SETRANGE("Posted Material Issues Line"."Item No.",Item_No);
                  "Posted Material Issues Line".SETRANGE("Posted Material Issues Line"."Transfer-from Code",'STR');
                  "Posted Material Issues Line".SETRANGE("Posted Material Issues Line"."Transfer-to Code",'PROD');
                  IF "Posted Material Issues Line".FIND('-') THEN
                  REPEAT
                    "Posted Material Issues Header".RESET;
                    "Posted Material Issues Header".SETRANGE("Posted Material Issues Header"."No.","Posted Material Issues Line"."Document No.");
                    IF "Posted Material Issues Header".FIND('-') THEN
                    BEGIN
                      PO.RESET;
                      PO.SETRANGE(PO."No.","Posted Material Issues Header"."Prod. Order No.");
                      IF PO.FIND('-') THEN
                      BEGIN
                        IF Item.GET(PO."Source No.") AND  (PO."Sales Order No."=Sales_Order_No) THEN
                        BEGIN
                          ILE.RESET;
                          ILE.SETCURRENTKEY(ILE."Document No.",ILE."Item No.",ILE."Posting Date");
                          ILE.SETRANGE(ILE."Document No.","Posted Material Issues Line"."Document No.");
                          ILE.SETRANGE(ILE."Item No.",Item_No);
                          ILE.SETRANGE(ILE."Location Code",'STR');
                          IF ILE.FIND('-') THEN
                          BEGIN
                            /*  ItemLotNumbers.SETRANGE(ItemLotNumbers."Item No",Item_No);
                               ItemLotNumbers.SETRANGE(ItemLotNumbers."Sales Order No.",Sales_Order_No);
                               ItemLotNumbers.SETRANGE(ItemLotNumbers."Product Type",Item."Item Sub Group Code");
                               ItemLotNumbers.SETRANGE(ItemLotNumbers."Suitable Vendor",ILE."Lot No.");
                               IF ItemLotNumbers.FIND('-') THEN
                               BEGIN
                                 ItemLotNumbers.Shortage+="Posted Material Issues Line".Quantity;
                
                                 IF ItemLotNumbers."Production Orders">"Posted Material Issues Line"."Prod. Order No." THEN
                                    ItemLotNumbers."Production Orders":="Posted Material Issues Line"."Prod. Order No.";
                                 IF ItemLotNumbers."Indent No."<"Posted Material Issues Line"."Prod. Order No." THEN
                                    ItemLotNumbers."Indent No.":="Posted Material Issues Line"."Prod. Order No.";
                                 ItemLotNumbers.MODIFY;
                               END ELSE
                               BEGIN
                                 ItemLotNumbers.INIT;
                                 ItemLotNumbers."Item No":="Posted Material Issues Line"."Item No.";
                                 ItemLotNumbers.Description:="Posted Material Issues Line".Description;
                                 ItemLotNumbers."Planned Purchase Date":=TODAY;
                                 ItemLotNumbers."Production Order No.":="Posted Material Issues Line"."Prod. Order No.";
                                 ItemLotNumbers."Sales Order No.":="Posted Material Issues Line".Saleorderno;
                                 ItemLotNumbers."Product Type":=Item."Item Sub Group Code";
                                 ItemLotNumbers.Product:="Production Order"."Source No.";
                                 ItemLotNumbers.Shortage:="Posted Material Issues Line".Quantity;
                                 ItemLotNumbers."Production Orders":="Posted Material Issues Line"."Prod. Order No.";
                                 ItemLotNumbers."Indent No.":="Posted Material Issues Line"."Prod. Order No.";
                                 ItemLotNumbers."Suitable Vendor":=ILE."Lot No.";
                                 ItemLotNumbers.INSERT;
                               END; */
                            IF NOT("Str Rdso report".GET("Posted Material Issues Line"."Document No.")) THEN
                            BEGIN
                              "Str Rdso report".INIT;
                              "Str Rdso report"."Issue No.":="Posted Material Issues Line"."Document No.";
                              "Str Rdso report"."Issue Line No.":="Posted Material Issues Line"."Line No.";
                              "Str Rdso report"."Item No.":="Posted Material Issues Line"."Item No.";
                              "Str Rdso report".Description:="Posted Material Issues Line".Description;
                              "Str Rdso report"."Production Order":="Posted Material Issues Header"."Prod. Order No.";
                              "Str Rdso report"."Sales Order No.":=PO."Sales Order No.";
                              "Str Rdso report"."Product No.":="Production Order"."Source No.";
                              "Str Rdso report"."Issued Qty":="Posted Material Issues Line".Quantity;
                              "Str Rdso report".Lot:=ILE."Lot No.";
                              "Str Rdso report".INSERT;
                            END ELSE
                            BEGIN
                              "Str Rdso report"."Issued Qty"+="Posted Material Issues Line".Quantity;
                              "Str Rdso report".MODIFY;
                            END;
                
                          END;
                        END;
                      END;
                    END;
                  UNTIL "Posted Material Issues Line".NEXT=0;
                END ELSE
                IF (Sales_Order_No='') AND (Item_No<>'') AND ((Posting_From_Date>0D) AND (Posting_To_Date>0D)) AND (Lot='') THEN
                BEGIN
                  ILE.RESET;
                  ILE.SETCURRENTKEY(ILE."Item No.",ILE.Open,ILE."Variant Code",ILE.Positive,ILE."Location Code",ILE."Posting Date");
                  ILE.SETRANGE(ILE."Item No.",Item_No);
                  ILE.SETRANGE(ILE."Location Code",'STR');
                  ILE.SETRANGE(ILE."Posting Date",Posting_From_Date,Posting_To_Date);
                  ILE.SETFILTER(ILE."Entry Type",'Transfer');
                  IF ILE.FIND('-') THEN
                  REPEAT
                    "Posted Material Issues Line".RESET;
                    "Posted Material Issues Line".SETRANGE("Posted Material Issues Line"."Document No.",ILE."Document No.");
                    "Posted Material Issues Line".SETRANGE("Posted Material Issues Line"."Item No.",ILE."Item No.");
                    IF "Posted Material Issues Line".FIND('-') THEN
                    BEGIN
                      "Posted Material Issues Header".RESET;
                      "Posted Material Issues Header".SETRANGE("Posted Material Issues Header"."No.","Posted Material Issues Line"."Document No.");
                      IF "Posted Material Issues Header".FIND('-') THEN
                      BEGIN
                        PO.RESET;
                        PO.SETRANGE(PO."No.","Posted Material Issues Header"."Prod. Order No.");
                        IF PO.FIND('-') THEN
                        BEGIN
                          IF Item.GET(PO."Source No.") THEN
                          BEGIN
                            /*  ItemLotNumbers.SETRANGE(ItemLotNumbers."Item No",Item_No);
                               ItemLotNumbers.SETRANGE(ItemLotNumbers."Sales Order No.",PO."Sales Order No.");
                               ItemLotNumbers.SETRANGE(ItemLotNumbers."Product Type",Item."Item Sub Group Code");
                               ItemLotNumbers.SETRANGE(ItemLotNumbers."Suitable Vendor",ILE."Lot No.");
                               IF ItemLotNumbers.FIND('-') THEN
                               BEGIN
                                 ItemLotNumbers.Shortage+="Posted Material Issues Line".Quantity;
                                 IF ItemLotNumbers."Production Orders">"Posted Material Issues Line"."Prod. Order No." THEN
                                    ItemLotNumbers."Production Orders":="Posted Material Issues Line"."Prod. Order No.";
                                 IF ItemLotNumbers."Indent No."<"Posted Material Issues Line"."Prod. Order No." THEN
                                    ItemLotNumbers."Indent No.":="Posted Material Issues Line"."Prod. Order No.";
                                 ItemLotNumbers.MODIFY;
                               END ELSE
                               BEGIN
                                 ItemLotNumbers.INIT;
                                 ItemLotNumbers."Item No":="Posted Material Issues Line"."Item No.";
                                 ItemLotNumbers.Description:="Posted Material Issues Line".Description;
                                 ItemLotNumbers."Planned Purchase Date":=TODAY;
                                 ItemLotNumbers."Production Order No.":="Posted Material Issues Line"."Prod. Order No.";
                                 ItemLotNumbers."Sales Order No.":=PO."Sales Order No.";
                                 ItemLotNumbers."Product Type":=Item."Item Sub Group Code";
                                 ItemLotNumbers.Product:="Production Order"."Source No.";
                                 ItemLotNumbers.Shortage:="Posted Material Issues Line".Quantity;
                                 ItemLotNumbers."Production Orders":="Posted Material Issues Line"."Prod. Order No.";
                                 ItemLotNumbers."Indent No.":="Posted Material Issues Line"."Prod. Order No.";
                                 ItemLotNumbers."Suitable Vendor":=ILE."Lot No.";
                                 ItemLotNumbers.INSERT;
                               END ; */
                            IF NOT("Str Rdso report".GET("Posted Material Issues Line"."Document No.")) THEN
                            BEGIN
                              "Str Rdso report".INIT;
                              "Str Rdso report"."Issue No.":="Posted Material Issues Line"."Document No.";
                              "Str Rdso report"."Issue Line No.":="Posted Material Issues Line"."Line No.";
                              "Str Rdso report"."Item No.":="Posted Material Issues Line"."Item No.";
                              "Str Rdso report".Description:="Posted Material Issues Line".Description;
                              "Str Rdso report"."Production Order":="Posted Material Issues Line"."Prod. Order No.";
                              "Str Rdso report"."Sales Order No.":=PO."Sales Order No.";
                              "Str Rdso report"."Product No.":=PO."Source No.";
                              "Str Rdso report"."Issued Qty":="Posted Material Issues Line".Quantity;
                              "Str Rdso report".Lot:=ILE."Lot No.";
                              "Str Rdso report".INSERT;
                            END ELSE
                            BEGIN
                              "Str Rdso report"."Issued Qty"+="Posted Material Issues Line".Quantity;
                              "Str Rdso report".MODIFY;
                            END;
                
                          END;
                        END;
                      END;
                    END;
                  UNTIL ILE.NEXT=0;
                
                END ELSE
                IF (Sales_Order_No='') AND (Item_No<>'') AND ((Posting_From_Date=0D) AND (Posting_To_Date=0D)) AND (Lot<>'') THEN
                BEGIN
                  ILE.RESET;
                  ILE.SETCURRENTKEY(ILE."Entry Type",ILE."Lot No.",ILE."Item No.");
                  ILE.SETFILTER(ILE."Entry Type",'Transfer');
                  ILE.SETRANGE(ILE."Lot No.",Lot);
                  ILE.SETRANGE(ILE."Item No.",Item_No);
                  ILE.SETRANGE(ILE."Location Code",'STR');
                  IF ILE.FIND('-') THEN
                  REPEAT
                    "Posted Material Issues Line".SETRANGE("Posted Material Issues Line"."Document No.",ILE."Document No.");
                    "Posted Material Issues Line".SETRANGE("Posted Material Issues Line"."Item No.",ILE."Item No.");
                    IF "Posted Material Issues Line".FIND('-') THEN
                    BEGIN
                      "Posted Material Issues Header".RESET;
                      "Posted Material Issues Header".SETRANGE("Posted Material Issues Header"."No.","Posted Material Issues Line"."Document No.");
                      IF "Posted Material Issues Header".FIND('-') THEN
                      BEGIN
                        PO.RESET;
                        PO.SETRANGE(PO."No.","Posted Material Issues Line"."Prod. Order No.");
                        IF PO.FIND('-') THEN
                        BEGIN
                          IF Item.GET(PO."Source No.") THEN
                          BEGIN
                            /*Sales_Order_No:=PO."Sales Order No.";
                              //ItemLotNumbers.RESET;
                              ItemLotNumbers.SETRANGE(ItemLotNumbers."Item No",Item_No);
                              ItemLotNumbers.SETRANGE(ItemLotNumbers."Sales Order No.",PO."Sales Order No.");
                              ItemLotNumbers.SETRANGE(ItemLotNumbers."Product Type",Item."Item Sub Group Code");
                              ItemLotNumbers.SETRANGE(ItemLotNumbers."Suitable Vendor",ILE."Lot No.");
                              IF NOT(ItemLotNumbers.FIND('-')) THEN
                              BEGIN
                                ItemLotNumbers.INIT;
                                ItemLotNumbers."Item No":=ILE."Item No.";
                                ItemLotNumbers.Description:="Posted Material Issues Line".Description;
                                ItemLotNumbers."Planned Purchase Date":=TODAY;
                                ItemLotNumbers."Production Order No.":=PO."No.";
                                ItemLotNumbers."Sales Order No.":=PO."Sales Order No.";
                                ItemLotNumbers."Product Type":=Item."Item Sub Group Code";
                                ItemLotNumbers.Product:="Production Order"."Source No.";
                                ItemLotNumbers.Shortage:=ABS(ILE.Quantity);
                                ItemLotNumbers."Production Orders":=PO."No.";
                                ItemLotNumbers."Indent No.":=PO."No.";
                                ItemLotNumbers."Suitable Vendor":=ILE."Lot No.";
                                ItemLotNumbers.INSERT;
                              END ELSE
                              BEGIN
                                ItemLotNumbers.Shortage+=ABS(ILE.Quantity);
                                IF ItemLotNumbers."Production Orders">PO."No." THEN
                                   ItemLotNumbers."Production Orders":=PO."No.";
                                IF ItemLotNumbers."Indent No."<PO."No." THEN
                                   ItemLotNumbers."Indent No.":=PO."No.";
                                ItemLotNumbers.MODIFY;
                             END;*/
                            IF NOT("Str Rdso report".GET("Posted Material Issues Line"."Document No.")) THEN
                            BEGIN
                              "Str Rdso report".INIT;
                              "Str Rdso report"."Issue No.":="Posted Material Issues Line"."Document No.";
                              "Str Rdso report"."Issue Line No.":="Posted Material Issues Line"."Line No.";
                              "Str Rdso report"."Item No.":="Posted Material Issues Line"."Item No.";
                              "Str Rdso report".Description:="Posted Material Issues Line".Description;
                              "Str Rdso report"."Production Order":="Posted Material Issues Line"."Prod. Order No.";
                              "Str Rdso report"."Sales Order No.":=PO."Sales Order No.";
                              "Str Rdso report"."Product No.":="Production Order"."Source No.";
                              "Str Rdso report"."Issued Qty":="Posted Material Issues Line".Quantity;
                              "Str Rdso report".Lot:=ILE."Lot No.";
                              "Str Rdso report".INSERT;
                            END ELSE
                            BEGIN
                              "Str Rdso report"."Issued Qty"+="Posted Material Issues Line".Quantity;
                              "Str Rdso report".MODIFY;
                            END;
                          END;
                        END;
                      END;
                    END;
                  UNTIL ILE.NEXT=0;
                
                END ELSE
                  ERROR(' PLEASE ENTER CORRECT COMBINTAION OF I/P');
                
                ItemLotNumbers.RESET;//REV01
                IF ItemLotNumbers.FIND('-') THEN;
                Integer.SETRANGE(Integer.Number,1,ItemLotNumbers.COUNT);

            end;
        }
        dataitem("Str Rdso report";"Str Rdso report")
        {
            DataItemTableView = SORTING(Sales Order No.,Product No.,Lot,Production Order) ORDER(Ascending);
            column(Str_Rdso_report__Sales_Order_No__;"Sales Order No.")
            {
            }
            column(Str_Rdso_report__Production_Order_;"Production Order")
            {
            }
            column(Str_Rdso_report__Str_Rdso_report__Description;Description)
            {
            }
            column(Str_Rdso_report__Issued_Qty_;"Issued Qty")
            {
            }
            column(Str_Rdso_report_Lot;Lot)
            {
            }
            column(PO1;PO1)
            {
            }
            column(CONSUMPTION_SUMMARYCaption;CONSUMPTION_SUMMARYCaptionLbl)
            {
            }
            column(Sales_Order_NoCaption;Sales_Order_NoCaptionLbl)
            {
            }
            column(Production_OrdersCaption;Production_OrdersCaptionLbl)
            {
            }
            column(ItemCaption;ItemCaptionLbl)
            {
            }
            column(Issued_QtyCaption_Control1000000052;Issued_QtyCaption_Control1000000052Lbl)
            {
            }
            column(LOTCaption;LOTCaptionLbl)
            {
            }
            column(EmptyStringCaption;EmptyStringCaptionLbl)
            {
            }
            column(Str_Rdso_report_Issue_No_;"Issue No.")
            {
            }

            trigger OnPreDataItem();
            begin
                 IF Choice3<>Choice3::Summary THEN
                    CurrReport.BREAK;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(General)
                {
                    field(Choice3;Choice3)
                    {
                        Caption = 'Issues Wise';
                    }
                    field(Choice1;Choice1)
                    {
                        Caption = 'Normal';
                    }
                    field(Consider_Return;Consider_Return)
                    {
                        Caption = 'Consider Return';
                    }
                    field(Choice2;Choice2)
                    {
                        Caption = 'If item need';
                    }
                    field(EXCEL;EXCEL)
                    {
                        Caption = 'EXCEL';
                    }
                    field(Sales_Order_No;Sales_Order_No)
                    {
                        Caption = 'Sales Order No';

                        trigger OnValidate();
                        begin
                            IF Choice3<>Choice3::Summary THEN
                                ERROR('PLEASE SELECT THE SUMMARY OPTION');
                        end;
                    }
                    field(Item_No;Item_No)
                    {
                        Caption = 'Item No';

                        trigger OnValidate();
                        begin

                             IF Choice3<>Choice3::Summary THEN
                                 ERROR('PLEASE SELECT THE SUMMARY OPTION');
                        end;
                    }
                    field(Lot;Lot)
                    {
                        Caption = 'Lot';

                        trigger OnValidate();
                        begin

                             IF Choice3<>Choice3::Summary THEN
                                 ERROR('PLEASE SELECT THE SUMMARY OPTION');
                        end;
                    }
                    field(Posting_From_Date;Posting_From_Date)
                    {
                        Caption = 'Posting From Date';

                        trigger OnValidate();
                        begin
                             IF Choice3<>Choice3::Summary THEN
                                 ERROR('PLEASE SELECT THE SUMMARY OPTION');

                             IF Posting_To_Date=0D THEN
                             Posting_To_Date:=Posting_From_Date;
                        end;
                    }
                    field(Posting_To_Date;Posting_To_Date)
                    {
                        Caption = 'Posting To Date';

                        trigger OnValidate();
                        begin
                             IF Choice3<>Choice3::Summary THEN
                                 ERROR('PLEASE SELECT THE SUMMARY OPTION');
                        end;
                    }
                    grid(Control1102152028)
                    {
                        GridLayout = Columns;
                        ShowCaption = false;
                        group(Control1102152027)
                        {
                            ShowCaption = false;
                            field("Considerations for Summary Report";'')
                            {
                                Caption = 'Considerations for Summary Report';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field("1) Before Entering the I/P in Summary Report I/P'S you must Select ""Summary Report"" Option";'')
                            {
                                Caption = '1) Before Entering the I/P in Summary Report I/P''S you must Select "Summary Report" Option';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field("2) There is 3 Combinations of I/P'S";'')
                            {
                                Caption = '2) There is 3 Combinations of I/P''S';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field("A) Sale Order No. and  Item No.";'')
                            {
                                Caption = 'A) Sale Order No. and  Item No.';
                                ShowCaption = false;
                            }
                            field("B) Item and  Lot No.";'')
                            {
                                Caption = 'B) Item and  Lot No.';
                                ShowCaption = false;
                            }
                            field("C) Item and  Posting Date";'')
                            {
                                Caption = 'C) Item and  Posting Date';
                                ShowCaption = false;
                            }
                            field("3) In Report we are Considering only Request which are Posted From STR - PROD";'')
                            {
                                Caption = '3) In Report we are Considering only Request which are Posted From STR - PROD';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field("4) Returns Should not Be Considered";'')
                            {
                                Caption = '4) Returns Should not Be Considered';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                    }
                }
            }
        }

        actions
        {
            area(creation)
            {
                group()
                {
                    action("RETURN TO STOCK")
                    {
                        Caption = 'RETURN TO STOCK';
                    }
                    action("POST DAMAGES")
                    {
                        Caption = 'POST DAMAGES';
                    }
                    action("CREATE SINGLE REQUESTS")
                    {
                        Caption = 'CREATE SINGLE REQUESTS';
                    }
                }
            }
        }
    }

    labels
    {
    }

    trigger OnPostReport();
    begin
        IF EXCEL THEN
        BEGIN
        /*Tempexcelbuffer.CreateBook('Issued Material Report');//B2B
        Tempexcelbuffer.WriteSheet('Issued Material Report',COMPANYNAME,USERID);//B2b
        Tempexcelbuffer.CloseBook; //Rev01
        Tempexcelbuffer.OpenExcel; //Rev01
        Tempexcelbuffer.GiveUserControl;*/
        Tempexcelbuffer.CreateBookAndOpenExcel('','Issued Material Report','Issued Material sheet',COMPANYNAME,USERID); //EFFUPG
        END;

    end;

    trigger OnPreReport();
    begin
         IF EXCEL THEN
         BEGIN
         CLEAR(Tempexcelbuffer);
         Tempexcelbuffer.DELETEALL;
         END;
    end;

    var
        QTY : Decimal;
        "material issues line" : Record "Material Issues Line";
        Reason : Code[100];
        Choice1 : Option Normal,Damage,Return;
        Choice2 : Option Used,NotUsed;
        ILE : Record "Item Ledger Entry";
        Lot : Code[100];
        Item : Record Item;
        UC : Decimal;
        Make : Text;
        Total : Decimal;
        "Serial no" : Code[20];
        Choice3 : Option Issue,Project,WRET,Summary;
        "Project Total" : Decimal;
        Project_Desc : Text[100];
        PO : Record "Production Order";
        "R&D total" : Decimal;
        ILE2 : Record "Item Ledger Entry";
        Tempexcelbuffer : Record "Excel Buffer" temporary;
        EXCEL : Boolean;
        Row : Integer;
        "Prod. Order Description" : Text[50];
        "Bench-Mark" : Integer;
        "Issued Date" : Date;
        Total_Qty : Decimal;
        PRL : Record "Purch. Rcpt. Line";
        ITEMLED : Record "Item Ledger Entry";
        vendor : Text[50];
        PRH : Record "Purch. Rcpt. Header";
        "BILLNO." : Code[20];
        BillDate : Date;
        Desc : Text[50];
        Value : Decimal;
        "Total Value" : Decimal;
        Ret_Qty : Decimal;
        PMIL : Record "Posted Material Issues Line";
        PMIH : Record "Posted Material Issues Header";
        PIL : Record "Purch. Inv. Line";
        Consider_Return : Boolean;
        Issued_Qty : Decimal;
        ILE3 : Record "Item Ledger Entry";
        RETURN_ITEM1 : Code[20];
        RETURN_ITEM2 : Code[20];
        RETURN_ITEM3 : Code[20];
        RETURN_ITEM4 : Code[20];
        PO_FILTER : Text[100];
        PO_LINE_NO : Integer;
        POR_LINE_CONFIRM : Boolean;
        MATERIAL_ISSUES_HEADER : Record "Material Issues Header";
        MATERIAL_ISSUES_LINE : Record "Material Issues Line";
        PO_FORM : Page "Released Production Order";
                      user : Record User;
                      REPLACE_ITEM_FILTER : Text[100];
                      TrackingSpecification : Record "Mat.Issue Track. Specification";
                      LineNo : Integer;
                      "Release MaterialIssue Document" : Codeunit "Release MaterialIssue Document";
                      Issue_Post : Codeunit "MaterialIssueOrde-Post Receipt";
                      Text002 : Label 'There is nothing to release for MaterialIssue order %1.';
        REQUESTED_QTY : Decimal;
        Sales_Order_No : Code[30];
        Item_No : Code[30];
        Posting_From_Date : Date;
        ItemLotNumbers : Record "Item Lot Numbers" temporary;
        BREAKVAR : Boolean;
        PO1 : Code[20];
        Posting_To_Date : Date;
        ileref : Code[30];
        DV : Record "Dimension Value";
        Item_Batch : Record Old_Pur_Invoices;
        Material_IssuesCaptionLbl : Label 'Material Issues';
        Project_CodeCaptionLbl : Label 'Project Code';
        Requisition_NoCaptionLbl : Label 'Requisition No';
        Item_CaptionLbl : Label '"Item "';
        UOMCaptionLbl : Label 'UOM';
        Employee_NameCaptionLbl : Label 'Employee Name';
        Reqested_DateCaptionLbl : Label 'Reqested Date';
        DeptCaptionLbl : Label 'Dept';
        Quantity_RequestedCaptionLbl : Label 'Quantity Requested';
        Quantity_ReceivedCaptionLbl : Label 'Quantity Received';
        Unit_costCaptionLbl : Label 'Unit cost';
        LOT_No_CaptionLbl : Label 'LOT No.';
        Serial_No_CaptionLbl : Label 'Serial No.';
        Bench_MarkCaptionLbl : Label 'Bench Mark';
        Vendor_NameCaptionLbl : Label 'Vendor Name';
        Bill_No_CaptionLbl : Label 'Bill No.';
        Bill_DateCaptionLbl : Label 'Bill Date';
        Issued_Date_TimeCaptionLbl : Label 'Issued Date Time';
        Material_IssuesCaption_Control1102154002Lbl : Label 'Material Issues';
        Project_CodeCaption_Control1102154004Lbl : Label 'Project Code';
        ValueCaptionLbl : Label 'Value';
        Project_DescriptionCaptionLbl : Label 'Project Description';
        DaysCaptionLbl : Label 'Days';
        DaysCaption_Control1102154011Lbl : Label 'Days';
        DaysCaption_Control1102154013Lbl : Label 'Days';
        DaysCaption_Control1102154018Lbl : Label 'Days';
        Material_IssuesCaption_Control1102154030Lbl : Label 'Material Issues';
        Item_No_CaptionLbl : Label 'Item No.';
        ValueCaption_Control1102154033Lbl : Label 'Value';
        DescriptionCaptionLbl : Label 'Description';
        Issued_QtyCaptionLbl : Label 'Issued Qty';
        Return_QtyCaptionLbl : Label 'Return Qty';
        CONSUMPTION_SUMMARYCaptionLbl : Label 'CONSUMPTION SUMMARY';
        Sales_Order_NoCaptionLbl : Label 'Sales Order No';
        Production_OrdersCaptionLbl : Label 'Production Orders';
        ItemCaptionLbl : Label 'Item';
        Issued_QtyCaption_Control1000000052Lbl : Label 'Issued Qty';
        LOTCaptionLbl : Label 'LOT';
        EmptyStringCaptionLbl : Label '-';
        GrpFVisible1 : Boolean;
        GrpFVisible2 : Boolean;
        GrpFVisible3 : Boolean;
        GrpFVisible4 : Boolean;
        GrpFVisible5 : Boolean;
        PrevProdOrderNo : Code[20];
        PrevItemNo : Code[20];
        PIH : Record "Purch. Inv. Header";
        QTY_Received : Decimal;
        TESTINV : Integer;
        StrDetails : Record "Posted Str Order Line Details";
        ADD_DUTY : Decimal;
        BC : Decimal;
        CUSTOMS_DU : Decimal;
        E_CESS : Decimal;
        E_CESS_1 : Decimal;
        E_CESS_2 : Decimal;
        E_CESS_3 : Decimal;
        E_CESS_4 : Decimal;
        E_CESS_5 : Decimal;
        FORWARDING : Decimal;
        FREIGHT_G : Decimal;
        FREIGHT_1 : Decimal;
        FREIGHT_2 : Decimal;
        HANDLING : Decimal;
        INSTAL_CHA : Decimal;
        INSURANCE : Decimal;
        PACKING : Decimal;
        ROUNDING_G : Decimal;
        SERV_TAX : Decimal;
        SERVICETAX_G : Decimal;
        EXCISE : Decimal;
        FREIGHT_C1 : Decimal;
        ROUNDING_C : Decimal;
        SALES_TAX : Decimal;
        SERVICE_TA : Decimal;
        SERVICETAX_C : Decimal;
        ST : Decimal;
        VAT : Decimal;
        UNIT_COST : Decimal;
        amount : Decimal;
        taxStructure : Code[20];
        PurchOrder : Code[20];
        invoice : Code[20];
        unitCostwithTax : Decimal;
        unitCostwithoutexcise : Decimal;
        TotalCost : Decimal;
        lotL : Code[30];
        UCinctax : Decimal;
        UClesexcise : Decimal;
        UClesExcsVat : Decimal;
        IssdMatCst : Decimal;
        temp1 : Decimal;
        strr : Text;
        strr1 : Text;
        strr2 : Text;

    [LineStart(3797)]
    procedure Entercell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[1000];bold : Boolean;CellType : Option);
    begin

        Tempexcelbuffer.INIT;
        Tempexcelbuffer.VALIDATE("Row No.",RowNo);
        Tempexcelbuffer.VALIDATE("Column No.",ColumnNo);
        Tempexcelbuffer."Cell Value as Text" := CellValue;
        Tempexcelbuffer.Bold:=bold ;
        Tempexcelbuffer."Cell Type" := CellType;
        Tempexcelbuffer.INSERT;
    end;

    [LineStart(3807)]
    procedure EnterHeadings(RowNo : Integer;ColumnNo : Integer;CellValue : Text[100];Bold : Boolean;CellType : Option);
    begin
        Tempexcelbuffer.INIT;
        Tempexcelbuffer.VALIDATE("Row No.",RowNo);
        Tempexcelbuffer.VALIDATE("Column No.",ColumnNo);
        Tempexcelbuffer."Cell Value as Text" := FORMAT(CellValue);
        Tempexcelbuffer.Bold:=Bold ;
        Tempexcelbuffer."Cell Type" := CellType;
        Tempexcelbuffer.Formula := '';
        Tempexcelbuffer.INSERT;
    end;

    [LineStart(3817)]
    procedure "Entercell New"();
    begin
    end;

    [LineStart(3820)]
    procedure GetNextNo() NumberValue : Code[20];
    var
        DateValue : Text[30];
        MonthValue : Text[30];
        YearValue : Text[30];
        MaterialIssuesHeaderLocal : Record "Material Issues Header";
        PostedMatIssHeaderLocal : Record "Posted Material Issues Header";
        LastNumber : Code[20];
    begin
        IF DATE2DMY(WORKDATE,1) < 10 THEN
          DateValue := '0'+FORMAT(DATE2DMY(WORKDATE,1))
        ELSE DateValue := FORMAT(DATE2DMY(WORKDATE,1));

        IF DATE2DMY(WORKDATE,2) < 10 THEN
          MonthValue := '0'+FORMAT(DATE2DMY(WORKDATE,2))
        ELSE
         MonthValue := FORMAT(DATE2DMY(WORKDATE,2));

        //IF DATE2DMY(WORKDATE,3) < 99 THEN
          YearValue := COPYSTR(FORMAT(DATE2DMY(WORKDATE,3)),3,2);
        //IF ((TODAY=010810D) OR (TODAY=010910D) OR (TODAY=011010D))THEN
        //  NumberValue := 'V'+YearValue+MonthValue+DateValue
        //ELSE
          NumberValue := 'R'+YearValue+MonthValue+DateValue;

        LastNumber := NumberValue+'0000';
        MaterialIssuesHeaderLocal.RESET;
        MaterialIssuesHeaderLocal.SETFILTER("No.",NumberValue+'*');
        IF MaterialIssuesHeaderLocal.FINDLAST THEN
          LastNumber := MaterialIssuesHeaderLocal."No.";

        PostedMatIssHeaderLocal.RESET;
        PostedMatIssHeaderLocal.SETCURRENTKEY("Material Issue No.");
        PostedMatIssHeaderLocal.SETFILTER("Material Issue No.",NumberValue+'*');
        IF PostedMatIssHeaderLocal.FINDLAST THEN
          IF LastNumber < PostedMatIssHeaderLocal."Material Issue No." THEN
            LastNumber := PostedMatIssHeaderLocal."Material Issue No.";

        NumberValue := INCSTR(LastNumber);
    end;
}

