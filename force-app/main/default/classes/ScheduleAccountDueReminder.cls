global class ScheduleAccountDueReminder implements Schedulable{

    global void execute(System.SchedulableContext ctx){
        
 		AccountDue accountLastMonthDueJob = new AccountDue();
        Database.executeBatch(accountLastMonthDueJob);
       
    }
}