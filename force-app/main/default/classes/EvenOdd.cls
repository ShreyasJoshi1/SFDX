public class EvenOdd {
    public static void findEvenOdd(Integer num){

        Integer num1 = num/2;
        System.debug('Number is'+num1);
        Integer result = num1 * 2;
        
        if(num == result )
        {
            System.debug('The '+num+' is even.');
        }
        else
        {
            System.debug('The '+num+' is odd.');
        }
    }
}