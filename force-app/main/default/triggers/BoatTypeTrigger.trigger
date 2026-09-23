trigger BoatTypeTrigger on BoatType__c (after insert,after update) {
    
    if(trigger.isafter && trigger.isupdate)
    {
        List<BoatType__c> Btypelist = new List<BoatType__c>();
        for(BoatType__c bt:Trigger.new)
        {
            Btypelist.add(bt);
        }
        
    }

}