page 60240 "PCB Card"
{
    PageType = Card;
    SourceTable = PCB;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("PCB No."; "PCB No.")
                {
                }
                field(Description; Description)
                {
                }
                field("PCB Thickness"; "PCB Thickness")
                {
                    Caption = 'PCB Thickness (In mm)';
                }
                field("Copper Clad Thinkness"; "Copper Clad Thinkness")
                {
                    Caption = 'Copper Clad Thinkness(In Microns)';
                }
                field("PCB Area"; "PCB Area")
                {
                    Caption = 'PCB Area(In Sq cm)';
                }
                field(Length; Length)
                {
                    Caption = 'Length(In mm)';
                }
                field(Width; Width)
                {
                    Caption = 'Width(In mm)';
                }
                field("PCB Shape"; "PCB Shape")
                {
                }
                field("On C-side"; "On C-side")
                {
                }
                field("On D-side"; "On D-side")
                {
                }
                field("On S-side"; "On S-side")
                {
                }
                field(Stencil; Stencil)
                {
                    Caption = 'C Side Stencil';
                    LookupPageID = "Stencil List";
                }
                field("Double Side Stencil"; "Double Side Stencil")
                {
                    Caption = 'D Side Stencil';
                    LookupPageID = "Stencil List";
                }
                field("Soldering Area"; "Soldering Area")
                {
                }
                field("Master PCB"; "Master PCB")
                {
                }
                field(Multiples_Per_Stencil; Multiples_Per_Stencil)
                {
                }
            }
        }
    }

    actions
    {
    }
}

