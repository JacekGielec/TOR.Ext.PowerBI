// +---------------------------------------------------------+
// | Torggler                                                |
// +---------------------------------------------------------+
// Module					Date			ID		Description
// TG-TDAG00000-001			23.02.21		dho     Added EOS Salesperson

/// <summary>
/// Query TOR Sales Headers (ID 50651).
/// </summary>
query 50651 "TOR Sales Headers"
{
    Caption = 'TOR Sales Headers';
    QueryType = Normal;
    OrderBy = ascending(No);
    //It's possibile to add Queries to SmartLists with the QueryCategory proberty
    QueryCategory = 'Customer List';

    elements
    {
        dataitem(SalesHeader; "Sales Header")
        {
            column(No; "No.") { }
            column(OrderDate; "Order Date") { }
            column(SelltoCustomerNo; "Sell-to Customer No.") { }
            column(Status; Status) { }
            column(PaymentTermsCode; "Payment Terms Code") { }
            /*
            dataitem(EOS_Add__Salesperson_Purchaser; "EOS Add. Salesperson/Purchaser")
            {
                DataItemLink = "Header ID" = SalesHeader."No.";
                SqlJoinType = LeftOuterJoin;
                DataItemTableFilter = "Header Type" = CONST(112), "Header Subtype" = CONST(0), Role = CONST('STD'), "Header Ref. No." = CONST(0);
                column(Code; Code) { }
                column(Name; Name) { }
            }
            */
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
