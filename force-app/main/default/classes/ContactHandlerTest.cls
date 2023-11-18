/**
 * @description       : Test class for ContactHandler
 * @author            : sara.aiane@gmail.com
 * @group             : 
 * @last modified on  : 11-18-2023
 * @last modified by  : sara.aiane@gmail.com
**/
@isTest
public class ContactHandlerTest {

    @isTest
    static void testUpdateAccounts() {
        // Create test data using Test Data Factory
        Account testAccount = TestDataFactory.createTestAccount('Test Account');
        insert testAccount;
        Contact testContact = TestDataFactory.createTestContact(testAccount , 'Contact');
        insert testContact;
        List<Account> testAccounts = new List<Account>{testAccount};
        List<Contact> testContacts = new List<Contact>{testContact};

        // Create a list of contact Ids for testing updateAccounts method
        List<Id> testContactIds = new List<Id>{testContacts[0].Id, testContacts[0].Id};

        // Start test execution context
        Test.StartTest();

        // Call the method being tested
        List<Id> updatedAccounts = ContactHandler.updateAccounts(testContactIds);

        // Stop test execution context
        Test.StopTest();

        // Query the accounts and assert that the Activated__c field is updated
        List<Account> queriedAccounts = [SELECT Id, Activated__c FROM Account WHERE Id IN :updatedAccounts];
        for (Account queriedAccount : queriedAccounts) {
            System.assertEquals(queriedAccount.Activated__c, testContacts[0].Activated__c, 'Activated__c should be updated based on the associated Contact');
        }
    }
}