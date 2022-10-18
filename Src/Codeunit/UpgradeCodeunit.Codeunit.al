codeunit 50100 "cmp Upgrade Codeunit"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    var
        UpgradeTag: Codeunit "Upgrade Tag";
        CustomerFlowerSchemaChangesTagTok: Label 'cmp-customerflowerschemachanges-20221018', Locked = true;
    begin
        if UpgradeTag.HasUpgradeTag(CustomerFlowerSchemaChangesTagTok) then
            exit;

        UpgradeCustomerFlowers();

        UpgradeTag.SetUpgradeTag(CustomerFlowerSchemaChangesTagTok);
    end;

    trigger OnUpgradePerDatabase()
    var
        UpgradeTag: Codeunit "Upgrade Tag";
        FlowerSchemaChangesTagTok: Label 'cmp-flowerschemachanges-20221018', Locked = true;
    begin
        if UpgradeTag.HasUpgradeTag(FlowerSchemaChangesTagTok) then
            exit;

        UpgradeFlowers();

        UpgradeTag.SetUpgradeTag(FlowerSchemaChangesTagTok);
    end;

    local procedure UpgradeCustomerFlowers()
    var
        CustomerFlowerNew: Record "cmp Customer Flower 2";
        CustomerFlowerOld: Record "cmp Customer Flower";
        TableDataTransfer: DataTransfer;
    begin
        TableDataTransfer.SetTables(Database::"cmp Customer Flower", Database::"cmp Customer Flower 2");
        TableDataTransfer.AddFieldValue(CustomerFlowerOld.FieldNo("Customer No."), CustomerFlowerNew.FieldNo("Customer No."));
        TableDataTransfer.AddFieldValue(CustomerFlowerOld.FieldNo("Flower Code"), CustomerFlowerNew.FieldNo("Flower Code"));
        TableDataTransfer.CopyRows();
        Clear(TableDataTransfer);
    end;

    local procedure UpgradeFlowers()
    var
        Flower: Record "cmp Flower";
    begin
        if Flower.FindSet() then
            repeat
                Flower.Validate("Scientific Name 2", Flower."Scientific Name");
                Flower.Modify(true);
            until Flower.Next() = 0;
    end;
}