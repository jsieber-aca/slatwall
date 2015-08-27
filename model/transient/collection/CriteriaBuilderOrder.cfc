component  displayname="CriteriaBuilderOrder" hint="Allows for orders in the criteria builder query" persistent="false" output="false" accessors="true"    
{
    property any Order;
    property string propertyName;
    
    public any function init(){
    	Order = createObject("java", "org.hibernate.criterion.Order");
        return this;
    }
    
    public any function asc(required string argPropertyName){
    	Order = Order.asc(argPropertyName);
        return this;
    }
    public any function desc(required string argPropertyName){
        Order = Order.asc(argPropertyName);
        return this;
    }
    public any function ignoreCase(){
        return Order.ignoreCase();
    }
    public any function toSqlString(required any criteria, required any criteriaQuery){
        return Order.toSqlString(arguments.criteria, arguments.criteriaQuery);
    }
    public any function toString(){
        return Order.toString();
    }
    
}