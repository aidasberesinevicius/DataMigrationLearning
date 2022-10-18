table 50101 "cmp Customer Flower"
{
    DataClassification = CustomerContent;
    Caption = 'Customer Flower';
    LookupPageId = "cmp Customer Flower List";
    DrillDownPageId = "cmp Customer Flower List";

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer;
        }
        field(2; "Flower Code"; Code[10])
        {
            Caption = 'Flower Code';
            TableRelation = "cmp Flower";
        }
        field(20; Description; Text[100])
        {
            Caption = 'Description';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("cmp Flower".Description where(Code = field("Flower Code")));
        }
    }

    keys
    {
        key(PK; "Customer No.", "Flower Code") { Clustered = true; }
    }
}