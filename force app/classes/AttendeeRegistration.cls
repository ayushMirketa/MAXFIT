public class AttendeeRegistration {
    public Attendees__c attendees {get;set;}
    public Location__c location {get; set;}
    public Event_Attendee__c event_attendees{get; set;}
    public AttendeeRegistration(){
        attendees = new Attendees__c();
        location = new Location__c();
        event_attendees = new Event_Attendee__c();
    }

    public void save(){
        insert location;
        attendees.Address__c = location.Id;
        insert attendees;
        event_attendees.Attendees__c = attendees.Id;
        insert event_attendees;
        attendees = new Attendees__c();
        location = new Location__c();
        event_attendees = new Event_Attendee__c();
    }


    }