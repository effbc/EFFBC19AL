tableextension 70000 PaymentTermsExt extends "Payment Terms"
{

    fields
    {
        modify(Code)
        {
            trigger OnBeforeValidate()
            begin
                TESTFIELD("Update In Cashflow", FALSE);

            end;
        }
        modify("Due Date Calculation")
        {
            trigger OnBeforeValidate()

            begin
                TESTFIELD("Update In Cashflow", FALSE);
            end;

        }

        modify("Discount Date Calculation")
        {
            trigger OnBeforeValidate()

            begin
                TESTFIELD("Update In Cashflow", FALSE);
            end;

        }

        modify("Discount %")
        {
            trigger OnBeforeValidate()

            begin
                TESTFIELD("Update In Cashflow", FALSE);
            end;

        }
        modify(Description)
        {
            trigger OnBeforeValidate()

            begin
                TESTFIELD("Update In Cashflow", FALSE);
            end;

        }

        modify("Calc. Pmt. Disc. on Cr. Memos")
        {
            trigger OnBeforeValidate()

            begin
                TESTFIELD("Update In Cashflow", FALSE);
            end;

        }


        field(60000; Rating; Decimal)
        {
            Description = 'POAU';

            trigger OnValidate();
            begin
                TestField("Update In Cashflow", false);
            end;
        }
        field(60001; "Update In Cashflow"; Boolean)
        {

            trigger OnValidate();
            begin
                UpdateInCashFlow(Rec);    // Added by Pranavi on 25-Jul-2015
            end;
        }
        field(60002; "Percentage 1"; Integer)
        {

            trigger OnValidate();
            begin
                TestField("Update In Cashflow", false);
                // added by pranavi on 29-09-2016 for pvt payment terms integration
                if "Stage 1" = "Stage 1"::" " then
                    Error('Please enter Stage 1 value first!');
                // end by pranavi
            end;
        }
        field(60003; "Percentage 2"; Integer)
        {

            trigger OnValidate();
            begin
                TestField("Update In Cashflow", false);
                // added by pranavi on 29-09-2016 for pvt payment terms integration
                if ("Percentage 1" = 0) then
                    Error('Percentage 1 must be entered first!');

                if "Stage 2" = "Stage 2"::" " then
                    Error('Please enter Stage 2 value first!');

                // end by pranavi
            end;
        }
        field(60004; "Stage 1"; Option)
        {
            OptionMembers = " ",Advance,Delivery,Credit,Against_RDSO_IC,Before_Delivery;

            trigger OnValidate();
            begin
                TestField("Update In Cashflow", false);
            end;
        }
        field(60005; "Stage 2"; Option)
        {
            OptionMembers = " ",Advance,Delivery,Credit,Against_RDSO_IC,Before_Delivery;

            trigger OnValidate();
            begin
                TestField("Update In Cashflow", false);
            end;
        }
        field(60006; Purchase; Boolean)
        {

            trigger OnValidate();
            begin
                TestField("Update In Cashflow", false);
            end;
        }
        field(60007; Sales; Boolean)
        {

            trigger OnValidate();
            begin
                TestField("Update In Cashflow", false);
            end;
        }
        field(60008; "Percentage 3"; Integer)
        {

            trigger OnValidate();
            begin
                //pranavi
                TestField("Update In Cashflow", false);

                if ("Percentage 1" = 0) then
                    Error('Percentage 1 must be entered first!');

                if ("Percentage 2" = 0) then
                    Error('Percentage 2 must be entered first!');

                // added by pranavi on 29-09-2016 for pvt payment terms integration
                if "Stage 3" = "Stage 3"::" " then
                    Error('Please enter Stage 3 value first!');
                // end by pranavi
            end;
        }
        field(60009; "Stage 3"; Option)
        {
            OptionMembers = " ",Advance,Delivery,Credit,Against_RDSO_IC,Before_Delivery;

            trigger OnValidate();
            begin
                // TESTFIELD("Update In Cashflow",FALSE);     //pranavi
            end;
        }
        field(60010; DueDays; Integer)
        {
            Description = 'Added by sujani on 24-04-2018';
        }
    }
    trigger OnModify()
    var
        myInt: Integer;
    begin
        // added by pranavi on 29-09-2016 for pvt payment terms integration
        IF NOT (Code IN ['ASPERTENDR', 'ASPERMNC']) THEN BEGIN
            IF ("Percentage 1" + "Percentage 2" + "Percentage 3") <> 100 THEN
                ERROR('PLEASE ENTER THE "PERCENTAGES" VALUES CORRECTLY ,SUM OF PERCENTAGE 1,PERCENTAGE 2,PERCENTAGE 3 SHOULD EQUAL TO 100');

            IF ("Stage 1" = "Stage 1"::Credit) OR ("Stage 2" = "Stage 2"::Credit) OR ("Stage 3" = "Stage 3"::Credit) THEN BEGIN
                IF FORMAT("Due Date Calculation") = '' THEN
                    ERROR('PLEASE ENTER THE CREDIT PERIOD');
            END;

        END;

    end;


    PROCEDURE UpdateInCashFlows(PT: Record "Payment Terms");
    BEGIN
        // Code From Updated in Cahsflow on validate for code re-usability on 25-07=2-16
        UserGRec.RESET;
        UserGRec.SETFILTER(UserGRec."User Name", USERID);
        IF UserGRec.FINDFIRST THEN BEGIN
            IF PT."Update In Cashflow" THEN BEGIN
                IF NOT (Code IN ['ASPERTENDR', 'ASPERMNC']) THEN BEGIN
                    IF FORMAT(PT."Stage 1") = ' ' THEN BEGIN
                        IF PT."Percentage 1" > 0 THEN
                            ERROR('PLEASE ENTER THE STAGE 1');
                    END;
                    IF FORMAT(PT."Stage 1") <> ' ' THEN BEGIN
                        IF PT."Percentage 1" = 0 THEN
                            ERROR('PLEASE ENTER THE PERCENTAGE 1');
                    END;
                    IF FORMAT(PT."Stage 2") = ' ' THEN BEGIN
                        IF PT."Percentage 2" > 0 THEN
                            ERROR('PLEASE ENTER THE STAGE 2');
                    END;
                    IF FORMAT(PT."Stage 2") <> ' ' THEN BEGIN
                        IF PT."Percentage 2" = 0 THEN
                            ERROR('PLEASE ENTER THE PERCENTAGE 2');
                    END;
                    //Added By Pranavi on 22-09-2015 for 3rd Payment Terms
                    IF FORMAT(PT."Stage 3") = ' ' THEN BEGIN
                        IF PT."Percentage 3" > 0 THEN
                            ERROR('PLEASE ENTER THE STAGE 3');
                    END;
                    IF FORMAT(PT."Stage 3") <> ' ' THEN BEGIN
                        IF PT."Percentage 3" = 0 THEN
                            ERROR('PLEASE ENTER THE PERCENTAGE 3');
                    END;

                    //End By Pranavi
                    IF (PT."Percentage 1" + PT."Percentage 2" + PT."Percentage 3") <> 100 THEN
                        ERROR('PLEASE ENTER THE "PERCENTAGES" VALUES CORRECTLY ,SUM OF PERCENTAGE 1,PERCENTAGE 2,PERCENTAGE 3 SHOULD EQUAL TO 100');

                    IF (PT."Stage 1" = PT."Stage 1"::Credit) OR (PT."Stage 2" = PT."Stage 2"::Credit) OR (PT."Stage 3" = PT."Stage 3"::Credit) THEN BEGIN
                        IF FORMAT(PT."Due Date Calculation") = '' THEN
                            ERROR('PLEASE ENTER THE CREDIT PERIOD');
                    END;

                END;
                // Added by Pranavi on 25-JUl=2016 as part of payment terms process
                IF FORMAT(PT."Stage 1") IN ['Against_RDSO_IC', 'Before_Delivery'] THEN
                    Stage1Txt := Stage1Txt::Delivery
                ELSE
                    Stage1Txt := PT."Stage 1";

                IF FORMAT(PT."Stage 2") IN ['Against_RDSO_IC', 'Before_Delivery'] THEN
                    Stage2Txt := Stage2Txt::Delivery
                ELSE
                    Stage2Txt := PT."Stage 2";

                IF FORMAT(PT."Stage 3") IN ['Against_RDSO_IC', 'Before_Delivery'] THEN
                    Stage3Txt := Stage3Txt::Delivery
                ELSE
                    Stage3Txt := PT."Stage 3";
                // End by Pranavi

                IF PT.Sales = TRUE THEN
                    SalesFlag := 1
                ELSE
                    SalesFlag := 0;
                IF PT.Purchase = TRUE THEN
                    PurchaseFlag := 1
                ELSE
                    PurchaseFlag := 0;

                IF PT."Percentage 1" = 100 THEN BEGIN
                    qry_text := 'INSERT INTO PAYMENT_TERMS (TERM_ID,PAYMENT_TERM_CODE,PERCENTAGE,CREDIT_PERIOD_ALLOWED, ' +
                      ' CONSIDER_TAX,STAGE,ACTINACT,USERID,SALES,PURCHASE,PT_DESCRIPTION,CREDIT_DAYS) VALUES (SEQ_TERM_ID.NEXTVAL, ''' + PT.Code + ''', ''' + FORMAT(PT."Percentage 1") + ''', ''' +
                      FORMAT(PT."Due Date Calculation") + ''', 1, ''' + FORMAT(Stage1Txt) + ''', 1, ''' + UserGRec.EmployeeID + ''', ' + FORMAT(SalesFlag) + ', ' + FORMAT(PurchaseFlag) + ', ''' + FORMAT(Description) + ''',' + FORMAT(PT.DueDays) + ')';
                    //    MESSAGE(qry_text);
                    CashFlowConnection.ExecInOracle('INSERT INTO PAYMENT_TERMS (TERM_ID,PAYMENT_TERM_CODE,PERCENTAGE,CREDIT_PERIOD_ALLOWED, ' +
                      ' CONSIDER_TAX,STAGE,ACTINACT,USERID,SALES,PURCHASE,PT_DESCRIPTION,CREDIT_DAYS) VALUES (SEQ_TERM_ID.NEXTVAL, ''' + PT.Code + ''', ''' + FORMAT(PT."Percentage 1") + ''', ''' +
                      FORMAT(PT."Due Date Calculation") + ''', 1, ''' + FORMAT(Stage1Txt) + ''', 1, ''' + UserGRec.EmployeeID + ''', ' + FORMAT(SalesFlag) + ', ' + FORMAT(PurchaseFlag) + ', ''' + FORMAT(Description) + ''',' + FORMAT(PT.DueDays) + ')');
                END ELSE BEGIN
                    IF (PT."Percentage 3" = 0) THEN BEGIN
                        qry_text := 'INSERT INTO PAYMENT_TERMS (TERM_ID,PAYMENT_TERM_CODE,PERCENTAGE,CREDIT_PERIOD_ALLOWED, ' +
                          ' CONSIDER_TAX,STAGE,ACTINACT,USERID,SALES,PURCHASE,PT_DESCRIPTION,CREDIT_DAYS) VALUES (SEQ_TERM_ID.NEXTVAL, ''' + PT.Code + ''', ''' + FORMAT(PT."Percentage 1") + ''', ''' +
                          FORMAT(PT."Due Date Calculation") + ''', 0, ''' + FORMAT(Stage1Txt) + ''', 1, ''' + UserGRec.EmployeeID + ''', ' + FORMAT(SalesFlag) + ', ' + FORMAT(PurchaseFlag) + ', ''' + FORMAT(Description) + ''',' + FORMAT(PT.DueDays) + ')';
                        // MESSAGE(qry_text);
                        CashFlowConnection.ExecInOracle('INSERT INTO PAYMENT_TERMS (TERM_ID,PAYMENT_TERM_CODE,PERCENTAGE,CREDIT_PERIOD_ALLOWED, ' +
                          ' CONSIDER_TAX,STAGE,ACTINACT,USERID,SALES,PURCHASE,PT_DESCRIPTION,CREDIT_DAYS) VALUES (SEQ_TERM_ID.NEXTVAL, ''' + PT.Code + ''', ''' + FORMAT(PT."Percentage 1") + ''', ''' +
                          FORMAT(PT."Due Date Calculation") + ''', 0, ''' + FORMAT(Stage1Txt) + ''', 1, ''' + UserGRec.EmployeeID + ''', ' + FORMAT(SalesFlag) + ', ' + FORMAT(PurchaseFlag) + ', ''' + FORMAT(Description) + ''',' + FORMAT(PT.DueDays) + ')');
                        qry_text := 'INSERT INTO PAYMENT_TERMS (TERM_ID,PAYMENT_TERM_CODE,PERCENTAGE,CREDIT_PERIOD_ALLOWED, ' +
                          ' CONSIDER_TAX,STAGE,ACTINACT,USERID,SALES,PURCHASE,PT_DESCRIPTION,CREDIT_DAYS) VALUES (SEQ_TERM_ID.NEXTVAL, ''' + PT.Code + ''', ''' + FORMAT(PT."Percentage 2") + ''', ''' +
                          FORMAT(PT."Due Date Calculation") + ''', 1, ''' + FORMAT(Stage2Txt) + ''', 1, ''' + UserGRec.EmployeeID + ''', ' + FORMAT(SalesFlag) + ', ' + FORMAT(PurchaseFlag) + ', ''' + FORMAT(Description) + ''',' + FORMAT(PT.DueDays) + ')';
                        //      MESSAGE(qry_text);
                        CashFlowConnection.ExecInOracle('INSERT INTO PAYMENT_TERMS (TERM_ID,PAYMENT_TERM_CODE,PERCENTAGE,CREDIT_PERIOD_ALLOWED, ' +
                          ' CONSIDER_TAX,STAGE,ACTINACT,USERID,SALES,PURCHASE,PT_DESCRIPTION,CREDIT_DAYS) VALUES (SEQ_TERM_ID.NEXTVAL, ''' + PT.Code + ''', ''' + FORMAT(PT."Percentage 2") + ''', ''' +
                          FORMAT(PT."Due Date Calculation") + ''', 1, ''' + FORMAT(Stage2Txt) + ''', 1, ''' + UserGRec.EmployeeID + ''', ' + FORMAT(SalesFlag) + ', ' + FORMAT(PurchaseFlag) + ', ''' + FORMAT(Description) + ''',' + FORMAT(PT.DueDays) + ')');
                    END
                    ELSE BEGIN
                        qry_text := 'INSERT INTO PAYMENT_TERMS (TERM_ID,PAYMENT_TERM_CODE,PERCENTAGE,CREDIT_PERIOD_ALLOWED, ' +
                          ' CONSIDER_TAX,STAGE,ACTINACT,USERID,SALES,PURCHASE,PT_DESCRIPTION,CREDIT_DAYS) VALUES (SEQ_TERM_ID.NEXTVAL, ''' + PT.Code + ''', ''' + FORMAT(PT."Percentage 1") + ''', ''' +
                          FORMAT(PT."Due Date Calculation") + ''', 0, ''' + FORMAT(Stage1Txt) + ''', 1, ''' + UserGRec.EmployeeID + ''', ' + FORMAT(SalesFlag) + ', ' + FORMAT(PurchaseFlag) + ', ''' + FORMAT(Description) + ''',' + FORMAT(PT.DueDays) + ')';
                        //      MESSAGE(qry_text);
                        CashFlowConnection.ExecInOracle('INSERT INTO PAYMENT_TERMS (TERM_ID,PAYMENT_TERM_CODE,PERCENTAGE,CREDIT_PERIOD_ALLOWED, ' +
                          ' CONSIDER_TAX,STAGE,ACTINACT,USERID,SALES,PURCHASE,PT_DESCRIPTION,CREDIT_DAYS) VALUES (SEQ_TERM_ID.NEXTVAL, ''' + PT.Code + ''', ''' + FORMAT(PT."Percentage 1") + ''', ''' +
                          FORMAT(PT."Due Date Calculation") + ''', 0, ''' + FORMAT(Stage1Txt) + ''', 1, ''' + UserGRec.EmployeeID + ''', ' + FORMAT(SalesFlag) + ', ' + FORMAT(PurchaseFlag) + ', ''' + FORMAT(Description) + ''',' + FORMAT(PT.DueDays) + ')');
                        qry_text := 'INSERT INTO PAYMENT_TERMS (TERM_ID,PAYMENT_TERM_CODE,PERCENTAGE,CREDIT_PERIOD_ALLOWED, ' +
                          ' CONSIDER_TAX,STAGE,ACTINACT,USERID,SALES,PURCHASE,PT_DESCRIPTION,CREDIT_DAYS) VALUES (SEQ_TERM_ID.NEXTVAL, ''' + PT.Code + ''', ''' + FORMAT(PT."Percentage 2") + ''', ''' +
                          FORMAT(PT."Due Date Calculation") + ''', 0, ''' + FORMAT(Stage2Txt) + ''', 1, ''' + UserGRec.EmployeeID + ''', ' + FORMAT(SalesFlag) + ', ' + FORMAT(PurchaseFlag) + ', ''' + FORMAT(Description) + ''',' + FORMAT(PT.DueDays) + ')';
                        //      MESSAGE(qry_text);
                        CashFlowConnection.ExecInOracle('INSERT INTO PAYMENT_TERMS (TERM_ID,PAYMENT_TERM_CODE,PERCENTAGE,CREDIT_PERIOD_ALLOWED, ' +
                          ' CONSIDER_TAX,STAGE,ACTINACT,USERID,SALES,PURCHASE,PT_DESCRIPTION,CREDIT_DAYS) VALUES (SEQ_TERM_ID.NEXTVAL, ''' + PT.Code + ''', ''' + FORMAT(PT."Percentage 2") + ''', ''' +
                          FORMAT(PT."Due Date Calculation") + ''', 0, ''' + FORMAT(Stage2Txt) + ''', 1, ''' + UserGRec.EmployeeID + ''', ' + FORMAT(SalesFlag) + ', ' + FORMAT(PurchaseFlag) + ', ''' + FORMAT(Description) + ''',' + FORMAT(PT.DueDays) + ')');
                        qry_text := 'INSERT INTO PAYMENT_TERMS (TERM_ID,PAYMENT_TERM_CODE,PERCENTAGE,CREDIT_PERIOD_ALLOWED, ' +
                          ' CONSIDER_TAX,STAGE,ACTINACT,USERID,SALES,PURCHASE,PT_DESCRIPTION,CREDIT_DAYS) VALUES (SEQ_TERM_ID.NEXTVAL, ''' + PT.Code + ''', ''' + FORMAT(PT."Percentage 3") + ''', ''' +
                          FORMAT(PT."Due Date Calculation") + ''', 1, ''' + FORMAT(Stage3Txt) + ''', 1, ''' + UserGRec.EmployeeID + ''', ' + FORMAT(SalesFlag) + ', ' + FORMAT(PurchaseFlag) + ', ''' + FORMAT(Description) + ''',' + FORMAT(PT.DueDays) + ')';
                        //      MESSAGE(qry_text);
                        CashFlowConnection.ExecInOracle('INSERT INTO PAYMENT_TERMS (TERM_ID,PAYMENT_TERM_CODE,PERCENTAGE,CREDIT_PERIOD_ALLOWED, ' +
                          ' CONSIDER_TAX,STAGE,ACTINACT,USERID,SALES,PURCHASE,PT_DESCRIPTION,CREDIT_DAYS) VALUES (SEQ_TERM_ID.NEXTVAL, ''' + PT.Code + ''', ''' + FORMAT(PT."Percentage 3") + ''', ''' +
                          FORMAT(PT."Due Date Calculation") + ''', 1, ''' + FORMAT(Stage3Txt) + ''', 1, ''' + UserGRec.EmployeeID + ''', ' + FORMAT(SalesFlag) + ', ' + FORMAT(PurchaseFlag) + ', ''' + FORMAT(Description) + ''',' + FORMAT(PT.DueDays) + ')');
                    END;
                END;
            END ELSE BEGIN
                "Purchase Header".SETRANGE("Purchase Header"."Payment Terms Code", PT.Code);
                IF "Purchase Header".FIND('-') THEN BEGIN
                    //  ERROR('THERE ARE SOME PURCHASE ORDERS WITH THIS PAYMENT TERMS, PLEASE CREATE NEW TERMS');
                    PT."Update In Cashflow" := TRUE;
                END;
                SalesHeader.RESET;
                SalesHeader.SETRANGE(SalesHeader."Payment Terms Code", PT.Code);
                IF SalesHeader.FINDFIRST THEN BEGIN
                    //  ERROR('THERE ARE SOME SALE ORDERS WITH THIS PAYMENT TERMS, PLEASE CREATE NEW TERMS');
                    PT."Update In Cashflow" := TRUE;
                END;
                CashFlowConnection.ExecInOracle('UPDATE PAYMENT_TERMS SET ACTINACT = 0 WHERE PAYMENT_TERM_CODE = ''' + PT.Code + ''' ');

            END;
        END;
        // End by Pranavi
    END;





    var
        "Purchase Header": Record "Purchase Header";
        PaymentTermsTranslation: Record "Payment Term Translation";
        UserGRec: Record User;
        Stage1Txt: Option " ",Advance,Delivery,Credit;
        Stage2Txt: Option " ",Advance,Delivery,Credit;
        Stage3Txt: Option " ",Advance,Delivery,Credit;
        SalesFlag: Integer;
        PurchaseFlag: Integer;
        SalesHeader: Record "Sales Header";
        qry_text: Text;
        CashFlowConnection: Codeunit "Cash Flow Connection";
}

