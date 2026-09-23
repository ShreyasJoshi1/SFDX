trigger AccountTrigger on Account (before delete) {
    if(trigger.isBefore && trigger.isDelete)
    {
        
        AccountHandler.checkRelatedOpp(trigger.old);
        
        
    }

}