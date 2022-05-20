page 60241 "PCB List"
{
    CardPageID = "PCB Card";
    PageType = List;
    SourceTable = PCB;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("PCB No.";"PCB No.")
                {
                }
                field(Description;Description)
                {
                }
                field("PCB Thickness";"PCB Thickness")
                {
                    Caption = 'PCB Thickness(In mm)';
                }
                field("Copper Clad Thinkness";"Copper Clad Thinkness")
                {
                    Caption = 'Copper Clad Thinkness(In Microns)';
                }
                field("PCB Area";"PCB Area")
                {
                    Caption = 'PCB Area(In Sq Cm)';
                }
                field(Length;Length)
                {
                    Caption = 'Length(In mm)';
                }
                field(Width;Width)
                {
                    Caption = 'Width(In mm)';
                }
                field("PCB Shape";"PCB Shape")
                {
                }
                field("Soldering Area";"Soldering Area")
                {
                }
                field("On C-side";"On C-side")
                {
                }
                field("On D-side";"On D-side")
                {
                }
                field("On S-side";"On S-side")
                {
                }
                field(Stencil;Stencil)
                {
                    LookupPageID = "Stencil List";
                }
                field("Double Side Stencil";"Double Side Stencil")
                {
                    LookupPageID = "Stencil List";
                }
            }
        }
    }

    actions
    {
    }
}

