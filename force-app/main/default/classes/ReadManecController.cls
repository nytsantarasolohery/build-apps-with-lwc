public with sharing class ReadManecController {
   
    public Blob XMLBody{get;set;}
   
    public List<cls_VCode> listVcode{get;set;}
    public cls_ConfigurationReport listconfig{get;set;}
    public cls_BasicVehicle listBasicVehicule{get;set;}
    
    // Beggin class 
    class cls_ConfigurationReport {
		public boolean TestSystem;
		public String VanProgversion;	//v1-12-4-4
		public String Currencies;	//EUR
		public String CustReqCurrency;	//EUR
		public String sumPriceEquipment {get;set;}	//9.249,00     sumPriceEquipment VehicleGrossPrice OfferPrice
		public String VehicleGrossPrice {get;set;}	//42.980,00
		public String OfferPrice {get;set;}//52.229,00
		public String DiscountPercent;	//0,00
		public String ExtraDiscountPercent;	//0,00
		public String ExtraDiscount;	//0,00
		public boolean ExtraDiscountFlag;
		public String SpecialOfferPercent;	//0,00
		public boolean SpecialOfferFlag;
		public String ModeOfDrive;	//no drive name
		public String DCCID;	//M6RKH8KF
		public String EngineDescription;	//TGE 3.180 Kasten  SR 2.0  EU6  4x4 130 kW 8-Gang Automatik
		public Integer PlanningPeriod;	//0
		public Integer ProductionDate;	//0
		public Integer Regelsatznummer;	//0
		public cls_BasicVehicle BasicVehicle;
		public String NameOfConfiguration;	//TGE 3.180 4X4 SB
		// public cls_WltpConsumptionAndEmission WltpConsumptionAndEmission;
		// public cls_NefzConsumptionAndEmission NefzConsumptionAndEmission;
		public cls_Weights Weights;
		// public cls_EmissionDisclaimer EmissionDisclaimer;
		public cls_SelectedVCodes SelectedVCodes;
		public cls_Calculation Calculation;
		public String user;	//
		public Integer PriceWheels;	//0
		public Integer PriceColors;	//0
		public Integer FixPricePositions;	//0
		public Integer PriceLocalEquipment;	//0
		public String VehicleDescriptionData;	//
		// public cls_ConfigurationEndNote ConfigurationEndNote;
		public String userName;	//
		public String printDateTime;	//27.12.2021
		public String miscServices;	//
		public boolean ReportHeader;
	}
	class cls_BasicVehicle {
		public String VehicleName {get;set;}//MAN TGE Fourgon Variant VehicleType Wheelbase
		public String Variant {get;set;}	//TGE 3.180 4X4 SB
		public String VehicleType {get;set;}	//Fourgon
		public String TopSpeed;	//---
		public String PowerEngine;	//---
		public Double Wheelbase {get;set;}	//3.64
		public Integer KET;	//0
		public Integer KAT;	//0
		public String EmissionClass;	//Norme d'émission, Euro 6 AR
		public cls_Legend Legend;
		public String Model;	//TGE traction intégrale boîte auto. 8 vitesses
	}
	class cls_Legend {
		public String Icon1;	//PRINT_CHECKED
	}
	// class cls_WltpConsumptionAndEmission {
	// 	public cls_GenericListItems[] GenericListItems;
	// }
	
	// class cls_NefzConsumptionAndEmission {
	// 	public cls_GenericListItems[] GenericListItems;
	// }
	class cls_Weights {
		public cls_WeightPositions WeightPositions;
	}
	class cls_WeightPositions {
		public cls_position[] position;
	}
	class cls_position {
		public String one;	//-
		public String two;	//-
		public String three;	//-
	}
	// class cls_EmissionDisclaimer {
	// 	public cls_GenericListItems[] GenericListItems;
	// }
	class cls_SelectedVCodes {
		public String Currencies;	//EUR
		public String containsPackageHint;	//2) Les contenus des packs peuvent éventuellement être remplacés par des équipements optionnels de qualité supérieure.
		public cls_Unit[] Unit;
	}
	class cls_Unit {
		public cls_VCode[] VCode;
	}
	class cls_VCode {
		public String Name {get;set;}//630CN
		public boolean Bold;
		public String Unit;	//A
		public String Species {get;set;}	//2AGM
		public String CodeLetter;	//NO_DATA_FROM_SERVICES
		public String CodeLetterLW;	//NO_DATA_FROM_SERVICES
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
		public String Text {get;set;}//Norme d'émission, Euro 6 AR
		public String ListIcon {get;set;}//PRINT_CHECKED
	}
	class cls_Calculation {
		public String PriceBV;	//42.980,00
		public String PriceEquipment;	//9.249,00
		public String PriceVehicleGross;	//52.229,00
		public cls_Discount Discount;
		public String PriceLocalEquipment;	//0,00
		public String PricePlantEquipment;	//0,00
		public String PriceNet;	//52.229,00
		public String PriceGrossTotal;	//52.229,00
		public cls_TotalDiscount TotalDiscount;
		public String OfferPrice;	//52.229,00
		public String PriceAddtionalText;	//Tous les prix s’entendent Hors Taxe (HT)
	}
	class cls_Discount {
		public String DiscountPercent;	//0,00%
		public String CalculatedDiscountPercent;	//0,00%
		public String CalculatedDiscount;	//0,00
		public String DiscountValueIntermediate;	//52.229,00
		public String DiscountIntermediate;	//52.229,00
	}
	class cls_TotalDiscount {
		public String TotalDiscountPercent;	//0,00%
		public String TotalDiscountValue;	//0,00
	}
    // End class
    
    public void readXML(){
        // you can also use here your rest response like res.getBody()
        parseXMLResponse(XMLBody.toString());
		System.debug('tafiditra ');
    }
    
    public void parseXMLResponse(String XMLResp){
        XmlStreamReader reader = new XmlStreamReader(XMLResp); 
        listVcode = new List<cls_VCode>();

		// while(reader.hasNext()){         
        //     if (reader.getEventType() == XmlTag.START_ELEMENT && reader.getLocalName() == 'VCode') {
        //         cls_VCode vcode = new cls_VCode();
        //         while(reader.hasNext()){
        //             if(reader.getEventType() == XmlTag.START_ELEMENT && reader.getLocalName() == 'Name'){
        //                 reader.next();
        //                 vcode.Name = reader.getText();
        //             }
        //             if(reader.getEventType() == XmlTag.START_ELEMENT && reader.getLocalName() == 'Species'){
        //                 reader.next();
        //                 vcode.Species = reader.getText();
        //             }
        //             if(reader.getEventType() == XmlTag.START_ELEMENT && reader.getLocalName() == 'Text'){
        //                 reader.next();
        //                 vcode.Text = reader.getText();
        //             }
        //             if(reader.getEventType() == XmlTag.START_ELEMENT && reader.getLocalName() == 'ListIcon'){
        //                 reader.next();
        //                 vcode.ListIcon = reader.getText();
        //             }
        //             if(reader.getEventType() == XmlTag.END_ELEMENT && reader.getLocalName() == 'VCode'){
        //                 listVcode.add(vcode);
        //                 break;
        //             }
        //             reader.next();
        //         }                
        //     }
        //     reader.next();
        // }

		while(reader.hasNext()){         
            if (reader.getEventType() == XmlTag.START_ELEMENT && reader.getLocalName() == 'ConfigurationReport') {
                cls_ConfigurationReport config = new cls_ConfigurationReport();

                while(reader.hasNext()){
                    if(reader.getEventType() == XmlTag.START_ELEMENT && reader.getLocalName() == 'sumPriceEquipment'){
                        reader.next();
                        config.sumPriceEquipment = reader.getText();
                    }
                    if(reader.getEventType() == XmlTag.START_ELEMENT && reader.getLocalName() == 'VehicleGrossPrice'){
                        reader.next();
                        config.VehicleGrossPrice = reader.getText();
                    }
                    if(reader.getEventType() == XmlTag.START_ELEMENT && reader.getLocalName() == 'OfferPrice'){
                        reader.next();
                        config.OfferPrice = reader.getText();
                    }
					
					// extract Basic Vehicule 
                    if(reader.getEventType() == XmlTag.START_ELEMENT && reader.getLocalName() == 'BasicVehicle'){
                        cls_BasicVehicle basicVehicul = new cls_BasicVehicle();
                        while(reader.hasNext()){
                            if (reader.getEventType() == XmlTag.START_ELEMENT && reader.getLocalName() == 'VehicleName') {
                                reader.next();
                                basicVehicul.VehicleName = reader.getText();
                            }
                            if (reader.getEventType() == XmlTag.START_ELEMENT && reader.getLocalName() == 'Variant') {
                                reader.next();
                                basicVehicul.Variant = reader.getText();
                            }
                            if (reader.getEventType() == XmlTag.START_ELEMENT && reader.getLocalName() == 'VehicleType') {
                                reader.next();
                                basicVehicul.VehicleType = reader.getText();
                            }
                            if (reader.getEventType() == XmlTag.START_ELEMENT && reader.getLocalName() == 'Wheelbase') {
                                reader.next();
                                basicVehicul.Wheelbase = decimal.valueOf(reader.getText());
                            }
                            if(reader.getEventType() == XmlTag.END_ELEMENT && reader.getLocalName() == 'BasicVehicle'){
                                listBasicVehicule = basicVehicul;
                                break;
                            }
                            reader.next();
                        }
                    }

					// extract vCode 
					if (reader.getEventType() == XmlTag.START_ELEMENT && reader.getLocalName() == 'VCode') {
						cls_VCode vcode = new cls_VCode();
						while(reader.hasNext()){
							if(reader.getEventType() == XmlTag.START_ELEMENT && reader.getLocalName() == 'Name'){
								reader.next();
								vcode.Name = reader.getText();
							}
							if(reader.getEventType() == XmlTag.START_ELEMENT && reader.getLocalName() == 'Species'){
								reader.next();
								vcode.Species = reader.getText();
							}
							if(reader.getEventType() == XmlTag.START_ELEMENT && reader.getLocalName() == 'Text'){
								reader.next();
								vcode.Text = reader.getText();
							}
							if(reader.getEventType() == XmlTag.START_ELEMENT && reader.getLocalName() == 'ListIcon'){
								reader.next();
								vcode.ListIcon = reader.getText();
							}
							if(reader.getEventType() == XmlTag.END_ELEMENT && reader.getLocalName() == 'VCode'){
								listVcode.add(vcode);
								break;
							}
							reader.next();
						}                
					}
					
                    if(reader.getEventType() == XmlTag.END_ELEMENT && reader.getLocalName() == 'ConfigurationReport'){
						System.debug('Ok: ' + 'Tafiditra ato');
                        listconfig = config;
                        break;
                    }
                    reader.next();
                }
            }
            reader.next();
        }

        
      
        
    }
}
