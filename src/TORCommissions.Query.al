/// <summary>
/// Query TOR Commissions (ID 50660).
/// </summary>
query 50660 "TOR Commissions"
{
    QueryType = Normal;
    DataAccessIntent = ReadOnly;

    elements
    {
        dataitem(Commissions; "EOS Commission Ledger Entry")
        {
            column(Document_No_; "Document No.") { }
            column(Document_Line_No_; "Document Line No.") { }
            column(Salesperson_Role; "Salesperson Role") { }
            column(Salesperson; Salesperson) { }
            column(Commission_Base_Amount__LCY_; "Commission Base Amount (LCY)") { }
            column(Commission__; "Commission %") { }
            column(Commission____Amount_; "Commission % (Amount)") { }
            column(Cashed__; "Cashed %") { }
            column(Sell_to_No_; "Sell-to No.") { }
            column(Sell_to_Name; "Sell-to Name") { }
            column(Bill_to_No_; "Bill-to No.") { }
            column(Bill_to_Name; "Bill-to Name") { }
            column(Document_Date; "Document Date") { }
            column(Posting_Date; "Posting Date") { }
        }
    }
}