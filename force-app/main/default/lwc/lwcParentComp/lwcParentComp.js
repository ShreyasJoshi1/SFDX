import { LightningElement } from 'lwc';
export default class LwcParentComp extends LightningElement {

    Volume='Awaiting Response';
vol=0;
decreaseHandler(event){
    if(this.vol!=0){
        this.vol=this.vol-1;
    this.Volume=event.detail;
        
    }
    else{
          this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error creating record',
                        message: 'Vol is zero',
                        variant: 'error',
                    }),
        );  
    }
    
}
increaseHandler(event){
    this.vol=this.vol+1;
     this.Volume=event.detail;



}

}