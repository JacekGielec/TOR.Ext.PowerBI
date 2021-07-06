query 50661 "TOR GL Value Entries 527"
{
    QueryType = Normal;
    DataAccessIntent = ReadOnly;

    elements
    {
        dataitem(GLEntry; "G/L Entry")
        {
            column(Posting_Date; "Posting Date")
            {
            }
            column(GLAccountNo; "G/L Account No.")
            {
            }
            column(SourceType; "Source Type")
            {
            }
            column(SourceNo; "Source No.")
            {
            }
            column(DocumentNo; "Document No.")
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }

            column(Amount; Amount)
            {
            }
            column(Description; Description)
            {

            }
        }
    }

    trigger OnBeforeOpen()
    begin
        //Limit data to full last year + this year
        CurrQuery.SetFilter(Posting_Date, '>=%1&<=%2', CALCDATE('<-1Y-CY>', WORKDATE()), CALCDATE('<CY>', WORKDATE()));
        SetFilter(GLAccountNo, '%1|%2', '527-06-01', '527-6-02');
    end;
}
