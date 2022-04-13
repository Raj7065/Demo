// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);

CustomAccountRestCall ca = new CustomAccountRestCall();
String sch = '0 0 * * * ?';
String jobID = system.schedule('Custom Account Creation', sch, ca);


AccessTokenGenerator aa = new AccessTokenGenerator();
aa.generateToken();

System.enqueueJob(new QuableClassOnContact());
Account aa=new account();

CustomAccountRestCall ca = new CustomAccountRestCall();
ca.customAccountCreation();
