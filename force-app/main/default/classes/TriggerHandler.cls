/**
 * @description       : 
 * @author            : sara.aiane@gmail.com
 * @group             : 
 * @last modified on  : 11-18-2023
 * @last modified by  : sara.aiane@gmail.com
**/
public class TriggerHandler {
    public static boolean inFistTime = true;

    /**
    * @description Method handles the activation/deactivation of the contacts related to Accounts
    * @author sara.aiane@gmail.com | 11-17-2023 
    * @param oldAccountMap 
    * @param newAccountMap 
    **/
    public static void handleContactActivation(Map<Id, Account> oldAccountMap ,Map<Id, Account> newAccountMap) {
        List<Id> accountIdList = new List<Id>();
        for (Account updatedAccount: newAccountMap.Values()) {
            if (updatedAccount.Activated__c != oldAccountMap.get(updatedAccount.Id).Activated__c) {
                accountIdList.add(updatedAccount.Id);
            }         
            Map<Id, List<Contact>> mapContactsToUpdate = AccountHandler.getChildContactIds(accountIdList);
            AccountHandler.updateContacts(mapContactsToUpdate);
        } 
    }

   /**
   * @description  Method handles the activation/deactivation of the Accounts related to contacts
   * @author sara.aiane@gmail.com | 11-17-2023 
   * @param oldContactMap 
   * @param newContactMap 
   **/
   public static void handleAccountActivation(Map<Id, Contact> oldContactMap, Map<Id, Contact> newContactMap ) {
        List<Id> contactIdList = new List<Id>();
        for (Contact updatedContact : newContactMap.Values()) {
            if (updatedContact.Activated__c != oldContactMap.get(updatedContact.Id).Activated__c) {
                 contactIdList.add(updatedContact.Id);
                }
            List<Id> updateAccounts = ContactHandler.updateAccounts(contactIdList);
            Map<Id, List<Contact>> mapContactsToUpdate = AccountHandler.getChildContactIds(updateAccounts);
            for (Id key : mapContactsToUpdate.keySet()) {
            List<Contact> contactList = mapContactsToUpdate.get(key);

            // Create a new list without the contacts that exist in newContactMap
            List<Contact> filteredList = new List<Contact>();
            for (Contact contact : contactList) {
                if (!newContactMap.containsKey(contact.Id)) {
                    filteredList.add(contact);
                }
            }
            // Update the map with the filtered list
            mapContactsToUpdate.put(key, filteredList);
            }
            // Print or use the updated map
            AccountHandler.updateContacts(mapContactsToUpdate);
        }  
    }
}