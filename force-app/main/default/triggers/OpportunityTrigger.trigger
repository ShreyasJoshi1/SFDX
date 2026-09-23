trigger OpportunityTrigger on Opportunity (after insert, after update) {
    Set<Id> accIds = new Set<Id>();
    if(trigger.isafter &&  Trigger.isInsert)
    {
        
        for(Opportunity opp: Trigger.new)
        {
            accIds.add(opp.AccountId);
        }
        
    }
    else if(Trigger.IsAfter && Trigger.IsUpdate)
    {
        for(Opportunity opp: Trigger.old)
        {
            accIds.add(opp.AccountId);
        }
    }
    
    List<AggregateResult> amtSum = [Select AccountId, SUM(Amount) totalAmount, COUNT(Id) OppCount from Opportunity where AccountId IN: accIds Group by AccountId];
    
    List<Account> acctoupdate = New List<Account>();
    
    for(AggregateResult ar: amtSum)
    {
        Account Acc = New Account();
        acc.id = (Id)ar.get('AccountId');
        acc.Total_Active_opportunity__c = (Decimal)ar.get('totalAmount');
        acc.Total_Opp_Amount__c = (decimal)ar.get('OppCount');
        acctoupdate.add(acc);
        
    }
    
    update acctoupdate;

}