trigger BoatTrigger on Boat__c (after insert, after update) {
    if(trigger.isafter && trigger.isupdate)
    {
        List<Boat__c> Blist = new List<Boat__c>();
        for(Boat__c bt:Trigger.new)
        {
            Blist.add(bt);
        }
        
    }

}