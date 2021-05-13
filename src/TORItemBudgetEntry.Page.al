// +---------------------------------------------------------+
// | Torggler                                                |
// +---------------------------------------------------------+
// Module					Date			ID		Description
// TG-JG-001		    	2021.05.13		jgi     creation

/// <summary>
/// Page TOR Item Budget Entry (ID 50662).
/// </summary>
page 50657 "TOR Item Budget Entry"
{
    PageType = API;
    Caption = 'TOR Item Budget Entry';

    APIPublisher = 'torggler';
    APIGroup = 'app1';
    //APIVersion = 'v1.0', 'v2.0';

    EntityCaption = 'ItemBudgetEntry';
    EntitySetCaption = 'ItemBudgetEntry';
    EntityName = 'ItemBudgetEntry';
    EntitySetName = 'ItemBudgetEntry';

    //ODataKeyFields = SystemId;
    SourceTable = "Item Budget Entry";
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
                field(BudgetName; Rec."Budget Name")
                {
                    Caption = 'Budget Name';
                }
                field(Date; Rec.Date)
                {
                    Caption = 'Date';
                }
                field(SourceType; Rec."Source Type")
                {
                    Caption = 'Source Type';
                }
                field(SourceNo_; Rec."Source No.")
                {
                    Caption = 'Source No.';
                }
                field(SalesAmount; Rec."Sales Amount")
                {
                    Caption = 'Sales Amount';
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                }

                field(SalespersonCode; Rec."Salesperson Code")
                {
                    Caption = 'Salesperson Code';
                }

            }
        }
    }
}