/// <summary>
/// Query TOR Value Entries (ID 50650).
/// </summary>
query 50662 "TOR Value Entries API"
{
    QueryType = API;
    APIPublisher = 'torggler';
    APIGroup = 'powerBi';
    APIVersion = 'v2.0';
    Caption = 'TOR Value Entries  API', Locked = true;
    EntityName = 'torValueEntry';
    EntitySetName = 'torValueEntries';
    DataAccessIntent = ReadOnly;

    elements
    {
        dataitem(ValueEntry; "Value Entry")
        {
            column(salespersPurchCode; "Salespers./Purch. Code")
            {
            }
            /*
            filter(Posting_Date;"Posting Date")
            {

            }
            */
            column(postingDate; "Posting Date")
            {
            }
            column(itemNo; "Item No.")
            {
            }
            column(sourceType; "Source Type")
            {
            }
            column(sourceNo; "Source No.")
            {
            }
            column(documentType; "Document Type")
            {
            }
            column(documentNo; "Document No.")
            {
            }
            column(globalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(documentLineNo; "Document Line No.")
            {
            }
            column(itemChargeNo; "Item Charge No.")
            {
            }
            column(genProdPostingGroup; "Gen. Prod. Posting Group")
            {
            }
            column(salesAmountActual; "Sales Amount (Actual)")
            {
                Method = Sum;
            }
            column(costAmountActual; "Cost Amount (Actual)")
            {
                Method = Sum;
            }
            column(costAmountExpected; "Cost Amount (Expected)")
            {
                Method = Sum;
            }
            column(costAmountNonInvtbl; "Cost Amount (Non-Invtbl.)")
            {
                Method = Sum;
            }
            column(invoicedQuantity; "Invoiced Quantity")
            {
                Method = Sum;
            }
            dataitem(ItemLedgerEntry; "Item Ledger Entry")
            {
                DataItemLink = "Entry No." = ValueEntry."Item Ledger Entry No.";
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                {
                }
            }
        }
    }

    trigger OnBeforeOpen()
    begin
        //Limit data to full last year + this year
        CurrQuery.SetFilter(PostingDate, '>=%1&<=%2', CALCDATE('<-1Y-CY>', WORKDATE()), CALCDATE('<CY>', WORKDATE()));
    end;
}
