@RestResource(urlMapping='/Event/*')
        global with sharing class Eventwebservices {
            @HttpGet
            global static List<Event__c> getEvent() {
          List <Event__c> events ;
                

            events = [Select Id, Name__c,Start_Date_Time__c, Max_Seats__c,Event_Organizer__r.Name,Event_Organizer__r.Email__c FROM Event__c WITH SECURITY_ENFORCED ];
           
     
        return events;
                
            }
        }