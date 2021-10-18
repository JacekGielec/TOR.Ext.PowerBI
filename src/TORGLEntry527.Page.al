page 50663 "TOR GL Value Entries 527"
{
    PageType = API;
    Caption = 'TOR GL Value Entries 527';

    APIPublisher = 'torggler';
    APIGroup = 'app1';
    //APIVersion = 'v1.0', 'v2.0';

    EntityCaption = 'TORGLValueEntries527';
    EntitySetCaption = 'TORGLValueEntries527';
    EntityName = 'TORGLValueEntries527';
    EntitySetName = 'TORGLValueEntries527';

    //ODataKeyFields = SystemId;
    SourceTable = "G/L Entry";
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
                field(Posting_Date; Rec."Posting Date")
                {
                }
                field(GLAccountNo; Rec."G/L Account No.")
                {
                }
                field(SourceType; Rec."Source Type")
                {
                }
                field(SourceNo; SourceNo)
                {
                }
                field(SourceName; SourceName)
                {
                }
                field(DocumentNo; Rec."Document No.")
                {
                }
                field(GlobalDimension1Code; Rec."Global Dimension 1 Code")
                {
                }

                field(Amount; Rec.Amount)
                {
                }
                field(Description; Rec.Description)
                {
                }
            }

        }

    }
    var
        SourceNo: code[20];
        SourceName: Text[100];

    trigger OnOpenPage()
    begin
        //Limit data to full last year + this year
        Rec.SetFilter("Posting Date", '>=%1&<=%2', CALCDATE('<-1Y-CY>', WORKDATE()), CALCDATE('<CY>', WORKDATE()));
        Rec.SetFilter("G/L Account No.", '%1|%2', '527-6-01', '527-6-02');
    end;

    trigger OnAfterGetRecord()
    var
        v: Record Vendor;
        e: Record "G/L Entry";
    begin
        SourceNo := '';
        SourceName := '';
        e.SetRange("Document No.", Rec."Document No.");
        if e.FindSet() then
            repeat
                if e."Source Type" = Rec."Source Type"::Vendor then begin
                    SourceNo := e."Source No.";
                    if v.Get(SourceNo) then
                        SourceName := v.Name;
                end;
            until e.Next() = 0;
    end;
}

