pageextension 70022 BlanketSalesOrdersExt extends 9303
{


    layout
    {






        addafter("Sell-to Customer Name")
        {
            field(Status; Status)
            {
            }
        }
        addafter("Currency Code")
        {
            field("Payment Terms Code"; Rec."Payment Terms Code")
            {
            }
            field(Remarks; Remarks)
            {
            }
            field("Customer Posting Group"; Rec."Customer Posting Group")
            {
            }
            group(Control1102152003)
            {
                Editable = false;
                ShowCaption = false;
                grid(Control1102152002)
                {
                    ShowCaption = false;
                    group(Control1102152001)
                    {
                        ShowCaption = false;
                        field("TotalOrders+FORMAT(Rec.COUNT)"; TotalOrders + FORMAT(Rec.COUNT))
                        {
                            Editable = false;
                        }
                    }
                }
            }
        }
    }
    actions
    {



        modify(Statistics)
        {
            Promoted = true;
        }



        modify("Make &Order")
        {
            Promoted = true;



        }
        modify(Print)
        {



            Promoted = true;
        }



    }




    var
        UserMgt: Codeunit "User Setup Management";
        TotalOrders: Label '"Total Orders: "';




}

