/**
 * @description       : Selector Class for Contact 
 * @author            : sara.aiane@gmail.com
 * @group             : 
 * @last modified on  : 11-18-2023
 * @last modified by  : sara.aiane@gmail.com
**/
public class ContactSelector {
    
    /**
    * @description  : Get the Contacts from IDs 
    * @author sara.aiane@gmail.com | 11-18-2023 
    * @param List<Id> accountIds
    * @return List<Contact>
    **/
     public List<Contact> retriveContactsWithAccountIds(List<Id> accountIds){
        
        return [SELECT Id , Activated__c, Account.Id, Account.Activated__c FROM Contact WHERE AccountId IN :accountIds];
    }
    
    /**
    * @description  : Get the Contacts from IDs 
    * @author sara.aiane@gmail.com | 11-18-2023 
    * @param List<Id> contactIds
    * @return List<Contact>
    **/
     public List<Contact> retriveContactsWithIds(List<Id> contactIds){
        
        return [SELECT Id , Activated__c,  AccountId FROM Contact WHERE Id IN :contactIds];
    }
}