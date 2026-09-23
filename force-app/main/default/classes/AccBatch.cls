public class AccBatch implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bc) {
// collect the batches of records or objects to be passed to execute
String query='Select id,name,Rating from Account';
return Database.getQueryLocator(query);
}
public void execute(Database.BatchableContext bc, List<Account> accList){
// process each batch of records
for(Account acc:accList){
acc.Rating='Cold';
}
Database.update(accList,false);
}
public void finish(Database.BatchableContext bc){
// execute any post-processing operations
}

}