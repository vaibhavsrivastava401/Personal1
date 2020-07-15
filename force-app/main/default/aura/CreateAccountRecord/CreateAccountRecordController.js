({
    crtAccnt : function(component, event, helper) {

    var action = component.get("c.createAccount");
    var acname = component.get("v.accname");
    var acrating = component.get("v.rating");
    var acphone = component.get("v.phone");

    action.setParams({name:acname, rating:acrating, phone:acphone});
    action.setCallback(this, function(response){
        var state = response.getState();
        if(state === "SUCCESS"){
            alert("Record Created Successfully");
        }

        else{
            alert(response.getReturnValue());
        }
    });
    $A.enqueueAction(action);
    }
})
