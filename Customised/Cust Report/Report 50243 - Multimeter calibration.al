report 50243 "Multimeter calibration"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Multimeter calibration.rdlc';

    dataset
    {
        dataitem(MTS; "Multimeter Tracking System")
        {
            DataItemTableView = SORTING(Next Calibration Date, Serial No.) ORDER(Ascending) WHERE(Next Calibration Date=FILTER(<>''));
            column(MTS__Serial_No__;"Serial No.")
            {
            }
            column(MTS__Next_Calibration_Date_;"Next Calibration Date")
            {
            }
            column(Location;Location)
            {
            }
            column(Name;Name)
            {
            }
            column(MTS__Responsible_Person_;"Responsible Person")
            {
            }
            column(Days_Remaining_;"Days Remaining")
            {
            }
            column(To_be_Calibrated_MultimetersCaption;To_be_Calibrated_MultimetersCaptionLbl)
            {
            }
            column(MTS__Serial_No__Caption;FIELDCAPTION("Serial No."))
            {
            }
            column(Calibration_DateCaption;Calibration_DateCaptionLbl)
            {
            }
            column(LocationCaption;LocationCaptionLbl)
            {
            }
            column(NameCaption;NameCaptionLbl)
            {
            }
            column(MTS__Responsible_Person_Caption;FIELDCAPTION("Responsible Person"))
            {
            }
            column(Due_DaysCaption;Due_DaysCaptionLbl)
            {
            }
            column(MTS_Multimeter_No;"Multimeter No")
            {
            }
            column(MTS_Lot_No_;"Lot No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF  MTS."Responsible Person" <>'' THEN
                BEGIN
                  USER.RESET;
                  USER.SETFILTER(USER."User Security ID",MTS."Responsible Person");
                  IF USER.FINDFIRST THEN
                    Name:=USER."User Name";
                END
                ELSE
                  Name:='';

                IF MTS."Global Dimension 2 Code" <>'' THEN
                BEGIN
                  DV.RESET;
                  DV.SETFILTER(DV.Code,MTS."Global Dimension 2 Code");
                  IF DV.FINDFIRST THEN
                    Location:=DV.Name
                END
                ELSE
                  Location:='';
                //IF MTS."Next Calibration Date" >= Today THEN
                  "Days Remaining":= MTS."Next Calibration Date"-TODAY;
                //ELSE
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
        USER : Record User;
        DV : Record "Dimension Value";
        Name : Text[50];
        Location : Text[30];
        "Days Remaining" : Decimal;
        To_be_Calibrated_MultimetersCaptionLbl : Label 'To be Calibrated Multimeters';
        Calibration_DateCaptionLbl : Label 'Calibration Date';
        LocationCaptionLbl : Label 'Location';
        NameCaptionLbl : Label 'Name';
        Due_DaysCaptionLbl : Label 'Due Days';
}

