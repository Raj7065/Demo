@isTest
public with sharing class TestAccessTokenGenerator {
    
     @isTest static void testCallout() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        
        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        AccessTokenGenerator ac = new AccessTokenGenerator();
      
         String  results = ac.generateToken();
         system.debug('resultsssss'+results);
        
            System.debug('Result');
        String actual ='{"access_token":"SESSION_ID_REMOVED","instance_url":"https://merkle-1c5-dev-ed.my.salesforce.com","id":"https://login.salesforce.com/id/00D5j00000AFKLpEAP/0055j000005hey9AAA","token_type":"Bearer","issued_at":"1648621578677","signature":"B3AZHD1m9z1JZFWPa69fEhPiwUdpGA1ZYE8DR0R1KmU="}';
        String expected = results;
         test.startTest();
         try {
        System.Debug('Hi inside try block');
        System.assertEquals(actual,expected);
        } catch (Exception e) {
         System.Debug('Hi inside Catch block');
        //System.assert(false, 'Exception ' + e);
        System.assert(e.getMessage().contains('FLSException For RM Project:RM_Project__c'), + e.getMessage());
        }
        
         test.stopTest();
       
         
        
    }
}