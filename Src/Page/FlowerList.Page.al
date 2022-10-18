page 50101 "cmp Flower List"
{
    ApplicationArea = All;
    Caption = 'Flowers';
    PageType = List;
    SourceTable = "cmp Flower";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Code; Rec.Code)
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Scientific Name"; Rec."Scientific Name")
                {
                    ToolTip = 'Specifies the value of the Scientific Name field.';
                }
            }
        }
    }
}
