public class AccountHandler {
    public static void createOpp(List<Account> acclist)
    {
        List <Opportunity> opplist = new List<Opportunity>();
        for(Account acc:acclist)
        {
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name;
            opp.AccountId = acc.Id;
            opp.Description = acc.Description;
            opp.StageName = 'Hot Lead';
            opp.CloseDate = System.Today();
            opplist.add(opp);
        }
        insert opplist;
    }
    
    public static void createContactsOnUpdate(List<Account> acclist)
    {
        Set<Id> accId = new Set<Id>();
        List<Contact> conList = new List<Contact>(); 
        for(Account acc:accList)
        {
            accId.add(acc.Id);
        }
        
        conList = [Select id,Name,Active__c,Account.Active__c,AccountId from Contact where AccountId IN :accId];
        List<Contact> newCon = new List<Contact>();
        for(Contact con:conList)
        {
            con.Active__c = con.Account.Active__c;
            newCon.add(con);
        }
        update newCon;
        
    }
    
    public static void checkDuplicatePhone(List<Account> accList)
    {
        Set<String> phonelist = new Set<String>();
        for(Account acc: accList)
        {
            phoneList.add(acc.Phone);
        }
        
        list<Account> acctocheck = [Select Id,Phone from Account where Phone IN: phonelist];
        if(acctocheck.size()>0){ 
        for(Account acc: accList)
        {     
               acc.addError('Phone nummber is already exist');
 	    }
      }
    }
    public static void checkRelatedOpp(List<Account> acclist)
    {
        Set<Id> accId = new Set<Id>();
        for(Account acc: acclist)
        {
            accId.add(acc.Id);
        }
        
        List<Account> acclist1 = [Select Id,Name, (Select Id,Name from Opportunities) from Account where Id =: accId];
        for(Account acc: acclist1)
        {
            if(acc.Opportunities.size()>0)
            {
                acc.addError('Deletion not allowed');
            }
        }
    }

}