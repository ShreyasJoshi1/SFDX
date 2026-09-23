import { LightningElement } from "lwc";

//1. Import the method "createRecord" which is a named import
import { createRecord } from "lightning/uiRecordApi";

//2. Import the reference to Object and Fields
import ACCOUNT_OBJECT from "@salesforce/schema/Account";
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import NAME_FIELD from "@salesforce/schema/Account.Name";
import INDUSTRY_FIELD from "@salesforce/schema/Account.Industry";
import RATING_FIELD from "@salesforce/schema/Account.Rating";


export default class LwcUiRecordapi extends LightningElement {

  name;
  industry;
  rating;

  handleChange(e) {
    if (e.target.name === "name") {
    
      //this is name input textbox
      this.name = e.target.value;
      console.log(this.name);
    } else if (e.target.name === "industry") {
    
      //this is industry input textbox
      this.industry = e.target.value;
      console.log(this.industry);
    } else if (e.target.name === "rating") {
    
      //this is rating input textbox
      this.rating = e.target.value;
      console.log(this.rating);
    }
  }

  handleClick() {
  
    //3. Map the data to the fields
    const fields = {};

    fields[NAME_FIELD.fieldApiName] = this.name;
    fields[INDUSTRY_FIELD.fieldApiName] = this.industry;
    fields[RATING_FIELD.fieldApiName] = this.rating;
        
        //4. Prepare config object with object and field API names 
    const recordInput = {
      apiName: ACCOUNT_OBJECT.objectApiName,
      fields: fields
    };
        
        //5. Invoke createRecord by passing the config object
    createRecord(recordInput).then((record) => {

        this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Account created',
                        variant: 'success',
                    }),
        );
    }).catch((error) => {

        this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error creating record',
                        message: error.body.message,
                        variant: 'error',
                    }),
        );
    });
            

  }
       

    }