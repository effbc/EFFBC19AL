tableextension 70040 JobJournalLineExt extends "Job Journal Line"
{
    fields
    {
        field(60001; "End Date"; Date)
        {
            Description = 'B2B';
            DataClassification = CustomerContent;
        }
        field(60002; "Start Date"; Date)
        {
            Description = 'B2B';
            DataClassification = CustomerContent;
        }
    }
}

