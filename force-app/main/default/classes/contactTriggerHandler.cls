/********************************************************************************************************************************
* @Purpose: This is a handler class for contactTrigger
- to create an AccountContactRole record with Role as “Billing”, when first Contact is created for the Account.
* @Author: Keshav Gaikwad
* @CreatedDate: 08/23/2023
* @Test Class: contactTriggerTest
* @Related Code:
* @LastModifiedDate:
* @LastModifiedBy: Keshav Gaikwad
***********************************************************************************************************************************/

public class contactTriggerHandler {
    
    
    /*************************************************************************************************
    *Method Name : createAccountContactRole
    *Parameter Accept : Set<Id>
    *Returns : Void
    *Purpose : to create an AccountContactRole
    ************************************************************************************************/
    public static void createAccountContactRole(Set<Id> accountIds)
    {
        
        List<AccountContactRole> listToInsert = new List<AccountContactRole>();
        
        map<Id,list<Contact>> mapOfAccountIdVsContact = new map<Id,list<Contact>>();
        
        for(Account accObj : [SELECT Id,(SELECT Id FROM contacts) 
                              FROM Account WHERE Id IN : accountIds]){
                                  
                                  mapOfAccountIdVsContact.put(accObj.Id,accObj.Contacts);
                                  
                              }
        
        for(Id accId : mapOfAccountIdVsContact.keySet())
        {
            if(!(mapOfAccountIdVsContact.get(accId).size() > 1))
            {
                AccountContactRole objAccConRole = new AccountContactRole();
                
                objAccConRole.AccountId = accId;
                objAccConRole.ContactId = mapOfAccountIdVsContact.get(accId)[0].Id;
                objAccConRole.Role = 'Billing';
                
                listToInsert.add(objAccConRole);
            }
        }
        
        if(!listToInsert.isEmpty())
        {
            insert listToInsert;
        }
        
    }
    
}