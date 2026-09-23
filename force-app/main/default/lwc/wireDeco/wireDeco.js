import { LightningElement, wire, track } from 'lwc';
import getAccounts from '@salesforce/apex/getAccounts.doSomething';
import getContacts from '@salesforce/apex/ContactDetails.getContacts';
const columns = [{label:'Name',fieldName:'Name',type:'text'},
        {label:'Phone',fieldName:'Phone',type:'Phone'},
        {label:'Email',fieldName:'Email',type:'email'}];
export default class WireDeco extends LightningElement {

   col = columns;
    
   //@track data = [];
   //{label:'Name',fieldName:'Name',type:'text'},
       // {label:'Phone',fieldName:'Phone',type:'Phone'},
       // {label:'Email',fieldName:'Email',type:'email'}

   @track key;
   @track accId;
   changeValue(event)
   {
    this.key = event.target.value;
   }
   @wire(getAccounts, {key: '$key'}) accdata({data}){
         if(data)
         {  
            this.accId = data;
            console.log(data);
         }
   };
   
    @wire(getContacts, {accId: '$accId'}) condata({data})
    {
      //this.data = result.data;
      //this.columns = result.columns;
      console.log('Inside Contact wire '+data);
    };
   

   

   
   

   
}