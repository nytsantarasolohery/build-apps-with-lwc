public class SendAccount {

    //Use your Client Id
    String clientId ='';

    //Use your Client Secret
    String clientsecret='';
    
    //Your Destination org username
    String username='';
    
    //Your Destination orgPassword+Security Token
    String password='';
    
    String accesstoken_url='https://login.salesforce.com/services/oauth2/token';
    
    String authurl='https://login.salesforce.com/services/oauth2/authorize';
    
    public class deserializeResponse {
    
        public String id;
        
        public String access_token;
    
    }
    
    public String ReturnAccessToken(SendAccount Acc){
    
        String reqbody = 'grant_type=password&client_id='+clientId+'&client_secret='
        +clientSecret+'&username='+username+'&password='+password;
        
        Http h= new Http();
        
        HttpRequest req= new HttpRequest();
        
        req.setBody(reqbody);
        
        req.setMethod('POST');
        
        req.setEndpoint('https://ap4.salesforce.com/services/oauth2/token');
        
        HttpResponse res=h.send(req);
        
        System.debug(res.getBody()+'By-AP-1986-Response');
        
        deserializeResponse resp1=
        (deserializeResponse)JSON.deserialize(res.getBody(),deserializeResponse.class);
        
        System.debug(resp1+'By-AP-deserializeresponse');
        
        return resp1.access_token;
    
    }
    
    @future(callout=true)
    
        public static void createAccount(String Accname, String Phone, String Website){
        
        SendAccount acc1= new SendAccount();
        
        String accessToken=acc1.ReturnAccessToken(acc1);
        
        System.debug(accessToken+'###AP');
        
        if(accessToken!=null){
        
        //Change “ap4” in url to your Destination Org
        String endPoint='https://ap4.salesforce.com/services/data/v32.0/sobjects/Account';
        
        String jsonstr='{"Name":"+ Accname +","Phone":""+ Phone +","Website":""+ Website +"}';
        
        Http h2= new Http();
        
        HttpRequest newreq= new HttpRequest();
        
        newreq.setHeader('Authorization','Bearer '+ accessToken);
        
        newreq.setHeader('Content-Type','application/json');
        
        newreq.setHeader('accept','application/json');
        
        newreq.setBody(jsonstr);
        
        newreq.setMethod('POST');
        
        newreq.setEndpoint(endPoint);
        
        HttpResponse res2=h2.send(newreq);
        
        System.debug(newreq+'###Akash###');
        
        deserializeResponse deresp=(deserializeResponse)System.JSON.deserialize(newreq.getBody(),deserializeResponse.class);
        
        System.debug('### Deserialized Response ###’+deresp');
    
    }
    
    }
    
}
