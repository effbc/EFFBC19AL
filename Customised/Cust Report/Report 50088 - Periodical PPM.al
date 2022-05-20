report 50088 "Periodical PPM"
{
    // version Nirmala

    DefaultLayout = RDLC;
    RDLCLayout = './Periodical PPM.rdlc';

    dataset
    {
        dataitem("Posted Inspect DatasheetHeader";"Posted Inspect DatasheetHeader")
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending);
            column(FORMAT_TODAY_0_4_;FORMAT(TODAY,0,4))
            {
            }
            column(companyid_Name;companyid.Name)
            {
            }
            column(startdate_2_;startdate[2])
            {
            }
            column(startdate_3__1;startdate[3]-1)
            {
            }
            column(startdate_3_;startdate[3])
            {
            }
            column(startdate_4__1;startdate[4]-1)
            {
            }
            column(startdate_4_;startdate[4])
            {
            }
            column(startdate_5__1;startdate[5]-1)
            {
            }
            column(startdate_5_;startdate[5])
            {
            }
            column(startdate_6__1;startdate[6]-1)
            {
            }
            column(cntfinalarray_1_;cntfinalarray[1])
            {
            }
            column(cntfinalarray_2_;cntfinalarray[2])
            {
            }
            column(cntfinalarray_3_;cntfinalarray[3])
            {
            }
            column(cntfinalarray_4_;cntfinalarray[4])
            {
            }
            column(countarray2_1_;countarray2[1])
            {
            }
            column(countarray2_2_;countarray2[2])
            {
            }
            column(countarray2_3_;countarray2[3])
            {
            }
            column(countarray2_4_;countarray2[4])
            {
            }
            column(cntsum;cntsum)
            {
            }
            column(cnt1sum;cnt1sum)
            {
            }
            column(cnt2sum;cnt2sum)
            {
            }
            column(cnt3sum;cnt3sum)
            {
            }
            column(prebal_2_;prebal[2])
            {
            }
            column(prebal_3_;prebal[3])
            {
            }
            column(prebal_4_;prebal[4])
            {
            }
            column(prebal_1_;prebal[1])
            {
            }
            column(cntrejs_1_;cntrejs[1])
            {
            }
            column(cntrejs_2_;cntrejs[2])
            {
            }
            column(cntrejs_3_;cntrejs[3])
            {
            }
            column(cntrejs_4_;cntrejs[4])
            {
            }
            column(Status_of_Material__InwardsCaption;Status_of_Material__InwardsCaptionLbl)
            {
            }
            column(Previous_BalanceCaption;Previous_BalanceCaptionLbl)
            {
            }
            column(Today_InwardsCaption;Today_InwardsCaptionLbl)
            {
            }
            column(Tested_InwardsCaption;Tested_InwardsCaptionLbl)
            {
            }
            column(BalanceInwardsCaption;BalanceInwardsCaptionLbl)
            {
            }
            column(No__of_NCs_RejectionsCaption;No__of_NCs_RejectionsCaptionLbl)
            {
            }
            column(Posted_Inspect_DatasheetHeader_No_;"No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                "Inspection Receipt Header".SETFILTER("Inspection Receipt Header"."Source Type",'In Bound');
                "Inspection Receipt Header".SETFILTER("Inspection Receipt Header".Status,'No');
                 FOR i:=2 TO "Inspection Receipt Header".COUNT DO
                 BEGIN
                  IF "Inspection Receipt Header"."Posting Date" <= (startdate[2]-1) THEN
                 cnt4rec := cnt4rec +1;
                  IF ("Inspection Receipt Header"."Posting Date" <= startdate[2]) THEN
                  cntrec := cntrec+1;
                  IF ("Inspection Receipt Header"."Posting Date" <= startdate[3]) THEN
                 cnt1rec := cnt1rec +1;
                  IF ("Inspection Receipt Header"."Posting Date" <= startdate[4]) THEN
                  cnt2rec := cnt2rec+1;
                  IF ("Inspection Receipt Header"."Posting Date" <= startdate[5]) THEN
                 cnt3rec := cnt3rec+1;
                  "Inspection Receipt Header".NEXT;
                END;

                "Inspection Datasheet Header".SETFILTER("Inspection Datasheet Header"."Source Type",'In Bound');
                "Inspection Datasheet Header".SETFILTER("Inspection Datasheet Header".Status,'Open');
                 FOR i := 2 TO  "Inspection Datasheet Header".COUNT  DO
                 BEGIN
                   IF ("Inspection Datasheet Header"."Posting Date" <= (startdate[2] -1)) THEN
                   cnt4 := cnt4 +1;
                   IF "Inspection Datasheet Header"."Posting Date" <= startdate[2] THEN
                    cnt := cnt+1;
                   IF "Inspection Datasheet Header"."Posting Date" <= startdate[3] THEN
                   cnt1 := cnt1+1;
                   IF "Inspection Datasheet Header"."Posting Date" <= startdate[4] THEN
                   cnt2 := cnt2+1;
                  IF "Inspection Datasheet Header"."Posting Date" <= startdate[5] THEN
                   cnt3 := cnt3+1;
                  "Inspection Datasheet Header".NEXT;
                 END;

                cntsum := cnt + cntrec;
                cnt1sum := cnt1 +cnt1rec;
                cnt2sum := cnt2 +cnt2rec;
                cnt3sum := cnt3 +cnt3rec;
                cnt4sum := cnt4 +cnt4rec;



                 FOR i := 2 TO 5 DO
                 BEGIN
                 "Posted Inspect DatasheetHeader".SETFILTER("Posted Inspect DatasheetHeader"."Source Type",'In Bound');
                  SETRANGE("Posted Inspect DatasheetHeader"."Posting Date",startdate[i],startdate[i+1] - 1);
                       BEGIN
                         itemcount := "Posted Inspect DatasheetHeader".COUNT;
                       END;
                      countarray[i-1] := itemcount;
                   END;

                 FOR i := 2 TO 5 DO
                 BEGIN
                  "Inspection Datasheet Header".SETFILTER("Inspection Datasheet Header"."Source Type",'In Bound');
                  "Inspection Datasheet Header".SETRANGE("Inspection Datasheet Header"."Posting Date",startdate[i],startdate[i+1] -1);
                  BEGIN
                     itemcount1 := "Inspection Datasheet Header".COUNT;
                  END;
                   countarray1[i-1] := itemcount1;
                 END;
                 "Inspection Receipt Header".SETFILTER("Inspection Receipt Header".Status,'Yes');
                  FOR i :=2 TO 5 DO
                   BEGIN
                   "Inspection Receipt Header".SETFILTER("Inspection Receipt Header"."Source Type",'In Bound');
                   "Inspection Receipt Header".SETRANGE("Inspection Receipt Header"."Posting Date",startdate[i],startdate[i+1] - 1);
                   BEGIN
                     itemcount1 := "Inspection Receipt Header".COUNT;
                   END;
                    countarray2[i-1] := itemcount1;
                  END;

                 FOR i :=2 TO 5 DO
                  cntfinalarray[i-1] := countarray [i-1] + countarray1[i-1];

                 FOR i := 2 TO 5 DO
                 prebal[i-1] := (cntsum + countarray2[i-1])- cntfinalarray[i-1];

                 "Inspection Receipt Header".SETFILTER("Inspection Receipt Header"."Source Type",'In Bound');
                 "Inspection Receipt Header".SETFILTER("Inspection Receipt Header".Status,'Yes');
                 "Inspection Receipt Header".SETFILTER("Inspection Receipt Header"."Qty. Rejected",'<>0');
                  FOR i:=2 TO 5 DO
                  BEGIN
                    "Inspection Receipt Header".SETRANGE("Inspection Receipt Header"."Posting Date",startdate[i],startdate[i+1]-1);
                     BEGIN
                      itemcount1 := "Inspection Receipt Header".COUNT;
                     END;
                  cntrejs[i-1] := itemcount1;
                 END;
            end;

            trigger OnPreDataItem();
            begin
                  cnt :=0;
                  cnt1 :=0;
                  cnt2:=0;
                  cnt3:=0;
                  cnt4:=0;
                  cntrec :=0;
                  cnt1rec:=0;
                  cnt2rec:=0;
                  cnt3rec:=0;
                  cnt4rec:=0;
                  cntsum:=0;
                  cnt1sum:=0;
                  cnt2sum:=0;
                  cnt3sum:=0;
                  cnt4sum:=0;
            end;
        }
        dataitem("Inspection Datasheet Header";"Inspection Datasheet Header")
        {
            DataItemTableView = SORTING(No.) ORDER(Ascending);
        }
        dataitem("Inspection Receipt Header";"Inspection Receipt Header")
        {
            RequestFilterFields = '';
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

    trigger OnPreReport();
    begin
        //IrFilter := "Inspection Receipt Header".GETFILTERS;
        FOR i := 2 TO 5 DO
          startdate[i+1] := CALCDATE(periodlength,startdate[i]);
          startdate[7] := 12319999D;
    end;

    var
        companyid : Record "Company Information";
        startdate : array [7] of Date;
        periodlength : DateFormula;
        IrFilter : Text[250];
        i : Integer;
        itemcount : Integer;
        itemcount1 : Integer;
        countarray : array [5] of Decimal;
        countarray1 : array [5] of Decimal;
        countarray2 : array [5] of Decimal;
        countprebal : array [5] of Decimal;
        cntfinalarray : array [5] of Decimal;
        cnt : Integer;
        cnt1 : Integer;
        cnt2 : Integer;
        cnt3 : Integer;
        cnt4 : Integer;
        cntrec : Integer;
        cnt1rec : Integer;
        cnt2rec : Integer;
        cnt3rec : Integer;
        cnt4rec : Integer;
        cntsum : Integer;
        cnt1sum : Integer;
        cnt2sum : Integer;
        cnt3sum : Integer;
        cnt4sum : Integer;
        prebal : array [5] of Decimal;
        cntrejs : array [5] of Decimal;
        Status_of_Material__InwardsCaptionLbl : Label 'Status of Material  Inwards';
        Previous_BalanceCaptionLbl : Label 'Previous Balance';
        Today_InwardsCaptionLbl : Label 'Today Inwards';
        Tested_InwardsCaptionLbl : Label 'Tested Inwards';
        BalanceInwardsCaptionLbl : Label 'BalanceInwards';
        No__of_NCs_RejectionsCaptionLbl : Label 'No. of NCs/Rejections';
}

