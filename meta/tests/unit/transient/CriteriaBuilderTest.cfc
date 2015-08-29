/*

    Slatwall - An Open Source eCommerce Platform
    Copyright (C) ten24, LLC
	
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
	
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
	
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
    Linking this program statically or dynamically with other modules is
    making a combined work based on this program.  Thus, the terms and
    conditions of the GNU General Public License cover the whole
    combination.
	
    As a special exception, the copyright holders of this program give you
    permission to combine this program with independent modules and your 
    custom code, regardless of the license terms of these independent
    modules, and to copy and distribute the resulting program under terms 
    of your choice, provided that you follow these specific guidelines: 

	- You also meet the terms and conditions of the license of each 
	  independent module 
	- You must not alter the default display of the Slatwall name or logo from  
	  any part of the application 
	- Your custom code must not alter or create any files inside Slatwall, 
	  except in the following directories:
		/integrationServices/

	You may copy and distribute the modified version of this program that meets 
	the above guidelines as a combined work under the terms of GPL for this program, 
	provided that you include the source code of that other code when and as the 
	GNU GPL requires distribution of source code.
    
    If you modify this program, you may extend this exception to your version 
    of the program, but you are not obligated to do so.

Notes:

*/
component extends="mxunit.framework.TestCase" {
	
	variables.id = "";
    /** These tests all operate on the account entity */
	public void function setup(){
		
		criteria = new Slatwall.model.transient.collection.CriteriaBuilder("SlatwallAccount");
        Restrictions = new Slatwall.model.transient.collection.CriteriaBuilderRestrictions().init();     //these are aggragates
        Subqueries = new Slatwall.model.transient.collection.CriteriaBuilderSubqueries().init();         //these are subqueries executes in a different context
        Projections = new Slatwall.model.transient.collection.CriteriaBuilderProjections().init();       //these are selections
        Transformers = new Slatwall.model.transient.collection.CriteriaBuilderTransformers().init();      //these transform the result
        Order = new Slatwall.model.transient.collection.CriteriaBuilderOrder().init();                   //This is the Order by
        util = new Slatwall.model.transient.collection.CriteriaBuilderUtil();                            //helper methods
        
	}
	/**
	 *Should return an array that contains three columns in each array element.
	 */
	public void function criteriaSetColumnsTestCase(){
		
        /** only returns three specific columns from the query */
        var result = criteria.setProjection(Projections.projectionList()
        .add( Projections.property("accountID"), "accountID")
        .add( Projections.property("firstName"), "firstName")
        .add( Projections.property("lastName"), "lastName"))
        .list();
        writeDump(var=result, top=4);//<--show the results
        assertEquals(3, arrayLen(result[1]));//test the results.
        //.setFirstResult(0)
        //.setMaxResults(10)
    }
    
    /**
     *Should return an array that contains 2 elements, starting at the second 
     * (id should not match last test for first element).
     */
    public void function criteriaSetFirstResultTestCase(){
         var result = criteria.setProjection(Projections.projectionList()
        .add( Projections.property("accountID"), "accountID")
        .add( Projections.property("firstName"), "firstName")
        .add( Projections.property("lastName"), "lastName"))
        .setFirstResult(1)//<--java array indexed
        .list();
        writeDump(var=result, top=4);//<--show the results
        assertEquals(3, arrayLen(result));//test the results.
    }
    
    /**
     *Should return an array that contains max 2 elements.
     */
    public void function criteriaSetMaxResultsTestCase(){
       
        
         var result = criteria.setProjection(Projections.projectionList()
        .add( Projections.property("accountID"), "accountID")
        .add( Projections.property("firstName"), "firstName")
        .add( Projections.property("lastName"), "lastName"))
        .setMaxResults(2)
        .list();
        writeDump(var=result, top=4);//<--show the results
        assertEquals(2, arrayLen(result));//test the results.
    }
    /**
     *Should return an array of structs that uses alias as keys.
     */
    public void function criteriaTransformResultToStructTestCase(){
         var result = criteria.setProjection(Projections.projectionList()
        .add( Projections.property("accountID"), "accountID")
        .add( Projections.property("firstName"), "firstName")
        .add( Projections.property("lastName"), "lastName"));
        
        result.setResultTransformer(result.Alias_To_Entity_Map);
        //test the result
        var arrayOfStructs = result.list();
        writeDump(var=arrayOfStructs, top=4);//<--show the results
        assertTrue(isStruct(arrayOfStructs[1]));
        assertTrue(isArray(arrayOfStructs));
        assertTrue(len(arrayOfStructs[1].get('accountID')));
        writeDump("AccountID: " & arrayOfStructs[1].get('accountID'));
    }
    /**
     *Set alias on a property to retrieve many-to-one from entity.
     *This test should return 4 properties. 1 from the base entity and 
     *three from the relationship
     */
    public void function criteriaRetrieveToOnePropertiesTestCase(){
        /** Access many-to-one data (account) on the Order entity */
        order = new Slatwall.model.transient.collection.CriteriaBuilder("SlatwallOrder")
            .createAlias("account", "a")                                      
                .add(Restrictions._ne("this.orderNumber", ""))                                                                     
            .setProjection(Projections.projectionList()                  
                .add(Projections.property("orderNumber"), "orderNumber")
                .add(Projections.property("a.accountID"), "accountID"  )
                .add(Projections.property("a.firstName"), "firstName"  )
                .add(Projections.property("a.lastName") , "lastName"  ))
            .setMaxResults(10);  
        order.setResultTransformer(order.Alias_To_Entity_Map);  
        var orders = order.list();
        writeDump(var=orders);//<--show the results
        //test
        var testOrder = orders[1];
        var count = 0;
        for (field in testOrder){
        	count++;
        }
        assert(count==4);
    }
    /**
     * Tests retrieving one-to-many data from an entity. (This is specific to my orders)
     */
    public void function criteriaRetrieveToManyPropertiesTestCase(){
        /** Access one-to-many data (orderItems) on SlatwallOrders */
        order = new Slatwall.model.transient.collection.CriteriaBuilder("SlatwallOrder")
            .createAlias("orderItems", "oi")                                        
            .createAlias("account", "a") 
                .add(Restrictions._eq("orderID", "402828b24f606f92014f650a28dd0025") )          
                    .setProjection(     
                        Projections.projectionList()
                            .add(Projections.property("currencyCode"    ), "currencyCode")
                            .add(Projections.property("oi.orderItemID"  ), "orderItemID")
                            .add(Projections.property("oi.price"        ), "price")
                            .add(Projections.property("oi.skuPrice"     ), "skuPrice")
                            .add(Projections.property("oi.quantity"     ), "quantity")
                            .add(Projections.property("a.firstName"     ), "firstName"));
        order.setResultTransformer(order.Alias_To_Entity_Map);
        var orders = order.list();
        writeDump(var=orders);//<--show the results////writeDump(q.get());//gets unique result only 
        writeDump(orders.toString()); 
    }
    /**
     * Tests (case-insensitive) like%
     */
    public void function criteriaLikeTestCase(){
         var account = criteria.setProjection(Projections.projectionList()
        .add( Projections.property("accountID"), "accountID")
        .add( Projections.property("firstName"), "firstName")
        .add( Projections.property("lastName"), "lastName"))
        .add(Restrictions._ilike("this.firstName", "b%"));
        
        account.setResultTransformer(account.Alias_To_Entity_Map);
        //test the result
        var accounts = account.list();
        writeDump(var=accounts, top=4);//<--show the results
        
        //No account should have a firstName where the first char is not i
        for (field in accounts){
        	var firstName = field.get("firstName");
        	assertTrue(left(lCase(firstName), 1) == "b");
        }
        
    }
    /** Tests turning an array of or restrictions into results */
    public void function criteriaRestrictionArrayToDisjunctionTestCase(){
    	/** select skuCode and skuID from SlatwallProduct Where productCode = x or activeFlag eq 1 */
        rArray = [];
        rArray[1] = Restrictions._eq("productCode", "mag-01");
        rArray[2] = Restrictions._eq("activeFlag", util.cast(true, "boolean"));
        _orValue  = Restrictions._disjunction(rArray);
        assertEquals("(productCode=mag-01 or activeFlag=true)", _orValue);
        writeDump(_orValue.toString());
        
        product = new Slatwall.model.transient.collection.CriteriaBuilder("SlatwallProduct")
            .createAlias("skus", "sku")                                                 
            .add(_orValue)   //<--use the disjunction string we created.                                                             
            .setProjection(Projections.projectionList()                           
            .add(Projections.property("sku.skuCode"), "skuCode")
            .add(Projections.property("sku.skuID"), "skuID"));
        
        writeDump(product.list());
        
    }
    /** tests turning an array of and restrictions in results */
    public void function criteriaRestrictionArrayToConjunctionTestCase(){
        /** select skuCode and skuID from SlatwallProduct Where productCode = x or activeFlag eq 1 */
        filters = [];
        andfilters[1] = Restrictions._ne("product.productCode", "mag-01");
        andfilters[2] = Restrictions._ne("this.skuCode", "");
        _andValue     = Restrictions._conjunction(andfilters);
        assertEquals("(product.productcode<>mag-01 and this.skucode<>)", _andValue);
        writeDump(_andValue.toString());
        
        collection = new Slatwall.model.transient.collection.CriteriaBuilder("SlatwallSku")
            .createAlias("product", "product")                                               
            .add(_andValue) //<--use the and string                                                           
            .setProjection(Projections.projectionList()                           
                .add(Projections.property("skuCode"), "skuCode")
                .add(Projections.property("skuID"), "skuID")
                .add(Projections.property("product.productName"), "productName")
            );
        collection.setResultTransformer(collection.Alias_to_entity_map);
        
        writeDump(collection.list());
        
    }
    
    /** tests using nested criteria to obtain collection of collection */
    public void function criteriaRestrictionOnNestedCriteriaTestCase(){
        //do the subquery, filtering on ids
        subquery = new Slatwall.model.transient.collection.CriteriaBuilder("SlatwallSku")
            .createAlias("skus", "sku")
            .add(Restrictions._eq("sku.skuID", "8a8080834721af1a0147220714810083"))
            .setFirstResult(0)
            .setMaxResults(1) 
            .setProjection(Projections.id());
        //do the main query joining the subquery
        
        criteria = new Slatwall.model.transient.collection.CriteriaBuilder("SlatwallProduct")
            .add(Subqueries._propertyIn("id", subquery))
            .setFetchMode(criteria.Full_Join);
            
        writeDump(var=criteria.list(), top=2);       
    }
}


