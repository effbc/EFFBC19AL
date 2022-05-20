table 33000929 "Calibration Ledger Entries"
{
    // version Cal1.0

    DrillDownPageID = "Calibration List Form";
    LookupPageID = "Calibration List Form";
    PasteIsValid = false;

    fields
    {
        field(1;"Equipment No";Code[20])
        {
        }
        field(2;Description;Text[50])
        {
        }
        field(3;"Equipment Type";Option)
        {
            OptionCaption = ',DMM,Tepm.Meter,Lux Meter,Vernier,Screw Guage,Torque Meter,Potting Machine,CHAMBER,Power Meter,Burst-Generator,Surge-Generator,Voltage Interruption Simulator,Weighing Machine,RF Analyzer,Mixer,ESD ,Stacker,Air Compressor,Packing Machine,Clamp Meter,DC SUPPLY,FUNCTION GENERATOR,HV TESTER,IR Tester,LCR METER,MYDATA,Oscilloscope,DPM,Rheostat,VARIAC,CVT,Scale,Microscope,Sound Meter,De-Soldering System,Soldering System,Soldering Station,Hot Air Gun,Screw Driver,Hammer Machine,Drilling Machine,Cutting Tool,Thickness Gauge';
            OptionMembers = ,DMM,"Tepm.Meter","Lux Meter",Vernier,"Screw Guage","Torque Meter","Potting Machine",CHAMBER,"Power Meter","Burst-Generator","Surge-Generator","Voltage Interruption Simulator","Weighing Machine","RF Analyzer",Mixer,"ESD ",Stacker,"Air Compressor","Packing Machine","Clamp Meter","DC SUPPLY","FUNCTION GENERATOR","HV TESTER","IR Tester","LCR METER",MYDATA,Oscilloscope,DPM,Rheostat,VARIAC,CVT,Scale,Microscope,"Sound Meter","De-Soldering System","Soldering System","Soldering Station","Hot Air Gun","Screw Driver","Hammer Machine","Drilling Machine","Cutting Tool","Thickness Gauge";
        }
        field(4;"Unit Of Measure";Code[10])
        {
            TableRelation = "Unit of Measure";
        }
        field(5;"Least Count";Integer)
        {
        }
        field(6;"Measuring Range";Text[30])
        {
        }
        field(7;"Model No.";Text[30])
        {
        }
        field(8;"Eqpt. Serial No.";Text[30])
        {
        }
        field(9;Status;Option)
        {
            OptionMembers = "Working in Good Condition"," Reffered To Service"," Usage Subjective",Scrapped;
        }
        field(10;Location;Code[10])
        {
            TableRelation = Location;
        }
        field(11;Department;Code[20])
        {
        }
        field(12;Resource;Code[20])
        {
            TableRelation = Resource;
        }
        field(13;"Std. Reference";Code[20])
        {
            TableRelation = IF ("Usage Type"=FILTER(<>Master)) Calibration WHERE ("Usage Type"=CONST(Master));
        }
        field(14;"Usage Type";Option)
        {
            OptionMembers = Instrument,Master;
        }
        field(15;"Warranty Starting Date";Date)
        {
        }
        field(16;"Warranty Ending Date";Date)
        {
        }
        field(17;"Contract Starting Date";Date)
        {
        }
        field(18;"Contract Ending Date";Date)
        {
        }
        field(19;"Last Calibration Date";Date)
        {
        }
        field(20;"Calibration Period";DateFormula)
        {
        }
        field(21;"Next Calibration Due On";Date)
        {
        }
        field(22;"Vendor No.";Code[20])
        {
            TableRelation = Vendor;
        }
        field(23;"Vendor Name";Text[30])
        {
        }
        field(24;Address1;Text[30])
        {
        }
        field(25;Address2;Text[30])
        {
        }
        field(26;City;Text[30])
        {
        }
        field(27;"Contact Person";Text[30])
        {
        }
        field(28;"Contact Phone No.";Text[30])
        {
        }
        field(29;Manufacturer;Text[30])
        {
        }
        field(30;"MFG. Serial No.";Text[30])
        {
        }
        field(31;"Purchase Date";Date)
        {
        }
        field(32;"Service Agent";Code[20])
        {
            TableRelation = Vendor;
        }
        field(33;Name;Text[30])
        {
        }
        field(34;"E-Mail Address";Text[30])
        {
        }
        field(35;"Calibration Party";Option)
        {
            OptionMembers = Internal,External;
        }
        field(36;"Calibration Cert No./ IR No";Code[20])
        {
        }
        field(37;Results;Text[30])
        {
        }
        field(38;Recommendations;Text[30])
        {
        }
        field(39;"Response Time";DateFormula)
        {
        }
        field(40;"Expected Return Date";Date)
        {
        }
        field(41;Priority;Option)
        {
            OptionMembers = Low,Medium,High;
        }
        field(42;"Spec Id";Code[20])
        {
            TableRelation = "Specification Header";
        }
        field(43;"QC Enabled";Boolean)
        {
        }
        field(44;"S Address1";Text[30])
        {
        }
        field(45;"S Address2";Text[30])
        {
        }
        field(46;"S City";Text[30])
        {
        }
        field(47;"S Contact Person";Text[30])
        {
        }
        field(48;"S Contact Phone No.";Text[30])
        {
        }
        field(49;"Created Date";Date)
        {
        }
        field(50;"Last Modified Date";Date)
        {
        }
        field(51;"No. Series";Code[10])
        {
        }
        field(52;"Current Status";Option)
        {
            OptionMembers = " ","Under Calibration",Calibrated;
        }
        field(53;Process;Boolean)
        {
        }
        field(54;Check;Boolean)
        {
        }
        field(55;"RGP Status";Boolean)
        {
        }
        field(56;"Calib. Resource Name";Text[100])
        {
            Caption = 'Resource Name';
        }
        field(57;"IR No";Code[15])
        {
            TableRelation = "Inspection Receipt Header"."No.";
            //This property is currently not supported
            //TestTableRelation = true;
            ValidateTableRelation = false;
        }
        field(58;"Item Desc";Code[200])
        {
            Editable = false;
        }
        field(59;"Item No";Code[20])
        {
        }
        field(60;"Created By";Code[50])
        {
        }
        field(61;"Modified By";Code[50])
        {
        }
        field(62;Transfered_from;Option)
        {
            OptionMembers = ,IR,CalibrationModule;
        }
        field(63;"Unit cost(LCY)";Decimal)
        {
            Editable = false;
        }
        field(64;"Owner of the Equpmnt";Code[50])
        {
        }
        field(65;"Owner of the Equpmnt_empid";Code[70])
        {
        }
        field(66;"Owner of the Equpmnt_Dept";Code[10])
        {
        }
        field(67;Remarks;Text[250])
        {
        }
        field(68;Classification;Option)
        {
            OptionCaption = ',Blue,Green,Red,Yellow';
            OptionMembers = ,Blue,Green,Red,Yellow;
        }
        field(69;"Reason for Delay";Text[250])
        {
        }
        field(70;"Delay Days";Integer)
        {
        }
        field(71;"Entry No";Code[20])
        {
        }
        field(72;"Not an ERP Integrated";Boolean)
        {
        }
        field(73;"Master Item";Boolean)
        {
        }
        field(74;"Life Time";Date)
        {
        }
        field(75;"Previously Calibrated Times";Integer)
        {
        }
        field(76;"Life time in Yrs";Integer)
        {
        }
        field(77;mailsent;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Entry No")
        {
        }
        key(Key2;"Std. Reference")
        {
        }
        key(Key3;"Owner of the Equpmnt")
        {
        }
        key(Key4;"Owner of the Equpmnt_empid")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        "Created Date" := Today;
         "Created By" :=UserId;
    end;

    trigger OnModify();
    begin
        "Last Modified Date" := Today;
        "Modified By" := UserId;
    end;

    var
        NoSeriesMgt : Codeunit NoSeriesManagement;
        Vendor : Record Vendor;
        QCSetup : Record "Quality Control Setup";
        Text000 : Label 'Inspection Datasheet already created';
        Calibration : Record Calibration;
        Text001 : Label 'You can''t create Inspection Datasheet Bcoz status is Scrapped';
        Text002 : Label 'Inspection Receipt not yet posted';
        IRHeader : Record "Inspection Receipt Header";
        RGPOut : Record "RGP Out Header";
        RGPIn : Record "RGP In Header";
        Text003 : Label 'RGP Out exists , So you can''t create Inspection Datasheet';
        Text004 : Label 'RGP In  exists , So you can''t create Inspection Datasheet';
        PIRH : Record "Inspection Receipt Header";
        PRH : Record "Purch. Rcpt. Header";
        PRL : Record "Purch. Rcpt. Line";
        UserGrec : Record User;
}

