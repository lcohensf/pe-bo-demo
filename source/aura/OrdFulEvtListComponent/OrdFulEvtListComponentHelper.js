({
	getHistory : function(cmp) {
		var action = cmp.get("c.getHistoricalFulfillmentsForOrder");
        action.setParams({"orderID": cmp.get("v.recordId")});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (cmp.isValid() && state === "SUCCESS") {
                cmp.set("v.historialFulfillmentRecords", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	}
})