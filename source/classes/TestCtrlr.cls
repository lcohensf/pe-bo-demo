@isTest
public class TestCtrlr {
    @isTest static void testGetList() {
        List<Order_Fulfillment_BO__b> l = HistoricalOrderFulfillmentsCtrlr.getHistoricalFulfillmentsForOrder('none');
        /* list will be empty */
        System.assertEquals(0, l.size());
    }
}