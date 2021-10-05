query 50669 "Sales Lines Api"
{
    QueryType = API;
    APIPublisher = 'torggler';
    APIGroup = 'powerBi';
    APIVersion = 'v2.0';
    Caption = 'Sales Lines API', Locked = true;
    EntityName = 'salesLine';
    EntitySetName = 'salesLines';
    DataAccessIntent = ReadOnly;

    elements
    {
        dataitem(SalesLine; "Sales Line")
        {
            DataItemTableFilter = "Document Type" = CONST(Order);

            column(type; Type) { }
            column(location; "Location Code") { }
            column(unitOfMeasureCode; "Unit of Measure Code") { }
            column(unitPrice; "Unit Price") { }
            column(lineDiscount; "Line Discount %") { }
            column(lineAmount; "Line Amount") { }
            column(quantity; Quantity) { }
            column(quantityInvoiced; "Quantity Invoiced") { }
            column(quantityShipped; "Quantity Shipped") { }
            column(plannedDeliveryDate; "Planned Delivery Date") { }
            column(shipmentDate; "Shipment Date") { }
            column(customerNo; "Sell-to Customer No.") { }
            column(documentNo; "Document No.") { }
            column(no; "No.") { }
        }
    }
}