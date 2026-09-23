/**
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * Class Name      : getAccounts
 * Author          : <YourName>
 * Created Date    : Mar 19, 2026
 * Last Modified By: <YourName>
 * Last Modified On: Mar 19, 2026
 * Description     : This class implements for......
 *  
 * Change History  :
 *  Date          │   Author     │   Change
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 *  Mar 19, 2026  │ <YourName>   │ Initial version
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 */

public class getAccounts {

	@AuraEnabled(cacheable=true)
	public static List<Account> doSomething(String key) {
		String skey = '%' + key + '%';
		List<Account> accs = [Select id from Account where Name like: skey limit 1];
		return 	accs;	
	}

}