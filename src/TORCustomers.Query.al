/// <summary>
/// Query TOR Customers (ID 50653).
/// </summary>
query 50653 "TOR Customers"
{
    QueryType = Normal;

    elements
    {
        dataitem(Customer; Customer)
        {
            column(No; "No.")
            {
            }
            column(Name; Name)
            {
            }
            column(CreditLimitLCY; "Credit Limit (LCY)")
            {
            }
            column(PrivacyBlocked; "Privacy Blocked")
            {
            }
            column(Address; Address)
            {
            }
            column(CountryRegionCode; "Country/Region Code")
            {
            }
            column(City; City)
            {
            }
            column(PostCode; "Post Code")
            {
            }
            column(VATRegistrationNo; "VAT Registration No.")
            {
            }
            column(PaymentTermsCode; "Payment Terms Code")
            {
            }
            column(ShipmentMethodCode; "Shipment Method Code")
            {
            }
            column(ResponsibilityCenter; "Responsibility Center")
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
