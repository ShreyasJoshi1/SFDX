/**
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * Class Name      : ContactDetails
 * Author          : <YourName>
 * Created Date    : Mar 20, 2026
 * Last Modified By: <YourName>
 * Last Modified On: Mar 20, 2026
 * Description     : This class implements for......
 *  
 * Change History  :
 *  Date          │   Author     │   Change
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 *  Mar 20, 2026  │ <YourName>   │ Initial version
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 */

public class ContactDetails {

	@AuraEnabled(cacheable=true)
	public static List<Contact> getContacts(String accId) {
		//String key = '%' + accname + '%';
		System.debug(accId);
		List<Contact> conlist =  [Select Id, Name, Phone, Email from Contact where AccountId =:accId];
		System.debug(conList);
		return conlist;
	}

}