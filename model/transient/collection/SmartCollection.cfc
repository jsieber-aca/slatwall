component  displayname="SmartCollection" hint="This API aims to give smartList functionality using smartList semantics" output="false" accessors="true" persistent="false" 
{
	/** Hibernate Criteria API Objects */
	property name="Criteria" type="any";
	property name="Restrictions" type="any";
	property name="Subqueries" type="any";
	property name="Projections" type="any";
	property name="Transformers" type="any";
	property name="Order" type="any";
	property name="entityName" type="any";
	 
	/** SmartCollection Helper Fields */
	property name="records" type="any";
	property name="errors" type="array";     
	
	/** sets-up the CriteriaBuilder, Restrictions, Order, Projections, Subqueries, and Transformers objects for use .*/
	public any function SmartCollection(any entityName){
		entityName = arguments.entityName;
		Criteria = new model.transient.collection.CriteriaBuilder().init(entityName);
        Restrictions = new model.transient.collection.CriteriaBuilderRestrictions().init();
        Subqueries = new model.transient.collection.CriteriaBuilderSubqueries().init();
        Projections = new model.transient.collection.CriteriaBuilderProjections().init();
        Transformers = new model.transient.collection.CriteriaBuilderTransformers().init();
        //variables.Order = new model.transient.collection.CriteriaBuilderOrder().init();
		return this;
	}
    
    /** SmartCollection API Methods BEGIN*/
    public any function addSelect (propertyIdentifier, alias){	
        
    }
    /** adds restrictions to the query */
    public any function addWhereCondition(strCondition, structParams, conditionOperator){
        
    }
    
    public any function addFilter(propertyIdentifier, value){
        
    }
    public any function setColumns(any columnsStruct){
    	for (column in columnsList){
    		Projections.projectionList()                                        
                    .add(Projections.property(column), column);
    	}
    }
    public any function setFilter(any filtersArray){
        Criteria.add(filtersArray);
    }
    public any function removeFilters(propertyIdentifier, whereGroup){
    	
    }
    public any function getFilters(propertyIdentifier, whereGroup){
    	
    }
    public any function addLikeFilter(propertyIdentifier, value, whereGroup){
    	
    }
    
    public any function removeLikeFilter(propertyIdentifier, whereGroup){
    	
    }
    public any function getLikeFilters(propertyIdentifier, whereGroup){
    	
    }
    public any function addInFilter(propertyIdentifier, value, whereGroup){
    	
    }
    public any function removeInFilter(propertyIdentifier, whereGroup){
    	
    }
    public any function getInFilters(propertyIdentifier, whereGroup){
    	
    }
    public any function addRange(propertyIdentifier, value, where group){
    	
    }
    public any function removeRange(propertyIdentifier, where group){
    	
    }
    public any function getRanges(propertyIdentifier, where group){
    	
    }
    public any function addOrder(orderStatement, position){
    	
    }
    public any function addKeywordProperty(propertyIdentifier, weight){
    	
    }
    public any function addHQLParam(paramName, paramValue){
    	
    }
    public any function getHqlParams(){
    	
    }
    public any function getHqlSelect(countOnlyBool){
    	
    }
    public any function getHqlFrom(supressFromBool, allowFetchBool){
    	
    }
    public any function getHQLWhere(boolean suppressWhere=false, searchOrder=false){
    	
    }
    public any function getHQLOrder(boolean supressOrderBy=false){
    	
    }
    public any function getHql(){
    	
    }
    public any function getRecords(any boolean refresh=1){
    	records = variables.Criteria.list();
    	return records;
    }
    public any function getRecordsCount(){
        return arrayLen(records);
    }
    public any function getPageRecords(bool refresh){
    	
    }
    public any function clearRecordsCount(){
    	
    }
    public any function getPageRecordsStart(){
    	
    }
    public any function getPageRecordsEnd(){
    	
    }
    public any function getCurrentPage(){
    	
    }
    public any function getTotalPages(){
    	
    }
    public any function buildUrl(queryAddition, appendValues, toggleKeys, currentUrl){
    	
    }
    public any function isFilterApplied(filter, value){
    	
    }
    public any function isLikeFilterApplied(filter, value){
    	
    }
    public any function isRangeApplied(range, value){
    	
    }
    public any function getFilterOptions(valuePropIden, namePropIden){
    	
    }
    public any function getRangeMinMax(propertyIdentifiers){
    	
    }
    public any function loadSavedState(){
    	
    }
    public any function getSavedStateID(){
    	
    }
    public any function getCacheName(){
    	
    }
	/** SmartCollection API Methods END */
	
	
}