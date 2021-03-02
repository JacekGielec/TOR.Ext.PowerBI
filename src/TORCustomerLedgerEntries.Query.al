// +---------------------------------------------------------+
// | Torggler                                                |
// +---------------------------------------------------------+
// Module					Date			ID		Description
// TG-TDAG00000-001			09.02.21		dho         creation

/// <summary>
/// Query TOR Customer Ledger Entries (ID 50656).
/// </summary>
query 50656 "TOR Customer Ledger Entries"
{
    QueryType = Normal;
    DataAccessIntent = ReadOnly;

    elements
    {
        dataitem(Cust__Ledger_Entry; "Cust. Ledger Entry")
        {
            column(DocumentType; "Document Type")
            {

            }
            column(DocumentNo; "Document No.")
            {

            }
            column(PostingDate; "Posting Date")
            {

            }
            column(DueDate; "Due Date")
            {

            }
            column(Amount; Amount)
            {

            }
            column(RemainingAmtLCY; "Remaining Amt. (LCY)")
            {

            }
            column(Open; Open)
            {

            }
            column(SalespersonCode; "Salesperson Code")
            {

            }
            column(CustomerNo; "Customer No.")
            {

            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}