// +---------------------------------------------------------+
// | Torggler                                                |
// +---------------------------------------------------------+
// Module					Date			ID		Description
// TG-TDAG00000-001			21.01.21		dho     added field Quantity

/// <summary>
/// Query TOR Sales Lines (ID 50652).
/// </summary>
query 50652 "TOR Sales Lines"
{
    QueryType = Normal;

    elements
    {
        dataitem(Sales_Line; "Sales Line")
        {
            DataItemTableFilter = "Document Type" = CONST(Order);

            column(Type; Type)
            {

            }
            column(Location; "Location Code")
            {

            }
            column(Unit_of_Measure_Code; "Unit of Measure Code")
            {

            }
            column(Unit_Price; "Unit Price")
            {

            }
            column(Line_Discount; "Line Discount %")
            {

            }
            column(Line_Amount; "Line Amount")
            {

            }
            //Begin TG-TDAG00000-001/dho
            column(Quantity; Quantity)
            {

            }
            //End TG-TDAG00000-001/dho
            column(Quantity_Invoiced; "Quantity Invoiced")
            {

            }
            column(Quantity_Shipped; "Quantity Shipped")
            {

            }
            column(Planned_Delivery_Date; "Planned Delivery Date")
            {

            }
            column(Shipment_Date; "Shipment Date")
            {

            }
            column(CustomerNo; "Sell-to Customer No.")
            {

            }
            column(Document_No_; "Document No.")
            {

            }
            column(No; "No.")
            {

            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}