query 50668 "Sales Headers Api"
{
    QueryType = API;
    APIPublisher = 'torggler';
    APIGroup = 'powerBi';
    APIVersion = 'v2.0';
    Caption = 'Sales Headers API', Locked = true;
    EntityName = 'salesHeader';
    EntitySetName = 'salesHeaders';
    OrderBy = ascending(No);

    elements
    {
        dataitem(SalesHeader; "Sales Header")
        {
            column(no; "No.") { }
            column(orderDate; "Order Date") { }
            column(selltoCustomerNo; "Sell-to Customer No.") { }
            column(billToCustomerNo; "Bill-to Customer No.") { }
            column(shipToCode; "Ship-to Code") { }
            column(status; Status) { }
            column(paymentTermsCode; "Payment Terms Code") { }
            column(eosSalespersonCode; "EOS Salesperson Code") { }
        }
    }
}
