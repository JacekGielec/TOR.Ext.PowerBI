query 50664 "Customer Ledger Entries Api"
{
    QueryType = API;
    APIPublisher = 'torggler';
    APIGroup = 'powerBi';
    APIVersion = 'v2.0';
    Caption = 'Commissions API', Locked = true;
    EntityName = 'commission';
    EntitySetName = 'commissions';
    DataAccessIntent = ReadOnly;

    elements
    {
        dataitem(CustLedgerEntry; "Cust. Ledger Entry")
        {
            column(documentType; "Document Type") { }
            column(documentNo; "Document No.") { }
            column(postingDate; "Posting Date") { }
            column(dueDate; "Due Date") { }
            column(amount; Amount) { }
            column(remainingAmtLCY; "Remaining Amt. (LCY)") { }
            column(open; Open) { }
            column(salespersonCode; "Salesperson Code") { }
            column(customerNo; "Customer No.") { }
        }
    }
}