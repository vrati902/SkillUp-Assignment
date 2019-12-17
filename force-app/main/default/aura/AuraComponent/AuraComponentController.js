({
	saveContactRecord : function(component, event, helper) {
        var conObj = component.get("v.objContact");
           //set the default accountId is null 
           conObj.AccountId = null ; 
       // check if selectedLookupRecord is not equal to undefined then set the accountId from 
       // selected Lookup Object to Contact Object before passing this to Server side method
        if(component.get("v.selectedLookUpRecord").Id != undefined){
          conObj.AccountId = component.get("v.selectedLookUpRecord").Id;
        } 
        
       //call apex class method
      var action = component.get('c.saveContact');
        action.setParams({
            'con': conObj
        })
      action.setCallback(this, function(response) {
        //store state of response
        var state = response.getState();
        if (state === "SUCCESS") {
         alert('Record Created');
        }
      });
      $A.enqueueAction(action);
        
       
	}
})