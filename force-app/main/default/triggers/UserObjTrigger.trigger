trigger UserObjTrigger on User (after insert) {
    
    If(Trigger.IsAfter && Trigger.isInsert)
    {
        List<Task> tasktoinsert = new List<Task>();
        
        for(User u: Trigger.new)
        {
            System.debug(u.Profile.Name);
            if(u.ProfileId == '00eQy00000GPCkxIAH')
            {
                Task T = New Task();
                t.OwnerId = u.Id;
                t.Subject = 'Email';
                t.Status = 'Not Started';
                t.Priority = 'Normal';
                t.Description = 'Welcome to Sales Team!!! Please complete your onboarding task';
                
                tasktoinsert.add(T);
                System.debug(tasktoinsert);
            }
        }
        
        If(!tasktoinsert.isEmpty())
        {
            insert tasktoinsert;
        }
        
    }
        

}