@isTest
public class ErrorLogUtilsTest {
    @isTest
    static void ErrorLogUtilsTest(){
        String LogDetails = 'This is Error here';
        String ProcessName = 'During QA';
        Test.startTest();
        ErrorLogRecord.insertErrorLog(LogDetails, ProcessName);
        Test.stopTest();
        List<Error_Logs__c> newRecord = [Select Id,Log_Date_Tile__c,Log_Details__c,Process_Name__c from Error_Logs__c where Process_Name__c=:ProcessName];
        System.assertEquals(1,newRecord.size());
          System.assertEquals(Datetime.now(),newRecord[0].Log_Date_Tile__c);
          System.assertEquals(LogDetails,newRecord[0].Log_Details__c);
          System.assertEquals(ProcessName,newRecord[0].Process_Name__c);
        
    }
    

}