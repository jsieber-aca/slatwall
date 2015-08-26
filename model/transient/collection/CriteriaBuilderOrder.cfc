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
    	variables.order = createObject("java", "org.hibernate.criterion.Order").init(attributes.str, true);
        return variables.order;
    }
    public CriteriaBuilderOrder function desc(required any str){
        variables.order = createObject("java", "org.hibernate.criterion.Order").init(attributes.str, false);
        return variables.order;
    }
    public any function ignoreCase(){
        return variables.order.ignoreCase();
    }
    public any function toSqlString(required any criteria, required any criteriaQuery){
        return variables.order.toSqlString(arguments.criteria, arguments.criteriaQuery);
    }
    public any function toString(){
        return variables.order.toString();
    }
    
}