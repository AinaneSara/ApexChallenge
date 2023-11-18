/**
 * @description       : Class contains the data for the Test
 * @author            : sara.aiane@gmail.com
 * @group             : 
 * @last modified on  : 11-18-2023
 * @last modified by  : sara.aiane@gmail.com
**/
@isTest
public class TestDataFactory {
        /**
        * @description 
        * @author sara.aiane@gmail.com | 11-17-2023 
        * @param accountName 
        * @return Account 
        **/
        public static Account createTestAccount(String accountName) {
            return new Account(Name = accountName);
        }

        /**
        * @description 
        * @author sara.aiane@gmail.com | 11-17-2023 
        * @param account 
        * @param lastName 
        * @return Contact 
        **/
        public static Contact createTestContact(Account account, String lastName) {
            return new Contact(AccountId = account.Id, LastName = lastName);
        }
    
    
        public static List<Account> createTestAccounts(Integer numberOfAccounts) {
        List<Account> accounts = new List<Account>();

        for (Integer i = 0; i < numberOfAccounts; i++) {
            String name = 'Test Account ' + i;
            Account acc = new Account();
            acc.Name = name;
            accounts.add(acc);
        }

        insert accounts;
        return accounts;
    }
    
    public static List<Contact> createTestContacts(List<Account> relatedAccounts, Integer numberOfContactsPerAccount) {
        List<Contact> contacts = new List<Contact>();

        for (Account acc : relatedAccounts) {
            for (Integer i = 0; i < numberOfContactsPerAccount; i++) {
                Contact con = new Contact(
                    FirstName = 'Test Contact ' + i,
                    LastName = 'Last Name',
                    AccountId = acc.Id,
                    Activated__c = false // Add other required fields as needed
                );
                contacts.add(con);
            }
        }

        insert contacts;
        return contacts;
    }

}