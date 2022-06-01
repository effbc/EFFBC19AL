report 33000894 DC
{
    DefaultLayout = RDLC;
    RDLCLayout = './DC.rdlc';

    dataset
    {
        dataitem("Material Issues Header"; "Material Issues Header")
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending);
            RequestFilterFields = "Released Date", "Shortcut Dimension 2 Code";
            column(Outward_No__; "Outward No.")
            {
            }
            column(TODAY; TODAY)
            {
            }
            column(DC_DATA; DC_DATA)
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(TIN_NO___28350166764Caption; TIN_NO___28350166764CaptionLbl)
            {
            }
            column(E__Mail_Caption; E__Mail_CaptionLbl)
            {
            }
            column(URL_Caption; URL_CaptionLbl)
            {
            }
            column(FAX_Caption; FAX_CaptionLbl)
            {
            }
            column(To_Provide_Insight_For_Enhancing_WealthCaption; To_Provide_Insight_For_Enhancing_WealthCaptionLbl)
            {
            }
            column(Ph_Caption; Ph_CaptionLbl)
            {
            }
            column(VijayawadaCaption; VijayawadaCaptionLbl)
            {
            }
            column(Place_Caption; Place_CaptionLbl)
            {
            }
            column(S_No_Caption; S_No_CaptionLbl)
            {
            }
            column(Delivery_Challan_FormCaption; Delivery_Challan_FormCaptionLbl)
            {
            }
            column(Date_Caption; Date_CaptionLbl)
            {
            }
            column(EmptyStringCaption_Control1102152053; EmptyStringCaption_Control1102152053Lbl)
            {
            }
            column(Material_Issues_Header_No_; "No.")
            {
            }
            dataitem("Material Issues Line"; "Material Issues Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = WHERE(Quantity = FILTER(> 0));
                column(company_information___Home_Page_; "company information"."Home Page")
                {
                }
                column(company_information___E_Mail_; "company information"."E-Mail")
                {
                }
                column(company_information___Fax_No__; "company information"."Fax No.")
                {
                }
                column(company_information___Phone_No__; "company information"."Phone No.")
                {
                }
                column(company_information___Address_2_; "company information"."Address 2")
                {
                }
                column(company_information__Address; "company information".Address)
                {
                }
                column(company_information__Name; "company information".Name)
                {
                }
                column(Report_Group_No; ReportGroupNo)
                {
                }
                column(i; i)
                {
                }
                column(Material_Issues_Line__Material_Issues_Line__Description; "Material Issues Line".Description)
                {
                }
                column(Material_Issues_Line__Material_Issues_Line__Quantity; "Material Issues Line".Quantity)
                {
                }
                column(Ser_No_s_; "Ser_No's")
                {
                }
                column(NOT__Material_Issues_Line___Non_Returnable__; NOT ("Material Issues Line"."Non-Returnable"))
                {
                }
                column(S_NoCaption; S_NoCaptionLbl)
                {
                }
                column(Item_DescriptionCaption; Item_DescriptionCaptionLbl)
                {
                }
                column(Serial_NoCaption; Serial_NoCaptionLbl)
                {
                }
                column(QuantityCaption; QuantityCaptionLbl)
                {
                }
                column(ReturnableCaption; ReturnableCaptionLbl)
                {
                }
                column(Material_Issues_Line_Document_No_; "Document No.")
                {
                }
                column(Material_Issues_Line_Line_No_; "Line No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    "Ser_No's" := '';
                    i := i + 1;

                    Mits.RESET;
                    Mits.SETFILTER(Mits.Quantity, '>%1', 0);
                    Mits.SETFILTER(Mits."Order No.", "Material Issues Line"."Document No.");
                    Mits.SETFILTER(Mits."Order Line No.", FORMAT("Material Issues Line"."Line No."));
                    IF Mits.FINDFIRST THEN BEGIN
                        REPEAT
                            Item.RESET;
                            IF Item.GET("Material Issues Line"."Item No.") THEN BEGIN
                                IF Item."Item Tracking Code" = 'LOT' THEN
                                    "Ser_No's" += Mits."Lot No." + ', '
                                ELSE
                                    "Ser_No's" += Mits."Serial No." + ', ';
                            END;
                        UNTIL Mits.NEXT = 0;
                        "Ser_No's" := COPYSTR("Ser_No's", 1, STRLEN("Ser_No's") - 2);
                    END;

                    IF Choice = Choice::PostPrint THEN BEGIN
                        DC_LINE.INIT;
                        DC_LINE."Document No." := "Outward No.";
                        LINE_NO += 10000;
                        DC_LINE."Line No." := LINE_NO;
                        DC_LINE.Type := DC_LINE.Type::Item;
                        DC_LINE."No." := "Material Issues Line"."Item No.";
                        DC_LINE.Description := Item.Description;
                        DC_LINE.Quantity := "Material Issues Line".Quantity;
                        DC_LINE."Non-Returnable" := "Material Issues Line"."Non-Returnable";
                        DC_LINE."Request no" := "Material Issues Line"."Document No.";
                        DC_LINE.INSERT;
                        IF "Material Issues Line"."Non-Returnable" THEN
                            DC_HEADER.Returnable := TRUE
                        ELSE
                            DC_HEADER.Returnable := FALSE;
                    END;
                end;

                trigger OnPreDataItem();
                begin
                    IF Choice = Choice::PostPrint THEN BEGIN
                        IF NOT (DC_HEADER.GET("Outward No.")) THEN BEGIN
                            DC_HEADER.INIT;
                            DC_HEADER."No." := "Outward No.";
                            DC_HEADER.Type := DC_HEADER.Type::Site;
                            DC_HEADER."User Id" := USERID;
                            DC_HEADER."Created Date" := TODAY;
                            DC_HEADER.Indented := "Material Issues Header"."User ID";
                            User.GET("Material Issues Header"."User ID");
                            DC_HEADER."Indented Name" := User."User Name";
                            DC_HEADER.Reciver := "Send To";
                            User.GET("Send To");
                            DC_HEADER."Reciver Name" := User."User Name";
                            IF "Material Issues Header"."Vendor No." = '' THEN
                                DC_HEADER."Sell-to Customer Name" := User."User Name"
                            ELSE BEGIN
                                Vendor.RESET;
                                Vendor.SETFILTER(Vendor."No.", "Material Issues Header"."Vendor No.");
                                IF Vendor.FINDFIRST THEN
                                    DC_HEADER."Sell-to Customer Name" := Vendor.Name + ',' + Vendor.City;
                            END;
                            DC_HEADER.Authorized := "Material Issues Header"."Released By";
                            User.GET("Material Issues Header"."Released By");
                            DC_HEADER."Authorized name" := User."User Name";
                            DC_HEADER.Remarks := FORMAT("Material Issues Header".Remarks);
                            IF "Material Issues Header"."Transfer-from Code" <> 'REJ' THEN
                                DC_HEADER.SessionCode := "Material Issues Header"."Transfer-from Code"
                            ELSE
                                DC_HEADER.SessionCode := 'PUR';

                            DC_HEADER."To Date" := TODAY;
                            DC_HEADER."Mode Of Transport" := FORMAT("Material Issues Header"."Mode of Transport");
                            DC_HEADER."Request no" := "Material Issues Header"."No.";
                            DC_HEADER."Location Code" := "Material Issues Header"."Shortcut Dimension 2 Code";
                            DC_HEADER.VALIDATE(DC_HEADER."Location Code", "Material Issues Header"."Shortcut Dimension 2 Code");
                        END ELSE BEGIN
                            Selection := STRMENU(Text001, 1);
                            IF Selection = 2 THEN BEGIN
                                DC_LINE.SETRANGE(DC_LINE."Document No.", DC_HEADER."No.");
                                IF DC_LINE.FIND('-') THEN
                                    DC_LINE.DELETEALL;

                                DC_HEADER.DELETE;
                                DC_LINE.RESET;
                                DC_HEADER.INIT;
                                DC_HEADER."No." := "Outward No.";
                                DC_HEADER.Type := DC_HEADER.Type::Site;
                                DC_HEADER."User Id" := USERID;
                                DC_HEADER."Created Date" := TODAY;
                                DC_HEADER.Reciver := "Send To";
                                User.GET("Send To");
                                DC_HEADER."Reciver Name" := User."User Name";
                                DC_HEADER.Authorized := FORMAT("Material Issues Header"."Authorised By");
                                User.GET("Material Issues Header"."Authorised By");
                                DC_HEADER."Authorized name" := User."User Name";
                                DC_HEADER.Remarks := FORMAT(Purpose);
                                DC_HEADER."Mode Of Transport" := FORMAT("Material Issues Header"."Mode of Transport");
                                DC_HEADER."Request no" := "Material Issues Header"."No.";
                                DC_HEADER."Location Code" := "Material Issues Header"."Shortcut Dimension 2 Code";
                                DC_HEADER.VALIDATE(DC_HEADER."Location Code", "Material Issues Header"."Shortcut Dimension 2 Code");
                            END ELSE
                                EXIT;
                        END;
                    END;
                end;
            }

            trigger OnAfterGetRecord();
            begin

                IF Choice = Choice::PostPrint THEN BEGIN
                    DCH.RESET;
                    DCH.SETFILTER(DCH."Request no", "Material Issues Header"."No.");
                    IF DCH.FINDFIRST THEN BEGIN
                        Selection := STRMENU(Text002, 1);
                        IF Selection = 1 THEN
                            EXIT;
                    END;
                END;

                p1 := TRUE;

                "Dimension Value".SETRANGE("Dimension Value"."Dimension Code", 'LOCATIONS');
                "Dimension Value".SETRANGE("Dimension Value".Code, "Material Issues Header".GETFILTER("Material Issues Header"."Shortcut Dimension 2 Code"));
                IF "Dimension Value".FIND('-') THEN BEGIN
                    IF FORMAT("Material Issues Header"."Mode of Transport") <> 'By Hand' THEN BEGIN
                        User.RESET;
                        //User.SETRANGE(User."User Security ID","Send To"); //in Base NAV 2013 New Field is added is User."User Security ID"
                        User.SETRANGE("User Name", "Send To");//Added new code
                        IF User.FIND('-') THEN
                            Handovered_Person := User."User Name";

                        DC_DATA := '                 This is to certify that the below mentioned material is being sent to ' + FORMAT(Gender) +
                                  ' ' + Handovered_Person +
                                  ' our ' + FORMAT(Role) + ' to ' + "Dimension Value".Address1
                                  + ' ' + "Dimension Value".Address2 + ' by ' + LOWERCASE(FORMAT("Material Issues Header"."Mode of Transport")) +
                                  ' for ' + LOWERCASE(FORMAT("Material Issues Header".Remarks)) + ' Purpose';
                    END ELSE BEGIN
                        User.RESET;
                        //User.SETRANGE(User."User Security ID","Material Issues Header"."User ID"); //in Base NAV 2013 New Field is added is User."User Security ID"
                        User.SETRANGE("User Name", "Material Issues Header"."User ID"); //Added new code
                        IF User.FIND('-') THEN
                            Handovered_Person := User."User Name";

                        DC_DATA := '                 This is to certify that the below mentioned material is being sent with ' + FORMAT(Gender) +
                                  ' ' + Handovered_Person +
                                  ' our ' + FORMAT(Role) + '  to ' + "Dimension Value".Name
                                            + ' ' + LOWERCASE(FORMAT("Material Issues Header"."Mode of Transport")) + ' for ' +
                                  LOWERCASE(FORMAT("Material Issues Header".Remarks)) + ' purpose';
                    END;
                END;





                User.RESET;
                //User.SETRANGE(User."User Security ID","Material Issues Header"."Released By"); //in Base NAV 2013 New Field is added is User."User Security ID"
                User.SETRANGE("User Name", "Material Issues Header"."Released By"); //Added new code
                IF User.FIND('-') THEN
                    Auth_person := '(' + User."User Name" + ')';


                Req_person := '(' + "Material Issues Header"."Resource Name" + ')';

                //Material Issues Header, Header (1) - OnPreSection() >>
                "company information".GET;
                //Material Issues Header, Header (1) - OnPreSection() <<

                //Material Issues Header, Header (2) - OnPreSection() >>
                //i:=0;
                CASE DATE2DMY(TODAY, 2) OF
                    1:
                        BEGIN
                            Month := 'JAN';
                            Days_Of_Month := 31;
                        END;
                    2:
                        BEGIN
                            Month := 'FEB';
                            Days_Of_Month := 28;
                        END;
                    3:
                        BEGIN
                            Month := 'MAR';
                            Days_Of_Month := 31;
                        END;
                    4:
                        BEGIN
                            Month := 'APR';
                            Days_Of_Month := 30;
                        END;
                    5:
                        BEGIN
                            Month := 'MAY';
                            Days_Of_Month := 31;
                        END;
                    6:
                        BEGIN
                            Month := 'JUN';
                            Days_Of_Month := 30;
                        END;
                    7:
                        BEGIN
                            Month := 'JUL';
                            Days_Of_Month := 31;
                        END;
                    8:
                        BEGIN
                            Month := 'AUG';
                            Days_Of_Month := 31;
                        END;
                    9:
                        BEGIN
                            Month := 'SEP';
                            Days_Of_Month := 30;
                        END;
                    10:
                        BEGIN
                            Month := 'OCt';
                            Days_Of_Month := 31;
                        END;
                    11:
                        BEGIN
                            Month := 'NOV';
                            Days_Of_Month := 30;
                        END;
                    12:
                        BEGIN
                            Month := 'DEC';
                            Days_Of_Month := 31;
                        END;
                END;

                Start_Date := DMY2DATE(1, DATE2DMY(TODAY, 2), DATE2DMY(TODAY, 3));
                "Final Date" := DMY2DATE(Days_Of_Month, DATE2DMY(TODAY, 2), DATE2DMY(TODAY, 3));
                YearValue := COPYSTR(FORMAT(DATE2DMY(WORKDATE, 3)), 3, 2);

                IF STR = STR::"Main STR" THEN
                    "Outward No." := 'STR/DC/' + Month + '/' + YearValue + '/' + "Outward No."
                ELSE
                    "Outward No." := 'RND/DC/' + Month + '/' + YearValue + '/' + "Outward No.";
                //Material Issues Header, Header (2) - OnPreSection() <<
            end;

            trigger OnPreDataItem();
            begin
                CLEAR(ReportGroupNo);

                ReportGroupNo += 1;

                IF "Send To" = '' THEN
                    ERROR('PLEASE ENTER THE SEND TO PERSON INFORMATION');
            end;
        }
        dataitem("Integer"; "Integer")
        {
            DataItemTableView = SORTING(Number);
            MaxIteration = 1;
            column(Int_Number; Number)
            {
            }
            column(company_information__Name_Control1102154021; "company information".Name)
            {
            }
            column(company_information__Address_Control1102154022; "company information".Address)
            {
            }
            column(company_information___Address_2__Control1102154023; "company information"."Address 2")
            {
            }
            column(company_information___Fax_No___Control1102154024; "company information"."Fax No.")
            {
            }
            column(company_information___Phone_No___Control1102154026; "company information"."Phone No.")
            {
            }
            column(company_information___E_Mail__Control1102154029; "company information"."E-Mail")
            {
            }
            column(company_information___Home_Page__Control1102154032; "company information"."Home Page")
            {
            }
            column(TODAY_Control1102152033; TODAY)
            {
            }
            column(Outward_No___Control1102152047; "Outward No.")
            {
            }
            column(DC_DATA_Control1102152050; DC_DATA)
            {
            }
            column(Item_Data; Item_Data1)
            {
            }
            column(Item_Data_Control1000000022; Item_Data2)
            {
            }
            column(Item_Data_Control1000000023; Item_Data3)
            {
            }
            column(Item_Data_Control1000000024; Item_Data4)
            {
            }
            column(Item_Data_Control1000000025; Item_Data5)
            {
            }
            column(Item_Data_Control1000000026; Item_Data6)
            {
            }
            column(Item_Data_Control1000000027; Item_Data7)
            {
            }
            column(Item_Data_Control1000000028; Item_Data8)
            {
            }
            column(Item_Data_Control1102154057; Item_Data9)
            {
            }
            column(Item_Data_Control1102154058; Item_Data10)
            {
            }
            column(Item_Data_Control1102154059; Item_Data11)
            {
            }
            column(Item_Data_Control1102154060; Item_Data12)
            {
            }
            column(Transport_Service_Name_; "Transport Service Name")
            {
            }
            column(Transport_Service_Person_Name_; "Transport Service Person Name")
            {
            }
            column(FAX_Caption_Control1102154025; FAX_Caption_Control1102154025Lbl)
            {
            }
            column(Ph_Caption_Control1102154027; Ph_Caption_Control1102154027Lbl)
            {
            }
            column(E__Mail_Caption_Control1102154028; E__Mail_Caption_Control1102154028Lbl)
            {
            }
            column(To_Provide_Insight_For_Enhancing_WealthCaption_Control1102154030; To_Provide_Insight_For_Enhancing_WealthCaption_Control1102154030Lbl)
            {
            }
            column(URL_Caption_Control1102154031; URL_Caption_Control1102154031Lbl)
            {
            }
            column(EmptyStringCaption_Control1102154037; EmptyStringCaption_Control1102154037Lbl)
            {
            }
            column(TIN_NO__28350166764Caption; TIN_NO__28350166764CaptionLbl)
            {
            }
            column(Date_Caption_Control1102152034; Date_Caption_Control1102152034Lbl)
            {
            }
            column(VijayawadaCaption_Control1102152035; VijayawadaCaption_Control1102152035Lbl)
            {
            }
            column(Place_Caption_Control1102152039; Place_Caption_Control1102152039Lbl)
            {
            }
            column(Delivery_Challan_FormCaption_Control1102152048; Delivery_Challan_FormCaption_Control1102152048Lbl)
            {
            }
            column(S_No_Caption_Control1102152049; S_No_Caption_Control1102152049Lbl)
            {
            }
            column(attributed_for_Efftronics_systems_Pvt__Ltd_Caption; attributed_for_Efftronics_systems_Pvt__Ltd_CaptionLbl)
            {
            }
            column(Authorized_ByCaption; Authorized_ByCaptionLbl)
            {
            }
            column(EmptyStringCaption_Control1000000017; EmptyStringCaption_Control1000000017Lbl)
            {
            }
            column(Items_Requested_ByCaption; Items_Requested_ByCaptionLbl)
            {
            }
            column(Store_InchargeCaption; Store_InchargeCaptionLbl)
            {
            }
            column(ReceptionCaption; ReceptionCaptionLbl)
            {
            }
            column(DATE_Caption_Control1000000003; DATE_Caption_Control1000000003Lbl)
            {
            }
            column(FOR_OFFICE_USE_ONLYCaption; FOR_OFFICE_USE_ONLYCaptionLbl)
            {
            }
            column(This_is_to_certify_that_the_materials_are_dispatched_to___________for_Caption; This_is_to_certify_that_the_materials_are_dispatched_to___________for_CaptionLbl)
            {
            }
            column(to___Mr______________by__Mode_of_transport__Caption; to___Mr______________by__Mode_of_transport__CaptionLbl)
            {
            }
            column(Bearing_D_C__No________Dt__________Parcel_takenCaption; Bearing_D_C__No________Dt__________Parcel_takenCaptionLbl)
            {
            }
            column(By________Caption; By________CaptionLbl)
            {
            }
            column(Transport_Service_Name______________Caption; Transport_Service_Name______________CaptionLbl)
            {
            }
            column(Transport_Service_Preson_Name__Caption; Transport_Service_Preson_Name__CaptionLbl)
            {
            }
            column(Receptionist_Caption; Receptionist_CaptionLbl)
            {
            }
            column(SignatureCaption; SignatureCaptionLbl)
            {
            }
            column(DC_REPORT__GENERATED_FROM_ERP_____Caption; DC_REPORT__GENERATED_FROM_ERP_____CaptionLbl)
            {
            }
            column(Integer_Number; Number)
            {
            }
            column(P1_Caption; p1)
            {
            }
            column(FA1_Caption; FA1)
            {
            }
            column(FA2_Caption; FA2)
            {
            }
            column(FA3_Caption; FA3)
            {
            }
            column(FA4_Caption; FA4)
            {
            }
            column(MiscItem1_Caption; MiscItem1)
            {
            }
            column(MiscItem2_Caption; MiscItem2)
            {
            }
            column(MiscItem3_Caption; MiscItem3)
            {
            }
            column(MiscItem4_Caption; MiscItem4)
            {
            }
            column(MiscItem5_Caption; MiscItem5)
            {
            }
            column(MiscItem6_Caption; MiscItem6)
            {
            }
            column(MiscItem7_Caption; MiscItem7)
            {
            }
            column(MiscItem8_Caption; MiscItem8)
            {
            }
            column(ShowIntHead1; ShowIntHead1)
            {
            }
            column(ShowIntHead2; ShowIntHead2)
            {
            }
            column(ShowIntHead3; ShowIntHead3)
            {
            }
            column(ShowIntHead4; ShowIntHead4)
            {
            }
            column(ShowIntHead5; ShowIntHead5)
            {
            }
            column(ShowIntHead6; ShowIntHead6)
            {
            }
            column(ShowIntHead7; ShowIntHead7)
            {
            }
            column(ShowIntHead8; ShowIntHead8)
            {
            }
            column(ShowIntHead9; ShowIntHead9)
            {
            }
            column(ShowIntHead10; ShowIntHead10)
            {
            }
            column(ShowIntHead11; ShowIntHead11)
            {
            }
            column(ShowIntHead12; ShowIntHead12)
            {
            }
            column(ShowIntHead13; ShowIntHead13)
            {
            }
            column(ShowIntHead14; ShowIntHead14)
            {
            }
            column(ShowIntHead15; ShowIntHead15)
            {
            }
            column(The_above_is_not_for_sale_hence_no_commercial_value_can_be_Caption; The_above_is_not_for_sale_hence_no_commercial_value_can_be_CaptionLbl)
            {
            }
            column(Integer_Report_Group_No; ReportGroupNo)
            {
            }
            column(Req_person; Req_person)
            {
            }
            column(Auth_person; Auth_person)
            {
            }

            trigger OnAfterGetRecord();
            begin

                ShowIntHead1 := TRUE;
                ShowIntHead2 := TRUE;
                ShowIntHead3 := TRUE;
                ShowIntHead4 := TRUE;
                ShowIntHead5 := TRUE;
                ShowIntHead6 := TRUE;
                ShowIntHead7 := TRUE;
                ShowIntHead8 := TRUE;
                ShowIntHead9 := TRUE;
                ShowIntHead10 := TRUE;
                ShowIntHead11 := TRUE;
                ShowIntHead12 := TRUE;
                ShowIntHead13 := TRUE;
                ShowIntHead14 := TRUE;
                ShowIntHead15 := TRUE;


                //Integer, Header (1) - OnPreSection() >>
                "company information".GET;
                //CurrReport.SHOWOUTPUT(NOT p1);
                IF p1 THEN
                    ShowIntHead1 := FALSE;

                //Integer, Header (1) - OnPreSection() <<


                //Integer, Header (2) - OnPreSection() >>
                CASE DATE2DMY(TODAY, 2) OF
                    1:
                        BEGIN
                            Month := 'JAN';
                            Days_Of_Month := 31;
                        END;
                    2:
                        BEGIN
                            Month := 'FEB';
                            Days_Of_Month := 28;
                        END;
                    3:
                        BEGIN
                            Month := 'MAR';
                            Days_Of_Month := 31;
                        END;
                    4:
                        BEGIN
                            Month := 'APR';
                            Days_Of_Month := 30;
                        END;
                    5:
                        BEGIN
                            Month := 'MAY';
                            Days_Of_Month := 31;
                        END;
                    6:
                        BEGIN
                            Month := 'JUN';
                            Days_Of_Month := 30;
                        END;
                    7:
                        BEGIN
                            Month := 'JUL';
                            Days_Of_Month := 31;
                        END;
                    8:
                        BEGIN
                            Month := 'AUG';
                            Days_Of_Month := 31;
                        END;
                    9:
                        BEGIN
                            Month := 'SEP';
                            Days_Of_Month := 30;
                        END;
                    10:
                        BEGIN
                            Month := 'OCt';
                            Days_Of_Month := 31;
                        END;
                    11:
                        BEGIN
                            Month := 'NOV';
                            Days_Of_Month := 30;
                        END;
                    12:
                        BEGIN
                            Month := 'DEC';
                            Days_Of_Month := 31;
                        END;
                END;

                IF (NOT p1) AND (Choice = Choice::PostPrint) THEN BEGIN
                    Start_Date := DMY2DATE(1, DATE2DMY(TODAY, 2), DATE2DMY(TODAY, 3));
                    "Final Date" := DMY2DATE(Days_Of_Month, DATE2DMY(TODAY, 2), DATE2DMY(TODAY, 3));
                    YearValue := COPYSTR(FORMAT(DATE2DMY(WORKDATE, 3)), 3, 2);
                    IF STR = STR::"Main STR" THEN
                        "Outward No." := 'STR/DC/' + Month + '/' + YearValue + '/' + "Outward No."
                    ELSE
                        "Outward No." := 'RND/DC/' + Month + '/' + YearValue + '/' + "Outward No.";

                    IF NOT (DC_HEADER.GET("Outward No.")) THEN BEGIN
                        DC_HEADER.INIT;
                        DC_HEADER."No." := "Outward No.";
                        DC_HEADER.Type := DC_HEADER.Type::Site;
                        DC_HEADER."User Id" := USERID;
                        DC_HEADER."Created Date" := TODAY;
                        DC_HEADER.Indented := "Material Issues Header"."User ID";
                        User.GET("Material Issues Header"."User ID");
                        //Rev01 Start
                        //Code Commented
                        /*
                        DC_HEADER."Indented Name":=User.Name;
                        */
                        DC_HEADER."Indented Name" := User."User Name";
                        //Rev01 End
                        DC_HEADER.Reciver := "Send To";
                        User.GET("Send To");

                        //Rev01 Start
                        //Code Commented
                        /*
                        DC_HEADER."Reciver Name":=User.Name;
                        */
                        DC_HEADER."Reciver Name" := User."User Name";
                        //Rev01 End

                        DC_HEADER.Authorized := FORMAT("Material Issues Header"."Authorised By");
                        User.GET("Material Issues Header"."Authorised By");

                        //Rev01 Start
                        //Code Commented
                        /*
                        DC_HEADER."Authorized name":=User.Name;
                        */
                        DC_HEADER."Authorized name" := User."User Name";
                        //Rev01 End

                        DC_HEADER.Remarks := FORMAT("Material Issues Header".Remarks);
                        DC_HEADER."Mode Of Transport" := FORMAT("Material Issues Header"."Mode of Transport");
                        DC_HEADER."Request no" := "Material Issues Header"."No.";
                        DC_HEADER."Location Code" := "Material Issues Header"."Shortcut Dimension 2 Code";
                        DC_HEADER.VALIDATE(DC_HEADER."Location Code", "Material Issues Header"."Shortcut Dimension 2 Code");
                    END ELSE BEGIN
                        Selection := STRMENU(Text001, 1);
                        IF Selection = 2 THEN BEGIN
                            DC_LINE.SETRANGE(DC_LINE."Document No.", DC_HEADER."No.");
                            IF DC_LINE.FIND('-') THEN
                                DC_LINE.DELETE;

                            DC_HEADER.DELETE;
                            DC_LINE.RESET;
                            DC_HEADER.INIT;
                            DC_HEADER."No." := "Outward No.";
                            DC_HEADER.Type := DC_HEADER.Type::Site;
                            DC_HEADER."User Id" := USERID;
                            DC_HEADER."Created Date" := TODAY;
                            DC_HEADER.Indented := "Material Issues Header"."User ID";
                            User.GET("Material Issues Header"."User ID");

                            //Rev01 Start
                            //Code Commented
                            /*
                            DC_HEADER."Indented Name":=User.Name;
                            */
                            DC_HEADER."Indented Name" := User."User Name";
                            //Rev01 End

                            DC_HEADER.Reciver := "Send To";
                            User.GET("Send To");
                            //Rev01 Start
                            //Code Commented
                            /*
                            DC_HEADER."Reciver Name":=User.Name;
                            */
                            DC_HEADER."Reciver Name" := User."User Name";
                            //Rev01 End

                            User.GET("Material Issues Header"."Authorised By");

                            //Rev01 Start
                            //Code Commented
                            /*
                            DC_HEADER."Authorized name":=User.Name;
                            */
                            DC_HEADER."Authorized name" := User."User Name";
                            //Rev01 End

                            DC_HEADER.Remarks := FORMAT("Material Issues Header".Remarks);
                            DC_HEADER."Mode Of Transport" := FORMAT("Material Issues Header"."Mode of Transport");
                            DC_HEADER."Request no" := "Material Issues Header"."No.";
                            DC_HEADER."Location Code" := "Material Issues Header"."Shortcut Dimension 2 Code";
                            DC_HEADER.VALIDATE(DC_HEADER."Location Code", "Material Issues Header"."Shortcut Dimension 2 Code");
                        END ELSE
                            EXIT;
                    END;
                END;
                IF p1 THEN
                    ShowIntHead2 := FALSE;
                //Integer, Header (2) - OnPreSection() <<

                //Integer, Header (3) - OnPreSection() >>
                IF p1 THEN
                    ShowIntHead3 := FALSE;
                //Integer, Header (3) - OnPreSection() <<

                //Integer, Header (4) - OnPreSection() >>
                IF FA1 <> '' THEN BEGIN
                    "Sl No." += 1;
                    "Fixed Asset".RESET;
                    "Fixed Asset".SETRANGE("Fixed Asset"."No.", FA1);
                    IF "Fixed Asset".FIND('-') THEN
                        //Item_Data:=FORMAT("Sl No.")+'. '+"Fixed Asset".Description+'( Sl No.'+"Fixed Asset"."Serial No."+')- 1 No.s';
                        Item_Data1 := FORMAT("Sl No.") + '. ' + "Fixed Asset".Description + '( Sl No.' + "Fixed Asset"."Serial No." + ')- 1 No.s';
                    IF Choice = Choice::PostPrint THEN BEGIN
                        DC_LINE.INIT;
                        DC_LINE."Document No." := "Outward No.";
                        LINE_NO += 10000;
                        DC_LINE."Line No." := LINE_NO;
                        DC_LINE.Type := DC_LINE.Type::"Fixed Asset";
                        DC_LINE."No." := FA1;
                        DC_LINE.Quantity := 1;
                        DC_LINE."Non-Returnable" := FALSE;
                        DC_LINE.INSERT;
                    END
                END ELSE
                    //CurrReport.SHOWOUTPUT:=FALSE;
                    ShowIntHead4 := FALSE;
                //Integer, Header (4) - OnPreSection() <<

                //Integer, Header (5) - OnPreSection() >>
                IF FA2 <> '' THEN BEGIN
                    "Sl No." += 1;
                    "Fixed Asset".RESET;
                    "Fixed Asset".SETRANGE("Fixed Asset"."No.", FA2);
                    IF "Fixed Asset".FIND('-') THEN
                        Item_Data2 := FORMAT("Sl No.") + '. ' + "Fixed Asset".Description + '(Sl No.' + "Fixed Asset"."Serial No." + ')- 1 No.s';

                    IF Choice = Choice::PostPrint THEN BEGIN
                        DC_LINE.INIT;
                        DC_LINE."Document No." := "Outward No.";
                        LINE_NO += 10000;
                        DC_LINE."Line No." := LINE_NO;
                        DC_LINE.Type := DC_LINE.Type::"Fixed Asset";
                        DC_LINE."No." := FA2;
                        DC_LINE.Quantity := 1;
                        DC_LINE."Non-Returnable" := FALSE;
                        DC_LINE.INSERT;
                    END;

                END ELSE
                    //CurrReport.SHOWOUTPUT:=FALSE;
                    ShowIntHead5 := FALSE;
                //Integer, Header (5) - OnPreSection() <<

                //Integer, Header (6) - OnPreSection() >>
                IF FA3 <> '' THEN BEGIN
                    "Sl No." += 1;
                    "Fixed Asset".RESET;
                    "Fixed Asset".SETRANGE("Fixed Asset"."No.", FA3);
                    IF "Fixed Asset".FIND('-') THEN
                        Item_Data3 := FORMAT("Sl No.") + '. ' + "Fixed Asset".Description + '( Sl No.' + "Fixed Asset"."Serial No." + ')- 1 No.s';
                    IF Choice = Choice::PostPrint THEN BEGIN
                        DC_LINE.INIT;
                        DC_LINE."Document No." := "Outward No.";
                        LINE_NO += 10000;
                        DC_LINE."Line No." := LINE_NO;
                        DC_LINE.Type := DC_LINE.Type::"Fixed Asset";
                        DC_LINE."No." := FA3;
                        DC_LINE.Quantity := 1;
                        DC_LINE."Non-Returnable" := FALSE;
                        DC_LINE.INSERT;
                    END;

                END ELSE
                    //CurrReport.SHOWOUTPUT:=FALSE;
                    ShowIntHead6 := FALSE;
                //Integer, Header (6) - OnPreSection() <<

                //Integer, Header (7) - OnPreSection() >>
                IF FA4 <> '' THEN BEGIN
                    "Sl No." += 1;
                    "Fixed Asset".RESET;
                    "Fixed Asset".SETRANGE("Fixed Asset"."No.", FA4);
                    IF "Fixed Asset".FIND('-') THEN
                        Item_Data4 := FORMAT("Sl No.") + '. ' + "Fixed Asset".Description + '( Sl No.' + "Fixed Asset"."Serial No." + ')- 1 No.s';
                    IF Choice = Choice::PostPrint THEN BEGIN
                        DC_LINE.INIT;
                        DC_LINE."Document No." := "Outward No.";
                        LINE_NO += 10000;
                        DC_LINE."Line No." := LINE_NO;
                        DC_LINE.Type := DC_LINE.Type::"Fixed Asset";
                        DC_LINE."No." := FA4;
                        DC_LINE.Quantity := 1;
                        DC_LINE."Non-Returnable" := FALSE;
                        DC_LINE.INSERT;
                    END;
                END ELSE
                    //CurrReport.SHOWOUTPUT:=FALSE;
                    ShowIntHead7 := FALSE;
                //Integer, Header (7) - OnPreSection() <<

                //Integer, Header (8) - OnPreSection() >>
                IF MiscItem1 <> '' THEN BEGIN
                    IF Choice = Choice::PostPrint THEN BEGIN
                        DC_LINE.INIT;
                        DC_LINE."Document No." := "Outward No.";
                        LINE_NO += 10000;
                        DC_LINE."Line No." := LINE_NO;
                        DC_LINE.Description := MiscItem1;
                        DC_LINE.Quantity := MQTY_1;
                        DC_LINE.INSERT;
                    END;
                    "Sl No." += 1;
                    Item_Data5 := FORMAT("Sl No.") + '. ' + MiscItem1 + '--' + FORMAT(MQTY_1) + ' No.s';
                END ELSE
                    //CurrReport.SHOWOUTPUT:=FALSE;
                    ShowIntHead8 := FALSE;
                //Integer, Header (8) - OnPreSection() <<

                //Integer, Header (9) - OnPreSection() >>
                IF MiscItem2 <> '' THEN BEGIN
                    IF Choice = Choice::PostPrint THEN BEGIN
                        DC_LINE.INIT;
                        DC_LINE."Document No." := "Outward No.";
                        LINE_NO += 10000;
                        DC_LINE."Line No." := LINE_NO;
                        DC_LINE.Description := MiscItem2;
                        DC_LINE.Quantity := MQTY_2;
                        DC_LINE.INSERT;
                    END;
                    "Sl No." += 1;
                    Item_Data6 := FORMAT("Sl No.") + '. ' + MiscItem2 + '--' + FORMAT(MQTY_2) + ' No.s';
                END ELSE
                    //CurrReport.SHOWOUTPUT:=FALSE;
                    ShowIntHead9 := FALSE;
                //Integer, Header (9) - OnPreSection() <<

                //Integer, Header (10) - OnPreSection() >>
                IF MiscItem3 <> '' THEN BEGIN
                    IF Choice = Choice::PostPrint THEN BEGIN
                        DC_LINE.INIT;
                        DC_LINE."Document No." := "Outward No.";
                        LINE_NO += 10000;
                        DC_LINE."Line No." := LINE_NO;
                        DC_LINE.Description := MiscItem3;
                        DC_LINE.Quantity := MQTY_3;
                        DC_LINE.INSERT;
                    END;
                    "Sl No." += 1;
                    Item_Data7 := FORMAT("Sl No.") + '. ' + MiscItem3 + '--' + FORMAT(MQTY_3) + ' No.s';
                END ELSE
                    //CurrReport.SHOWOUTPUT:=FALSE;
                    ShowIntHead10 := FALSE;
                //Integer, Header (10) - OnPreSection() <<

                //Integer, Header (11) - OnPreSection() >>
                IF MiscItem4 <> '' THEN BEGIN
                    IF Choice = Choice::PostPrint THEN BEGIN
                        DC_LINE.INIT;
                        DC_LINE."Document No." := "Outward No.";
                        LINE_NO += 10000;
                        DC_LINE."Line No." := LINE_NO;
                        DC_LINE.Description := MiscItem4;
                        DC_LINE.Quantity := MQTY_4;
                        DC_LINE.INSERT;
                    END;
                    "Sl No." += 1;
                    Item_Data8 := FORMAT("Sl No.") + '. ' + MiscItem4 + '--' + FORMAT(MQTY_4) + ' No.s';
                END ELSE
                    //CurrReport.SHOWOUTPUT:=FALSE;
                    ShowIntHead11 := FALSE;
                //Integer, Header (11) - OnPreSection() <<

                //Integer, Header (12) - OnPreSection() >>
                IF MiscItem5 <> '' THEN BEGIN
                    IF Choice = Choice::PostPrint THEN BEGIN
                        DC_LINE.INIT;
                        DC_LINE."Document No." := "Outward No.";
                        LINE_NO += 10000;
                        DC_LINE."Line No." := LINE_NO;
                        DC_LINE.Description := MiscItem5;
                        DC_LINE.Quantity := MQTY_5;
                        DC_LINE.INSERT;
                    END;
                    "Sl No." += 1;
                    Item_Data9 := FORMAT("Sl No.") + '. ' + MiscItem5 + '--' + FORMAT(MQTY_5) + ' No.s';
                END ELSE
                    //CurrReport.SHOWOUTPUT:=FALSE;
                    ShowIntHead12 := FALSE;
                //Integer, Header (12) - OnPreSection() <<

                //Integer, Header (13) - OnPreSection() >>
                IF MiscItem6 <> '' THEN BEGIN
                    IF Choice = Choice::PostPrint THEN BEGIN
                        DC_LINE.INIT;
                        DC_LINE."Document No." := "Outward No.";
                        LINE_NO += 10000;
                        DC_LINE."Line No." := LINE_NO;
                        DC_LINE.Description := MiscItem6;
                        DC_LINE.Quantity := MQTY_6;
                        DC_LINE.INSERT;
                    END;
                    "Sl No." += 1;
                    Item_Data10 := FORMAT("Sl No.") + '. ' + MiscItem6 + '--' + FORMAT(MQTY_6) + ' No.s';
                END ELSE
                    //CurrReport.SHOWOUTPUT:=FALSE;
                    ShowIntHead13 := FALSE;
                //Integer, Header (13) - OnPreSection() <<

                //Integer, Header (14) - OnPreSection() >>
                IF MiscItem7 <> '' THEN BEGIN
                    IF Choice = Choice::PostPrint THEN BEGIN
                        DC_LINE.INIT;
                        DC_LINE."Document No." := "Outward No.";
                        LINE_NO += 10000;
                        DC_LINE."Line No." := LINE_NO;
                        DC_LINE.Description := MiscItem7;
                        DC_LINE.Quantity := MQTY_7;
                        DC_LINE.INSERT;
                    END;
                    "Sl No." += 1;
                    Item_Data11 := FORMAT("Sl No.") + '. ' + MiscItem7 + '--' + FORMAT(MQTY_7) + ' No.s';
                END ELSE
                    //CurrReport.SHOWOUTPUT:=FALSE;
                    ShowIntHead14 := FALSE;
                //Integer, Header (14) - OnPreSection() <<

                //Integer, Header (15) - OnPreSection() >>
                IF MiscItem8 <> '' THEN BEGIN
                    IF Choice = Choice::PostPrint THEN BEGIN
                        DC_LINE.INIT;
                        DC_LINE."Document No." := "Outward No.";
                        LINE_NO += 10000;
                        DC_LINE."Line No." := LINE_NO;
                        DC_LINE.Description := MiscItem8;
                        DC_LINE.Quantity := MQTY_8;
                        DC_LINE.INSERT;
                    END;
                    "Sl No." += 1;
                    Item_Data12 := FORMAT("Sl No.") + '. ' + MiscItem8 + '--' + FORMAT(MQTY_8) + ' No.s';
                END ELSE
                    //CurrReport.SHOWOUTPUT:=FALSE;
                    ShowIntHead15 := FALSE;
                //Integer, Header (15) - OnPreSection() <<

                //Integer, Body (23) - OnPreSection() >>
                IF Choice = Choice::PostPrint THEN
                    DC_HEADER.INSERT;
                //Integer, Body (23) - OnPreSection() <<

            end;

            trigger OnPreDataItem();
            begin
                ReportGroupNo += 1;
                IF p1 = FALSE THEN BEGIN
                    IF FORMAT("Mode Of Transport") = '' THEN
                        ERROR('PLEASE ENTER THE "MODE OF TRANSPORT" INFORMTATION');

                    //IF "Send To"='' THEN
                    //ERROR('PLEASE ENTER THE SEND TO PERSON INFORMATION');

                    User.RESET;
                    User.SETRANGE(User."User Name", "Send To");
                    IF User.FIND('-') THEN
                        Handovered_Person := User."User Name";

                    "Dimension Value".SETRANGE("Dimension Value"."Dimension Code", 'LOCATIONS');
                    "Dimension Value".SETRANGE("Dimension Value".Code, "Material Issues Header".GETFILTER("Material Issues Header"."Shortcut Dimension 2 Code"));
                    IF "Dimension Value".FIND('-') THEN BEGIN
                        IF FORMAT("Mode Of Transport") <> 'By Hand' THEN BEGIN
                            DC_DATA := '                 This is to certify that the below mentioned material is being  Sent to ' + FORMAT(Gender) +
                                      ' ' + Handovered_Person +
                                      ' Our ' + FORMAT(Role) + ' to ' + "Dimension Value".Address1 +
                                      ' ' + "Dimension Value".Address2 + ' by ' + FORMAT("Mode Of Transport") +
                                      ' for ' + FORMAT("Material Issues Header".Remarks) + ' Purpose';
                        END ELSE BEGIN
                            DC_DATA := '                 This is to certify that the below mentioned material is being  Sent with ' + FORMAT(Gender) +
                                    ' ' + Handovered_Person +
                                    ' Our ' + FORMAT(Role) + '  to ' + "Dimension Value".Name
                                    + ' ' + FORMAT("Mode Of Transport") + ' for ' +
                                    FORMAT("Material Issues Header".Remarks) + ' Purpose';
                        END;
                    END;
                END;
            end;
        }
    }

    requestpage
    {
        PopulateAllFields = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    group("DC Details")
                    {
                        field("DC No."; "Outward No.")
                        {
                        }
                        field("Mode of Transport"; "Mode Of Transport")
                        {
                        }
                        field(Role; Role)
                        {
                            ColumnSpan = 2;
                            RowSpan = 2;
                        }
                        field(STORE; STR)
                        {
                            ColumnSpan = 2;
                            RowSpan = 2;

                            trigger OnValidate();
                            begin
                                //Rev01 Start
                                IF STR = STR::"Main STR" THEN
                                    "Outward No." := 'STR/DC/' + Month + '/' + YearValue + '/*'
                                ELSE
                                    "Outward No." := 'RND/DC/' + Month + '/' + YearValue + '/*';
                                DCH.RESET;
                                DCH.SETFILTER(DCH."No.", "Outward No.");
                                IF DCH.FINDLAST THEN
                                    "Outward No." := INCSTR(COPYSTR(DCH."No.", 15, 17))
                                ELSE
                                    "Outward No." := '001';
                                //Rev01 End
                            end;
                        }
                    }
                    grid(Control1102152010)
                    {
                        GridLayout = Rows;
                        ShowCaption = false;
                        group(Control1102152012)
                        {
                            ShowCaption = false;
                            field("Send To1"; '')
                            {
                                Caption = 'Send To';
                                ShowCaption = false;
                            }
                            field("Send To"; "Send To")
                            {
                                ShowCaption = false;

                                trigger OnLookup(Text: Text): Boolean;
                                begin
                                    //Rev01 Start
                                    User.RESET;
                                    IF PAGE.RUNMODAL(9800, User) = ACTION::LookupOK THEN
                                        "Send To" := User."User Name";
                                    //Rev01 End
                                end;
                            }
                            field(Gender; Gender)
                            {
                                ShowCaption = false;
                                Style = Standard;
                                StyleExpr = TRUE;
                            }
                            field(Control1102152109; '')
                            {
                                ShowCaption = true;
                            }
                            field(Control1102152108; '')
                            {
                                ShowCaption = true;
                            }
                            field(Control1102152107; '')
                            {
                                ShowCaption = true;
                            }
                            field(Control1102152106; '')
                            {
                                ShowCaption = true;
                            }
                            field(Control1102152105; '')
                            {
                                ShowCaption = true;
                            }
                            field(Control1102152104; '')
                            {
                                ShowCaption = true;
                            }
                        }
                    }
                    field(Choice; Choice)
                    {
                        Caption = 'Post / Pist & Print';
                    }
                }
                group("Fixed Assests")
                {
                    grid(Control1102152011)
                    {
                        GridLayout = Rows;
                        ShowCaption = false;
                        group(Control1102152020)
                        {
                            ShowCaption = false;
                            field("Fixed Assest1a"; '')
                            {
                                Caption = 'Fixed Assest 1';
                                ShowCaption = false;
                            }
                            field("Fixed Assest1"; FA1)
                            {
                                ShowCaption = false;
                                TableRelation = "Fixed Asset";
                            }
                            field(Ac1; Ac1)
                            {
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //Rev01 Start
                                    IF Ac1 THEN BEGIN
                                        IF "Send To" = '' THEN
                                            ERROR('Please Enter the Send To Person Code ')
                                        ELSE BEGIN
                                            "Fixed Asset".RESET;
                                            "Fixed Asset".SETRANGE("Fixed Asset"."No.", FA1);
                                            IF "Fixed Asset".FIND('-') THEN BEGIN
                                                IF "Fixed Asset"."Responsible Employee" = '99ST005' THEN BEGIN
                                                    "Fixed Asset".VALIDATE("Fixed Asset"."Responsible Employee", "Send To");
                                                    "Fixed Asset"."Responsible Employee" := "Send To";
                                                    "Fixed Asset".MODIFY;
                                                END ELSE
                                                    ERROR('Given Fixed Asset not Under CS Control');
                                            END
                                        END;
                                    END;

                                    //Rev01 End
                                end;
                            }
                            field("Note: Please Click on Check Box After Entering the Fixed Asset"; '')
                            {
                                Caption = 'Note: Please Click on Check Box After Entering the Fixed Asset';
                                ShowCaption = false;
                            }
                            field(Control1102152097; '')
                            {
                                ShowCaption = true;
                            }
                            field(Control1102152096; '')
                            {
                                ShowCaption = true;
                            }
                            field(Control1102152095; '')
                            {
                                ShowCaption = true;
                            }
                            field(Control1102152094; '')
                            {
                                ShowCaption = true;
                            }
                            field(Control1102152100; '')
                            {
                                ShowCaption = true;
                            }
                            field(Control1102152099; '')
                            {
                                ShowCaption = true;
                            }
                            field(Control1102152098; '')
                            {
                                ShowCaption = true;
                            }
                            field(Control1102152103; '')
                            {
                                ShowCaption = true;
                            }
                            field(Control1102152102; '')
                            {
                                ShowCaption = true;
                            }
                            field(Control1102152101; '')
                            {
                                ShowCaption = true;
                            }
                        }
                        group(Control1102152024)
                        {
                            ShowCaption = false;
                            field("Fixed Assest2a"; '')
                            {
                                Caption = 'Fixed Assest 2';
                                ShowCaption = false;
                            }
                            field("Fixed Assest2"; FA2)
                            {
                                ShowCaption = false;
                                TableRelation = "Fixed Asset";
                            }
                            field(Ac2; Ac2)
                            {
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //Rev01 Start

                                    IF Ac2 THEN BEGIN
                                        IF "Send To" = '' THEN
                                            ERROR('Please Enter the Send To Person Code ')
                                        ELSE BEGIN
                                            "Fixed Asset".RESET;
                                            "Fixed Asset".SETRANGE("Fixed Asset"."No.", FA2);
                                            IF "Fixed Asset".FIND('-') THEN BEGIN
                                                IF "Fixed Asset"."Responsible Employee" = '99ST005' THEN BEGIN
                                                    "Fixed Asset".VALIDATE("Fixed Asset"."Responsible Employee", "Send To");
                                                    "Fixed Asset"."Responsible Employee" := "Send To";
                                                    "Fixed Asset".MODIFY;
                                                END ELSE
                                                    ERROR('Given Fixed Asset not Under CS Control');
                                            END
                                        END;
                                    END;

                                    //Rev01 End
                                end;
                            }
                            field(Control1102152022; '')
                            {
                                Caption = 'Note: Please Click on Check Box After Entering the Fixed Asset';
                                ShowCaption = false;
                            }
                        }
                        group(Control1102152031)
                        {
                            ShowCaption = false;
                            field("Fixed Assest3a"; '')
                            {
                                Caption = 'Fixed Assest 3';
                                ShowCaption = false;
                            }
                            field("Fixed Assest3"; FA3)
                            {
                                Caption = '<Fixed Assest3>';
                                ShowCaption = false;
                                TableRelation = "Fixed Asset";
                            }
                            field(Ac3; Ac3)
                            {
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //Rev01 Start
                                    IF Ac3 THEN BEGIN
                                        IF "Send To" = '' THEN
                                            ERROR('Please Enter the Send To Person Code ')
                                        ELSE BEGIN
                                            "Fixed Asset".RESET;
                                            "Fixed Asset".SETRANGE("Fixed Asset"."No.", FA3);
                                            IF "Fixed Asset".FIND('-') THEN BEGIN
                                                IF "Fixed Asset"."Responsible Employee" = '99ST005' THEN BEGIN
                                                    "Fixed Asset".VALIDATE("Fixed Asset"."Responsible Employee", "Send To");
                                                    "Fixed Asset"."Responsible Employee" := "Send To";
                                                    "Fixed Asset".MODIFY;
                                                END ELSE
                                                    ERROR('Given Fixed Asset not Under CS Control');
                                            END
                                        END;
                                    END;

                                    //Rev01 End
                                end;
                            }
                            field(Control1102152025; '')
                            {
                                Caption = 'Note: Please Click on Check Box After Entering the Fixed Asset';
                                ShowCaption = false;
                            }
                        }
                        group(Control1102152034)
                        {
                            ShowCaption = false;
                            field("Fixed Assest4a"; '')
                            {
                                Caption = 'Fixed Assest 4';
                                ShowCaption = false;
                            }
                            field("Fixed Assest4"; FA4)
                            {
                                Caption = '<Fixed Assest4>';
                                ShowCaption = false;
                                TableRelation = "Fixed Asset";
                            }
                            field(Ac4; Ac4)
                            {
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //Rev01 Start
                                    IF Ac4 THEN BEGIN
                                        IF "Send To" = '' THEN
                                            ERROR('Please Enter the Send To Person Code ')
                                        ELSE BEGIN
                                            "Fixed Asset".RESET;
                                            "Fixed Asset".SETRANGE("Fixed Asset"."No.", FA4);
                                            IF "Fixed Asset".FIND('-') THEN BEGIN
                                                IF "Fixed Asset"."Responsible Employee" = '99ST005' THEN BEGIN
                                                    "Fixed Asset".VALIDATE("Fixed Asset"."Responsible Employee", "Send To");
                                                    "Fixed Asset"."Responsible Employee" := "Send To";
                                                    "Fixed Asset".MODIFY;
                                                END ELSE
                                                    ERROR('Given Fixed Asset not Under CS Control');
                                            END
                                        END;
                                    END;

                                    //Rev01 End
                                end;
                            }
                            field(Control1102152017; '')
                            {
                                Caption = 'Note: Please Click on Check Box After Entering the Fixed Asset';
                                ShowCaption = false;
                            }
                        }
                    }
                }
                group(Control1102152035)
                {
                    //The GridLayout property is only supported on controls of type Grid
                    //GridLayout = Rows;
                    ShowCaption = false;
                    grid(Control1102152038)
                    {
                        GridLayout = Rows;
                        ShowCaption = false;
                        group(Control1102152039)
                        {
                            ShowCaption = false;
                            field(Accesories; '')
                            {
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(Control1102152052; '')
                            {
                                ShowCaption = true;
                            }
                            field(Qty; '')
                            {
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(Control1102152040; '')
                            {
                                ShowCaption = true;
                            }
                            field(Control1102152041; '')
                            {
                                ShowCaption = true;
                            }
                            field(Control1102152047; '')
                            {
                                ShowCaption = true;
                            }
                            field(Control1102152046; '')
                            {
                                ShowCaption = true;
                            }
                            field(Control1102152053; '')
                            {
                                ShowCaption = true;
                            }
                            field(Control1102152088; '')
                            {
                                ShowCaption = true;
                            }
                            field(Control1102152087; '')
                            {
                                ShowCaption = true;
                            }
                            field(Control1102152086; '')
                            {
                                ShowCaption = true;
                            }
                            field(Control1102152090; '')
                            {
                                ShowCaption = true;
                            }
                            field(Control1102152089; '')
                            {
                                ShowCaption = true;
                            }
                            field(Control1102152093; '')
                            {
                                ShowCaption = true;
                            }
                            field(Control1102152092; '')
                            {
                                ShowCaption = true;
                            }
                            field(Control1102152091; '')
                            {
                                ShowCaption = true;
                            }
                        }
                        group(Control1102152048)
                        {
                            ShowCaption = false;
                            field("Item1."; '')
                            {
                                ShowCaption = false;
                            }
                            field(MiscItem1; MiscItem1)
                            {
                                ShowCaption = false;
                            }
                            field(MQTY_1; MQTY_1)
                            {
                                ShowCaption = false;
                            }
                        }
                        group(Control1102152045)
                        {
                            ShowCaption = false;
                            field("Item2."; '')
                            {
                                ShowCaption = false;
                            }
                            field(MiscItem2; MiscItem2)
                            {
                                ShowCaption = false;
                            }
                            field(MQTY_2; MQTY_2)
                            {
                                ShowCaption = false;
                            }
                        }
                        group(Control1102152057)
                        {
                            ShowCaption = false;
                            field("Item3."; '')
                            {
                                ShowCaption = false;
                            }
                            field(MiscItem3; MiscItem3)
                            {
                                ShowCaption = false;
                            }
                            field(MQTY_3; MQTY_3)
                            {
                                ShowCaption = false;
                            }
                        }
                        group(Control1102152061)
                        {
                            ShowCaption = false;
                            field("Item4."; '')
                            {
                                ShowCaption = false;
                            }
                            field(MiscItem4; MiscItem4)
                            {
                                ShowCaption = false;
                            }
                            field(MQTY_4; MQTY_4)
                            {
                                ShowCaption = false;
                            }
                        }
                        group(Control1102152065)
                        {
                            ShowCaption = false;
                            field("Item5."; '')
                            {
                                ShowCaption = false;
                            }
                            field(MiscItem5; MiscItem5)
                            {
                                ShowCaption = false;
                            }
                            field(MQTY_5; MQTY_5)
                            {
                                ShowCaption = false;
                            }
                        }
                        group(Control1102152069)
                        {
                            ShowCaption = false;
                            field("Item6."; '')
                            {
                                ShowCaption = false;
                            }
                            field(MiscItem6; MiscItem6)
                            {
                                ShowCaption = false;
                            }
                            field(MQTY_6; MQTY_6)
                            {
                                ShowCaption = false;
                            }
                        }
                        group(Control1102152073)
                        {
                            ShowCaption = false;
                            field("Item7."; '')
                            {
                                ShowCaption = false;
                            }
                            field(MiscItem7; MiscItem7)
                            {
                                ShowCaption = false;
                            }
                            field(MQTY_7; MQTY_7)
                            {
                                ShowCaption = false;
                            }
                        }
                        group(Control1102152077)
                        {
                            ShowCaption = false;
                            field("Item8."; '')
                            {
                                ShowCaption = false;
                            }
                            field(MiscItem8; MiscItem8)
                            {
                                ShowCaption = false;
                            }
                            field(MQTY_8; MQTY_8)
                            {
                                ShowCaption = false;
                            }
                        }
                        group(Control1102152081)
                        {
                            ShowCaption = false;
                            field("Item9."; '')
                            {
                                ShowCaption = false;
                            }
                            field(MiscItem9; MiscItem9)
                            {
                                ShowCaption = false;
                            }
                            field(MQTY_9; MQTY_9)
                            {
                                ShowCaption = false;
                            }
                        }
                        group(Control1102152085)
                        {
                            ShowCaption = false;
                            field("Item10."; '')
                            {
                                ShowCaption = false;
                            }
                            field(MiscItem10; MiscItem10)
                            {
                                ShowCaption = false;
                            }
                            field(MQTY_10; MQTY_10)
                            {
                                ShowCaption = false;
                            }
                        }
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport();
    begin

        YearValue := COPYSTR(FORMAT(DATE2DMY(WORKDATE, 3)), 3, 2);

        CASE DATE2DMY(TODAY, 2) OF
            1:
                BEGIN
                    Month := 'JAN';
                    Days_Of_Month := 31;
                END;
            2:
                BEGIN
                    Month := 'FEB';
                    Days_Of_Month := 28;
                END;
            3:
                BEGIN
                    Month := 'MAR';
                    Days_Of_Month := 31;
                END;
            4:
                BEGIN
                    Month := 'APR';
                    Days_Of_Month := 30;
                END;
            5:
                BEGIN
                    Month := 'MAY';
                    Days_Of_Month := 31;
                END;
            6:
                BEGIN
                    Month := 'JUN';
                    Days_Of_Month := 30;
                END;
            7:
                BEGIN
                    Month := 'JUL';
                    Days_Of_Month := 31;
                END;
            8:
                BEGIN
                    Month := 'AUG';
                    Days_Of_Month := 31;
                END;
            9:
                BEGIN
                    Month := 'SEP';
                    Days_Of_Month := 30;
                END;
            10:
                BEGIN
                    Month := 'OCt';
                    Days_Of_Month := 31;
                END;
            11:
                BEGIN
                    Month := 'NOV';
                    Days_Of_Month := 30;
                END;
            12:
                BEGIN
                    Month := 'DEC';
                    Days_Of_Month := 31;
                END;
        END;

        "Outward No." := 'STR/DC/' + Month + '/' + YearValue + '/*';

        DCH.RESET;
        DCH.SETFILTER(DCH."No.", "Outward No.");
        IF DCH.FINDLAST THEN
            "Outward No." := INCSTR(COPYSTR(DCH."No.", 15, 17))
        ELSE
            "Outward No." := '001';
    end;

    var
        CompanyAddr: array[8] of Text[50];
        "Sl No.": Integer;
        Zone: Text[100];
        Station: Text[100];
        Handovered_Person: Text[100];
        User: Record User;
        Location: Record "Dimension Value";
        "Outward No.": Code[250];
        Month: Code[5];
        "Final No.": Integer;
        Start_Date: Date;
        "Final Date": Date;
        Days_Of_Month: Integer;
        "Shipped Date": Text[30];
        "Total No. Of Items": Integer;
        "Ser_No's": Text[1000];
        "Service Address": Text[1000];
        Serv_Add1: Text[80];
        Serv_Add2: Text[80];
        "pOSTED MATERIAL ISSUE HEADER": Record "Posted Material Issues Header";
        "Mode Of Transport": Option Courier,Train,Bus,"By Hand",VRL,Lorry;
        "Hand Overed To": Code[10];
        "Transport Service Name": Text[50];
        "Transport Service Person Name": Text[50];
        "Authorised By": Code[20];
        Purpose: Option AMC,Waranty,Replacement,Maintainence,"R&D Testing",Demo,Installation;
        "Final Outward No.": Integer;
        Item: Record Item;
        "company information": Record "Company Information";
        MIH: Record "Material Issues Header";
        Data_Verification: Boolean;
        Item_Desc: Text[50];
        DC_DATA: Text[1000];
        "DC No.": Code[20];
        "Send To": Code[50];
        Material_Request: array[10] of Code[15];
        Requests_Data: Text[150];
        Requests: array[10] of Text[30];
        "Request_No.": Text[15];
        Request_Count: Integer;
        i: Integer;
        FA1: Code[20];
        FA2: Code[20];
        FA3: Code[20];
        FA4: Code[20];
        "Fixed Asset": Record "Fixed Asset";
        Ac1: Boolean;
        Ac2: Boolean;
        Ac3: Boolean;
        Ac4: Boolean;
        MiscItem1: Text[30];
        MiscItem2: Text[30];
        MiscItem3: Text[30];
        MiscItem4: Text[30];
        MiscItem5: Text[30];
        MiscItem6: Text[30];
        MiscItem7: Text[30];
        MiscItem8: Text[30];
        MiscItem9: Text[30];
        MiscItem10: Text[30];
        MQTY_1: Integer;
        MQTY_2: Integer;
        MQTY_3: Integer;
        MQTY_4: Integer;
        MQTY_5: Integer;
        MQTY_6: Integer;
        MQTY_7: Integer;
        MQTY_8: Integer;
        MQTY_9: Integer;
        MQTY_10: Integer;
        Print: Boolean;
        SM: Record "Service Mgt. Setup";
        p1: Boolean;
        p2: Boolean;
        p3: Boolean;
        Role: Option "Service Engineer","R&D Engineer",Manager,"Project Manager";
        "Dimension Value": Record "Dimension Value";
        Gender: Option "Mr.",Miss;
        PostedMaterialIssuesLine: Record "Posted Material Issues Line";
        DC_HEADER: Record "DC Header";
        DC_LINE: Record "DC Line";
        Text001: Label 'Exit, Remove the Old Record & Insert New One';
        Selection: Integer;
        LINE_NO: Integer;
        Choice: Option Print,PostPrint;
        YearValue: Text[30];
        Type: Text[30];
        Text_Mng: Text[30];
        Mits: Record "Mat.Issue Track. Specification";
        STR: Option "Main STR","RD STR";
        DCH: Record "DC Header";
        Text002: Label 'Exit,Skip this record and Continue';
        Req_person: Text[80];
        Auth_person: Text[80];
        Str_Incharge: Text[80];
        Vendor: Record Vendor;
        EmptyStringCaptionLbl: Label '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -';
        TIN_NO___28350166764CaptionLbl: Label 'TIN NO:  28350166764';
        E__Mail_CaptionLbl: Label 'E- Mail:';
        URL_CaptionLbl: Label 'URL:';
        FAX_CaptionLbl: Label 'FAX:';
        To_Provide_Insight_For_Enhancing_WealthCaptionLbl: Label 'To Provide Insight For Enhancing Wealth';
        Ph_CaptionLbl: Label 'Ph:';
        VijayawadaCaptionLbl: Label 'Vijayawada';
        Place_CaptionLbl: Label 'Place:';
        S_No_CaptionLbl: Label 'S No:';
        Delivery_Challan_FormCaptionLbl: Label 'Delivery Challan Form';
        Date_CaptionLbl: Label 'Date:';
        EmptyStringCaption_Control1102152053Lbl: Label '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -';
        S_NoCaptionLbl: Label 'S.No';
        Item_DescriptionCaptionLbl: Label 'Item Description';
        Serial_NoCaptionLbl: Label 'Serial No';
        QuantityCaptionLbl: Label 'Quantity';
        ReturnableCaptionLbl: Label 'Returnable';
        FAX_Caption_Control1102154025Lbl: Label 'FAX:';
        Ph_Caption_Control1102154027Lbl: Label 'Ph:';
        E__Mail_Caption_Control1102154028Lbl: Label 'E- Mail:';
        To_Provide_Insight_For_Enhancing_WealthCaption_Control1102154030Lbl: Label 'To Provide Insight For Enhancing Wealth';
        URL_Caption_Control1102154031Lbl: Label 'URL:';
        EmptyStringCaption_Control1102154037Lbl: Label '----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------';
        TIN_NO__28350166764CaptionLbl: Label 'TIN NO -28350166764';
        Date_Caption_Control1102152034Lbl: Label 'Date:';
        VijayawadaCaption_Control1102152035Lbl: Label 'Vijayawada';
        Place_Caption_Control1102152039Lbl: Label 'Place:';
        Delivery_Challan_FormCaption_Control1102152048Lbl: Label 'Delivery Challan Form';
        S_No_Caption_Control1102152049Lbl: Label 'S No:';
        attributed_for_Efftronics_systems_Pvt__Ltd_CaptionLbl: Label 'attributed for Efftronics systems Pvt. Ltd.';
        The_above_is_not_for_sale_hence_no_commercial_value_can_be_CaptionLbl: Label '"The above is not for sale hence no commercial value can be "';
        Authorized_ByCaptionLbl: Label 'Authorized By';
        EmptyStringCaption_Control1000000017Lbl: Label '.............................................................................................................................................................................................................................................';
        Items_Requested_ByCaptionLbl: Label 'Items Requested By';
        Store_InchargeCaptionLbl: Label 'Store Incharge';
        ReceptionCaptionLbl: Label 'Reception';
        DATE_Caption_Control1000000003Lbl: Label 'DATE:';
        FOR_OFFICE_USE_ONLYCaptionLbl: Label 'FOR OFFICE USE ONLY';
        This_is_to_certify_that_the_materials_are_dispatched_to___________for_CaptionLbl: Label 'This is to certify that the materials are dispatched to……………………………for.';
        to___Mr______________by__Mode_of_transport__CaptionLbl: Label '" …………………… to   Mr.…………………………………by (Mode of transport)."';
        Bearing_D_C__No________Dt__________Parcel_takenCaptionLbl: Label '….........................Bearing D.C. No ……………… Dt …………………. Parcel taken';
        By________CaptionLbl: Label '" By ………………."';
        Transport_Service_Name______________CaptionLbl: Label 'Transport Service Name             :';
        Transport_Service_Preson_Name__CaptionLbl: Label 'Transport Service Preson Name :';
        Receptionist_CaptionLbl: Label '(Receptionist)';
        SignatureCaptionLbl: Label 'Signature';
        DC_REPORT__GENERATED_FROM_ERP_____CaptionLbl: Label '"                              *** DC REPORT  GENERATED FROM ERP  ***"';
        DCDetailsText: Text[100];
        PrintOption: Option " ",Print;
        PostOption: Option " ",Post_Print;
        UserGvar: Record User;
        "-Rev01-": Integer;
        ShowIntHead1: Boolean;
        ShowIntHead2: Boolean;
        ShowIntHead3: Boolean;
        ShowIntHead4: Boolean;
        ShowIntHead5: Boolean;
        ShowIntHead6: Boolean;
        ShowIntHead7: Boolean;
        ShowIntHead8: Boolean;
        ShowIntHead9: Boolean;
        ShowIntHead10: Boolean;
        ShowIntHead11: Boolean;
        ShowIntHead12: Boolean;
        ShowIntHead13: Boolean;
        ShowIntHead14: Boolean;
        ShowIntHead15: Boolean;
        ReportGroupNo: Integer;
        Item_Data1: Text[1000];
        Item_Data2: Text[1000];
        Item_Data3: Text[1000];
        Item_Data4: Text[1000];
        Item_Data5: Text[1000];
        Item_Data6: Text[1000];
        Item_Data7: Text[1000];
        Item_Data8: Text[1000];
        Item_Data9: Text[1000];
        Item_Data10: Text[1000];
        Item_Data11: Text[1000];
        Item_Data12: Text[1000];
}

