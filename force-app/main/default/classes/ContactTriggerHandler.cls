public class ContactTriggerHandler {
    public static void countAndCostOfTraining(List<Trainee__c> listOfTrainee){
        try{
            if(listOfTrainee.size()>0){
                System.debug('list of trainee '+listOfTrainee);
                List<AggregateResult> listOfContact = new List<AggregateResult>();
                 List<Contact> listOfContactToUpdate = new List<Contact>();
                Set<Id> commonSet = New Set<Id>();
                for( Trainee__c traineeObj : listOfTrainee ){
                   if(traineeObj.Contact__c != Null) 
                       commonSet.add(traineeObj.Contact__c);
                }
                system.debug('common sets ' + commonSet);
                listOfContact=[Select Contact__c,Count(Id) ContactCount, Sum(Course_Fee__c) Fee 
                               from Trainee__c Where Contact__c IN:commonSet group by Contact__c Limit 10000];
                //system.debug('Aggregated Result '+ listOfContact);
                if(listOfContact.size()>0){
                    System.debug('total contact '+listOfContact);
                    for(AggregateResult agr:listOfContact){
                        Contact conObj = New Contact();
                        conObj.Id = (String)agr.get('Contact__c');
                        conObj.Total_Training__c = (Integer)agr.get('ContactCount');
                        conObj.Total_Training_Cost__c = (Double)agr.get('Fee');
                        listOfContactToUpdate.add(conObj);
                    }
                    
                }
                if(listOfContactToUpdate.size()>0)
                    system.debug('updatelist '+listOfContactToUpdate);
                    Update listOfContactToUpdate;                
            }
        }
        catch(Exception ex){
            System.debug(ex.getLineNumber());
            System.debug(ex.getMessage());
        }
    }
}