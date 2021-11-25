/// <summary>
/// Query TOR Items (ID 50655).
/// </summary>
query 50655 "TOR Items"
{
    QueryType = Normal;
    DataAccessIntent = ReadOnly;

    elements
    {
        dataitem(Item; Item)
        {
            column(No; "No.")
            {
            }
            column(Description; Description)
            {
            }
            column(ItemCategoryCode; "Item Category Code")
            {
            }
            column(BaseUnitofMeasure; "Base Unit of Measure")
            {
            }
            column(QtyonSalesOrder; "Qty. on Sales Order")
            {
            }
            column(QtyonPurchOrder; "Qty. on Purch. Order")
            {
            }
            column(UnitCost; "Unit Cost")
            {
            }
            column(GenProdPostingGroup; "Gen. Prod. Posting Group")
            {
            }
            column(VendorNo; "Vendor No.")
            {
            }
            column(EOS_Commission_Group_Code; "EOS Commission Group Code")
            {
            }
            column(Inventory; Inventory)
            {
            }
            column(ITI_PKWiU; "ITI PKWiU")
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
