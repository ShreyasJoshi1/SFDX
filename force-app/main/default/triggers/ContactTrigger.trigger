trigger ContactTrigger on Contact (before insert, before update) {
    
    if(trigger.isbefore && Trigger.isUpdate)
    {
       //ContactHandler.updateTotalCountonAcc(trigger.new);
        ContactHandler.changeContactOwner(trigger.new);
    }
    else if(Trigger.isBefore && Trigger.isInsert)
    {
    	ContactHandler.checkDuplicateEmail(trigger.new);
    }

}