public class importXml {
    public Blob myfile{get;set;}
    public importXml(){
        reports = new List<leaddata>(); 
    }
    public List<leaddata> reports {get;set;}
    public class leaddata {
        public String FirstName {get; set;}
        public String LastName {get; set;}
        public String Phone {get; set;}
        public String Email {get; set;}
    }
 
    private void parseReports(DOM.XMLNode node) {
        for (Dom.XMLNode child : node.getChildElements()) {
            if (child.getName() == 'record') {
                System.debug('child'+child);
                parseReport(child);
                //  reports.add(r);
            }
            System.debug('reports'+reports);
        }
    }
    
    private void parseReport(DOM.XMLNode node ) {
        leaddata r = new leaddata();
        
        for (Dom.XMLNode child : node.getChildElements()) {
            if (child.getName() == 'FirstName') {
                r.FirstName= child.getText().trim();
            } else if (child.getName() == 'LastName') {
                r.Lastname= child.getText().trim();
            } else if (child.getName() == 'Phone') {
                r.Phone= child.getText().trim();
            }  else if (child.getName() == 'Email') {
                r.Email= child.getText().trim();
                
            }
        }
        reports.add(r);
        
    }
    
    public void doUpload() {
        
        DOM.Document doc = new DOM.Document();
        doc.load(String.valueOf(myfile.toString()));    
        parseReports(doc.getRootElement());
  
    }
}