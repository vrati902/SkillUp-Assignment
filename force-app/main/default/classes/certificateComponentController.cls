public class certificateComponentController 
{
    Public Trainee__c trainee {get;set;}
    Public Course__c course {get;set;}
    Public Trainer__c trainer {get;set;}
    
    public certificateComponentController() 
    {
        trainee=[SELECT Name, Course__c, Enrollment_Date__c FROM Trainee__c where Id=:ApexPages.currentPage().getParameters().get('id')];
        course=[Select Name, Trainer__c from Course__c Where id=:trainee.Course__c];
        trainer=[Select Name from Trainer__c where id=:course.Trainer__c];
    }
  }