/// <summary>
/// Query TOR Sales Headers (ID 50651).
/// </summary>
query 50651 "TOR Sales Headers"
{
    QueryType = Normal;

    elements
    {
        dataitem(SalesHeader; "Sales Header")
        {
            column(No; "No.")
            {
            }
            column(OrderDate; "Order Date")
            {
            }
            column(SelltoCustomerNo; "Sell-to Customer No.")
            {
            }
            column(Status; Status)
            {
            }
            column(PaymentTermsCode; "Payment Terms Code")
            {
            }

        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
