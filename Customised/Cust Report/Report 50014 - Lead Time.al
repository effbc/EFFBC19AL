report 50014 "Lead Time"
{
    //   {IF "Purchase Line"."Expected Receipt Date">0D THEN BEGIN
    //    "Given Lead Time":="Purchase Line"."Expected Receipt Date"-"Purchase Header"."Order Date";
    //   IF"Purchase Header"."Posting Date">0D THEN BEGIN
    //   "Actual Leadt Time":="Purchase Header"."Posting Date"-"Purchase Header"."Order Date"; }
    DefaultLayout = RDLC;
    RDLCLayout = './Lead Time.rdlc';


    dataset
    {
        dataitem("Company Information";"Company Information")
        {
            DataItemTableView = SORTING(Primary Key);
        }
        dataitem("Purch. Rcpt. Header";"Purch. Rcpt. Header")
        {
            DataItemTableView = WHERE(Expected Receipt Date=FILTER(<>''));
            RequestFilterFields = "Posting Date","Order Date";
            column("Filter";Filter)
            {
            }
            column(FORMAT_TODAY_0_4_;FORMAT(TODAY,0,4))
            {
            }
            column(USERID;USERID)
            {
            }
            column(Order_Vs_Material_ReceivedCaption;Order_Vs_Material_ReceivedCaptionLbl)
            {
            }
            column(Actual_Lead_Time_RangeCaption;Actual_Lead_Time_RangeCaptionLbl)
            {
            }
            column(Average_Lead_TimeCaption;Average_Lead_TimeCaptionLbl)
            {
            }
            column(Min_DaysCaption;Min_DaysCaptionLbl)
            {
            }
            column(Max_DaysCaption;Max_DaysCaptionLbl)
            {
            }
            column(Purch__Rcpt__Header_No_;"No.")
            {
            }
            column(Company_Picture;"Company Information".Picture)
            {
            }
            dataitem("Purch. Rcpt. Line";"Purch. Rcpt. Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document No.,Line No.) ORDER(Ascending) WHERE(Quantity=FILTER(>0),No.=FILTER(<>''),Type=CONST(Item));

                trigger OnAfterGetRecord();
                begin
                      IF "Purch. Rcpt. Line"."Expected Receipt Date">0D THEN
                      BEGIN
                         PH.RESET;
                         PH.SETRANGE(PH."No.","Purch. Rcpt. Header"."Order No.");
                         IF PH.FIND('-') THEN
                         BEGIN
                           IF ("Purch. Rcpt. Line"."Expected Receipt Date">0D) AND ("Purch. Rcpt. Header"."Order Date">0D) THEN
                              "Given Lead Time":="Purch. Rcpt. Line"."Expected Receipt Date"-PH."Order Date";
                    
                           IF ("Purch. Rcpt. Header"."Posting Date">0D) AND ( "Purch. Rcpt. Header"."Order Date">0D) THEN
                              "Actual Leadt Time":="Purch. Rcpt. Header"."Posting Date"-PH."Order Date";
                         END;
                        IF ITEM.GET("Purch. Rcpt. Line"."No.") THEN
                        BEGIN
                          LeadTemp:=FORMAT(ITEM."Safety Lead Time");
                          IF (LeadTemp<>'') AND ("Actual Leadt Time" >=0) THEN
                          BEGIN
                            IF STRLEN(FORMAT(LeadTemp))>=3  THEN
                              EVALUATE(STD_Lead_Time,COPYSTR(FORMAT(LeadTemp),1,STRLEN(FORMAT(LeadTemp))-1))
                            ELSE
                              EVALUATE(STD_Lead_Time,COPYSTR(FORMAT(LeadTemp),1,1));
                    
                            CASE STD_Lead_Time  OF
                            1..2:BEGIN
                                   "Lead Time"[1][1]:="Lead Time"[1][1]+("Actual Leadt Time");
                                   "No. Orders"[1]:="No. Orders"[1]+1;
                                   IF "Actual Leadt Time" > "Max Time"[1] THEN
                                   BEGIN
                                     "Max Time"[1]:="Actual Leadt Time";
                                     Item_Inf[1]:="Purch. Rcpt. Line".Description;
                                     vendor_inf[1]:="Purch. Rcpt. Header"."Buy-from Vendor Name";
                                     PH_Inf[1]:=PH."No.";
                                   END;
                                   IF "Actual Leadt Time" < "Min Time"[1] THEN
                                   BEGIN
                                     "Min Time"[1]:="Actual Leadt Time";
                                     Item_Inf_min[1]:="Purch. Rcpt. Line".Description;
                                     vendor_inf_min[1]:="Purch. Rcpt. Header"."Buy-from Vendor Name";
                                     PH_Inf_min[1]:=PH."No.";
                                   END;
                                 END;
                            3..4:BEGIN
                                   "Lead Time"[2][1]:="Lead Time"[2][1]+("Actual Leadt Time");
                                   "No. Orders"[2]:="No. Orders"[2]+1;
                                   IF "Actual Leadt Time" > "Max Time"[2] THEN
                                   BEGIN
                                     "Max Time"[2]:="Actual Leadt Time";
                                     Item_Inf[2]:="Purch. Rcpt. Line".Description;
                                     vendor_inf[2]:="Purch. Rcpt. Header"."Buy-from Vendor Name";
                                     PH_Inf[2]:=PH."No.";
                                   END;
                                   IF "Actual Leadt Time" < "Min Time"[2] THEN
                                   BEGIN
                                     "Min Time"[2]:="Actual Leadt Time";
                                     Item_Inf_min[2]:="Purch. Rcpt. Line".Description;
                                     vendor_inf_min[2]:="Purch. Rcpt. Header"."Buy-from Vendor Name";
                                     PH_Inf_min[2]:=PH."No.";
                                   END;
                    
                                 END;
                            5..7:BEGIN
                                   "Lead Time"[3][1]:="Lead Time"[3][1]+("Actual Leadt Time");
                                   "No. Orders"[3]:="No. Orders"[3]+1;
                                   IF "Actual Leadt Time" > "Max Time"[3] THEN
                                   BEGIN
                                     "Max Time"[3]:="Actual Leadt Time";
                                     Item_Inf[3]:="Purch. Rcpt. Line".Description;
                                     vendor_inf[3]:="Purch. Rcpt. Header"."Buy-from Vendor Name";
                                     PH_Inf[3]:=PH."No.";
                                   END;
                                   IF "Actual Leadt Time" < "Min Time"[3] THEN
                                   BEGIN
                                     "Min Time"[3]:="Actual Leadt Time";
                                     Item_Inf_min[3]:="Purch. Rcpt. Line".Description;
                                     vendor_inf_min[3]:="Purch. Rcpt. Header"."Buy-from Vendor Name";
                                     PH_Inf_min[3]:=PH."No.";
                                   END;
                                 END;
                            8..15:BEGIN
                                   IF "Actual Leadt Time">6000 THEN
                                   MESSAGE("Purch. Rcpt. Header"."Order No."+'-'+FORMAT("Actual Leadt Time"));
                    
                                     "Lead Time"[4][1]:="Lead Time"[4][1]+("Actual Leadt Time");
                                     "No. Orders"[4]:="No. Orders"[4]+1;
                                   IF "Actual Leadt Time" > "Max Time"[4] THEN
                                   BEGIN
                                     "Max Time"[4]:="Actual Leadt Time";
                                     Item_Inf[4]:="Purch. Rcpt. Line".Description;
                                     vendor_inf[4]:="Purch. Rcpt. Header"."Buy-from Vendor Name";
                                     PH_Inf[4]:=PH."No.";
                                   END;
                                   IF "Actual Leadt Time" < "Min Time"[4] THEN
                                   BEGIN
                                     "Min Time"[4]:="Actual Leadt Time";
                                     Item_Inf_min[4]:="Purch. Rcpt. Line".Description;
                                     vendor_inf_min[4]:="Purch. Rcpt. Header"."Buy-from Vendor Name";
                                     PH_Inf_min[4]:=PH."No.";
                                   END;
                    
                    
                                  END;
                            16..21:BEGIN
                                   // MESSAGE("Purch. Rcpt. Header"."Order No.");
                                      "Lead Time"[5][1]:="Lead Time"[5][1]+("Actual Leadt Time");
                                      "No. Orders"[5]:="No. Orders"[5]+1;
                                    IF "Actual Leadt Time" > "Max Time"[5] THEN
                                    BEGIN
                                       "Max Time"[5]:="Actual Leadt Time";
                                     Item_Inf[5]:="Purch. Rcpt. Line".Description;
                                     vendor_inf[5]:="Purch. Rcpt. Header"."Buy-from Vendor Name";
                                     PH_Inf[5]:=PH."No.";
                                    END;
                                    IF "Actual Leadt Time" < "Min Time"[5] THEN
                                    BEGIN
                                      "Min Time"[5]:="Actual Leadt Time";
                                     Item_Inf_min[5]:="Purch. Rcpt. Line".Description;
                                     vendor_inf_min[5]:="Purch. Rcpt. Header"."Buy-from Vendor Name";
                                     PH_Inf_min[5]:=PH."No.";
                                    END;
                    
                                   END;
                            22..30:BEGIN
                                      "Lead Time"[6][1]:="Lead Time"[6][1]+("Actual Leadt Time");
                                      "No. Orders"[6]:="No. Orders"[6]+1;
                                   IF "Actual Leadt Time" > "Max Time"[6] THEN
                                   BEGIN
                                     "Max Time"[6]:="Actual Leadt Time";
                                     Item_Inf[6]:="Purch. Rcpt. Line".Description;
                                     vendor_inf[6]:="Purch. Rcpt. Header"."Buy-from Vendor Name";
                                     PH_Inf[6]:=PH."No.";
                                   END;
                                   IF "Actual Leadt Time" < "Min Time"[6] THEN
                                   BEGIN
                                     "Min Time"[6]:="Actual Leadt Time";
                                     Item_Inf_min[6]:="Purch. Rcpt. Line".Description;
                                     vendor_inf_min[6]:="Purch. Rcpt. Header"."Buy-from Vendor Name";
                                     PH_Inf_min[6]:=PH."No.";
                    
                                    END;
                                   END;
                            31..45:BEGIN
                                     "Lead Time"[7][1]:="Lead Time"[7][1]+("Actual Leadt Time");
                                     "No. Orders"[7]:="No. Orders"[7]+1;
                                   IF "Actual Leadt Time" > "Max Time"[7] THEN
                                   BEGIN
                                     "Max Time"[7]:="Actual Leadt Time";
                                     Item_Inf[7]:="Purch. Rcpt. Line".Description;
                                     vendor_inf[7]:="Purch. Rcpt. Header"."Buy-from Vendor Name";
                                     PH_Inf[7]:=PH."No.";
                                   END;
                                   IF "Actual Leadt Time" < "Min Time"[7] THEN
                                   BEGIN
                                     "Min Time"[7]:="Actual Leadt Time";
                                     Item_Inf_min[7]:="Purch. Rcpt. Line".Description;
                                     vendor_inf_min[7]:="Purch. Rcpt. Header"."Buy-from Vendor Name";
                                     PH_Inf_min[7]:=PH."No.";
                                   END;
                    
                                   END;
                            46..100:BEGIN
                                      "Lead Time"[8][1]:="Lead Time"[8][1]+("Actual Leadt Time");
                                      "No. Orders"[8]:="No. Orders"[8]+1;
                                   IF "Actual Leadt Time" > "Max Time"[8] THEN
                                   BEGIN
                                     "Max Time"[8]:="Actual Leadt Time";
                                     Item_Inf[8]:="Purch. Rcpt. Line".Description;
                                     vendor_inf[8]:="Purch. Rcpt. Header"."Buy-from Vendor Name";
                                     PH_Inf[8]:=PH."No.";
                                   END;
                                   IF "Actual Leadt Time" < "Min Time"[8] THEN
                                   BEGIN
                                     "Min Time"[8]:="Actual Leadt Time";
                                     Item_Inf_min[8]:="Purch. Rcpt. Line".Description;
                                     vendor_inf_min[8]:="Purch. Rcpt. Header"."Buy-from Vendor Name";
                                     PH_Inf_min[8]:=PH."No.";
                                   END;
                    
                                    END;
                    
                          END;
                            IF EXCEL AND ("Actual Leadt Time" > STD_Lead_Time) THEN
                            BEGIN
                              Row+=1;
                              Sheet1.Range('a'+FORMAT(Row)).Value:=FORMAT(PH."No.");
                              Sheet1.Range('b'+FORMAT(Row)).Value:=FORMAT("Purch. Rcpt. Line"."No.");
                              Sheet1.Range('c'+FORMAT(Row)).Value:=FORMAT("Purch. Rcpt. Line".Description);
                              Sheet1.Range('d'+FORMAT(Row)).Value:=FORMAT("Purch. Rcpt. Header"."Buy-from Vendor Name");
                              Sheet1.Range('e'+FORMAT(Row)).Value:=FORMAT(STD_Lead_Time);
                              Sheet1.Range('f'+FORMAT(Row)).Value:=FORMAT("Actual Leadt Time");
                    
                            /*  Entercell(Row,1,FORMAT(PH."No."),FALSE);
                              Entercell(Row,2,FORMAT("Purch. Rcpt. Line".Description),FALSE);
                              Entercell(Row,3,FORMAT("Purch. Rcpt. Header"."Buy-from Vendor Name"),FALSE);
                              Entercell(Row,4,FORMAT(STD_Lead_Time),FALSE);
                              Entercell(Row,5,FORMAT("Actual Leadt Time"),FALSE); */
                           END;
                    
                        END;
                    
                    
                      END;
                    END;

                end;
            }
        }
        dataitem(Currency;Currency)
        {
            DataItemTableView = SORTING(Code);
            column(Avd_Lead_Time__1_;"Avd Lead Time"[1])
            {
            }
            column(Avd_Lead_Time__2_;"Avd Lead Time"[2])
            {
            }
            column(Avd_Lead_Time__3_;"Avd Lead Time"[3])
            {
            }
            column(Avd_Lead_Time__4_;"Avd Lead Time"[4])
            {
            }
            column(Avd_Lead_Time__5_;"Avd Lead Time"[5])
            {
            }
            column(Avd_Lead_Time__6_;"Avd Lead Time"[6])
            {
            }
            column(Avd_Lead_Time__7_;"Avd Lead Time"[7])
            {
            }
            column(Avd_Lead_Time__8_;"Avd Lead Time"[8])
            {
            }
            column(Max_Time__1_;"Max Time"[1])
            {
            }
            column(Max_Time__2_;"Max Time"[2])
            {
            }
            column(Max_Time__3_;"Max Time"[3])
            {
            }
            column(Max_Time__4_;"Max Time"[4])
            {
            }
            column(Max_Time__5_;"Max Time"[5])
            {
            }
            column(Max_Time__6_;"Max Time"[6])
            {
            }
            column(Max_Time__7_;"Max Time"[7])
            {
            }
            column(Max_Time__8_;"Max Time"[8])
            {
            }
            column(Min_Time__1_;"Min Time"[1])
            {
            }
            column(Min_Time__2_;"Min Time"[2])
            {
            }
            column(Min_Time__3_;"Min Time"[3])
            {
            }
            column(Min_Time__4_;"Min Time"[4])
            {
            }
            column(Min_Time__5_;"Min Time"[5])
            {
            }
            column(Min_Time__6_;"Min Time"[6])
            {
            }
            column(Min_Time__7_;"Min Time"[7])
            {
            }
            column(Min_Time__8_;"Min Time"[8])
            {
            }
            column(V15Caption;V15CaptionLbl)
            {
            }
            column(V21Caption;V21CaptionLbl)
            {
            }
            column(V30Caption;V30CaptionLbl)
            {
            }
            column(V7Caption;V7CaptionLbl)
            {
            }
            column(V45Caption;V45CaptionLbl)
            {
            }
            column(V45Caption_Control1000000031;V45Caption_Control1000000031Lbl)
            {
            }
            column(V2Caption;V2CaptionLbl)
            {
            }
            column(V4Caption;V4CaptionLbl)
            {
            }
            column(Currency_Code;Code)
            {
            }

            trigger OnAfterGetRecord();
            begin
                 IF EXCEL THEN
                  BEGIN
                   Excel1.Worksheets.Add;
                   Sheet2:= Excel1.ActiveSheet;
                   Sheet2.Name :='Summary';
                
                    Row+=1;
                    Sheet2.Range('a1').Value:='Actual Lead Time Range';
                    Sheet2.Range('b1').Value:='Avg.Lead time';
                    Sheet2.Range('c1').Value:='Min Days';
                    Sheet2.Range('d1').Value:='Item No';
                    Sheet2.Range('e1').Value:='Vendor No';
                    Sheet2.Range('f1').Value:='Purchase Header No';
                    Sheet2.Range('g1').Value:='Max Days';
                    Sheet2.Range('h1').Value:='Item No';
                    Sheet2.Range('i1').Value:='Vendor No';
                    Sheet2.Range('j1').Value:='Purchase Header No';
                    Sheet2.Range('a2').Value:='2';
                    Sheet2.Range('a3').Value:='4';
                    Sheet2.Range('a4').Value:='7';
                    Sheet2.Range('a5').Value:='15';
                    Sheet2.Range('a6').Value:='21';
                    Sheet2.Range('a7').Value:='30';
                    Sheet2.Range('a8').Value:='45';
                    Sheet2.Range('a9').Value:='>45';
                
                /*    EnterHeadings(1,1,'Actual Lead Time Range',TRUE);
                    EnterHeadings(1,2,'Avg.Lead time',TRUE);
                    EnterHeadings(1,3,'Min Days',TRUE);
                    EnterHeadings(1,4,'Max Days',TRUE);
                    EnterHeadings(1,5,'Item No',TRUE);
                    EnterHeadings(1,6,'Vendor No',TRUE);
                    EnterHeadings(1,7,'Purchase Header No',TRUE);
                    Entercell(2,1,'2',FALSE);
                    Entercell(3,1,'4',FALSE);
                    Entercell(4,1,'7',FALSE);
                    Entercell(5,1,'15',FALSE);
                    Entercell(6,1,'21',FALSE);
                    Entercell(7,1,'30',FALSE);
                    Entercell(8,1,'45',FALSE);
                    Entercell(9,1,'>45',FALSE); */
                  END;
                
                  FOR index:=1 TO 8 DO BEGIN
                  IF "No. Orders"[index]>0 THEN
                  "Avd Lead Time"[index]:="Lead Time"[index][1]/"No. Orders"[index]
                  ELSE
                  "Min Time"[index]:=0;
                
                  IF EXCEL THEN BEGIN
                    Sheet2.Range('b'+FORMAT(index+1)).Value:=FORMAT("Avd Lead Time"[index]);
                    Sheet2.Range('c'+FORMAT(index+1)).Value:=FORMAT("Min Time"[index]);
                    Sheet2.Range('d'+FORMAT(index+1)).Value:=FORMAT(Item_Inf_min[index]);
                    Sheet2.Range('e'+FORMAT(index+1)).Value:=FORMAT(vendor_inf_min[index]);
                    Sheet2.Range('f'+FORMAT(index+1)).Value:=FORMAT(PH_Inf_min[index]);
                    Sheet2.Range('g'+FORMAT(index+1)).Value:=FORMAT("Max Time"[index]);
                    Sheet2.Range('h'+FORMAT(index+1)).Value:=FORMAT(Item_Inf[index]);
                    Sheet2.Range('i'+FORMAT(index+1)).Value:=FORMAT(vendor_inf[index]);
                    Sheet2.Range('j'+FORMAT(index+1)).Value:=FORMAT(PH_Inf[index]);
                
                    /* Entercell(index+1,2,FORMAT("Avd Lead Time"[index]),FALSE);
                     Entercell(index+1,3,FORMAT("Min Time"[index]),FALSE);
                     Entercell(index+1,4,FORMAT("Max Time"[index]),FALSE);
                     Entercell(index+1,5,FORMAT(Item_Inf[index]),FALSE);
                     Entercell(index+1,6,FORMAT(vendor_inf[index]),FALSE);
                     Entercell(index+1,7,FORMAT(PH_Inf[index]),FALSE);
                   */ END;
                  END;

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    field(Excel;EXCEL)
                    {
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

    trigger OnPostReport();
    begin
        Excel1.Visible(TRUE);
        /*
        IF EXCEL THEN
        BEGIN
        TempExcelbuffer.CreateBook('Lead Time');
         TempExcelbuffer.GiveUserControl;
        END;
        */
        IF EXCEL THEN BEGIN
          TempExcelbuffer.CreateBook('Lead Time Status');
          TempExcelbuffer.WriteSheet('Lead Time Status',COMPANYNAME,USERID);
          TempExcelbuffer.CloseBook;
          TempExcelbuffer.OpenExcel;
          TempExcelbuffer.GiveUserControl;
        END;

    end;

    trigger OnPreReport();
    begin
        CREATE(Excel1,FALSE,TRUE);
         IF EXCEL THEN
           BEGIN
             CLEAR(TempExcelbuffer);
             TempExcelbuffer.DELETEALL;
           END;
        Row:=1;
        IF EXCEL THEN
        BEGIN
          Excel1.Workbooks.Add();
          Sheet1:= Excel1.ActiveSheet;
          Sheet1.Name :='Delayed Purchase Orders';
          Sheet1.Range('a1').Value:='Purchase ORDER No';
          Sheet1.Range('b1').Value:='Item No.';
          Sheet1.Range('c1').Value:='Item Description';
          Sheet1.Range('d1').Value:='Vendor';
          Sheet1.Range('e1').Value:='Standard Lead Time';
          Sheet1.Range('f1').Value:='Actual Lead time';

        END;

         Filter:="Purch. Rcpt. Header".GETFILTERS;
         FOR I:= 1 TO 10 DO
           "Min Time"[I]:=1000;
    end;

    var
        "Given Lead Time" : Integer;
        "Actual Leadt Time" : Integer;
        "Lead Time" : array [10,10] of Decimal;
        "No. Orders" : array [10] of Integer;
        "Avd Lead Time" : array [10] of Decimal;
        index : Integer;
        Choice : Option;
        From : Date;
        "To" : Date;
        "Filter" : Text[500];
        PH : Record "Purchase Header";
        PRL : Record "Purch. Rcpt. Line";
        PRH : Record "Purch. Rcpt. Header";
        STD_Lead_Time : Integer;
        LeadTemp : Text[30];
        ITEM : Record Item;
        "Max Time" : array [10] of Decimal;
        "Min Time" : array [10] of Decimal;
        I : Integer;
        Row : Integer;
        TempExcelbuffer : Record "Excel Buffer" temporary;
        EXCEL : Boolean;
        Item_Inf : array [10] of Text[50];
        vendor_inf : array [10] of Text[50];
        PH_Inf : array [10] of Code[20];
        Excel1 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00024500-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Application";
        Range : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Range";
        Sheet : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet1 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Sheet2 : Automation "'{00020813-0000-0000-C000-000000000046}' 1.5:'{00020820-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.5'.Worksheet";
        Item_Inf_min : array [10] of Text[50];
        vendor_inf_min : array [10] of Text[50];
        PH_Inf_min : array [10] of Code[20];
        Order_Vs_Material_ReceivedCaptionLbl : Label 'Order Vs Material Received';
        Actual_Lead_Time_RangeCaptionLbl : Label 'Actual Lead Time Range';
        Average_Lead_TimeCaptionLbl : Label 'Average Lead Time';
        Min_DaysCaptionLbl : Label 'Min Days';
        Max_DaysCaptionLbl : Label 'Max Days';
        V15CaptionLbl : Label '15';
        V21CaptionLbl : Label '21';
        V30CaptionLbl : Label '30';
        V7CaptionLbl : Label '7';
        V45CaptionLbl : Label '45';
        V45Caption_Control1000000031Lbl : Label '>45';
        V2CaptionLbl : Label '2';
        V4CaptionLbl : Label '4';

    [LineStart(387)]
    procedure Entercell(RowNo : Integer;ColumnNo : Integer;CellValue : Text[1000];bold : Boolean);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.",RowNo);
        TempExcelbuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelbuffer."Cell Value as Text" := CellValue;
        TempExcelbuffer.Bold:=bold ;

        TempExcelbuffer.INSERT;
    end;

    [LineStart(396)]
    procedure EnterHeadings(RowNo : Integer;ColumnNo : Integer;CellValue : Text[100];Bold : Boolean);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.",RowNo);
        TempExcelbuffer.VALIDATE("Column No.",ColumnNo);
        TempExcelbuffer."Cell Value as Text" := FORMAT(CellValue);
        TempExcelbuffer.Bold:=Bold ;

        TempExcelbuffer.Formula := '';
        TempExcelbuffer.INSERT;
    end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook");
    //begin
        /*
        */
    //end;

    //event Excel1(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Excel1(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Excel1(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Excel1(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH");
    //begin
        /*
        */
    //end;

    //event Excel1(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH");
    //begin
        /*
        */
    //end;

    //event Excel1(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH");
    //begin
        /*
        */
    //end;

    //event Excel1(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook");
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook");
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook");
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";SaveAsUI : Boolean;var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH");
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook");
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook");
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Wn : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020893-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Window");
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Wn : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020893-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Window");
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Wn : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020893-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Window");
    //begin
        /*
        */
    //end;

    //event Excel1(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Excel1(Sh : Automation ":'{00020400-0000-0000-C000-000000000046}':''.IDISPATCH";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";SyncEventType : Integer);
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Map : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{0002447B-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.XmlMap";Url : Text[1024];IsRefresh : Boolean;var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Map : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{0002447B-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.XmlMap";IsRefresh : Boolean;Result : Integer);
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Map : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{0002447B-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.XmlMap";Url : Text[1024];var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Map : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{0002447B-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.XmlMap";Url : Text[1024];Result : Integer);
    //begin
        /*
        */
    //end;

    //event Excel1(Wb : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020819-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Workbook";Description : Text[1024];Sheet : Text[1024];Success : Boolean);
    //begin
        /*
        */
    //end;

    //event Excel1();
    //begin
        /*
        */
    //end;

    //event Sheet(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet();
    //begin
        /*
        */
    //end;

    //event Sheet();
    //begin
        /*
        */
    //end;

    //event Sheet();
    //begin
        /*
        */
    //end;

    //event Sheet(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet1(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet1(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet1(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet1();
    //begin
        /*
        */
    //end;

    //event Sheet1();
    //begin
        /*
        */
    //end;

    //event Sheet1();
    //begin
        /*
        */
    //end;

    //event Sheet1(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet1(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet1(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;

    //event Sheet2(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet2(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet2(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range";var Cancel : Boolean);
    //begin
        /*
        */
    //end;

    //event Sheet2();
    //begin
        /*
        */
    //end;

    //event Sheet2();
    //begin
        /*
        */
    //end;

    //event Sheet2();
    //begin
        /*
        */
    //end;

    //event Sheet2(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020846-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Range");
    //begin
        /*
        */
    //end;

    //event Sheet2(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00024431-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.Hyperlink");
    //begin
        /*
        */
    //end;

    //event Sheet2(Target : Automation "'{00020813-0000-0000-C000-000000000046}' 1.6:'{00020872-0000-0000-C000-000000000046}':''{00020813-0000-0000-C000-000000000046}' 1.6'.PivotTable");
    //begin
        /*
        */
    //end;
}

