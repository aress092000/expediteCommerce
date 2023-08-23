/********************************************************************************************************************************
* @Purpose: This is a Trigger on contacts
- if inserted Contact has an Account exist in Salesforce then pass the Account data to it's respective handler for further automation.
* @Author: Keshav Gaikwad
* @CreatedDate: 08/23/2023
* @Test Class: contactTriggerTest
* @Related Code:
* @LastModifiedDate:
* @LastModifiedBy: Keshav Gaikwad
***********************************************************************************************************************************/
trigger contactTrigger on Contact (After insert) {
    
    if(Trigger.isAfter && Trigger.isInsert)
    {
        Set<Id> accountIds = new Set<Id>();
        
        for(contact conObj : Trigger.new)
        {
            if(conObj.AccountId != NULL)
            {
                accountIds.add(conObj.AccountId);
            }
        }    
        
        contactTriggerHandler.createAccountContactRole(accountIds);
    }
    
}