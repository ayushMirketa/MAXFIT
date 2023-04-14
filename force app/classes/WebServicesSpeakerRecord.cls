@RestResource(UrlMapping = '/Speaker/*')
global with sharing class WebServicesSpeakerRecord {
@HttpPost
global static Id insrtrecord(String name ,String email, String phone, String company) {
Speaker__c spkrRecord = new Speaker__c(Name = name,Email__c = email,Phone__c = phone,Company__c = company);
RestContext.response = new RestResponse();
try{
insert spkrRecord;
RestContext.response.statusCode = 200 ;
return spkrRecord.Id;
}
catch(Exception e){
RestContext.response.statusCode = 400 ;
return null;
}
}

}