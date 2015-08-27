/** wraps the projections hibernate class with helper methods to make it easier to deal will collections
    more specifically, projections allow you to define columns that you want fetched in the query       */
component  output="true" accessors="true" displayname="CriteriaBuilderProjections" hint="This is a wrapper for the hibernate criteria builder" persistent="false"  
{
	property array errors;
	property any Projections;
	
	public CriteriaBuilderProjections function init(){
		Projections = createObject("java", "org.hibernate.criterion.Projections");
		return this;
	}
    public any function alias(any projection, any str){
    	return Projections.alias(attributes.projection, attributes.str);
    }
    public any function avg(any str){
        return Projections.avg(attributes.str);
    }
    public any function count(any str){
        return Projections.count(attributes.str);
    }
    public any function countDistinct(any str){
        return Projections.countDistinct(attributes.str);
    }
    public any function distinct(any projection){
        return Projections.distinct(attributes.projection);
    }
    public any function groupProperty(any str){
        return Projections.groupProperty(attributes.str);
    }
    public any function id(){
        return Projections.id();
    }
    public any function max(any str){
        return Projections.max(arguments.str);
    }
    public any function projectionList(){
        return Projections.projectionList();
    }
    public any function property(any property){
        return Projections.property(arguments.property);
    }
    public any function rowCount(){
        return Projections.rowCount();
    }
    public any function sqlGroupProjection(any str, any str2, any strArray, any typeArray){
        return Projections.sqlGroupProjection(arguments.str, arguments,str2, arguments.strArray, arguments.typeArray);
    }
    public any function sum(any str){
        return Projections.sum(arguments.str);
    }
}

