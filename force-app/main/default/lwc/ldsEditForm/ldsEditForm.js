import { LightningElement,api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class Lwcrecordeditform extends LightningElement {
@api recordId;
handleSuccess(event) {
        const evt = new ShowToastEvent({
            title: 'Record updated',
           variant:'brand',
        });
        this.dispatchEvent(evt);


}
}