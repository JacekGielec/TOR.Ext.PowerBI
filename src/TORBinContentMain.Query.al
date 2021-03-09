/// <summary>
/// Query TOR Bin Content (ID 50657).
/// </summary>
query 50659 "TOR Bin Content Main"
{
    QueryType = Normal;
    DataAccessIntent = ReadOnly;

    elements
    {
        dataitem(Bin_Content; "Bin Content")
        {
            DataItemTableFilter = "Location Code" = const('MAIN');

            column(Location_Code; "Location Code")
            {

            }
            column(Bin_Code; "Bin Code")
            {

            }
            column(Item_No_; "Item No.")
            {

            }
            column(Quantity; Quantity)
            {

            }

            dataitem(Item; Item)
            {
                DataItemLink = "No." = Bin_Content."Item No.";
                column(Description; Description)
                {

                }
                column(Item_Type; "Item Type")
                {

                }
            }

        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}