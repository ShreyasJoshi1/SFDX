import { LightningElement } from 'lwc';
export default class LwcLargestNum extends LightningElement {
    fnum;
    snum;
    tnum;
    result=0;

    changeFNum(event)
    {
        this.fnum = event.target.value;
    }

    changeSNum(event)
    {
        this.snum = event.target.value;
    }

    changeTNum(event){
        this.tnum = event.target.value;
    }

    findLargest(event)
    {
        const a = parseInt(this.fnum);
        const b = parseInt(this.snum);
        const c = parseInt(this.tnum);

        if(a>b && a>c)
        {
            this.result = a;
        }
        else if(b>a && b>c)
        {
            this.result = b;
        }
        else
        {
            this.result = c;
        }
    }
}