report 50189 FixedAssetsDetails
{
    // version DIM1.0

    // Project : EFFTRONICS
    // *************************************************************************************************************************
    // SIGN Name
    // ************************************************************************************************************************
    // DIM : Resolution of Dimension Issues after Upgarding.
    // ***********************************************************************************************************************
    // Version  sign     Date       USERID    Description
    // *************************************************************************************************************************
    // 1.0      DIM      28-May-13  SAIRAM    New Code has been added for the dimensions updation after upgarding.
    DefaultLayout = RDLC;
    RDLCLayout = './FixedAssetsDetails.rdlc';


    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            RequestFilterFields = "Posting Date";
            column(Item_NoCaption; Item_NoCaptionLbl)
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(Invoiced_DateCaption; Invoiced_DateCaptionLbl)
            {
            }
            column(Dept_Caption; Dept_CaptionLbl)
            {
            }
            column(Stores_Given_EmpNameCaption; Stores_Given_EmpNameCaptionLbl)
            {
            }
            column(Finance_Given_EmpNameCaption; Finance_Given_EmpNameCaptionLbl)
            {
            }
            column(Purchase_Order_No_Caption; Purchase_Order_No_CaptionLbl)
            {
            }
            column(Purch__Inv__Header_No_; "No.")
            {
            }
            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {
                DataItemLink = Document No.=FIELD(No.);
                DataItemTableView = SORTING(Document No., Line No.) ORDER(Ascending);
                RequestFilterFields = Type;
                column(Purch__Inv__Line__No__; "No.")
                {
                }
                column(Purch__Inv__Line_Description; Description)
                {
                }
                column(FORMAT_postingdate_0_4_; FORMAT(postingdate, 0, 4))
                {
                }
                column(DEPT; DEPT)
                {
                }
                column(EMPNAME; EMPNAME)
                {
                }
                column(FARESEMP; FARESEMP)
                {
                }
                column(Purch__Inv__Line__Purch__Inv__Line___Purchase_Order_No__; "Purch. Inv. Line"."Purchase_Order No.")
                {
                }
                column(Purch__Inv__Line__Purch__Inv__Line__Type; "Purch. Inv. Line".Type)
                {
                }
                column(SDD; SDD)
                {
                }
                column(Purch__Inv__Line_Document_No_; "Document No.")
                {
                }
                column(Purch__Inv__Line_Line_No_; "Line No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    DEPT := '';
                    DD := '';
                    EMPID := '';
                    SDD := '';
                    EMPNAME := '';
                    FARESEMP := '';
                    PIH.SETRANGE(PIH."No.", "Purch. Inv. Line"."Document No.");
                    IF PIH.FIND('-') THEN BEGIN
                        postingdate := PIH."Posting Date";
                    END;

                    //DIM1.0 Start
                    //Code Commented
                    /*
                    PDD.SETFILTER(PDD."Line No.",'<>%1',0);
                    PDD.SETRANGE(PDD."Document No.","Purch. Inv. Line"."Document No.");
                    PDD.SETRANGE(PDD."Line No.","Purch. Inv. Line"."Line No.");
                    IF PDD.FIND('-') THEN
                    REPEAT
                    IF PDD."Dimension Code"='DEPARTMENTS' THEN
                    BEGIN
                    DD:=PDD."Dimension Value Code";
                    DV.SETRANGE(DV.Code,DD);
                    IF DV.FIND('-') THEN
                    DEPT:=DV.Name;
                    END;
                    IF PDD."Dimension Code"='EMPLOYEE CODES' THEN
                    BEGIN
                    EMPID:=PDD."Dimension Value Code";
                    USER.SETRANGE(USER."User Security ID",EMPID);
                    IF USER.FIND('-') THEN
                    EMPNAME:=USER."User Name";
                    DEPT:=USER.Dept;
                    END;
                    UNTIL PDD.NEXT=0;
                    */
                    DimSetEntryGRec.RESET;
                    DimSetEntryGRec.SETRANGE("Dimension Set ID", "Purch. Inv. Line"."Dimension Set ID");
                    IF DimSetEntryGRec.FINDSET THEN
                        REPEAT
                            IF DimSetEntryGRec."Dimension Code" = 'DEPARTMENTS' THEN BEGIN
                                DD := DimSetEntryGRec."Dimension Value Code";
                                DEPT := DimSetEntryGRec."Dimension Value Name";
                            END ELSE
                                IF DimSetEntryGRec."Dimension Code" = 'EMPLOYEE CODES' THEN BEGIN
                                    EMPID := DimSetEntryGRec."Dimension Value Code";
                                    USER.RESET;
                                    USER.SETRANGE(USER."User Security ID", EMPID);
                                    IF USER.FIND('-') THEN
                                        EMPNAME := USER."User Name";
                                    DEPT := USER.Dept;
                                END;
                        UNTIL DimSetEntryGRec.NEXT = 0;
                    //DIM1.0 End

                    FA.SETRANGE(FA."No.", "Purch. Inv. Line"."No.");
                    IF FA.FIND('-') THEN BEGIN
                        USER.RESET;
                        USER.SETRANGE(USER."User Security ID", FA."Responsible Employee");
                        IF USER.FIND('-') THEN BEGIN
                            FARESEMP := USER."User Name";
                        END;
                    END;
                    PL.SETRANGE(PL."Document No.", "Purch. Inv. Line"."Purchase_Order No.");
                    PL.SETRANGE(PL."No.", "Purch. Inv. Line"."No.");
                    IF PL.FIND('-') THEN BEGIN
                        //DIM1.0 Start
                        //Code Commented
                        /*
                        DD1.SETRANGE(DD1."Document No.",PL."Document No.");
                        DD1.SETRANGE(DD1."Line No.",PL."Line No.");
                        DD1.SETFILTER(DD1."Document Type",'Order');
                        IF DD1.FIND('-') THEN
                        REPEAT
                        IF DD1."Dimension Code"='DEPARTMENTS' THEN
                        BEGIN
                        DD:=DD1."Dimension Value Code";
                        DV.SETRANGE(DV.Code,DD);
                        IF DV.FIND('-') THEN
                        SDD:=DV.Name;
                        END;
                        UNTIL DD1.NEXT=0;
                        */
                        DimSetEntryGRec.RESET;
                        DimSetEntryGRec.SETRANGE("Dimension Set ID", PL."Dimension Set ID");
                        IF DimSetEntryGRec.FINDSET THEN
                            REPEAT
                                IF DimSetEntryGRec."Dimension Code" = 'DEPARTMENTS' THEN BEGIN
                                    DD := DimSetEntryGRec."Dimension Value Code";
                                    SDD := DimSetEntryGRec."Dimension Value Name";
                                END;
                            UNTIL DimSetEntryGRec.NEXT = 0;
                        //DIM1.0 End
                    END;

                end;
            }

            trigger OnPreDataItem();
            begin
                TempExcelbuffer.DELETEALL;
                CLEAR(TempExcelbuffer);
                Row := 0;
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

    trigger OnPostReport();
    begin
        IF Excel THEN BEGIN
            //TempExcelbuffer.CreateBook('');//B2B
            //TempExcelbuffer.CreateSheet('Rejected Material','',COMPANYNAME,'');//B2B
            TempExcelbuffer.GiveUserControl;
        END;
    end;

    var
        PIH: Record "Purch. Inv. Header";
        postingdate: Date;
        DEPT: Text[30];
        EMPID: Text[10];
        USER: Record User;
        EMPNAME: Text[30];
        TempExcelbuffer: Record "Excel Buffer";
        Row: Integer;
        Excel: Boolean;
        PRECEIPTNO: Text[30];
        FA: Record "Fixed Asset";
        FARESEMP: Text[30];
        DV: Record "Dimension Value";
        DD: Text[10];
        PL: Record "Purchase Line";
        SDD: Text[10];
        Item_NoCaptionLbl: Label 'Item No';
        DescriptionCaptionLbl: Label 'Description';
        Invoiced_DateCaptionLbl: Label 'Invoiced Date';
        Dept_CaptionLbl: Label 'Dept.';
        Stores_Given_EmpNameCaptionLbl: Label 'Stores Given EmpName';
        Finance_Given_EmpNameCaptionLbl: Label 'Finance Given EmpName';
        Purchase_Order_No_CaptionLbl: Label 'Purchase Order No.';
        "-DIM1.0-": Integer;
        DimSetEntryGRec: Record "Dimension Set Entry";

    (8493)]
    procedure Entercell(RowNo: Integer; ColumnNo: Integer; CellValue: Text[1000]; bold: Boolean);
    begin

        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.", RowNo);
        TempExcelbuffer.VALIDATE("Column No.", ColumnNo);
        TempExcelbuffer."Cell Value as Text" := CellValue;
        TempExcelbuffer.Bold := bold;

        TempExcelbuffer.INSERT;
    end;

    (8503)]
    procedure EnterHeadings(RowNo: Integer; ColumnNo: Integer; CellValue: Text[100]; Bold: Boolean);
    begin
        TempExcelbuffer.INIT;
        TempExcelbuffer.VALIDATE("Row No.", RowNo);
        TempExcelbuffer.VALIDATE("Column No.", ColumnNo);
        TempExcelbuffer."Cell Value as Text" := FORMAT(CellValue);
        TempExcelbuffer.Bold := Bold;

        TempExcelbuffer.Formula := '';
        TempExcelbuffer.INSERT;
    end;
}

