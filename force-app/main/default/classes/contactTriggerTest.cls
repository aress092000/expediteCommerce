/********************************************************************************************************************************
* @Purpose: This is a Test class to test contactTrigger apex Trigger.
* @Author: Keshav Gaikwad
* @CreatedDate: 08/23/2023
* @Related Code:
* @LastModifiedDate:
* @LastModifiedBy: Keshav Gaikwad
***********************************************************************************************************************************/
@isTest
public class contactTriggerTest {

    @testSetup
    static void contactAndAccount() {
        
        Account acc = new Account();
        acc.Name = 'test Acc';
        
        insert acc;
        
        Contact con = new Contact();
        con.LastName = 'Test Last';
        con.AccountId = acc.Id;
        
        insert con;
        
        
        
    }
    
    @isTest static void testCreateAccountContactRole() {
        
        Account acc = [SELECT Id FROM Account];
        
        List<AccountContactRole> accConRoleList = [SELECT Id, ContactId, AccountId, Role 
                                                   FROM AccountContactRole WHERE AccountId =: acc.Id];
        
        system.assertEquals(1, accConRoleList.size());
        
    }
}