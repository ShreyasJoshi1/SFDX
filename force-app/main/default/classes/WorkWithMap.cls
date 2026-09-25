public class WorkWithMap {
    
    public static void getMap()
    {
        Map<String,String> mapval = new Map<String,String>();
        mapval.put('101','Refrigerator');
        mapval.put('102','iPhone');
        mapval.put('103','laptop');
        mapval.put('104','TV');
        
        system.debug('Map Values '+mapval);
         if(mapval.isEmpty())
         {
             System.debug('Map is empty');
         }
        else
        {
            system.debug('Map is not Empty');
        }
        
        if(mapval.containsKey('103'))
        {
            mapval.remove('102');
            mapval.remove('104');
        }
        System.debug('New Map Values are after removing iPhone'+mapval);
    }

}