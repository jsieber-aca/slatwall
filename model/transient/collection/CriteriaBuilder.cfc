/** 
This is the main entry into the criteria builder classes until the SmartCollection is completed.            
The starting point should always be instantiating the CriteriaBuilder and passing in the primary entity that
is being quaried.
 **/
component  displayname="CriteriaBuilder" hint="The criteria builder" accessors="true" 
{
	property any criteria;
	property string entityName;
	property array errors;
   
	public CriteriaBuilder function init(any entityName){
		try{
            //returns the hibernate session form the session factory.
            if (isNull(arguments.entityName)){
            	setCriteria(ormGetSessionFactory().openSession());//<--this means they are calling createCriteria manually later.
            	//throw("You must supply an string based entityName when instantiating this object.");
            }else{
            	setEntityName(arguments.entityName);
                setCriteria(ormGetSessionFactory().openSession().createCriteria(getEntityName()));
            }
        }catch(any e){
            errors[1] = e;
        }
        
        return this;
    } 
    public any function getDefaultList(){
    	Projections = new Slatwall.model.transient.collection.CriteriaBuilderProjections().init();
    	
    	//get the persistant propertyList to use as the basis of smartcollection defaults.
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
        return getCriteria().add(arguments.restrictions);
    }
    public any function addOrder(required any order){
        return getCriteria().addOrder(arguments.order);
    }
    public any function createAlias(required any str, required any str2){
        return getCriteria().createAlias(arguments.str, arguments.str2);
    }
    public any function createCriteria(required any str){
        return getCriteria().createCriteria(arguments.str);
    }
    public any function getAlias(){
        return getCriteria().getAlias();
    }
    public any function getCacheRegion(){
        return getCriteria().getCacheRegion();
    }
    public any function getComment(){
        return getCriteria().getComment();
    }
    public any function getEntityOrClassName(){
        return getCriteria().getEntityOrClassName();
    }
    public any function getFetchMode(required any str){
        return getCriteria().getFetchMode(arguments.str);
    }
    public any function getFetchSize(){
        return getCriteria().getFetchSize();
    }
    public any function getFirstResult(){
        return getCriteria().getFirstResult();
    }
    public any function getLockModes(){
        return getCriteria().getLockModes();
    }
    public any function getMaxResults(){
        return getCriteria().getMaxResults();
    }
    public any function getProjection(){
        return getCriteria().getProjection();
    }
    public any function getProjectionCriteria(){
        return getCriteria().getProjectionCriteria();
    }
    public any function getResultTransformer(){
        return getCriteria().getResultTransformer();
    }
    public any function getSession(){
        return getCriteria().getSession();
    }
    public any function getTimeout(){
        return getCriteria().getTimeout();
    }
    public any function isLookupByNaturalKey(){
        return getCriteria().isLookupByNaturalKey();
    }
    public any function isReadOnly(){
        return getCriteria().isReadOnly();
    }
    public any function isReadOnlyInitialized(){
        return getCriteria().isReadOnlyInitialized();
    }
    public any function iterateExpressionEntries(){
        return getCriteria().iterateExpressionEntries();
    }
    public any function iterateOrderings(){
        return getCriteria().iterateOrderings();
    }
    public any function iterateSubcriteria(){
        return getCriteria().iterateSubcriteria();
    }
    public any function list(){
        return getCriteria().list();
    }
    public any function scroll(){
        return getCriteria().scroll();
    }
    public any function setCacheMode(any cacheMode){
        return getCriteria().setCacheMode(arguments.cacheMode);
    }
    public any function setCacheRegion(any cacheRegion){
        return getCriteria().setCacheRegion(arguments.cacheRegion);
    }
    public any function setCacheable(any bool){
        return getCriteria().setCacheable(arguments.bool);
    }
    public any function setComment(any comment){
        return getCriteria().setComment(arguments.comment);
    }
    public any function setFetchMode(any str, any fetchMode){
        return getCriteria().setFetchMode(arguments.str, arguments.fetchMode);
    }
    public any function setFetchSize(any int){
        return getCriteria().setFetchSize(arguments.int);
    }
    public any function setFirstResult(any int){
        return getCriteria().setFirstResult(arguments.int);
    }
    public any function setFlushMode(any flushMode){
        return getCriteria().setFlushMode(arguments.flushMode);
    }
    public any function setLockMode(any lockMode){
        return getCriteria().setLockMode(arguments.lockMode);
    }
    public any function setMaxResult(any int){
        return getCriteria().setMaxResult(arguments.int);
    }
    public any function setProjection(required any projection){
        return getCriteria().setProjection(arguments.projection);
    }
    public any function setReadOnly(any bool){
        return getCriteria().setReadOnly(arguments.bool);
    }
    public any function setResultTransformer(any resultTransformer){
        return getCriteria().setResultTransformer(arguments.resultTransformer);
    }
    public any function setSession(any sessionImpl){
        return getCriteria().setSession(arguments.sessionImpl);
    }
    public any function setTimeout(any int){
        return getCriteria().setTimeout(arguments.int);
    }
    public any function _toString(){
        return getCriteria().toString();
    }
    public any function uniqueResult(){
        return getCriteria().uniqueResult();
    }
    
}