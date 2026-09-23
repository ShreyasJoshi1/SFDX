public class ContactInsert {
    public static void insertContact()
    {
        Contact con = new Contact();
        con.FirstName = 'Test';
        con.LastName = 'Contact';
        con.Email = 'abc@gmail.com';
        con.Phone = '+123456789';
        con.Title = 'Mr.';
        insert con;
    }
    
    public static void insertOpp()
    {
        Opportunity opp = new Opportunity();
        opp.Name = 'Test opportunity';
        opp.StageName = 'Hot Lead';
        opp.CloseDate = System.Today();
        insert opp;
    }
    
    public static void insertOpp1()
    {
        Date dt = Date.newInstance(2026,01,13); 
        Opportunity opp = new Opportunity();
        opp.Name = 'Test opportunity 1';
        opp.StageName = 'Hot Lead';
        opp.CloseDate = dt;
        insert opp;
    }

}