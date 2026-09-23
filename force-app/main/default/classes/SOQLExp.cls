public class SOQLExp {
    
    public static void updateLead()
    {
        List<Lead> leadlst = [Select id,name,leadsource from Lead where leadsource = 'Web'];
        for(Lead ld: leadlst)
        {
            ld.Description = 'Web Descriptions';
        }
        update leadlst;
    }
    
    public static void deleteCase()
    {
        list<Case> caselist = [Select id,CaseNumber,Priority from Case where Priority = 'High'];
        
        delete caselist;
        
        system.debug('Cases after Deletion'+ [select id,CaseNumber, Priority from Case where Priority = 'High']);
        
        
    }

}