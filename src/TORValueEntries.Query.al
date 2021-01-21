/// <summary>
/// Query TOR Value Entries (ID 50650).
/// </summary>
query 50650 "TOR Value Entries"
{
    QueryType = Normal;

    elements
    {
        dataitem(ValueEntry; "Value Entry")
        {
            column(SalespersPurchCode; "Salespers./Purch. Code")
            {
            }
            /*
            filter(Posting_Date;"Posting Date")
            {

            }
            */
            column(Posting_Date; "Posting Date")
            {
            }
            column(ItemNo; "Item No.")
            {
            }
            column(SourceType; "Source Type")
            {
            }
            column(SourceNo; "Source No.")
            {
            }
            column(DocumentType; "Document Type")
            {
            }
            column(DocumentNo; "Document No.")
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(DocumentLineNo; "Document Line No.")
            {
            }
            column(ItemChargeNo; "Item Charge No.")
            {
            }
            column(GenProdPostingGroup; "Gen. Prod. Posting Group")
            {
            }
            column(SalesAmountActual; "Sales Amount (Actual)")
            {
                Method = Sum;
            }
            column(CostAmountActual; "Cost Amount (Actual)")
            {
                Method = Sum;
            }
            column(CostAmountExpected; "Cost Amount (Expected)")
            {
                Method = Sum;
            }
            column(CostAmountNonInvtbl; "Cost Amount (Non-Invtbl.)")
            {
                Method = Sum;
            }
            column(InvoicedQuantity; "Invoiced Quantity")
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
        CurrQuery.SetFilter(Posting_Date, '>=%1&<=%2', CALCDATE('<-1Y-CY>', WORKDATE()), CALCDATE('<CY>', WORKDATE()));
    end;
}
