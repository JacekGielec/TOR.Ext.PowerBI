query 50671 "Value Entries Api"
{
    QueryType = API;
    APIPublisher = 'torggler';
    APIGroup = 'powerBi';
    APIVersion = 'v2.0';
    Caption = 'Value Entries API', Locked = true;
    EntityName = 'valueEntry';
    EntitySetName = 'valueEntries';
    DataAccessIntent = ReadOnly;

    elements
    {
        dataitem(ValueEntry; "Value Entry")
        {
            column(salespersonCode; "Salespers./Purch. Code") { }
            column(postingDate; "Posting Date") { }
            column(itemNo; "Item No.") { }
            column(sourceType; "Source Type") { }
            column(sourceNo; "Source No.") { }
            column(documentType; "Document Type") { }
            column(documentNo; "Document No.") { }
            column(globalDimension1Code; "Global Dimension 1 Code") { }
            column(documentLineNo; "Document Line No.") { }
            column(itemChargeNo; "Item Charge No.") { }
            column(genProdPostingGroup; "Gen. Prod. Posting Group") { }
            column(salesAmountActual; "Sales Amount (Actual)")
            {
                Method = Sum;
            }
            column(costAmountActual; "Cost Amount (Actual)")
            {
                Method = Sum;
            }
            column(costAmountExpected; "Cost Amount (Expected)")
            {
                Method = Sum;
            }
            column(costAmountNonInvtbl; "Cost Amount (Non-Invtbl.)")
            {
                Method = Sum;
            }
            column(invoicedQuantity; "Invoiced Quantity")
            {
                Method = Sum;
            }
            dataitem(ItemLedgerEntry; "Item Ledger Entry")
            {
                DataItemLink = "Entry No." = ValueEntry."Item Ledger Entry No.";
                column(unitOfMeasureCode; "Unit of Measure Code") { }

                dataitem(Item; Item)
                {
                    DataItemLink = "No." = ItemLedgerEntry."Item No.";

                    column(productGroup; "Product Group") { }
                    column(commissionGroup; "EOS Commission Group Code") { }
                    column(description; Description) { }
                    dataitem(customer; Customer)
                    {
                        DataItemLink = "No." = ValueEntry."Source No.";
                        column(sourceName; Name) { }
                    }
                }
            }
        }
    }

    trigger OnBeforeOpen()
    begin
        //Limit data to full last year + this year
        CurrQuery.SetFilter(postingDate, '>=%1&<=%2', CALCDATE('<-1Y-CY>', WORKDATE()), CALCDATE('<CY>', WORKDATE()));
    end;
}
