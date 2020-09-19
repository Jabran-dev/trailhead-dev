@IsTest
private class AccountManagerTest {
    static testmethod void testGetAccount() 
    {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri = 'https://jabransaleem-dev-ed.my.salesforce.com/services/apexrest/Accounts/'+recordId+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account account = AccountManager.getAccount();
        // Verify results
        System.assert(account != null);
        System.assertEquals('Test record', account.Name);
    }

    static testmethod void testGetAccountWithoutId() 
    {
        RestRequest request = new RestRequest();
        request.requestUri = 'https://jabransaleem-dev-ed.my.salesforce.com/services/apexrest/Accounts/'+''+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account account = AccountManager.getAccount();    
        System.assert(account == null);
    }

    static Id createTestRecord() 
    {
        // Create test record
        Account test_account = new Account(
            Name='Test record'
        );
        insert test_account;
        return test_account.Id;
    }
}
