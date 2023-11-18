/**
 * @description       : Class ContactHandler implements methods to update the Accounts related to Contacts in the trigger
 * @author            : sara.aiane@gmail.com
 * @group             : 
 * @last modified on  : 11-18-2023
 * @last modified by  : sara.aiane@gmail.com
**/
public class ContactHandler {
    /**
    * @description 
    * @author sara.aiane@gmail.com | 11-17-2023 
    * @param contactIds 
    * @return List<Id> 
    **/
    public static  List<Id>  updateAccounts(List<Id> contactIds) {
        // Query the related Contact records for the specified Contact Ids
        ContactSelector contactSelector = new ContactSelector();
        List<Contact> contacts = contactSelector.retriveContactsWithIds(contactIds);

        // Map to store AccountId to Contact  activated__c field mapping
        Map<Id, Boolean> accountMap = new Map<Id, Boolean>();
        List<Id> accounts = new List<Id>();

        // Populate the map with AccountId to Contact activated__c field mapping
        for (Contact con : contacts) {
            accountMap.put(con.AccountId, con.Activated__c);
            
        }
        
        // Query the related Account records for the specified Account Ids
        AccountSelector accountSelector = new AccountSelector();
        List<Account> accountsToUpdate = accountSelector.retriveAccountsWithIds(accountMap.keySet());

        for (Account acc : accountsToUpdate) {
            acc.Activated__c = accountMap.get(acc.Id);
            accounts.add(acc.Id);
        }

        // Perform the bulk update
        update accountsToUpdate;
        return accounts;
    }
    
}