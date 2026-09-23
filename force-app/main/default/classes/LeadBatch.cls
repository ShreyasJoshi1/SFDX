public class LeadBatch implements Database.Batchable<sObject> {
    public Database.QueryLocator start (Database.BatchableContext bc)
    {
        String Query = 'Select id, Name, leadsource from Lead';
        return Database.getQueryLocator(Query);
    }
    
    public void execute(Database.BatchableContext bc, List<Lead> leadList){
		// process each batch of records
		for(Lead ld:leadlist){
		ld.leadsource = 'Web';
		}
        Database.update(leadlist,false);
    }  
    public void finish(Database.BatchableContext bc){
// execute any post-processing operations
		}
    

}