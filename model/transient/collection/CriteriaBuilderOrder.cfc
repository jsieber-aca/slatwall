component  displayname="CriteriaBuilderOrder" hint="Allows for orders in the criteria builder query" persistent="false" output="false"  
{
    property array errors;
    property any order;
    property boolean ascending;
    property string propertyName;
    
    public any function init(){
        return this;
    }
    public CriteriaBuilderOrder function asc(required any str){
    	order = createObject("java", "org.hibernate.criterion.Order").init(attributes.str, javaCast("boolean", true));
        return order;
    }
    public CriteriaBuilderOrder function desc(required any str){
        order = createObject("java", "org.hibernate.criterion.Order").init(attributes.str, javaCast("boolean", false));
        return order;
    }
    public any function ignoreCase(){
        return order.ignoreCase();
    }
    public any function toSqlString(required any criteria, required any criteriaQuery){
        return order.toSqlString(arguments.criteria, arguments.criteriaQuery);
    }
    public any function toString(){
        return order.toString();
    }
    
}