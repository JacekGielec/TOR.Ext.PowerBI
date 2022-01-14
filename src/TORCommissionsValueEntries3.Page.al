page 50666 "TOR Comm. Value Entries 3"
{
    PageType = API;
    //PageType = List;
    //ApplicationArea = All;
    //UsageCategory = Administration;
    Caption = 'TOR Commissions Value Entries 3';
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
    //Extensible = false;
    //DelayedInsert = true;
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
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                    ApplicationArea = all;
                }
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                    ApplicationArea = all;
                }
                field(sourceType; Rec."Source Type")
                {
                    Caption = 'Source Type';
                    ApplicationArea = all;
                }
                field(sourceNo; Rec."Source No.")
                {
                    Caption = 'Source No.';
                    ApplicationArea = all;
                }
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                    ApplicationArea = all;
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                    ApplicationArea = all;
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                }
                field(documentLineNo; Rec."Document Line No.")
                {
                    Caption = 'Document Line No.';
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }
                field(ExpirationDate; ile."Expiration Date")
                {
                    Caption = 'Expiration Date';
                }
                field(itemChargeNo; Rec."Item Charge No.")
                {
                    Caption = 'Item Charge No.';
                    ApplicationArea = all;
                }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
                    ApplicationArea = all;
                }
                field(salesAmountActual; Rec."Sales Amount (Actual)")
                {
                    Caption = 'Sales Amount (Actual)';
                    ApplicationArea = all;
                    //Method = Sum;;
                }
                field(costAmountActual; Rec."Cost Amount (Actual)")
                {
                    Caption = 'Cost Amount (Actual)';
                    ApplicationArea = all;
                    //Method = Sum;
                }
                field(invoicedQuantity; Rec."Invoiced Quantity")
                {
                    Caption = 'Invoiced Quantity';
                    ApplicationArea = all;
                    //Method = Sum;
                }
                field(SalespersPurchCode; Rec."Salespers./Purch. Code")
                {
                    ApplicationArea = all;
                }
                field(commissionPercent; GetCommissionPercent())
                {
                    Caption = 'Commission %';
                    ApplicationArea = all;
                }
                field(commissionPercent2; GetCommissionPercent())
                {
                    Caption = 'Commission % 2';
                    ApplicationArea = all;
                }
                field(Unit_of_Measure_Code; Item."Base Unit of Measure")
                {
                    Caption = 'Unit of Measure Code';
                    ApplicationArea = all;
                }
                field(Product_Group; Item."Product Group")
                {
                    Caption = 'Product Group';
                    ApplicationArea = all;
                }
                field(Commission_Group; Item."EOS Commission Group Code")
                {
                    Caption = 'Commission Group Code';
                    ApplicationArea = all;
                }
                field(Description; Item.Description)
                {
                    Caption = 'Description';
                    ApplicationArea = all;
                }
                field(Source_Name; Customer.Name)
                {
                    Caption = 'Source Name';
                    ApplicationArea = all;
                }
                field(SellToCode; SellToCode)
                {
                    Caption = 'SellToCode';
                    ApplicationArea = all;
                }
                field(SellToName; SellToName)
                {
                    Caption = 'SellToName';
                    ApplicationArea = all;
                }
                field(ShipToCode; ShipToCode)
                {
                    Caption = 'ShipToCode';
                    ApplicationArea = all;
                }
                field(ShipToName; ShipToName)
                {
                    Caption = 'ShipToName';
                    ApplicationArea = all;
                }
            }
        }
    }
    var
        Customer: Record Customer;
        Item: Record Item;
        ILE: Record "Item Ledger Entry";
        SellToCode: code[20];
        SellToName: Text[100];
        ShipToCode: code[20];
        ShipToName: Text[100];

    trigger OnOpenPage()
    begin
        Rec.SetFilter("Document Type", '%1|%2', Rec."Document Type"::"Sales Invoice", Rec."Document Type"::"Sales Credit Memo");
    end;

    trigger OnAfterGetRecord()
    var
        SI: Record "Sales Invoice Header";
        SCM: Record "Sales Cr.Memo Header";
    begin
        if Customer.Get(Rec."Source No.") then;
        if Item.Get(Rec."Item No.") then;
        if ile.get(Rec."Item Ledger Entry No.") then;
        SellToCode := '';
        SellToName := '';
        ShipToCode := '';
        ShipToName := '';
        if Rec."Document Type" = Rec."Document Type"::"Sales Invoice" then begin
            if si.get(Rec."Document No.") then begin
                SellToCode := si."Sell-to Customer No.";
                SellToName := si."Sell-to Customer Name";
                ShipToCode := si."Ship-to Code";
                ShipToName := si."Ship-to Name";
            end;
        end
        else
            if rec."Document Type" = rec."Document Type"::"Sales Credit Memo" then begin
                if scm.get(rec."Document No.") then begin
                    SellToCode := scm."Sell-to Customer No.";
                    SellToName := scm."Sell-to Customer Name";
                    ShipToCode := scm."Ship-to Code";
                    ShipToName := scm."Ship-to Name";
                end;
            end;
    end;

    local procedure GetCommissionPercent(): Decimal
    var
        CommCalcSetup: Record "EOS Commissions Calc. Setup";
    begin
        CommCalcSetup.SetRange(Disabled, false);
        CommCalcSetup.SetRange("Starting Date", 0D, Rec."Posting Date");
        CommCalcSetup.SetRange(Salesperson, Rec."Salespers./Purch. Code");
        CommCalcSetup.SetRange("Product Commission Group Code", item."EOS Commission Group Code");
        if CommCalcSetup.FindLast() then exit(CommCalcSetup."Commission %");
    end;

    local procedure GetCommissionPercent2(): Decimal
    var
        CommCalcSetup: Record "EOS Commissions Calc. Setup";
        Cust: Record Customer;
        SalesPrice: Record "Sales Price";
        perc, price : Decimal;
    begin
        CommCalcSetup.SetRange(Disabled, false);
        CommCalcSetup.SetRange("Starting Date", 0D, Rec."Posting Date");
        CommCalcSetup.SetRange(Salesperson, Rec."Salespers./Purch. Code");
        CommCalcSetup.SetRange("Product Commission Group Code", item."EOS Commission Group Code");
        if CommCalcSetup.FindLast() then begin
            if (Item."EOS Commission Group Code" <> 'GR1') and (Item."EOS Commission Group Code" <> 'ITA') then begin
                perc := CommCalcSetup."Commission %";
            end
            else begin
                if cust.get(Rec."Source No.") then begin
                    if Cust."Customer Price Group" = '' then begin
                        perc := CommCalcSetup."Commission %";
                    end
                    else begin
                        SalesPrice.SetRange("Sales Type", SalesPrice."Sales Type"::"Customer Price Group");
                        SalesPrice.SetRange("Sales Code", cust."Customer Price Group");
                        SalesPrice.SetRange("Item No.", Rec."item no.");
                        SalesPrice.SetRange("Starting Date", 0D, Rec."Posting Date");
                        if SalesPrice.FindLast() then begin
                            price := Round(Rec."Sales Amount (Actual)" / Rec."Item Ledger Entry Quantity");
                            if price < SalesPrice."Unit Price" then
                                perc := 1.5
                            else
                                perc := CommCalcSetup."Commission %";
                        end
                        else begin
                            perc := CommCalcSetup."Commission %";
                        end;
                    end;
                end;
            end;
        end;
        exit(perc);
    end;
}
