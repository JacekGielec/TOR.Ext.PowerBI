page 50665 "TOR Sales Invoice LineTranspo"
{
    PageType = List;
    Caption = 'TOR Sales Invoice Line Transport';
    UsageCategory = Lists;
    ApplicationArea = all;

    //APIPublisher = 'torggler';
    //APIGroup = 'app1';
    //APIVersion = 'v1.0', 'v2.0';

    //EntityCaption = 'TORSalesInvoiceLineTransport';
    //EntitySetCaption = 'TORSalesInvoiceLineTransport';
    //EntityName = 'TORSalesInvoiceLineTransport';
    //EntitySetName = 'TORSalesInvoiceLineTransport';

    //ODataKeyFields = SystemId;
    SourceTable = "Sales Invoice Line";
    //SourceTableTemporary = true;

    Extensible = false;
    DelayedInsert = true;

    //For better Performance use replicas
    Editable = false;
    //DataAccessIntent = ReadOnly;
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
                    ApplicationArea = all;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                }
                field(DocumentNo; Rec."Document No.")
                {
                    ApplicationArea = all;
                }
                field(PostingDate; Rec."Posting Date")
                {
                    ApplicationArea = all;
                }
                field(DocumentDate; salesinvoice."Document Date")
                {
                    ApplicationArea = all;
                }
                field(SellToCustomerNo_; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = all;
                }
                field(SellToCustomerName; GetCustomerName(Rec."Sell-to Customer No."))
                {
                    ApplicationArea = all;
                }

                field(Amount; Rec.Amount)
                {
                    ApplicationArea = all;
                }
                field(AmountAfterDiscount; Rec.Amount - Rec."Line Discount Amount")
                {
                    ApplicationArea = all;
                }

            }
        }

    }
    var
        salesinvoice: Record "Sales Invoice Header";

    trigger OnOpenPage()
    begin
        Rec.SetCurrentKey("No.");
        Rec.SetFilter(Description, 'Trans*');
    end;

    trigger OnAfterGetRecord()
    begin
        salesinvoice.get(Rec."Document No.");
    end;

    local procedure GetCustomerName(CustNo: Code[20]): Text
    var
        Cust: Record Customer;
    begin
        if Cust.get(CustNo) then
            exit(cust.Name);
    end;

    local procedure GetCost(): Boolean
    begin
        exit(false);
    end;
}
