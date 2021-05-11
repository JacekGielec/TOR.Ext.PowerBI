// +---------------------------------------------------------+
// | Torggler                                                |
// +---------------------------------------------------------+
// Module					Date			ID		Description
// TG-JG-001		    	2021.05.10		jgi     creation

/// <summary>
/// Page TOR Value Entries (ID 50659).
/// </summary>
page 50659 "TOR Comm. Value Entries 2"
{
    PageType = API;
    Caption = 'TOR Commissions Value Entries 2';

    APIPublisher = 'torggler';
    APIGroup = 'app1';
    //APIVersion = 'v1.0', 'v2.0';

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
                field(invoicedQuantity; Rec."Invoiced Quantity")
                {
                    Caption = 'Invoiced Quantity';
                    //Method = Sum;
                }
                field(SalespersPurchCode; Rec."Salespers./Purch. Code")
                {
                }
                field(commissionPercent; GetCommissionPercent())
                {
                    Caption = 'Commission %';
                }
                field(Unit_of_Measure_Code; Item."Base Unit of Measure")
                {
                    Caption = 'Unit of Measure Code';
                }

                field(Product_Group; Item."Product Group")
                {
                    Caption = 'Product Group';
                }
                field(Commission_Group; Item."EOS Commission Group Code")
                {
                    Caption = 'Commission Group Code';
                }
                field(Description; Item.Description)
                {
                    Caption = 'Description';
                }
                field(Source_Name; Customer.Name)
                {
                    Caption = 'Source Name';
                }
            }
        }
    }
    var
        Customer: Record Customer;
        Item: Record Item;



    trigger OnOpenPage()
    begin
        Rec.SetFilter("Document Type", '%1|%2', Rec."Document Type"::"Sales Invoice", Rec."Document Type"::"Sales Credit Memo");
    end;

    trigger OnAfterGetRecord()
    begin
        if Customer.Get(Rec."Source No.") then;
        if Item.Get(Rec."Item No.") then;
    end;

    local procedure GetCommissionPercent(): Decimal
    var
        CommCalcSetup: Record "EOS Commissions Calc. Setup";
    begin
        CommCalcSetup.SetRange(Disabled, false);
        CommCalcSetup.SetRange("Starting Date", 0D, Rec."Posting Date");
        CommCalcSetup.SetRange(Salesperson, Rec."Salespers./Purch. Code");
        CommCalcSetup.SetRange("Product Commission Group Code", item."Product Group");
        if CommCalcSetup.FindLast() then
            exit(CommCalcSetup."Commission %");
    end;

}