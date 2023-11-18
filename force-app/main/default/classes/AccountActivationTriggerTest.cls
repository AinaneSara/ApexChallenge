/**
 * @description       : Test class for AccountActivationTrigger 
 * @author            : sara.aiane@gmail.com
 * @group             : 
 * @last modified on  : 11-18-2023
 * @last modified by  : sara.aiane@gmail.com
**/
@isTest
public class AccountActivationTriggerTest {
    
    /**
    * @description :Test method for AccountActivationTrigger()
    * @author sara.aiane@gmail.com | 11-18-2023 
    **/
    @isTest
    static void testAccountActivationTrigger() {
        // Create test data
        
        Account testAccount = TestDataFactory.createTestAccount('Test Account');
        insert testAccount;
        
        Contact testContact = TestDataFactory.createTestContact(testAccount, 'Test Contact');
        insert testContact;

        Contact testSecondContact = TestDataFactory.createTestContact(testAccount, 'Test Second Contact');
        insert testSecondContact;


        testContact.AccountId = testAccount.Id;
        testSecondContact.AccountId = testAccount.Id;

        // Set up initial conditions
        testContact.Activated__c = true;

        Test.startTest();
        update testContact;
        Test.stopTest();

        // Validate the result
        Account updatedAccount = [SELECT Id, Activated__c FROM Account WHERE Id = :testAccount.Id LIMIT 1];
        System.assertEquals(true, updatedAccount.Activated__c);
    }

}