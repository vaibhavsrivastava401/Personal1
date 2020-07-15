({
    getAccount : function(component, event, helper) {
        var action = component.get("c.getAccountByName");
        var accntName = component.get("v.accName");
        action.setParams({accName : accntName});
        action.setCallback(this, function(response){
        var state = response.getState();
        if (state === 'SUCCESS'){            
            var stringItems = response.getReturnValue();
            component.set("v.accList" , stringItems);
            }
            else{
                alert("Some Error Occured");
            }
        });
        $A.enqueueAction(action);


    }
})