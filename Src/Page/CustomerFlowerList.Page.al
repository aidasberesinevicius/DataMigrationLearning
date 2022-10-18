page 50100 "cmp Customer Flower List"
{
    Caption = 'Customer Flowers';
    PageType = List;
    SourceTable = "cmp Customer Flower";
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Flower Code"; Rec."Flower Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Flower Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}