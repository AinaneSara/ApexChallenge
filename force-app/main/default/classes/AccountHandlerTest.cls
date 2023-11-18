/**
 * @description       : Test class for AccountHandler
 * @author            : sara.aiane@gmail.com
 * @group             : 
 * @last modified on  : 11-18-2023
 * @last modified by  : sara.aiane@gmail.com
**/
@isTest
public class AccountHandlerTest {

    @isTest
    static void testGetChildContactIds() {
        // Create test data using Test Data Factory
        Account testAccount = TestDataFactory.createTestAccount('Test Account');
        insert testAccount;
        Contact testContact = TestDataFactory.createTestContact(testAccount , 'Contact');
        insert testContact;
        List<Account> testAccounts = new List<Account>{testAccount};
        List<Contact> testContacts = new List<Contact>{testContact};

        // Start test execution context
        Test.StartTest();

        // Call the method being tested
        Map<Id, List<Contact>> contactMap = AccountHandler.getChildContactIds(new List<Id>{testAccounts[0].Id, testAccounts[0].Id});

        // Stop test execution context
        Test.StopTest();

        // Perform assertions to validate the results
        System.assertEquals(1, contactMap.size(), 'Contact map should have entries for both test accounts');
        // Add more assertions as needed
    }

    @isTest
    static void testUpdateContacts() {
        // Create test data using Test Data Factory
        Account testAccount = TestDataFactory.createTestAccount('Test Account');
        insert testAccount;
        Contact testContact = TestDataFactory.createTestContact(testAccount , 'Contact');
        insert testContact;
        List<Account> testAccounts = new List<Account>{testAccount};
        List<Contact> testContacts = new List<Contact>{testContact};

        // Create a map for testing updateContacts method
        Map<Id, List<Contact>> testContactMap = new Map<Id, List<Contact>>{
            testAccounts[0].Id => new List<Contact>{testContacts[0]},
            testAccounts[0].Id => new List<Contact>{testContacts[0]}
        };

        // Start test execution context
        Test.StartTest();

        // Call the method being tested
        AccountHandler.updateContacts(testContactMap);

        // Stop test execution context
        Test.StopTest();

        // Query the contacts again and assert that the Activated__c field is updated
        List<Contact> updatedContacts = [SELECT Id, Activated__c FROM Contact WHERE AccountId IN :testAccounts];
        for (Contact updatedContact : updatedContacts) {
            System.assertEquals(updatedContact.Activated__c, testAccounts[0].Activated__c, 'Activated__c should be updated based on the associated Account');
        }
    }
}