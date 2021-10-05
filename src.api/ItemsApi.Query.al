query 50667 "Items Api"
{
    QueryType = API;
    APIPublisher = 'torggler';
    APIGroup = 'powerBi';
    APIVersion = 'v2.0';
    Caption = 'Items API', Locked = true;
    EntityName = 'item';
    EntitySetName = 'items';
    DataAccessIntent = ReadOnly;

    elements
    {
        dataitem(Item; Item)
        {
            column(no; "No.") { }
            column(description; Description) { }
            column(itemCategoryCode; "Item Category Code") { }
            column(baseUnitofMeasure; "Base Unit of Measure") { }
            column(qtyonSalesOrder; "Qty. on Sales Order") { }
            column(qtyonPurchOrder; "Qty. on Purch. Order") { }
            column(unitCost; "Unit Cost") { }
            column(genProdPostingGroup; "Gen. Prod. Posting Group") { }
            column(vendorNo; "Vendor No.") { }
            column(eosCommissionGroupCode; "EOS Commission Group Code") { }
            column(inventory; Inventory) { }
        }
    }
}
