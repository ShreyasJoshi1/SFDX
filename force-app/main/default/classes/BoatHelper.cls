public class BoatHelper {
    public static void createBoats(List<Boat__c> btlist)
    {
        Set<Id> btId = new Set<Id>();
        for(Boat__c bt:btlist)
        {
            btId.add(bt.Id);
        }
        
        List<Boat__c> boatlist = [Select Id,BoatType__c from Boat__c where BoatType__c IN : btId];
        for(Boat__c btype :boatlist)
        {
            btype.BoatType__c = btype.Id; 
        }
        update boatlist;
        
    }

}