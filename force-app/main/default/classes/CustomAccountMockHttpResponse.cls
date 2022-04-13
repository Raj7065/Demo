global class CustomAccountMockHttpResponse implements HttpCalloutMock{
     // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
        system.debug('dataaaa'+req);
        HttpResponse res = new HttpResponse();
         if (req.getEndpoint().endsWith('Account')) {
             res.setHeader('Content-Type', 'application/json');
              res.setBody('{"totalSize":22,"done":true,"records":[{"attributes":{"type":"Account","url":"/services/data/v54.0/sobjects/Account/0015j00000bsaOKAAY"},"Id":"0015j00000bsaOKAAY","Name":"Merkle"}]}');
              res.setStatusCode(200);
                return res;
            } else if (req.getEndpoint().endsWith('token')) {
                  res.setHeader('Content-Type', 'application/json');
                    res.setBody('{"access_token":"SESSION_ID_REMOVED","instance_url":"https://merkle-1c5-dev-ed.my.salesforce.com","id":"https://login.salesforce.com/id/00D5j00000AFKLpEAP/0055j000005hey9AAA","token_type":"Bearer","issued_at":"1648621578677","signature":"B3AZHD1m9z1JZFWPa69fEhPiwUdpGA1ZYE8DR0R1KmU="}');
                    res.setStatusCode(200);
                    return res;
            } else {
                System.assert(false, 'unexpected endpoint ' + req.getEndpoint());
                return null;
            }
     
    }

}