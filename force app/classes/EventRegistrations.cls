public class EventRegistrations{
    public Event_Organizer__c event_organizer{get; set;}
    public Event__c event{get; set;}
    public Location__c location{get; set;}
    public EventRegistrations() {
        event_organizer = new Event_Organizer__c();
        event = new Event__c();
        location = new Location__c(); 

        
    }
    public void save(){
        try{
            insert location;
            event_organizer.Locations__c=location.Id;
            insert event_organizer;
            event.Event_Organizer__c=event_organizer.Id;
            event.Locations__c=location.Id;
            insert event;
        
        }
        catch(Exception e){
            System.debug(e.getMessage());
            
        }
    }
}