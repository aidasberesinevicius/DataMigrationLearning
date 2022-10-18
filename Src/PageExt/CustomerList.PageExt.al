pageextension 50100 "cmp Customer List" extends "Customer List"
{
    actions
    {
        addafter(CustomerLedgerEntries_Promoted)
        {
            actionref(cmpFlowers_Promoted; cmpFlowers) { }
        }
        addafter(CustomerLedgerEntries)
        {
            action(cmpFlowers)
            {
                ApplicationArea = Suite;
                Caption = 'Flowers';
                Image = AllocatedCapacity;
                RunObject = page "cmp Customer Flower List";
                RunPageLink = "Customer No." = field("No.");
                ToolTip = 'Executes the Flowers action.';
            }
        }
    }
}