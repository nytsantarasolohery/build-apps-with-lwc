public with sharing class deserialiseAccount {
    public static void getaccount (){
        Contact con = [SELECT Id, Name, Phone, Email, AccountId FROM Contact WHERE Id = '0038d0000051BzWAAU'];
        String conJson = JSON.serializePretty(con);
        System.debug('Json: ' + conJson);
        SObject c2 = (SObject) Json.deserializeStrict(conJson , Contact.class);
        System.debug(c2);
    }
}