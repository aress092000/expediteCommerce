/********************************************************************************************************************************
* @Purpose: This is an Wrapper class for yearData.
* @Author: Keshav Gaikwad
* @CreatedDate: 08/23/2023
* @Test Class: expediteCommerceTaskHandlerTest
* @Related Code:
* @LastModifiedDate:
* @LastModifiedBy: Keshav Gaikwad
***********************************************************************************************************************************/
public class summaryYearsParser {

	public class LineData {
		public String recordId;
		public String amount;
	}

	public String status;
	public ResponseData responseData;
	public Object message;

	public class ResponseData {
		public List<YearsData> yearsData;
	}

	public class YearsData {
		public String year;
		public String summaryAmount;
		public List<LineData> lineData;
	}

	
	public static summaryYearsParser parse(String json) {
		return (summaryYearsParser) System.JSON.deserialize(json, summaryYearsParser.class);
	}
}