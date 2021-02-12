/// <summary>
/// Query TOR Bin Content (ID 50657).
/// </summary>
query 50657 "TOR Bin Content"
{
    QueryType = Normal;

    elements
    {
        dataitem(Bin_Content; "Bin Content")
        {
            DataItemTableFilter = "Location Code" = const('EXT');

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
            }

        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}