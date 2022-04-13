@isTest
public with sharing class CustomAccountTest {
    public CustomAccountTest() {

    }
   

     @isTest static void testCallout() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        
        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        CustomAccountRestCall cs = new CustomAccountRestCall();
        HttpResponse  results = cs.customAccountCreation();
        String actual ='{"totalSize":20,"done":true,"records":[{"attributes":{"type":"Account","url":"/services/data/v54.0/sobjects/Account/0015j00000YzS0ZAAV"},"Id":"0015j00000YzS0ZAAV","Name":"shree saraswathi"}]}';
        String expected = results.getBody();
        System.assertEquals(200, results.getStatusCode());
        System.assertEquals(actual,expected);
        
    }
}