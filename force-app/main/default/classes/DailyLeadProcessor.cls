global class DailyLeadProcessor implements Schedulable 
{
    global void execute(SchedulableContext ctx) 
    {
        List<Lead> leads = [
            SELECT Id, Name, LeadSource
            FROM Lead 
            WHERE LeadSource = ''
            LIMIT 200
        ];
        
        List<Lead> leads_to_update = new List<Lead>();
        for(Lead lead_obj : leads)
        {
            lead_obj.LeadSource = 'Dreamforce';
            leads_to_update.add(lead_obj);
        }

        Database.update(leads_to_update);
    }
}
