/** wraps the projections hibernate class with helper methods to make it easier to deal will collections
    more specifically, projections allow you to define columns that you want fetched in the query       */
component  output="true" accessors="true" displayname="CriteriaBuilderProjections" hint="This is a wrapper for the hibernate criteria builder" persistent="false"  
{
	property array errors;
	property any projections;
	
	public CriteriaBuilderProjections function init(){
		setProjections(createObject("java", "org.hibernate.criterion.Projections"));
		return this;
	}
    public any function alias(any projection, any str){
    	return getProjections().alias(attributes.projection, attributes.str);
    }
    public any function avg(any str){
        return getProjections().avg(attributes.str);
    }
    public any function count(any str){
        return getProjections().count(attributes.str);
    }
    public any function countDistinct(any str){
        return getProjections().countDistinct(attributes.str);
    }
    public any function distinct(any projection){
        return getProjections().distinct(attributes.projection);
    }
    public any function groupProperty(any str){
        return getProjections().groupProperty(attributes.str);
    }
    public any function id(){
        return getProjections().id();
    }
    public any function max(any str){
        return getProjections().max(arguments.str);
    }
    public any function projectionList(){
        return getProjections().projectionList();
    }
    public any function property(any property){
        return getProjections().property(arguments.property);
    }
    public any function rowCount(){
        return getProjections().rowCount();
    }
    public any function sqlGroupProjection(any str, any str2, any strArray, any typeArray){
        return getProjections().sqlGroupProjection(arguments.str, arguments,str2, arguments.strArray, arguments.typeArray);
    }
    public any function sum(any str){
        return getProjections().sum(arguments.str);
    }
}

