trigger EventAttendeeTrigger on Event_Attendee__c (after insert) {
     if(trigger.isAfter && trigger.isInsert){
         EventAttendeeTriggerHandler.AttendeeEmailSend(trigger.new);
     }

}