report 50090 "Post Inventory Cost to G/L1"
{
    // version NAVW13.70

    DefaultLayout = RDLC;
    RDLCLayout = './Post Inventory Cost to GL1.rdlc';
    Caption = 'Post Inventory Cost to G/L';
    Permissions = TableData "Item Ledger Entry" = r,
                  TableData "Invt. Posting Buffer" = r,
                  TableData "Prod. Order Line" = r,
                  TableData "Value Entry" = rm,
                  TableData "Capacity Ledger Entry" = rm;

    dataset
    {
        dataitem("Integer"; "Integer")
        {
            DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
            PrintOnlyIfDetail = true;
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(STRSUBSTNO_Text002_SELECTSTR_PostMethod___1_Text012__; STRSUBSTNO(Text002, SELECTSTR(PostMethod + 1, Text012)))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(USERID; USERID)
            {
            }
            column(PostDate; PostDate)
            {
            }
            column(DocNo; DocNo)
            {
            }
            column(ItemValueEntry_TABLECAPTION__________ValueEntryFilter; ItemValueEntry.TABLECAPTION + ': ' + ValueEntryFilter)
            {
            }
            column(TotalCOGSAmt; TotalCOGSAmt)
            {
                AutoFormatType = 1;
            }
            column(TotalInvtAdjmtAmt; TotalInvtAdjmtAmt)
            {
                AutoFormatType = 1;
            }
            column(TotalDirCostAmt; TotalDirCostAmt)
            {
                AutoFormatType = 1;
            }
            column(TotalOvhdCostAmt; TotalOvhdCostAmt)
            {
                AutoFormatType = 1;
            }
            column(TotalWIPInvtAmt; TotalWIPInvtAmt)
            {
                AutoFormatType = 1;
            }
            column(TotalInvtAmt; TotalInvtAmt)
            {
                AutoFormatType = 1;
            }
            column(Post_Inventory_Cost_to_G_LCaption; Post_Inventory_Cost_to_G_LCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Test_Report__not_posted_Caption; Test_Report__not_posted_CaptionLbl)
            {
            }
            column(PostDateCaption; PostDateCaptionLbl)
            {
            }
            column(DocNoCaption; DocNoCaptionLbl)
            {
            }
            column(ItemValueEntry__Entry_No__Caption; ItemValueEntry.FIELDCAPTION("Entry No."))
            {
            }
            column(ItemValueEntry__Item_Ledger_Entry_Type_Caption; ItemValueEntry.FIELDCAPTION("Item Ledger Entry Type"))
            {
            }
            column(ItemValueEntry__Document_No__Caption; ItemValueEntry.FIELDCAPTION("Document No."))
            {
            }
            column(ItemValueEntry__Source_No__Caption; ItemValueEntry.FIELDCAPTION("Source No."))
            {
            }
            column(ItemValueEntry__Inventory_Posting_Group_Caption; ItemValueEntry__Inventory_Posting_Group_CaptionLbl)
            {
            }
            column(ItemValueEntry__Posting_Date_Caption; ItemValueEntry.FIELDCAPTION("Posting Date"))
            {
            }
            column(COGSAmtCaption; COGSAmtCaptionLbl)
            {
            }
            column(InvtAdjmtAmtCaption; InvtAdjmtAmtCaptionLbl)
            {
            }
            column(DirCostAmtCaption; DirCostAmtCaptionLbl)
            {
            }
            column(OvhdCostAmtCaption; OvhdCostAmtCaptionLbl)
            {
            }
            column(WIPInvtAmtCaption; WIPInvtAmtCaptionLbl)
            {
            }
            column(InvtAmtCaption; InvtAmtCaptionLbl)
            {
            }
            column(ItemValueEntry__Expected_Cost_Caption; ItemValueEntry.FIELDCAPTION("Expected Cost"))
            {
            }
            column(Inventory_Cost_Posted_to_G_LCaption; Inventory_Cost_Posted_to_G_LCaptionLbl)
            {
            }
            column(Integer_Number; Number)
            {
            }
            dataitem(ItemValueEntry; "Value Entry")
            {
                DataItemTableView = SORTING(Item No.);
                RequestFilterFields = "Posting Date";
                column(Item_Description; Item.Description)
                {
                }
                column(ItemValueEntry__Item_No__; "Item No.")
                {
                }
                column(ItemValueEntry__Posting_Date_; "Posting Date")
                {
                }
                column(ItemValueEntry__Inventory_Posting_Group_; "Inventory Posting Group")
                {
                }
                column(ItemValueEntry__Document_No__; "Document No.")
                {
                }
                column(ItemValueEntry__Item_Ledger_Entry_Type_; "Item Ledger Entry Type")
                {
                }
                column(ItemValueEntry__Entry_No__; "Entry No.")
                {
                }
                column(ItemValueEntry__Source_No__; "Source No.")
                {
                }
                column(ItemValueEntry__Expected_Cost_; "Expected Cost")
                {
                }
                column(InvtAmt; InvtAmt)
                {
                    AutoFormatType = 1;
                }
                column(WIPInvtAmt; WIPInvtAmt)
                {
                    AutoFormatType = 1;
                }
                column(OvhdCostAmt; OvhdCostAmt)
                {
                    AutoFormatType = 1;
                }
                column(DirCostAmt; DirCostAmt)
                {
                    AutoFormatType = 1;
                }
                column(InvtAdjmtAmt; InvtAdjmtAmt)
                {
                    AutoFormatType = 1;
                }
                column(COGSAmt; COGSAmt)
                {
                    AutoFormatType = 1;
                }
                column(ItemCaption; ItemCaptionLbl)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    IF ("Item Ledger Entry No." = 0) OR NOT Inventoriable THEN
                        CurrReport.SKIP;

                    IF NOT InvtPost.BufferInvtPosting(ItemValueEntry) THEN
                        CurrReport.SKIP;

                    InvtPost.GetAmtToPost(
                      COGSAmt, InvtAdjmtAmt, DirCostAmt, OvhdCostAmt, VarPurchCostAmt,
                      VarMfgDirCostAmt, VarMfgOvhdAmt,
                      WIPInvtAmt, InvtAmt, FALSE);

                    InvtPost.GetAmtToPost(
                      TotalCOGSAmt, TotalInvtAdjmtAmt, TotalDirCostAmt, TotalOvhdCostAmt, TotalVarPurchCostAmt,
                      TotalVarMfgDirCostAmt, TotalVarMfgOvhdCostAmt,
                      TotalWIPInvtAmt, TotalInvtAmt, TRUE);

                    IF (PostMethod = PostMethod::"per Entry") AND Post THEN
                        InvtPost.PostInvtPostBufPerEntry(ItemValueEntry);

                    IF Post THEN
                        MODIFY;
                end;

                trigger OnPostDataItem();
                begin
                    Window.CLOSE;
                end;

                trigger OnPreDataItem();
                var
                    GLEntry: Record "G/L Entry";
                begin
                    Window.OPEN(Text003);
                    IF Post THEN BEGIN
                        GLEntry.LOCKTABLE;
                        IF GLEntry.FIND('+') THEN;
                    END;
                end;
            }
            dataitem(CapValueEntry; "Value Entry")
            {
                DataItemTableView = SORTING(Order No.);
                column(CapValueEntry__Order_No__; "Order No.")
                {
                }
                column(CapValueEntry__Expected_Cost_; "Expected Cost")
                {
                }
                column(InvtAmt_Control25; InvtAmt)
                {
                    AutoFormatType = 1;
                }
                column(WIPInvtAmt_Control28; WIPInvtAmt)
                {
                    AutoFormatType = 1;
                }
                column(OvhdCostAmt_Control42; OvhdCostAmt)
                {
                    AutoFormatType = 1;
                }
                column(DirCostAmt_Control43; DirCostAmt)
                {
                    AutoFormatType = 1;
                }
                column(InvtAdjmtAmt_Control44; InvtAdjmtAmt)
                {
                    AutoFormatType = 1;
                }
                column(COGSAmt_Control45; COGSAmt)
                {
                    AutoFormatType = 1;
                }
                column(CapValueEntry__Posting_Date_; "Posting Date")
                {
                }
                column(CapValueEntry__Inventory_Posting_Group_; "Inventory Posting Group")
                {
                }
                column(CapValueEntry__Source_No__; "Source No.")
                {
                }
                column(CapValueEntry__Document_No__; "Document No.")
                {
                }
                column(CapValueEntry__Item_Ledger_Entry_Type_; "Item Ledger Entry Type")
                {
                }
                column(CapValueEntry__Entry_No__; "Entry No.")
                {
                }
                column(CapValueEntry__Order_No__Caption; FIELDCAPTION("Order No."))
                {
                }

                trigger OnAfterGetRecord();
                begin
                    IF NOT InvtPost.BufferInvtPosting(CapValueEntry) THEN
                        CurrReport.SKIP;

                    InvtPost.GetAmtToPost(
                      COGSAmt, InvtAdjmtAmt, DirCostAmt, OvhdCostAmt, VarPurchCostAmt,
                      VarMfgDirCostAmt, VarMfgOvhdAmt,
                      WIPInvtAmt, InvtAmt, FALSE);

                    InvtPost.GetAmtToPost(
                      TotalCOGSAmt, TotalInvtAdjmtAmt, TotalDirCostAmt, TotalOvhdCostAmt, TotalVarPurchCostAmt,
                      TotalVarMfgDirCostAmt, TotalVarMfgOvhdCostAmt,
                      TotalWIPInvtAmt, TotalInvtAmt, TRUE);

                    IF (PostMethod = PostMethod::"per Entry") AND Post THEN
                        InvtPost.PostInvtPostBufPerEntry(CapValueEntry);

                    IF Post THEN
                        MODIFY;
                end;

                trigger OnPreDataItem();
                begin
                    Window.OPEN(Text99000000);

                    COPYFILTERS(ItemValueEntry);
                    SETFILTER("Capacity Ledger Entry No.", '1..');
                end;
            }

            trigger OnPreDataItem();
            begin
                CASE PostMethod OF
                    PostMethod::"per Posting Group":
                        IF DocNo = '' THEN
                            ERROR(
                              Text000, ItemValueEntry.FIELDCAPTION("Document No."), SELECTSTR(PostMethod + 1, Text012));
                    PostMethod::"per Entry":
                        IF DocNo <> '' THEN
                            ERROR(
                              Text001, ItemValueEntry.FIELDCAPTION("Document No."), SELECTSTR(PostMethod + 1, Text012));
                END;
            end;
        }
        dataitem(InvtPostingBufferLoop; "Integer")
        {
            DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
            column(FORMAT_InvtPostBuf__Account_Type__; FORMAT(InvtPostBuf."Account Type"))
            {
            }
            column(DimText; DimText)
            {
            }
            column(STRSUBSTNO___1__2__InvtPostBuf__Location_Code__InvtPostBuf__Inventory_Posting_Group__; STRSUBSTNO('%1,%2', InvtPostBuf."Location Code", InvtPostBuf."Inventory Posting Group"))
            {
            }
            column(InvtPostBuf_Amount; InvtPostBuf.Amount)
            {
            }
            column(FORMAT_InvtPostBuf__Account_Type__Caption; FORMAT_InvtPostBuf__Account_Type__CaptionLbl)
            {
            }
            column(DimTextCaption; DimTextCaptionLbl)
            {
            }
            column(STRSUBSTNO___1__2__InvtPostBuf__Location_Code__InvtPostBuf__Inventory_Posting_Group__Caption; STRSUBSTNO___1__2__InvtPostBuf__Location_Code__InvtPostBuf__Inventory_Posting_Group__CaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(InvtPostBuf_AmountCaption; InvtPostBuf_AmountCaptionLbl)
            {
            }
            column(InvtPostingBufferLoop_Number; Number)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF Number = 1 THEN BEGIN
                    IF NOT InvtPostBuf.FIND('-') THEN
                        CurrReport.BREAK;
                END ELSE
                    IF InvtPostBuf.NEXT = 0 THEN
                        CurrReport.BREAK;

                InvtPost.GetDimBuf(InvtPostBuf."Dimension Entry No.", TempDimBuf);
                GetDimText;
            end;

            trigger OnPostDataItem();
            begin
                IF (PostMethod = PostMethod::"per Posting Group") AND Post THEN
                    InvtPost.PostInvtPostBufPerPostGrp(DocNo, '');
            end;

            trigger OnPreDataItem();
            begin
                IF PostMethod = PostMethod::"per Posting Group" THEN
                    InvtPost.GetInvtPostBuf(InvtPostBuf);
                InvtPostBuf.RESET;
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

    trigger OnPreReport();
    begin
        ValueEntryFilter := ItemValueEntry.GETFILTERS;
        InvtSetup.GET;
    end;

    var
        Text000: Label 'Please enter a %1 when posting %2.';
        Text001: Label 'Do not enter a %1 when posting %2.';
        Text002: Label 'Posted %1';
        Text003: Label 'Processing items  #1##########';
        Text004: Label '%1 %2 on %3';
        Text005: Label 'The item no. no longer exists.';
        Text010: Label 'COGS';
        Text011: Label 'Adjustment';
        Text99000000: Label 'Processing production order  #1##########';
        Item: Record Item;
        InvtSetup: Record "Inventory Setup";
        InvtPostBuf: Record "Invt. Posting Buffer" temporary;
        InvtPost: Codeunit "Inventory Posting To G/L";
        TempDimBuf: Record "Dimension Buffer" temporary;
        COGSAmt: Decimal;
        InvtAdjmtAmt: Decimal;
        DirCostAmt: Decimal;
        OvhdCostAmt: Decimal;
        VarPurchCostAmt: Decimal;
        VarMfgDirCostAmt: Decimal;
        VarMfgOvhdAmt: Decimal;
        WIPInvtAmt: Decimal;
        InvtAmt: Decimal;
        TotalCOGSAmt: Decimal;
        TotalInvtAdjmtAmt: Decimal;
        TotalDirCostAmt: Decimal;
        TotalOvhdCostAmt: Decimal;
        TotalVarPurchCostAmt: Decimal;
        TotalVarMfgDirCostAmt: Decimal;
        TotalVarMfgOvhdCostAmt: Decimal;
        TotalWIPInvtAmt: Decimal;
        TotalInvtAmt: Decimal;
        Window: Dialog;
        ValueEntryFilter: Text[250];
        DimText: Text[120];
        PostDate: Date;
        PostMethod: Option "per Posting Group","per Entry";
        Post: Boolean;
        DocNo: Code[20];
        Text012: Label 'per Posting Group,per Entry';
        Post_Inventory_Cost_to_G_LCaptionLbl: Label 'Post Inventory Cost to G/L';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Test_Report__not_posted_CaptionLbl: Label 'Test Report (not posted)';
        PostDateCaptionLbl: Label 'Posting Date';
        DocNoCaptionLbl: Label 'Document No.';
        ItemValueEntry__Inventory_Posting_Group_CaptionLbl: Label 'Inventory Posting Group';
        COGSAmtCaptionLbl: Label 'COGS';
        InvtAdjmtAmtCaptionLbl: Label 'Inventory Adjustment';
        DirCostAmtCaptionLbl: Label 'Direct Cost Applied';
        OvhdCostAmtCaptionLbl: Label 'Overhead Applied';
        WIPInvtAmtCaptionLbl: Label 'WIP Inventory';
        InvtAmtCaptionLbl: Label 'Inventory';
        Inventory_Cost_Posted_to_G_LCaptionLbl: Label 'Inventory Cost Posted to G/L';
        ItemCaptionLbl: Label 'Item';
        FORMAT_InvtPostBuf__Account_Type__CaptionLbl: Label 'Entry Type';
        DimTextCaptionLbl: Label 'Line Dimensions';
        STRSUBSTNO___1__2__InvtPostBuf__Location_Code__InvtPostBuf__Inventory_Posting_Group__CaptionLbl: Label 'General Posting Setup';
        TotalCaptionLbl: Label 'Total';
        InvtPostBuf_AmountCaptionLbl: Label 'Amount';

    [LineStart(5172)]
    procedure InitializeRequest(NewPostMethod: Option; NewPostDate: Date; NewDocNo: Code[20]; NewPost: Boolean);
    begin
        PostMethod := NewPostMethod;
        PostDate := NewPostDate;
        DocNo := NewDocNo;
        Post := NewPost;
    end;

    [LineStart(5178)]
    procedure GetDimText();
    var
        Continue: Boolean;
        OldDimText: Text[75];
    begin
        Continue := FALSE;

        IF TempDimBuf.FIND('-') THEN
            REPEAT
                OldDimText := DimText;
                IF DimText = '' THEN
                    DimText := STRSUBSTNO('%1 - %2', TempDimBuf."Dimension Code", TempDimBuf."Dimension Value Code")
                ELSE
                    DimText :=
                      STRSUBSTNO(
                        '%1; %2 - %3', DimText, TempDimBuf."Dimension Code", TempDimBuf."Dimension Value Code");
                IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                    DimText := OldDimText;
                    Continue := TRUE;
                    EXIT;
                END;
            UNTIL (TempDimBuf.NEXT = 0);
    end;
}

