/**
 * @description       : Test class for AccountSelector 
 * @author            : sara.aiane@gmail.com
 * @group             : 
 * @last modified on  : 11-18-2023
 * @last modified by  : sara.aiane@gmail.com
**/
@isTest
public class AccountSelectorTest {
    
     /**
    * @description : Test the method RetrieveAccountsWithIds()
    * @author sara.aiane@gmail.com | 11-18-2023 
    **/

    @isTest
    static void testRetrieveAccountsWithIds() {
        // Create test data
        List<Account> testAccounts = TestDataFactory.createTestAccounts(2);
        Set<Id> testAccountIds = new Set<Id>{testAccounts[0].Id, testAccounts[1].Id};

        // Start test execution context
        Test.StartTest();

        // Call the method being tested
        AccountSelector selector = new AccountSelector();
        List<Account> retrievedAccounts = selector.retriveAccountsWithIds(testAccountIds);

        // Stop test execution context
        Test.StopTest();

        // Perform assertions to validate the results
        System.assertEquals(2, retrievedAccounts.size(), 'Number of retrieved accounts should be 2');
    }
}