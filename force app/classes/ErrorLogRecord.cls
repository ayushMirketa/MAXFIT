public class ErrorLogRecord {
    public static void insertErrorLog(String LogDetails, String ProcessName)
     { Error_Logs__c errorLog = new Error_Logs__c();
         errorLog.Log_Date_Tile__c = Datetime.now();
          errorLog.Log_Details__c = LogDetails;
           errorLog.Process_Name__c = ProcessName;
            insert errorLog;
}
}