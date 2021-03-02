// +---------------------------------------------------------+
// | Torggler                                                |
// +---------------------------------------------------------+
// Module					Date			ID		Description
// TG-TDAG00000-001			02.03.21		dho     creation; Ship-to Customer No and UOM still missing

/// <summary>
/// Page TOR Value Entries (ID 50658).
/// </summary>
page 50658 "TOR Commissions Value Entries"
{
    PageType = API;
    Caption = 'TOR Commissions Value Entries';

    APIPublisher = 'torggler';
    APIGroup = 'app1';
    APIVersion = 'v1.0', 'v2.0';

    EntityCaption = 'TorCommissionsValueEntry';
    EntitySetCaption = 'TorCommissionsValueEntries';
    EntityName = 'torCommissionsValueEntry';
    EntitySetName = 'torCommissionsValueEntries';

    ODataKeyFields = SystemId;
    SourceTable = "Value Entry";
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
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                }
                field(sourceType; Rec."Source Type")
                {
                    Caption = 'Source Type';
                }
                field(sourceNo; Rec."Source No.")
                {
                    Caption = 'Source No.';
                }
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document No.';
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                }
                /*
                field(shipToCustomer; GetShipToCustomer())
                {
                    Caption = 'Ship-to Customer';
                }
                */
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                }
                field(documentLineNo; Rec."Document Line No.")
                {
                    Caption = 'Document Line No.';
                }
                field(itemChargeNo; Rec."Item Charge No.")
                {
                    Caption = 'Item Charge No.';
                }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
                }
                field(salesAmountActual; Rec."Sales Amount (Actual)")
                {
                    Caption = 'Sales Amount (Actual)';
                    //Method = Sum;
                }
                field(costAmountActual; Rec."Cost Amount (Actual)")
                {
                    Caption = 'Cost Amount (Actual)';
                    //Method = Sum;
                }
                field(costAmountExpected; Rec."Cost Amount (Expected)")
                {
                    Caption = 'Cost Amount (Expected)';
                    //Method = Sum;
                }
                field(costAmountNonInvtbl; Rec."Cost Amount (Non-Invtbl.)")
                {
                    Caption = 'Cost Amount (Non-Invtbl.)';
                    //Method = Sum;
                }
                field(invoicedQuantity; Rec."Invoiced Quantity")
                {
                    Caption = 'Invoiced Quantity';
                    //Method = Sum;
                }
                field(salesperson; GetSalesperson())
                {
                    Caption = 'Commission Salesperson';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetFilter("Document Type", '%1|%2', Rec."Document Type"::"Sales Invoice", Rec."Document Type"::"Sales Credit Memo");
    end;

    local procedure GetSalesperson(): Code[20]
    var
        EOSAddSalespersonPurchaser: Record "EOS Add. Salesperson/Purchaser";
        HeaderType: Integer;
    begin
        if Rec."Document Type" = Rec."Document Type"::"Sales Invoice" then
            HeaderType := 112;
        if Rec."Document Type" = Rec."Document Type"::"Sales Credit Memo" then
            HeaderType := 114;
        if HeaderType = 0 then
            exit('');

        EOSAddSalespersonPurchaser.SetRange("Header Type", HeaderType);
        EOSAddSalespersonPurchaser.SetRange("Header Subtype", 0);
        EOSAddSalespersonPurchaser.SetRange("Header ID", Rec."Document No.");
        EOSAddSalespersonPurchaser.SetRange(Role, 'STD');
        if EOSAddSalespersonPurchaser.FindFirst() then
            Exit(EOSAddSalespersonPurchaser.Code);
    end;

    /*
        local procedure GetShipToCustomer(): Code[20]
        var
            SalesHeader: Record "Sales Header";
        begin
            SalesHeader.SetRange();
        end;
    */
}