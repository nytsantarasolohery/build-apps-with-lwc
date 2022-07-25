trigger subscribeEvent on testTosendJson__e (after insert) {
    String response;
    for (testTosendJson__e event : Trigger.new) {
        response = event.jsonTest__c;
    }
    System.debug('response: ' + response);
    SObject c2 = (SObject) Json.deserializeStrict(response , Contact.class);
    System.debug(c2);
}