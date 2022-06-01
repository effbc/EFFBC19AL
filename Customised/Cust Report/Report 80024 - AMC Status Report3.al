report 80024 "AMC Status Report3"
{
    // version NAVW17.00

    DefaultLayout = RDLC;
    RDLCLayout = './AMC Status Report3.rdlc';
    Caption = 'Contr. Gain/Loss - Resp. Ctr.';

    dataset
    {
        dataitem("Service Contract Header"; "Service Contract Header")
        {
            RequestFilterFields = "Contract No.";
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            column(USERID; USERID)
            {
            }
            column(Service_Contract_Header__Contract_No__; "Contract No.")
            {
            }
            column(AMCCaption; AMCCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Service_Contract_Header__Contract_No__Caption; FIELDCAPTION("Contract No."))
            {
            }
            column(Service_Contract_Header_Contract_Type; "Contract Type")
            {
            }
            dataitem("Res. Ledger Entry"; "Res. Ledger Entry")
            {
                column(Res__Ledger_Entry__Posting_Date_; "Posting Date")
                {
                }
                column(ResourceName; ResourceName)
                {
                }
                column(Res__Ledger_Entry_Status; Status)
                {
                }
                column(Res__Ledger_Entry_Quantity; Quantity)
                {
                }
                column(ZONE_DESC; ZONE_DESC)
                {
                }
                column(DIVISION__DESC_; "DIVISION_ DESC")
                {
                }
                column(STATION_DESC; STATION_DESC)
                {
                }
                column(S_no_; "S.no")
                {
                }
                column(Resource_NameCaption; Resource_NameCaptionLbl)
                {
                }
                column(Res__Ledger_Entry__Posting_Date_Caption; FIELDCAPTION("Posting Date"))
                {
                }
                column(Control1000000009Caption; Control1000000009CaptionLbl)
                {
                }
                column(Res__Ledger_Entry_StatusCaption; FIELDCAPTION(Status))
                {
                }
                column(Spent_Hr_sCaption; Spent_Hr_sCaptionLbl)
                {
                }
                column(ZonesCaption; ZonesCaptionLbl)
                {
                }
                column(DivisionCaption; DivisionCaptionLbl)
                {
                }
                column(StationCaption; StationCaptionLbl)
                {
                }
                column(Visit_No_Caption; Visit_No_CaptionLbl)
                {
                }
                column(Res__Ledger_Entry_Entry_No_; "Entry No.")
                {
                }
            }

            trigger OnAfterGetRecord();
            begin
                "S.no" := 0;
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
        Text000: Label 'Grand Total:';
        ZONE1: Record Zones;
        DIVISION1: Record Division;
        STATION1: Record Station;
        ZONE_DESC: Text[30];
        "DIVISION_ DESC": Text[30];
        STATION_DESC: Text[30];
        "S.no": Integer;
        Resource: Record Resource;
        ResourceName: Text[30];
        AMCCaptionLbl: Label 'AMC';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Resource_NameCaptionLbl: Label 'Resource Name';
        Control1000000009CaptionLbl: Label 'Label1000000009';
        Spent_Hr_sCaptionLbl: Label 'Spent Hr''s';
        ZonesCaptionLbl: Label 'Zones';
        DivisionCaptionLbl: Label 'Division';
        StationCaptionLbl: Label 'Station';
        Visit_No_CaptionLbl: Label 'Visit No.';
}

