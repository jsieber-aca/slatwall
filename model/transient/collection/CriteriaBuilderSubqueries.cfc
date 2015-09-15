/** wraps the restrictions hibernate class with helper methods to make it easier to deal will collections */
component  output="true" accessors="true" displayname="CriteriaBuilderSubqueries" hint="This is a wrapper for the hibernate criteria builder subqueries" persistent="false"  
{
	property name="errors" type="array";
	
	/** constants */
	property name="FULL_JOIN" type="numeric" default="4"; 
	property name="INNER_JOIN" type="numeric" default="0";
	property name="LEFT_JOIN" type="numeric" default="1";   
	
	/** java objects */
	property name="Projection"   type="any";
	property name="Subqueries"   type="any";
	
	public CriteriaBuilderSubqueries function init(){
		//Gets a list of all restrictions methods from hibernate
		setProjection(createObject("java", "org.hibernate.criterion.Projections"));
		subqueries = createObject("java", "org.hibernate.criterion.Subqueries");
		
		return this;
	}
	
    public any function _eq(required any obj, required any detchedCriteria){
    	return subqueries.eq(arguments.obj, arguments.detchedCriteria);
    }
    public any function _eqAll(required any obj, required any detchedCriteria){
    	return subqueries.eqAll(arguments.obj, arguments.detchedCriteria);
    }
    public any function _exists(required any detchedCriteria){
    	return subqueries.exists(arguments.detchedCriteria);
    }
    public any function _ge(required any obj, required any detchedCriteria){
    	return subqueries.ge(arguments.obj, arguments.detchedCriteria);
    }
    public any function _geAll(required any obj, required any detchedCriteria){
    	return subqueries.geAll(arguments.obj, arguments.detchedCriteria);
    }
    public any function _geSome(required any obj, required any detchedCriteria){
    	return subqueries.geSome(arguments.obj, arguments.detchedCriteria);
    }
    public any function _gt(required any obj, required any detchedCriteria){
    	return subqueries.gt(arguments.obj, arguments.detchedCriteria);
    }
    public any function _gtAll(required any obj, required any detchedCriteria){
    	return subqueries.gtAll(arguments.obj, arguments.detchedCriteria);
    }
    public any function _gtSome(required any obj, required any detchedCriteria){
    	return subqueries.gtSome(arguments.obj, arguments.detchedCriteria);
    }
    public any function _in(required any obj, required any detchedCriteria){
    	return subqueries.in(arguments.obj, arguments.detchedCriteria);
    }
    public any function _le(required any obj, required any detchedCriteria){
    	return subqueries.le(arguments.obj, arguments.detchedCriteria);
    }
    public any function _leAll(required any obj, required any detchedCriteria){
    	return subqueries.leAll(arguments.obj, arguments.detchedCriteria);
    }
    public any function _leSome(required any obj, required any detchedCriteria){
    	return subqueries.leSome(arguments.obj, arguments.detchedCriteria);
    }
    public any function _lt(required any obj, required any detchedCriteria){
    	return subqueries.lt(arguments.obj, arguments.detchedCriteria);
    }
    public any function _ltAll(required any obj, required any detchedCriteria){
    	return subqueries.ltAll(arguments.obj, arguments.detchedCriteria);
    }
    public any function _ltSome(required any obj, required any detchedCriteria){
    	return subqueries.ltSome(arguments.obj, arguments.detchedCriteria);
    }
    public any function _ne(required any obj, required any detchedCriteria){
    	return subqueries.ne(arguments.obj, arguments.detchedCriteria);
    }
    public any function _notExists(required any detchedCriteria){
    	return subqueries.notExists(arguments.detchedCriteria);
    }
    public any function _notIn(required any obj, required any detchedCriteria){
    	return subqueries.notIn(arguments.obj, arguments.detchedCriteria);
    }
    public any function _propertyEq(required any str, required any detchedCriteria){
    	return subqueries.propertyEq(arguments.str, arguments.detchedCriteria);
    }
    public any function _propertyEqAll(required any str, required any detchedCriteria){
    	return subqueries.propertyEqAll(arguments.str, arguments.detchedCriteria);
    }
    public any function _propertyGe(required any str, required any detchedCriteria){
    	return subqueries.propertyGe(arguments.str, arguments.detchedCriteria);
    }
    public any function _propertyGeAll(required any str, required any detchedCriteria){
    	return subqueries.propertyGeAll(arguments.str, arguments.detchedCriteria);
    }
    public any function _propertyGeSome(required any str, required any detchedCriteria){
    	return subqueries.propertyGeSome(arguments.str, arguments.detchedCriteria);
    }
    public any function _propertyGt(required any str, required any detchedCriteria){
    	return subqueries.propertyGt(arguments.str, arguments.detchedCriteria);
    }
    public any function _propertyGtAll(required any str, required any detchedCriteria){
    	return subqueries.propertyGtAll(arguments.str, arguments.detchedCriteria);
    }
    public any function _propertyGtSome(required any str, required any detchedCriteria){
    	return subqueries.propertyGtSome(arguments.str, arguments.detchedCriteria);
    }
    public any function _propertyIn(required any str, required any detchedCriteria){
    	return subqueries.propertyIn(arguments.str, arguments.detchedCriteria);
    	//return this;
    }
    public any function _propertyLe(required any str, required any detchedCriteria){
    	return subqueries.propertyLe(arguments.str, arguments.detchedCriteria);
    }
    public any function _propertyLeAll(required any str, required any detchedCriteria){
    	return subqueries.propertyLeAll(arguments.str, arguments.detchedCriteria);
    }
    public any function _propertyLeSome(required any str, required any detchedCriteria){
    	return subqueries.propertyLeSome(arguments.str, arguments.detchedCriteria);
    }
    public any function _propertyLt(required any str, required any detchedCriteria){
    	return subqueries.propertyLt(arguments.str, arguments.detchedCriteria);
    }
    public any function _propertyLtAll(required any str, required any detchedCriteria){
    	return subqueries.propertyLtAll(arguments.str, arguments.detchedCriteria);
    }
    public any function _propertyLtSome(required any str, required any detchedCriteria){
    	return subqueries.propertyLtSome(arguments.str, arguments.detchedCriteria);
    }
    public any function _propertyNe(required any str, required any detchedCriteria){
    	return subqueries.propertyNe(arguments.str, arguments.detchedCriteria);
    }
    public any function _propertyNotIn(required any str, required any detchedCriteria){
    	return subqueries.propertyNotIn(arguments.str, arguments.detchedCriteria);
    }

}