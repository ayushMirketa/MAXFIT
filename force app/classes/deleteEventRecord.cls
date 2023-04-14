public class deleteEventRecord implements Database.Batchable<Sobject>{
                  public Database.QueryLocator start (Database.BatchableContext BC){
                                    String query='Select Id from Event__c Where End_Date_Time__c <  LAST_N_MONTHS:2 AND Live__c = True ';
                                    return Database.getQueryLocator(query);

}
public void execute(Database.BatchableContext BC,List<Event__c>Scope){
                  delete Scope;
}
                  public void finish(Database.BatchableContext BC){
                                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                                    mail.setToAddresses(new String[]{'ayush.misra@mirketa.com'});
                                    mail.setSubject('Batch Job Completed');
                                    mail.setPlainTextBody('Execution of the BAtch has been processed');
                                    Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
                  }
}