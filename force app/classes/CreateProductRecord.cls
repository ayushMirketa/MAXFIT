public with sharing class CreateProductRecord {
    public static HttpResponse createRecord() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://fakestoreapi.com/products');
        req.setMethod('GET');

        Http http = new Http();
        HttpResponse res = http.send(req);

        if(res.getStatusCode() == 200){
            String response = res.getBody();

            List<Object> productList = (List<Object>)JSON.deserializeUntyped(response);

            //Lists to insert:
            List<Product2> proList = new List<Product2>();
            List<PricebookEntry> entryList = new List<PricebookEntry>();
            List<PricebookEntry> entryList2 = new List<PricebookEntry>();

             // Get the standard Pricebook
             Pricebook2 standardDB = new Pricebook2();
            if(Test.isRunningTest()){
                Id xfg = Test.getStandardPricebookId();
                standardDB.Id = xfg;
            }
            else{
                standardDB=[Select Id from Pricebook2 where IsStandard = true with SECURITY_ENFORCED];

            }

            //Pricebook2 standared DB = [select id from Pricebook2 where isStandared = true];

            Pricebook2 pb = new Pricebook2(Name = 'Ayush-pricebook',Description = 'Price Book',IsActive = true);
            
            insert pb;
            // Create a Product2 record for each product in the response

            for(Object product: productList){
                Map<String, Object> productMap = (Map<String, Object>) product;
                String title = (String) JSON.serialize(productMap.get('title'));
                title = title.substring(1, title.length() - 1);
                
                String descript = (String) JSON.serialize(productMap.get('description'));
                descript = descript.substring(1, descript.length() - 1);
                Product2 pro = new Product2(
                    ProductCode = (String) JSON.serialize(productMap.get('id')),
                    Name = title,
                    Description = descript
                );
                proList.add(pro);
            }
            insert proList;
             // Create PricebookEntry records for each product in the standard Pricebook
            for (integer i = 0; i < productList.size(); i++) {
                Object product = productList.get(i);
                Id productId = proList.get(i).Id;

                Map<String, Object> productMap = (Map<String, Object>) product;

                Decimal strToDec = decimal.valueOf(JSON.serialize(productMap.get('price')));PricebookEntry entry = new PricebookEntry(
                    Pricebook2Id = standardDB.Id,
                    Product2Id = productId,
                    UnitPrice = strToDec,
                    IsActive = true
                );
                entryList.add(entry);
            }  
			insert entryList;
             // Create PricebookEntry records for each product in the custom Pricebook
            for (integer i = 0; i < productList.size(); i++) {
                Object product = productList.get(i);
                Id productId = proList.get(i).Id;

                Map<String, Object> productMap = (Map<String, Object>) product;

                Decimal strToDec = decimal.valueOf(JSON.serialize(productMap.get('price')));
                
                PricebookEntry entry = new PricebookEntry(
                    Pricebook2Id = pb.Id,
                    Product2Id = productId,
                    UnitPrice = strToDec,
                    IsActive = true
                );
                entryList2.add(entry);
            }
            insert entryList2;
        }
        return res;

    }
}