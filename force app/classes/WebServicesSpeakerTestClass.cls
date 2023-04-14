@isTest

public  class WebServicesSpeakerTestClass {
@isTest

static void createSpeakerRecord() {
Test.startTest();

// RestContext.request = new RestRequest();
RestContext.response = new RestResponse();
Id spkrRecord1 = WebServicesSpeakerRecord.insrtrecord('Ayush','ayushmisra02@gmail.com','328','Mirketa');
Id spkrRecord2 = WebServicesSpeakerRecord.insrtrecord('Ayush','ayushmisra02@gmail.com','328','Mirketa');
List <Speaker__c> speaker = [Select Id, Name From Speaker__c Where Name= 'Ayush'];
// List<Speaker__c> checkPost = speakerWebService.insrtrecord();
//System.assertEquals(1,speaker.size(),'joi');
System.assertEquals(400, RestContext.response.statusCode,'tfh');
Test.stopTest();
}

}