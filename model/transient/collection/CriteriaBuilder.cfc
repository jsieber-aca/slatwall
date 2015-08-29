/** 
This is the main entry into the criteria builder classes until the SmartCollection is completed.            
The starting point should always be instantiating the CriteriaBuilder and passing in the primary entity that
is being quaried.
 **/
component  displayname="CriteriaBuilder" hint="The criteria builder" accessors="true" 
{
	property any Criteria;
	property string entityName;
	property array errors;
    
	public CriteriaBuilder function init(any entityName){
		         
        setEntityName(arguments.entityName);
        Criteria = ormGetSessionFactory().openSession().createCriteria(entityName);        
        
		/** set our constant fields */
		this.Alias_to_entity_map    = Criteria.ALIAS_TO_ENTITY_MAP;
        this.Distinct_root_entity   = Criteria.DISTINCT_ROOT_ENTITY;
        this.Projection             = Criteria.PROJECTION;
        this.Root_Alias             = Criteria.ROOT_ALIAS;
        this.Root_entity            = Criteria.ROOT_ENTITY;
        
        this.Full_join              = Criteria.FULL_JOIN;
        this.Inner_join             = Criteria.INNER_JOIN;
        this.Left_join              = Criteria.LEFT_JOIN;
		
        
        return this;
    } 
    public any function getDefaultList(){
    	Projections = new Slatwall.model.transient.collection.CriteriaBuilderProjections().init();
    	
    	//get the persistant propertyList to use as the basis for default selects.
    	var meta = getComponentMetaData("Slatwall.model.entity." & entityName.replace("Slatwall", ""));
    	var propertyList = "";
    	for (var p in meta.properties){
    		
    		if (!isNull(p.name) && !(structKeyExists(p, "persistent") && p.persistent == false) && !((structKeyExists(p, "fieldType") && p.fieldType == "one-to-many") || structKeyExists(p, "fieldType") && p.fieldType == "many-to-many")){
    			propertyList &= "," & p.name;
    		}
    	}
        return "";
    }
    public any function add(required any restrictions){
    	criteria = criteria.add(arguments.restrictions);
        return this;
    }
    public any function addOrder(required any order){
        return Criteria.addOrder(arguments.order);;
    }
    public any function count(){
    	return arrayLen(criteria.list());
    }
    public any function createAlias(required any str, required any str2){
    	criteria.createAlias(arguments.str, arguments.str2);
        return this;
    }
    public any function createCriteria(required any str){
    	//criteria = criteria.createCriteria(arguments.str);
        return criteria.createCriteria(arguments.str);
    }
    public any function get(){
        return criteria.uniqueResult();
    }
    public any function getAlias(){
        return criteria.getAlias();
    }
    public any function getCacheRegion(){
        return criteria.getCacheRegion();
    }
    public any function getComment(){
        return criteria.getComment();
    }
    public any function getEntityOrClassName(){
        return criteria.getEntityOrClassName();
    }
    public any function getFetchMode(required any str){
        return criteria.getFetchMode(arguments.str);
    }
    public any function getFetchSize(){
        return criteria.getFetchSize();
    }
    public any function getFirstResult(){
        return criteria.getFirstResult();
    }
    public any function getLockModes(){
        return criteria.getLockModes();
    }
    public any function getMaxResults(){
        return criteria.getMaxResults();
    }
    public any function getProjection(){
        return criteria.getProjection();
    }
    public any function getProjectionCriteria(){
        return criteria.getProjectionCriteria();
    }
    public any function getResultTransformer(){
        return criteria.getResultTransformer();
    }
    public any function getSession(){
        return criteria.getSession();
    }
    public any function getTimeout(){
        return criteria.getTimeout();
    }
    public any function isLookupByNaturalKey(){
        return criteria.isLookupByNaturalKey();
    }
    public any function isReadOnly(){
        return criteria.isReadOnly();
    }
    public any function isReadOnlyInitialized(){
        return criteria.isReadOnlyInitialized();
    }
    public any function iterateExpressionEntries(){
        return criteria.iterateExpressionEntries();
    }
    public any function iterateOrderings(){
        return criteria.iterateOrderings();
    }
    public any function iterateSubcriteria(){
        return criteria.iterateSubcriteria();
    }
    public any function list(){
        return criteria.list();
    }
    public any function scroll(){
        return criteria.scroll();
    }
    public any function setCacheMode(any cacheMode){
        return criteria.setCacheMode(arguments.cacheMode);
    }
    public any function setCacheRegion(any cacheRegion){
        return criteria.setCacheRegion(arguments.cacheRegion);
    }
    public any function setCacheable(any bool){
        return criteria.setCacheable(arguments.bool);
    }
    public any function setComment(any comment){
        return criteria.setComment(arguments.comment);
    }
    public any function setFetchMode(any str, any fetchMode){
        return criteria.setFetchMode(arguments.str, arguments.fetchMode);
    }
    public any function setFetchSize(any int){
        return criteria.setFetchSize(arguments.int);
    }
    public any function setFirstResult(any argInteger){
    	criteria = criteria.setFirstResult(javacast("int", argInteger));
        return this;
    }
    public any function setFlushMode(any flushMode){
        return criteria.setFlushMode(arguments.flushMode);
    }
    public any function setLockMode(any lockMode){
        return criteria.setLockMode(arguments.lockMode);
    }
    public any function setMaxResults(any argInteger){
    	criteria = criteria.setMaxResults(javacast("int", argInteger));
        return this;
    }
    public any function setProjection(required any projection){
    	criteria = criteria.setProjection(arguments.projection);
        return this;
    }
    public any function setReadOnly(any bool){
    	criteria.setReadOnly(arguments.bool);
        return this;
    }
    public any function setResultTransformer(any resultTransformer){
    	criteria.setResultTransformer(arguments.resultTransformer);
        return this;
    }
    public any function setSession(any sessionImpl){
        return criteria.setSession(arguments.sessionImpl);
    }
    public any function setTimeout(any int){
    	criteria.setTimeout(arguments.int);
        return this;
    }
    public any function _toString(){
        return criteria.toString();
    }
    public any function uniqueResult(){
        return criteria.uniqueResult();
    }
    
}