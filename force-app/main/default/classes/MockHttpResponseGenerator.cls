@isTest
global class MockHttpResponseGenerator implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
      
      // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"totalSize":20,"done":true,"records":[{"attributes":{"type":"Account","url":"/services/data/v54.0/sobjects/Account/0015j00000YzS0ZAAV"},"Id":"0015j00000YzS0ZAAV","Name":"shree saraswathi"}]}');
        res.setStatusCode(200);
        return res;
    }
}