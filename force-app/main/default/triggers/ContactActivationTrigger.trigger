/**
 * @description       : Trigger for the Contact 
 * @author            : sara.aiane@gmail.com
 * @group             : 
 * @last modified on  : 11-18-2023
 * @last modified by  : sara.aiane@gmail.com
**/
trigger ContactActivationTrigger on Contact (after update, after insert) {
    
    if (Trigger.isAfter && (Trigger.isUpdate|| Trigger.isInsert)) {
        
       if (TriggerHandler.inFistTime) {
          TriggerHandler.handleAccountActivation(Trigger.oldMap, Trigger.newMap);
          TriggerHandler.inFistTime = false;
       }     
    }      
}