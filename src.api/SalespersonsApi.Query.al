query 50670 "Salespersons Api"
{
    QueryType = API;
    APIPublisher = 'torggler';
    APIGroup = 'powerBi';
    APIVersion = 'v2.0';
    Caption = 'Salespersons API', Locked = true;
    EntityName = 'salesperson';
    EntitySetName = 'salespersons';
    DataAccessIntent = ReadOnly;

    elements
    {
        dataitem(SalespersonPurchaser; "Salesperson/Purchaser")
        {
            column(code; Code) { }
            column(name; Name) { }
            column(eastWest; "East / West") { }
            column(eosVendorNo; "EOS Vendor No.") { }
            column(eosSettlementType; "EOS Settlement Type") { }
            column(eosSettlementPeriod; "EOS Settlement Period") { }
        }
    }
}