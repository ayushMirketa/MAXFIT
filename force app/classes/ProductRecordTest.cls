@isTest

public class ProductRecordTest{

    // This is a test method that tests the getCallout() method

    @isTest static void testGetCallout(){
        // Set up the mock for the HTTP callout
        Test.setMock(HttpCalloutMock.class, new priceBookMock());
        // Make the callout and get the response
        HttpResponse response=CreateProductRecord.createRecord();
        // Assert that the response status code is 200
        System.assertEquals(200, response.getStatusCode(),'Successful Authentication');
        // Get the product that was created by the callout
        Product2 product=[Select Id, Name from Product2 where Name='AyushBrand'];
        // Assert that the product name is correct
        System.assertEquals(product.Name,'AyushBrand','hg');
         // Get the price book that was created by the callout
        Pricebook2 pricebook=[Select Name from Pricebook2 where Name='Ayush-pricebook'];
         // Assert that the price book name is correct
        System.assertEquals(product.Name,'Ayush-pricebook','gf');
        // Get the custom price book entry that was created by the callout

        List<PricebookEntry> customEntry=[Select Id from PricebookEntry where Pricebook2Id =: pricebook.Id AND Product2Id=:product.Id];
        // Assert that the custom price book entry was created successfully
        System.assertEquals(customEntry.size(),1,'fgg');

    }
    
}