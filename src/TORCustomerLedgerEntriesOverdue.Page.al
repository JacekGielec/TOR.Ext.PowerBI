// +---------------------------------------------------------+
// | Torggler                                                |
// +---------------------------------------------------------+
// Module					Date			ID		Description
// TG-TDAG00000-001			25.05.21		jgi         creation

/// <summary>
/// Page TOR Cust. Ledger Entries Overd (ID 50662).
/// </summary>
page 50662 "TOR Cust. Ledger Entries Overd"
{
    PageType = API;
    Caption = 'TOR Cust. Ledger Entries Overdue';

    APIPublisher = 'torggler';
    APIGroup = 'app1';
    //APIVersion = 'v1.0', 'v2.0';

    EntityCaption = 'TORCustLedgerEntriesOverdue';
    EntitySetCaption = 'TORCustLedgerEntriesOverdue';
    EntityName = 'TORCustLedgerEntriesOverdue';
    EntitySetName = 'TORCustLedgerEntriesOverdue';

    //ODataKeyFields = SystemId;
    SourceTable = "Cust. Ledger Entry";
    //SourceTableTemporary = true;

    Extensible = false;
    DelayedInsert = true;

    //For better Performance use replicas
    Editable = false;
    DataAccessIntent = ReadOnly;
    //
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(DocumentNo; Rec."Document No.")
                {
                }
                field(PostingDate; Rec."Posting Date")
                {
                }
                field(DocumentDate; Rec."Document Date")
                {
                }
                field(DueDate; Rec."Due Date")
                {

                }
                field(OverdueDays; QtyDays(Rec."Due Date"))
                {

                }
                field(SellToCustomerNo_; Rec."Sell-to Customer No.")
                {
                }
                field(SellToCustomerName; GetCustomerName(Rec."Sell-to Customer No."))
                {
                }
                field(SalespersonCode; Rec."Salesperson Code")
                {
                }
                field(CurrencyCode; Rec."Currency Code")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field(RemainingAmount; Rec."Remaining Amount")
                {
                }

            }
        }
    }
    var

    trigger OnOpenPage()
    var
    begin
        Rec.SetCurrentKey(Open);
        Rec.SetRange(Open, true);
        Rec.SetRange("Due Date", 0D, Today - 1);
    end;

    local procedure GetCustomerName(CustNo: Code[20]): Text
    var
        Cust: Record Customer;
    begin
        Cust.get(CustNo);
        exit(cust.Name);
    end;

    local procedure QtyDays(DueDate: Date): Integer
    begin
        if DueDate <> 0D then
            exit(Today - DueDate);
    end;
}