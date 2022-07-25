public with sharing class getleadInfo {
    public static void toget() {
        HttpRequest req = new HttpRequest();
        String query='select+Id,Name+from+Account';
        req.setEndpoint('callout:manTma/services/data/v53.0?q='+query);
        req.setMethod('GET');
        Http http = new Http();
        HTTPResponse resp = http.send(req);
        system.debug('Body:'+resp.getBody());   
    }
}