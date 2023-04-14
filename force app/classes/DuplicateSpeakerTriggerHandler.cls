public with sharing class DuplicateSpeakerTriggerHandler {

    public static void duplicateSpeaker( List<Event_Speakers__c> newEventSpeakerRecords) {
        List<Id> speakerIds = new List<Id>();
                  Map<Id,DateTime> requested_bookings = new Map<Id,DateTime>();
                  for(Event_Speakers__c esc:newEventSpeakerRecords){
                                    requested_bookings.put(esc.Event__c,null);
                                    speakerIds.add(esc.Speaker__c);
                  }
                  List<Event__c> relatedEvents=[Select Id,Start_Date_Time__c,	End_Date_Time__c from Event__c where Id in :requested_bookings.keySet()];
                  for(Event__c related_event : relatedEvents) {
                      requested_bookings.put(related_event.Id,related_event.Start_Date_Time__c);
                  }
                  List<Event_Speakers__c> related_speakers = [SELECT ID, Speaker__c, Event__c,
                  Event__r.Start_Date_Time__c,Event__r.End_Date_Time__c from Event_Speakers__c WHERE Speaker__c IN :speakerIds];
                  for(Event_Speakers__c esc:newEventSpeakerRecords){
                      Datetime bookingtime=requested_bookings.get(esc.Event__c);
                      for(Event_Speakers__c speaker:related_speakers){
                          if(speaker.Speaker__c==esc.Speaker__c && speaker.Event__r.Start_Date_Time__c<=bookingtime && speaker.Event__r.End_Date_Time__c>=bookingtime ){
                              esc.addError('Duplicate booking found');
                          }
                      }
                  }

    }
}