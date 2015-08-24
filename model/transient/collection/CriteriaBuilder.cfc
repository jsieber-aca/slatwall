component  displayname="CriteriaBuilder" hint="The criteria builder" accessors="true" 
{
	property name="criteria" type="any";
	    
	public CriteriaBuilder function init(required any entityName){
        //returns the hibernate session form the session factory.
        if (isNull(arguments.entityName)){
        	throw("You must supply an string based entityName when instantiating this object.");
        }
        try{
          criteria = ormGetSessionFactory().openSession().createCriteria(arguments.entityName);
        }catch(any e){
            errors[1] = e;
        }
        return this;
    }
    public any function add(required any restrictions){
        return criteria.add(arguments.restrictions);
    }
    public any function addOrder(required any order){
        return criteria.addOrder(arguments.order);
    }
    public any function createAlias(required any str, required any str2){
        return criteria.createAlias(arguments.str, arguments.str2);
    }
    public any function createCriteria(required any str){
        return criteria.createCriteria(arguments.str);
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
    public any function setFirstResult(any int){
        return criteria.setFirstResult(arguments.int);
    }
    public any function setFlushMode(any flushMode){
        return criteria.setFlushMode(arguments.flushMode);
    }
    public any function setLockMode(any lockMode){
        return criteria.setLockMode(arguments.lockMode);
    }
    public any function setMaxResult(any int){
        return criteria.setMaxResult(arguments.int);
    }
    public any function setProjection(required any projection){
        return criteria.setProjection(arguments.projection);
    }
    public any function setReadOnly(any bool){
        return criteria.setReadOnly(arguments.bool);
    }
    public any function setResultTransformer(any resultTransformer){
        return criteria.setResultTransformer(arguments.resultTransformer);
    }
    public any function setSession(any sessionImpl){
        return criteria.setSession(arguments.sessionImpl);
    }
    public any function setTimeout(any int){
        return criteria.setTimeout(arguments.int);
    }
    public any function _toString(){
        return criteria.toString();
    }
    public any function uniqueResult(){
        return criteria.uniqueResult();
    }
    
}