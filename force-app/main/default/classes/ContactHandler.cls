public class ContactHandler {
    public static void updateTotalCountonAcc(List<Contact> conList)
    {
        Set<Id> accId = new Set<Id>();
        for(Contact con: conList)
        {
            accId.add(con.AccountId);
        }
        
        Integer TotalActiveContact = 0;
        Map<Id,Integer> mapvalue = new Map<Id,Integer>();
        List<Contact> conRecords = [Select Id,Active__c,AccountId from Contact where Active__c = True AND AccountId IN: accId];
        
        for(Contact con: conRecords)
        {
            TotalActiveContact += 1;
            mapvalue.put(con.AccountId,TotalActiveContact);
        }
        
        List<Account> acclist = [Select Id,TotalActiveContacts__c from Account where Id IN: mapvalue.keyset()];
        
       for(Account acc: acclist)
       {
           acc.TotalActiveContacts__c = mapvalue.get(acc.Id);
       }
       
        update accList;
        
        
        
        
    }
    
     public static void checkDuplicateEmail(List<Contact> conList){
        List<String> conEmail = new List<String>();
        for(Contact con:conList){
            conEmail.add(con.Email);
        }
        List<Contact> conToCheck=[Select id,Email from Contact where email=:conEmail];
        List<Messaging.SingleEmailMessage> emailstosend = new List<Messaging.SingleEmailMessage>();
        if(conToCheck.size()>0){
        for(Contact con:conList){
            
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            //email.setTargetObjectId(con.OwnerId);
            email.setToAddresses(conEmail);
            //email.setSaveAsActivity(false);
            email.setSubject('Duplicate Email Id');
            email.setPlainTextBody(
                'A new contact with Same email ' + con.Email +' already exists'
            );
            
            emailstosend.add(email);
            
            //con.addError('Contact with that email already existed');
                
        }
            
            if(!emailstosend.isEmpty()){
                Messaging.sendEmail(emailstosend);
                System.debug(emailstosend);
            } 
            
    }
}

    
    public static void changeContactOwner(List<Contact> conList)
    {
        Map<Id,Id> mapvalue = new Map<Id,Id>();
        for(Contact con: conList)
        {
            mapvalue.put(con.Id,con.OwnerId);
        }
        
        List<Contact> contocheck = [Select Id,OwnerId from Contact where Id =: mapvalue.keyset()];
        List<User> allActiveUser = [Select Id,IsActive,Name from User where IsActive = TRUE];
        List<User> conOwner = [Select Id,IsActive from User where Id =: mapvalue.values() and IsActive = FALSE];
        integer i=0;
        if(contocheck.size()>0)
        {
            system.debug(mapvalue.values());
            Set<Id> userId = new Set<Id>();
            for(User u :conOwner)
            {
             	userId.add(u.Id);   
            }
            
            for(Contact con: conList)
            {
                if(userId.contains(con.OwnerId))
                {
                    con.OwnerId = allActiveUser[i].Id;
                    i+=1;
                }
        
            }
           
            
        }
        
        
        
    }

}