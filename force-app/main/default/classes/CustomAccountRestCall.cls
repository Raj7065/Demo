public class CustomAccountRestCall Implements schedulable   {
    Public void execute(SchedulableContext SC) {
            //calling customAccountCreation methodd
        customAccountCreation();
        }
        public HttpResponse customAccountCreation() {
            AccessTokenGenerator accessTokengenerate = new AccessTokenGenerator();
        DataForApi__c getQuery =[ SELECT Id, ServiceAndQueryEndpoint__c FROM DataForApi__c];
            //converting string to object
            Map<String, object> getAccessToken =(Map<String, Object>)JSON.deserializeUntyped(accessTokengenerate.generateToken());
            System.debug('accountsById' + getAccessToken);
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            //writing get query 
            request.setEndpoint(getAccessToken.get('instance_url')+getQuery.ServiceAndQueryEndpoint__c);
            request.setHeader('Authorization', getAccessToken.get('token_type') + ' ' + getAccessToken.get('access_token'));
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            //creating list of custom object for inserting records
            List<CustomAccount__c> customAccount = new List<CustomAccount__c>();
            // If the request is successful then conver the string to object using map.
        
            if(response.getStatusCode() == 200) {
                Map<String, Object> accountResponse = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
                if(accountResponse.size() > 0 && accountResponse.containsKey('records')) {
                    List<Object> accountObject = (List<Object>)accountResponse.get('records');
                    if(accountObject != null && accountObject.size() > 0) {
                        for(Object obj:accountObject) {
                            //one object inside other object, id and name are in record key so differencing, key and value by casting.
                            Map<String, Object> recordsObj = (Map<String, Object>)obj;
                            //here i am passing account_id and account_name to custom object
                            customAccount.add(new CustomAccount__c(Account_Id__c=String.valueOf(recordsObj.get('Id')), Account_Name__c = String.valueOf(recordsObj.get('Name'))));
                        }
                        insert customAccount;
                    }
                } else {
                    System.debug('Noe');
                }
            } else {
                System.debug('Expected Status Code Not Returned');
                System.debug('Status Code: ' + response.getStatusCode());
                System.debug('Response Body ' + response.getBody());
            }
        system.debug(response.getBody());
            return response;
            
        } 
        
    }