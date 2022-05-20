report 99000760 "Machine Center List"
{
    // version NAVW19.00.00.45778,ESPL 1.0

    DefaultLayout = RDLC;
    RDLCLayout = './Machine Center List.rdlc';
    CaptionML = ENU='Machine Center List',
                ENN='Machine Center List';

    dataset
    {
        dataitem("Machine Center";"Machine Center")
        {
            DataItemTableView = SORTING(No.);
            RequestFilterFields = "No.","Work Center No.";
            column(FORMAT_TODAY_0_4_;FORMAT(TODAY,0,4))
            {
            }
            column(COMPANYNAME;COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO;CurrReport.PAGENO)
            {
            }
            column(Machine_Center__TABLECAPTION_________MachineCenterFilter;TABLECAPTION + ':' + MachineCenterFilter)
            {
            }
            column(MachineCenterFilter;MachineCenterFilter)
            {
            }
            column(Machine_Center__No__;"No.")
            {
            }
            column(Machine_Center_Name;Name)
            {
            }
            column(Machine_Center__Work_Center_No__;"Work Center No.")
            {
            }
            column(Machine_Center_Capacity;Capacity)
            {
            }
            column(Machine_Center_Efficiency;Efficiency)
            {
            }
            column(sno;sno)
            {
            }
            column(Machine_Center_ListCaption;Machine_Center_ListCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Machine_Center__No__Caption;FIELDCAPTION("No."))
            {
            }
            column(Machine_Center_NameCaption;FIELDCAPTION(Name))
            {
            }
            column(Machine_Center__Work_Center_No__Caption;FIELDCAPTION("Work Center No."))
            {
            }
            column(Machine_Center_CapacityCaption;FIELDCAPTION(Capacity))
            {
            }
            column(Machine_Center_EfficiencyCaption;FIELDCAPTION(Efficiency))
            {
            }

            trigger OnPreDataItem();
            begin
                MachineCenterFilter := GETFILTERS;
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
        MachineCenterFilter : Text;
        sno : Integer;
        Machine_Center_ListCaptionLbl : TextConst ENU='Machine Center List',ENN='Machine Center List';
        CurrReport_PAGENOCaptionLbl : TextConst ENU='Page',ENN='Page';
}

