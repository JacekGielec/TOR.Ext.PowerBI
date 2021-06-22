page 50664 "TOR Purchase Invoice Line Tran"
{
    PageType = API;
    Caption = 'TOR Purchase Invoice Line Transport';

    APIPublisher = 'torggler';
    APIGroup = 'app1';
    //APIVersion = 'v1.0', 'v2.0';

    EntityCaption = 'TORPurchaseInvoiceLineTransport';
    EntitySetCaption = 'TORPurchaseInvoiceLineTransport';
    EntityName = 'TORPurchaseInvoiceLineTransport';
    EntitySetName = 'TORPurchaseInvoiceLineTransport';

    //ODataKeyFields = SystemId;
    SourceTable = "Purch. Inv. Line";
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
                field(Cost; Getcost())
                {

                }
                field(DocumentNo; Rec."Document No.")
                {
                }
                field(PostingDate; Rec."Posting Date")
                {
                }
                field(DocumentDate; purchinvoice."Document Date")
                {
                }
                field(BuyFromVendorNo; Rec."Buy-from Vendor No.")
                {
                }
                field(SellToCustomerName; purchinvoice."Buy-from Vendor Name")
                {
                }

                field(Amount; Rec.Amount)
                {
                }
                field(AmountAfterDiscount; Rec.Amount - Rec."Line Discount Amount")
                {
                }

            }
        }

    }
    var
        purchinvoice: Record "Purch. Inv. Header";

    trigger OnOpenPage()
    begin
        Rec.SetCurrentKey("No.");
        Rec.SetFilter("No.", 'TRANSPORT');
    end;

    trigger OnAfterGetRecord()
    begin
        purchinvoice.get(Rec."Document No.");
    end;

    local procedure GetCost(): Boolean
    begin
        exit(true);
    end;
}


