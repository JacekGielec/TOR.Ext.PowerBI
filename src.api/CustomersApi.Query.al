query 50665 "Customers Api"
{
    QueryType = API;
    APIPublisher = 'torggler';
    APIGroup = 'powerBi';
    APIVersion = 'v2.0';
    Caption = 'Customers API', Locked = true;
    EntityName = 'customer';
    EntitySetName = 'customers';
    DataAccessIntent = ReadOnly;

    elements
    {
        dataitem(Customer; Customer)
        {
            column(no; "No.") { }
            column(name; Name) { }
            column(mixer; mixer) { }
            column(creditLimitLCY; "Credit Limit (LCY)") { }
            column(privacyBlocked; "Privacy Blocked") { }
            column(address; Address) { }
            column(countryRegionCode; "Country/Region Code") { }
            column(city; City) { }
            column(postCode; "Post Code") { }
            column(vATRegistrationNo; "VAT Registration No.") { }
            column(paymentTermsCode; "Payment Terms Code") { }
            column(shipmentMethodCode; "Shipment Method Code") { }
            column(responsibilityCenter; "Responsibility Center") { }
            column(systemCreatedAt; SystemCreatedAt) { }
            column(systemCreatedBy; SystemCreatedBy) { }
        }
    }
}
