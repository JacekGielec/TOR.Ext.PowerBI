// +---------------------------------------------------------+
// | Torggler                                                |
// +---------------------------------------------------------+
// Module					Date			ID		Description
// TG-JG-001		    	2021.05.13		jgi     creation

/// <summary>
/// Page TOR Posted Credit Memo (ID 50661).
/// </summary>
page 50661 "TOR Posted Credit Memo"
{
    PageType = API;
    Caption = 'TOR Posted Credit Memo';

    APIPublisher = 'torggler';
    APIGroup = 'app1';
    //APIVersion = 'v1.0', 'v2.0';

    EntityCaption = 'TorPostedCreditMemo';
    EntitySetCaption = 'TorPostedCreditMemo';
    EntityName = 'TorPostedCreditMemo';
    EntitySetName = 'TorPostedCreditMemo';

    //ODataKeyFields = SystemId;
    SourceTable = "Sales Cr.Memo Header";
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
                field("No_"; Rec."No.")
                {
                }
                field(PostingDate; Rec."Posting Date")
                {
                }
                field(DocumentDate; Rec."Document Date")
                {
                }
                field(SellToCustomerNo_; Rec."Sell-to Customer No.")
                {
                }
                field(SellToCustomerName; Rec."Sell-to Customer Name")
                {
                }
                field(BillToCustomerNo_; Rec."Bill-to Customer No.")
                {
                }
                field(BillToName; Rec."Bill-to Name")
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
                field(AmountIncludingVAT; Rec."Amount Including VAT")
                {
                }
                field(VATAmount; VATAmount)
                {
                }

            }
        }
    }
    var
        VATAmount: Decimal;

    trigger OnAfterGetRecord()
    begin
        VATAmount := Rec."Amount Including VAT" - Rec.Amount;
    end;
}