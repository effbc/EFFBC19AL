report 50089 "Cylce Time"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Cylce Time.rdlc';

    dataset
    {
        dataitem("Service Header"; "Service Header")
        {
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(Service_Header__Document_Type_; "Document Type")
            {
            }
            column(Service_Header__Bill_to_City_; "Bill-to City")
            {
            }
            column(Service_Header__Your_Reference_; "Your Reference")
            {
            }
            column(Service_Header__Customer_Posting_Group_; "Customer Posting Group")
            {
            }
            column(Service_Header__Shortcut_Dimension_1_Code_; "Shortcut Dimension 1 Code")
            {
            }
            column(Total_Service_Order_Cycle_TimeCaption; Total_Service_Order_Cycle_TimeCaptionLbl)
            {
            }
            column(Service_Item_Line__Response_Date_Caption; "Service Item Line".FIELDCAPTION("Response Date"))
            {
            }
            column(Service_Item_Line__Response_Time__Hours__Caption; "Service Item Line".FIELDCAPTION("Response Time (Hours)"))
            {
            }
            column(Service_Item_Line__Fault_Code_Caption; "Service Item Line".FIELDCAPTION("Fault Code"))
            {
            }
            column(Service_Item_Line_DescriptionCaption; "Service Item Line".FIELDCAPTION(Description))
            {
            }
            column(Service_Item_Line__Serial_No__Caption; "Service Item Line".FIELDCAPTION("Serial No."))
            {
            }
            column(Service_Item_Line__Service_Item_No__Caption; "Service Item Line".FIELDCAPTION("Service Item No."))
            {
            }
            column(Service_Item_Line__Item_No__Caption; "Service Item Line".FIELDCAPTION("Item No."))
            {
            }
            column(Service_Order_No_Caption; Service_Order_No_CaptionLbl)
            {
            }
            column(Cust_Name______________Caption; Cust_Name______________CaptionLbl)
            {
            }
            column(Address_____________Caption; Address_____________CaptionLbl)
            {
            }
            column(Service_Header__Customer_Posting_Group_Caption; FIELDCAPTION("Customer Posting Group"))
            {
            }
            column(Service_Header__Shortcut_Dimension_1_Code_Caption; FIELDCAPTION("Shortcut Dimension 1 Code"))
            {
            }
            column(Service_Header_No_; "No.")
            {
            }
            dataitem("Service Item Line"; "Service Item Line")
            {
                DataItemLink = Document No.=FIELD(Document Type);
                column(Service_Item_Line__Item_No__; "Item No.")
                {
                }
                column(Service_Item_Line__Service_Item_No__; "Service Item No.")
                {
                }
                column(Service_Item_Line__Serial_No__; "Serial No.")
                {
                }
                column(Service_Item_Line_Description; Description)
                {
                }
                column(Service_Item_Line__Fault_Code_; "Fault Code")
                {
                }
                column(Service_Item_Line__Response_Time__Hours__; "Response Time (Hours)")
                {
                }
                column(Service_Item_Line__Response_Date_; "Response Date")
                {
                }
                column(FORMAT__tims_diff__0_0_; FORMAT("tims diff", 0, 0))
                {
                }
                column(dates_diff_; "dates diff")
                {
                }
                column(hrsCaption; hrsCaptionLbl)
                {
                }
                column(minCaption; minCaptionLbl)
                {
                }
                column(Service_Item_Line_Document_Type; "Document Type")
                {
                }
                column(Service_Item_Line_Document_No_; "Document No.")
                {
                }
                column(Service_Item_Line_Line_No_; "Line No.")
                {
                }
            }

            trigger OnPreDataItem();
            begin
                Companyinfo.GET();
                IF Companyinfo.FIND('-') THEN
                    Companyinfo.CALCFIELDS(Companyinfo.Picture);
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
        stdt: Date;
        enddt: Date;
        flag: Boolean;
        Companyinfo: Record "Company Information";
        linestartdt: Date;
        linefinsheddt: Date;
        datetimecon: Variant;
        "dates diff": Integer;
        "tims diff": Decimal;
        total: Decimal;
        "linestart time": Time;
        "lineend time": Time;
        "tims diff1": Decimal;
        text1: Text[30];
        Total_Service_Order_Cycle_TimeCaptionLbl: Label 'Total Service Order Cycle Time';
        Service_Order_No_CaptionLbl: Label 'Service Order No:';
        Cust_Name______________CaptionLbl: Label 'Cust Name             :';
        Address_____________CaptionLbl: Label 'Address            :';
        hrsCaptionLbl: Label 'hrs';
        minCaptionLbl: Label 'min';
}

