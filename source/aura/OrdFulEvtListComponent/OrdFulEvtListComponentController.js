({
	doInit : function(component, event, helper) {
		helper.getHistory(component);
	},
    
    onRefresh : function(component, event, helper) {
        component.set('v.historialFulfillmentRecords', []);
        helper.getHistory(component);
    }, 
    
    
})