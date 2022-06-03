report 50105 "PRODUCTION DETAILS"
{
    DefaultLayout = RDLC;
    RDLCLayout = './PRODUCTION DETAILS.rdlc';

    dataset
    {
        dataitem("Production Order"; "Production Order")
        {
            column(dl; dl)
            {
            }
            column(DL1; DL1)
            {
            }
            column(DL2; DL2)
            {
            }
            column(DL3; DL3)
            {
            }
            column(DL4; DL4)
            {
            }
            column(DL5; DL5)
            {
            }
            column(DL6; DL6)
            {
            }
            column(RTU1; RTU1)
            {
            }
            column(RTU2; RTU2)
            {
            }
            column(RTU3; RTU3)
            {
            }
            column(RTU4; RTU4)
            {
            }
            column(RTU5; RTU5)
            {
            }
            column(RTU6; RTU6)
            {
            }
            column(RTU7; RTU7)
            {
            }
            column(BMU1; BMU1)
            {
            }
            column(BMU2; BMU2)
            {
            }
            column(BMU3; BMU3)
            {
            }
            column(BMU4; BMU4)
            {
            }
            column(BMU5; BMU5)
            {
            }
            column(BMU6; BMU6)
            {
            }
            column(BMU7; BMU7)
            {
            }
            column(PMU1; PMU1)
            {
            }
            column(PMU2; PMU2)
            {
            }
            column(PMU3; PMU3)
            {
            }
            column(PMU4; PMU4)
            {
            }
            column(PMU5; PMU5)
            {
            }
            column(PMU6; PMU6)
            {
            }
            column(PMU7; PMU7)
            {
            }
            column(DB1; DB1)
            {
            }
            column(DB2; DB2)
            {
            }
            column(DB3; DB3)
            {
            }
            column(DB4; DB4)
            {
            }
            column(DB5; DB5)
            {
            }
            column(DB6; DB6)
            {
            }
            column(DB7; DB7)
            {
            }
            column(DATALOGERSCaption; DATALOGERSCaptionLbl)
            {
            }
            column(RTUCaption; RTUCaptionLbl)
            {
            }
            column(FEPCaption; FEPCaptionLbl)
            {
            }
            column(PMUCaption; PMUCaptionLbl)
            {
            }
            column(DISP_BRDCaption; DISP_BRDCaptionLbl)
            {
            }
            column(ORD_PENDINGCaption; ORD_PENDINGCaptionLbl)
            {
            }
            column(DISPATCHEDCaption; DISPATCHEDCaptionLbl)
            {
            }
            column(INPROGRESSCaption; INPROGRESSCaptionLbl)
            {
            }
            column(READY_TO_DISPCaption; READY_TO_DISPCaptionLbl)
            {
            }
            column(READY_TO_RDSOCaption; READY_TO_RDSOCaptionLbl)
            {
            }
            column(RDSO_INSPECTEDCaption; RDSO_INSPECTEDCaptionLbl)
            {
            }
            column(YET_TO_STARTCaption; YET_TO_STARTCaptionLbl)
            {
            }
            column(Production_Order_Status; Status)
            {
            }
            column(Production_Order_No_; "No.")
            {
            }
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
        dl: Integer;
        bmu: Integer;
        dlr: Integer;
        DL1: Integer;
        DL2: Integer;
        DL3: Integer;
        DL4: Integer;
        DL5: Integer;
        DL6: Integer;
        fep1: Integer;
        fep2: Integer;
        fep3: Integer;
        fep4: Integer;
        fep5: Integer;
        fep6: Integer;
        fep7: Integer;
        RTU1: Integer;
        RTU2: Integer;
        RTU3: Integer;
        RTU4: Integer;
        RTU5: Integer;
        RTU6: Integer;
        RTU7: Integer;
        BMU1: Integer;
        BMU2: Integer;
        BMU3: Integer;
        BMU4: Integer;
        BMU5: Integer;
        BMU6: Integer;
        BMU7: Integer;
        PMU1: Integer;
        PMU2: Integer;
        PMU3: Integer;
        PMU4: Integer;
        PMU5: Integer;
        PMU6: Integer;
        PMU7: Integer;
        DB1: Integer;
        DB2: Integer;
        DB3: Integer;
        DB4: Integer;
        DB5: Integer;
        DB6: Integer;
        DB7: Integer;
        TLC1: Integer;
        TLC2: Integer;
        TLC3: Integer;
        TLC4: Integer;
        TLC5: Integer;
        TLC6: Integer;
        TLC7: Integer;
        DATALOGERSCaptionLbl: Label 'DATALOGERS';
        RTUCaptionLbl: Label 'RTU';
        FEPCaptionLbl: Label 'FEP';
        PMUCaptionLbl: Label 'PMU';
        DISP_BRDCaptionLbl: Label 'DISP.BRD';
        ORD_PENDINGCaptionLbl: Label 'ORD.PENDING';
        DISPATCHEDCaptionLbl: Label 'DISPATCHED';
        INPROGRESSCaptionLbl: Label 'INPROGRESS';
        READY_TO_DISPCaptionLbl: Label 'READY TO DISP';
        READY_TO_RDSOCaptionLbl: Label 'READY TO RDSO';
        RDSO_INSPECTEDCaptionLbl: Label 'RDSO INSPECTED';
        YET_TO_STARTCaptionLbl: Label 'YET TO START';
}

