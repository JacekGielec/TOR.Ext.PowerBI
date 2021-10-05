query 50666 "Item Categories Api"
{
    QueryType = API;
    APIPublisher = 'torggler';
    APIGroup = 'powerBi';
    APIVersion = 'v2.0';
    Caption = 'Item Categories API', Locked = true;
    EntityName = 'itemCategory';
    EntitySetName = 'itemCategories';
    DataAccessIntent = ReadOnly;

    elements
    {
        dataitem(ItemCategory; "Item Category")
        {
            column(code; Code) { }
            column(description; Description) { }
        }
    }
}
