public class DmlExp {
    
    public static void createOppRecords()
    {
		List<Opportunity> lstOpp = new List<Opportunity>();
		for(Integer i=0;i<200;i++)
        {
            Opportunity opp = new Opportunity();
            opp.Name = 'Test'+i;
            opp.StageName = 'Hot Lead';
            opp.CloseDate = System.Today();
            lstOpp.add(opp);
        }
        insert lstOpp;
        System.debug(lstOpp);
    }
    public static void createBoatRecords()
    {
		List<Boat__c> lstBoat = new List<Boat__c>();
        List<Contact> conList = new List<Contact>();
        for(Integer i=0;i<200;i++)
        {
            Contact con = new Contact();
            con.LastName = 'Test Contact'+i;
            conList.add(con);
        }
        insert conList;
		for(Integer i=0;i<200;i++)
        {
            Boat__c bt = new Boat__c(); 
            bt.Name = 'Test Boat'+i;
            bt.Contact__c = conList[i].id;
            lstBoat.add(bt);
        }
        insert lstBoat;
        System.debug(lstBoat);
        System.debug(conList);
    }
    
    public static void getCollection()
    {
        List<String> lstString = new List<String>();
        lstString.add('Alto');
        lstString.add('i20');
        lstString.add('Audi');
        lstString.add('BMW');
        lstString.add('Porsche');
        
        System.debug(lstString);
        
        If(lstString.contains('i20'))
        {
            System.debug('Yes i20 is present in List');
        }
        else{
            System.debug('No i20 is not present in List');
        }
        
        lstString.remove(2);
        lstString.sort();
        
        System.debug(lstString);
    }


}