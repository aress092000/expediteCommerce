/********************************************************************************************************************************
* @Purpose: This is a Test class to test expediteCommerceTaskHandler apex class.
* @Author: Keshav Gaikwad
* @CreatedDate: 08/23/2023
* @Related Code:
* @LastModifiedDate:
* @LastModifiedBy: Keshav Gaikwad
***********************************************************************************************************************************/
@isTest
public class expediteCommerceTaskHandlerTest {

    @isTest static void testSendData() {
        
        expediteCommerceTaskHandler.dataToLwc objRetData = expediteCommerceTaskHandler.sendData();
        
        system.assertNotEquals(null, objRetData);
    }
    
}