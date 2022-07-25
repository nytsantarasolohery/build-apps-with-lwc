trigger publish on Contact (after insert, after update) {
    Set<Id> conIds = new Set<Id>();
    if (trigger.isAfter) {
        for (Contact con : Trigger.new) {
            conIds.add(con.Id);
        }
    }
    if (conIds.size() > 0 ) {
        Contact con = [SELECT Id, Name, Phone, Email, AccountId FROM Contact WHERE Id = '0038d0000051BzWAAU'];
        String conJson = JSON.serializePretty(con);
        System.debug('Json: ' + conJson);
        testTosendJson__e inkEvents = new testTosendJson__e();
        inkEvents.jsonTest__c = conJson;
        EventBus.publish(inkEvents);
    }
}