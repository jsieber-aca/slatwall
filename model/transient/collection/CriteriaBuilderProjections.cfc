/** wraps the projections hibernate class with helper methods to make it easier to deal will collections
    more specifically, projections allow you to define columns that you want fetched in the query       */
component  output="true" accessors="true" displayname="CriteriaBuilderProjections" hint="This is a wrapper for the hibernate criteria builder" persistent="false"  
{
	property name="errors" type="array";
	property name="projections" type="any";
	
	public CriteriaBuilderProjections function init(){
		//Gets a list of all restrictions methods from hibernate
		try{
		  projections = createObject("java", "org.hibernate.criterion.Projections");
		}catch(any e){
			errors[1] = e;
		}
		return this;
	}
    public any function alias(any projection, any str){
    	return projections.alias(attributes.projection, attributes.str);
    }
    public any function avg(any str){
        return projections.avg(attributes.str);
    }
    public any function count(any str){
        return projections.count(attributes.str);
    }
    public any function countDistinct(any str){
        return projections.countDistinct(attributes.str);
    }
    public any function distinct(any projection){
        return projections.distinct(attributes.projection);
    }
    public any function groupProperty(any str){
        return projections.groupProperty(attributes.str);
    }
    public any function id(){
        return projections.id();
    }
    public any function max(any str){
        return projections.max(arguments.str);
    }
    public any function projectionList(){
        return projections.projectionList();
    }
    public any function property(any property){
        return projections.property(arguments.property);
    }
    public any function rowCount(){
        return projections.rowCount();
    }
    public any function sqlGroupProjection(any str, any str2, any strArray, any typeArray){
        return projections.sqlGroupProjection(arguments.str, arguments,str2, arguments.strArray, arguments.typeArray);
    }
    public any function sum(any str){
        return projections.sum(arguments.str);
    }
}

