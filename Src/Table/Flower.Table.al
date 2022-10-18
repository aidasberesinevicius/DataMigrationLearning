table 50100 "cmp Flower"
{
    DataClassification = CustomerContent;
    DataPerCompany = true;
    Caption = 'Flower';
    LookupPageId = "cmp Flower List";
    DrillDownPageId = "cmp Flower List";

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
        }
        field(20; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(30; "Scientific Name"; Text[20])
        {
            Caption = 'Scientific Name';
        }
    }

    keys
    {
        key(PK; Code) { Clustered = true; }
    }
}