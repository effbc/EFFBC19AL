tableextension 70017 CompanyInformationExt extends "Company Information"
{
  

    fields
    {

<<<<<<< HEAD
        //Unsupported feature: Change TableRelation on "City(Field 6)". Please convert manually.


        //Unsupported feature: Change ValidateTableRelation on "City(Field 6)". Please convert manually.


        //Unsupported feature: Change TestTableRelation on "City(Field 6)". Please convert manually.


        //Unsupported feature: Change TableRelation on ""Ship-to City"(Field 26)". Please convert manually.


        //Unsupported feature: Change ValidateTableRelation on ""Ship-to City"(Field 26)". Please convert manually.


        //Unsupported feature: Change TestTableRelation on ""Ship-to City"(Field 26)". Please convert manually.


        //Unsupported feature: Change TableRelation on ""Location Code"(Field 28)". Please convert manually.


        //Unsupported feature: Change TableRelation on ""Post Code"(Field 30)". Please convert manually.


        //Unsupported feature: Change ValidateTableRelation on ""Post Code"(Field 30)". Please convert manually.


        //Unsupported feature: Change TestTableRelation on ""Post Code"(Field 30)". Please convert manually.


        //Unsupported feature: Change TableRelation on ""Ship-to Post Code"(Field 32)". Please convert manually.


        //Unsupported feature: Change ValidateTableRelation on ""Ship-to Post Code"(Field 32)". Please convert manually.


        //Unsupported feature: Change TestTableRelation on ""Ship-to Post Code"(Field 32)". Please convert manually.


        //Unsupported feature: Change TableRelation on ""Country/Region Code"(Field 36)". Please convert manually.


        //Unsupported feature: Change TableRelation on ""Ship-to Country/Region Code"(Field 37)". Please convert manually.


        //Unsupported feature: Change TableRelation on ""SWIFT Code"(Field 39)". Please convert manually.


        //Unsupported feature: Change ValidateTableRelation on ""SWIFT Code"(Field 39)". Please convert manually.


        //Unsupported feature: Change AccessByPermission on ""IC Partner Code"(Field 41)". Please convert manually.


        //Unsupported feature: Change AccessByPermission on ""IC Inbox Type"(Field 42)". Please convert manually.


        //Unsupported feature: Change OptionString on ""IC Inbox Type"(Field 42)". Please convert manually.


        //Unsupported feature: Change AccessByPermission on ""IC Inbox Details"(Field 43)". Please convert manually.


        //Unsupported feature: Change AccessByPermission on ""Auto. Send Transactions"(Field 44)". Please convert manually.


        //Unsupported feature: Change OptionString on ""System Indicator"(Field 46)". Please convert manually.


        //Unsupported feature: Change Numeric on "GLN(Field 90)". Please convert manually.


        //Unsupported feature: Change Editable on ""Picture - Last Mod. Date Time"(Field 96)". Please convert manually.


        //Unsupported feature: Change Editable on ""Last Modified Date Time"(Field 98)". Please convert manually.


        //Unsupported feature: Change Editable on ""Created DateTime"(Field 99)". Please convert manually.


        //Unsupported feature: Change Editable on ""Demo Company"(Field 100)". Please convert manually.


        //Unsupported feature: Change TableRelation on ""Brand Color Code"(Field 301)". Please convert manually.


        //Unsupported feature: Change ValidateTableRelation on ""Responsibility Center"(Field 5700)". Please convert manually.


        //Unsupported feature: Change AccessByPermission on ""Check-Avail. Period Calc."(Field 5791)". Please convert manually.


        //Unsupported feature: Change AccessByPermission on ""Check-Avail. Time Bucket"(Field 5792)". Please convert manually.


        //Unsupported feature: Change AccessByPermission on ""Cal. Convergence Time Frame"(Field 7601)". Please convert manually.


        //Unsupported feature: CodeModification on "City(Field 6).OnValidate". Please convert manually.

        //trigger OnValidate();
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        PostCode.ValidateCity(City,"Post Code",County,"Country/Region Code",(CurrFieldNo <> 0) AND GUIALLOWED);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        PostCode.ValidateCity(City,"Post Code",County,"Country/Region Code",(CurrFieldNo <> 0) and GuiAllowed);
        */
        //end;


        //Unsupported feature: CodeModification on ""VAT Registration No."(Field 19).OnValidate". Please convert manually.

        //trigger "(Field 19)();
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        "VAT Registration No." := UPPERCASE("VAT Registration No.");
        IF "VAT Registration No." = xRec."VAT Registration No." THEN
          EXIT;
        IF NOT VATRegNoFormat.Test("VAT Registration No.","Country/Region Code",'',DATABASE::"Company Information") THEN
          EXIT;
        IF "Country/Region Code" = '' THEN
          EXIT;
        IF VATRegNoSrvConfig.VATRegNoSrvIsEnabled THEN BEGIN
          VATRegistrationLogMgt.ValidateVATRegNoWithVIES(ResultRecordRef,Rec,"Primary Key",
            VATRegistrationLog."Account Type"::"Company Information","Country/Region Code");
          ResultRecordRef.SETTABLE(Rec);
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {"VAT Registration No." := UPPERCASE("VAT Registration No.");
        #2..9
            VATRegistrationLog."Account Type"::"3","Country/Region Code");
          ResultRecordRef.SETTABLE(Rec);
        END;
        }
        */
        //end;


        //Unsupported feature: CodeModification on ""Ship-to City"(Field 26).OnValidate". Please convert manually.

        //trigger OnValidate();
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        PostCode.ValidateCity(
          "Ship-to City","Ship-to Post Code","Ship-to County","Ship-to Country/Region Code",(CurrFieldNo <> 0) AND GUIALLOWED);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        PostCode.ValidateCity(
          "Ship-to City","Ship-to Post Code","Ship-to County","Ship-to Country/Region Code",(CurrFieldNo <> 0) and GuiAllowed);
        */
        //end;


        //Unsupported feature: CodeModification on "Picture(Field 29).OnValidate". Please convert manually.

        //trigger OnValidate();
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        PictureUpdated := TRUE;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        PictureUpdated := true;
        */
        //end;


        //Unsupported feature: CodeModification on ""Post Code"(Field 30).OnValidate". Please convert manually.

        //trigger OnValidate();
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        PostCode.ValidatePostCode(City,"Post Code",County,"Country/Region Code",(CurrFieldNo <> 0) AND GUIALLOWED);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        PostCode.ValidatePostCode(City,"Post Code",County,"Country/Region Code",(CurrFieldNo <> 0) and GuiAllowed);
        */
        //end;


        //Unsupported feature: CodeModification on ""Ship-to Post Code"(Field 32).OnValidate". Please convert manually.

        //trigger OnValidate();
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        PostCode.ValidatePostCode(
          "Ship-to City","Ship-to Post Code","Ship-to County","Ship-to Country/Region Code",(CurrFieldNo <> 0) AND GUIALLOWED);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        PostCode.ValidatePostCode(
          "Ship-to City","Ship-to Post Code","Ship-to County","Ship-to Country/Region Code",(CurrFieldNo <> 0) and GuiAllowed);
        */
        //end;


        //Unsupported feature: CodeModification on ""IC Inbox Type"(Field 42).OnValidate". Please convert manually.

        //trigger OnValidate();
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "IC Inbox Type" = "IC Inbox Type"::Database THEN
          "IC Inbox Details" := '';
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        if "IC Inbox Type" = "IC Inbox Type"::Database then
          "IC Inbox Details" := '';
        */
        //end;


        //Unsupported feature: CodeModification on ""IC Inbox Details"(Field 43).OnLookup". Please convert manually.

        //trigger OnLookup();
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD("IC Partner Code");
        CASE "IC Inbox Type" OF
          "IC Inbox Type"::"File Location":
            BEGIN
              IF "IC Inbox Details" = '' THEN
                FileName := STRSUBSTNO('%1.xml',"IC Partner Code")
              ELSE
                FileName := "IC Inbox Details" + STRSUBSTNO('\%1.xml',"IC Partner Code");

              FileName2 := FileMgt.SaveFileDialog(Text001,FileName,'');
              IF FileName <> FileName2 THEN BEGIN
                Path := FileMgt.GetDirectoryName(FileName2);
                IF Path <> '' THEN
                  "IC Inbox Details" := COPYSTR(Path,1,250);
              END;
            END;
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TestField("IC Partner Code");
        case "IC Inbox Type" of
          "IC Inbox Type"::"File Location":
            begin
              if "IC Inbox Details" = '' then
                FileName := StrSubstNo('%1.xml',"IC Partner Code")
              else
                FileName := "IC Inbox Details" + StrSubstNo('\%1.xml',"IC Partner Code");

              FileName2 := FileMgt.SaveFileDialog(Text001,FileName,'');
              if FileName <> FileName2 then begin
                Path := FileMgt.GetDirectoryName(FileName2);
                if Path <> '' then
                  "IC Inbox Details" := CopyStr(Path,1,250);
              end;
            end;
        end;
        */
        //end;


        //Unsupported feature: CodeModification on "GLN(Field 90).OnValidate". Please convert manually.

        //trigger OnValidate();
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF GLN <> '' THEN
          IF NOT GLNCalculator.IsValidCheckDigit13(GLN) THEN
            ERROR(GLNCheckDigitErr,FIELDCAPTION(GLN));
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        if GLN <> '' then
          if not GLNCalculator.IsValidCheckDigit13(GLN) then
            Error(GLNCheckDigitErr,FieldCaption(GLN));
        */
        //end;


        //Unsupported feature: CodeModification on ""Brand Color Value"(Field 300).OnValidate". Please convert manually.

        //trigger OnValidate();
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        O365BrandColor.FindColor(O365BrandColor,"Brand Color Value");
        VALIDATE("Brand Color Code",O365BrandColor.Code);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {O365BrandColor.FindColor(O365BrandColor,"Brand Color Value");
        VALIDATE("Brand Color Code",O365BrandColor.Code);
        }
        */
        //end;


        //Unsupported feature: CodeModification on ""Sync with O365 Bus. profile"(Field 7603).OnValidate". Please convert manually.

        //trigger  profile"(Field 7603)();
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "Sync with O365 Bus. profile" THEN
          IF IsSyncEnabledForOtherCompany THEN
            ERROR(SyncAlreadyEnabledErr);

        IF "Sync with O365 Bus. profile" THEN
          CODEUNIT.RUN(CODEUNIT::"Graph Data Setup")
        ELSE
          GraphIntBusinessProfile.UpdateCompanyBusinessProfileId('');
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        if "Sync with O365 Bus. profile" then
          if IsSyncEnabledForOtherCompany then
            Error(SyncAlreadyEnabledErr);

        if "Sync with O365 Bus. profile" then
          CODEUNIT.Run(CODEUNIT::"Graph Data Setup")
        else
          GraphIntBusinessProfile.UpdateCompanyBusinessProfileId('');
        */
        //end;
        field(13701; "T.I.N. No."; Code[11])
        {
            CaptionML = ENU = 'T.I.N. No.',
                        ENN = 'T.I.N. No.';
            DataClassification = CustomerContent;
            TableRelation = "T.I.N. Nos.";
        }
        field(13704; "L.S.T. No."; Code[20])
        {
            CaptionML = ENU = 'L.S.T. No.',
                        ENN = 'L.S.T. No.';
            DataClassification = CustomerContent;
        }
        field(13705; "C.S.T No."; Code[30])
        {
            CaptionML = ENU = 'C.S.T No.',
                        ENN = 'C.S.T No.';
            DataClassification = CustomerContent;
        }
        field(13706; "P.A.N. No."; Code[20])
        {
            CaptionML = ENU = 'P.A.N. No.',
                        ENN = 'P.A.N. No.';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                /*IF "P.A.N. No." <> '' THEN
                  CheckGSTRegBlankInRef;
                UpdateBatchHeaderPANNo;
                UpdateTCSBatchHeaderPANNo;
                */

            end;
        }
        field(13708; "E.C.C. No."; Code[20])
        {
            CaptionML = ENU = 'E.C.C. No.',
                        ENN = 'E.C.C. No.';
            DataClassification = CustomerContent;
            TableRelation = "E.C.C. Nos.";
        }
        field(13709; "T.A.N. No."; Code[10])
        {
            CaptionML = ENU = 'T.A.N. No.',
                        ENN = 'T.A.N. No.';
            DataClassification = CustomerContent;
            TableRelation = "T.A.N. Nos.";

            trigger OnValidate();
            begin
                //UpdateBatchHeaderTANNo;
            end;
        }
        field(13711; "C.E. Registration No."; Code[20])
        {
            CaptionML = ENU = 'C.E. Registration No.',
                        ENN = 'C.E. Registration No.';
            DataClassification = CustomerContent;
        }
        field(13712; "C.E. Range"; Code[20])
        {
            CaptionML = ENU = 'C.E. Range',
                        ENN = 'C.E. Range';
            DataClassification = CustomerContent;
        }
        field(13713; "C.E. Commissionerate"; Code[20])
        {
            CaptionML = ENU = 'C.E. Commissionerate',
                        ENN = 'C.E. Commissionerate';
            DataClassification = CustomerContent;
        }
        field(13714; State; Code[10])
        {
            CaptionML = ENU = 'State',
                        ENN = 'State';
            DataClassification = CustomerContent;
            TableRelation = State.Code;
        }
        field(13715; "Manufacturers Code"; Code[20])
        {
            CaptionML = ENU = 'Manufacturers Code',
                        ENN = 'Manufacturers Code';
            DataClassification = CustomerContent;
        }
        field(13719; "Factories Act. Regd. No."; Code[20])
        {
            CaptionML = ENU = 'Factories Act. Regd. No.',
                        ENN = 'Factories Act. Regd. No.';
            DataClassification = CustomerContent;
        }
        field(13722; "C.E. Division"; Code[20])
        {
            CaptionML = ENU = 'C.E. Division',
                        ENN = 'C.E. Division';
            DataClassification = CustomerContent;
        }
        field(13725; "Company Status"; Option)
        {
            CaptionML = ENU = 'Company Status',
                        ENN = 'Company Status';
            DataClassification = CustomerContent;
            OptionCaptionML = ENU = 'Public Limited Co.,Private Limited Co.,Others,Government,Individual/Proprietary,Registered Trust,Partnership,Society/Co-op Society',
                              ENN = 'Public Limited Co.,Private Limited Co.,Others,Government,Individual/Proprietary,Registered Trust,Partnership,Society/Co-op Society';
            OptionMembers = "Public Limited Co.","Private Limited Co.",Others,Government,"Individual/Proprietary","Registered Trust",Partnership,"Society/Co-op Society";
        }
        field(13737; "Company Registration  No."; Code[20])
        {
            CaptionML = ENU = 'Company Registration  No.',
                        ENN = 'Company Registration  No.';
            DataClassification = CustomerContent;
        }
        field(13745; "Circle No."; Text[30])
        {
            CaptionML = ENU = 'Circle No.',
                        ENN = 'Circle No.';
            DataClassification = CustomerContent;
        }
        field(13746; "Ward No."; Text[30])
        {
            CaptionML = ENU = 'Ward No.',
                        ENN = 'Ward No.';
            DataClassification = CustomerContent;
        }
        field(13747; "Assessing Officer"; Text[30])
        {
            CaptionML = ENU = 'Assessing Officer',
                        ENN = 'Assessing Officer';
            DataClassification = CustomerContent;
        }
        field(13749; "Cash Account No."; Code[20])
        {
            CaptionML = ENU = 'Cash Account No.',
                        ENN = 'Cash Account No.';
            DataClassification = CustomerContent;
            TableRelation = "G/L Account";
        }
        field(16465; "Service Tax Registration No."; Code[20])
        {
            CaptionML = ENU = 'Service Tax Registration No.',
                        ENN = 'Service Tax Registration No.';
            DataClassification = CustomerContent;
            TableRelation = "Service Tax Registration Nos.".Code;
        }
        field(16500; "T.C.A.N. No."; Code[10])
        {
            CaptionML = ENU = 'T.C.A.N. No.',
                        ENN = 'T.C.A.N. No.';
            DataClassification = CustomerContent;
            TableRelation = "T.C.A.N. No.";

            trigger OnValidate();
            begin
                //UpdateTCSBatchHeaderTCAN;
            end;
        }
        field(16501; Composition; Boolean)
        {
            CaptionML = ENU = 'Composition',
                        ENN = 'Composition';
            DataClassification = CustomerContent;
        }
        field(16502; "Export or Deemed Export"; Boolean)
        {
            CaptionML = ENU = 'Export or Deemed Export',
                        ENN = 'Export or Deemed Export';
            DataClassification = CustomerContent;
        }
        field(16503; "Composition Type"; Option)
        {
            CaptionML = ENU = 'Composition Type',
                        ENN = 'Composition Type';
            DataClassification = CustomerContent;
            OptionCaptionML = ENU = ' ,Retailer,Works Contract,Bakery,Restaurant / Club,Second Hand Motor Vehicle',
                              ENN = ' ,Retailer,Works Contract,Bakery,Restaurant / Club,Second Hand Motor Vehicle';
            OptionMembers = " ",Retailer,"Works Contract",Bakery,"Restaurant / Club","Second Hand Motor Vehicle";
        }
        field(16504; "Trading Co."; Boolean)
        {
            CaptionML = ENU = 'Trading Co.',
                        ENN = 'Trading Co.';
            DataClassification = CustomerContent;
        }
        field(16505; "Large Tax Payer"; Boolean)
        {
            CaptionML = ENU = 'Large Tax Payer',
                        ENN = 'Large Tax Payer';
            DataClassification = CustomerContent;
        }
        field(16506; "Large Tax Payer City"; Text[30])
        {
            CaptionML = ENU = 'Large Tax Payer City',
                        ENN = 'Large Tax Payer City';
            DataClassification = CustomerContent;
            TableRelation = "Post Code".City;
        }
        field(16507; "Input Service Distributor"; Boolean)
        {
            CaptionML = ENU = 'Input Service Distributor',
                        ENN = 'Input Service Distributor';
            DataClassification = CustomerContent;
        }
        field(16508; "ST Payment Period"; Option)
        {
            CaptionML = ENU = 'ST Payment Period',
                        ENN = 'ST Payment Period';
            DataClassification = CustomerContent;
            OptionCaptionML = ENU = 'Monthly,Quarterly',
                              ENN = 'Monthly,Quarterly';
            OptionMembers = Monthly,Quarterly;
        }
        field(16509; "Central STC Applicable"; Boolean)
        {
            CaptionML = ENU = 'Central STC Applicable',
                        ENN = 'Central STC Applicable';
            DataClassification = CustomerContent;
        }
        field(16510; "ST Payment Due Day"; Integer)
        {
            CaptionML = ENU = 'ST Payment Due Day',
                        ENN = 'ST Payment Due Day';
            DataClassification = CustomerContent;
            MaxValue = 31;
            MinValue = 0;
        }
        field(16511; "P.A.N. Status"; Option)
        {
            CaptionML = ENU = 'P.A.N. Status',
                        ENN = 'P.A.N. Status';
            DataClassification = CustomerContent;
            InitValue = "Not available";
            OptionCaptionML = ENU = 'Available,Not available',
                              ENN = 'Available,Not available';
            OptionMembers = Available,"Not available";

            trigger OnValidate();
            begin
                /*IF "P.A.N. Status" = "P.A.N. Status"::"Not available" THEN
                  "P.A.N. No." := Text16502
                ELSE
                  "P.A.N. No." := '';
                  */

            end;
        }
        field(16512; "PAO Code"; Code[20])
        {
            CaptionML = ENU = 'PAO Code',
                        ENN = 'PAO Code';
            DataClassification = CustomerContent;
        }
        field(16513; "PAO Registration No."; Code[7])
        {
            CaptionML = ENU = 'PAO Registration No.',
                        ENN = 'PAO Registration No.';
            DataClassification = CustomerContent;
        }
        field(16514; "DDO Code"; Code[20])
        {
            CaptionML = ENU = 'DDO Code',
                        ENN = 'DDO Code';
            DataClassification = CustomerContent;
        }
        field(16515; "DDO Registration No."; Code[10])
        {
            CaptionML = ENU = 'DDO Registration No.',
                        ENN = 'DDO Registration No.';
            DataClassification = CustomerContent;
        }
        field(16516; "Ministry Code"; Code[3])
        {
            CaptionML = ENU = 'Ministry Code',
                        ENN = 'Ministry Code';
            DataClassification = CustomerContent;
            TableRelation = IF ("Ministry Type" = CONST(Others)) Ministry WHERE("Other Ministry" = FILTER(true))
            ELSE
            IF ("Ministry Type" = CONST(Regular)) Ministry WHERE("Other Ministry" = CONST(false));
        }
        field(16517; "Deductor Category"; Code[1])
        {
            CaptionML = ENU = 'Deductor Category',
                        ENN = 'Deductor Category';
            DataClassification = CustomerContent;
            TableRelation = "Deductor Category";

            trigger OnValidate();
            begin
                /*DeductorCategory.GET("Deductor Category");
                IF NOT DeductorCategory."DDO Code Mandatory" THEN BEGIN
                  "DDO Code" := '';
                  "DDO Registration No." := '';
                END;
                IF NOT DeductorCategory."PAO Code Mandatory" THEN BEGIN
                  "PAO Code" := '';
                  "PAO Registration No." := '';
                END;
                IF NOT DeductorCategory."Ministry Details Mandatory" THEN BEGIN
                  "Ministry Type" := "Ministry Type"::" ";
                  "Ministry Code" := '';
                END;
                */

            end;
        }
        field(16518; "Ministry Type"; Option)
        {
            CaptionML = ENU = 'Ministry Type',
                        ENN = 'Ministry Type';
            DataClassification = CustomerContent;
            OptionCaptionML = ENU = ' ,Regular,Others',
                              ENN = ' ,Regular,Others';
            OptionMembers = " ",Regular,Others;
        }
        field(16519; "STD Code"; Code[5])
        {
            CaptionML = ENU = 'STD Code',
                        ENN = 'STD Code';
            DataClassification = CustomerContent;
        }
        field(16520; "TAN Registration No."; Code[12])
        {
            CaptionML = ENU = 'TAN Registration No.',
                        ENN = 'TAN Registration No.';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                /*IF (STRLEN("TAN Registration No.") < MAXSTRLEN("TAN Registration No.")) AND ("TAN Registration No." <> '') THEN
                  ERROR(Text16503,FIELDCAPTION("TAN Registration No."),MAXSTRLEN("TAN Registration No."));
                  */

            end;
        }
        field(16600; "GST Registration No."; Code[15])
        {
            CaptionML = ENU = 'GST Registration No.',
                        ENN = 'GST Registration No.';
            DataClassification = CustomerContent;
            TableRelation = "GST Registration Nos." WHERE("State Code" = FIELD(State));

            trigger OnValidate();
            begin
                //TESTFIELD(State);
            end;
        }
        field(16601; "ARN No."; Code[15])
        {
            CaptionML = ENU = 'ARN No.',
                        ENN = 'ARN No.';
            DataClassification = CustomerContent;
        }
=======
      
>>>>>>> 92e9343b97066cd41289b021406784be0d52ea8b
        field(50001; "C.S.T.Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(60000; "Insurance Policy No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(60001; "Insurance Policy Name"; Text[150])
        {
            DataClassification = CustomerContent;
        }
    }
 }

