@isTest
private class DailyLeadProcessorTest 
{
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    static testmethod void testScheduledJob() 
    {
        List<Lead> leads = new List<Lead>();
        for (Integer i=1; i<=200; i++) {
            Lead lead = new Lead(
                LastName = 'Test Lead ' + i,
                Company = 'Test Company'
            );
            leads.add(lead);
        }
        Database.insert(leads);

        Map<Id, Lead> lead_map = new Map<Id, Lead>(leads);
        List<Id> lead_ids = new List<Id>(lead_map.keySet());
        Test.startTest();
        String jobId = System.schedule('ScheduledApexTest', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();
        
        List<Lead> leads_test = [
            SELECT Id, LeadSource 
            FROM Lead
            WHERE LeadSource = 'Dreamforce'
        ];
        
        System.assertEquals(200, leads_test.size(), 'All lead source are not updated');
    }
}