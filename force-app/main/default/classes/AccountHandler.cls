/**
 * @description       : Class AccountHandler implements methods to update the Contacts related to Accounts in the trigger
 * @author            : sara.aiane@gmail.com
 * @group             : 
 * @last modified on  : 11-18-2023
 * @last modified by  : sara.aiane@gmail.com
**/
public class AccountHandler {

    /**
    * @description  : Get the child contacts related to a List of account Ids
    * @author sara.aiane@gmail.com | 11-17-2023 
    * @param accountIds 
    * @return Map<Id, List<Contact>> 
    **/
    public static Map<Id, List<Contact>> getChildContactIds(List<Id> accountIds) {

        Map<Id, List<Contact>> contactMap = new Map<Id, List<Contact>>();
        ContactSelector selector = new ContactSelector();
        List<Contact> contacts = selector.retriveContactsWithAccountIds(accountIds);

        // Organize contacts by AccountId in the map
        for (Contact con : contacts) {
            if (!contactMap.containsKey(con.AccountId)) {
                contactMap.put(con.AccountId, new List<Contact>{con});
            } else {
                contactMap.get(con.AccountId).add(con);
            }
        }

        return contactMap;
    }

    /**
    * @description  update contacts 
    * @author sara.aiane@gmail.com | 11-17-2023 
    * @param contactMap 
    **/
    public static void updateContacts(Map<Id, List<Contact>> contactMap) {

    // Iterate through the map entries and update the contacts
    List<Contact> contactsToUpdate = new List<Contact>();
    for (Id accountId : contactMap.keySet()) {
        List<Contact> contacts = contactMap.get(accountId);
        if (contacts != null && !contacts.isEmpty()) {
            for (Contact con : contacts) {
                con.Activated__c = con.Account.Activated__c;
                contactsToUpdate.add(con);
            }
        }
    }
    update contactsToUpdate;
}
    
}