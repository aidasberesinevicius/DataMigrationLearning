codeunit 50100 "cmp Upgrade Codeunit"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    begin
        if CheckDataVersionValid() then
            UpgradeCustomerFlowers();
    end;

    trigger OnUpgradePerDatabase()
    begin
        if CheckDataVersionValid() then
            UpgradeFlowers();
    end;

    local procedure CheckDataVersionValid(): Boolean
    var
        ModuleInfo: ModuleInfo;
    begin
        if NavApp.GetCurrentModuleInfo(ModuleInfo) then
            if ModuleInfo.DataVersion = Version.Create(0, 0, 0, 0) then
                exit(true);
    end;

    local procedure UpgradeCustomerFlowers()
    var
        TableDataTransfer: DataTransfer;
    begin
        TableDataTransfer.SetTables(Database::"cmp Customer Flower", Database::"cmp Customer Flower 2");
        TableDataTransfer.CopyFields();
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