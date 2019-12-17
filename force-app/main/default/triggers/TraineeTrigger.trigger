trigger TraineeTrigger on Trainee__c (after insert, after update) {
    
    if(Process_Deactivation__c.getInstance().Deactivate_Trigger__c) {
         System.debug('Bypassing trigger due to custom setting');
         return;
     }
    
    if(Trigger.isAfter)
    {
        if(Trigger.isUpdate)
            ContactTriggerHandler.countAndCostOfTraining(Trigger.new);
         if(Trigger.isInsert)
            ContactTriggerHandler.countAndCostOfTraining(Trigger.new);
    }
}