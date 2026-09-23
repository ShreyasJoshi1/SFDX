public class AccountDetails {

	@AuraEnabled(cacheable=true)
    public static List<Account> getAccountDetails(String searchKey) {
        //System.debug('>>searchKey'+searchKey);
        String key='%'+searchKey + '%';
        //System.debug('>>key'+key);
        List<Account> accDetails=[Select id,Name,Phone from Account where Name like:key];
        //System.debug('accDetails>>'+accDetails);
        return accDetails;
    }


}