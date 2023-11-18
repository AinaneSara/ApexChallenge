/**
 * @description       : Trigger for the Account 
 * @author            : sara.aiane@gmail.com
 * @group             : 
 * @last modified on  : 11-18-2023
 * @last modified by  : sara.aiane@gmail.com
**/
trigger AccountActivationTrigger on Account (after update) {
    if (TriggerHandler.inFistTime) {
        TriggerHandler.handleContactActivation(Trigger.oldMap, Trigger.newMap);
        TriggerHandler.inFistTime = false;
    }
}