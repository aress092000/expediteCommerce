/********************************************************************************************************************************
* @Purpose: This is an Wrapper class for months.
* @Author: Keshav Gaikwad
* @CreatedDate: 08/23/2023
* @Test Class: expediteCommerceTaskHandlerTest
* @Related Code:
* @LastModifiedDate:
* @LastModifiedBy: Keshav Gaikwad
***********************************************************************************************************************************/
public class summaryMonthsParser {

	public class LinesData {
		public Integer startYear;
		public Integer startMonth;
		public String recordId;
		public List<String> data;
	}

	public String status;
	public ResponseData responseData;
	public Object message;

	public class ResponseData {
		public List<String> summaryAmount;
		public Integer startYear;
		public Integer startMonth;
		public List<LinesData> linesData;
	}

	
	public static summaryMonthsParser parse(String json) {
		return (summaryMonthsParser) System.JSON.deserialize(json, summaryMonthsParser.class);
	}
}