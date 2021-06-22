page 50663 "TOR Sales Invoice Line Transpo"
{
    PageType = API;
    Caption = 'TOR Sales Invoice Line Transport';

    APIPublisher = 'torggler';
    APIGroup = 'app1';
    //APIVersion = 'v1.0', 'v2.0';

    EntityCaption = 'TORSalesInvoiceLineTransport';
    EntitySetCaption = 'TORSalesInvoiceLineTransport';
    EntityName = 'TORSalesInvoiceLineTransport';
    EntitySetName = 'TORSalesInvoiceLineTransport';

    //ODataKeyFields = SystemId;
    SourceTable = "Sales Invoice Line";
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
                field(DocumentDate; salesinvoice."Document Date")
                {
                }
                field(SellToCustomerNo_; Rec."Sell-to Customer No.")
                {
                }
                field(SellToCustomerName; GetCustomerName(Rec."Sell-to Customer No."))
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
        salesinvoice: Record "Sales Invoice Header";

    trigger OnOpenPage()
    begin
        Rec.SetCurrentKey("No.");
        Rec.SetFilter("No.", 'TRANSPORT');
    end;

    trigger OnAfterGetRecord()
    begin
        salesinvoice.get(Rec."Document No.");
    end;

    local procedure GetCustomerName(CustNo: Code[20]): Text
    var
        Cust: Record Customer;
    begin
        Cust.get(CustNo);
        exit(cust.Name);
    end;

    local procedure GetCost(): Boolean
    begin
        exit(false);
    end;
}
