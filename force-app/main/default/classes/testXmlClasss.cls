public class testXmlClasss {

    // Create a class Book for processing
    public class myfile {
        public boolean TestSystem;
        public String VanProgversion;      //v1-12-4-4
        public String Currency;     //EUR
        public String CustReqCurrency;     //EUR
        public String sumPriceEquipment;   //9.249,00
        public String VehicleGrossPrice;   //42.980,00
        public String OfferPrice;   //52.229,00
        public String DiscountPercent;     //0,00
        public String ExtraDiscountPercent;       //0,00
        public String ExtraDiscount;       //0,00
        public boolean ExtraDiscountFlag;
        public String SpecialOfferPercent; //0,00
        public boolean SpecialOfferFlag;
        public String ModeOfDrive;  //no drive name
        public String DCCID; //M6RKH8KF
        public String EngineDescription;   //TGE 3.180 Kasten  SR 2.0  EU6  4x4 130 kW 8-Gang Automatik
        public Integer PlanningPeriod;     //0
        public Integer ProductionDate;     //0
        public Integer Regelsatznummer;    //0
        public String NameOfConfiguration; //TGE 3.180 4X4 SB
        public String user;  //
        public Integer PriceWheels; //0
        public Integer PriceColors; //0
        public Integer FixPricePositions;  //0
        public Integer PriceLocalEquipment;       //0
        public String VehicleDescriptionData;     //
        public String userName;     //
        public String printDateTime;       //27.12.2021
        public String miscServices; //
        public boolean ReportHeader;
        public String FooterLogo;   
        // basic vehicule
        public String VehicleName;  //MAN TGE Fourgon
        public String Variant;      //TGE 3.180 4X4 SB
        public String VehicleType;  //Fourgon
        public String TopSpeed;     //---
        public String PowerEngine;  //---
        public Double Wheelbase;    //3.64
        public Integer KET;  //0
        public Integer KAT;  //0
        public String EmissionClass;       //Norme d'émission, Euro 6 AR
        public String Model; //TGE traction intégrale boîte auto. 8 vitesses
        // position
        public String one;     //-
        public String two;     //-
        public String three;     //-
        // selected vcode
        public String Currency;     //EUR
        public String containsPackageHint; //2) Les contenus des packs peuvent éventuellement être remplacés par des équipements optionnels de qualité supérieure.
        // vcode
        public String Name;  //630CN
        public boolean Bold;
        public String Unit;  //A
        public String Species;      //2AGM
        public String CodeLetter;   //NO_DATA_FROM_SERVICES
        public String CodeLetterLW; //NO_DATA_FROM_SERVICES
        public boolean IsNew;
        public boolean EPACChoosen;
        public boolean UserChoosen;
        public boolean Selected;
        public boolean Hidden;
        public boolean documentInReport;
        public boolean VCodeFix;
        public boolean SpeciesFix;
        public boolean Discountable;
        public boolean PrintPicsOptional;
        public boolean SpecialRequestCustomerKSW;
        public String Text;  //Norme d'émission, Euro 6 AR
        public String ListIcon;     //PRINT_CHECKED
        // calculation 
        public String PriceBV;      //42.980,00
        public String PriceEquipment;      //9.249,00
        public String PriceVehicleGross;   //52.229,00
        public String PriceLocalEquipment; //0,00
        public String PricePlantEquipment; //0,00
        public String PriceNet;     //52.229,00
        public String PriceGrossTotal;     //52.229,00
        public String OfferPrice;   //52.229,00
        public String PriceAddtionalText;  //Tous les prix s’entendent Hors Taxe (HT)
        // discount 
        public String DiscountPercent;     //0,00%
        public String CalculatedDiscountPercent;  //0,00%
        public String CalculatedDiscount;  //0,00
        public String DiscountValueIntermediate;  //52.229,00
        public String DiscountIntermediate;       //52.229,00
        // discoun
        public String TotalDiscountPercent;       //0,00%
        public String TotalDiscountValue;  //0,00
 
    }

    public Book[] parseMyfiles(XmlStreamReader reader) {
        List<myfile> myfile = new List<myfile>();
        boolean isSafeToGetNextXmlElement = true;
        while(isSafeToGetNextXmlElement) {
            // Start at the beginning of the book and make sure that it is a book
            if (reader.getEventType() == XmlTag.START_ELEMENT) {
                if ('Book' == reader.getLocalName()) {
                    // Pass the book to the parseBook method (below) 
                    Book book = parseBook(reader);
                    books.add(book);
                }
            }
            // Always use hasNext() before calling next() to confirm 
            // that we have not reached the end of the stream
            if (reader.hasNext()) {
                reader.next();
            } else {
                isSafeToGetNextXmlElement = false;
                break;
            }
        }
        return books;
    }

    // Parse through the XML, determine the author and the characters
    Book parsefiles(XmlStreamReader reader) {
        Book book = new Book();
        book.author = reader.getAttributeValue(null, 'author');
        boolean isSafeToGetNextXmlElement = true;
        while(isSafeToGetNextXmlElement) {
            if (reader.getEventType() == XmlTag.END_ELEMENT) {
                break;
            } else if (reader.getEventType() == XmlTag.CHARACTERS) {
                book.name = reader.getText();
            }
            // Always use hasNext() before calling next() to confirm 
            // that we have not reached the end of the stream
            if (reader.hasNext()) {
                reader.next();
            } else {
                isSafeToGetNextXmlElement = false;
                break;
            }
        }
        return book;
    }
}
