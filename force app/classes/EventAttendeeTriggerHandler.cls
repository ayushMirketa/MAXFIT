public class EventAttendeeTriggerHandler {
    public static void AttendeeEmailSend(List<Event_Attendee__c> EventAttendeeNewrecord) {
        List<Messaging.SingleEmailMessage> Emails = new List<Messaging.SingleEmailMessage>();

        Set<Id> eventIds = new Set<Id>();
        Set<Id> attendeeIds = new Set<Id>();
        for(Event_Attendee__c eventAttendeerecord : EventAttendeeNewrecord){
            if (eventAttendeerecord.Event__c != null && eventAttendeerecord.Attendees__c != null) {
                eventIds.add(eventAttendeerecord.Event__c);
                attendeeIds.add(eventAttendeerecord.Attendees__c);
            }
        }
        Map<Id, Event__c> eventMap = new Map<Id, Event__c>([SELECT Name,Name__c, Start_Date_Time__c, Locations__r.Name,
        Event_Organizer__r.Name FROM Event__c WHERE Id IN :eventIds]);

        Map<Id, Attendees__c> attendeeMap = new Map<Id, Attendees__c>([SELECT Name, Email__c FROM Attendees__c WHERE Id IN :attendeeIds]);

        for (Event_Attendee__c eventAttendeerecord : EventAttendeeNewRecord) {
            if (eventAttendeerecord.Event__c == null || eventAttendeerecord.Attendees__c == null) {
                continue;
            }
            Event__c event = eventMap.get(eventAttendeerecord.Event__c);
            Attendees__c attendee = attendeeMap.get(eventAttendeerecord.Attendees__c);
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new String[]{attendee.Email__c});
            email.setSubject('Pass for the "' + event.Name__c + '"');
            email.setPlainTextBody('Dear ' + attendee.Name + ',\n\nThank you for registering for "'+ event.Name__c + '" which will be organized on '+ event.Start_Date_Time__c.format('dd,mm,yyyy') + ' and will be held in '+ event.Locations__r.Name + '. We are excited to have you, see you at the event.\n\nThanks,\n'+ event.Event_Organizer__r.Name);
            Emails.add(email);
        }
        try {
            Messaging.sendEmail(Emails);
        }
        catch (Exception e) {
            ErrorLogRecord.insertErrorLog(e.getMessage(), 'Error sending email');
        }
    }
}