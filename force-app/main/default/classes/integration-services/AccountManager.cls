@RestResource(urlMapping='/Accounts//contacts')
global class AccountManager 
{
    @HttpGet
    global static Account getAccount() 
    {
        RestRequest request = RestContext.request;
        
        String account_id = request.requestURI.substringBetween('Accounts/','/contacts');
        List<Account> account = [
            SELECT Id,Name, (
                SELECT Id, Name 
                FROM Contacts
            )
            FROM Account
            WHERE Id =: account_id
        ];
        if(account.size() == 0)
        {
            return null;
        }
        return account[0];
    }
}

