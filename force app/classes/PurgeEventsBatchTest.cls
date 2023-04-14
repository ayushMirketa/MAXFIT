@isTest
private class PurgeEventsBatchTest {

    @testSetup
    public static void testSetupData(){
       
        List<Event__c> eventList = new List<Event__c>();
        for(Integer i=0; i<=200; i++){
            Event__c event = new Event__c(
                Name__c = 'MAX FIT Campaign #'+i+1,
                Event_Type__c = 'Virtual',
                Frequency__c  = 'Weekly',
                Max_Seats__c  = 199,
                Recurring__c = true,
                Live__c = true,
                Start_Date_Time__c = System.now().addMonths(-4),
                End_Date_Time__c = System.now().addDays(3).addMonths(-4)
            );
            eventList.add(event);
        }
        insert eventList;
    }
    
    @isTest
   static void PurgeEventsBatch(){
        Test.startTest();

        String jobId = Database.executeBatch(new deleteEventRecord(), 250);
       
        Test.stopTest();
        List<Event__c> event = [Select Id from Event__C];
        System.assertEquals(0, event.size(),'ftrtftrft');
        
    }
}