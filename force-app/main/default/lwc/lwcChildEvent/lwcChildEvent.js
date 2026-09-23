import { LightningElement } from 'lwc';
export default class lwcChildEvent extends LightningElement {

    decreaseHandler(event){
 
    const dec = new CustomEvent('decrease',{detail:'Vol Decrease'});//Create the event
    this.dispatchEvent(dec);//Dispatching the event
    }
    
    increaseHandler(event){
    const inc = new CustomEvent('increase',{detail:'Vol Increase'});//Create the event
    this.dispatchEvent(inc);//Dispatching the event
}



}