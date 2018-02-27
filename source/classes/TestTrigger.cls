@isTest
public class TestTrigger {
    @isTest static void testValidEvent() {
        
        // Create a test event instance
        Order_Fulfillment_Event__e myEvt = new Order_Fulfillment_Event__e(SF_Order_ID__c='123', 
                                             Source_System__c='source', 
                                             Transaction_ID__c='id',
                                             Transaction_Type__c='type'
                                              ,Transaction_Timestamp__c=Datetime.now()
                                                                         );
        
        
      
        
        Test.startTest();
        
        // Publish test event
        Database.SaveResult sr = EventBus.publish(myEvt);
            
        Test.stopTest();
                
        // Perform validations here
        
        // Verify SaveResult value
        System.assertEquals(true, sr.isSuccess());
        

    }
    
 
}