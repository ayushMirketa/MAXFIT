@isTest

public class Eventwebservicestest {
@isTest

static void eventwebservicestest1() {
 List<Event__c> getRecord = new List<Event__c>();
 getRecord.add(new Event__c(Name__c = 'Ayush', Start_Date_Time__c = System.Now(), Max_Seats__c = 100));
insert getRecord;
 Test.startTest();
 List<Event__c> checkEntry = Eventwebservices.getEvent();
 Test.stopTest();
 System.assertEquals(1,checkEntry.size(),'failed');
}

}