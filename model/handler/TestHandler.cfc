component extends="Slatwall.org.Hibachi.HibachiObject" {

	public void function onApplicationRequestStart( ) {
		/** Access one-to-many data (orderItems) on SlatwallOrders */
		writeDump("Criteria Builder Test");
        Restrictions = new Slatwall.model.transient.collection.CriteriaBuilderRestrictions().init();     //these are aggragates
        Subqueries = new Slatwall.model.transient.collection.CriteriaBuilderSubqueries().init();         //these are subqueries executes in a different context
        Projections = new Slatwall.model.transient.collection.CriteriaBuilderProjections().init();       //these are selections
        Transformers = new Slatwall.model.transient.collection.CriteriaBuilderTransformers().init();      //these transform the result
        //Order = new Slatwall.model.transient.collection.CriteriaBuilderOrder().init();                   //This is the Order by
        //util = new Slatwall.model.transient.collection.CriteriaBuilderUtil();                            //helper methods
        var tickCount = getTickCount();
        order = new Slatwall.model.transient.collection.CriteriaBuilder("SlatwallOrder")
            //create an alias for each related entity
            .createAlias("promotionCodes", "pc")
                //first add restrictions on the data set
                .add(Restrictions._eq("orderID", "402881864f4dd3d9014f50c4c1060030") )
                .add(Restrictions._eq("pc.promotionCode", "promo50") ) 
                    //then add the columns         
                    .setProjection(     
                        Projections.projectionList()
                            .add(Projections.property("currencyCode"    ), "currencyCode")
                            .add(Projections.property("pc.promotionCodeID"  ), "promotionCodeID")
                            .add(Projections.property("pc.promotionCode"        ), "promotionCode")
                            .add(Projections.property("pc.startDateTime"     ), "startDate")
                            .add(Projections.property("pc.endDateTime"     ), "endDate")
                            .add(Projections.property("pc.maximumUseCount"     ), "maximumUseCount"));
        order.setResultTransformer(order.Alias_To_Entity_Map);
        writeDump(Projections.projectionList());
        writeDump(Projections);
        var orders = order.list();
        writeDump("#(getTickCount() - tickCount) * .001#");
        writeDump(var=orders);
        
        
	}
}