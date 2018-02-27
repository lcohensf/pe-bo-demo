trigger OrdFulEvtTrigger on Order_Fulfillment_Event__e (after insert) {
    List<Order_Fulfillment_BO__b> ofbs = new List<Order_Fulfillment_BO__b>();
    
    for (Order_Fulfillment_Event__e event : Trigger.New) {
        Order_Fulfillment_BO__b ofb = new Order_Fulfillment_BO__b();
        ofb.Order__c  = event.SF_Order_ID__c;
        ofb.SourceSystem__c  = event.Source_System__c;
        ofb.TransactionID__c  = event.Transaction_ID__c;
        ofb.TransactionType__c  = event.Transaction_Type__c;
        ofb.TransactionTimestamp__c = event.Transaction_Timestamp__c;
        ofb.Description__c = event.Description__c;
        ofbs.add(ofb);        
    }
    
    if (ofbs.size() > 0) {
        /* cannot insert big object in context of unit test. Addressing this limitation is on the roadmap */
        if (!Test.isRunningTest()) {
            List<Database.SaveResult> saveResult = database.insertImmediate(ofbs);
            for (Database.SaveResult sr : saveResult) {
                if (!sr.isSuccess()) {
                    for(Database.Error err : sr.getErrors()) {                                     
                        System.debug('***The following error has occurred.' + err.getStatusCode() + ': ' + err.getMessage());      
                    }
                } 
            } 
        }     
        
    }
    
}