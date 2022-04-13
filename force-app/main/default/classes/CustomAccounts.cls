public class CustomAccounts Implements schedulable {
    Public void execute(SchedulableContext SC) {
        //calling makeGetCallout methodd
    	CustomAccounts.makeGetCallout();
   }
   public static void makeGetCallout() {
       //converting string to object
         Map<String, object> accountsById =(Map<String, Object>)JSON.deserializeUntyped(CustomAccounts.getpostmanaccesstocken());
        System.debug('accountsById' + accountsById);
        Http http = new Http();
        HttpRequest request = new HttpRequest();
      //writing get query 
        request.setEndpoint(String.valueOf(accountsById.get('instance_url'))+'/services/data/v54.0/queryAll/?q=SELECT+Id,+name+from+Account');
        request.setHeader('Authorization', accountsById.get('token_type') + ' ' + accountsById.get('access_token'));
        request.setMethod('GET');
        HttpResponse response = http.send(request);
      
        //creating list of custom object for inserting records
        List<CustomAccount__c> customAccount = new List<CustomAccount__c>();
       // If the request is successful then conver the string to object using map.
        if(response.getStatusCode() == 200) {
            Map<String, Object> accountResponse = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            List<Object> accountObject = (List<Object>)accountResponse.get('records');
            for(Object obj:accountObject) {
                //one object inside other object id and name are in record key so differencing key and value by casting
               Map<String, Object> recordsObj = (Map<String, Object>)obj;
               //here i am passing account_id and account_name to custom object
              customAccount.add(new CustomAccount__c(Account_Id__c=String.valueOf(recordsObj.get('Id')), Account_Name__c = String.valueOf(recordsObj.get('Name'))));
            }
            insert customAccount;
            System.debug('Custom Account Afte insertion' + customAccount);
        }
            
    } 
    Public static String getpostmanaccesstocken() {
        Http ht = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://login.salesforce.com/services/oauth2/token?grant_type=password&client_id=3MVG9pRzvMkjMb6lVzEeWWb5ZrtRXipKslbgKDuEvJUCnv7UvDWnFKmOK2GH1pajFhxPIzPNGc9WPYTujPZQS&client_secret=994447D1287AD01669494993A6968B3CE952DBE44ECFE59401CDBC67BF5BB2F6&username=raj0106@gmail.com&password=Shree@123455hF0qDRYkpKyri5kofl7NXQ0');
        req.setMethod('POST');
        HttpResponse response = ht.send(req);
        // Parse the JSON response
        if(response.getStatusCode() == 200) {
            System.debug(response.getBody());
            
        } else {
            System.debug('The status code returned was not expected: ' +
                response.getStatusCode() + ' ' + response.getStatus());
        }
     return response.getBody();
    }         
}