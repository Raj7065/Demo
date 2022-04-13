public class AccessTokenGenerator {
    public  String username;
    public  String password;
    public  String clientId;
    public  String clientSecret;
    public  String securityToken;
    public  String restServiceOrgDomain;
    public  String authEndPoint;
   
   
        public String generateToken(){
        HttpResponse response;
        try{
            Http ht = new Http();
            HttpRequest request = new HttpRequest();
           // DataForApi__c dataForApi =[SELECT Id, ClientSecrate__c, ClientId__c, UserName__c, Password__c, SecurityTocken__c, restServiceOrgDomain__c, authEndPoint__c FROM DataForApi__c limit 1];
          DataForApi__c dataForApi = DataForApi__c.getInstance(userinfo.getProfileId());
            if(dataForApi != null) {
            	setAccessCredentials(dataForApi);
            }
                request.setMethod('POST');
            	request.setEndpoint(restServiceOrgDomain +authEndPoint);
            	request.setBody('grant_type=password' +
                        '&client_id='+clientId + 
                        '&client_secret='+clientSecret +
                        '&username='+username+
                        '&password='+password + securityToken);
             	response = ht.send(request);
           } 
            catch(exception e) {
            system.debug('Exception occcured'+e.getMessage());
        }
            system.debug('resultss:'+response.getBody());
            return response.getBody();
         	
        }
        
     
    
    public void setAccessCredentials(DataForApi__c dataForApi) {
        username = String.valueOf(dataForApi.UserName__c);
        password = String.valueOf(dataForApi.Password__c);
        clientId = String.valueOf(dataForApi.ClientId__c);
        clientSecret = String.valueOf(dataForApi.ClientSecrate__c);
        securityToken = String.valueOf(dataForApi.SecurityTocken__c);
        restServiceOrgDomain = String.valueOf(dataForApi.restServiceOrgDomain__c);
        authEndPoint = String.valueOf(dataForApi.authEndPoint__c);
    }
}