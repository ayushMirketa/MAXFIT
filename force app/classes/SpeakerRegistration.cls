public class SpeakerRegistration {
    public Speaker__c speaker{get; set;}
    public Event_Speakers__c event_speaker{get; set;}

    public SpeakerRegistration(){

        speaker=new Speaker__c();
        event_speaker= new Event_Speakers__c();
    }
    public void save(){
        try{
            insert speaker;
            event_speaker.Speaker__c=speaker.Id;
            // event_speaker.Event__c=event.Id;
            insert event_speaker;
            speaker=new Speaker__c();
            event_speaker=new Event_Speakers__c();
        }
        catch(Exception e){
            System.debug(e.getMessage());
        }
    }
}