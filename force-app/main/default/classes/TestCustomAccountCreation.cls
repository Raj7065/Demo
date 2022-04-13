@isTest
private class TestCustomAccountCreation {
  @isTest static void testCallout() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new CustomAccountMockHttpResponse());
        
        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
  		CustomAccountRestCall cs = new CustomAccountRestCall();
        HttpResponse result = cs.customAccountCreation();
       
            System.debug('Result');
        String actual ='{"totalSize":22,"done":true,"records":[{"attributes":{"type":"Account","url":"/services/data/v54.0/sobjects/Account/0015j00000bsaOKAAY"},"Id":"0015j00000bsaOKAAY","Name":"Merkle"}]}';
        String expected = result.getbody();
      
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