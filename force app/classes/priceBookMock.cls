// This is a mock class that simulates a callout to a price book API.
// It implements the HttpCalloutMock interface and provides a fake response
// to the HTTP request made by the code being tested.
global with sharing class priceBookMock implements HttpCalloutMock{

    // This method is called by the code being tested to simulate an HTTP response.
    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('[{"id":1,"title":"AyushBrand","price":109.95,"description":"Your perfect pack for everyday use and walks in the forest"}]');
        response.setStatusCode(200);
        return response; 
    }

    }