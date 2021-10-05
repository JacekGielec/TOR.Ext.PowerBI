query 50663 "Commissions Api"
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
        dataitem(Commissions; "EOS Commission Ledger Entry")
        {
            column(documentNo; "Document No.") { }
            column(documentLineNo; "Document Line No.") { }
            column(salespersonRole; "Salesperson Role") { }
            column(salesperson; Salesperson) { }
            column(commissionBaseAmountLCY; "Commission Base Amount (LCY)") { }
            column(commission; "Commission %") { }
            column(commissionAmount; "Commission % (Amount)") { }
            column(cashed; "Cashed %") { }
            column(sellToNo; "Sell-to No.") { }
            column(sellToName; "Sell-to Name") { }
            column(billToNo; "Bill-to No.") { }
            column(billToName; "Bill-to Name") { }
            column(documentDate; "Document Date") { }
            column(postingDate; "Posting Date") { }
        }
    }
}