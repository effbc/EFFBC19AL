report 60000 "Generate HTML Help"
{
    // version HRK1.05

    ProcessingOnly = true;

    dataset
    {
        dataitem(HelpTopics;"Object")
        {
            DataItemTableView = SORTING(Type,Company Name,ID) WHERE(Type=FILTER(Table..Codeunit));
            RequestFilterFields = Type,ID;
            dataitem("Field";"Field")
            {
                DataItemLink = TableNo=FIELD(ID);
                DataItemTableView = SORTING(TableNo,No.);
                RequestFilterFields = "No.";

                trigger OnAfterGetRecord();
                begin
                    CreateTableTopic(HelpTopics,Field."No.",ProjectFolder + '\Source');
                end;

                trigger OnPreDataItem();
                begin
                    IF HelpTopics.Type <> HelpTopics.Type::Table THEN CurrReport.BREAK;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                CASE TRUE OF
                ((Type = Type::Table) OR (Type = Type::Report)) AND (FieldFilter.GETFILTERS = ''):
                  CreateTableTopic(HelpTopics,0,ProjectFolder + '\Source');
                (Type = Type::Page) AND (FieldFilter.GETFILTERS = ''): CreateFormTopic(HelpTopics,0,ProjectFolder + '\Source');
                END;
                Process := Process + 1;
                UpdateWindow(2,Total,Process);
            end;

            trigger OnPreDataItem();
            begin
                IF ProjectFolder = '' THEN
                  ERROR(Error001);
                CurrReport.LANGUAGE(Language."Language ID");
                IF NOT MakeTopics THEN CurrReport.BREAK;
                Total := HelpTopics.COUNTAPPROX;
                Window.UPDATE(1,'Creating Topics');
            end;
        }
        dataitem("Integer";"Integer")
        {
            DataItemTableView = SORTING(Number) WHERE(Number=CONST(1));
            dataitem(Gate;"Object")
            {
                DataItemTableView = SORTING(Type,Company Name,ID);

                trigger OnAfterGetRecord();
                begin
                    GateFile.WRITE(STRSUBSTNO('%1_%2: "%3"',GetObjectLetter(Gate),ID,Ascii2Ansi(GetCurrLangObjName(Gate))));
                    Process := Process + 1;
                    UpdateWindow(2,Total,Process);
                end;

                trigger OnPreDataItem();
                begin
                    Gate.COPYFILTERS(ObjectFilter);
                    GateField.COPYFILTERS(FieldFilter);
                    ObjectFilter.COPYFILTER(ID,GateField.TableNo);
                    Process := 0;
                    Window.UPDATE(1,'Creating Object.txt');
                    IF FieldFilter.GETFILTERS <> '' THEN BEGIN
                      Total := GateField.COUNT;
                      CurrReport.BREAK;
                    END ELSE
                      Total := Gate.COUNT + GateField.COUNT;
                end;
            }
            dataitem(Gate2;"Object")
            {
                DataItemTableView = SORTING(Type,Company Name,ID);
                dataitem(GateField;"Field")
                {
                    DataItemLink = TableNo=FIELD(ID);
                    DataItemTableView = SORTING(TableNo,No.);

                    trigger OnAfterGetRecord();
                    begin
                        GateFile.WRITE(STRSUBSTNO('%1_%2_%3: "%4"',GetObjectLetter(Gate2),Gate2.ID,"No.",Ascii2Ansi("Field Caption")));
                        Process := Process + 1;
                        Window.UPDATE(1,GateField.TableName);
                        Window.UPDATE(2,ROUND(Process/Total*10000,1));
                    end;

                    trigger OnPreDataItem();
                    begin
                        FieldFilter.COPYFILTER("No.",GateField."No.");
                    end;
                }

                trigger OnPreDataItem();
                begin
                    Gate2.COPYFILTERS(ObjectFilter);
                    Gate2.SETRANGE(Type,Gate2.Type::Table);
                end;
            }

            trigger OnPostDataItem();
            begin
                IF NOT MakeObjTxt THEN CurrReport.BREAK;
                  GateFile.CLOSE;
            end;

            trigger OnPreDataItem();
            begin
                IF NOT MakeObjTxt THEN CurrReport.BREAK;
                GateFile.TEXTMODE(TRUE);
                IF FILE.EXISTS(ProjectFolder + '\Application\Object.txt') THEN BEGIN
                  CASE FileExistsObject OF
                  FileExistsObject::Ignore: BEGIN
                    MakeObjTxt := FALSE;
                    CurrReport.BREAK;
                  END;
                  FileExistsObject::Append: BEGIN
                    GateFile.WRITEMODE(TRUE);
                    GateFile.OPEN(ProjectFolder + '\Application\Object.txt');
                    GateFile.SEEK(GateFile.LEN);
                  END;
                  FileExistsObject::Owerwrite:
                    GateFile.CREATE(ProjectFolder + '\Application\Object.txt');
                  END;
                END ELSE
                  GateFile.CREATE(ProjectFolder + '\Application\Object.txt');
            end;
        }
        dataitem(Toc;"Object")
        {
            DataItemTableView = SORTING(Type,Name);

            trigger OnAfterGetRecord();
            begin
                IF Type <> LastTocLevel THEN BEGIN
                  IF LastTocLevel > 0 THEN
                    TocFile.WRITE('</UL>');
                  CASE Type OF
                    Type::Table:TOCGroupHeader(TocFile,TocTableTypeTxt);
                    Type::Report:TOCGroupHeader(TocFile,TocReportTypeTxt);
                  ELSE
                    TOCGroupHeader(TocFile,STRSUBSTNO(TocUnsupTypeTxt,Toc.Type));
                  END;
                  TocFile.WRITE('<UL>');
                END;
                IF IsABatchJob(Toc) THEN BEGIN
                  BatchJobsToc := Toc;
                  BatchJobsToc.INSERT;
                END ELSE
                  TOCEntry(TocFile,Toc);
                LastTocLevel := Type;
                Process := Process + 1;
                UpdateWindow(2,Total,Process);
            end;

            trigger OnPostDataItem();
            begin
                IF NOT MakeTOC THEN CurrReport.BREAK;
                TocFile.WRITE('</UL>');
                TOCGroupHeader(TocFile,TocBatchTypeTxt);
                BatchJobsToc.SETCURRENTKEY(Type,Name);
                IF BatchJobsToc.FIND('-') THEN BEGIN
                  TocFile.WRITE('<UL>');
                  REPEAT
                    TOCEntry(TocFile,BatchJobsToc);
                    Process := Process + 1;
                    UpdateWindow(2,Total,Process);
                  UNTIL BatchJobsToc.NEXT = 0;
                  TocFile.WRITE('</UL>');
                END;
                TocFile.WRITE('</UL>');
                TOCFooter(TocFile);
            end;

            trigger OnPreDataItem();
            begin
                IF NOT MakeTOC THEN CurrReport.BREAK;
                IF FILE.EXISTS(ProjectFolder + '\Source\Contents.hhc') THEN
                  IF FileExistsToc = FileExistsToc::Ignore THEN BEGIN
                    MakeTOC := FALSE;
                    CurrReport.BREAK;
                  END;
                CurrReport.LANGUAGE(Language."Language ID");
                Toc.COPYFILTERS(ObjectFilter);
                Process := 0;
                Total := Toc.COUNTAPPROX;
                Window.UPDATE(1,'Creating TOC');
                TocFile.TEXTMODE(TRUE);
                TocFile.CREATE(ProjectFolder + '\Source\Contents.hhc');
                TOCHeader(TocFile);
                TocFile.WRITE('<UL>');
                TOCGroupHeader(TocFile,TocHeaderTxt);
                TocFile.WRITE('<UL>');
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
        Window.CLOSE;
    end;

    trigger OnPreReport();
    begin
        LastTime := TIME;
        Window.OPEN('#1##########################\' +
                    '@2@@@@@@@@@@@@@@@@@@@@@@@@@@');
        FieldFilter.COPYFILTERS(Field);
        ObjectFilter.COPYFILTERS(HelpTopics);
    end;

    var
        FieldFilter : Record "Field";
        ObjectFilter : Record "Object";
        BatchJobsToc : Record "Object" temporary;
        Language : Record "Windows Language";
        ProjectFolder : Text[250];
        AsciiStr : Text[250];
        AnsiStr : Text[250];
        Window : Dialog;
        GateFile : File;
        TocFile : File;
        TocHeaderTxt : TextConst DAN='Tabeller, Rapporter &amp; K¢rsler',ENU='Tables, Reports &amp; Batch Jobs';
        TocTableTypeTxt : TextConst DAN='Tabeller',ENU='Tables';
        TocReportTypeTxt : TextConst DAN='Rapporter',ENU='Reports';
        LastTocLevel : Integer;
        TocUnsupTypeTxt : TextConst DAN='Objekttypen %1 skal ikke være i TOC',ENU='The object type %1 should not be in the TOC';
        TocBatchTypeTxt : TextConst DAN='K¢rsler',ENU='Batch Jobs';
        Process : Integer;
        Total : Integer;
        LastTime : Time;
        FileExistsTopics : Option Ignore,Confirm,Owerwrite;
        FileExistsObject : Option Ignore,Append,Owerwrite;
        FileExistsToc : Option Ignore,Owerwrite;
        Created : Boolean;
        Error001 : TextConst DAN='Projektmappe skal udfyldes',ENU='Project Folder must not be empty';
        MakeTopics : Boolean;
        MakeObjTxt : Boolean;
        MakeTOC : Boolean;

    [LineStart(11448)]
    procedure UpdateWindow(LineNo : Integer;Total : Integer;Process : Integer);
    begin
        IF TIME - LastTime > 500 THEN BEGIN
          Window.UPDATE(LineNo,ROUND(Process/Total*10000,1));
          LastTime := TIME;
        END;
    end;

    [LineStart(11454)]
    procedure TOCHeader(var TocFile : File);
    begin
        TocFile.WRITE('<html>');
        TocFile.WRITE('<!-- Sitemap 1.0 -->');
        TocFile.WRITE('<object type="text/site properties">');
        TocFile.WRITE('  <param name="SiteType" value="toc">');
        TocFile.WRITE('  <param name="Window Styles" value="0x800424">');
        TocFile.WRITE('  <param name="ExWindow Styles" value="0x100">');
        TocFile.WRITE('</object>');
    end;

    [LineStart(11463)]
    procedure TOCGroupHeader(var TocFile : File;TextLine : Text[250]);
    begin
        TocFile.WRITE('<li><object type="text/sitemap">');
        TocFile.WRITE(STRSUBSTNO('<param name="Name" value="%1">',Ascii2Ansi(TextLine)));
        TocFile.WRITE('</object>');
    end;

    [LineStart(11468)]
    procedure TOCEntry(var TocFile : File;"Object" : Record "Object");
    begin
        TocFile.WRITE('<li><object type="text/sitemap">');
        TocFile.WRITE(STRSUBSTNO('<param name="Name" value="%1">',Ascii2Ansi(CreateContextString(Object,0))));
        TocFile.WRITE(STRSUBSTNO('<param name="Local" value="%1">',CreateFileName(Object,0)));
        TocFile.WRITE('</object>');
    end;

    [LineStart(11474)]
    procedure TOCFooter(var TocFile : File);
    begin
        TocFile.WRITE('</html>');
    end;

    [LineStart(11477)]
    procedure CreateTableTopic("Object" : Record "Object";Parameter : Integer;Path : Text[250]);
    var
        f : File;
        TempContextString : Text[100];
    begin
        IF FILE.EXISTS(STRSUBSTNO('%1\%2',Path,CreateFileName(Object,Parameter))) THEN
          IF FileExistsTopics = FileExistsTopics::Ignore THEN EXIT;
        TempContextString := Ascii2Ansi(CreateContextString(Object,Parameter));
        f.QUERYREPLACE(FileExistsTopics = FileExistsTopics::Confirm);
        f.TEXTMODE(TRUE);
        f.CREATE(STRSUBSTNO('%1\%2',Path,CreateFileName(Object,Parameter)));
        f.WRITE('<HTML>');
        f.WRITE('<HEAD>');
        f.WRITE(STRSUBSTNO('<TITLE>%1</TITLE>',TempContextString));
        f.WRITE('<LINK rel="stylesheet" href="master.css" type="text/css">');
        f.WRITE('</HEAD>');
        f.WRITE('<BODY>');
        f.WRITE(STRSUBSTNO('<H1>%1</H1>',TempContextString));
        f.WRITE('<P>&nbsp;</P>');
        f.WRITE('</BODY>');
        f.WRITE('</HTML>');
        f.CLOSE;
    end;

    [LineStart(11496)]
    procedure CreateFormTopic("Object" : Record "Object";Parameter : Integer;Path : Text[250]);
    var
        f : File;
        TempContextString : Text[100];
    begin
        TempContextString := Ascii2Ansi(CreateContextString(Object,Parameter));
        f.TEXTMODE(TRUE);
        f.CREATE(STRSUBSTNO('%1\%2',Path,CreateFileName(Object,Parameter)));
        f.WRITE('<HTML>');
        f.WRITE('<HEAD>');
        f.WRITE(STRSUBSTNO('<TITLE>%1</TITLE>',TempContextString));
        f.WRITE('<LINK rel="stylesheet" href="master.css" type="text/css">');
        f.WRITE('</HEAD>');
        f.WRITE('<BODY>');
        f.WRITE(STRSUBSTNO('<H1>%1</H1>',TempContextString));
        f.WRITE('<P>&nbsp;</P>');
        f.WRITE('<P>');
        f.WRITE('<A HREF="javascript:Alink1.Click()">Related Tasks<OBJECT');
        f.WRITE('CLASSID = "clsid:ADB880A6-D8FF-11CF-9377-00AA003B7A11"');
        f.WRITE('ID = "Alink1"');
        f.WRITE('Align = BOTTOM');
        f.WRITE('Border = "0"');
        f.WRITE('VSPACE = "0"');
        f.WRITE('HSPACE = "0"><PARAM');
        f.WRITE('NAME="Command" VALUE="ALink,MENU"><PARAM');
        f.WRITE('NAME="Font" VALUE="MS Sans Serif,8,0,,"><PARAM');
        f.WRITE('NAME="Item1" VALUE=""><PARAM');
        f.WRITE(STRSUBSTNO('NAME="Item2" VALUE="F_%1_TASKS"></OBJECT></A></P>',Object.ID));
        f.WRITE('<P>');
        f.WRITE('<A HREF="javascript:Alink2.Click()">More Information<OBJECT');
        f.WRITE('CLASSID = "clsid:ADB880A6-D8FF-11CF-9377-00AA003B7A11"');
        f.WRITE('ID = "Alink2"');
        f.WRITE('Align = BOTTOM');
        f.WRITE('Border = "0"');
        f.WRITE('VSPACE = "0"');
        f.WRITE('HSPACE = "0"><PARAM');
        f.WRITE('NAME="Command" VALUE="ALink,MENU"><PARAM');
        f.WRITE('NAME="Font" VALUE="MS Sans Serif,8,0,,"><PARAM');
        f.WRITE('NAME="Item1" VALUE=""><PARAM');
        f.WRITE(STRSUBSTNO('NAME="Item2" VALUE="F_%1_OVERVIEWS"></OBJECT></A></P>',Object.ID));
        f.WRITE('</BODY>');
        f.WRITE('</HTML>');
        f.CLOSE;
    end;

    [LineStart(11536)]
    procedure CreateFileName("Object" : Record "Object";Parameter : Integer) : Text[100];
    begin
        IF Parameter <> 0 THEN
          EXIT(STRSUBSTNO('%1_%2_%3.htm',GetObjectLetter(Object),Object.ID,Parameter))
        ELSE
          EXIT(STRSUBSTNO('%1_%2.htm',GetObjectLetter(Object),Object.ID));
    end;

    [LineStart(11542)]
    procedure CreateContextString("Object" : Record "Object";Parameter : Integer) : Text[100];
    var
        Field2 : Record "Field";
    begin
        IF Parameter <> 0 THEN BEGIN
          IF Field2.GET(Object.ID,Parameter) THEN
            EXIT(STRSUBSTNO('($ %1_%2_%3 %4 $)',GetObjectLetter(Object),Object.ID,Parameter,Field2."Field Caption"));
          END
        ELSE
          EXIT(STRSUBSTNO('($ %1_%2 %3 $)',GetObjectLetter(Object),Object.ID,GetCurrLangObjName(Object)));
    end;

    [LineStart(11550)]
    procedure GetCurrLangObjName(Obj : Record "Object") : Text[30];
    var
        ObjTrans : Record "Object Translation";
    begin
        ObjTrans.SETRANGE("Object Type",Obj.Type);
        ObjTrans.SETRANGE("Object ID",Obj.ID);
        ObjTrans.SETRANGE("Language ID",Language."Language ID");
        IF ObjTrans.FIND('-') THEN
          EXIT(ObjTrans.Description)
        ELSE
          EXIT(Obj.Name);
    end;

    [LineStart(11559)]
    procedure GetObjectLetter(Obj : Record "Object") : Text[1];
    begin
        IF Obj.Type = Obj.Type::Report THEN
          IF IsABatchJob(Obj) THEN
            EXIT('B')
          ELSE
            EXIT('R')
        ELSE
          EXIT(COPYSTR(FORMAT(Obj.Type),1,1));
    end;

    [LineStart(11568)]
    procedure IsABatchJob(Obj : Record "Object") : Boolean;
    var
        ObjStream : InStream;
        BinData : Binary[2000];
        Counter : Integer;
        intChar : array [3] of Integer;
    begin
        IF Obj.Type <> Obj.Type::Report THEN EXIT(FALSE);
        Obj.CALCFIELDS("BLOB Reference");
        Obj."BLOB Reference".CREATEINSTREAM(ObjStream);
        WHILE NOT ObjStream.EOS DO BEGIN
          Counter := ObjStream.READ(BinData);
          FOR Counter := 1 TO 1998 DO BEGIN
            intChar[1] := BinData[Counter];
            intChar[2] := BinData[Counter+1];
            intChar[3] := BinData[Counter+2];
            IF (intChar[1] = 37) AND (intChar[2] = 72) AND (intChar[3] = 4) THEN
              IF BinData[Counter+4] = 1 THEN
                EXIT(TRUE);
          END;
          EXIT(FALSE);
        END;
    end;

    [LineStart(11585)]
    procedure Ansi2Ascii(_Text : Text[250]) : Text[250];
    begin
        IF NOT Created THEN MakeVars;
        EXIT(CONVERTSTR(_Text,AnsiStr,AsciiStr));
    end;

    [LineStart(11589)]
    procedure Ascii2Ansi(_Text : Text[250]) : Text[250];
    begin
        IF NOT Created THEN MakeVars;
        EXIT(CONVERTSTR(_Text,AsciiStr,AnsiStr));
    end;

    [LineStart(11593)]
    procedure MakeVars();
    begin
        AsciiStr[1] := 128;
        AnsiStr[1] := 199;
        AsciiStr[2] := 129;
        AnsiStr[2] := 252;
        AsciiStr[3] := 130;
        AnsiStr[3] := 233;
        AsciiStr[4] := 131;
        AnsiStr[4] := 226;
        AsciiStr[5] := 132;
        AnsiStr[5] := 228;
        AsciiStr[6] := 133;
        AnsiStr[6] := 224;
        AsciiStr[7] := 134;
        AnsiStr[7] := 229;
        AsciiStr[8] := 135;
        AnsiStr[8] := 231;
        AsciiStr[9] := 136;
        AnsiStr[9] := 234;
        AsciiStr[10] := 137;
        AnsiStr[10] := 235;
        AsciiStr[11] := 138;
        AnsiStr[11] := 232;
        AsciiStr[12] := 139;
        AnsiStr[12] := 239;
        AsciiStr[13] := 140;
        AnsiStr[13] := 238;
        AsciiStr[14] := 141;
        AnsiStr[14] := 236;
        AsciiStr[15] := 142;
        AnsiStr[15] := 196;
        AsciiStr[16] := 143;
        AnsiStr[16] := 197;
        AsciiStr[17] := 144;
        AnsiStr[17] := 201;
        AsciiStr[18] := 145;
        AnsiStr[18] := 230;
        AsciiStr[19] := 146;
        AnsiStr[19] := 198;
        AsciiStr[20] := 147;
        AnsiStr[20] := 244;
        AsciiStr[21] := 148;
        AnsiStr[21] := 246;
        AsciiStr[22] := 149;
        AnsiStr[22] := 242;
        AsciiStr[23] := 150;
        AnsiStr[23] := 251;
        AsciiStr[24] := 151;
        AnsiStr[24] := 249;
        AsciiStr[25] := 152;
        AnsiStr[25] := 255;
        AsciiStr[26] := 153;
        AnsiStr[26] := 214;
        AsciiStr[27] := 154;
        AnsiStr[27] := 220;
        AsciiStr[28] := 155;
        AnsiStr[28] := 248;
        AsciiStr[29] := 156;
        AnsiStr[29] := 163;
        AsciiStr[30] := 157;
        AnsiStr[30] := 216;
        AsciiStr[31] := 158;
        AnsiStr[31] := 215;
        AsciiStr[32] := 159;
        AnsiStr[32] := 131;
        AsciiStr[33] := 160;
        AnsiStr[33] := 225;
        AsciiStr[34] := 161;
        AnsiStr[34] := 237;
        AsciiStr[35] := 162;
        AnsiStr[35] := 243;
        AsciiStr[36] := 163;
        AnsiStr[36] := 250;
        AsciiStr[37] := 164;
        AnsiStr[37] := 241;
        AsciiStr[38] := 165;
        AnsiStr[38] := 209;
        AsciiStr[39] := 166;
        AnsiStr[39] := 170;
        AsciiStr[40] := 167;
        AnsiStr[40] := 186;
        AsciiStr[41] := 168;
        AnsiStr[41] := 191;
        AsciiStr[42] := 169;
        AnsiStr[42] := 174;
        AsciiStr[43] := 170;
        AnsiStr[43] := 172;
        AsciiStr[44] := 171;
        AnsiStr[44] := 189;
        AsciiStr[45] := 172;
        AnsiStr[45] := 188;
        AsciiStr[46] := 173;
        AnsiStr[46] := 161;
        AsciiStr[47] := 174;
        AnsiStr[47] := 171;
        AsciiStr[48] := 175;
        AnsiStr[48] := 187;
        AsciiStr[49] := 181;
        AnsiStr[49] := 193;
        AsciiStr[50] := 182;
        AnsiStr[50] := 194;
        AsciiStr[51] := 183;
        AnsiStr[51] := 192;
        AsciiStr[52] := 184;
        AnsiStr[52] := 169;
        AsciiStr[53] := 189;
        AnsiStr[53] := 162;
        AsciiStr[54] := 190;
        AnsiStr[54] := 165;
        AsciiStr[55] := 198;
        AnsiStr[55] := 227;
        AsciiStr[56] := 199;
        AnsiStr[56] := 195;
        AsciiStr[57] := 207;
        AnsiStr[57] := 164;
        AsciiStr[58] := 208;
        AnsiStr[58] := 240;
        AsciiStr[59] := 209;
        AnsiStr[59] := 208;
        AsciiStr[60] := 210;
        AnsiStr[60] := 202;
        AsciiStr[61] := 211;
        AnsiStr[61] := 203;
        AsciiStr[62] := 212;
        AnsiStr[62] := 200;
        AsciiStr[63] := 214;
        AnsiStr[63] := 205;
        AsciiStr[64] := 215;
        AnsiStr[64] := 206;
        AsciiStr[65] := 216;
        AnsiStr[65] := 207;
        AsciiStr[66] := 221;
        AnsiStr[66] := 166;
        AsciiStr[67] := 222;
        AnsiStr[67] := 204;
        AsciiStr[68] := 224;
        AnsiStr[68] := 211;
        AsciiStr[69] := 225;
        AnsiStr[69] := 223;
        AsciiStr[70] := 226;
        AnsiStr[70] := 212;
        AsciiStr[71] := 227;
        AnsiStr[71] := 210;
        AsciiStr[72] := 228;
        AnsiStr[72] := 245;
        AsciiStr[73] := 229;
        AnsiStr[73] := 213;
        AsciiStr[74] := 230;
        AnsiStr[74] := 181;
        AsciiStr[75] := 231;
        AnsiStr[75] := 254;
        AsciiStr[76] := 232;
        AnsiStr[76] := 222;
        AsciiStr[77] := 233;
        AnsiStr[77] := 218;
        AsciiStr[78] := 234;
        AnsiStr[78] := 219;
        AsciiStr[79] := 235;
        AnsiStr[79] := 217;
        AsciiStr[80] := 236;
        AnsiStr[80] := 253;
        AsciiStr[81] := 237;
        AnsiStr[81] := 221;
        AsciiStr[82] := 238;
        AnsiStr[82] := 175;
        AsciiStr[83] := 239;
        AnsiStr[83] := 180;
        AsciiStr[84] := 240;
        AnsiStr[84] := 173;
        AsciiStr[85] := 241;
        AnsiStr[85] := 177;
        AsciiStr[86] := 243;
        AnsiStr[86] := 190;
        AsciiStr[87] := 244;
        AnsiStr[87] := 182;
        AsciiStr[88] := 245;
        AnsiStr[88] := 167;
        AsciiStr[89] := 246;
        AnsiStr[89] := 247;
        AsciiStr[90] := 247;
        AnsiStr[90] := 184;
        AsciiStr[91] := 248;
        AnsiStr[91] := 176;
        AsciiStr[92] := 249;
        AnsiStr[92] := 168;
        AsciiStr[93] := 250;
        AnsiStr[93] := 183;
        AsciiStr[94] := 251;
        AnsiStr[94] := 185;
        AsciiStr[95] := 252;
        AnsiStr[95] := 179;
        AsciiStr[96] := 253;
        AnsiStr[96] := 178;
        AsciiStr[97] := 255;
        AnsiStr[97] := 160;
        Created := TRUE;
    end;
}

