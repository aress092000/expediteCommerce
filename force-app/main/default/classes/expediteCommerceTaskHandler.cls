/********************************************************************************************************************************
* @Purpose: This is an apex to combine data of YearData, MonthData & LineItem Data into single collection.
* @Author: Keshav Gaikwad
* @CreatedDate: 08/23/2023
* @Test Class: expediteCommerceTaskHandlerTest
* @Related Code:
* @LastModifiedDate:
* @LastModifiedBy: Keshav Gaikwad
***********************************************************************************************************************************/
public class expediteCommerceTaskHandler {

 
    /*************************************************************************************************
    *Method Name : sendData
    *Parameter Accept : N/A
    *Returns : dataToLwc(Wrapper)
    *Purpose : to combine data in one collection and send it to LWC
    ************************************************************************************************/
	@AuraEnabled(cacheable=true)
    public static dataToLwc sendData()
    {
        String lineItemJSONStr = '[{        "unitPrice": 95,        "startMonth": "2/1/2019",        "revenueType": "MRC",        "revenueRecognitionName": null,        "revenueRecognitionId": null,        "qty": 1,        "productItemName": "Captio User Delegation",        "productItemId": "a01A000001gmFXZIA2",        "productFLIId": "a2m2G000000AJKQQA4",        "priorMRR": null,        "optionItemName": null,        "optionItemId": null,        "optionFLIId": null,        "monthsVR": null,        "monthsNRC": null,        "monthsMRC": null,        "months": 18,        "displayUnitPrice": "$95.00",        "displayQty": "1",        "displayPriorMRR": null,        "committed": "No",        "attributesWithValues": null,        "attributes": null        },        {        "unitPrice": 55,        "startMonth": "3/1/2019",        "revenueType": "NRC",        "revenueRecognitionName": null,        "revenueRecognitionId": null,        "qty": 1,        "productItemName": "TNS Link",        "productItemId": "a01A000001utm3RIAQ",                "productFLIId": "a2m2G000009H0fHQAS",        "priorMRR": null,        "optionItemName": null,        "optionItemId": null,        "optionFLIId": null,        "monthsVR": null,        "monthsNRC": null,        "monthsMRC": null,        "months": 12,        "displayUnitPrice": "$55.00",        "displayQty": "1",        "displayPriorMRR": null,        "committed": "No",        "attributesWithValues": null,        "attributes": null        },        {        "unitPrice": 100,        "startMonth": "2/1/2019",        "revenueType": "MRC",        "revenueRecognitionName": null,        "revenueRecognitionId": null,        "qty": 1,        "productItemName": "TNS Link",        "productItemId": "a01A000001utm3RIAQ",        "productFLIId": "a2m2G000009H0fIQAS",        "priorMRR": null,        "optionItemName": null,        "optionItemId": null,        "optionFLIId": null,        "monthsVR": null,        "monthsNRC": null,        "monthsMRC": null,        "months": 24,        "displayUnitPrice": "$100.00",        "displayQty": "1",        "displayPriorMRR": null,        "committed": "No",        "attributesWithValues": null,        "attributes": null        }        ]';
        String summaryYearsJSONStr = '{        "status": "success",        "responseData": {        "yearsData": [        {        "year": "2019",        "summaryAmount": "$2,190.80",        "lineData": [        {        "recordId": "a2m2G000000AJKQQA4",        "amount": "$1,045.00"        },        {        "recordId": "a2m2G000009H0fIQAS",        "amount": "$1,100.00"        },        {        "recordId": "a2m2G000009H0fHQAS",        "amount": "$45.80"        }        ]        },        {        "year": "2020",                "summaryAmount": "$1,874.20",        "lineData": [        {        "recordId": "a2m2G000000AJKQQA4",        "amount": "$665.00"        },        {        "recordId": "a2m2G000009H0fIQAS",        "amount": "$1,200.00"        },        {        "recordId": "a2m2G000009H0fHQAS",        "amount": "$9.20"        }        ]        },        {        "year": "2021",        "summaryAmount": "$100.00",        "lineData": [        {        "recordId": "a2m2G000009H0fIQAS",        "amount": "$100.00"        }        ]        }        ]        },        "message": null        }';
        String summaryMonthsJSONStr = '{        "status": "success",        "responseData": {        "summaryAmount": [        "$195.00",        "$199.58",        "$199.58",        "$199.58",        "$199.58",        "$199.58",        "$199.58",        "$199.58",        "$199.58",        "$199.58",                "$199.58",        "$199.58",        "$199.62",        "$195.00",        "$195.00",        "$195.00",        "$195.00",        "$195.00",        "$100.00",        "$100.00",        "$100.00",        "$100.00",        "$100.00",        "$100.00"        ],        "startYear": 2019,        "startMonth": 2,        "linesData": [        {        "startYear": 2019,        "startMonth": 2,        "recordId": "a2m2G000000AJKQQA4",        "data": [        "$95.00",        "$95.00",        "$95.00",        "$95.00",        "$95.00",        "$95.00",        "$95.00",        "$95.00",        "$95.00",        "$95.00",        "$95.00",        "$95.00",        "$95.00",        "$95.00",        "$95.00",        "$95.00",        "$95.00",        "$95.00"        ]        },        {                "startYear": 2019,        "startMonth": 2,        "recordId": "a2m2G000009H0fIQAS",        "data": [        "$100.00",        "$100.00",        "$100.00",        "$100.00",        "$100.00",        "$100.00",        "$100.00",        "$100.00",        "$100.00",        "$100.00",        "$100.00",        "$100.00",        "$100.00",        "$100.00",        "$100.00",        "$100.00",        "$100.00",        "$100.00",        "$100.00",        "$100.00",        "$100.00",        "$100.00",        "$100.00",        "$100.00"        ]        },        {        "startYear": 2019,        "startMonth": 3,        "recordId": "a2m2G000009H0fHQAS",        "data": [        "$4.58",        "$4.58",        "$4.58",        "$4.58",        "$4.58",        "$4.58",        "$4.58",        "$4.58",        "$4.58",                "$4.58",        "$4.58",        "$4.62"        ]        }        ]        },        "message": null        }';
        
        List<lineItemDataParser> lineItemData = lineItemDataParser.parse(lineItemJSONStr);
        summaryMonthsParser summaryMonthsData = summaryMonthsParser.parse(summaryMonthsJSONStr);
        summaryYearsParser summaryYearsData = summaryYearsParser.parse(summaryYearsJSONStr);

		List<yearVsSummary> yearVsSummaryAmount = new List<yearVsSummary>();
        map<String,List<yearWrap>> idVsMapYearAndAmount = new map<String,List<yearWrap>>();
        map<String,String> yearVsSummaryMonths = new map<String,String>();
        
        
        for(summaryYearsParser.YearsData objYearsData : summaryYearsData.responseData.yearsData)
        {
            yearVsSummary objYearSummary = new yearVsSummary();
            
            objYearSummary.summaryAmount = objYearsData.summaryAmount;
            objYearSummary.year = objYearsData.year;
            
            yearVsSummaryAmount.add(objYearSummary);
            
            for(summaryYearsParser.lineData objLineYears : objYearsData.lineData)
            {
                yearWrap objYear = new yearWrap();
                
                map<String,String> yearVsAmount = new map<String,String>();
                yearVsAmount.put(objYearsData.year, objLineYears.amount);
				
                objYear.year = objYearsData.year;
                objYear.amount = objLineYears.amount;
                
                if(idVsMapYearAndAmount.containsKey(objLineYears.recordId))
                {
                    idVsMapYearAndAmount.get(objLineYears.recordId).add(objYear);
                }
                else
                {
                    idVsMapYearAndAmount.put(objLineYears.recordId, new List<yearWrap>{objYear});
                }
            }
        }

        Date maxDate;
        Date minDate = Date.newInstance(summaryMonthsData.ResponseData.startYear, summaryMonthsData.ResponseData.startMonth, 1);
        
        for(summaryMonthsParser.linesData objLineData : summaryMonthsData.responseData.linesData)
        {
            if(maxDate == null)
            {
                maxDate = Date.newInstance(objLineData.startYear, objLineData.startMonth, 1).addMonths(objLineData.data.size());
            }
            else if(maxDate < Date.newInstance(objLineData.startYear, objLineData.startMonth, 1).addMonths(objLineData.data.size()))
            {
                maxDate = Date.newInstance(objLineData.startYear, objLineData.startMonth, 1).addMonths(objLineData.data.size());
            }
        }
        
        map<String, List<monthAndAmount>> idVsLineMonthData = new map<String, List<monthAndAmount>>();
        for(summaryMonthsParser.linesData objLineData : summaryMonthsData.responseData.linesData)
        {
            List<monthAndAmount> objMonthWrap = new List<monthAndAmount>();
            objMonthWrap = prepareMonthsData(objLineData.data, date.newInstance(objLineData.startYear, objLineData.startMonth, 1), minDate ,maxDate);
            
            idVsLineMonthData.put(objLineData.recordId,objMonthWrap);
        }
		
        
        List<retDataWrap> productDataList= new List<retDataWrap>();

        for(lineItemDataParser objWrapLineItem : lineItemData)
        {
            retDataWrap objWrap = new retDataWrap();

            objWrap.recordId 				= objWrapLineItem.productFLIId;
            objWrap.productItemName 		= objWrapLineItem.productItemName;
            objWrap.optionItemName 			= (String)objWrapLineItem.optionItemName 					== null ? 'N/A' : (String)objWrapLineItem.optionItemName;
            objWrap.attributes 				= (String)objWrapLineItem.attributes 						== null ? 'N/A' : (String)objWrapLineItem.attributes;
            objWrap.revenueType 			= objWrapLineItem.revenueType 								== null ? '-' : objWrapLineItem.revenueType;
            objWrap.qty 					= objWrapLineItem.qty 										== null ? 0 : objWrapLineItem.qty ;
            objWrap.unitPrice 				= objWrapLineItem.displayUnitPrice 							== null ? '-' : objWrapLineItem.displayUnitPrice;
            objWrap.startMonth 				= objWrapLineItem.startMonth 								== null ? '-' : objWrapLineItem.startMonth;
            objWrap.revenueRecognitionName 	= String.valueOf(objWrapLineItem.revenueRecognitionName) 	== null ? 'N/A' : String.valueOf(objWrapLineItem.revenueRecognitionName);
            objWrap.months 					= objWrapLineItem.months 									== null ? 0 : objWrapLineItem.months;
            objWrap.committed 				= objWrapLineItem.committed 								== null ? '-' : objWrapLineItem.committed;	

            objWrap.yearsData =  idVsMapYearAndAmount.get(objWrapLineItem.productFLIId);
            objWrap.monthsData = idVsLineMonthData.get(objWrapLineItem.productFLIId);
            
            productDataList.add(objWrap);


        }
        
        List<monthVsSummary> summaryMonthData = new List<monthVsSummary>();
        
        Date loopDateMonth = minDate;
        
        for(String str : summaryMonthsData.ResponseData.summaryAmount)
        {
            monthVsSummary objMonthSummary = new monthVsSummary();
            
            objMonthSummary.month = String.valueOf(loopDateMonth);
            objMonthSummary.summaryAmount = str;
            
            summaryMonthData.add(objMonthSummary);
            
            loopDateMonth = loopDateMonth.addMonths(1);
        }
        
        for(retDataWrap objLineItem : productDataList)
        {
            
            if(objLineItem.monthsData.size() < summaryMonthData.size())
            {
                
                for(integer i = objLineItem.monthsData.size() ; i<summaryMonthData.size() ; i++)
                {
                    monthAndAmount obj = new monthAndAmount();
            		obj.amount = '-';
                    obj.month = summaryMonthData[i-1].month;
                    
                    objLineItem.monthsData.add(obj);
                }
            }
        }
        
        for(retDataWrap objLineItem : productDataList)
        {
            
            if(objLineItem.yearsData.size() < yearVsSummaryAmount.size())
            {
                
                for(integer i = objLineItem.yearsData.size() ; i < yearVsSummaryAmount.size() ; i++)
                {
                    yearWrap obj = new yearWrap();
            		obj.amount = '-';
                    obj.year = yearVsSummaryAmount[i-1].year;
                    
                    objLineItem.yearsData.add(obj);
                }
            }
        }
        
        dataToLwc returnData = new dataToLwc();
        
        returnData.lineItemData = productDataList;
        returnData.summaryYearData = yearVsSummaryAmount;
        returnData.minDate = string.valueOf(minDate);
        returnData.maxDate = string.valueOf(maxDate);
        returnData.summaryMonthData = summaryMonthData;
        
        return returnData;
    }

    /*************************************************************************************************
    *Method Name : prepareMonthsData
    *Parameter Accept : List<String> lstMonthData, Date productStartDate, Date minDate ,Date maxDate
    *Returns : List<monthAndAmount>
    *Purpose : to prepare data for each individual month and send it to parent method
    ************************************************************************************************/
    public static List<monthAndAmount> prepareMonthsData(List<String> lstMonthData, Date productStartDate, Date minDate ,Date maxDate)
    {
        Date thisProductStartDate = productStartDate;
        Date thisMinDate = minDate;
        Date thisMaxDate = maxDate;
        
        
        List<monthAndAmount> retList = new List<monthAndAmount>();
        
        boolean addExtra = true;
        for(String strObj : lstMonthData)
        {
            
        
            monthAndAmount objWrap = new monthAndAmount();
            
            
            if(thisProductStartDate > thisMinDate && addExtra == true)
            {
                addExtra = false;
                
                objWrap.month = String.valueOf(thisMinDate);
                objWrap.amount = '-';
                
                thisMinDate = thisMinDate.addMonths(1);
            }
            else
            {
                
                addExtra = false;
                objWrap.month = String.valueOf(thisProductStartDate);
                objWrap.amount = strObj;
                
                thisProductStartDate = thisProductStartDate.addMonths(1);
            }
         
            retList.add(objWrap);
        }
        
        
        return retList;
    }
    
    public class yearWrap{
    
        @auraEnabled
        public String year;
        @auraEnabled
        public String amount;
        
    }
    
    public class monthAndAmount
    {
        @auraEnabled
        public String amount;
        @auraEnabled
        public String month;
    }
    
    public class yearVsSummary
    {
        @auraEnabled
        public String summaryAmount;
        @auraEnabled
        public String year;
    }
    
    public class monthVsSummary
    {
        @auraEnabled
        public String summaryAmount;
        @auraEnabled
        public String month;
    }
    
    public class monthsWrap{
    
        @auraEnabled
        public List<monthAndAmount> amountList;
        @auraEnabled
        public Integer startYear;
        
    }
    
    public class retDataWrap{

        @AuraEnabled
        public String recordId;
        @AuraEnabled
        public String productItemName;
        @AuraEnabled
        public String optionItemName;
        @AuraEnabled
        public String attributes;
        @AuraEnabled
        public String revenueType;
        @AuraEnabled
        public Integer qty;
        @AuraEnabled
        public String unitPrice;
        @AuraEnabled
        public String startMonth;
        @AuraEnabled
        public Integer months;
        @AuraEnabled
        public String revenueRecognitionName;
        @AuraEnabled 
        public String committed;
        @AuraEnabled
        public Integer startYear;
        @AuraEnabled
        public List<yearWrap> yearsData;
        @AuraEnabled
        public List<monthAndAmount> monthsData;
    }
    
    Public class dataToLwc
    {
        @AuraEnabled
        public List<retDataWrap> lineItemData;
        @AuraEnabled
        public List<yearVsSummary> summaryYearData;
        @AuraEnabled
        public String minDate;
        @AuraEnabled
        public String maxDate;
        @AuraEnabled
        public List<monthVsSummary> summaryMonthData;
    }
}