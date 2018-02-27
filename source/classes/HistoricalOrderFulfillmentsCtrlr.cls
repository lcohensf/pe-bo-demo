public class HistoricalOrderFulfillmentsCtrlr {
    @AuraEnabled
    public static List<Order_Fulfillment_BO__b> getHistoricalFulfillmentsForOrder(String orderID) {
        List<Order_Fulfillment_BO__b> hist = [SELECT SourceSystem__c, TransactionID__c, TransactionType__c, TransactionTimestamp__c, Description__c
                                           FROM Order_Fulfillment_BO__b where Order__c=:orderID Order By  Order__c ASC, TransactionType__c ASC, TransactionTimestamp__c DESC  LIMIT 50];
              
        return hist;
    }
}