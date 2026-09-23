public class SampleClassNew {
    public static Integer Multiplication(Integer Num1, Integer Num2)
    {
        Integer Sum = Num1*Num2;
        return Sum;
    }
    
    public static void getDays(Integer num)
    {
        String Day;
        if(num==1)
        {
            Day = 'Monday';
        }else if(num==2)
        {
            Day = 'Tuesday';
        }else if(num==3)
        {
            Day = 'Wednesday';
            
        }else if(num==4)
        {
            Day = 'Thursday';
            
        }else if(num==5)
        {
            Day = 'Friday';
            
        }else if(num==6)
        {
            Day = 'Saturday';
            
        }else
        {
            Day = 'Sunday';
            
        }
        System.debug('Day for'+ num +'is'+ Day);
    }

}