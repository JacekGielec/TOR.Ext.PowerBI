// +---------------------------------------------------------+
// | Torggler                                                |
// +---------------------------------------------------------+
// Module					Date			ID		Description
// TG-TDAG00000-001			02.03.21		dho         creation

/// <summary>
/// Query TOR Salespersons (ID 50658).
/// </summary>
query 50658 "TOR Salespersons"
{
    QueryType = Normal;
    DataAccessIntent = ReadOnly;

    elements
    {
        dataitem(Salesperson_Purchaser; "Salesperson/Purchaser")
        {
            column(Code; Code) { }
            column(Name; Name) { }
            column(EastWest; "East / West") { }
            column(EOS_Vendor_No_; "EOS Vendor No.") { }
            column(EOS_Settlement_Type; "EOS Settlement Type") { }
            column(EOS_Settlement_Period; "EOS Settlement Period") { }
        }
    }
}