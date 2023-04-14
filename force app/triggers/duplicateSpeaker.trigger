trigger duplicateSpeaker on Event_Speakers__c (before insert) {
    DuplicateSpeakerTriggerHandler.duplicateSpeaker(trigger.new);
              }