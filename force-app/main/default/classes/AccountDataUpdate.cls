public class AccountDataUpdate {
        @future
            public static void CheckIndustryAndUpdateRating(){
               
            try {
            list<Account> accData = [SELECT Id, Industry, Rating FROM Account];
            
            for(Account acc:accData)
            {
                if(acc.Industry == 'Agriculture')
                {
                    acc.Rating = 'Hot'; 
                }
            }
            update accData;
            }
            catch (Exception e) {
                System.debug('Error Message'+e.getMessage());

                    
            }
        }
        
        }