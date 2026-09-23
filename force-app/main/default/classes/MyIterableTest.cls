@isTest
public class MyIterableTest {
    
    @isTest
    static void testIterableForLoop()
    {
        List<String> strings = new list<String>{'Hello', 'World'};
            
        MyIterable myIterableInstance = new MyIterable(strings);
        
        //System.debug('Running the for loop...');
        
        for(String str : myIterableInstance)
        {
            System.debug(str);
        }
        
    }

}