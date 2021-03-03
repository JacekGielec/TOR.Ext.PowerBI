// +---------------------------------------------------------+
// | Torggler                                                |
// +---------------------------------------------------------+
// Module					Date			ID		Description
// TG-TDAG00000-001			02.03.21		dho     creation; Ship-to Customer No and UOM still missing
// TG-TDAG00000-002         03.03.21        dho     added fields Commission % (Amount) (LCY), Commission % and changed procedure GetSalesperson()  

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
                    Caption = 'Document Type';
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
                field(commissionAmount; GetCommissionAmount())
                {
                    Caption = 'Commission % (Amount) (LCY)';
                }
                field(commissionPercent; GetCommissionPercent())
                {
                    Caption = 'Commission %';
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
        EOSCommDocLedgerEntry: Record "EOS Comm. Doc. Ledger Entry";
        TableID: Integer;
    begin

        if Rec."Document Type" = Rec."Document Type"::"Sales Invoice" then
            TableID := 113;
        if Rec."Document Type" = Rec."Document Type"::"Sales Credit Memo" then
            TableID := 115;
        if TableID = 0 then
            exit('');
        EOSCommDocLedgerEntry.SetRange("Table ID", TableID);
        EOSCommDocLedgerEntry.SetRange("Sales Document Type", 0);
        EOSCommDocLedgerEntry.SetRange("Document No.", Rec."Document No.");
        EOSCommDocLedgerEntry.SetRange("Document Line No.", Rec."Document Line No.");
        EOSCommDocLedgerEntry.SetRange("Salesperson Role", 'STD');
        If EOSCommDocLedgerEntry.FindFirst() then
            Exit(EOSCommDocLedgerEntry.Salesperson);
    end;

    local procedure GetCommissionAmount(): Decimal
    var
        EOSCommDocLedgerEntry: Record "EOS Comm. Doc. Ledger Entry";
        TableID: Integer;
    begin

        if Rec."Document Type" = Rec."Document Type"::"Sales Invoice" then
            TableID := 113;
        if Rec."Document Type" = Rec."Document Type"::"Sales Credit Memo" then
            TableID := 115;
        if TableID = 0 then
            exit(0);
        EOSCommDocLedgerEntry.SetRange("Table ID", TableID);
        EOSCommDocLedgerEntry.SetRange("Sales Document Type", 0);
        EOSCommDocLedgerEntry.SetRange("Document No.", Rec."Document No.");
        EOSCommDocLedgerEntry.SetRange("Document Line No.", Rec."Document Line No.");
        EOSCommDocLedgerEntry.SetRange("Salesperson Role", 'STD');
        If EOSCommDocLedgerEntry.FindFirst() then
            Exit(EOSCommDocLedgerEntry."Commission % (Amount)");
    end;

    local procedure GetCommissionPercent(): Decimal
    var
        EOSCommDocLedgerEntry: Record "EOS Comm. Doc. Ledger Entry";
        TableID: Integer;
    begin

        if Rec."Document Type" = Rec."Document Type"::"Sales Invoice" then
            TableID := 113;
        if Rec."Document Type" = Rec."Document Type"::"Sales Credit Memo" then
            TableID := 115;
        if TableID = 0 then
            exit(0);
        EOSCommDocLedgerEntry.SetRange("Table ID", TableID);
        EOSCommDocLedgerEntry.SetRange("Sales Document Type", 0);
        EOSCommDocLedgerEntry.SetRange("Document No.", Rec."Document No.");
        EOSCommDocLedgerEntry.SetRange("Document Line No.", Rec."Document Line No.");
        EOSCommDocLedgerEntry.SetRange("Salesperson Role", 'STD');
        If EOSCommDocLedgerEntry.FindFirst() then
            exit(EOSCommDocLedgerEntry."Commission %");
    end;
    /*
    local procedure GetShipToCustomer(): Code[20]
    var
        SalesInvoiceLine: Record "Sales Invoice Line";
        SalesShipmentHeader: Record "Sales Shipment Header";
        SalesHeaderArchive: Record "Sales Header Archive";
    begin
        //if Invoice
        if Rec."Document Type" = Rec."Document Type"::"Sales Invoice" then
            if SalesInvoiceLine.Get(Rec."Document Type", Rec."Document No.") then begin
                //if Shipment No. is not empty read Ship-to Code from Shipment
                if SalesShipmentHeader.Get(SalesInvoiceLine."Shipment No.") then
                    if SalesShipmentHeader."Ship-to Code" <> '' then
                        exit(SalesShipmentHeader."Ship-to Code")
                    else
                        exit(SalesShipmentHeader."Sell-to Customer No.");
                //otherwise read Ship-to Code from Archived Order
                SalesHeaderArchive.SetCurrentKey("No.", "Version No.", "Doc. No. Occurrence");
                SalesHeaderArchive.SetRange("Document Type", SalesHeaderArchive."Document Type"::Order);
                SalesHeaderArchive.SetRange("No.", SalesInvoiceLine."Order No.");
                if SalesHeaderArchive.FindLast() then
                    if SalesHeaderArchive."Ship-to Code" <> '' then
                        exit(SalesHeaderArchive."Ship-to Code")
                    else
                        exit(SalesHeaderArchive."Sell-to Customer No.");
            end;
        //if Credit Memo

    end;
    */

}