public with sharing class eventSpeakerController {
    public Event__c event {get; set;}
    public List <Event_Speakers__c> event_speaker {get; set;}
    public eventSpeakerController() {
        Id eventID = ApexPages.currentPage().getParameters().get('id');
        if(eventID != null){
            event = [Select Name__c, Event_Organizer__r.Name, Locations__c,Locations__r.City__c,Locations__r.Postal_Code__c,Locations__r.state__c,Locations__r.Country__c, Start_Date_Time__c From Event__c Where Id = :eventID];
            
            event_speaker = [Select Event__c, Speaker__c,Speaker__r.Name, Speaker__r.Profile_URL__c, Speaker__r.About_me__c From Event_Speakers__c Where Event__c = :eventID];
        }
    }
    
    }