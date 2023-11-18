/**
 * @description       : Test class for TriggerHandler 
 * @author            : sara.aiane@gmail.com
 * @group             : 
 * @last modified on  : 11-18-2023
 * @last modified by  : sara.aiane@gmail.com
**/
@isTest
private class TriggerHandlerTest {

    /**
    * @description : Call the trigger handler methods
    * @author sara.aiane@gmail.com | 11-18-2023 
    **/
    @isTest
    static void testTriggerHandlerMethods() {
        // Create test data
        Account testAccount = TestDataFactory.createTestAccount('Test Account');
        insert testAccount;
        
        Account olAccount = testAccount;
        olAccount.Activated__c = False;
        
        Contact testContact = TestDataFactory.createTestContact(testAccount, 'Test Contact');
        insert testContact;
        
        Contact oldContact = testContact ;
        oldContact.Activated__c = False;

        

        // Set up initial conditions
        testAccount.Activated__c = true;
        testContact.Activated__c = true; 


        update testAccount;
        update testContact;
      
        // Call the trigger handler methods
        Test.startTest();
        TriggerHandler.handleAccountActivation(
            new Map<Id, Contact>{testContact.Id => oldContact},
            new Map<Id, Contact>{testContact.Id => testContact}
        );
        TriggerHandler.handleContactActivation(
            new Map<Id, Account>{testAccount.Id => olAccount},
            new Map<Id, Account>{testAccount.Id => testAccount}
        );
        Test.stopTest();

        // Validate the result
        Contact updatedContact = [SELECT Id, Activated__c FROM Contact WHERE Id = :testContact.Id LIMIT 1];
        System.assertEquals(true, updatedContact.Activated__c);

        Account updatedAccount = [SELECT Id, Activated__c FROM Account WHERE Id = :testAccount.Id LIMIT 1];
        System.assertEquals(true, updatedAccount.Activated__c);
    }
}