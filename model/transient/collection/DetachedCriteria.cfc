/** 
This is the main entry into the criteria builder classes until the SmartCollection is completed.            
The starting point should always be instantiating the CriteriaBuilder and passing in the primary entity that
is being quaried.
 **/
component  displayname="DetachedCriteria" hint="The criteria builder detached class is for building nested queries" accessors="true" 
{
	property any DetachedCriteria;
	property string entityName;
	property array errors;
    
	public DetachedCriteria function init(any entityName){
		         
        setEntityName(arguments.entityName);
        DetachedCriteria = ormGetSessionFactory().openSession().createCriteria(entityName);        
        
		/** set our constant fields */
		this.Alias_to_entity_map    = DetachedCriteria.ALIAS_TO_ENTITY_MAP;
        this.Distinct_root_entity   = DetachedCriteria.DISTINCT_ROOT_ENTITY;
        this.Projection             = DetachedCriteria.PROJECTION;
        this.Root_Alias             = DetachedCriteria.ROOT_ALIAS;
        this.Root_entity            = DetachedCriteria.ROOT_ENTITY;
        
        this.Full_join              = DetachedCriteria.FULL_JOIN;
        this.Inner_join             = DetachedCriteria.INNER_JOIN;
        this.Left_join              = DetachedCriteria.LEFT_JOIN;
		
        
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
    public any function getNativeObject(){
    	return DetachedCriteria;
    }
    public any function add(any criterion, any criterion2){
    	if (structKeyExists(arguments, "criterion2") && !isNull(arguments.criterion2)){
    	   DetachedCriteria = DetachedCriteria.add(arguments.criterion, arguments.criterion2);
    	}
    	else{
    	   DetachedCriteria = DetachedCriteria.add(arguments.criterion);
    	}
        return this;
    }
    public any function addOrder(required any order){
        return DetachedCriteria.addOrder(arguments.order);;
    }
    public any function count(){
    	return arrayLen(DetachedCriteria.list());
    }
    public any function createAlias(required any str, required any str2){
    	DetachedCriteria.createAlias(arguments.str, arguments.str2);
        return this;
    }
    public any function createCriteria(required any str){
        return DetachedCriteria.createCriteria(arguments.str);
    }
    public any function get(){
        return DetachedCriteria.uniqueResult();
    }
    public any function getAlias(){
        return DetachedCriteria.getAlias();
    }
    public any function getCacheRegion(){
        return DetachedCriteria.getCacheRegion();
    }
    public any function getComment(){
        return DetachedCriteria.getComment();
    }
    public any function getEntityOrClassName(){
        return DetachedCriteria.getEntityOrClassName();
    }
    public any function getFetchMode(required any str){
        return DetachedCriteria.getFetchMode(arguments.str);
    }
    public any function getFetchSize(){
        return DetachedCriteria.getFetchSize();
    }
    public any function getFirstResult(){
        return DetachedCriteria.getFirstResult();
    }
    public any function getLockModes(){
        return DetachedCriteria.getLockModes();
    }
    public any function getMaxResults(){
        return DetachedCriteria.getMaxResults();
    }
    public any function getProjection(){
        return DetachedCriteria.getProjection();
    }
    public any function getProjectionCriteria(){
        return DetachedCriteria.getProjectionCriteria();
    }
    public any function getResultTransformer(){
        return DetachedCriteria.getResultTransformer();
    }
    public any function getSession(){
        return DetachedCriteria.getSession();
    }
    public any function getTimeout(){
        return DetachedCriteria.getTimeout();
    }
    public any function isLookupByNaturalKey(){
        return DetachedCriteria.isLookupByNaturalKey();
    }
    public any function isReadOnly(){
        return DetachedCriteria.isReadOnly();
    }
    public any function isReadOnlyInitialized(){
        return DetachedCriteria.isReadOnlyInitialized();
    }
    public any function iterateExpressionEntries(){
        return DetachedCriteria.iterateExpressionEntries();
    }
    public any function iterateOrderings(){
        return DetachedCriteria.iterateOrderings();
    }
    public any function iterateSubcriteria(){
        return DetachedCriteria.iterateSubcriteria();
    }
    public any function list(){
        return DetachedCriteria.list();
    }
    public any function scroll(){
        return DetachedCriteria.scroll();
    }
    public any function setCacheMode(any cacheMode){
        return DetachedCriteria.setCacheMode(arguments.cacheMode);
    }
    public any function setCacheRegion(any cacheRegion){
        return DetachedCriteria.setCacheRegion(arguments.cacheRegion);
    }
    public any function setCacheable(any bool){
        return DetachedCriteria.setCacheable(arguments.bool);
    }
    public any function setComment(any comment){
        return DetachedCriteria.setComment(arguments.comment);
    }
    public any function setFetchMode(any str, any fetchMode){
        return DetachedCriteria.setFetchMode(arguments.str, arguments.fetchMode);
    }
    public any function setFetchSize(any int){
        return DetachedCriteria.setFetchSize(arguments.int);
    }
    public any function setFirstResult(any argInteger){
    	DetachedCriteria = DetachedCriteria.setFirstResult(javacast("int", argInteger));
        return this;
    }
    public any function setFlushMode(any flushMode){
        return DetachedCriteria.setFlushMode(arguments.flushMode);
    }
    public any function setLockMode(any lockMode){
        return DetachedCriteria.setLockMode(arguments.lockMode);
    }
    public any function setMaxResults(any argInteger){
    	DetachedCriteria = DetachedCriteria.setMaxResults(javacast("int", argInteger));
        return this;
    }
    public any function setProjection(required any projection){
    	DetachedCriteria = DetachedCriteria.setProjection(arguments.projection);
        return this;
    }
    public any function setReadOnly(any bool){
    	DetachedCriteria.setReadOnly(arguments.bool);
        return this;
    }
    public any function setResultTransformer(any resultTransformer){
    	DetachedCriteria.setResultTransformer(arguments.resultTransformer);
        return this;
    }
    public any function setSession(any sessionImpl){
        return DetachedCriteria.setSession(arguments.sessionImpl);
    }
    public any function setTimeout(any int){
    	DetachedCriteria.setTimeout(arguments.int);
        return this;
    }
    public any function _toString(){
        return DetachedCriteria.toString();
    }
    public any function uniqueResult(){
        return DetachedCriteria.uniqueResult();
    }
    
}