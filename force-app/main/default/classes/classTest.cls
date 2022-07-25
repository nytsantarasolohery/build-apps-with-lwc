public with sharing class classTest {
    
    public Blob myfile {get;set;}
    public fromJSON reports {get;set;}

    public classTest() {
        reports = new fromJSON(); // reports
    }

   
    public class fromJSON{
        public cls_code code{get;set;}
        // public cls_error error {get;set;}
    }
	
	class cls_code {
		public String code {get;set;}	//EXIKBIQ9
		public String insertTimestamp {get;set;}	//2021-10-20T07:10:18.264Z
		public String updateTimestamp {get;set;}	//2021-10-20T07:10:18.264Z
		public String manCodeObjectVersion {get;set;}	//2.6
		public cls_configuration configuration {get;set;} // Recorde
		// public cls_tokens[] tokens {get;set;}
	}

	class cls_configuration {
		public cls_factoryVCodes[] factoryVCodes {get;set;}
		public cls_nationalVCodes[] nationalVCodes {get;set;}
		// public cls_extraEquipments[] extraEquipments {get;set;}
		public cls_nationalExtraEquipments[] nationalExtraEquipments {get;set;}
		public boolean specialRequest {get;set;}
		public cls_locks[] locks {get;set;}
		public cls_paintInformation[] paintInformation {get;set;}
		public String slr {get;set;}	//2022-07-31
		public String configurationTimestamp {get;set;}	//2021-10-20T07:10:18.128Z
		public String dataVersion {get;set;}	//2445599
		public String avisSOC {get;set;}	//20210830
		public cls_loadedFromWebConfigurator loadedFromWebConfigurator {get;set;}
		public String locale {get;set;}	//fr
		public String orderCountry {get;set;}	//FR
		public Integer grossListPrice {get;set;}	//237061
		public cls_technicalData technicalData {get;set;}
		public cls_c4sInternal c4sInternal {get;set;}
		// public cls_vehicleDescription vehicleDescription {get;set;}
		// public cls_rucksack[] rucksack {get;set;}
		// public cls_addOnCodes[] addOnCodes {get;set;}
		// public cls_optionalCodes[] optionalCodes {get;set;}
	}

	class cls_factoryVCodes {
		public String code {get;set;}	//0P4NC
		public Integer grossListPrice {get;set;}	//0
		public boolean driveTrainRecommendation {get;set;}
		public boolean ineffectivForSales {get;set;}
		// public cls_groupingOfCodes groupingOfCodes {get;set;}
		public String referenceRuleId {get;set;}	//
		public boolean hideCode {get;set;}
		public boolean withoutCode {get;set;}
		public boolean noDisplayOfAbsolutPrice {get;set;}
		public boolean topOption {get;set;}
		public String gattungID {get;set;}	//0KMK
		// public cls_printingOptions[] printingOptions {get;set;}
		// public cls_pictureIndex pictureIndex {get;set;}
	}

	// class cls_groupingOfCodes {
	// }

	// class cls_printingOptions {
	// }

	// class cls_pictureIndex {
	// }

	class cls_nationalVCodes {
		public String code {get;set;}	//FR337
		public Integer grossListPrice {get;set;}	//0
		public boolean commissionRelevant {get;set;}
		public String condition {get;set;}	//E
		// public cls_classification classification {get;set;}
		public boolean orderRelevant {get;set;}
		public String gattungID {get;set;}	//
		public String assignment {get;set;}	//465220fa-ed21-53f7-ecb8-8f1c787f8310
		public String currencies {get;set;}	//EUR
		// public cls_printingOptions printingOptions {get;set;}
		public boolean noCode {get;set;}
	}

	// class cls_classification {
	// }

	// class cls_extraEquipments {
	// }

	class cls_nationalExtraEquipments {
		public String code {get;set;}	//ZLA01
		public String message {get;set;}	//TRAVERSE + CROCHET MG
		public String currencies {get;set;}	//EUR
		public Integer grossPrice {get;set;}	//2500
		// public cls_printingOptions printingOptions {get;set;}
	}

	class cls_locks {
		public String code {get;set;}	//0P1YE
		public String state {get;set;}	//CLOSED
	}

	class cls_paintInformation {
		public String colour {get;set;}	//9011
		public String paintZone {get;set;}	//01
		public String quality {get;set;}	//W
	}

	class cls_loadedFromWebConfigurator {
	}

	class cls_technicalData {
		public cls_keyValuePairs[] keyValuePairs {get;set;}
	}

	class cls_keyValuePairs {
		public String key {get;set;}	//nationalExtraEquipmentCounterZMR
		public String value {get;set;}	//0
	}

	class cls_c4sInternal {
		public cls_keyValuePairs[] keyValuePairs {get;set;}
	}

	// class cls_vehicleDescription {
	// }

	// class cls_rucksack {
	// }

	// class cls_addOnCodes {
	// }

	// class cls_optionalCodes {
	// }

	// class cls_tokens {
	// }

	// class cls_error {
	// }
    
    public void doUpload() {
        System.debug('myfile'+myfile.toString());
        //This will deserialize the JSON
        reports = (fromJSON) System.JSON.deserialize(myfile.toString(), fromJSON.class);
		
		System.debug('test: ' + Reports.code.configuration.factoryVCodes);
    }
}