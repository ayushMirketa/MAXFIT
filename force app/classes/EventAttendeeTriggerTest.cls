@isTest
public class EventAttendeeTriggerTest {
    @isTest Static void setupData(){
        Event_Organizer__c  org = new Event_Organizer__c (
            Name = 'AYUSH MISRA',
            Phone__c = '9695344777',
            Email__c = 'ayush.misra@mirketa.com',
            Alternative_Phone__c  = '9695344777',
            Alternative_Email__c ='ayushmisra02@gmail.com');
            insert org;
            Event__c event = new Event__c(
                Name__c = 'MAX FIT Campaign',
                Event_Organizer__c  = org.Id,
                Event_Type__c = 'Virtual',
                Frequency__c  = 'Weekly',
                Max_Seats__c  = 199,
                Recurring__c = true,
                Live__c = true,
                Start_Date_Time__c = System.now(),
                End_Date_Time__c  = System.now().addDays(3)
            );
            insert event;
            Attendees__c att = new Attendees__c(
                Name = 'Rudra rana',
                Email__c = 'rudra.rana@gmail.com',
                Phone__c = '9807654321'
            );
            insert att;
            Event_Attendee__c evtAtt = new Event_Attendee__c(Event__c = event.Id, Attendees__c = att.Id);
            insert evtAtt;
            List<Event_Attendee__c> eat= [select id ,Event__c,Attendees__c from Event_Attendee__c where id=:evtAtt.Id];
   Test.startTest();
   EventAttendeeTriggerHandler.AttendeeEmailSend(eat);
   Test.stopTest();
   Integer invoc = Limits.getEmailInvocations();
   System.assertEquals(1,invoc,'email send succesfully');

    }
}