@isTest
private class CheckDuplicateSpeakerBookingTest{
@isTest static void testCheckDuplicateSpeakerBooking() {
    // Create test data
    //Event_Speaker__c speaker = new Event_Speaker__c();
    Event__c event1 = new Event__c(Name__c = 'Mirketa webinar', Locations__c = 'a0L2w0000074ZaQEAU',Live__c=True, Start_Date_Time__c = Date.newInstance(2024, 3, 12), End_Date_Time__c = Date.newInstance(2025, 3, 30));
    insert event1;
    Event__c event2 = new Event__c(Name__c = 'Webinar on AI',Locations__c = 'a0L2w0000074ZaQEAU', Live__c=True,Start_Date_Time__c = Date.newInstance(2024, 3, 10), End_Date_Time__c = Date.newInstance(2026, 3, 25));
    insert event2;
    Event_Speakers__c booking1 = new Event_Speakers__c(Speaker__c ='a0P2w00000HrRFkEAN' , Event__c = event1.Id);
    insert booking1;
    Event_Speakers__c booking2 = new Event_Speakers__c(Speaker__c ='a0P2w00000HrRFkEAN', Event__c = event2.Id);
    // Test that the trigger throws an error when trying to insert the second booking
    Test.startTest();
    try {
        insert booking2;
    } catch (DmlException e) {
     //   String expectedErrorMessage = 'Duplicate booking found';
        System.assert(e.getMessage().contains('Duplicate booking found'));
    }
    Test.stopTest();
}

        // Test that the trigger throws an error when trying to insert the second booking
        //Test.startTest();
          
      // CheckDuplicateSpeakerBookingTest.testCheckDuplicateSpeakerBooking();
        
       // Test.stopTest();
   // 
}