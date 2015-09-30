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
    
	public DetachedCriteria function init(any entityName, any alias){
		         
        setEntityName(arguments.entityName);
        DetachedCriteria = createObject("java", "org.hibernate.criterion.DetachedCriteria").forEntityName( arguments.entityName, arguments.alias );
		
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
    
    public any function getNativeObject(){
    	return DetachedCriteria;
    }
    public any function add(any criterion){
    	DetachedCriteria = DetachedCriteria.add(arguments.criterion);
        return this;
    }
    public any function addOrder(required any order){
        return DetachedCriteria.addOrder(arguments.order);;
    }
    public any function createAlias(required any str, required any str2){
    	DetachedCriteria.createAlias(arguments.str, arguments.str2);
        return this;
    }
    public any function createCriteria(required any str){
        DetachedCriteria.createCriteria(arguments.str);
        return this;
    }
    public any function forClass(required any str){
        DetachedCriteria.forClass(arguments.str);
        return this;
    }
    public any function forEntityName(required any str){
        DetachedCriteria.forEntityName(arguments.str);
        return this;
    }
    public any function forEntityNameWithAlias(required any str, required any alias){
        DetachedCriteria.forEntityName(arguments.str, arguments.alias);
        return this;
    }
    public any function getAlias(){
        DetachedCriteria.getAlias();
        return this;
    }
    public any function getExecutableCriteria(any session){
    	DetachedCriteria.getExecutableCriteria(arguments.session);
    	return this;
    }
    public any function setComment(any comment){
        DetachedCriteria.setComment(arguments.comment);
        return this;
    }
    public any function setFetchMode(any str, any fetchMode){
        DetachedCriteria.setFetchMode(arguments.str, arguments.fetchMode);
        return this;
    }
    public any function setLockMode(any str, any lockMode){
        DetachedCriteria.setLockMode(arguments.str, arguments.lockMode);
        return this;
    }
    public any function setProjection(required any projection){
    	DetachedCriteria = DetachedCriteria.setProjection(arguments.projection);
        return this;
    }
    public any function setResultTransformer(any resultTransformer){
    	DetachedCriteria.setResultTransformer(arguments.resultTransformer);
        return this;
    }
    public any function _toString(){
        return DetachedCriteria.toString();
    }
    
    
}