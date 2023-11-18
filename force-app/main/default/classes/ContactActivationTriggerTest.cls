/**
 * @description       : Test class for ContactActivationTrigger
 * @author            : sara.aiane@gmail.com
 * @group             : 
 * @last modified on  : 11-18-2023
 * @last modified by  : sara.aiane@gmail.com
**/
@isTest
public class ContactActivationTriggerTest {
    
    /**
    * @description : Test method for ContactActivationTrigger()
    * @author sara.aiane@gmail.com | 11-18-2023 
    **/
    @isTest
    static void testContactActivationTrigger() {
        // Create test data
        Account testAccount = TestDataFactory.createTestAccount('Test Account');
        insert testAccount;

        Contact testContact = TestDataFactory.createTestContact(testAccount, 'Test Contact');
        insert testContact;

        Contact testSecondContact = TestDataFactory.createTestContact(testAccount, 'Test Second Contact');
        insert testSecondContact;

        // Set up initial conditions
        testAccount.Activated__c = true;

        Test.startTest();
        update testAccount;
        Test.stopTest();

        // Validate the result
        Contact updatedContact = [SELECT Id, Activated__c FROM Contact WHERE Id = :testContact.Id LIMIT 1];
        System.assertEquals(true, updatedContact.Activated__c);
    }


}