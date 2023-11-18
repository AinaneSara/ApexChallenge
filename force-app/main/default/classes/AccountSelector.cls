/**
 * @description       : Selector class for Account
 * @author            : sara.aiane@gmail.com
 * @group             : 
 * @last modified on  : 11-18-2023
 * @last modified by  : sara.aiane@gmail.com
**/
public class AccountSelector {

     /**
    * @description  : Get the Account from IDs 
    * @author sara.aiane@gmail.com | 11-17-2023 
    * @param Set<Id> ids
    * @return List<Account>
    **/
    public List<Account> retriveAccountsWithIds(Set<Id> ids){
        
        return [SELECT Id FROM Account WHERE Id IN :ids ];
    }
}