/// <summary>
/// Query TOR Item Categories (ID 50654).
/// </summary>
query 50654 "TOR Item Categories"
{
    QueryType = Normal;
    DataAccessIntent = ReadOnly;

    elements
    {
        dataitem(ItemCategory; "Item Category")
        {
            column(Code; Code)
            {
            }
            column(Description; Description)
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
