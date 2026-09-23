import { LightningElement } from 'lwc';
import getAccountDetails from '@salesforce/apex/AccountDetails.getAccountDetails';
const columns=[
    {label:'Name',fieldName:'Name',type:'text'},
    {label:'Phone',fieldName:'Phone',type:'Phone'}
];
export default class Lwcwirecmp extends LightningElement {
col=columns;
searchKey;
accerrror;
accdata;

changeValue(event){
this.searchKey=event.target.value;
}


searchRecords(event){
console.log('inside the searchRecords');
getAccountDetails({searchKey:this.searchKey})
   
      .then((result) => {
        console.log('result is'+JSON.stringify(result));
        this.accdata = result;
        console.log('accData is'+this.accdata);
      })
      .catch((error) => {
        this.accerror = error;
      });
}




}