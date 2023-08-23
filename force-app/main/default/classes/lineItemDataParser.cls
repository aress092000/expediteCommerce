/********************************************************************************************************************************
* @Purpose: This is an Wrapper class for lineItem.
* @Author: Keshav Gaikwad
* @CreatedDate: 08/23/2023
* @Test Class: expediteCommerceTaskHandlerTest
* @Related Code:
* @LastModifiedDate:
* @LastModifiedBy: Keshav Gaikwad
***********************************************************************************************************************************/
public class lineItemDataParser {

	public Integer unitPrice;
	public String startMonth;
	public String revenueType;
	public Object revenueRecognitionName;
	public Object revenueRecognitionId;
	public Integer qty;
	public String productItemName;
	public String productItemId;
	public String productFLIId;
	public Object priorMRR;
	public Object optionItemName;
	public Object optionItemId;
	public Object optionFLIId;
	public Object monthsVR;
	public Object monthsNRC;
	public Object monthsMRC;
	public Integer months;
	public String displayUnitPrice;
	public String displayQty;
	public Object displayPriorMRR;
	public String committed;
	public Object attributesWithValues;
	public Object attributes;
    

	
	public static List<lineItemDataParser> parse(String json) {
		return (List<lineItemDataParser>) System.JSON.deserialize(json, List<lineItemDataParser>.class);
	}
}