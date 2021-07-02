// +---------------------------------------------------------+
// | Torggler                                                |
// +---------------------------------------------------------+
// Module					Date			ID		Description
// TG-JG-001		    	2021.05.10		jgi     creation

/// <summary>
/// Page TOR Posted Sales Invoice (ID 50660).
/// </summary>
page 50660 "TOR Posted Sales Invoice"
{
    PageType = API;
    Caption = 'TOR Posted Sales Invoice';

    APIPublisher = 'torggler';
    APIGroup = 'app1';
    //APIVersion = 'v1.0', 'v2.0';

    EntityCaption = 'TorPostedSalesInvoice';
    EntitySetCaption = 'TorPostedSalesInvoice';
    EntityName = 'TorPostedSalesInvoice';
    EntitySetName = 'TorPostedSalesInvoice';

    //ODataKeyFields = SystemId;
    SourceTable = "Sales Invoice Header";
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
                field(ShipToCode; Rec."Ship-to Code")
                {
                }
                field(ShipToName; Rec."Ship-to Name")
                {
                }
                field(ShipToAddress; Rec."Ship-to Address")
                {
                }
                field(ShipToPostCode; Rec."Ship-to Post Code")
                {
                }
                field(ShipToCity; Rec."Ship-to City")
                { }

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