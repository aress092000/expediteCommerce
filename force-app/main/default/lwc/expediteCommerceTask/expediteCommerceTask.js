import { LightningElement,track,wire} from "lwc";
import sendData from '@salesforce/apex/expediteCommerceTaskHandler.sendData';
import ExpediteCommerceLogo from "@salesforce/resourceUrl/ExpediteCommerceLogo";
export default class ExpediteCommerceTask extends LightningElement {

    @track ExpediteCommerceLogo = ExpediteCommerceLogo;
    @track selectedView = "ShowFullAttribute";
    @track isYearSummary = true;
    @track isMonthSummary = false;
    @track monthList = [];

    @track productData = [];
    @track error = [];

    @track tableData = ['Product','Option','Attribute','Revenue Type', 'QYT', 'Unit Price', 'Start Month', 'Month', 'Revenue Recognition','Commited'];



    @wire(sendData)
    wiredProds({ error, data }) {
        if (data) {
        this.productData = JSON.parse(JSON.stringify(data));
        this.error = undefined;

        this.productData.lineItemData.forEach(element => {
            
            element.startMonth = this.dateFormat(new Date(element.startMonth))

        });

        this.productData.summaryMonthData.forEach(element => {
            
            element.month = this.dateFormat(new Date(element.month))

        });

        } else if (error) {
        this.error = error;
        this.productData = undefined;
        }
        
    }

    renderedCallback()
    {
        this.template.querySelectorAll('.productItemName').forEach(element => {

            element.classList.add('stickyClass');

        });
    }

    get ForcastOptions()
    {
        return [{ label: "Show full attributes", value: "ShowFullAttribute" },
               { label: "Show monthly summary", value: "ShowMonthlySummary" }]
    }

    handleViewChange(event)
    {
        this.selectedView = event.detail.value;

        this.isYearSummary = this.selectedView == "ShowFullAttribute" ? true : false;
        this.isMonthSummary = this.selectedView == "ShowMonthlySummary" ? true : false;
    }

    dateFormat(dt)
    {

        const monthNames = ["Jan", "Feb", "Mar", "Apr",
                            "May", "Jun", "Jul", "Aug",
                            "Sep", "Oct", "Nov", "Dec"];
                
        const monthIndex = dt.getMonth();
        const monthName = monthNames[monthIndex];
        
        const year = dt.getFullYear();
        
        return `${monthName} ${year}`;  
    }
}